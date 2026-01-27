# 문제 5. products' 테이블을 사용하여, 상품별로 가격이 $100을 초과하면 'Expensive'로, 그렇지 않으면 'Cheap'으로 표시하는 쿼리를 작성하세요. (products.productName, products.buyPrice 컬럼 사용)



--  문제 6. employees' 테이블을 사용하여, 각 직원의 직책(jobTitle)에 따라 다음과 
-- 같이 분류하세요:
-- 'Sales Rep': 'Sales Team'
-- 'VP Sales': 'Management'
-- 'VP Marketing': 'Management'
-- 그 외: 'Other Positions'

SELECT firstname, lastname, jobtitle,
case jobtitle
when 'Sales Rep' then 'Sales Team'
when 'VP Sales' then 'Management'
when 'VP Marketing' then 'Management'
ELSE 'Other Positions'
END AS POSITIONcategory
FROM employees;

