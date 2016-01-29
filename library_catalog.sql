--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: authors; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE authors (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying
);


ALTER TABLE authors OWNER TO "Guest";

--
-- Name: authors_books; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE authors_books (
    id integer NOT NULL,
    author_id integer,
    book_id integer
);


ALTER TABLE authors_books OWNER TO "Guest";

--
-- Name: authors_books_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE authors_books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE authors_books_id_seq OWNER TO "Guest";

--
-- Name: authors_books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE authors_books_id_seq OWNED BY authors_books.id;


--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE authors_id_seq OWNER TO "Guest";

--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE authors_id_seq OWNED BY authors.id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE books (
    id integer NOT NULL,
    title character varying
);


ALTER TABLE books OWNER TO "Guest";

--
-- Name: books_genres; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE books_genres (
    id integer NOT NULL,
    book_id integer,
    genre_id integer
);


ALTER TABLE books_genres OWNER TO "Guest";

--
-- Name: books_genres_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE books_genres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE books_genres_id_seq OWNER TO "Guest";

--
-- Name: books_genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE books_genres_id_seq OWNED BY books_genres.id;


--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE books_id_seq OWNER TO "Guest";

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE books_id_seq OWNED BY books.id;


--
-- Name: checkouts; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE checkouts (
    id integer NOT NULL,
    copy_id integer,
    patron_id integer,
    checkout_date date,
    due_date date,
    is_returned boolean
);


ALTER TABLE checkouts OWNER TO "Guest";

--
-- Name: checkouts_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE checkouts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE checkouts_id_seq OWNER TO "Guest";

--
-- Name: checkouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE checkouts_id_seq OWNED BY checkouts.id;


--
-- Name: copies; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE copies (
    id integer NOT NULL,
    book_id integer
);


ALTER TABLE copies OWNER TO "Guest";

--
-- Name: copies_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE copies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE copies_id_seq OWNER TO "Guest";

--
-- Name: copies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE copies_id_seq OWNED BY copies.id;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE genres (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE genres OWNER TO "Guest";

--
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE genres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE genres_id_seq OWNER TO "Guest";

--
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE genres_id_seq OWNED BY genres.id;


--
-- Name: patrons; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE patrons (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    phone integer
);


ALTER TABLE patrons OWNER TO "Guest";

--
-- Name: patrons_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE patrons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE patrons_id_seq OWNER TO "Guest";

--
-- Name: patrons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE patrons_id_seq OWNED BY patrons.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY authors ALTER COLUMN id SET DEFAULT nextval('authors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY authors_books ALTER COLUMN id SET DEFAULT nextval('authors_books_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY books ALTER COLUMN id SET DEFAULT nextval('books_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY books_genres ALTER COLUMN id SET DEFAULT nextval('books_genres_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY checkouts ALTER COLUMN id SET DEFAULT nextval('checkouts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY copies ALTER COLUMN id SET DEFAULT nextval('copies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY genres ALTER COLUMN id SET DEFAULT nextval('genres_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY patrons ALTER COLUMN id SET DEFAULT nextval('patrons_id_seq'::regclass);


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY authors (id, first_name, last_name) FROM stdin;
1	Leo	Tolstoy
4	Nikolai	Gogol
3	Fyodor	Dostoyevsky
5	Charlotte	Brontë
6	Hermann	Hesse
7	Mark	Twain
8	E.B.	White
9	William	Strunk
10	JRR	Tolkien
\.


--
-- Data for Name: authors_books; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY authors_books (id, author_id, book_id) FROM stdin;
1	1	1
2	1	4
3	3	5
5	5	3
6	1	2
7	6	6
8	7	7
9	8	8
10	9	8
11	10	9
\.


--
-- Name: authors_books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('authors_books_id_seq', 11, true);


--
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('authors_id_seq', 10, true);


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY books (id, title) FROM stdin;
1	War and Peace
2	Anna Karenina
4	The Kreutzer Sonata
5	The Idiot
3	Jane Eyre
6	Steppenwolf
7	The Adventures of Huckleberry Finn
8	The Elements of Style (4th Edition)
9	The Hobbit
\.


--
-- Data for Name: books_genres; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY books_genres (id, book_id, genre_id) FROM stdin;
\.


--
-- Name: books_genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('books_genres_id_seq', 1, false);


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('books_id_seq', 9, true);


--
-- Data for Name: checkouts; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY checkouts (id, copy_id, patron_id, checkout_date, due_date, is_returned) FROM stdin;
4	4	3	2016-01-28	2016-02-11	t
5	7	3	2016-01-28	2016-02-11	t
1	1	1	2016-01-06	2016-01-20	f
6	8	3	2016-01-28	2016-02-11	f
7	12	3	2016-01-28	2016-02-11	f
8	18	1	2016-01-28	2016-02-11	f
9	19	3	2016-01-28	2016-02-11	f
3	6	3	2016-01-06	2016-01-20	t
\.


--
-- Name: checkouts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('checkouts_id_seq', 9, true);


--
-- Data for Name: copies; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY copies (id, book_id) FROM stdin;
1	1
3	1
4	4
5	5
6	5
7	3
8	6
9	6
10	6
11	7
12	8
13	8
14	8
15	8
16	9
17	9
18	2
19	2
\.


--
-- Name: copies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('copies_id_seq', 19, true);


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY genres (id, name) FROM stdin;
\.


--
-- Name: genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('genres_id_seq', 1, false);


--
-- Data for Name: patrons; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY patrons (id, first_name, last_name, phone) FROM stdin;
1	Bill	Borrower	5551212
3	Jeffrey	Ruder	2221111
4	Max	Powers	9999999
\.


--
-- Name: patrons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('patrons_id_seq', 4, true);


--
-- Name: authors_books_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY authors_books
    ADD CONSTRAINT authors_books_pkey PRIMARY KEY (id);


--
-- Name: authors_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: books_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY books_genres
    ADD CONSTRAINT books_genres_pkey PRIMARY KEY (id);


--
-- Name: books_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: checkouts_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY checkouts
    ADD CONSTRAINT checkouts_pkey PRIMARY KEY (id);


--
-- Name: copies_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY copies
    ADD CONSTRAINT copies_pkey PRIMARY KEY (id);


--
-- Name: genres_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- Name: patrons_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY patrons
    ADD CONSTRAINT patrons_pkey PRIMARY KEY (id);


--
-- Name: authors_books_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY authors_books
    ADD CONSTRAINT authors_books_author_id_fkey FOREIGN KEY (author_id) REFERENCES authors(id);


--
-- Name: authors_books_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY authors_books
    ADD CONSTRAINT authors_books_book_id_fkey FOREIGN KEY (book_id) REFERENCES books(id);


--
-- Name: books_genres_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY books_genres
    ADD CONSTRAINT books_genres_book_id_fkey FOREIGN KEY (book_id) REFERENCES books(id);


--
-- Name: books_genres_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY books_genres
    ADD CONSTRAINT books_genres_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES genres(id);


--
-- Name: checkouts_copy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY checkouts
    ADD CONSTRAINT checkouts_copy_id_fkey FOREIGN KEY (copy_id) REFERENCES copies(id);


--
-- Name: checkouts_patron_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY checkouts
    ADD CONSTRAINT checkouts_patron_id_fkey FOREIGN KEY (patron_id) REFERENCES patrons(id);


--
-- Name: copies_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY copies
    ADD CONSTRAINT copies_book_id_fkey FOREIGN KEY (book_id) REFERENCES books(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: epicodus
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM epicodus;
GRANT ALL ON SCHEMA public TO epicodus;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

