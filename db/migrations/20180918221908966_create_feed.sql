-- +micrate Up
CREATE TABLE feeds (
  id BIGSERIAL PRIMARY KEY,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS feeds;
