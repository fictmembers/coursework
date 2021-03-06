# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = Administrator.create(login: 'admin', password: '111111', password_confirmation: '111111')
rest_1 =  Restaurant.create(name: 'Hof Van Cleve', address: 'Riemegemstraat,  1, 9770 Kruishoutem, Belgium', lang: 'en', tel: '+3293835848')
rest_2 =  Restaurant.create(name: 'El Celler de Can Roca', address: 'Calle Can Sunyer, 48, 17007 Girona, Spain', lang: 'en', tel: '+34972222157')

man_1 = Manager.create(lastname: 'Phillip Coulson', lang: 'en', restaurant_id: rest_1.id)
man_2 = Manager.create(lastname: 'Nick Fury', lang: 'en', restaurant_id: rest_2.id)
man_3 = Manager.create(lastname: 'Фил Коулсон', lang: 'ru', restaurant_id: rest_1.id)
man_4 = Manager.create(lastname: 'Ник Фьюри', lang: 'ru', restaurant_id: rest_2.id)

cash_1 = Cashier.create(lastname: 'Bruce Banner', lang: 'en', restaurant_id: rest_1.id)
cash_2 = Cashier.create(lastname: 'Thor', lang: 'en', restaurant_id: rest_2.id)
cash_3 = Cashier.create(lastname: 'Брюс Беннер', lang: 'ru', restaurant_id: rest_1.id)
cash_4 = Cashier.create(lastname: 'Тор', lang: 'ru', restaurant_id: rest_2.id)

chef_1 = Chef.create(lastname: 'Sam Wilson', lang: 'en', restaurant_id: rest_1.id)
chef_2 = Chef.create(lastname: 'James Rhodes', lang: 'en', restaurant_id: rest_1.id)
chef_3 = Chef.create(lastname: 'Pietro Maximoff', lang: 'en', restaurant_id: rest_2.id)
chef_4 = Chef.create(lastname: 'Wanda Maximoff', lang: 'en', restaurant_id: rest_2.id)
chef_5 = Chef.create(lastname: 'Сэм Уилсон', lang: 'ru', restaurant_id: rest_1.id)
chef_6 = Chef.create(lastname: 'Джеймс Роудс', lang: 'ru', restaurant_id: rest_1.id)
chef_7 = Chef.create(lastname: 'Пьетро Максимофф', lang: 'ru', restaurant_id: rest_2.id)
chef_8 = Chef.create(lastname: 'Ванда Максимофф', lang: 'ru', restaurant_id: rest_2.id)

cust_1 = Customer.create(lastname: 'Clark Kent')
cust_2 = Customer.create(lastname: 'Bruce Wayne')
cust_3 = Customer.create(lastname: 'Joker')
cust_4 = Customer.create(lastname: 'Diana Prince')
cust_5 = Customer.create(lastname: 'Bane')
cust_6 = Customer.create(lastname: 'Floyd Lawton')
cust_7 = Customer.create(lastname: 'Harley Quinn')
cust_8 = Customer.create(lastname: 'Jonathan Crane')
cust_9 = Customer.create(lastname: 'Waylon Jones')
cust_10 = Customer.create(lastname: 'Jason Todd')

hall_1 = Hall.create(hall_type: 'For smokers', lang: 'en', restaurant_id: rest_1.id)
hall_2 = Hall.create(hall_type: 'For non-smokers', lang: 'en', restaurant_id: rest_1.id)
hall_3 = Hall.create(hall_type: 'For non-smokers', lang: 'en', restaurant_id: rest_2.id)
hall_4 = Hall.create(hall_type: 'For visitors with children', lang: 'en', restaurant_id: rest_2.id)
hall_5 = Hall.create(hall_type: 'Для курящих', lang: 'ru', restaurant_id: rest_1.id)
hall_6 = Hall.create(hall_type: 'Для некурящих', lang: 'ru', restaurant_id: rest_1.id)
hall_7 = Hall.create(hall_type: 'Для некуращих', lang: 'ru', restaurant_id: rest_2.id)
hall_8 = Hall.create(hall_type: 'Для посетителей с детьми', lang: 'ru', restaurant_id: rest_2.id)

host_1 = Hostess.create(lastname: 'Jarvis', lang: 'en', restaurant_id: rest_1.id, hall_id: hall_1.id)
host_2 = Hostess.create(lastname: 'Maria Hill', lang: 'en', restaurant_id: rest_1.id, hall_id: hall_2.id)
host_3 = Hostess.create(lastname: 'Vision', lang: 'en', restaurant_id: rest_2.id, hall_id: hall_3.id)
host_4 = Hostess.create(lastname: 'Ultron', lang: 'en', restaurant_id: rest_2.id, hall_id: hall_4.id)
host_5 = Hostess.create(lastname: 'Джарвис', lang: 'ru', restaurant_id: rest_1.id, hall_id: hall_5.id)
host_6 = Hostess.create(lastname: 'Мария Хилл', lang: 'ru', restaurant_id: rest_1.id, hall_id: hall_6.id)
host_7 = Hostess.create(lastname: 'Вижн', lang: 'ru', restaurant_id: rest_2.id, hall_id: hall_7.id)
host_8 = Hostess.create(lastname: 'Альтрон', lang: 'ru', restaurant_id: rest_2.id, hall_id: hall_8.id)

wait_1 = Waiter.create(lastname: 'Steve Rogers', lang: 'en', restaurant_id: rest_1.id)
wait_2 = Waiter.create(lastname: 'Bucky Barnes', lang: 'en', restaurant_id: rest_1.id)
wait_3 = Waiter.create(lastname: 'Tony Stark', lang: 'en', restaurant_id: rest_2.id)
wait_4 = Waiter.create(lastname: 'Natasha Romanova', lang: 'en', restaurant_id: rest_2.id)
wait_5 = Waiter.create(lastname: 'Стив Роджерс', lang: 'ru', restaurant_id: rest_1.id)
wait_6 = Waiter.create(lastname: 'Баки Барнс', lang: 'ru', restaurant_id: rest_1.id)
wait_7 = Waiter.create(lastname: 'Тони Старк', lang: 'ru', restaurant_id: rest_2.id)
wait_8 = Waiter.create(lastname: 'Наташа Романова', lang: 'ru', restaurant_id: rest_2.id)

order_1 = Order.create(restaurant_id: rest_1.id, customer_id: cust_1.id, waiter_id: wait_1.id, manager_id: man_1.id, chef_id: chef_1.id)
order_2 = Order.create(restaurant_id: rest_1.id, customer_id: cust_1.id, waiter_id: wait_5.id, manager_id: man_3.id, chef_id: chef_5.id, lang: 'ru')
order_3 = Order.create(restaurant_id: rest_2.id, customer_id: cust_2.id, waiter_id: wait_3.id, manager_id: man_2.id, chef_id: chef_3.id)
order_4 = Order.create(restaurant_id: rest_2.id, customer_id: cust_2.id, waiter_id: wait_7.id, manager_id: man_4.id, chef_id: chef_7.id, lang: 'ru')
order_5 = Order.create(restaurant_id: rest_1.id, customer_id: cust_3.id, waiter_id: wait_2.id, manager_id: man_1.id, chef_id: chef_2.id)
order_6 = Order.create(restaurant_id: rest_1.id, customer_id: cust_3.id, waiter_id: wait_6.id, manager_id: man_3.id, chef_id: chef_6.id, lang: 'ru')
order_7 = Order.create(restaurant_id: rest_2.id, customer_id: cust_4.id, waiter_id: wait_1.id, manager_id: man_2.id, chef_id: chef_8.id)
order_8 = Order.create(restaurant_id: rest_2.id, customer_id: cust_4.id, waiter_id: wait_5.id, manager_id: man_4.id, chef_id: chef_4.id, lang: 'ru')
order_9 = Order.create(restaurant_id: rest_2.id, customer_id: cust_5.id, waiter_id: wait_1.id, manager_id: man_2.id, chef_id: chef_8.id)
order_10 = Order.create(restaurant_id: rest_2.id, customer_id: cust_5.id, waiter_id: wait_5.id, manager_id: man_4.id, chef_id: chef_4.id, lang: 'ru')
order_11 = Order.create(restaurant_id: rest_1.id, customer_id: cust_5.id, waiter_id: wait_1.id, manager_id: man_1.id, chef_id: chef_1.id)
order_12 = Order.create(restaurant_id: rest_1.id, customer_id: cust_5.id, waiter_id: wait_5.id, manager_id: man_3.id, chef_id: chef_5.id, lang: 'ru')
order_13 = Order.create(restaurant_id: rest_2.id, customer_id: cust_6.id, waiter_id: wait_3.id, manager_id: man_2.id, chef_id: chef_3.id)
order_14 = Order.create(restaurant_id: rest_2.id, customer_id: cust_6.id, waiter_id: wait_7.id, manager_id: man_4.id, chef_id: chef_7.id, lang: 'ru')
order_15 = Order.create(restaurant_id: rest_1.id, customer_id: cust_8.id, waiter_id: wait_1.id, manager_id: man_1.id, chef_id: chef_2.id)
order_16 = Order.create(restaurant_id: rest_1.id, customer_id: cust_8.id, waiter_id: wait_5.id, manager_id: man_3.id, chef_id: chef_6.id, lang: 'ru')
order_17 = Order.create(restaurant_id: rest_2.id, customer_id: cust_9.id, waiter_id: wait_3.id, manager_id: man_2.id, chef_id: chef_3.id)
order_18 = Order.create(restaurant_id: rest_2.id, customer_id: cust_9.id, waiter_id: wait_7.id, manager_id: man_4.id, chef_id: chef_7.id, lang: 'ru')
order_19 = Order.create(restaurant_id: rest_2.id, customer_id: cust_10.id, waiter_id: wait_3.id, manager_id: man_2.id, chef_id: chef_3.id)
order_20 = Order.create(restaurant_id: rest_2.id, customer_id: cust_10.id, waiter_id: wait_7.id, manager_id: man_4.id, chef_id: chef_7.id, lang: 'ru')
order_21 = Order.create(restaurant_id: rest_1.id, customer_id: cust_7.id, waiter_id: wait_2.id, manager_id: man_1.id, chef_id: chef_1.id)
order_22 = Order.create(restaurant_id: rest_1.id, customer_id: cust_7.id, waiter_id: wait_6.id, manager_id: man_3.id, chef_id: chef_5.id, lang: 'ru')

table_1 = Table.create(visnumber: 4, waiter_id: wait_1.id, hall_id: hall_1.id, restaurant_id: rest_1.id)
table_2 = Table.create(visnumber: 2, waiter_id: wait_2.id, hall_id: hall_2.id, restaurant_id: rest_1.id)
table_3 = Table.create(visnumber: 6, waiter_id: wait_1.id, hall_id: hall_1.id, restaurant_id: rest_1.id)
table_4 = Table.create(visnumber: 2, waiter_id: wait_2.id, hall_id: hall_2.id, restaurant_id: rest_1.id)
table_5 = Table.create(visnumber: 5, waiter_id: wait_3.id, hall_id: hall_3.id, restaurant_id: rest_2.id)
table_6 = Table.create(visnumber: 4, waiter_id: wait_4.id, hall_id: hall_4.id, restaurant_id: rest_2.id)
table_7 = Table.create(visnumber: 2, waiter_id: wait_3.id, hall_id: hall_3.id, restaurant_id: rest_2.id)
table_8 = Table.create(visnumber: 2, waiter_id: wait_4.id, hall_id: hall_4.id, restaurant_id: rest_2.id)
table_9 = Table.create(visnumber: 4, waiter_id: wait_5.id, hall_id: hall_5.id, restaurant_id: rest_1.id)
table_10 = Table.create(visnumber: 2, waiter_id: wait_6.id, hall_id: hall_6.id, restaurant_id: rest_1.id)
table_11 = Table.create(visnumber: 6, waiter_id: wait_5.id, hall_id: hall_5.id, restaurant_id: rest_1.id)
table_12 = Table.create(visnumber: 2, waiter_id: wait_6.id, hall_id: hall_6.id, restaurant_id: rest_1.id)
table_13 = Table.create(visnumber: 5, waiter_id: wait_7.id, hall_id: hall_7.id, restaurant_id: rest_2.id)
table_14 = Table.create(visnumber: 4, waiter_id: wait_8.id, hall_id: hall_8.id, restaurant_id: rest_2.id)
table_15 = Table.create(visnumber: 2, waiter_id: wait_7.id, hall_id: hall_7.id, restaurant_id: rest_2.id)
table_16 = Table.create(visnumber: 2, waiter_id: wait_8.id, hall_id: hall_8.id, restaurant_id: rest_2.id)

menu_1 = Menu.create(cuisine: 'Snacks', lang: 'en', restaurant_id: 1)
menu_2 = Menu.create(cuisine: 'Beverages', lang: 'en', restaurant_id: 1)
menu_3 = Menu.create(cuisine: 'First dishes', lang: 'en', restaurant_id: 2)
menu_4 = Menu.create(cuisine: 'Main dishes', lang: 'en', restaurant_id: 1)
menu_5 = Menu.create(cuisine: 'Desserts', lang: 'en', restaurant_id: 2)
menu_6 = Menu.create(cuisine: 'Закуски', lang: 'ru', restaurant_id: 1)
menu_7 = Menu.create(cuisine: 'Напитки', lang: 'ru', restaurant_id: 1)
menu_8 = Menu.create(cuisine: 'Первые блюда', lang: 'ru', restaurant_id: 2)
menu_9 = Menu.create(cuisine: 'Основные блюда', lang: 'ru', restaurant_id: 1)
menu_10 = Menu.create(cuisine: 'Дессерты', lang: 'ru', restaurant_id: 2)

item_1  = Item.create(description: 'Waterzooi', price: 10, lang: 'en', menu_id: menu_1.id, restaurant_id: rest_1.id)
item_2  = Item.create(description: 'Blanche de Bruxelles ', price: 8, lang: 'en', menu_id: menu_2.id, restaurant_id: rest_1.id)
item_3  = Item.create(description: 'Mushroom cream soup', price: 12, lang: 'en', menu_id: menu_3.id, restaurant_id: rest_1.id)
item_4  = Item.create(description: 'Moules-frites', price: 22, lang: 'en', menu_id: menu_4.id, restaurant_id: rest_1.id)
item_5  = Item.create(description: 'Belgium Waffle', price: 15, lang: 'en', menu_id: menu_5.id, restaurant_id: rest_1.id)
item_6  = Item.create(description: 'Jamon', price: 16, lang: 'en', menu_id: menu_1.id, restaurant_id: rest_2.id)
item_7  = Item.create(description: 'Prado Enea', price: 12, lang: 'en', menu_id: menu_2.id, restaurant_id: rest_2.id)
item_8  = Item.create(description: 'Gazpacho', price: 10, lang: 'en', menu_id: menu_3.id, restaurant_id: rest_2.id)
item_9  = Item.create(description: 'Paella', price: 20, lang: 'en', menu_id: menu_4.id, restaurant_id: rest_2.id)
item_10 = Item.create(description: 'Crema Catalana', price: 14, lang: 'en', menu_id: menu_5.id, restaurant_id: rest_2.id)
item_11 = Item.create(description: 'Pretzels', price: 12, lang: 'en', menu_id: menu_1.id, restaurant_id: rest_1.id)
item_12 = Item.create(description: 'Palm ', price: 12, lang: 'en', menu_id: menu_2.id, restaurant_id: rest_1.id)
item_13 = Item.create(description: 'Soup with chestnuts', price: 15, lang: 'en', menu_id: menu_3.id, restaurant_id: rest_1.id)
item_14 = Item.create(description: 'Carbonade flamande', price: 25, lang: 'en', menu_id: menu_4.id, restaurant_id: rest_1.id)
item_15 = Item.create(description: 'Oliebol', price: 16, lang: 'en', menu_id: menu_5.id, restaurant_id: rest_1.id)
item_16 = Item.create(description: 'Empanadas', price: 15, lang: 'en', menu_id: menu_1.id, restaurant_id: rest_2.id)
item_17 = Item.create(description: 'Hacienda Monasterio Crianza 2012', price: 15, lang: 'en', menu_id: menu_2.id, restaurant_id: rest_2.id)
item_18 = Item.create(description: 'Ajoblanco', price: 20, lang: 'en', menu_id: menu_3.id, restaurant_id: rest_2.id)
item_19 = Item.create(description: 'Tortilla', price: 25, lang: 'en', menu_id: menu_4.id, restaurant_id: rest_2.id)
item_20 = Item.create(description: 'Churros Con Chocolate', price: 16, lang: 'en', menu_id: menu_5.id, restaurant_id: rest_2.id)
item_21  = Item.create(description: 'Ватерзой', price: 10, lang: 'ru', menu_id: menu_6.id, restaurant_id: rest_1.id)
item_22  = Item.create(description: 'Blanche de Bruxelles (0.5 L)', price: 8, lang: 'ru', menu_id: menu_7.id, restaurant_id: rest_1.id)
item_23  = Item.create(description: 'Грибной крем-суп', price: 12, lang: 'ru', menu_id: menu_8.id, restaurant_id: rest_1.id)
item_24  = Item.create(description: 'Мидии', price: 22, lang: 'ru', menu_id: menu_9.id, restaurant_id: rest_1.id)
item_25  = Item.create(description: 'Бальгийские вафли', price: 15, lang: 'ru', menu_id: menu_10.id, restaurant_id: rest_1.id)
item_26  = Item.create(description: 'Хамон', price: 16, lang: 'ru', menu_id: menu_6.id, restaurant_id: rest_2.id)
item_27  = Item.create(description: 'Predo Enea (0.75 L)', price: 12, lang: 'ru', menu_id: menu_7.id, restaurant_id: rest_2.id)
item_28  = Item.create(description: 'Гаспаччо', price: 10, lang: 'ru', menu_id: menu_8.id, restaurant_id: rest_2.id)
item_29  = Item.create(description: 'Паэлья', price: 20, lang: 'ru', menu_id: menu_9.id, restaurant_id: rest_2.id)
item_30 = Item.create(description: 'Каталонский крем', price: 14, lang: 'ru', menu_id: menu_10.id, restaurant_id: rest_2.id)
item_31 = Item.create(description: 'Брецель', price: 12, lang: 'ru', menu_id: menu_6.id, restaurant_id: rest_1.id)
item_32 = Item.create(description: 'Palm (0.33 L)', price: 12, lang: 'ru', menu_id: menu_7.id, restaurant_id: rest_1.id)
item_33 = Item.create(description: 'Суп из каштанов', price: 15, lang: 'ru', menu_id: menu_8.id, restaurant_id: rest_1.id)
item_34 = Item.create(description: 'Говядина по-фламандски', price: 25, lang: 'ru', menu_id: menu_9.id, restaurant_id: rest_1.id)
item_35 = Item.create(description: 'Бельгийские почики', price: 16, lang: 'ru', menu_id: menu_10.id, restaurant_id: rest_1.id)
item_36 = Item.create(description: 'Эмпанада', price: 15, lang: 'ru', menu_id: menu_6.id, restaurant_id: rest_2.id)
item_37 = Item.create(description: 'Hacienda Monasterio Crianza (0.75 L)', price: 15, lang: 'ru', menu_id: menu_7.id, restaurant_id: rest_2.id)
item_38 = Item.create(description: 'Ахобланко', price: 20, lang: 'ru', menu_id: menu_8.id, restaurant_id: rest_2.id)
item_39 = Item.create(description: 'Тортилья', price: 25, lang: 'ru', menu_id: menu_9.id, restaurant_id: rest_2.id)
item_40 = Item.create(description: 'Чуррос с шоколадом', price: 16, lang: 'ru', menu_id: menu_10.id, restaurant_id: rest_2.id)
