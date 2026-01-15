#문제 1: 'orders' 테이블에서 연도별 주문 건수가 100건을 초과하는 
-- 연도를 조회하세요. (orderDate와 orderNumber 컬럼 사용)

SELECT YEAR(orderDate), COUNT(orderNumber)
FROM orders
GROUP BY YEAR(orderDate)
HAVING COUNT(orderNumber) > 100;
