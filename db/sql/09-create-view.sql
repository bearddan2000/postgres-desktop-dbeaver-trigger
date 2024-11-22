DROP VIEW IF EXISTS "public"."audit_view";

CREATE VIEW "public"."audit_view" AS
SELECT a.id, "userId", CAST (date_part('month', changed) as int) as Month,
  CAST (date_part('day', changed) as int)  as Day,
  action, "table_name" as Table, "old_val", "new_val"
FROM audit as a
JOIN audit_action as b ON a."actionId" = b."id"
JOIN audit_table_name as c ON a."tblId" = c."id";
