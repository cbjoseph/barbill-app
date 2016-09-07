json.array! @carteddrinks.each do |carteddrink|
  json.id carteddrink.id
  json.name carteddrink.drink.name
  json.img carteddrink.drink.img_src
  json.user carteddrink.user.name
  json.quantity carteddrink.quantity
end