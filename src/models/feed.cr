class Feed < Granite::Base
  adapter pg
  table_name feeds

  # id : Int64 primary key is created for you
  timestamps
end
