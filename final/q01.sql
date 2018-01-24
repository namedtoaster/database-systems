BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE membership';
  EXECUTE IMMEDIATE 'DROP TABLE rental';
  EXECUTE IMMEDIATE 'DROP TABLE detailrental';
  EXECUTE IMMEDIATE 'DROP TABLE price';
  EXECUTE IMMEDIATE 'DROP TABLE movie';
  EXECUTE IMMEDIATE 'DROP TABLE video';
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('');
END;
/
CREATE TABLE membership
(
  mem_num NUMBER(3) NOT NULL,
  mem_fname VARCHAR2(20) NOT NULL,
  mem_lname VARCHAR2(20) NOT NULL,
  mem_street VARCHAR2(30) NOT NULL,
  mem_city VARCHAR2(20) NOT NULL,
  mem_state VARCHAR2(10) NOT NULL,
  mem_zip VARCHAR2(5) NOT NULL,
  mem_balance NUMBER(2) NOT NULL,
  CONSTRAINT membership_pk PRIMARY KEY (mem_num)
);

CREATE TABLE rental
(
  rent_num NUMBER(4) NOT NULL,
  rent_date DATE DEFAULT SYSDATE,
  mem_num NUMBER(3) NOT NULL,
  CONSTRAINT rental_pk PRIMARY KEY (rent_num),
  CONSTRAINT fk_membership
    FOREIGN KEY (mem_num)
    REFERENCES membership(mem_num)
);

CREATE TABLE price
(
  price_code NUMBER(1) NOT NULL,
  price_description VARCHAR2(30) NOT NULL,
  price_rentfee NUMBER(2,1) NOT NULL,
  price_dailylatefee NUMBER(2,1) NOT NULL,
  CONSTRAINT price_pk PRIMARY KEY (price_code)
);

CREATE TABLE movie
(
  movie_num NUMBER(4) NOT NULL,
  movie_title VARCHAR2(30) NOT NULL,
  movie_year NUMBER(4) NOT NULL,
  movie_cost NUMBER(5,2)NOT NULL,
  movie_genre VARCHAR2(30) NOT NULL,
  price_code NUMBER(1) default 0,
  CONSTRAINT movie_pk PRIMARY KEY (movie_num),
  CONSTRAINT fk_price
    FOREIGN KEY (price_code)
    REFERENCES price(price_code)
);

CREATE TABLE video
(
  vid_num NUMBER(5) NOT NULL,
  vid_indate DATE DEFAULT SYSDATE,
  movie_num NUMBER(4) NOT NULL,
  CONSTRAINT video_pk PRIMARY KEY (vid_num),
  CONSTRAINT fk_movie
    FOREIGN KEY (movie_num)
    REFERENCES movie(movie_num)
);

CREATE TABLE detailrental
(
  rent_num NUMBER(4) NOT NULL,
  vid_num NUMBER(5) NOT NULL,
  detail_fee NUMBER(3,2) NOT NULL,
  detail_duedate DATE DEFAULT SYSDATE,
  detail_returndate DATE DEFAULT SYSDATE,
  detail_dailylatefee NUMBER(1) NOT NULL,
  CONSTRAINT detailrental_pk PRIMARY KEY (rent_num, vid_num),
  CONSTRAINT fk_rental
    FOREIGN KEY (rent_num)
    REFERENCES rental(rent_num),
  CONSTRAINT fk_video
    FOREIGN KEY (vid_num)
    REFERENCES video(vid_num)
);