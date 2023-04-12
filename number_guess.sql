--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'user_1681336673871', 2, 421);
INSERT INTO public.users VALUES (1, 'user_1681336673872', 5, 667);
INSERT INTO public.users VALUES (4, 'user_1681337141470', 2, 270);
INSERT INTO public.users VALUES (3, 'user_1681337141471', 5, 162);
INSERT INTO public.users VALUES (6, 'user_1681337232941', 2, 158);
INSERT INTO public.users VALUES (5, 'user_1681337232942', 5, 193);
INSERT INTO public.users VALUES (8, 'user_1681337277094', 2, 340);
INSERT INTO public.users VALUES (7, 'user_1681337277095', 5, 13);
INSERT INTO public.users VALUES (10, 'user_1681337332534', 2, 360);
INSERT INTO public.users VALUES (9, 'user_1681337332535', 4, 16);
INSERT INTO public.users VALUES (12, 'user_1681337397370', 2, 626);
INSERT INTO public.users VALUES (11, 'user_1681337397371', 5, 613);
INSERT INTO public.users VALUES (14, 'user_1681337520921', 2, 361);
INSERT INTO public.users VALUES (13, 'user_1681337520922', 4, 460);
INSERT INTO public.users VALUES (16, 'user_1681337630138', 2, 733);
INSERT INTO public.users VALUES (15, 'user_1681337630139', 4, 15);
INSERT INTO public.users VALUES (18, 'user_1681337786084', 2, 204);
INSERT INTO public.users VALUES (17, 'user_1681337786085', 4, 26);
INSERT INTO public.users VALUES (20, 'user_1681337832192', 2, 649);
INSERT INTO public.users VALUES (19, 'user_1681337832193', 5, 214);
INSERT INTO public.users VALUES (22, 'user_1681337883104', 2, 541);
INSERT INTO public.users VALUES (21, 'user_1681337883105', 4, 159);
INSERT INTO public.users VALUES (55, 'user_1681338157541', 2, 711);
INSERT INTO public.users VALUES (54, 'user_1681338157542', 5, 208);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 55, true);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

