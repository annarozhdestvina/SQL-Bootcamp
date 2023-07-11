update menu
set 
  price = (select menu.price from menu where menu.pizza_name = 'greek pizza') * 0.9
where
    pizza_name = 'greek pizza';