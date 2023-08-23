create unique index idx_menu_unique on menu (pizzeria_id, pizza_name);
set enable_seqscan = off;
explain analyse select pizzeria_id, pizza_name from menu where pizzeria_id = 1 
or pizza_name = 'supreme pizza';