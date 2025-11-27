USE movie_booking;
select*from booking;
SELECT * FROM customer;
SELECT * FROM movie;
SELECT * FROM payment;
SELECT * FROM showes;
SELECT * FROM theatre;
SELECT * FROM movie
WHERE YEAR(ReleaseDate) = '2024';
SELECT * FROM movie;
SELECT Title,Genre FROM movie;
 SELECT DISTINCT Genre FROM movie;
 SELECT * FROM customer
WHERE City = "Chennai";
SELECT * FROM booking
WHERE SeatsBooked > 3;
SELECT * FROM payment
WHERE Status = "Pending";
SELECT * FROM movie
WHERE ReleaseDate BETWEEN '2023-01-01' AND '2024-01-01';
SELECT * FROM showes
WHERE TicketPrice BETWEEN 200 AND 400;
SELECT * FROM customer
WHERE Name LIKE "C%";
SELECT * FROM movie
ORDER BY ReleaseDate ASC;
SELECT * FROM booking
ORDER BY BookingDate DESC;
SELECT CustomerID,SUM(SeatsBooked) AS TOTAL_SEATSBOOKED
FROM booking
GROUP  BY CustomerID;
SELECT PaymentID,SUM(Amount) AS TOTAL_AMOUNT_PAID
FROM payment
GROUP BY PaymentID;
SELECT ShowID,COUNT(BookingID) AS NUMBER_OF_BOOKINGS
FROM booking
GROUP BY ShowID;
SELECT CustomerID,COUNT(DISTINCT ShowID) AS NumberOfShows
FROM booking
GROUP BY CustomerID
HAVING COUNT(DISTINCT ShowID) > 2;
SELECT ShowID,SUM( DISTINCT SeatsBooked) AS TOTAL_SEATS_BOOKED
FROM booking
GROUP BY ShowID
HAVING SUM(DISTINCT SeatsBooked) > 10;
DELETE FROM booking
WHERE BookingID = 5;
SELECT * FROM booking;
SELECT * FROM customer
LIMIT 5;
SELECT * FROM customer
LIMIT 5 OFFSET 5;
SELECT * FROM customer
WHERE CustomerID IN (SELECT CustomerID FROM bookings WHERE ShowID IN (SELECT ShowID FROM shows WHERE TicketPrice > 400));
SELECT * FROM booking;
SELECT * FROM movie;
SELECT * FROM showes;
SELECT *
FROM movie
WHERE MovieID IN (SELECT MovieID FROM shows WHERE ShowID IN (SELECT ShowID FROM bookings GROUP BY ShowID HAVING SUM(SeatsBooked) > 10));
SELECT * FROM customers as c
INNER JOIN booking as b
ON c.CustomerID = b.BookingID;
SELECT s.ShowID, s.ShowDate, s.TicketPrice, m.MovieID, m.Title
FROM showes AS s
LEFT JOIN movie AS m
ON s.MovieID = m.MovieID;
SELECT b.BookingID, b.CustomerID, b.ShowID, b.SeatsBooked,
       p.PaymentID, p.Amount, p.PaymentDate, p.PaymentMethod
FROM Booking AS b
RIGHT JOIN Payment AS p
ON b.BookingID = p.BookingID;
SELECT m.Title,t.Name,s.ShowDate
FROM Shows AS s
INNER JOIN Movie AS m 
ON s.MovieID = m.MovieID
INNER JOIN Theatres AS t 
ON s.TheatreID = t.TheatreID;
SELECT s.TheatreID, SUM(p.Amount) AS Total_Revenue
FROM Payment AS p
INNER JOIN Bookings AS b
 ON p.BookingID = b.BookingID
INNER JOIN Shows AS s 
ON b.ShowID = s.ShowID
GROUP BY s.TheatreID;