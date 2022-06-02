select 
f.category,month(nav_date) as mon,
avg(nav) as avg_nav,avg(repurchase_price) as avg_repurchase_price,
avg(sale_price) as avg_sale_price
FROM 
"MAJORASSIGNMENT"."MAJORASSIGNMENT"."NAVHISTORY" n join "MAJORASSIGNMENT"."MAJORASSIGNMENT"."MUTUALFUND" m
on n.code=m.code 
join "MAJORASSIGNMENT"."MAJORASSIGNMENT"."FUNDCATEGORY" f
on m.category=f.id 
group by f.category,mon 
order by f.category,mon