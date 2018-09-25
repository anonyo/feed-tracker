require "../config/*"
Granite::Settings.new.logger = Mosquito::Base.logger

# if not using Quartz, remove
Mosquito::Runner.start
