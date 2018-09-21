require "granite/adapter/pg"

class Feed < Granite::Base
  adapter pg
  table_name feeds
  belongs_to :user

  # id : Int64 primary key is created for you
  timestamps
  user_id : Int64
end
