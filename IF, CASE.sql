-- IF / CASE -- 

# 문제 5. products' 테이블을 사용하여, 상품별로 가격이 $100을 초과하면 'Expensive'로, 
# 그렇지 않으면 'Cheap'으로 표시하는 쿼리를 작성하세요. 
# (products.productName, products.buyPrice 컬럼 사용)

SELECT productname, buyprice, 
case
	when buyprice > 100 then 'Expensive'
	ELSE 'Cheap'
END AS price_category
FROM products;

#  문제 6. employees' 테이블을 사용하여, 각 직원의 직책(jobTitle)에 따라 다음과 같이 분류하세요:
# 'Sales Rep': 'Sales Team'# 'VP Sales': 'Management'
# 'VP Marketing': 'Management'
# 그 외: 'Other Positions'

SELECT firstname, lastname, jobtitle,
case jobtitle
when 'Sales Rep' then 'Sales Team'
when 'VP Sales' then 'Management'
when 'VP Marketing' then 'Management'
ELSE 'Other Positions'
END AS POSITIONcategory
FROM employees;


-- JOIN -- 

# 조인을 위한 데이터 생성
CREATE TABLE ex3(
	`id` TINYINT,
	`NAME` VARCHAR(10),
	`age` TINYINT
)
;
INSERT INTO ex3
	(`id`, `name`, `age`)
VALUES
	(1,'이상훈',34),
	(2,'박상훈',30),
	(3,'최상훈',20)
;
CREATE TABLE ex4(
	`id` TINYINT,
	`region` VARCHAR(10)
)
;
INSERT INTO ex4
	(`id`, `region`)
VALUES
	(1,'서울'),
	(4,'대구'),
	(5,'부산')
;



#inner join
SELECT * 
FROM ex3
JOIN ex4 ON ex3.id = ex4.id
;

#left join
SELECT * 
FROM ex3
left JOIN ex4 ON ex3.id = ex4.id
;

#left join2
SELECT * 
FROM ex3
left JOIN ex4 ON ex3.id = ex4.id
WHERE ex4.id IS null
;

#RIGHT join
SELECT * 
FROM ex3
RIGHT JOIN ex4 ON ex3.id = ex4.id
;

#RIGHT join2
SELECT * 
FROM ex3
RIGHT JOIN ex4 ON ex3.id = ex4.id
WHERE ex3.id IS NULL;


SELECT ex4.id
FROM ex3
RIGHT JOIN ex4 ON ex3.id = ex4.id
WHERE ex3.id IS NULL;


SELECT id FROM ex3
UNION
SELECT id FROM ex4;

SELECT id FROM ex3
UNION ALL
SELECT id FROM ex4;

#FULL OUTER JOIN
SELECT ex3.id, ex3.name, ex3.age, ex4.id, ex4.region
FROM ex3
left JOIN ex4 ON ex3.id = ex4.id
union
SELECT ex3.id, ex3.name, ex3.age, ex4.id, ex4.region
FROM ex3
RIGHT JOIN ex4 ON ex3.id = ex4.id
WHERE ex3.id IS NULL;

#문제 7 'customers' 테이블과 'orders' 테이블을 사용하여, 
#모든 고객의 이름과 주문 번호를 조회하세요.

#내 풀이
SELECT c.customername, o.ordernumber 
#customers 테이블의 customerName과 orders 테이블의 orderNumber를 조회
FROM customers c 
#customers 테이블을 기준 테이블로 사용하고 별칭을 c로 지정
JOIN orders o ON c.customerNumber = o.customerNumber; 
#orders 테이블을 o라는 별칭으로 JOIN
#c.customerNumber와 o.customerNumber가 같은 행만 조회


#문제 8 'products' 테이블과 'orderdetails' 테이블을 사용하여, 상품 이름과 주문된 수량을 조회하세요.

#내 풀이
SELECT p.productName, o.quantityOrdered 
FROM products p
JOIN orderdetails o ON p.productcode = o.productCode;

#정답
SELECT p.productName, od.quantityOrdered
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode;



#문제 9. 'employees' 테이블과 'customers' 테이블을 사용하여, 
#'Leslie'이라는 이름을 가진 직원이 담당하는 모든 고객의 이름을 조회하세요.

#내 풀이
SELECT e.firstName, c.customerName
FROM employees e
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
WHERE e.firstName = 'Leslie';

#정답
SELECT c.customerName
FROM employees e
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
WHERE e.firstName = 'Leslie';
