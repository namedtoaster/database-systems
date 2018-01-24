select movie_num, m.movie_genre, 
(select round(avg(movie_cost), 2)
from movie
where movie_genre = m.movie_genre
group by movie_genre) as "Average Cost"
, movie_cost,
round(((movie_cost - (select round(avg(movie_cost), 2)
from movie
where movie_genre = m.movie_genre
group by movie_genre)) /
(select round(avg(movie_cost), 2)
from movie
where movie_genre = m.movie_genre
group by movie_genre) * 100), 2) as "Percent Difference"
from movie m
order by movie_num