names = ['Caroline', 'Brandon', 'Jodie', 'Neal']
names.each do |name|
  user = User.create(
    name: name,
    email: "#{name}@#{name}.com".downcase,
    password: "password"
  )
end
category1 = Category.create(
  name: "beer"
)
category2 = Category.create(
  name: "wine"
) 
category3 = Category.create(
  name: "mixed drinks"
)

bar_names = ['Wrigley Field', 'Mothers', 'Pink Elephant', 'Gas Light']
bar_names.each do |bar_name|
  bar = Bar.create(
    name: bar_name
  )
end
users = User.all
bars = Bar.all

drink_names = ['Merlot', 'Pinot', 'Chardonney', 'Spritzer']
drink_names.each do |drink_name|
  drink = Drink.create(
    name: drink_name,
    category_id: category2.id,
    bar_id: bars.sample.id
  )
end
drinks = Drink.all
bartender_names = ['Crystal', 'Savannah', 'Hannah', 'Sophie']
bartender_names.each do |bartender_name|
  bartender = Bartender.create(
    name: bartender_name,
    bar_id: bars.sample.id
  )
end
bartenders = Bartender.all

4.times do 
  order = Order.create(
    user_id: users.sample.id,
    bartender_id: bartenders.sample.id
  )
end
orders = Order.all
4.times do
  rating = Rating.create(
    stars: [1, 2, 3, 4, 5].sample,
    drink_id: drinks.sample.id,
    user_id: users.sample.id
  )  
end

4.times do
  carted_drink = CartedDrink.create(
    drink_id: drinks.sample.id,
    user_id: users.sample.id,
    order_id: orders.sample.id, 
    quantity: [1, 2].sample
    )
end
puts "Done!"