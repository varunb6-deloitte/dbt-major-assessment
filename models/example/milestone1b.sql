WITH Cte AS
(
    SELECT 
        nav_date,f.category as category,nav,
        ROW_NUMBER() OVER(partition by f.category ORDER BY nav ASC) RN1,
        ROW_NUMBER() OVER(partition by f.category ORDER BY nav DESC) RN2
        FROM 
    "MAJORASSIGNMENT"."MAJORASSIGNMENT"."NAVHISTORY" n join "MAJORASSIGNMENT"."MAJORASSIGNMENT"."MUTUALFUND" m
    on n.code=m.code 
    join "MAJORASSIGNMENT"."MAJORASSIGNMENT"."FUNDCATEGORY" f
    on m.category=f.id
)
SELECT category,
	   MAX(CASE WHEN RN2=1 THEN nav END) maxnav,
	   MAX(CASE WHEN RN2=1 THEN nav_date END) maxnavdate,
	   MAX(CASE WHEN RN1=1 THEN nav END) minnav,
	   MAX(CASE WHEN RN1=1 THEN nav_date END) minnavdate
FROM CTE WHERE RN1=1 OR RN2=1
GROUP BY category 
order by category
