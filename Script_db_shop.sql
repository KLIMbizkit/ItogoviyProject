--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2022-12-06 23:44:27

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

--
-- TOC entry 3366 (class 1262 OID 17022)
-- Name: db_shop; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE db_shop WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';


ALTER DATABASE db_shop OWNER TO postgres;

\connect db_shop

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
-- TOC entry 210 (class 1259 OID 17024)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17023)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.category ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 212 (class 1259 OID 17030)
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 17029)
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.image ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 214 (class 1259 OID 17036)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp without time zone,
    number character varying(255),
    price real NOT NULL,
    status integer,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17035)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 17042)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(50),
    password character varying(255),
    role character varying(255),
    patronymic text
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17041)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.person ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 17050)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    date_time_of_created timestamp without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17059)
-- Name: product_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);


ALTER TABLE public.product_cart OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17058)
-- Name: product_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product_cart ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 17049)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3350 (class 0 OID 17024)
-- Dependencies: 210
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, name) VALUES (1, '??????????');
INSERT INTO public.category (id, name) VALUES (2, '???????????????? ??????????????');


--
-- TOC entry 3352 (class 0 OID 17030)
-- Dependencies: 212
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.image (id, file_name, product_id) VALUES (11, 'e9037feb-9914-4d4d-904a-bd5e40b2687f.kion2m1.PNG', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (12, '2a4d19ac-0147-4606-804c-67e8f35c953a.kion2m1.PNG', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (13, '47340c3e-847a-4778-a27e-109e3a9a7b07.', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (14, '15d57631-a957-4c50-b8d0-25542e22cba1.', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (15, 'd7a75304-7f0f-4e9e-b762-073d20001b29.', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (21, '91eb1cf4-ede9-49ae-a4d4-b3fbb8bf2053.kion6m1.PNG', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (22, 'b7d110a7-67ef-435b-a6a8-33bde24d2ee6.', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (23, '72a77ff9-4e53-4082-8edd-db0368277049.', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (24, '765ac32b-6129-4fa3-b9bc-5017122215df.', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (25, 'cf86a89d-8d59-4754-9d03-90396084b04f.', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (31, '57d5d9de-83e6-42bf-a82d-2fa0d2e0c6af.kion12m1.PNG', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (32, 'c5c8c3c9-7dd4-4b59-92fc-7ff10764b885.', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (33, '0daccb8d-e4b0-4815-98b9-39811ea703b5.', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (34, 'e53fe54d-16e4-42bf-b56c-da8bd2834937.', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (35, 'ebe16e73-a500-4953-9f47-de51750b21a2.', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (36, '65f91a30-0ee0-4e7f-9c7b-a722fa271c8e.kionsmartold1.PNG', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (37, '7b66e29b-6d42-4a32-b865-aac30b4af472.kionsmartold2.PNG', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (38, '05ef4168-7565-4cba-9b64-cb3e714308b6.kionsmartold3.PNG', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (39, '0ada010a-a00d-4751-b67b-6d6b3a41eb0e.', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (40, '2ec35712-765c-468b-824a-c09b45736ea4.', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (41, '442f2f8b-8640-4ee8-bd6a-3ee256f34c30.kiontv1.PNG', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (42, '8e9df67f-37bc-41ef-b0d9-f389efaab090.kiontv2.PNG', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (43, '8eb3ce05-5c3c-45e1-82af-77839890e65e.kiontv3.PNG', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (44, '411cc013-a9b6-490f-985f-eebc2997e6ad.', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (45, 'cf5f95ce-cdba-4c81-8017-0b4e5a3bece4.', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (46, '550fe76e-a9f5-4872-ab27-328b2272173f.44158db1-a3ae-461f-9e12-9ffa294d64a5.kionsmart1.PNG', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (47, '52255ee6-4e1b-46d9-815a-63f21c866f75.kionsmart2.PNG', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (48, '83f50398-4935-45d3-ac7b-c244b8cc3645.kionsmart3.PNG', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (49, 'af0f5320-7a5f-497e-945d-f6c7382841e2.', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (50, 'dad26e39-7c81-489c-b235-924a7863392a.', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (51, '74a9ef34-ad67-40bb-a8c5-d1c937ed9d5e.kion18.PNG', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (52, 'c8881a57-80d5-40fb-9777-1350a3cb4cc8.kionsmart1.PNG', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (53, '6703bc94-2a2e-4de0-b585-fee5e803507e.kionsmartold1.PNG', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (54, '7fbbac9a-754b-43c0-834d-089eb8f658fb.kion2m1.PNG', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (55, 'fd3b42ab-1410-48b3-9839-5858732f4f4d.kiontv2.PNG', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (56, '8522399b-d7e3-4d27-b5a0-d2a440c087b8.kion3m1.PNG', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (57, '806ea26b-1d7e-4a5e-985f-a6a957f1a15d.kion6m1.PNG', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (58, '02d5d4e9-5aa8-425c-a95a-6436ab29355e.kion12m1.PNG', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (59, '22e62bf3-383e-4baf-bec5-bb6e80a73758.kion18.PNG', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (60, 'ade15f9f-5720-4b4d-bb38-2f6656a44554.kionsmart1.PNG', 12);


--
-- TOC entry 3354 (class 0 OID 17036)
-- Dependencies: 214
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (4, 1, '2022-12-06 23:27:47.60594', 'c8be22b9-0ce7-44bb-a48d-e048b24bccd4', 4490, 1, 6, 8);


--
-- TOC entry 3356 (class 0 OID 17042)
-- Dependencies: 216
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person (id, login, password, role, patronymic) VALUES (6, 'useruser', '$2a$10$jOB/ViaISbxssUYd..e.gezoEiEgKZ2GAL9LzYMaicE.AGDfW3az2', 'ROLE_USER', NULL);
INSERT INTO public.person (id, login, password, role, patronymic) VALUES (5, 'admin', '$2a$10$F88dshdfPnOByShPaJd3negFAlc7ej8Kn5RD93hFAntYs9KgEVAc6', 'ROLE_ADMIN', NULL);


--
-- TOC entry 3358 (class 0 OID 17050)
-- Dependencies: 218
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (5, NULL, '???????????????????????? ?????????????? KION, ???????????? ??????????????, ???????????????? ???? ?????????????? ????????????, ?????????????????????? ?? ?????????? 200 ????-?????????????? ???? 5 ??????????????????????. ???????????????? ???????????? ?? ?????? Music, +512???? ?? ???????????? ?? ???????????? ???????????????????? ?????? Premium. ?? ?????? ?????????????????? ?????? ???????????????? ???????????? ???? ????????-?????????????? ?? ?????????? ???????????????????? ??????????????????.

?????????????? ???????????????? ??????????????????????: 4K, HDR, Full HD.
?????????????????????????? ???????????????? ???? 5 ??????????????????????: ???? ??????????????????, ????????????????, ???????????????????? ?????? SmartTV, ???????????????? ???????????? ?????? ??????????????????????????.
?????????????? ????????????????????????: ???????????????????? ?????????????? ???????????????????????? ???????? ?? ???????????????? ?????????????????????????? ?????? ??????????????.
???????????????????? ??????????????: ???????????????? ???? ?????????? ?????????????? ?????? ??????????????????.
?????????????? ?????????????? ?? ???????????????????? ??????????????????: ???????????????????????????? ?????????????????? ?????????????????????? ?????????????????????? ?????? ?????????????? ?????????? ??????????.
???????????????? ???? ?????????? ????????????????????: ???? ??????????????????, ????????????????, ???????????????????? ?????? SmartTV.
?????????????????????????? ?? ???????????????? ?????????? 12 ?????????????? ??? ???????????????? ???????????? ??????????????!

?????????????????? ???????????????? ???????????????? ???? ?????????? kion.ru/code

1. ?????????????? ???????????????????? ?????? ?? ?????????????????????????????? ???????? ????????????????????

2. ?????????????? ????????????????????????????

3. ?????????????????????????????????? ???? ???????????? ????????????????

????????????-?????????????????? KION ???????????????? ???? ??????????????????, ????????????????, ???????????????????? ?????? Smart TV.

???????????????????? KION ????????????????????????:

Smart TV Sony, Philips, Sharp, Kivi ?? ????., ???? ?????????????????? ?? ???? Android TV 7.0 ?? ????????. Smart TV Samsung ???? ???? Tizen 2017 ???????? ?? ?????????? ??????????, Smart TV LG ???? webOS 3.0 ?? ????????. ?????????????????? ?? ???????????????? Android - ???????????? 5.1.2 ?? ????????. iPhone 5S ?? ????????, iPad 4 ?? ????????, Apple TV 4-???? ??????????????????. ???????????????? Chrome ???? 75 ????????????, Firefox ???? 66 ?? Opera ???? 62 ????????????.', 999, '??', '???????????????? ?????????????? KION + Premium ???????????????? 6 ??????', '????????????', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (7, '2022-12-04 17:27:56.318048', '???????????????????????? ?????????????? KION, ???????????? ??????????????, ???????????????? ???? ?????????????? ????????????, ?????????????????????? ?? ?????????? 200 ????-?????????????? ???? 5 ??????????????????????. ???????????????? ???????????? ?? ?????? Music, +512???? ?? ???????????? ?? ???????????? ???????????????????? ?????? Premium. ?? ?????? ?????????????????? ?????? ???????????????? ???????????? ???? ????????-?????????????? ?? ?????????? ???????????????????? ??????????????????.

?????????????? ???????????????? ??????????????????????: 4K, HDR, Full HD.
?????????????????????????? ???????????????? ???? 5 ??????????????????????: ???? ??????????????????, ????????????????, ???????????????????? ?????? SmartTV, ???????????????? ???????????? ?????? ??????????????????????????.
?????????????? ????????????????????????: ???????????????????? ?????????????? ???????????????????????? ???????? ?? ???????????????? ?????????????????????????? ?????? ??????????????.
???????????????????? ??????????????: ???????????????? ???? ?????????? ?????????????? ?????? ??????????????????.
?????????????? ?????????????? ?? ???????????????????? ??????????????????: ???????????????????????????? ?????????????????? ?????????????????????? ?????????????????????? ?????? ?????????????? ?????????? ??????????.
???????????????? ???? ?????????? ????????????????????: ???? ??????????????????, ????????????????, ???????????????????? ?????? SmartTV.
?????????????????????????? ?? ???????????????? ?????????? 12 ?????????????? ??? ???????????????? ???????????? ??????????????!

?????????????????? ???????????????? ???????????????? ???? ?????????? kion.ru/code

1. ?????????????? ???????????????????? ?????? ?? ?????????????????????????????? ???????? ????????????????????

2. ?????????????? ????????????????????????????

3. ?????????????????????????????????? ???? ???????????? ????????????????

????????????-?????????????????? KION ???????????????? ???? ??????????????????, ????????????????, ???????????????????? ?????? Smart TV.

???????????????????? KION ????????????????????????:

Smart TV Sony, Philips, Sharp, Kivi ?? ????., ???? ?????????????????? ?? ???? Android TV 7.0 ?? ????????. Smart TV Samsung ???? ???? Tizen 2017 ???????? ?? ?????????? ??????????, Smart TV LG ???? webOS 3.0 ?? ????????. ?????????????????? ?? ???????????????? Android - ???????????? 5.1.2 ?? ????????. iPhone 5S ?? ????????, iPad 4 ?? ????????, Apple TV 4-???? ??????????????????. ???????????????? Chrome ???? 75 ????????????, Firefox ???? 66 ?? Opera ???? 62 ????????????.', 1690, '??????', '???????????????? ?????????????? KION + Premium ???????????????? 12 ??????', '????????????', 2);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (8, '2022-12-04 17:28:44.008259', 'Smart ?????????????????? ?????? + ???????????????? ???? ????????????-?????????????????? KION ???? 3 ??????. ???????? 4990 ??????.

SMART-?????????????????? ?????? ??? ???????????????? ?? ?????????????????????? ????????????????????, ?????????????? ???????????????????? ?????????? ?????????????????? ?? ??????????, ???????????????? ?????????????????? ???????????????? ??????????????. ???????????????????????? ?????????????? Android ?????????????????? ???????????? ?? ????????????-????????????????????, ?????????? ?? ???????????????????????? ????????????????. ?? ???????????????? ?? ???????????????????? ?????? ???????????????? ???????????????? ???? ????????????-?????????????????? KION ???? ?????????????? 100% ???? ?????????????????????? ?????????? ???? 3 ???????????? ?? ?????????????? ?????????????????? ??????????????????. ?? ?????????????????? ??KION?? ???? ???????????? ???????????????? ???????????? ?? ?????????????? ???????????????????????? ????????????????????????, ???????????????????????? ?????????????? ????????????????, ?????????????????????? ?? ?????????? 190 ????-??????????????, ?????????? ???????????????????????? ?????????? 5 ?????????????? ????????????????????????.

???????????? ?????????????????????????????? ?????????????????? ARM Cortex-A53 ?? ?????? ?????????????????? ?????????????????????? ???????????? ?? ?????????????????? ?? ???????????????????????? ???????????????? Android 9.0 ?????????????????? ???????????????????????? ???????? ?????????????????????????? ???????????????????? ???????????????? Google Play.

SMART-?????????????????? ???????????????????????? Bluetooth, ?????????????? ?? ?????? ?????????? ???????????????????? ???????????????????? ?? ????????, ?? ?????????? ?????????????????? ?????? ?????????????????? ???????????????????? ?? ?????????? ?? ??????????????????????. ?????????? ?? ???????? ???????????? ?????????? ?????????????????? ????????????????. ?????????????????? ???????????????????? ?????????????????? ?? ?????????????? ?????????????????? ?? ???????????? ???????????????????????? ???????????????????? ???????????????????? ?????????????????????? ?? ?????????????? ???????????? ????????????.

?????????????????????? ?? ???????? ???????????????????????????? ?????? ?? ?????????????? ???????????????????????? ???????????????? ????????????, ?????? ?? ?????????? Wi-Fi, ???????????? Smart?????????????????? ???????????????????????? ???????????????????? ???????????????? 5 ??????, ?????????????? ?????????????????? ???????????????? ?????????????????? ?????????? ?? ?????????????? ???????????????????? ?? ???????????? ?? ???????? ?????? ????????????????.

???????????????????? ???????????????? ?? ???????????????? ???????????????? ??????????????, ???????????????? ?? ?????????????? ????????????. ???? ?????????? ???????????????????? ?? ?????????????? ???????????????? ???? ???????????? ???????????? ?? ?????????????????????????? ?????????????????? ?????????????? ???????? ?????? ?????????????????????? ?? ????????.', 4490, '??????', 'Smart ?????????????????? ?????? KION SMART BOX + 3 ???????????? ???????????????? ???? ????????????-?????????????????? KION', '????????????', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (9, '2022-12-04 17:29:19.391351', '????????-?????????????????? KION 50U7H32KN ?? ?????????????? ???????????????????? 50??? ?? ?????????????????????? 4?? ???????????????? ?????? ???????????????????? ????-??????????????, ?????????????? ?? ???????????????? ?? ?????????????????? ?????? ?? ????????-??????????????????????. ???????????????????????? ?????????????????????? ?? ???????? ?? ?????????????? ???????????????????? ???????????????? ???????????????? ???????????????????????? ???? ?????????????????? ????????????????. ?????? ?????????????? ?????????????? ??? ?????????????? ???????????????? KION, ???????????????????? ?????????? ????-??????????????, ?????????????? ?? ???????????????? ?? ???????????????? ????????????????.

?????????? ?????????????????? ??????????????????????
???????????? ???????????????? LCD-?????????????? ???????????????????? 50 ????????????. ?????????????????? Direct LED ???????????? ?????????????????????? ???????????????????? ??????????, ?????? ????????????????????. ???????????????????? 4?? ?? ?????????????? ???????????????????? 60 ???? ??? ?????????????????????? ?????????????????? ?????? ?????????????????? ???????????????? ????????. ?????????????? ???????? ???????????? 170 ???????????????? ???????????? ?????????????????????? ?????????????????? ???????????? ?? ?????????????????? ?????? ?????????????? ?? ???????????? ??????????????.

???????????????? ????????
KION 50U7H32KN ?????????????????????????? ???????????????????????? ???????????????? ???????? ?????????????????? ???????? ???????????????????? ?????????????????????????????? ?? ???????????????????? Dolby Audio+. ?????????? ???????????????? ?????????????? ???????????????????? 20 ????. ?????????????????? ???????????????????????? ?????????????? ???? Bluetooth, ?????????? ???????????????? ?????????????? ????????????????.

?????????????? ???????????????????????????????????? 
?????????????????????? ?????????????????????????????? ?????????????????? Cortex A53 ?? ?????????????????????????????? Mali-G52, ?????????????????????? ?????????????????????? ?????????????? 1.5 ????, ???????????????????????? ?????????????? ???????????? ???????????????????? ?? ?????????????? ???????????????? ?????????????? ???? ??????????????.

?????????????????? ?????????????????? Smart-TV ???? ???????????????????? ?????????? ?????????????????????????? ?????????? ???? ???????????????????????? ????????????????, ???????????? ?? ??????????????, ???????????????????? ?? ???????????? ??????????????. ?????????????????? ???????????????????? ?????????? ???? ???????????? ?????????? ???????????? ?????????????? ?? ??????????????.

?????????????? ???????????????? KION ?? ??????????????
???????????????????? ???????????? ?? ?????????? ?????? 200 ????-?????????????? ?? ?????????????? ??????????????, ????????????????, ???????????????????????? ?????? ??????????????, ???????????????? ???????????? ???? ???????????????? ?????? ?? ???????????? ?????????????????????? ???? ?????? ???????????????? ???????????????????? ???????????????????? KION 50U7H32KN. ???????????????????? ?? ?????????????? ?????????? ????, ???????????????? ??? ?????????? 5 ??????????????????. ?????????????????? ?????????????? ?????????????? ???????????????? ?????????????????????????? ?????????????????????????? ??????????????. 

???????????? ?? ????????????????
?????????????????????? ???????????? ???????????????????? ???????????????? ?? ???????????? ?????????? ??????????????????. ???????????????????? ?????????? ?????????????? ???????????????????? ??????????????????. ?????? ?????????????? ?????? ?????????? ???????????????? ???? ?????????? ?? ?????????????? ?????????????????? VESA 200??200.

???????????????????? ?? ??????????????????????
?? ?????????????? ???????????????????? ?????????????????????????? ?????????? ?? ?????????????? ?????? ?????????????????????? ?????????????? ??????????????????: USB, HDMI, LAN, COAX, miniAV. ???????????????????????? ????????????????, ?????????????? ?? ???????????? ???????????????????????? ???????????????????? ?????????????????????? ???? ?????????? Wi-Fi ?? Bluetooth. ?????????????????? ???????????????????????? ???????????????????????? MPEG-2 MP@ML, MPEG-2 MP@HL, H.264, H.265, AVS.', 23990, '??????', '?????????????????? KION Smart TV 50U7H32KN ????????????', '????????????', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (3, '2022-12-04 17:21:22.673708', '???????????????????????? ?????????????? KION, ???????????? ??????????????, ???????????????? ???? ?????????????? ????????????, ?????????????????????? ?? ?????????? 200 ????-?????????????? ???? 5 ??????????????????????. ???????????????? ???????????? ?? ?????? Music, +512???? ?? ???????????? ?? ???????????? ???????????????????? ?????? Premium. ?? ?????? ?????????????????? ?????? ???????????????? ???????????? ???? ????????-?????????????? ?? ?????????? ???????????????????? ??????????????????.

?????????????? ???????????????? ??????????????????????: 4K, HDR, Full HD.
?????????????????????????? ???????????????? ???? 5 ??????????????????????: ???? ??????????????????, ????????????????, ???????????????????? ?????? SmartTV, ???????????????? ???????????? ?????? ??????????????????????????.
?????????????? ????????????????????????: ???????????????????? ?????????????? ???????????????????????? ???????? ?? ???????????????? ?????????????????????????? ?????? ??????????????.
???????????????????? ??????????????: ???????????????? ???? ?????????? ?????????????? ?????? ??????????????????.
?????????????? ?????????????? ?? ???????????????????? ??????????????????: ???????????????????????????? ?????????????????? ?????????????????????? ?????????????????????? ?????? ?????????????? ?????????? ??????????.
???????????????? ???? ?????????? ????????????????????: ???? ??????????????????, ????????????????, ???????????????????? ?????? SmartTV.
?????????????????????????? ?? ???????????????? ?????????? 12 ?????????????? ??? ???????????????? ???????????? ??????????????!

?????????????????? ???????????????? ???????????????? ???? ?????????? kion.ru/code

1. ?????????????? ???????????????????? ?????? ?? ?????????????????????????????? ???????? ????????????????????

2. ?????????????? ????????????????????????????

3. ?????????????????????????????????? ???? ???????????? ????????????????

????????????-?????????????????? KION ???????????????? ???? ??????????????????, ????????????????, ???????????????????? ?????? Smart TV.

???????????????????? KION ????????????????????????:

Smart TV Sony, Philips, Sharp, Kivi ?? ????., ???? ?????????????????? ?? ???? Android TV 7.0 ?? ????????. Smart TV Samsung ???? ???? Tizen 2017 ???????? ?? ?????????? ??????????, Smart TV LG ???? webOS 3.0 ?? ????????. ?????????????????? ?? ???????????????? Android - ???????????? 5.1.2 ?? ????????. iPhone 5S ?? ????????, iPad 4 ?? ????????, Apple TV 4-???? ??????????????????. ???????????????? Chrome ???? 75 ????????????, Firefox ???? 66 ?? Opera ???? 62 ????????????.', 249, '??????', '???????????????? ?????????????? KION + Premium ???????????????? 2 ??????', '????????????', 2);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (10, '2022-12-04 21:05:04.245754', '???????????????????????? ???? Wi-Fi ?????? ???????????? ???????????????? ?? ???????????????? ?? ?????????? ????????????????????
?????????????? ???????????????????? Google Play ?? ???????????????????????? ?????????????????? ????????????????????, ?????? ?? ????????????-??????????????????????
????????????-?????????????????? KION ???????????? ?? ?????????????????? ???? 1 ??????: ?????????? 200 ????-??????????????, ???????????????????????? ??????????????, ???????????? ?????????????? ???? ?????????????? ????????????, ??????????????????????
???????????????????? ???????????? ?? ???????????????? ???????????????????????? ???????????????? Android
?????????????????????? ??????????????????, ??????????????, ??????????????, ???????????????????? ???? Bluetooth
?????????????????????? ????????????-?????????????????? KION ???????????? ?????????????? ???????????????? ?????????????????????? ???????????????????? ???? ???????? ?????????????? ??????????????:

???????????????????? ????????????: ??????????, ??????????????????, ???????????????? ????-?????????????? ??????????????
???????????????????????? ????????????????
?????????????????????? ?????????????????? ???? 5 ??????????????????????
?????????????? ??????????????
?????????????? ?? SD, HD, 4K ????????????????
?????????????????????????? Bluetooth - ?????????? ?????????????????? ???????????????????????? ?????????????????? ?????????? ???? ???????? ???????????????????? ????????????????, ?? ?????????? ?????????????????? ???????????????????? ???????? ?????? ???????? ??????????????????
?? ???????????????????????????? ?????????????????????? ???????????????? KION ?? ???????????????????????? ?????? Premium ?????? ?????????? ?????????????????? ???????????????? ?????????????????? ???????????? ??:

?????????????????? ???????????? MTS Music ?????? ??????????????
?????????????? ???? ??????????????????
???????????????????????????? 512 ???? ?? ???????????? ???????????? ?????????????????? ?????????????????? ?? ???????????? ????????????.
???????????????????? ???????????? ?? ???????????????? ???????????????????????? ???????????????? Android (???????????? 78*53*14 ????).', 12990, '??????', '?????????????????????????? ?????????????????? KION ?????? Smart box Premium ????????????', '????????????', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (11, '2022-12-06 23:13:22.438548', '?????????? ????????????????, ?????????????? ????????????????', 99999, '??', '???????????????? ??????????', '????????????', 2);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (12, '2022-12-06 23:25:50.519265', '???????????????? ???????????????????? ????????????', 1, '?? ?? ?????????? ??', '?????????? ??????????', '????????????', 2);


--
-- TOC entry 3360 (class 0 OID 17059)
-- Dependencies: 220
-- Data for Name: product_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 209
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 2, true);


--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 211
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 60, true);


--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 213
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 4, true);


--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 215
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 7, true);


--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 219
-- Name: product_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cart_id_seq', 13, true);


--
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 217
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 12, true);


--
-- TOC entry 3191 (class 2606 OID 17028)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3193 (class 2606 OID 17034)
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- TOC entry 3195 (class 2606 OID 17040)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3197 (class 2606 OID 17048)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 3203 (class 2606 OID 17063)
-- Name: product_cart product_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3199 (class 2606 OID 17057)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3201 (class 2606 OID 17065)
-- Name: product uk_qka6vxqdy1dprtqnx9trdd47c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);


--
-- TOC entry 3205 (class 2606 OID 17071)
-- Name: orders fk1b0m4muwx1t377w9if3w6wwqn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3207 (class 2606 OID 17081)
-- Name: product fk1mtsbur82frn64de7balymq9s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3206 (class 2606 OID 17076)
-- Name: orders fk787ibr3guwp6xobrpbofnv7le; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3204 (class 2606 OID 17066)
-- Name: image fkgpextbyee3uk9u6o2381m7ft1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3209 (class 2606 OID 17091)
-- Name: product_cart fkhpnrxdy3jhujameyod08ilvvw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3208 (class 2606 OID 17086)
-- Name: product_cart fksgnkc1ko2i1o9yr2p63ysq3rn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);


-- Completed on 2022-12-06 23:44:27

--
-- PostgreSQL database dump complete
--

