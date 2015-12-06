# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = Administrator.create(login: 'admin', password: '111111', password_confirmation: '111111')
rest_1 =  Restaurant.create(name: 'Hof Van Cleve', address: 'Riemegemstraat,  1, 9770 Kruishoutem, Belgium', tel: '+3293835848')
rest_2 =  Restaurant.create(name: 'El Celler de Can Roca', address: 'Calle Can Sunyer, 48, 17007 Girona, Spain', tel: '+34972222157')

man_1 = Manager.create(lastname: 'Phillip Coulson', tel: '+3285456987',  restaurant_id: rest_1.id)
man_2 = Manager.create(lastname: 'Nick Fury', tel: '+3465841239', restaurant_id: rest_2.id)

cash_1 = Cashier.create(lastname: 'Bruce Banner', restaurant_id: rest_1.id)
cash_2 = Cashier.create(lastname: 'Thor', restaurant_id: rest_2.id)

chef_1 = Chef.create(lastname: 'Sam Wilson', restaurant_id: rest_1.id)
chef_2 = Chef.create(lastname: 'James Rhodes', restaurant_id: rest_1.id)
chef_3 = Chef.create(lastname: 'Pietro Maximoff', restaurant_id: rest_2.id)
chef_4 = Chef.create(lastname: 'Wanda Maximoff', restaurant_id: rest_2.id)

hall_1 = Hall.create(hall_type: 'For smokers', restaurant_id: rest_1.id)
hall_2 = Hall.create(hall_type: 'For non-smokers',restaurant_id: rest_1.id)
hall_3 = Hall.create(hall_type: 'For non-smokers',restaurant_id: rest_2.id)
hall_4 = Hall.create(hall_type: 'For visitors with children',restaurant_id: rest_2.id)

host_1 = Hostess.create(lastname: 'Jarvis', restaurant_id: rest_1.id)
host_2 = Hostess.create(lastname: 'Maria Hill', restaurant_id: rest_1.id)
host_3 = Hostess.create(lastname: 'Vision', restaurant_id: rest_2.id)
host_4 = Hostess.create(lastname: 'Ultron', restaurant_id: rest_2.id)

wait_1 = Waiter.create(lastname: 'Steve Rogers', restaurant_id: rest_1.id)
wait_2 = Waiter.create(lastname: 'Bucky Barnes', restaurant_id: rest_1.id)
wait_3 = Waiter.create(lastname: 'Tony Stark', restaurant_id: rest_2.id)
wait_4 = Waiter.create(lastname: 'Natasha Romanova', restaurant_id: rest_2.id)

table_1 = Table.create(visnumber: 4, waiter_id: wait_1.id, hall_id: hall_1.id, restaurant_id: rest_1.id)
table_2 = Table.create(visnumber: 2, waiter_id: wait_2.id, hall_id: hall_2.id, restaurant_id: rest_1.id)
table_3 = Table.create(visnumber: 6, waiter_id: wait_1.id, hall_id: hall_1.id, restaurant_id: rest_1.id)
table_4 = Table.create(visnumber: 2, waiter_id: wait_2.id, hall_id: hall_2.id, restaurant_id: rest_1.id)
table_5 = Table.create(visnumber: 5, waiter_id: wait_3.id, hall_id: hall_3.id, restaurant_id: rest_2.id)
table_6 = Table.create(visnumber: 4, waiter_id: wait_4.id, hall_id: hall_4.id, restaurant_id: rest_2.id)
table_7 = Table.create(visnumber: 2, waiter_id: wait_3.id, hall_id: hall_3.id, restaurant_id: rest_2.id)
table_8 = Table.create(visnumber: 2, waiter_id: wait_4.id, hall_id: hall_4.id, restaurant_id: rest_2.id)

menu_1 = Menu.create(cuisine: 'Snacks')
menu_2 = Menu.create(cuisine: 'Beverages')
menu_3 = Menu.create(cuisine: 'First dishes')
menu_4 = Menu.create(cuisine: 'Main dishes')
menu_5 = Menu.create(cuisine: 'Desserts')

item_1  = Item.create(description: 'Waterzooi', price: 10, menu_id: menu_1.id, restaurant_id: rest_1.id)
item_2  = Item.create(description: 'Blanche de Bruxelles ', price: 8, menu_id: menu_2.id, restaurant_id: rest_1.id)
item_3  = Item.create(description: 'Mushroom cream soup', price: 12, menu_id: menu_3.id, restaurant_id: rest_1.id)
item_4  = Item.create(description: 'Moules-frites', price: 22, menu_id: menu_4.id, restaurant_id: rest_1.id)
item_5  = Item.create(description: 'Waffle', price: 15, menu_id: menu_5.id, restaurant_id: rest_1.id)
item_6  = Item.create(description: 'Jamon', price: 16, menu_id: menu_1.id, restaurant_id: rest_2.id)
item_7  = Item.create(description: 'Prado Enea', price: 12, menu_id: menu_2.id, restaurant_id: rest_2.id)
item_8  = Item.create(description: 'Gazpacho', price: 10, menu_id: menu_3.id, restaurant_id: rest_2.id)
item_9  = Item.create(description: 'Paella', price: 20, menu_id: menu_4.id, restaurant_id: rest_2.id)
item_10 = Item.create(description: 'Crema Catalana', price: 14, menu_id: menu_5.id, restaurant_id: rest_2.id)
item_11 = Item.create(description: 'Pretzels', price: 12, menu_id: menu_1.id, restaurant_id: rest_1.id)
item_12 = Item.create(description: 'Palm ', price: 12, menu_id: menu_2.id, restaurant_id: rest_1.id)
item_13 = Item.create(description: 'Soup with chestnuts', price: 15, menu_id: menu_3.id, restaurant_id: rest_1.id)
item_14 = Item.create(description: 'Carbonade flamande', price: 25, menu_id: menu_4.id, restaurant_id: rest_1.id)
item_15 = Item.create(description: 'Oliebol', price: 16, menu_id: menu_5.id, restaurant_id: rest_1.id)
item_16 = Item.create(description: 'Empanadas', price: 15, menu_id: menu_1.id, restaurant_id: rest_2.id)
item_17 = Item.create(description: 'Prado Enea', price: 15, menu_id: menu_2.id, restaurant_id: rest_2.id)
item_18 = Item.create(description: 'Ajoblanco', price: 20, menu_id: menu_3.id, restaurant_id: rest_2.id)
item_19 = Item.create(description: 'Tortilla', price: 25, menu_id: menu_4.id, restaurant_id: rest_2.id)
item_20 = Item.create(description: 'Churros Con Chocolate', price: 16, menu_id: menu_5.id, restaurant_id: rest_2.id)
