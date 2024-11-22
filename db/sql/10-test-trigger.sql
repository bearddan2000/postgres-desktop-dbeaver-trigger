INSERT INTO "public".dog (breed, color)
VALUES ('Malmute', 'Grey');

UPDATE "public".dog
SET breed = 'Rover' WHERE id = 13;

DELETE FROM "public".dog WHERE id = 13;
