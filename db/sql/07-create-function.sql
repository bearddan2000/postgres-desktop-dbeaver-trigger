CREATE FUNCTION fn_trigger() RETURNS trigger AS $fn_trigger$
		DECLARE action int;
		tbl int;
  BEGIN
  -- Set record row depending on operation
    CASE TG_OP
    WHEN 'UPDATE' THEN
     action := 3;
    WHEN 'INSERT' THEN
     action := 1;
    WHEN 'DELETE' THEN
     action := 2;
    ELSE
     RAISE EXCEPTION 'Unknown TG_OP: "%". Should not occur!', TG_OP;
    END CASE;

		tbl = 1; -- DOG

    INSERT INTO "public".audit ("userId", changed, "actionId", "tblId", "old_val", "new_val")
    VALUES (user, now(), action, tbl, OLD, NEW);

    RETURN NULL;
	END;
$fn_trigger$ LANGUAGE plpgsql;
