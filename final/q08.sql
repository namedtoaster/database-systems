select movie_num, (movie_title || ' ' || '(' || movie_year || ')' || movie_genre) as "Movie Description"
from movie