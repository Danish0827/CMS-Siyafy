const express = require("express");
const app = express();
const pool = require("../config");
const cors = require("cors");
const bcrypt = require("bcrypt");
const authenticate = require("../lib");
const multer = require("multer");
const sendEmail = require("./nodemailer");
const fs = require("fs");
const slugify = require("slugify");
const { updateStoreName } = require("../lib/reuse");

app.use(express.json());

app.use(cors());
app.use((req, res, next) => {
  req.pool = pool;
  next();
});

app.post("/vendors/all", authenticate, async (req, res) => {
  try {
    // Ensure userId is present in the request
    if (!req.userId) {
      return res.status(401).json({ error: "Unauthorized" });
    }

    const { page = 1, pageSize = 10, search } = req.body;

    // Calculate the offset for pagination
    const offset = (page - 1) * pageSize;

    // Construct the WHERE clause for search
    let whereClause = "";
    let searchValues = [];
    if (search) {
      whereClause = `
    WHERE name ILIKE $1
    OR email ILIKE $2
    OR phone_number ILIKE $3
  `;
      searchValues = Array(3).fill(`%${search}%`);
    }

    // Query to fetch vendors with pagination and search
    const queryData = {
      text: `
    SELECT *, id as key FROM vendors_registration
    ${whereClause}
    ORDER BY id OFFSET $${search ? "4" : "1"} LIMIT $${search ? "5" : "2"}
  `,
      values: search ? [...searchValues, offset, pageSize] : [offset, pageSize],
    };

    // Query to count total number of vendors
    const queryTotal = {
      text: `
    SELECT COUNT(*) FROM vendors_registration
    ${whereClause}
  `,
      values: search ? [...searchValues] : [],
    };

    // Execute both queries concurrently using Promise.all
    const [dataResult, totalResult] = await Promise.all([
      pool.query(queryData),
      pool.query(queryTotal),
    ]);

    // Extract data and total count from query results
    const data = dataResult.rows;
    const totalCount = totalResult.rows[0].count;

    // For each vendor, run a separate query to count the number of stores
    const vendorsWithStoreCount = await Promise.all(
      data.map(async (vendor) => {
        const queryStoreCount = {
          text: `
      SELECT COUNT(*) FROM stores WHERE stores.vendor_id = $1
    `,
          values: [vendor.id],
        };
        const storeCountResult = await pool.query(queryStoreCount);
        return { ...vendor, store_count: storeCountResult.rows[0].count };
      })
    );

    // Send the result back to the client
    res.json({ data: vendorsWithStoreCount, totalCount });
    // Send the result back to the client
    // res.json({ data, totalCount });
  } catch (error) {
    console.error("Error fetching vendors:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

app.post("/vendors/delete", authenticate, async (req, res) => {
  try {
    // Ensure userId is present in the request
    if (!req.userId) {
      return res.status(401).json({ error: "Unauthorized" });
    }

    // Extract vendorIds from request body
    const { ids } = req.body;

    // Ensure vendorIds are provided
    if (!ids || !Array.isArray(ids) || ids.length === 0) {
      return res.status(400).json({ error: "Vendor IDs are required" });
    }

    // Delete vendors from the database
    const query = {
      text: "DELETE FROM vendors_registration WHERE id = ANY($1)",
      values: [ids],
    };

    await pool.query(query);

    // Send success response
    res.json({ message: "Vendors deleted successfully" });
  } catch (error) {
    console.error("Error deleting vendors:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

app.post("/vendors/add", authenticate, async (req, res) => {
  try {
    if (!req.userId) {
      return res.status(401).json({ error: "Unauthorized" });
    }

    const {
      name,
      email,
      phone_number,
      website_url,
      about_company,
      is_multiple_shop,
      vendor_status,
      contact_person_name,
      contact_person_email,
      company_name,
      business_type,
      industry,
      head_office_address_line1,
      head_office_address_line2,
      head_office_city,
      head_office_state,
      head_office_country,
      head_office_zipcode,
    } = req.body;

    // Check if the email already exists in the database
    const existingVendor = await pool.query(
      "SELECT * FROM vendors_registration WHERE email = $1",
      [email]
    );

    if (existingVendor.rows.length > 0) {
      return res.status(400).json({ error: "Email already exists" });
    }

    // Generate a random password
    const randomPassword = Math.random().toString(36).substring(2, 10); // Example: 'xj6nz5u'

    // Hash the password
    const hashedPassword = await bcrypt.hash(randomPassword, 10);

    // Insert the data into the table
    const { rows } = await pool.query(
      "INSERT INTO vendors_registration (name, email, password, phone_number, website_url, about_company, is_multiple_shop, vendor_status, contact_person_name, contact_person_email, company_name, business_type, industry, head_office_address_line1, head_office_address_line2, head_office_city, head_office_state, head_office_country, head_office_zipcode) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19) RETURNING *",
      [
        name,
        email,
        hashedPassword,
        phone_number,
        website_url,
        about_company,
        is_multiple_shop,
        vendor_status,
        contact_person_name,
        contact_person_email,
        company_name,
        business_type,
        industry,
        head_office_address_line1,
        head_office_address_line2,
        head_office_city,
        head_office_state,
        head_office_country,
        head_office_zipcode,
      ]
    );

    const htmlTemplate = fs.readFileSync(
      "./html/account_creation.html",
      "utf8"
    );

    const finalHtml = htmlTemplate
      .replace("[user_name]", name)
      .replace("[user_email]", email)
      .replace("[user_password]", randomPassword);

    await sendEmail(email, "Account Created Succesffully", finalHtml);
    // Send success response
    res
      .status(200)
      .json({ message: "Vendor added successfully", data: rows?.[0] });
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

app.post("/vendors/edit", authenticate, async (req, res) => {
  try {
    // Extract vendorId and values from the request body
    const { vendorId, values } = req.body;

    // Destructure the values object to individual variables
    const {
      name,
      email,
      phone_number,
      website_url,
      about_company,
      is_multiple_shop,
      vendor_status,
      contact_person_name,
      contact_person_email,
      company_name,
      business_type,
      industry,
      head_office_address_line1,
      head_office_address_line2,
      head_office_city,
      head_office_state,
      head_office_country,
      head_office_zipcode,
    } = values;

    // Optionally, check if the email has been changed and if the new email already exists in the database
    // This step is optional and depends on whether you allow changing the email and how you handle unique constraints

    // Update the data in the table
    const query = `
      UPDATE vendors_registration
      SET
        name = $1,
        email = $2,
        phone_number = $3,
        website_url = $4,
        about_company = $5,
        is_multiple_shop = $6,
        vendor_status = $7,
        contact_person_name = $8,
        contact_person_email = $9,
        company_name = $10,
        business_type = $11,
        industry = $12,
        head_office_address_line1 = $13,
        head_office_address_line2 = $14,
        head_office_city = $15,
        head_office_state = $16,
        head_office_country = $17,
        head_office_zipcode = $18
      WHERE id = $19
      RETURNING *;
    `;
    const { rows } = await pool.query(query, [
      name,
      email,
      phone_number,
      website_url,
      about_company,
      is_multiple_shop,
      vendor_status,
      contact_person_name,
      contact_person_email,
      company_name,
      business_type,
      industry,
      head_office_address_line1,
      head_office_address_line2,
      head_office_city,
      head_office_state,
      head_office_country,
      head_office_zipcode,
      vendorId, // Make sure this is the last parameter as per the query placeholders
    ]);

    if (rows.length === 0) {
      return res.status(404).json({ error: "Vendor not found" });
    }

    // Send success response
    res
      .status(200)
      .json({ message: "Vendor updated successfully", data: rows[0] });
  } catch (error) {
    console.error("Error updating vendor:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

const imgConfigVendorProfile = multer.diskStorage({
  destination: (req, file, callback) => {
    console.log(file);
    callback(null, "./upload/vendorImage");
  },
  filename: (req, file, callback) => {
    callback(null, `vendorImage-${Date.now()}-${file.originalname}`);
  },
});

// img filter
const isCategoryImage = (req, file, callback) => {
  if (file.mimetype.startsWith("image")) {
    callback(null, true);
  } else {
    callback(new Error("Only images are allowed"));
  }
};

const uploadVendor = multer({
  storage: imgConfigVendorProfile,
  fileFilter: isCategoryImage,
});

app.post(
  "/vendors/uploadImage",
  uploadVendor.single("file"),
  async (req, res) => {
    try {
      console.log(req.body);

      const { selectedKey } = req.body;

      const query = {
        text: "UPDATE vendors_registration SET vendor_image = $1 WHERE id = $2 RETURNING *",
        values: [req.file?.filename, selectedKey],
      };

      const { rows } = await pool.query(query);

      // Send success response
      res.json({ message: "Image uploaded successfully", data: rows[0] });
    } catch (error) {
      console.log(error);
      res.status(500).json({ error: "Internal Server Error" });
    }
  }
);

app.get("/vendors/:id", authenticate, async (req, res) => {
  try {
    const vendorId = req.params.id;

    // Retrieve vendor details
    const vendorQuery = await pool.query(
      "SELECT * FROM vendors_registration WHERE id = $1",
      [vendorId]
    );

    // Check if vendor exists
    if (vendorQuery.rows.length === 0) {
      return res.status(404).json({ error: "Vendor not found" });
    }

    // Remove password from vendor details
    delete vendorQuery.rows[0]?.password;

    // Retrieve stores associated with the vendor
    const storesQuery = await pool.query(
      "SELECT * FROM stores WHERE vendor_id = $1",
      [vendorId]
    );

    // Append stores to vendor details
    const vendorWithStores = {
      ...vendorQuery.rows[0],
      stores: storesQuery.rows,
    };

    // Send response with vendor details and associated stores
    res.json(vendorWithStores);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

const imgConfigStore = multer.diskStorage({
  destination: (req, file, callback) => {
    callback(null, "./upload/storeMedia");
  },
  filename: (req, file, callback) => {
    callback(null, `Store-${Date.now()}-${file.originalname}`);
  },
});

// img filter
const isVEndorStore = (req, file, callback) => {
  if (file.mimetype.startsWith("image")) {
    callback(null, true);
  } else {
    callback(new Error("Only images are allowed"));
  }
};

const uploadStore = multer({
  storage: imgConfigStore,
  fileFilter: isVEndorStore,
});

app.post("/vendors/store/add", uploadStore.array("file"), async (req, res) => {
  try {
    // Extract necessary data from the request body
    const { data, selectedRow, vendor_id } = req.body;
    const {
      store_name,
      address,
      city,
      state,
      country,
      description,
      phone,
      email,
      website,
      status,
      logo_url,
      banner_url,
    } = JSON.parse(data);

    // Check if files are uploaded
    let store_media_filename, banner_media_filename;

    if (typeof logo_url === "string" ) {
      banner_media_filename = req.files?.[0]?.filename;
      store_media_filename = logo_url;
    } else if (typeof banner_url === "string" ) {
      store_media_filename = req.files?.[0]?.filename || null;
      banner_media_filename = banner_url;
    } else if (typeof logo_url === "string" && typeof banner_url === "string") {
      (store_media_filename = logo_url), (banner_media_filename = banner_url);
    } else {
      store_media_filename = req.files?.[0]?.filename || null;
      banner_media_filename = req.files?.[1]?.filename || null;
    }

    console.log(store_media_filename, banner_media_filename);
    console.log(logo_url, 'logo');
    console.log(banner_url, 'banner');
    // console.log();
    let parsedSelectedRow = {};
    if (selectedRow) {
      try {
        parsedSelectedRow = JSON.parse(selectedRow);
      } catch (error) {
        console.error("Error parsing selectedRow:", error);
      }
    }
    const query = "SELECT banner_url, logo_url FROM stores WHERE store_id = $1";
    const resSTores = await pool.query(query, [parsedSelectedRow.store_id]);
    console.log(resSTores.rows);

    if (Object.keys(parsedSelectedRow).length > 0) {
      // If selectedRow is provided, it means we're editing an existing store
      const query = `
        UPDATE stores 
        SET 
          store_name = $1,
          store_slug = $2, 
          address = $3,
          city = $4,
          state = $5,
          country = $6,
          description = $7,
          phone = $8,
          email = $9,
          website = $10,
          logo_url = $11,
          banner_url = $12,
          status = $13
        WHERE 
          store_id = $14
        RETURNING *
      `;

      // Execute the query to update store data
      const { rows } = await pool.query(query, [
        store_name,
        slugify(store_name), // Generate and set store_slug
        address,
        city,
        state,
        country,
        description,
        phone,
        email,
        website,
        logo_url ? store_media_filename : resSTores.rows?.[0]?.logo_url,
        banner_url ? banner_media_filename : resSTores.rows?.[0]?.banner_url,
        status ? 1 : 0,
        parsedSelectedRow.store_id, // Assuming the unique identifier of the store is 'id'
      ]);

      await updateStoreName(
        "attributes",
        parsedSelectedRow?.store_name,
        slugify(store_name),
        parseInt(vendor_id),
        store_name
      );

      await updateStoreName(
        "categories",
        parsedSelectedRow?.store_name,
        slugify(store_name),
        parseInt(vendor_id),
        store_name
      );

      await updateStoreName(
        "customers",
        parsedSelectedRow?.store_name,
        slugify(store_name),
        parseInt(vendor_id),
        store_name
      );

      await updateStoreName(
        "products",
        parsedSelectedRow?.store_name,
        slugify(store_name),
        parseInt(vendor_id),
        store_name
      );

      return res
        .status(200)
        .json({ message: "Store updated successfully", data: rows[0] });
    } else {
      // Check if a store with the same name and vendor_id already exists
      const existingStoreQuery = await pool.query(
        "SELECT * FROM stores WHERE store_name = $1 AND vendor_id = $2",
        [store_name.trim(), vendor_id]
      );

      if (existingStoreQuery.rows.length > 0) {
        return res.status(400).json({
          error: "A store with the same name already exists for this vendor",
        });
      }

      // If selectedRow is not provided, it means we're adding a new store
      const query = `
        INSERT INTO stores 
          (store_name, store_slug, address, city, state, country, description, phone, email, website, logo_url, banner_url, status, vendor_id)
        VALUES 
          ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14)
        RETURNING *
      `;

      // Execute the query to insert new store data
      const { rows } = await pool.query(query, [
        store_name,
        slugify(store_name), // Generate and set store_slug
        address,
        city,
        state,
        country,
        description,
        phone,
        email,
        website,
        store_media_filename,
        banner_media_filename,
        status ? 1 : 0,
        vendor_id,
      ]);

      return res
        .status(200)
        .json({ message: "Store added successfully", data: rows[0] });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

module.exports = app;
