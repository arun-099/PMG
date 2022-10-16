USE pmg;

CREATE TABLE store_revenue ( id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, DATE DATETIME, brand_id INT, store_location VARCHAR(250), revenue FLOAT);

CREATE TABLE marketing_data ( id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, DATE DATETIME, geo VARCHAR(2), impressions FLOAT, clicks FLOAT );


SELECT * FROM store_revenue;
SELECT * FROM marketing_data;

# Question #1 Generate a query to get the sum of the clicks of the marketing data​
SELECT SUM(clicks) AS sum_of_clicks FROM marketing_data;
# Question #2 Generate a query to gather the sum of revenue by store_location from the store_revenue table​
SELECT SUM(revenue),store_location FROM store_revenue GROUP BY store_location;
# Question #3 Merge these two datasets so we can see impressions, clicks, and revenue together by date and geo. Please ensure all records from each table are accounted for.​
SELECT SUM(R.revenue),S.impressions ,S.clicks FROM store_revenue R JOIN marketing_data S ON S.id=R.id GROUP BY S.geo,S.date;

# Question #4 In your opinion, what is the most efficient store and why?​
# Location, marketing, store layout and appearance are the elements to a successful retail business.

# Question #5 (Challenge) Generate a query to rank in order the top 10 revenue producing states​
SELECT store_location FROM (SELECT store_location,DENSE_RANK() OVER (ORDER BY revenue DESC) AS rownum FROM store_revenue) AS rownum WHERE rownum <=10;

