2) Дать список клиентов фирмы “ProTur”, заказавших путевки на тур “Римские каникулы”.

SELECT * FROM client 
WHERE IdC IN 
(SELECT idC FROM zakaz as z 
WHERE z.idP IN (SELECT idP FROM putev WHERE idT = 5))

