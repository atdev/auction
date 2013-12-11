CREATE TABLE "categories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime, "updated_at" datetime, "ancestry" varchar(255));
CREATE TABLE "products" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "category_id" integer, "name" varchar(255), "shop_price" integer, "image" varchar(255), "description" text, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE INDEX "index_categories_on_ancestry" ON "categories" ("ancestry");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20131211055326');

INSERT INTO schema_migrations (version) VALUES ('20131211064207');

INSERT INTO schema_migrations (version) VALUES ('20131211072935');
