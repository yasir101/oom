# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# db/seeds.rb

company_assets_data = [
  { name: "LED's", quantity: 10, description: nil },
  { name: 'Printer', quantity: 1, description: nil },
  { name: 'Tables', quantity: 15, description: nil },
  { name: 'Chairs', quantity: 15, description: nil },
  { name: 'Foot Rest', quantity: 5, description: nil },
  { name: "AC's", quantity: 2, description: nil },
  { name: 'Fans', quantity: 4, description: nil },
  { name: 'Exhaust Fans', quantity: 3, description: nil },
  { name: 'Mirrors', quantity: 2, description: nil },
  { name: 'Tissue Holders', quantity: 2, description: nil },
  { name: 'Curtains', quantity: 3, description: nil },
  { name: 'Card Holder', quantity: nil, description: nil },
  { name: 'Pen Holder', quantity: nil, description: nil },
  { name: 'Table Tennis', quantity: 1, description: '4 rackets' },
  { name: 'Fridge', quantity: 1, description: nil },
  { name: 'UPS', quantity: 1, description: nil },
  { name: 'Batteries', quantity: 2, description: nil },
  { name: 'Insect Killer', quantity: 2, description: nil },
  { name: 'Oven', quantity: 1, description: nil },
  { name: 'Electric Kettles', quantity: 2, description: nil },
  { name: 'Laptops', quantity: 6, description: nil },
  { name: "Ram's", quantity: nil, description: nil },
  { name: 'Mouse', quantity: nil, description: nil },
  { name: 'Keyboard', quantity: 1, description: nil },
  { name: "Mac's", quantity: 4, description: nil }
]

company_assets_data.each do |asset|
  CompanyAsset.create!(asset)
end
