START TRANSACTION;
-- SET time_zone = "+00:00";


--
-- Database: "test-e-boutique"
--

-- --------------------------------------------------------

--
-- Table structure for table "category"
--

CREATE TABLE "category" (
  "id" int NOT NULL,
  "name" varchar(255) COLLATE "C.UTF-8" NOT NULL,
  "description" varchar(255) COLLATE "C.UTF-8" NOT NULL
) ;

--
-- Dumping data for table "category"
--

INSERT INTO "category" ("id", "name", "description") VALUES
(1, 'Studio Mic', 'A microphone designed to capture and record audio with high accuracy and sensitivity in professional recording environments.'),
(2, 'Live - Wired', 'A microphone specifically designed for capturing and amplifying the vocals of a performer in real-time during live performances or events.'),
(3, 'Live - Wireless', 'A wireless microphone specifically designed for capturing and amplifying the vocals of a performer in real-time during live performances or events.');

-- --------------------------------------------------------

--
-- Table structure for table "command_line"
--

CREATE TABLE "command_line" (
  "id" int NOT NULL,
  "product_id" int NOT NULL,
  "customer_order_id" int NOT NULL,
  "quantity" int NOT NULL
) ;

--
-- Dumping data for table "command_line"
--

INSERT INTO "command_line" ("id", "product_id", "customer_order_id", "quantity") VALUES
(1, 1, 1, 1),
(2, 2, 2, 4),
(3, 1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table "customer_adress"
--

CREATE TABLE "customer_adress" (
  "id" int NOT NULL,
  "type" varchar(255) COLLATE "C.UTF-8" NOT NULL,
  "phone" varchar(255) COLLATE "C.UTF-8" NOT NULL,
  "adress" varchar(255) COLLATE "C.UTF-8" NOT NULL,
  "postal_code" varchar(255) COLLATE "C.UTF-8" NOT NULL,
  "city" varchar(255) COLLATE "C.UTF-8" NOT NULL,
  "country" varchar(255) COLLATE "C.UTF-8" NOT NULL,
  "user_id" int NOT NULL
) ;

--
-- Dumping data for table "customer_adress"
--

INSERT INTO "customer_adress" ("id", "type", "phone", "adress", "postal_code", "city", "country", "user_id") VALUES
(1, 'test', 'test', 'test', 'test', 'test', 'test', 2),
(2, 'home', '4A293R8', '11 Dev Street', '95740', 'DevCity', 'France', 9);

-- --------------------------------------------------------

--


--
-- Dumping data for table "doctrine_migration_versions"

-- --------------------------------------------------------

--
-- Table structure for table "messenger_messages"
--

CREATE TABLE "messenger_messages" (
  "id" bigint NOT NULL,
  "body" text COLLATE "C.UTF-8" NOT NULL,
  "headers" text COLLATE "C.UTF-8" NOT NULL,
  "queue_name" varchar(190) COLLATE "C.UTF-8" NOT NULL,
  "created_at" timestamp NOT NULL,
  "available_at" timestamp NOT NULL,
  "delivered_at" timestamp DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table "order"
--

CREATE TABLE "order" (
  "id" int NOT NULL,
  "number" int NOT NULL,
  "datetime" timestamp NOT NULL,
  "user_id" int NOT NULL
) ;

--
-- Dumping data for table "order"
--

INSERT INTO "order" ("id", "number", "datetime", "user_id") VALUES
(1, 1, '2023-06-11 21:39:49', 2),
(2, 2, '2023-06-11 21:40:27', 2),
(3, 3, '2023-06-11 21:58:03', 9);

-- --------------------------------------------------------

--
-- Table structure for table "product"
--

CREATE TABLE "product" (
  "id" int NOT NULL,
  "category_id" int NOT NULL,
  "name" varchar(255) COLLATE "C.UTF-8" NOT NULL,
  "description" varchar(255) COLLATE "C.UTF-8" NOT NULL,
  "price" double precision NOT NULL,
  "available" boolean NOT NULL,
  "image_url" varchar(255) COLLATE "C.UTF-8" NOT NULL
) ;

--
-- Dumping data for table "product"
--

INSERT INTO "product" ("id", "category_id", "name", "description", "price", "available", "image_url") VALUES
(1, 1, 'Aston Origin', 'A high-quality, versatile condenser microphone for professional audio recording and broadcasting.', 299, 'true', 'https://thumbs.static-thomann.de/thumb/padthumb600x600/pics/bdb/380169/10791895_800.jpg'),
(2, 1, 'Neumann U87', 'A legendary studio microphone renowned for its pristine audio quality and versatile performance across a wide range of professional recording applications.', 2900, 'true', 'https://cdn.shopify.com/s/files/1/0256/2988/4462/products/U87_700x700.jpg?v=1645632052'),
(3, 1, 'Sony C800G', 'A flagship tube microphone revered for its warm, rich sound and exceptional detail, favored by top recording studios and renowned artists.', 16000, 'true', 'https://images.reverb.com/image/upload/s--9NDWZNhB--/a_0/f_auto,t_large/v1678425422/nk0ompiwcuhihaff8447.jpg'),
(4, 2, 'Shure SM58', 'An industry-standard dynamic microphone renowned for its durability, versatility, and exceptional vocal performance in live sound and recording applications.', 100, 'true', 'https://m.media-amazon.com/images/I/5158IqcAkhL.jpg'),
(5, 2, 'Beyerdynamic M88', 'A dynamic microphone with a precise and detailed sound reproduction, ideal for vocals and instruments in live performances and studio recordings.', 390, 'true', 'https://thumbs.static-thomann.de/thumb/padthumb600x600/pics/bdb/129579/12700597_800.jpg'),
(6, 1, 'Sennheiser e835', 'A reliable and versatile dynamic microphone delivering clear and focused vocal reproduction, perfect for stage performances and studio recordings.', 100, 'true', 'https://thumbs.static-thomann.de/thumb/padthumb600x600/pics/bdb/128300/9714795_800.jpg'),
(7, 3, 'Shure SM58 Wireless', 'An industry-standard dynamic microphone renowned for its durability, versatility, and exceptional vocal performance in live sound and recording applications.', 340, 'true', 'https://www.woodbrass.com/images/woodbrass/SHURE+BLX24ESM58M17.JPG'),
(8, 3, 'Sennheiser e835 Wireless', 'A reliable and versatile dynamic microphone delivering clear and focused vocal reproduction, perfect for stage performances.', 320, 'true', 'https://static.bax-shop.es/image/product/381757/1178505/b8983ee4/1504602052XSW%201-835_1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table "user"
--

CREATE TABLE "user" (
  "id" int NOT NULL,
  "name" varchar(255) COLLATE "C.UTF-8" NOT NULL,
  "first_name" varchar(255) COLLATE "C.UTF-8" NOT NULL,
  "phone" varchar(255) COLLATE "C.UTF-8" NOT NULL,
  "email" varchar(180) COLLATE "C.UTF-8" NOT NULL,
  "password" varchar(255) COLLATE "C.UTF-8" NOT NULL,
  "roles" json NOT NULL
) ;

--
-- Dumping data for table "user"
--

INSERT INTO "user" ("id", "name", "first_name", "phone", "email", "password", "roles") VALUES
(2, 'Admin', 'Admin', '078429323', 'admin@admin.com', '\&dollar;2y\&dollar;13\&dollar;KAdYBw7IWDCO0Sx7x4QDf.AMMBVhz8pYjf4FTNhYAUNnS2rClwUii', '["ROLE_USER", "ROLE_ADMIN"]'::json),
(4, 'Test', 'Test', '0781834983', 'test@test.com', '\&dollar;2y\&dollar;13\&dollar;h68GEyXd3.XbMSbSkEzLdufJyBkmYEO2WjaLlF4RqAC4eW3v6TxjS', '[]'),
(9, 'Gosset', 'Rody', '0902349', 'rody@gosset.com', '\&dollar;2y\&dollar;13\&dollar;lSzXHeQnNbZmNuko0KY/vuE0c9Viq.97Ojoq.ebQ8NDa2KBPjZ1AC', '[]');

--
-- Indexes for dumped tables
--

--
-- Indexes for table "category"
--
ALTER TABLE "category"
  ADD PRIMARY KEY ("id");

--
-- Indexes for table "command_line"
--
-- Drop existing primary key constraint (if any)
ALTER TABLE "command_line" DROP CONSTRAINT IF EXISTS command_line_pkey;

-- Add primary key constraint
ALTER TABLE "command_line" ADD PRIMARY KEY ("id");

-- Add index on product_id
CREATE INDEX "IDX_70BE1A7B4584665A" ON "command_line" ("product_id");

-- Add index on customer_order_id
CREATE INDEX "IDX_70BE1A7BA15A2E17" ON "command_line" ("customer_order_id");


--
-- Indexes for table "customer_adress"
--

-- Drop existing primary key constraint (if any)
ALTER TABLE "customer_adress" DROP CONSTRAINT IF EXISTS customer_adress_pkey;

-- Add primary key constraint
ALTER TABLE "customer_adress" ADD PRIMARY KEY ("id");

-- Add index on user_id
CREATE INDEX "IDX_ED291BEFA76ED395" ON "customer_adress" ("user_id");


--
-- Indexes for table "doctrine_migration_versions"
--
-- ALTER TABLE "doctrine_migration_versions"
--   ADD PRIMARY KEY ("version");

--
-- Indexes for table "messenger_messages"
--

-- Drop existing primary key constraint (if any)
ALTER TABLE "messenger_messages" DROP CONSTRAINT IF EXISTS messenger_messages_pkey;

-- Add primary key constraint
ALTER TABLE "messenger_messages" ADD PRIMARY KEY ("id");

-- Add index on queue_name
CREATE INDEX "IDX_75EA56E0FB7336F0" ON "messenger_messages" ("queue_name");

-- Add index on available_at
CREATE INDEX "IDX_75EA56E0E3BD61CE" ON "messenger_messages" ("available_at");

-- Add index on delivered_at
CREATE INDEX "IDX_75EA56E016BA31DB" ON "messenger_messages" ("delivered_at");


--
-- Indexes for table "order"
--

-- Drop existing primary key constraint (if any)
ALTER TABLE "order" DROP CONSTRAINT IF EXISTS order_pkey;

-- Add primary key constraint
ALTER TABLE "order" ADD PRIMARY KEY ("id");

-- Add index on user_id
CREATE INDEX "IDX_F5299398A76ED395" ON "order" ("user_id");

--
-- Indexes for table "product"
--

-- Drop existing primary key constraint (if any)
ALTER TABLE "product" DROP CONSTRAINT IF EXISTS product_pkey;

-- Add primary key constraint
ALTER TABLE "product" ADD PRIMARY KEY ("id");

-- Add index on category_id
CREATE INDEX "IDX_D34A04AD12469DE2" ON "product" ("category_id");

--
-- Indexes for table "user"
--

-- Drop existing primary key constraint (if any)
ALTER TABLE "user" DROP CONSTRAINT IF EXISTS user_pkey;

-- Add primary key constraint
ALTER TABLE "user" ADD PRIMARY KEY ("id");

-- Add unique index on email
CREATE UNIQUE INDEX "UNIQ_8D93D649E7927C74" ON "user" ("email");

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table "category"
--
ALTER TABLE "category"
  ALTER COLUMN "id" SET NOT NULL;

CREATE SEQUENCE my_serial AS integer START 1 OWNED BY "category".id;

ALTER TABLE "category"
  ALTER COLUMN "id" SET DEFAULT nextval('my_serial');

--
-- AUTO_INCREMENT for table "command_line"
--
ALTER TABLE "command_line"
  ALTER COLUMN "id" SET NOT NULL;

CREATE SEQUENCE my_serial1 AS integer START 1 OWNED BY "command_line".id;

ALTER TABLE "command_line"
  ALTER COLUMN "id" SET DEFAULT nextval('my_serial1');

--
-- AUTO_INCREMENT for table "customer_adress"
--

ALTER TABLE "customer_adress"
  ALTER COLUMN "id" SET NOT NULL;

CREATE SEQUENCE my_serial2 AS integer START 1 OWNED BY "customer_adress".id;

ALTER TABLE "customer_adress"
  ALTER COLUMN "id" SET DEFAULT nextval('my_serial2');

--
-- AUTO_INCREMENT for table "messenger_messages"
--

ALTER TABLE "messenger_messages"
  ALTER COLUMN "id" SET NOT NULL;

CREATE SEQUENCE my_serial3 AS integer START 1 OWNED BY "messenger_messages".id;

ALTER TABLE "messenger_messages"
  ALTER COLUMN "id" SET DEFAULT nextval('my_serial3');

--
-- AUTO_INCREMENT for table "order"
--

ALTER TABLE "order"
  ALTER COLUMN "id" SET NOT NULL;

CREATE SEQUENCE my_serial4 AS integer START 1 OWNED BY "order".id;

ALTER TABLE "order"
  ALTER COLUMN "id" SET DEFAULT nextval('my_serial4');

--
-- AUTO_INCREMENT for table "product"
--

ALTER TABLE "product"
  ALTER COLUMN "id" SET NOT NULL;

CREATE SEQUENCE my_serial5 AS integer START 1 OWNED BY "product".id;

ALTER TABLE "product"
  ALTER COLUMN "id" SET DEFAULT nextval('my_serial5');


--
-- AUTO_INCREMENT for table "user"
--



ALTER TABLE "user"
  ALTER COLUMN "id" SET NOT NULL;

CREATE SEQUENCE my_serial6 AS integer START 1 OWNED BY "user".id;

ALTER TABLE "user"
  ALTER COLUMN "id" SET DEFAULT nextval('my_serial6');

--
-- Constraints for dumped tables
--

--
-- Constraints for table "command_line"
--
ALTER TABLE "command_line"
  ADD CONSTRAINT "FK_70BE1A7B4584665A" FOREIGN KEY ("product_id") REFERENCES "product" ("id"),
  ADD CONSTRAINT "FK_70BE1A7BA15A2E17" FOREIGN KEY ("customer_order_id") REFERENCES "order" ("id");

--
-- Constraints for table "customer_adress"
--
ALTER TABLE "customer_adress"
  ADD CONSTRAINT "FK_ED291BEFA76ED395" FOREIGN KEY ("user_id") REFERENCES "user" ("id");

--
-- Constraints for table "order"
--
ALTER TABLE "order"
  ADD CONSTRAINT "FK_F5299398A76ED395" FOREIGN KEY ("user_id") REFERENCES "user" ("id");

--
-- Constraints for table "product"
--
ALTER TABLE "product"
  ADD CONSTRAINT "FK_D34A04AD12469DE2" FOREIGN KEY ("category_id") REFERENCES "category" ("id");
COMMIT;

