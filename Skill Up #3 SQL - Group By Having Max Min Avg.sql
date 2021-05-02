-- Group by, Having, nested select
SELECT 
	customer_id,
    product_id,
    subscription_date
FROM Subscription 
WHERE customer_id IN 
	(SELECT 
    	customer_id 
     FROM Subscription 
     GROUP BY customer_id 
     HAVING COUNT(customer_id) > 1
  	) 
ORDER BY customer_id ASC;


-- Join with Group by and Having
SELECT b.name,
	   b.address,
       b.phone, 
       a.product_id, 
       a.subscription_date 
FROM subscription a 
JOIN customer b 
ON a.customer_id=b.id
WHERE b.id IN 
(
	SELECT 
    	customer_id 
        FROM Subscription 
    GROUP BY customer_id 
    HAVING COUNT(customer_id) > 1
) 
ORDER BY b.id ASC;

-- Max, Min, Avg in Having
-- Max
SELECT product_id, MAX(total_price) AS total FROM invoice GROUP BY product_id;
SELECT product_id, MAX(total_price) AS total_over_1000000 FROM invoice GROUP BY product_id HAVING MAX(total_price) > 1000000;
SELECT product_id, MAX(pinalty) AS pinalty FROM invoice GROUP BY product_id HAVING MAX(pinalty) > 30000;

-- Min
SELECT product_id, MIN(total_price) AS total FROM invoice GROUP BY product_id;
SELECT product_id, MIN(total_price) AS total FROM invoice GROUP BY product_id HAVING MIN(total_price) < 500000;
SELECT product_id, MIN(pinalty) AS total FROM invoice GROUP BY product_id HAVING MIN(pinalty) < 50000;

-- Avg
SELECT product_id, AVG(total_price) AS total FROM invoice GROUP BY product_id;
SELECT product_id, AVG(total_price) AS total FROM invoice GROUP BY product_id HAVING AVG(total_price) > 100000;
SELECT product_id, AVG(pinalty) AS total FROM invoice GROUP BY product_id HAVING AVG(pinalty) > 30000;

-- Practice
SELECT product_id, AVG(pinalty), COUNT(customer_id) AS total FROM invoice GROUP BY product_id HAVING COUNT(customer_id) > 20;