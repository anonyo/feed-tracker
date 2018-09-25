-- +micrate Up
ALTER TABLE users
ADD pushover_token VARCHAR;

-- +micrate Down
ALTER TABLE users
DROP COLUMN pushover_token;
