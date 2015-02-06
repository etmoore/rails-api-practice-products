Product.destroy_all

10.times do
  Product.create!(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraphs.join('\n\n'),
    price_in_cents: rand(10000)
  )
end
