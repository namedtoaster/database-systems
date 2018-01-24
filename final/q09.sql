select movie_genre, avg(price_rentfee)
from movie m join price p
on m.price_code = p.price_code
group by movie_genre