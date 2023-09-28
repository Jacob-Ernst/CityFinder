# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

cities_import_path = Rails.root.join('db/data/cities.csv')

Rails.logger.info "Importing cities from #{cities_import_path}.\n"

# Use transaction to rollback all changes in case we run into errors.
ActiveRecord::Base.transaction do
  # Use block form of CSV.foreach because it closes the file automatically.
  # Convert headers to symbols to simplify assigning properties.
  CSV.foreach(
    cities_import_path, headers: true, header_converters: :symbol
  ) do |row|
    city = City.find_or_initialize_by(name: row[:name], state: row[:state])
    city.assign_attributes(row.to_h)
    city.save!(validate: false)
  end
end

Rails.logger.info "\nDone importing cities!"
