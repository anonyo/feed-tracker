-- +micrate Up
ALTER TABLE feeds
ADD user_id BIGSERIAL;

-- +micrate Down
ALTER TABLE feeds
DROP COLUMN user_id;
