CREATE TABLE "bets" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "lot_id" integer, "user_id" integer, "bet_amount" decimal, "bet_time" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "categories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime, "updated_at" datetime, "ancestry" varchar(255));
CREATE TABLE "lots" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "product_id" integer, "time_step" integer, "created_at" datetime, "updated_at" datetime, "status" varchar(255), "time_end" datetime, "bet_step" decimal, "time_start" integer, "start_price" decimal, "current_price" decimal);
CREATE TABLE "pictures" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "imageable_id" integer, "imageable_type" varchar(255), "created_at" datetime, "updated_at" datetime, "image" varchar(255));
CREATE TABLE "products" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "category_id" integer, "name" varchar(255), "shop_price" integer, "image" varchar(255), "description" text, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar(255) DEFAULT '' NOT NULL, "encrypted_password" varchar(255) DEFAULT '' NOT NULL, "reset_password_token" varchar(255), "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar(255), "last_sign_in_ip" varchar(255), "created_at" datetime, "updated_at" datetime, "is_admin" boolean);
CREATE INDEX "index_categories_on_ancestry" ON "categories" ("ancestry");
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20131211055326');

INSERT INTO schema_migrations (version) VALUES ('20131211064207');

INSERT INTO schema_migrations (version) VALUES ('20131211072935');

INSERT INTO schema_migrations (version) VALUES ('20131217192659');

INSERT INTO schema_migrations (version) VALUES ('20131220032749');

INSERT INTO schema_migrations (version) VALUES ('20131225065836');

INSERT INTO schema_migrations (version) VALUES ('20131225104007');

INSERT INTO schema_migrations (version) VALUES ('20131225104535');

INSERT INTO schema_migrations (version) VALUES ('20131225105319');

INSERT INTO schema_migrations (version) VALUES ('20140120220217');

INSERT INTO schema_migrations (version) VALUES ('20140120222448');

INSERT INTO schema_migrations (version) VALUES ('20140206010659');

INSERT INTO schema_migrations (version) VALUES ('20140206020434');

INSERT INTO schema_migrations (version) VALUES ('20140206023639');

INSERT INTO schema_migrations (version) VALUES ('20140207192839');

INSERT INTO schema_migrations (version) VALUES ('20140207220911');

INSERT INTO schema_migrations (version) VALUES ('20140207223323');

INSERT INTO schema_migrations (version) VALUES ('20140207230226');
