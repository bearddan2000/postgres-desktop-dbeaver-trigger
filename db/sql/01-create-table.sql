CREATE SEQUENCE IF NOT EXISTS audit_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1;

DROP TABLE IF EXISTS "public".audit;

CREATE TABLE "public".audit (
	"id" integer DEFAULT nextval('audit_id_seq') NOT NULL,
	"userId" text NOT NULL,
	"changed" TIMESTAMP NULL,
	"actionId" integer NOT NULL,
	"tblId" integer NOT NULL,
	"old_val" text DEFAULT NULL,
	"new_val" text DEFAULT NULL
) WITH (oids = false);
