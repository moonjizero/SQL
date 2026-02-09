#문제 1: 'orders' 테이블에서 연도별 주문 건수가 100건을 초과하는 
-- 연도를 조회하세요. (orderDate와 orderNumber 컬럼 사용)

SELECT YEAR(orderDate), COUNT(orderNumber)
FROM orders
GROUP BY YEAR(orderDate)
HAVING COUNT(orderNumber) > 100;



# 문제 2: 'orderdetails' 테이블에서 상품별  총 주문량이 500개 이상인 상품 코드를 조회하세요. 
-- (productCode와 quantityOrdered 컬럼 사용)

SELECT productCode, SUM(quantityordered) AS sumqo
FROM orderdetails
GROUP BY productCode
HAVING sumqo >= 500;



# 문제 3: 'payments' 테이블에서 고객별 총 결제 금액이 $10,000을 초과하는 고객 번호를 조회하세요. 
-- (customerNumber와 amount 컬럼 사용)

SELECT customerNumber, sum(amount) AS sam
FROM payments
GROUP BY customerNumber
HAVING sam >= 10000;
#새롭게 배운 것: 집계 함수와 일반 컬럼을 같이 쓰려면 반드시 GROUP BY가 필요하다.



#문제 4: 'customers' 테이블에서 국가별 고객 수가 10명 이상인 국가를 조회하세요. 
-- (country와 customerNumber 컬럼 사용)

SELECT country, COUNT(customerNumber) AS Ccn
from customers
GROUP BY country
HAVING Ccn >= 10;


