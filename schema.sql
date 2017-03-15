CREATE TABLE books (
  id SERIAL4 PRIMARY KEY,
  author VARCHAR(400),
  about_author TEXT,
  book_title VARCHAR(400),
  images VARCHAR(400),
  plot TEXT,
  year_level TEXT
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
  body TEXT,
  book_id INTEGER,
  user_id INTEGER
);
