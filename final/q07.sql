select movie_num, movie_title, movie_cost, movie_genre
from movie
where (movie_genre = 'ACTION' and movie_cost < 50) or
(movie_genre = 'COMEDY' and movie_cost < 50)
order by movie_genre