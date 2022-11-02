--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2022-11-02 04:31:03

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
-- TOC entry 201 (class 1259 OID 33321)
-- Name: hoteli; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hoteli (
    hotel_id integer NOT NULL,
    naziv character varying(50) NOT NULL,
    grad character varying(50) NOT NULL,
    zemlja character varying(50) NOT NULL,
    adresa character varying(100) NOT NULL,
    godina_osnutka integer,
    tel character varying(30),
    email character varying(50),
    url character varying(100),
    br_soba integer,
    br_zvjezdica integer NOT NULL
);


ALTER TABLE public.hoteli OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 33319)
-- Name: hoteli_hotel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hoteli_hotel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hoteli_hotel_id_seq OWNER TO postgres;

--
-- TOC entry 3001 (class 0 OID 0)
-- Dependencies: 200
-- Name: hoteli_hotel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hoteli_hotel_id_seq OWNED BY public.hoteli.hotel_id;


--
-- TOC entry 202 (class 1259 OID 33327)
-- Name: lokacije; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lokacije (
    hotel_id integer NOT NULL,
    sirina numeric NOT NULL,
    duzina numeric NOT NULL
);


ALTER TABLE public.lokacije OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 33333)
-- Name: pogodnosti; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pogodnosti (
    hotel_id integer NOT NULL,
    besplatan_wifi character varying(3),
    bazen character varying(3),
    pet_friendly character varying(3)
);


ALTER TABLE public.pogodnosti OWNER TO postgres;

--
-- TOC entry 2859 (class 2604 OID 33324)
-- Name: hoteli hotel_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hoteli ALTER COLUMN hotel_id SET DEFAULT nextval('public.hoteli_hotel_id_seq'::regclass);


--
-- TOC entry 2993 (class 0 OID 33321)
-- Dependencies: 201
-- Data for Name: hoteli; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.hoteli (hotel_id, naziv, grad, zemlja, adresa, godina_osnutka, tel, email, url, br_soba, br_zvjezdica) VALUES (1, 'DoubleTree by Hilton Zagreb', 'Zagreb', 'Hrvatska', 'Ulica grada vukovara 269A', 2012, '+385 1 60 01 900', 'zagreb.reservations@hilton.com', 'http://www.zagreb.doubletree.com/', 152, 5);
INSERT INTO public.hoteli (hotel_id, naziv, grad, zemlja, adresa, godina_osnutka, tel, email, url, br_soba, br_zvjezdica) VALUES (2, 'Esplanade Zagreb', 'Zagreb', 'Hrvatska', 'Mihanovićeva 1', 1925, '+385 1 45 66 666', 'info@esplanade.hr', 'http://www.esplanade.hr/', 208, 5);
INSERT INTO public.hoteli (hotel_id, naziv, grad, zemlja, adresa, godina_osnutka, tel, email, url, br_soba, br_zvjezdica) VALUES (3, 'La Premier Hotel', 'Zagreb', 'Hrvatska', ' Ulica kralja Držislava 5', 2016, '+385 1 60 01 900', 'zagreb.reservations@hilton.com', 'http://www.lepremier.hr/', 62, 5);
INSERT INTO public.hoteli (hotel_id, naziv, grad, zemlja, adresa, godina_osnutka, tel, email, url, br_soba, br_zvjezdica) VALUES (4, 'Sheraton Zagreb', 'Zagreb', 'Hrvatska', 'Kneza Borne 2', 1995, '+385 1 45 53 535', 'sales@hup-zagreb.hr', 'http://www.marriott.com/ZAGSI', 306, 5);
INSERT INTO public.hoteli (hotel_id, naziv, grad, zemlja, adresa, godina_osnutka, tel, email, url, br_soba, br_zvjezdica) VALUES (5, 'The Westin Zagreb', 'Zagreb', 'Hrvatska', 'Kršnjavoga 1', 1975, '+385 1 48 92 000', 'sales@hup-zagreb.hr', 'http://www.marriott.com/ZAGWI', 349, 5);
INSERT INTO public.hoteli (hotel_id, naziv, grad, zemlja, adresa, godina_osnutka, tel, email, url, br_soba, br_zvjezdica) VALUES (6, 'Royal Ariston Hotel', 'Dubrovnik', 'Hrvatska', 'Kardinala Stepinca 31', 2017, '+385 20 440 100', 'reservations@royaldubrovnik.com', 'https://www.hotelaristondubrovnik.com/', 115, 5);
INSERT INTO public.hoteli (hotel_id, naziv, grad, zemlja, adresa, godina_osnutka, tel, email, url, br_soba, br_zvjezdica) VALUES (7, 'Hotel Dubrovnik Palace', 'Dubrovnik', 'Hrvatska', 'Masarykov Put 20', 2003, '+385 20 430 000', 'reservations@alh.hr', 'https://www.adriaticluxuryhotels.com/hr/hotel-dubrovnik-palace/', 320, 5);
INSERT INTO public.hoteli (hotel_id, naziv, grad, zemlja, adresa, godina_osnutka, tel, email, url, br_soba, br_zvjezdica) VALUES (8, 'Hotel Monte Mulini', 'Rovinj', 'Hrvatska', 'A. Smareglia 3', 2009, '+385 52 800 250', 'hello@maistra.hr', 'https://www.maistra.com/hr/smjestaj/hotel-monte-mulini/#/', 400, 5);
INSERT INTO public.hoteli (hotel_id, naziv, grad, zemlja, adresa, godina_osnutka, tel, email, url, br_soba, br_zvjezdica) VALUES (9, 'Meridien Lav', 'Split', 'Hrvatska', 'Grljevacka 2a', 1971, '+38521500500', 'info@lemeridiensplit.com', 'https://www.lemeridiensplit.com/', 378, 5);
INSERT INTO public.hoteli (hotel_id, naziv, grad, zemlja, adresa, godina_osnutka, tel, email, url, br_soba, br_zvjezdica) VALUES (10, 'Amadaria Park', 'Opatija', 'Hrvatska', 'Maršala Tita 109', 1967, '+385 51 278 007', 'info@amadriapark.com', 'https://www.amadriapark.com/hr/hotel/amadria-park-hotel-milenij-opatija-business-leisure-hotel', 100, 5);


--
-- TOC entry 2994 (class 0 OID 33327)
-- Dependencies: 202
-- Data for Name: lokacije; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.lokacije (hotel_id, sirina, duzina) VALUES (1, 45.801786288698416, 16.001706763380476);
INSERT INTO public.lokacije (hotel_id, sirina, duzina) VALUES (2, 45.805505147803274, 15.97599100971124);
INSERT INTO public.lokacije (hotel_id, sirina, duzina) VALUES (3, 45.810320895990884, 15.985996551779204);
INSERT INTO public.lokacije (hotel_id, sirina, duzina) VALUES (4, 45.801786288698416, 16.001706763380476);
INSERT INTO public.lokacije (hotel_id, sirina, duzina) VALUES (5, 45.80711150136659, 15.966327582203974);
INSERT INTO public.lokacije (hotel_id, sirina, duzina) VALUES (6, 42.659635881753964, 18.05887435737669);
INSERT INTO public.lokacije (hotel_id, sirina, duzina) VALUES (7, 42.65141687853165, 18.060979989677627);
INSERT INTO public.lokacije (hotel_id, sirina, duzina) VALUES (8, 45.072954962995546, 13.636956391238071);
INSERT INTO public.lokacije (hotel_id, sirina, duzina) VALUES (9, 43.492809008732216, 16.53832906336709);
INSERT INTO public.lokacije (hotel_id, sirina, duzina) VALUES (10, 45.33400567934142, 14.305636473694104);


--
-- TOC entry 2995 (class 0 OID 33333)
-- Dependencies: 203
-- Data for Name: pogodnosti; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pogodnosti (hotel_id, besplatan_wifi, bazen, pet_friendly) VALUES (1, 'da', 'da', 'da');
INSERT INTO public.pogodnosti (hotel_id, besplatan_wifi, bazen, pet_friendly) VALUES (2, 'da', 'ne', 'da');
INSERT INTO public.pogodnosti (hotel_id, besplatan_wifi, bazen, pet_friendly) VALUES (3, 'da', 'ne', 'ne');
INSERT INTO public.pogodnosti (hotel_id, besplatan_wifi, bazen, pet_friendly) VALUES (4, 'da', 'da', 'da');
INSERT INTO public.pogodnosti (hotel_id, besplatan_wifi, bazen, pet_friendly) VALUES (5, 'da', 'ne', 'da');
INSERT INTO public.pogodnosti (hotel_id, besplatan_wifi, bazen, pet_friendly) VALUES (6, 'ne', 'da', 'da');
INSERT INTO public.pogodnosti (hotel_id, besplatan_wifi, bazen, pet_friendly) VALUES (7, 'da', 'ne', 'da');
INSERT INTO public.pogodnosti (hotel_id, besplatan_wifi, bazen, pet_friendly) VALUES (8, 'ne', 'ne', 'da');
INSERT INTO public.pogodnosti (hotel_id, besplatan_wifi, bazen, pet_friendly) VALUES (9, 'ne', 'ne', 'ne');
INSERT INTO public.pogodnosti (hotel_id, besplatan_wifi, bazen, pet_friendly) VALUES (10, 'ne', 'da', 'da');


--
-- TOC entry 3002 (class 0 OID 0)
-- Dependencies: 200
-- Name: hoteli_hotel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hoteli_hotel_id_seq', 10, true);


--
-- TOC entry 2861 (class 2606 OID 33326)
-- Name: hoteli hoteli_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hoteli
    ADD CONSTRAINT hoteli_pkey PRIMARY KEY (hotel_id);


-- Completed on 2022-11-02 04:31:03

--
-- PostgreSQL database dump complete
--

