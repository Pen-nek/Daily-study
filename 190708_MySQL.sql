/**/
show databases;

use world;

show tables;

desc city;

SELECT * 
	FROM city 
	WHERE POPULATION >= 5000000 
	ORDER BY population DESC;
    
use world;
show tables;
desc country;
desc countrylanguage;