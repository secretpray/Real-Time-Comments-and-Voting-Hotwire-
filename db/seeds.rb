return unless Rails.env == "development"

system 'clear'

puts 'Destroy all records'
puts '*' * 80

User.destroy_all
Product.destroy_all
Category.destroy_all

puts 'Create new records'
puts '*' * 80

MAX_USERS_COUNT    = 3
MAX_CATEGORY_COUNT = Category::types.count
MAX_PRODUCT_COUNT  = 68
USER_EMAIL         = %w(jane.doe john.doe admin)

# service
def create_user(email, password = '123456')
  User.create!(email: "#{email}@example.com",
               first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               password: password)
  print '.'
end

def add_image(product)
  image = "#{Product::types[product.product_type].downcase}-#{rand(1..4)}.png"
  product.images.attach(io: File.open(Rails.root.join('app', 'assets', 'images', image)),
                 filename: "#{SecureRandom.uuid}_#{image}", content_type: 'image/png')
  print '.'
end

#create Users
USER_EMAIL.each { |email| create_user(email) }

#create Category
Category::types.keys.each do |name|
  Category.create!(name: name)
  print '.'
end

#create Products
MAX_PRODUCT_COUNT.times do
  percentage = rand(101)
  popularity = percentage < 10 ? 2 : percentage < 40 ? 3 : percentage < 75 ? 4 : 5
  Product.create!(name: Faker::Commerce.product_name,
                  description: Faker::TvShows::BigBangTheory.quote,
                  price: Faker::Commerce.price(range: 0..1000.00),
                  brand: Product::brands.keys.sample,
                  product_type:  Product::types.keys.sample,
                  popularity: popularity,
                  color: Product::colors.values.sample,
                  size:  Product::sizes.values.sample,
                  sex:   Product::sexes.values.sample,
                  category: Category.all.sample)
  print '.'
end

# add image
  Product.all.each do |product|
    add_image(product) unless product.images.attached?
    print '.'
  end

puts ' '
puts ' '
puts "That's all folks!"
puts '*' * 80
p "Created #{Category.count} #{'category'.pluralize(Category.count)}"
p "Created #{Product.count} #{'product'.pluralize(Product.count)}"
p "Created #{User.count} #{'user'.pluralize(User.count)}"
