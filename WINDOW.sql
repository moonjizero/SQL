#문제20: "orderdetails" 테이블에서 각 주문orderdetails별로 주문된 제품의 평균 수량("quantityOrdered")을 
#계산하세요.

#내 풀이

SELECT ordernumber, productCode, 
		AVG(quantityOrdered) OVER (PARTITION by ordernumber) AS AVG
FROM orderdetails 
;



#정답
SELECT orderNumber, productCode, 
       AVG(quantityOrdered) OVER (PARTITION BY orderNumber) AS avg_quantity_per_order
FROM orderdetails;
