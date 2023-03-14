/*For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list. 
If only 1 person is named 'Leo' then include them in the output.*/

SELECT first_name
from patients
GROUP BY first_name
HAVING COUNT(first_name) = 1;
