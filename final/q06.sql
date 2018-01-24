select movie_title, movie_year, movie_cost
from movie
where movie_title like '%hope%' or
movie_title like '%Hope%'
order by movie_title asc