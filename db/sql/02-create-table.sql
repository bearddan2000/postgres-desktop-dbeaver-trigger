CREATE SEQUENCE IF NOT EXISTS audit_action_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1;

DROP TABLE IF EXISTS "public"."audit_action";

CREATE TABLE "public"."audit_action" (
	"id" integer DEFAULT nextval('audit_action_seq') NOT NULL,
	"action" varchar(20) NOT NULL
) WITH (oids = false);
