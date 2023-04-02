---
title: SQL 基础
categories:
  - 计算机
  - SQL
mathjax: true
abbrlink: 19528
description: 'SELECT, LIKE, GROUP BY, Aggregate functions...'
date: 2022-08-20 17:21:25
---
## SELECT
```sql
SELECT COUNT(DISTINCT Country) FROM Customers;

SELECT * FROM Customers WHERE not (Country='Germany' and city='Berlin');

SELECT * FROM Customers WHERE Country IN (SELECT Country FROM Suppliers);
```

## LIKE

`%`: zero, one or multiple char

`_`: a single char
```sql
SELECT * FROM Customers WHERE lower(CustomerName) LIKE 'a%';

SELECT * FROM Customers WHERE city LIKE '____';
```

## GROUP BY
```sql
SELECT ...
FROM ...
WHERE ...
GROUP BY ...
ORDER BY ... ASC / DESC;
```

## Aggregate functions
```sql
Min(), Max(), Count(), Sum(), Avg()
```

```sql
SELECT avg(sum_id) as avg_spend_per_orderid
FROM
(SELECT order_id, sum(spend) as sum_id
FROM example
GROUP BY 1)
```

## HAVING
```sql
SELECT ...
FROM ...
WHERE ...
GROUP BY ...
HAVING ...
ORDER BY ...
```
```sql
SELECT Country, count(CustomerID)
FROM Customers
WHERE Country in ('Brazil', 'France', 'USA')
GROUP BY Country
HAVING count(CustomerID) > 5;
```

## UNION
```sql
SELECT Country FROM Customers
UNION (ALL)
SELECT Country FROM Suppliers
ORDER BY 1;
```

## WITH
```sql
WITH cate15 as (
  SELECT categoryid, productid
  FROM products
  WHERE categoryid BETWEEN 1 and 5
),
od15 as (
  SELECT * FROM orderdetails
)

SELECT * FROM od15 
WHERE productid in (SELECT productid from cate15)
```

## Windows function
```sql
row_number() over(partition by ... order by ...)
```
```sql
SELECT category, product, sales, row_num
FROM (
  SELECT category, product, sales, 
  row_number() over(partition by category order by sales desc) as row_num
  FROM tab
)
WHERE row_num <= 2
```
```sql
SELECT 
categoryid, productid, price, 
sum(price) over(partition by categoryid order by productid) as cum_sum
FROM products
order by 1,2;
```
`lag()`: above, `lead()`: below
```sql
SELECT *,
lag(birthdate, 1) over(order by birthdate),
lead(birthdate, 2) over(order by birthdate)
FROM employees;
```

## CASE WHEN
```sql
SELECT Country,
       case when country in ('USA') then 'America'
            when country in ('Mexico') then 'emerging markets'
            else 'other markets' end as country_flag
FROM customers;
```