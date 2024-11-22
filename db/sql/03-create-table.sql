CREATE SEQUENCE IF NOT EXISTS audit_table_name_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1;

DROP TABLE IF EXISTS "public"."audit_table_name";

CREATE TABLE "public"."audit_table_name" (
	"id" integer DEFAULT nextval('audit_table_name_seq') NOT NULL,
	"table_name" varchar(20) NOT NULL
) WITH (oids = false);
