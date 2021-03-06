CREATE TABLE books (
  id SERIAL4 PRIMARY KEY,
  author VARCHAR(400) NOT NULL,
  about_author TEXT NOT NULL,
  book_title VARCHAR(400) NOT NULL,
  images VARCHAR(400) NOT NULL,
  plot TEXT NOT NULL,
  year_level TEXT NOT NULL,
  price INTEGER NOT NULL
);

CREATE TABLE users (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(400) NOT NULL,
  surname VARCHAR(400) NOT NULL,
  email VARCHAR(400) NOT NULL,
  phone_no VARCHAR(400) NOT NULL,
  street_no VARCHAR(400) NOT NULL,
  street_name VARCHAR(400) NOT NULL,
  suburb VARCHAR(400) NOT NULL,
  postcode VARCHAR(400) NOT NULL,
  password_digest VARCHAR(400) NOT NULL
);


CREATE TABLE comments (
  id SERIAL4 PRIMARY KEY,
  body TEXT NOT NULL,
  book_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL
);


CREATE TABLE purchases (
  id SERIAL4 PRIMARY KEY,
  book_title VARCHAR(400) NOT NULL,
  price INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  book_id INTEGER NOT NULL
);
