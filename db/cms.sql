PGDMP      !    
            |            sagartech-cms     15.7 (Ubuntu 15.7-1.pgdg23.10+1)     16.3 (Ubuntu 16.3-1.pgdg23.10+1) �    _           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            `           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            a           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            b           1262    18074    sagartech-cms    DATABASE     u   CREATE DATABASE "sagartech-cms" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_IN';
    DROP DATABASE "sagartech-cms";
                postgres    false            �            1255    36594    update_student_updated_at()    FUNCTION     �   CREATE FUNCTION public.update_student_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.student_updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$;
 2   DROP FUNCTION public.update_student_updated_at();
       public          postgres    false            �            1259    36595 
   activities    TABLE     �  CREATE TABLE public.activities (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    short_description character varying(255),
    description text,
    type character varying(50) NOT NULL,
    thumbnail_url character varying(255),
    media_url character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.activities;
       public         heap    postgres    false            �            1259    36602    activities_id_seq    SEQUENCE     �   CREATE SEQUENCE public.activities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.activities_id_seq;
       public          postgres    false    235            c           0    0    activities_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.activities_id_seq OWNED BY public.activities.id;
          public          postgres    false    236            �            1259    18075 
   attributes    TABLE     �   CREATE TABLE public.attributes (
    attribute_id integer NOT NULL,
    attribute_name character varying(255) NOT NULL,
    attribute_values text[],
    category text,
    subcategory text,
    store_name text,
    vendor_id integer
);
    DROP TABLE public.attributes;
       public         heap    postgres    false            �            1259    18080    attributes_attribute_id_seq    SEQUENCE     �   CREATE SEQUENCE public.attributes_attribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.attributes_attribute_id_seq;
       public          postgres    false            �            1259    18081    attributes_attribute_id_seq1    SEQUENCE     �   CREATE SEQUENCE public.attributes_attribute_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.attributes_attribute_id_seq1;
       public          postgres    false    214            d           0    0    attributes_attribute_id_seq1    SEQUENCE OWNED BY     \   ALTER SEQUENCE public.attributes_attribute_id_seq1 OWNED BY public.attributes.attribute_id;
          public          postgres    false    216            �            1259    36603    blogs    TABLE     -  CREATE TABLE public.blogs (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    short_description character varying(255),
    description text,
    type character varying(50) NOT NULL,
    thumbnail_url character varying(255),
    media_url character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    keywords text,
    visibility character varying(20) DEFAULT 'private'::character varying
);
    DROP TABLE public.blogs;
       public         heap    postgres    false            �            1259    36611    blogs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.blogs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.blogs_id_seq;
       public          postgres    false            �            1259    36612    blogs_id_seq1    SEQUENCE     �   CREATE SEQUENCE public.blogs_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.blogs_id_seq1;
       public          postgres    false    237            e           0    0    blogs_id_seq1    SEQUENCE OWNED BY     >   ALTER SEQUENCE public.blogs_id_seq1 OWNED BY public.blogs.id;
          public          postgres    false    239            �            1259    18082 
   categories    TABLE       CREATE TABLE public.categories (
    category_id integer NOT NULL,
    category_name character varying(255) NOT NULL,
    category_description text,
    category_image_url character varying(255),
    category_status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    category_type character varying(255),
    attribute_cat_id integer[],
    vendor_id integer,
    store_name text,
    cat_slug text
);
    DROP TABLE public.categories;
       public         heap    postgres    false            �            1259    18090    categories_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.categories_category_id_seq;
       public          postgres    false            �            1259    18091    categories_category_id_seq1    SEQUENCE     �   CREATE SEQUENCE public.categories_category_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.categories_category_id_seq1;
       public          postgres    false    217            f           0    0    categories_category_id_seq1    SEQUENCE OWNED BY     Z   ALTER SEQUENCE public.categories_category_id_seq1 OWNED BY public.categories.category_id;
          public          postgres    false    219            �            1259    36613    chapters    TABLE     .  CREATE TABLE public.chapters (
    chapter_id integer NOT NULL,
    course_id integer,
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    description text,
    video_link character varying(255)
);
    DROP TABLE public.chapters;
       public         heap    postgres    false            �            1259    36619    chapters_chapter_id_seq    SEQUENCE     �   CREATE SEQUENCE public.chapters_chapter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.chapters_chapter_id_seq;
       public          postgres    false    240            g           0    0    chapters_chapter_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.chapters_chapter_id_seq OWNED BY public.chapters.chapter_id;
          public          postgres    false    241            �            1259    36568    classes    TABLE     �   CREATE TABLE public.classes (
    id integer NOT NULL,
    img text,
    title text,
    date text,
    timing text,
    showpay boolean,
    features text[],
    group_link text
);
    DROP TABLE public.classes;
       public         heap    postgres    false            �            1259    36567    classes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.classes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.classes_id_seq;
       public          postgres    false    234            h           0    0    classes_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.classes_id_seq OWNED BY public.classes.id;
          public          postgres    false    233            �            1259    36620    consultation    TABLE     �  CREATE TABLE public.consultation (
    id integer NOT NULL,
    full_name character varying(100) NOT NULL,
    age integer NOT NULL,
    contact_number character varying(15) NOT NULL,
    alternate_mobile_number character varying(15),
    diet_preference character varying(10),
    zodiac_sign character varying(20),
    relationship_status character varying(50),
    medicine_consumption text,
    disorders_or_disease text,
    purpose_of_yoga text,
    personal_notes text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    preferred_date date,
    preferred_time time with time zone,
    appointment_till_date date,
    appointment_till_time time with time zone,
    email_address text,
    additionaltext text,
    appointmentstatus text,
    appointmentendedbyadmintime timestamp with time zone,
    country text,
    user_state text,
    city text,
    payment_mode text,
    payment_status text,
    payment_amount text,
    payment_id text,
    payment_obj jsonb,
    service text
);
     DROP TABLE public.consultation;
       public         heap    postgres    false            �            1259    36626    consultation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.consultation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.consultation_id_seq;
       public          postgres    false    242            i           0    0    consultation_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.consultation_id_seq OWNED BY public.consultation.id;
          public          postgres    false    243            �            1259    36627    courses    TABLE     ,  CREATE TABLE public.courses (
    course_id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    instructor character varying(100),
    slug character varying(255) NOT NULL,
    old_price numeric(10,2),
    price numeric(10,2) NOT NULL,
    is_free boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    course_thumbnail character varying(255),
    duration character varying(50),
    level character varying(50),
    visibility boolean DEFAULT false NOT NULL,
    intro_url text
);
    DROP TABLE public.courses;
       public         heap    postgres    false            �            1259    36635    courses_course_id_seq    SEQUENCE     �   CREATE SEQUENCE public.courses_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.courses_course_id_seq;
       public          postgres    false    244            j           0    0    courses_course_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.courses_course_id_seq OWNED BY public.courses.course_id;
          public          postgres    false    245            �            1259    18092 	   customers    TABLE     �  CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    phone character varying(20),
    address_country character varying(100),
    address_company character varying(255),
    address_line1 text,
    address_line2 text,
    city character varying(100),
    state character varying(100),
    pin_code character varying(20),
    phone_number_address character varying(20),
    note text,
    collect_taxes boolean,
    customer_media text,
    vendor_id integer,
    store_name character varying(255),
    countryjsonb jsonb
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    18097    customers_customer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.customers_customer_id_seq;
       public          postgres    false    220            k           0    0    customers_customer_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;
          public          postgres    false    221            �            1259    36636    enroll_user    TABLE     G  CREATE TABLE public.enroll_user (
    enroll_id integer NOT NULL,
    user_id integer NOT NULL,
    course_id integer NOT NULL,
    enroll_date date NOT NULL,
    status character varying(20) NOT NULL,
    course json NOT NULL,
    payment json NOT NULL,
    creation_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.enroll_user;
       public         heap    postgres    false            �            1259    36642    enroll_user_enroll_id_seq    SEQUENCE     �   CREATE SEQUENCE public.enroll_user_enroll_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.enroll_user_enroll_id_seq;
       public          postgres    false    246            l           0    0    enroll_user_enroll_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.enroll_user_enroll_id_seq OWNED BY public.enroll_user.enroll_id;
          public          postgres    false    247            �            1259    36643    enrollments    TABLE     �   CREATE TABLE public.enrollments (
    enrollment_id integer NOT NULL,
    user_id integer,
    course_id integer,
    enrolled_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    paymentobj jsonb
);
    DROP TABLE public.enrollments;
       public         heap    postgres    false            �            1259    36649    enrollments_enrollment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.enrollments_enrollment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.enrollments_enrollment_id_seq;
       public          postgres    false    248            m           0    0    enrollments_enrollment_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.enrollments_enrollment_id_seq OWNED BY public.enrollments.enrollment_id;
          public          postgres    false    249            �            1259    18184    products    TABLE     r  CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    permalink text NOT NULL,
    date_created timestamp with time zone,
    date_created_gmt timestamp with time zone,
    date_modified timestamp with time zone,
    date_modified_gmt timestamp with time zone,
    type character varying(50),
    status character varying(50),
    featured boolean,
    catalog_visibility character varying(50),
    description text,
    short_description text,
    sku character varying(100),
    price numeric(10,2),
    regular_price numeric(10,2),
    sale_price numeric(10,2),
    date_on_sale_from timestamp with time zone,
    date_on_sale_from_gmt timestamp with time zone,
    date_on_sale_to timestamp with time zone,
    date_on_sale_to_gmt timestamp with time zone,
    on_sale boolean,
    total_sales integer,
    downloadable boolean,
    download_limit integer,
    download_expiry integer,
    tax_status character varying(50),
    tax_class character varying(50),
    stock_quantity integer,
    stock_status character varying(50),
    sold_individually boolean DEFAULT false,
    weight character varying(50),
    dimensions jsonb,
    reviews_allowed boolean,
    average_rating numeric(3,2),
    rating_count integer,
    parent_id bigint,
    purchase_note text,
    meta_data jsonb,
    categories jsonb,
    attributes jsonb,
    default_attributes jsonb,
    images jsonb,
    variations jsonb,
    grouped_products jsonb,
    related_ids integer[],
    upsell_ids integer[],
    cross_sell_ids integer[],
    vendor_id integer,
    store_name text
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    18183    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public          postgres    false    232            n           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public          postgres    false    231            �            1259    18106    stores    TABLE     �  CREATE TABLE public.stores (
    store_id integer NOT NULL,
    store_name character varying(255) NOT NULL,
    address character varying(255),
    city character varying(100),
    state character varying(100),
    country character varying(100),
    vendor_id integer,
    description text,
    phone character varying(20),
    email character varying(255),
    website character varying(255),
    logo_url character varying(255),
    banner_url character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    added_by_admin_id integer,
    status integer DEFAULT 0,
    store_slug text,
    api_key jsonb,
    CONSTRAINT stores_status_check CHECK (((status >= 0) AND (status <= 2)))
);
    DROP TABLE public.stores;
       public         heap    postgres    false            �            1259    18114    stores_store_id_seq    SEQUENCE     �   CREATE SEQUENCE public.stores_store_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.stores_store_id_seq;
       public          postgres    false    222            o           0    0    stores_store_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.stores_store_id_seq OWNED BY public.stores.store_id;
          public          postgres    false    223            �            1259    36650    students    TABLE     s  CREATE TABLE public.students (
    student_id integer NOT NULL,
    student_name character varying(255) NOT NULL,
    student_email character varying(255) NOT NULL,
    student_password character varying(255) NOT NULL,
    student_created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    student_updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.students;
       public         heap    postgres    false            �            1259    36657    students_student_id_seq    SEQUENCE     �   CREATE SEQUENCE public.students_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.students_student_id_seq;
       public          postgres    false    250            p           0    0    students_student_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.students_student_id_seq OWNED BY public.students.student_id;
          public          postgres    false    251            �            1259    18115    subcategories    TABLE     �  CREATE TABLE public.subcategories (
    subcategory_id integer NOT NULL,
    subcategory_name character varying(255) NOT NULL,
    subcategory_description text,
    subcategory_image_url character varying(255),
    parent_category_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    isfeatured boolean,
    subcat_status boolean,
    nested_subcategories jsonb,
    subcat_slug text
);
 !   DROP TABLE public.subcategories;
       public         heap    postgres    false            �            1259    18122     subcategories_subcategory_id_seq    SEQUENCE     �   CREATE SEQUENCE public.subcategories_subcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.subcategories_subcategory_id_seq;
       public          postgres    false            �            1259    18123 !   subcategories_subcategory_id_seq1    SEQUENCE     �   CREATE SEQUENCE public.subcategories_subcategory_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.subcategories_subcategory_id_seq1;
       public          postgres    false    224            q           0    0 !   subcategories_subcategory_id_seq1    SEQUENCE OWNED BY     f   ALTER SEQUENCE public.subcategories_subcategory_id_seq1 OWNED BY public.subcategories.subcategory_id;
          public          postgres    false    226            �            1259    18124 
   superadmin    TABLE     �  CREATE TABLE public.superadmin (
    id integer NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone_number character varying(20),
    password character varying(255) NOT NULL,
    profile_image text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.superadmin;
       public         heap    postgres    false            �            1259    18131    superadmin_id_seq    SEQUENCE     �   CREATE SEQUENCE public.superadmin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.superadmin_id_seq;
       public          postgres    false    227            r           0    0    superadmin_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.superadmin_id_seq OWNED BY public.superadmin.id;
          public          postgres    false    228            �            1259    18132    vendors_registration    TABLE     �  CREATE TABLE public.vendors_registration (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    vendor_image character varying(255),
    joined_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    phone_number character varying(20),
    website_url character varying(255),
    contact_person_name character varying(100),
    contact_person_email character varying(100),
    company_name character varying(100),
    company_logo_url character varying(255),
    business_type character varying(50),
    industry character varying(50),
    head_office_address_line1 character varying(255),
    head_office_address_line2 character varying(255),
    head_office_city character varying(100),
    head_office_state character varying(100),
    head_office_country character varying(100),
    head_office_zipcode character varying(20),
    is_multiple_shop boolean DEFAULT false,
    about_company text,
    vendor_status integer DEFAULT 1,
    CONSTRAINT vendors_registration_vendor_status_check CHECK ((vendor_status = ANY (ARRAY[1, 2, 3, 4])))
);
 (   DROP TABLE public.vendors_registration;
       public         heap    postgres    false            �            1259    18141    vendors_registration_id_seq    SEQUENCE     �   CREATE SEQUENCE public.vendors_registration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.vendors_registration_id_seq;
       public          postgres    false    229            s           0    0    vendors_registration_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.vendors_registration_id_seq OWNED BY public.vendors_registration.id;
          public          postgres    false    230            V           2604    36658    activities id    DEFAULT     n   ALTER TABLE ONLY public.activities ALTER COLUMN id SET DEFAULT nextval('public.activities_id_seq'::regclass);
 <   ALTER TABLE public.activities ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    235            @           2604    18142    attributes attribute_id    DEFAULT     �   ALTER TABLE ONLY public.attributes ALTER COLUMN attribute_id SET DEFAULT nextval('public.attributes_attribute_id_seq1'::regclass);
 F   ALTER TABLE public.attributes ALTER COLUMN attribute_id DROP DEFAULT;
       public          postgres    false    216    214            Y           2604    36659    blogs id    DEFAULT     e   ALTER TABLE ONLY public.blogs ALTER COLUMN id SET DEFAULT nextval('public.blogs_id_seq1'::regclass);
 7   ALTER TABLE public.blogs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    237            A           2604    18143    categories category_id    DEFAULT     �   ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq1'::regclass);
 E   ALTER TABLE public.categories ALTER COLUMN category_id DROP DEFAULT;
       public          postgres    false    219    217            ]           2604    36660    chapters chapter_id    DEFAULT     z   ALTER TABLE ONLY public.chapters ALTER COLUMN chapter_id SET DEFAULT nextval('public.chapters_chapter_id_seq'::regclass);
 B   ALTER TABLE public.chapters ALTER COLUMN chapter_id DROP DEFAULT;
       public          postgres    false    241    240            U           2604    36571 
   classes id    DEFAULT     h   ALTER TABLE ONLY public.classes ALTER COLUMN id SET DEFAULT nextval('public.classes_id_seq'::regclass);
 9   ALTER TABLE public.classes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    233    234            _           2604    36661    consultation id    DEFAULT     r   ALTER TABLE ONLY public.consultation ALTER COLUMN id SET DEFAULT nextval('public.consultation_id_seq'::regclass);
 >   ALTER TABLE public.consultation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    242            a           2604    36662    courses course_id    DEFAULT     v   ALTER TABLE ONLY public.courses ALTER COLUMN course_id SET DEFAULT nextval('public.courses_course_id_seq'::regclass);
 @   ALTER TABLE public.courses ALTER COLUMN course_id DROP DEFAULT;
       public          postgres    false    245    244            E           2604    18144    customers customer_id    DEFAULT     ~   ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);
 D   ALTER TABLE public.customers ALTER COLUMN customer_id DROP DEFAULT;
       public          postgres    false    221    220            e           2604    36663    enroll_user enroll_id    DEFAULT     ~   ALTER TABLE ONLY public.enroll_user ALTER COLUMN enroll_id SET DEFAULT nextval('public.enroll_user_enroll_id_seq'::regclass);
 D   ALTER TABLE public.enroll_user ALTER COLUMN enroll_id DROP DEFAULT;
       public          postgres    false    247    246            g           2604    36664    enrollments enrollment_id    DEFAULT     �   ALTER TABLE ONLY public.enrollments ALTER COLUMN enrollment_id SET DEFAULT nextval('public.enrollments_enrollment_id_seq'::regclass);
 H   ALTER TABLE public.enrollments ALTER COLUMN enrollment_id DROP DEFAULT;
       public          postgres    false    249    248            S           2604    18187    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231    232            F           2604    18146    stores store_id    DEFAULT     r   ALTER TABLE ONLY public.stores ALTER COLUMN store_id SET DEFAULT nextval('public.stores_store_id_seq'::regclass);
 >   ALTER TABLE public.stores ALTER COLUMN store_id DROP DEFAULT;
       public          postgres    false    223    222            i           2604    36665    students student_id    DEFAULT     z   ALTER TABLE ONLY public.students ALTER COLUMN student_id SET DEFAULT nextval('public.students_student_id_seq'::regclass);
 B   ALTER TABLE public.students ALTER COLUMN student_id DROP DEFAULT;
       public          postgres    false    251    250            I           2604    18147    subcategories subcategory_id    DEFAULT     �   ALTER TABLE ONLY public.subcategories ALTER COLUMN subcategory_id SET DEFAULT nextval('public.subcategories_subcategory_id_seq1'::regclass);
 K   ALTER TABLE public.subcategories ALTER COLUMN subcategory_id DROP DEFAULT;
       public          postgres    false    226    224            L           2604    36666    superadmin id    DEFAULT     n   ALTER TABLE ONLY public.superadmin ALTER COLUMN id SET DEFAULT nextval('public.superadmin_id_seq'::regclass);
 <   ALTER TABLE public.superadmin ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227            O           2604    18149    vendors_registration id    DEFAULT     �   ALTER TABLE ONLY public.vendors_registration ALTER COLUMN id SET DEFAULT nextval('public.vendors_registration_id_seq'::regclass);
 F   ALTER TABLE public.vendors_registration ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229            L          0    36595 
   activities 
   TABLE DATA           �   COPY public.activities (id, title, slug, short_description, description, type, thumbnail_url, media_url, created_at, updated_at) FROM stdin;
    public          postgres    false    235   V�       7          0    18075 
   attributes 
   TABLE DATA           �   COPY public.attributes (attribute_id, attribute_name, attribute_values, category, subcategory, store_name, vendor_id) FROM stdin;
    public          postgres    false    214   6�       N          0    36603    blogs 
   TABLE DATA           �   COPY public.blogs (id, title, slug, short_description, description, type, thumbnail_url, media_url, created_at, updated_at, keywords, visibility) FROM stdin;
    public          postgres    false    237   S�       :          0    18082 
   categories 
   TABLE DATA           �   COPY public.categories (category_id, category_name, category_description, category_image_url, category_status, created_at, updated_at, category_type, attribute_cat_id, vendor_id, store_name, cat_slug) FROM stdin;
    public          postgres    false    217   ��       Q          0    36613    chapters 
   TABLE DATA           k   COPY public.chapters (chapter_id, course_id, title, slug, created_at, description, video_link) FROM stdin;
    public          postgres    false    240   U�       K          0    36568    classes 
   TABLE DATA           ^   COPY public.classes (id, img, title, date, timing, showpay, features, group_link) FROM stdin;
    public          postgres    false    234   J�       S          0    36620    consultation 
   TABLE DATA           �  COPY public.consultation (id, full_name, age, contact_number, alternate_mobile_number, diet_preference, zodiac_sign, relationship_status, medicine_consumption, disorders_or_disease, purpose_of_yoga, personal_notes, created_at, preferred_date, preferred_time, appointment_till_date, appointment_till_time, email_address, additionaltext, appointmentstatus, appointmentendedbyadmintime, country, user_state, city, payment_mode, payment_status, payment_amount, payment_id, payment_obj, service) FROM stdin;
    public          postgres    false    242   ��       U          0    36627    courses 
   TABLE DATA           �   COPY public.courses (course_id, title, description, instructor, slug, old_price, price, is_free, created_at, course_thumbnail, duration, level, visibility, intro_url) FROM stdin;
    public          postgres    false    244   <�       =          0    18092 	   customers 
   TABLE DATA             COPY public.customers (customer_id, first_name, last_name, email, password, phone, address_country, address_company, address_line1, address_line2, city, state, pin_code, phone_number_address, note, collect_taxes, customer_media, vendor_id, store_name, countryjsonb) FROM stdin;
    public          postgres    false    220   ��       W          0    36636    enroll_user 
   TABLE DATA           y   COPY public.enroll_user (enroll_id, user_id, course_id, enroll_date, status, course, payment, creation_date) FROM stdin;
    public          postgres    false    246   �       Y          0    36643    enrollments 
   TABLE DATA           a   COPY public.enrollments (enrollment_id, user_id, course_id, enrolled_at, paymentobj) FROM stdin;
    public          postgres    false    248   #�       I          0    18184    products 
   TABLE DATA           �  COPY public.products (id, name, slug, permalink, date_created, date_created_gmt, date_modified, date_modified_gmt, type, status, featured, catalog_visibility, description, short_description, sku, price, regular_price, sale_price, date_on_sale_from, date_on_sale_from_gmt, date_on_sale_to, date_on_sale_to_gmt, on_sale, total_sales, downloadable, download_limit, download_expiry, tax_status, tax_class, stock_quantity, stock_status, sold_individually, weight, dimensions, reviews_allowed, average_rating, rating_count, parent_id, purchase_note, meta_data, categories, attributes, default_attributes, images, variations, grouped_products, related_ids, upsell_ids, cross_sell_ids, vendor_id, store_name) FROM stdin;
    public          postgres    false    232   @�       ?          0    18106    stores 
   TABLE DATA           �   COPY public.stores (store_id, store_name, address, city, state, country, vendor_id, description, phone, email, website, logo_url, banner_url, created_at, added_by_admin_id, status, store_slug, api_key) FROM stdin;
    public          postgres    false    222   ��       [          0    36650    students 
   TABLE DATA           �   COPY public.students (student_id, student_name, student_email, student_password, student_created_at, student_updated_at) FROM stdin;
    public          postgres    false    250   ��       A          0    18115    subcategories 
   TABLE DATA           �   COPY public.subcategories (subcategory_id, subcategory_name, subcategory_description, subcategory_image_url, parent_category_id, created_at, updated_at, isfeatured, subcat_status, nested_subcategories, subcat_slug) FROM stdin;
    public          postgres    false    224   O�       D          0    18124 
   superadmin 
   TABLE DATA           �   COPY public.superadmin (id, first_name, last_name, email, phone_number, password, profile_image, created_at, updated_at) FROM stdin;
    public          postgres    false    227   )�       F          0    18132    vendors_registration 
   TABLE DATA           �  COPY public.vendors_registration (id, name, email, password, vendor_image, joined_date, phone_number, website_url, contact_person_name, contact_person_email, company_name, company_logo_url, business_type, industry, head_office_address_line1, head_office_address_line2, head_office_city, head_office_state, head_office_country, head_office_zipcode, is_multiple_shop, about_company, vendor_status) FROM stdin;
    public          postgres    false    229   ��       t           0    0    activities_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.activities_id_seq', 25, true);
          public          postgres    false    236            u           0    0    attributes_attribute_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.attributes_attribute_id_seq', 1, false);
          public          postgres    false    215            v           0    0    attributes_attribute_id_seq1    SEQUENCE SET     J   SELECT pg_catalog.setval('public.attributes_attribute_id_seq1', 2, true);
          public          postgres    false    216            w           0    0    blogs_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.blogs_id_seq', 1, false);
          public          postgres    false    238            x           0    0    blogs_id_seq1    SEQUENCE SET     <   SELECT pg_catalog.setval('public.blogs_id_seq1', 52, true);
          public          postgres    false    239            y           0    0    categories_category_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.categories_category_id_seq', 1, false);
          public          postgres    false    218            z           0    0    categories_category_id_seq1    SEQUENCE SET     I   SELECT pg_catalog.setval('public.categories_category_id_seq1', 4, true);
          public          postgres    false    219            {           0    0    chapters_chapter_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.chapters_chapter_id_seq', 54, true);
          public          postgres    false    241            |           0    0    classes_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.classes_id_seq', 3, true);
          public          postgres    false    233            }           0    0    consultation_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.consultation_id_seq', 47, true);
          public          postgres    false    243            ~           0    0    courses_course_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.courses_course_id_seq', 43, true);
          public          postgres    false    245                       0    0    customers_customer_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.customers_customer_id_seq', 2, true);
          public          postgres    false    221            �           0    0    enroll_user_enroll_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.enroll_user_enroll_id_seq', 1, true);
          public          postgres    false    247            �           0    0    enrollments_enrollment_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.enrollments_enrollment_id_seq', 1, false);
          public          postgres    false    249            �           0    0    products_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.products_id_seq', 20, true);
          public          postgres    false    231            �           0    0    stores_store_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.stores_store_id_seq', 29, true);
          public          postgres    false    223            �           0    0    students_student_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.students_student_id_seq', 2, true);
          public          postgres    false    251            �           0    0     subcategories_subcategory_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.subcategories_subcategory_id_seq', 1, false);
          public          postgres    false    225            �           0    0 !   subcategories_subcategory_id_seq1    SEQUENCE SET     O   SELECT pg_catalog.setval('public.subcategories_subcategory_id_seq1', 2, true);
          public          postgres    false    226            �           0    0    superadmin_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.superadmin_id_seq', 1, true);
          public          postgres    false    228            �           0    0    vendors_registration_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.vendors_registration_id_seq', 21, true);
          public          postgres    false    230            �           2606    36670    activities activities_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.activities DROP CONSTRAINT activities_pkey;
       public            postgres    false    235            �           2606    36672    activities activities_slug_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_slug_key UNIQUE (slug);
 H   ALTER TABLE ONLY public.activities DROP CONSTRAINT activities_slug_key;
       public            postgres    false    235            o           2606    18151    attributes attributes_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.attributes
    ADD CONSTRAINT attributes_pkey PRIMARY KEY (attribute_id);
 D   ALTER TABLE ONLY public.attributes DROP CONSTRAINT attributes_pkey;
       public            postgres    false    214            �           2606    36674    blogs blogs_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.blogs DROP CONSTRAINT blogs_pkey;
       public            postgres    false    237            �           2606    36676    blogs blogs_slug_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_slug_key UNIQUE (slug);
 >   ALTER TABLE ONLY public.blogs DROP CONSTRAINT blogs_slug_key;
       public            postgres    false    237            q           2606    18153    categories categories_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    217            �           2606    36678    chapters chapters_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT chapters_pkey PRIMARY KEY (chapter_id);
 @   ALTER TABLE ONLY public.chapters DROP CONSTRAINT chapters_pkey;
       public            postgres    false    240            �           2606    36575    classes classes_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.classes
    ADD CONSTRAINT classes_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.classes DROP CONSTRAINT classes_pkey;
       public            postgres    false    234            �           2606    36680    consultation consultation_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.consultation
    ADD CONSTRAINT consultation_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.consultation DROP CONSTRAINT consultation_pkey;
       public            postgres    false    242            �           2606    36682    courses courses_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (course_id);
 >   ALTER TABLE ONLY public.courses DROP CONSTRAINT courses_pkey;
       public            postgres    false    244            �           2606    36684    courses courses_slug_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_slug_key UNIQUE (slug);
 B   ALTER TABLE ONLY public.courses DROP CONSTRAINT courses_slug_key;
       public            postgres    false    244            s           2606    18155    customers customers_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);
 G   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_email_key;
       public            postgres    false    220            u           2606    18157    customers customers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    220            �           2606    36686    enroll_user enroll_user_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.enroll_user
    ADD CONSTRAINT enroll_user_pkey PRIMARY KEY (enroll_id);
 F   ALTER TABLE ONLY public.enroll_user DROP CONSTRAINT enroll_user_pkey;
       public            postgres    false    246            �           2606    36688    enrollments enrollments_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_pkey PRIMARY KEY (enrollment_id);
 F   ALTER TABLE ONLY public.enrollments DROP CONSTRAINT enrollments_pkey;
       public            postgres    false    248            �           2606    36690 -   enrollments enrollments_user_id_course_id_key 
   CONSTRAINT     v   ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_user_id_course_id_key UNIQUE (user_id, course_id);
 W   ALTER TABLE ONLY public.enrollments DROP CONSTRAINT enrollments_user_id_course_id_key;
       public            postgres    false    248    248            �           2606    18192    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    232            w           2606    18161    stores stores_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (store_id);
 <   ALTER TABLE ONLY public.stores DROP CONSTRAINT stores_pkey;
       public            postgres    false    222            �           2606    36692    students students_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);
 @   ALTER TABLE ONLY public.students DROP CONSTRAINT students_pkey;
       public            postgres    false    250            �           2606    36694 #   students students_student_email_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_student_email_key UNIQUE (student_email);
 M   ALTER TABLE ONLY public.students DROP CONSTRAINT students_student_email_key;
       public            postgres    false    250            y           2606    18163     subcategories subcategories_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.subcategories
    ADD CONSTRAINT subcategories_pkey PRIMARY KEY (subcategory_id);
 J   ALTER TABLE ONLY public.subcategories DROP CONSTRAINT subcategories_pkey;
       public            postgres    false    224            {           2606    18165    superadmin superadmin_email_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.superadmin
    ADD CONSTRAINT superadmin_email_key UNIQUE (email);
 I   ALTER TABLE ONLY public.superadmin DROP CONSTRAINT superadmin_email_key;
       public            postgres    false    227            }           2606    18167    superadmin superadmin_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.superadmin
    ADD CONSTRAINT superadmin_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.superadmin DROP CONSTRAINT superadmin_pkey;
       public            postgres    false    227                       2606    18169 3   vendors_registration vendors_registration_email_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.vendors_registration
    ADD CONSTRAINT vendors_registration_email_key UNIQUE (email);
 ]   ALTER TABLE ONLY public.vendors_registration DROP CONSTRAINT vendors_registration_email_key;
       public            postgres    false    229            �           2606    18171 .   vendors_registration vendors_registration_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.vendors_registration
    ADD CONSTRAINT vendors_registration_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.vendors_registration DROP CONSTRAINT vendors_registration_pkey;
       public            postgres    false    229            �           1259    36695    idx_students_email    INDEX     P   CREATE INDEX idx_students_email ON public.students USING btree (student_email);
 &   DROP INDEX public.idx_students_email;
       public            postgres    false    250            �           2620    36696    students set_student_updated_at    TRIGGER     �   CREATE TRIGGER set_student_updated_at BEFORE UPDATE ON public.students FOR EACH ROW EXECUTE FUNCTION public.update_student_updated_at();
 8   DROP TRIGGER set_student_updated_at ON public.students;
       public          postgres    false    252    250            �           2606    36697     chapters chapters_course_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT chapters_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.chapters DROP CONSTRAINT chapters_course_id_fkey;
       public          postgres    false    244    3475    240            �           2606    36702 &   enrollments enrollments_course_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.enrollments DROP CONSTRAINT enrollments_course_id_fkey;
       public          postgres    false    244    248    3475            �           2606    36707 $   enrollments enrollments_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.students(student_id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.enrollments DROP CONSTRAINT enrollments_user_id_fkey;
       public          postgres    false    3486    250    248            �           2606    36712    enroll_user fk_course    FK CONSTRAINT        ALTER TABLE ONLY public.enroll_user
    ADD CONSTRAINT fk_course FOREIGN KEY (course_id) REFERENCES public.courses(course_id);
 ?   ALTER TABLE ONLY public.enroll_user DROP CONSTRAINT fk_course;
       public          postgres    false    3475    246    244            �           2606    36717    enroll_user fk_user    FK CONSTRAINT     }   ALTER TABLE ONLY public.enroll_user
    ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES public.students(student_id);
 =   ALTER TABLE ONLY public.enroll_user DROP CONSTRAINT fk_user;
       public          postgres    false    3486    246    250            �           2606    18172 $   stores stores_added_by_admin_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_added_by_admin_id_fkey FOREIGN KEY (added_by_admin_id) REFERENCES public.superadmin(id) ON DELETE SET NULL;
 N   ALTER TABLE ONLY public.stores DROP CONSTRAINT stores_added_by_admin_id_fkey;
       public          postgres    false    227    222    3453            �           2606    18177    stores stores_vendor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES public.vendors_registration(id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.stores DROP CONSTRAINT stores_vendor_id_fkey;
       public          postgres    false    3457    222    229            L   �  x�uUMo�6<'����/[v��S/[�-��,qM�$��}��9��`�!�>f��sY<�m9�U�v"�$�m5� �:X�^(�[=mI|=������A���A���1�Ơ/�����S��^��vW�Tbt|d$��4^�Q�@�>;��0:��������{W�J�+9����C0:�ݒh�d{�R"��_�n���|�k�����Z�Y�1�B�d����v�^ى���d#{���wL�18cB����� z��`�"��=Pj�e�=��ofH�����F]����+�	�"�SB���;�[����sקj�t��_����! �9(�1śԻ��Ћ��1J�q��b�2w���\��?�h�I��Cˎ����&�zm�3�DБ"P>��I')���;I&)� �=���zV�|��1��
E 29L�pܹЩ��j�7l�P	CI�#�pv��Izi����$�Emo��qr�0q+�r����)&71@����bF��=	2E��}�:¹�z�uL�'U�E��6�?�C==ʔ1��P6�G=/���`��ɖOxӚs�[Ù0�GC?�A�d!` ۅtH�7��c��H�b`��]�<�"�gh�듻������w{!���_�F�C6�8��q���H�q0>-��5�ށ�!+�>R���2��Hz�0���o�4��	%[��t�I�1̧$NV";�y�O��Z���%Cb�,����Ő�h^�)
�'0��AOf�9<��M���?yO�{��)���Q���>M!Y�5±#_pgAjZ����8�!�ZĆ_���h�]Y��uS���O+��4���u��4E��싲�e���z�m��j��TyU�pP K���"/�����(}�� }S�Ŷ����f�-�Ͷj����v�f]��rS��f�l�e/�%�7YY��~.w�y�*������*��A�L��/����� *���      7      x������ � �      N   a  x��Z]��}^�
�����{�],`�q�4q��#@���4�R�	ɑ�<�o������Kr�ZɆQ��}h��p���q�gzq~��z�/�ήŏ��ٕ�����Am[�
N�p���)����MwX=���zX=ui�O�]�N��_:�7���N���r'�ֵ�]M��)�p��Q�+�Z%���씰K��D�XT�������/m����F���U���
RTҬ�ѽ��]�:�Sn�� �������:��*u���sji��nO;9��ߨ�/8;�i�n������ʘVy�On��[>���7�?�t~��8;=��`�h���K�l=�X㐍�R�7�3\�+��ա�f}��Ḯ�.�� �ZQk_ٶ��s���Zj�C4����r^ѳ�Wf���-�pF�?j�hɏV�=6w�V,l���5�����v:��[��r]B����A���H�*��� O����H�1l&y����GWv��wN����<�n9n����B�kU���m�K��.��u��a[�]��!`���$8�N�n�c�O��{:`K+��@���*X�M���m�l�W�����?��U���(^m�r��%���x�PU�g�Uc�P�ϥ$����R^dka��U����$pE,����7�x��ok�Vj&^Q� �n�� ϥKc��6pHo�b�R��áXb�#�^GT�H����'���:�����+�	ram���OrL����}{�ն]���L�U�;�峛��x�(t�k�ZW�%�2L�R���P�|f�㥭z�E���^�w�Qk���U�#����V���#�
�8�Z�]^c��i�Tn�IJ��H�Zw���G��ѱ�m�� 9M�����-6���LaV�SmJ��C;�I�M�6�p�Q����c��J�h�%�4W2�l��v���Y��9B�.���b�"(z�O9�ruP͉U�B,��N��p�X_RKr����bg ��{(&�7TR��)������T+0fI�fKM޴ )�R�5v/�<�3�0h�D�oR��"D��0]ۘ8 2EoRMj?�<W��Ǫ� �0 ȩ�N2�]rIl����=�Ү��ٟ��YӠ������#�_�A5����1��������}��c�_�,#��1��4���Q�^��Ʀ�P��jn�V��`%��\�z/ir�q����������'	�����s�\�X�(�C��Rxoݽols�`6�~�x�Ը��e>U�������6_4��x�7�D�f��5�Z��.~��w�OEt�2=��ٱ~�m" @�Ӿ�����6z^��>��Z����E��ؐAN��yfBCD��|zwE��#ir�P����:*w�p�{`vA�4�7n��W�@�ȹ�T�^��wH�
�]+���]_��Wؒ~"ZWo�r�����2��A�V�7~�]�G<H�����^H0�}�!{��M�|C)�;,��iN5b��7���	~U=w�����	�E���Ć�Y������� �mƮ�F߫)E�˻� �tXA~�����'�/��������c��G��ٸ�$����	7~���P�$�E�/�Z����5�B�9s�S祱DNFv8:��d�0y�	I3R��vu��j���c "��I{�g&�Ĩ2�g����I	<�b΀��U�{��H6�pg����8����]���W�݁�K�J"�G��:(��m�Z�)���\�j"�4��4�)�e3B�O��8�A��'�i���ڍ��{k��<�����ҋ<p0l�φ�3���4��@���!�ٶ�b��л% �.���(��I�;�b�����A�g���9R�M7%�%�j�>�2i�q��y��8#����h����W����!l�|�e&M�cWv��e���ArH"�?�'ڍB@�Ӡ�j��I��$U������D0r� ��4��Ti�_b�Fo�]����(D��b�zL�zѧ�X�*%��g`��F�vh\�A�/P,�j�l���S�?�`�0Rq)p���/H{C��U�9#��x:#��$<D���)�)�"NN+�e΀�rl��c�o��f�<Y���������������%�F8�}�������E�D����م�_<;���tv~z~���ϧ���O?� =eu�|�㛓�_ �]\��Ș��q�(�5S��fX>*�qR)u�̷Nh73(1�_�������3OQYE�����@�@=>��ESӑ�Q �m�Fq�0{���Z[ҒJ��g�1�8�ƐRz���G]d&X#$VJ�G���]�`�_Wx���e�<CC/텋������QY��S�v�|Ioق��/iB��!�*�.
�N�}���cK�r�xgq��A��K��$��
�t;~�!aA=t�脦���(w�=\>:�%�O�E��.&L�������;��Ƥ�y�Tx��p�r�8��@I� s�@�rT�3o0$U����E@��6Jf��D�rn�������R>���@
2���.�u�$$��&;\q��]Rc��8p�;���|8x�'��.١YIL"�0m�Y�U�$�*�]�RB��z2�ܥs3k(UU�`G����$��{7�Sږl3޴�7����D!�s�L7�>��>;)GE �'�*��4:��/
K��3IC0n�`�?�����,��ܫBs�>�2��T{����Tj�\~���(w�l�e��oI��Q.�<�jѾFL�����c0Fv���h���]Ge�_���T�_��T����(;��4�9"�I�{�'�I#Y^$撶�:��-��e%/ǚӢ�Y�ۋ�QA�,y!����j��u�Է���-(4C$�B�<�+pc�l��m�r�G�ڇ�(�5��d!�jCc��e�qJ�KG{��]�0"�"�0�Ծ�|Ds���+t�A��?�
3�GǱ�+&Ln�5�T�izƬ�H���xƠ$<��8���B���!g&�B9��>����&�� ]�u�=�$M�]�H���9]5��Fo���@�/u,��r
d��1{!+	�����\�Q�����X���k��OQ��]j~D L���(}��l7�Ti���\�ސ+��8(����Y��ċ]1����Q�C3�tf7)�f�%N���Ɠ������i��y�+������`�������z�̏��F��BM�T�5��փ� #�4X&ٮhZ��2U-��r�Γ'�W�T�J幙j� �ĥC*WάAv%�vIr�.����_�"J��V}
��1`�C�Z'/�y"jK����߀L��Y%�����F��g~��QT�t
�r*i;�ۘՁ}zK/E���
�<m�҅�����d�zF��%d
����j�<��<,��W�!��[8���*>b�bmOz��d�t�PY#)*�a}#i)����;�:�6#��
��wi9�w0��$3&�SVNя	��R�2��d����'�Ϩp�Z/���H�i�������q@ͪG��yD�8!�kO�8����/�ӻVv��0�3�W�O�����������W�gO�Wg�������������r�>��]g�����g���K���������������∾�.����C}%���g�=�7���j      :   �   x�}���  ��W� �W*��q01Ƥk�'E�P0��oG'���3p��JN�����[�|��P��Z;ӓs��\Smo�"<����ݡ�0��E�?u+yy�Va��LO^�.��K���B|�H+c      Q   �  x���Mo�0�ϻ���Vԋ�8�7*���T�r���ű�������n��%������;S�/V�b���8E~��X��3�=���������Վ���0^�a��b��:Hw��ȨCt�pA�Q�<�oa"�2{m���|)�	���|;D���G���~,��ѡ]�$5؈���Z�f%�'@�����t(�*���v�Vb��T�~���!l�u�h\z�K�r���!��Y�A-�B��щƓE':=sz��'���F�0�+b����=x����\³��A*`GdG^FĀ���!_TN.�%VCW���e���RQ�[AK�¶�%�*u�m���Y��J-�Z� �3zoS�>��p���8���iv%�q��5���~6I)*������9�!�ɝ�#������(�S�\���~�f@�y��t7�1p�{m�D�h� h(t���s�]�I*Uϫ���������l��b����|3�|]Wy���;J$w��䨗Ǔ�� ���'N�̢���8>?�= �B^���$����|s��e:D6����RY���-O��\�QTP򢁖�n`�� �(�)$t|`�k(xB����R:l#�]������:��`n�q7���@6��lO13��D}�hhkQ43`ٯ&M�n�	�T�Km�8z��ǜ0����^H������$���W����n��lT�P�ڬ��?�ݞ      K   K  x�uS�n�0<k���y7A�C�i��,�� �hm�f"K�D��}�{I��<�\��Ù�sf3����h���z��p����m�����c��W���|��<���a��d+�e��~`p4�2��}:Y�|)�ZȜ��<��-t�hG�x��Ǩ6�6�(��3���=BĔ���~IA����F�'�I��C^攆C��W�0�� &�05(����-��JHN!�2�"x����+�>�uWG��ɷ2z
=	�Y}4g#��V[U���3�h�g��i��"��P��Ӊ��"`�l!�u��'4^�9m�f�ˣ&U�8���!���"F��R�u���n��jcqLQN3����Ԝ����H��\[������E{-��#�0��kt�8 O�S[��>|2g�f�!bo4�p��ݒ�g���x�.y�j���`�����8�Ȭإ���A�|�f#�SGBNq�(�W���3Zѵ:w1����-$�I�{�u�'�UA�{t���,�x��}�&AK��T�q�25��=�\�5�$X<Bz\�TY�wVܳ�k�N4�ה��`&u�c����j��*'��      S   �  x���]o�0��ͯ�z�ikd;�Cr5�2�]�R`�*!�ClH�� ۬�S��H(�HӖ8��s�{���,D�L���ńG�a�w��E1eǘS��4	�qȂ8L���	��AK�X�&-E�f�fs�?-�h��Ҏ�Z�����9�k�@�ɬ4t]��O�^�
� (�NV���Sп�;_�b��~�FG�R�j	6/Յp-I�Z��~]��q?g���{t-݃�\*�y�`/�����|��.��CDHI[�G�I@"�h:Ŕ��HE�N%M�6"����)LdJc	2V2�G�Z�ܮG�bFT�J@I��d�:fj�����Ao߯8`	#I�}��G���%�9X[�������AH�����>;���Ŭ�_j]�j~������ٸ߽����~��_��Nu������9��x�[��ᢐV
�T�����z�#=-�^�:�\�I�.�-�R76+/PU�cX��}���kN���g�Q�˥���Һ�l�c㗿���t����{�����>�W?��������"��1����<�:E����{7�����6&�T}���S�%��}�f<�{�T��Az6�]z'!f�5<[pvs�	�	��`{l��l9��b�(�,
tWΠ5�[��J���      U   �  x�5�͎�0�Ϟ��#�q&�K"!�JH�ع�r`��:N'�ȱ#��Lxz�N�����_��/�kPmP���	���Z�Y:;�~������!xr�<�:�&���M"L��({��;������:��N��u����F;�A���#4�0He����P�:��.8`4�iaP��kM\QA	�	|F!Ah�S�A8�B�,��h�}t�n�QZ���&���6�7�,���l�H&Vq����l�r0
J��OR�2�����a�ɑ_w�<���z2ov�eUUI����۱<�K��񼄬�Ӭ>�'iy~���"e"fy��44���}V��]^d�"��=+��ȳ���&L�0��t��9���P"�p�����~}q�?��/��W^.y�:�O���~?�J��_�m��      =   $  x��Ar�0���)&�,��;�c��]C�&m'#@ـ!�:��{�ޠ�^�G�p�N2���W3�{?���C�OiLC0NiV���n�Ir�3;9����{���&no./�/�y��t����1O��g�~�/`5�D·�A.�n�!.1�@��XQ)�(�r����)� QU*�39�b�3f!���������IƊ2���-ز�kP��[������^	�L�+Sk�6,˘�Z��<�ܙ��&�a���图�����9��n��R�D��NjUR�"�>�y�2���B��q�J�H~�yQ[��`�c����9�մ��Ý�nO��S��GEel:X�P��2%�ͱ�VT�FOr5],J�tu<5�a(���b��^D�z��W��oA���}��c�)�ԼH~���={w,��'Ӊ��8j[{���ʷ��8�7��tvʂ������ǁ�R?u��/��mG;��-^���`B<rU)��׳�,�g:�����<}�ɲW#{�֢ 0�G���>G�&)-c}���<�h7����GE      W   �  x��T]o�6}v~���I��C3lh�&m�t���ye1�H���(E��.����>�E��=����(��(K�<N�q���{���爛�:\Ky:���
�"z	�1�gR���{�^WcϮkk�M��0`g�$w�8踕m S�'0�V�c�b,V�R=s�v�w���7f���N*��U�"�L����(J�ZCt�8����"�Z���rm-E{h��k��VS#F1ڜ���_�׌+ T:�-T��񆡮As�XV)���T���06ꍯ��%�=oWK�T�4��bQ��~�=Mj���'$����ƒJg=���`����{,u������~�4R���F�uki'J�W��$I}B�"ݺ�HX��8�A;k��v��u�(�i1[L�|vCy��uה�"��P�.�U�ͳi�\M'��&����h�i���U��P���^���=j$��5��b�}����n7�3�]�n�SlJ����^�����4?9���eVnw⪉wMz����z�k�ZӮ����χp����
�zp�޼������ѕ9;x�y�姎�p�쿯dG�����!���� �U��hVevC/��o��g�o�5�
釣z����cڟ�:��S�߼�O��p���w��'e-��B���tO��=�l{���æ��߄:���m� ��9�\a��|���H�*�W9}�p���e+(��*�b���ʳ����c��"�'�i�C2+���_����Ժ:      Y      x������ � �      I   4  x���[k�0ǟ�OQ�:�r1U���q{风��h�1-m6'��ĺK7������9�  ��Y
cD:L Ad2F��c��sD���8Eq��:�q�&tJ����Pd#�lA~�z�E�gE������ފ���F) �$��ǔ���f´
�NX)雀���6��;ã���<��`G1,�ޕ.T��`���ȕ8~�� ���)E3������`u�{u
�A9�$U�it�teÜWa^T�ɰ�C��Ǫ��wr��Z���_MN;�~��`�����G|��r_Yu߽mJaw*Z'Q�T�I      ?     x�u�;o�0��˯�^���L]"�Y�1���0�/I�G+U:ù��a���&�S�١uP~���c���vv���'�C�-�hk��΄�*�0.�
��׶��Ȫ�ò,̝.v7��Q���Tk��,��jrn�]�I3��.R�%��𜦆b�ơ���#M�!��4W�hT��U!�y�_C�{��6J�5!DR���~����w�z��V�����k���H	�$Y(�L��22� �7$)l7ٽ�q����{��.�3%r̟a�I�t2ٳ$I~ ��z�      [   �   x�]ʻ�0 й�
6Ci/�W褉�IHL$.# ET�Q����3`ym��䵵��v �%��l�D�w��+�_!UϰL�x��F�tqp���_�#��:������~�I��[0�(婹Am 1P�8��D�?�Q $)���Qpοp�*�      A   �   x���?�0���S�������:��Rb�5�$�����ݖ 8)<nx�����^u�#@�;"H��lVV���,�x�L�_фN:<�6�U��;Zݏ�Զ��j�l�y�y)�2g��}㕲��p��@��bʀ(J�E|�-] ��ԥ�ׯ7�Q6~�|7��ǭ�4*P�A�C]T�x}��3�u
���qEo�]      D   �   x���;�0  й����2�1&��DC\�E(T�no<���#��U�A�U�! s>���[x� �q������'��lx��~��܃ƭ�eߤ��(�{�х�NhVn�0�2��|�\G���C�P�Qƶ��FV9�\��/�@�QUo�S>�lF�𘇱�0
�������;A��=v      F   k  x�UQMo�0=˿�_툔-K9-+�,k� sפ@/�G%����n���ON��H>���(H�*UO��7*7���w�����������p%�g�e����j�"����Ej�S}c����WM��99T�l��N�*�$gB�L
���*ۛv�v�#�8�<��&2��&u"�O1��0����J�P:��a�O'�ֺ����1m���;?4�e.>��"�!�̸#���Q��}і���]"������=+o�׍݊W(���w���T6�$e;�׳��/���9e8���(}�Q
��)2A$HpgI���x��O��N�<7<�c�����rfT�k�YزV$��:A�*�)�<�\~��     