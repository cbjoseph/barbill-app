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

bar_names = ['Wrigley Field', 'US Cellular Field', 'United Center', 'Soldier Field']
bar_names.each do |bar_name|
  bar = Bar.create(
    name: bar_name
  )
end
users = User.all
bars = Bar.all

drink_names = ['Budlight', '312 Urban Wheat', '312 Urban Pale', 'Miller Lite', 'Oberon']
drink_names.each do |drink_name|
  drink = Drink.create(
    name: drink_name,
    category_id: category1.id,
    bar_id: bars.sample.id,
    price: 6
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

# http://www.ballparksofbaseball.com/wp-content/uploads/2016/03/uscell_topv2.jpg (us celullar)
# http://static.panoramio.com/photos/original/2633922.jpg(united center)
# http://3.bp.blogspot.com/-5ncpayJucGo/Uctg5YTbNWI/AAAAAAAAGc8/9rfVKM78PNs/s1600/Wrigley-Field-Getty-Images.jpg (wrigley)
# http://sportsmockery.com/wp-content/uploads/2015/03/Soldier-Field-Outside.jpg (soldier field)
# http://scene7.targetimg1.com/is/image/Target/14984469?wid=450&hei=450&fmt=pjpeg 312 urban wheat
# http://chilledmagazine.com/wp-content/uploads/2014/03/312-beer-6pack.jpg 312 urban pale