--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4 (Debian 10.4-2.pgdg90+1)
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: coin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coin (
    id integer NOT NULL,
    name character varying(255),
    symbol character varying(255),
    rank integer,
    circulating_supply bigint,
    total_supply bigint,
    max_supply bigint,
    last_updated integer,
    coinmarketcap_id integer,
    about text,
    type character varying(255),
    algorithm character varying(255),
    proof character varying(255),
    mineable boolean,
    premined boolean,
    website_name character varying(255),
    website_link character varying(255),
    medium_name character varying(255),
    medium_link character varying(255),
    reddit_name character varying(255),
    reddit_link character varying(255),
    twitter_name character varying(255),
    twitter_link character varying(255),
    telegram_name character varying(255),
    telegram_link character varying(255)
);


ALTER TABLE public.coin OWNER TO postgres;

--
-- Name: coin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coin_id_seq OWNER TO postgres;

--
-- Name: coin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coin_id_seq OWNED BY public.coin.id;


--
-- Name: coin_news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coin_news (
    id integer NOT NULL,
    coin_id integer,
    news_id integer
);


ALTER TABLE public.coin_news OWNER TO postgres;

--
-- Name: coin_news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coin_news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coin_news_id_seq OWNER TO postgres;

--
-- Name: coin_news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coin_news_id_seq OWNED BY public.coin_news.id;


--
-- Name: currency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currency (
    id integer NOT NULL,
    fiat boolean,
    symbol character varying(255)
);


ALTER TABLE public.currency OWNER TO postgres;

--
-- Name: currency_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.currency_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.currency_id_seq OWNER TO postgres;

--
-- Name: currency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.currency_id_seq OWNED BY public.currency.id;


--
-- Name: knex_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


ALTER TABLE public.knex_migrations OWNER TO postgres;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.knex_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_id_seq OWNER TO postgres;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.knex_migrations_id_seq OWNED BY public.knex_migrations.id;


--
-- Name: knex_migrations_lock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.knex_migrations_lock (
    is_locked integer
);


ALTER TABLE public.knex_migrations_lock OWNER TO postgres;

--
-- Name: news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.news (
    id integer NOT NULL,
    title text,
    content text,
    source_id integer,
    link character varying(255),
    created_at timestamp with time zone,
    counter integer
);


ALTER TABLE public.news OWNER TO postgres;

--
-- Name: news_alert; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.news_alert (
    id integer NOT NULL,
    user_id integer,
    coin_id integer,
    favourite boolean,
    alert boolean
);


ALTER TABLE public.news_alert OWNER TO postgres;

--
-- Name: news_alert_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.news_alert_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_alert_id_seq OWNER TO postgres;

--
-- Name: news_alert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.news_alert_id_seq OWNED BY public.news_alert.id;


--
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_id_seq OWNER TO postgres;

--
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- Name: price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price (
    id integer NOT NULL,
    coinmarketcap_id integer,
    currency_id integer,
    price numeric(26,10),
    volume_24h numeric(26,10),
    market_cap numeric(26,10),
    percent_change_1h numeric(8,2),
    percent_change_24h numeric(8,2),
    percent_change_7d numeric(8,2)
);


ALTER TABLE public.price OWNER TO postgres;

--
-- Name: price_alert; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price_alert (
    id integer NOT NULL,
    user_id integer,
    coinmarketcap_id integer,
    currency_id integer,
    upper boolean,
    price_point numeric(8,2),
    active boolean
);


ALTER TABLE public.price_alert OWNER TO postgres;

--
-- Name: price_alert_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.price_alert_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.price_alert_id_seq OWNER TO postgres;

--
-- Name: price_alert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.price_alert_id_seq OWNED BY public.price_alert.id;


--
-- Name: price_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.price_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.price_id_seq OWNER TO postgres;

--
-- Name: price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.price_id_seq OWNED BY public.price.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    user_id integer,
    token character varying(255)
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: source; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.source (
    id integer NOT NULL,
    name character varying(255),
    link character varying(255),
    feed character varying(255)
);


ALTER TABLE public.source OWNER TO postgres;

--
-- Name: source_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.source_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.source_id_seq OWNER TO postgres;

--
-- Name: source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.source_id_seq OWNED BY public.source.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    fiat_currency_id integer,
    coin_currency_id integer,
    email character varying(255),
    password character varying(255),
    notifications boolean
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: coin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin ALTER COLUMN id SET DEFAULT nextval('public.coin_id_seq'::regclass);


--
-- Name: coin_news id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin_news ALTER COLUMN id SET DEFAULT nextval('public.coin_news_id_seq'::regclass);


--
-- Name: currency id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency ALTER COLUMN id SET DEFAULT nextval('public.currency_id_seq'::regclass);


--
-- Name: knex_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knex_migrations ALTER COLUMN id SET DEFAULT nextval('public.knex_migrations_id_seq'::regclass);


--
-- Name: news id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- Name: news_alert id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news_alert ALTER COLUMN id SET DEFAULT nextval('public.news_alert_id_seq'::regclass);


--
-- Name: price id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price ALTER COLUMN id SET DEFAULT nextval('public.price_id_seq'::regclass);


--
-- Name: price_alert id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_alert ALTER COLUMN id SET DEFAULT nextval('public.price_alert_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: source id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.source ALTER COLUMN id SET DEFAULT nextval('public.source_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: coin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coin (id, name, symbol, rank, circulating_supply, total_supply, max_supply, last_updated, coinmarketcap_id, about, type, algorithm, proof, mineable, premined, website_name, website_link, medium_name, medium_link, reddit_name, reddit_link, twitter_name, twitter_link, telegram_name, telegram_link) FROM stdin;
80	Animecoin	ANI	1501	\N	\N	\N	1530159243	150	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
117	Slothcoin	SLOTH	1511	\N	\N	\N	1530159244	287	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
39	BetaCoin	BET	1523	\N	\N	\N	1530159253	70	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
127	CoffeeCoin	CFC	1554	\N	\N	\N	1530159244	317	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
131	Monero	XMR	12	16173339	16173339	\N	1530159244	328	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
71	Dash	DASH	14	8157816	8157816	18900000	1530159243	131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
42	Dogecoin	DOGE	40	115045890744	115045890744	\N	1530159242	74	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
59	DigiByte	DGB	44	10450322882	10450322882	21000000000	1530159242	109	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
63	ReddCoin	RDD	67	28808713174	28808713174	\N	1530159242	118	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
35	Nxt	NXT	87	998999942	998999942	1000000000	1530159253	66	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
56	Vertcoin	VTC	166	44843850	44843850	84000000	1530159242	99	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	Peercoin	PPC	188	24829185	24829185	\N	1530159242	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21	Primecoin	XPM	203	24075883	24075883	\N	1530159241	42	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
94	Einsteinium	EMC2	228	217167861	217167861	\N	1530159243	201	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
36	Unobtanium	UNO	234	198852	198852	\N	1530159242	67	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	Namecoin	NMC	279	14736400	14736400	\N	1530159243	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	Feathercoin	FTC	287	205063480	205063480	336000000	1530159243	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23	CasinoCoin	CSC	340	35973085511	39999999905	\N	1530159254	45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
97	ECC	ECC	354	25000000000	25000000000	25000000000	1530159243	212	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
66	PotCoin	POT	362	220196241	220196241	420000000	1530159242	122	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
88	BlackCoin	BLK	400	76925323	76925323	\N	1530159254	170	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
104	SolarCoin	SLR	433	44005016	98034460423	\N	1530159243	233	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
49	Omni	OMNI	438	561171	617487	\N	1530159242	83	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
54	Dimecoin	DIME	442	539096740560	539096740560	\N	1530159242	90	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
99	Rubycoin	RBY	483	25778530	25778530	\N	1530159243	215	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
122	NewYorkCoin	NYC	506	134024588760	134024588760	\N	1530159244	298	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
92	Myriad	XMY	516	1585188000	1585188000	\N	1530159254	182	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
129	VeriCoin	VRC	551	31030978	31030978	\N	1530159243	323	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
125	PinkCoin	PINK	577	381906699	392906699	\N	1530159244	313	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
128	Energycoin	ENRG	623	121992524	121992524	\N	1530159244	322	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
133	Curecoin	CURE	626	23880095	23880095	\N	1530159244	333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
79	Auroracoin	AUR	638	8658139	8658139	\N	1530159243	148	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22	Anoncoin	ANC	654	2110317	2110317	\N	1530159242	43	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
120	Bitcoin Plus	XBC	667	111214	111214	1000000	1530159244	293	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	Ixcoin	IXC	683	21004269	21004269	\N	1530159242	13	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
91	Zeitcoin	ZEIT	696	36971208523	36971208523	\N	1530159243	181	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
78	DopeCoin	DOPE	728	116845228	116845228	\N	1530159243	145	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
84	Riecoin	RIC	738	43652200	43652200	\N	1530159243	160	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
28	Quark	QRK	752	255604982	255604982	\N	1530159242	53	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
87	Uniform Fiscal Object	UFO	758	3633235012	3633235012	4000000000	1530159245	168	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	Digitalcoin	DGC	776	29433703	29433703	48166000	1530159242	18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
105	e-Gulden	EFL	807	16821493	20747433	21000000	1530159244	234	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
113	PopularCoin	POP	857	3818797621	3818797621	4999999999	1530159254	275	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
134	UnbreakableCoin	UNB	863	2278150	2278150	\N	1530159254	334	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
86	MAZA	MAZA	879	1055345280	1371778720	\N	1530159243	164	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
41	Deutsche eMark	DEM	890	39448884	46430860	\N	1530159242	72	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	BitBar	BTB	899	37823	37823	\N	1530159244	14	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	Fastcoin	FST	918	156913424	156913424	165888000	1530159242	32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
89	LiteBar	LTB	940	938169	938169	\N	1530159243	174	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
132	Litecoin Plus	LCP	944	1571598	1571598	4000000	1530159244	331	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
112	AsiaCoin	AC	1000	1655720985	1655720985	\N	1530159244	269	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
68	MaxCoin	MAX	1002	61445805	61445805	\N	1530159243	128	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
118	BlueCoin	BLU	1016	574683675	574683675	\N	1530159244	290	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
61	TeslaCoin	TES	1021	75698554	75698554	\N	1530159242	114	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
62	NobleCoin	NOBL	1031	2330319203	2330319203	\N	1530159242	117	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
70	HunterCoin	HUC	1034	22877680	22877680	\N	1530159242	130	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
123	Canada eCoin	CDN	1044	97415544	97415544	\N	1530159244	304	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
48	Orbitcoin	ORB	1052	3220616	3220616	\N	1530159242	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
43	NetCoin	NET	1069	787126712	787126712	\N	1530159253	75	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
101	FlutterCoin	FLT	1077	436450711	436450711	\N	1530159243	218	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
109	PetroDollar	XPD	1078	63993275	63993275	\N	1530159244	260	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
121	BTCtalkcoin	TALK	1089	65290635	65290635	\N	1530159244	295	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
124	Guncoin	GUN	1098	218328178	218328178	500000000	1530159244	312	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
93	Skeincoin	SKC	1101	13370687	16458796	\N	1530159243	199	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
64	Nyancoin	NYAN	1111	322805606	322805606	337000000	1530159242	120	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
32	TagCoin	TAG	1112	6433866	6433866	\N	1530159242	61	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
114	Bitstar	BITS	1126	19453346	19453346	\N	1530159244	276	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
67	Blakecoin	BLC	1136	18578811	18578811	\N	1530159242	125	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
82	Marscoin	MARS	1140	28279074	28279074	\N	1530159243	154	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
116	CannaCoin	CCN	1141	4701826	4701826	\N	1530159244	279	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
60	SmartCoin	SMC	1145	24679808	24679808	\N	1530159242	113	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
130	TEKcoin	TEK	1150	1414054562	1414054562	\N	1530159254	325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
44	Philosopher Stones	PHS	1155	6014340	6014340	\N	1530159242	76	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
75	iCoin	ICN	1165	29781663	29781663	\N	1530159243	138	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
30	SecureCoin	SRC	1175	8726006	8726006	\N	1530159242	57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	Freicoin	FRC	1180	31111513	100000000	\N	1530017641	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
96	Coin(O)	CNO	1185	105329033	105329033	\N	1530159243	206	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
25	Emerald Crypto	EMD	1189	19117129	19117129	\N	1530125642	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
107	Polcoin	PLC	1206	78436945	78436945	218500000	1530159244	257	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	Mincoin	MNC	1219	4598395	4598395	\N	1530159242	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
50	Catcoin	CAT	1222	6538150	6538150	\N	1530159244	84	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
58	RedCoin	RED	1226	74107896	74107896	\N	1530159242	103	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
115	Quebecoin	QBC	1233	15588776	36375376	42000000	1530159244	278	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
73	CacheCoin	CACH	1257	4195132	4195132	10000000	1530159254	134	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
110	PLNcoin	PLNC	1315	17089600	19089600	38540000	1530159254	263	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
40	GrandCoin	GDC	1483	\N	\N	1420609614	1530159242	71	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
100	Bela	BELA	1499	\N	39620107	41120107	1530159243	217	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1556	ContractNet	CNET	1502	\N	23000000	\N	1530159274	2834	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
156	SHACoin	SHA	1527	\N	\N	\N	1530159244	411	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
181	Storjcoin X	SJCX	1535	\N	500000000	\N	1530159245	549	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
201	SuperNET	UNITY	1539	\N	777777	\N	1530159245	643	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
263	Bubble	BUB	1569	\N	768753	\N	1530159247	918	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
139	Hyper	HYPER	1572	\N	\N	\N	1530159244	353	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
245	Vcash	XVC	1586	15438601	15438601	\N	\N	836	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
247	Sharkcoin	SAK	1587	\N	\N	\N	1529739248	841	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
266	ShellCoin	SHELL	1589	\N	99026000	\N	1529882048	924	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
242	Tether	USDT	10	2707140346	3080109502	\N	1530159248	825	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
146	Bytecoin	BCN	27	183890481254	183890481254	184470000000	1530159255	372	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
209	Verge	XVG	34	15054315539	15054315539	16555000000	1530159246	693	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
183	Emercoin	EMC	83	41937844	41937844	\N	1530159245	558	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
214	Blocknet	BLOCK	109	5208450	5208450	\N	1530159255	707	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
230	Nexus	NXS	115	58007944	58007944	\N	1530159247	789	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
186	GameCredits	GAME	169	64355352	64355352	84000000	1530159246	576	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
154	DigitalNote	XDN	176	6906847847	6906847847	8589869056	1530159254	405	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
185	Burst	BURST	209	1958200323	1958200323	2158812800	1530159245	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
194	bitCNY	BITCNY	221	157176000	157176000	\N	1530159245	624	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
218	BitBay	BAY	238	1012146906	1012146906	\N	1530159247	723	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
142	CloakCoin	CLOAK	270	5155094	5155094	\N	1530159244	362	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
193	bitUSD	BITUSD	341	11614300	11614300	\N	1530159246	623	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
262	MedicCoin	MEDIC	361	191528586	191529023	\N	1530159247	916	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
158	HempCoin	THC	373	230478760	230478760	\N	1530159244	416	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
217	Crown	CRW	403	18988807	18988807	42000000	1530159245	720	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
240	Bean Cash	BITB	419	2575181000	2575181000	50000000000	1530159255	819	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
213	MonetaryUnit	MUE	441	134377549	134377549	4000000000	1530159245	706	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
162	Clams	CLAM	466	3103419	16765193	\N	1530159245	460	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
264	MUSE	MUSE	477	14581806	18081806	\N	1530159247	920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
182	NeosCoin	NEOS	520	3862504	3862504	\N	1530159244	551	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
257	Xaurum	XAUR	540	127132970	127132970	\N	1530159247	895	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
192	FoldingCoin	FLDC	572	605470958	1000000000	\N	1530159245	606	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
223	OKCash	OK	576	74075522	74075522	105000000	1530159246	760	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
261	Sphere	SPHR	622	3082940	3082940	\N	1530159246	914	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
229	Circuits of Value	COVAL	636	1000000000	1200000000	\N	1530159246	788	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
147	ArtByte	ABY	676	792537250	792537250	\N	1530159245	374	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
211	SpreadCoin	SPR	688	10239499	10239499	\N	1530159245	702	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
176	HyperStake	HYP	690	1263327191	1263327191	\N	1530159246	525	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
256	Neutron	NTRN	699	36493238	36493238	68000000	1530159248	894	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
196	NuBits	USNBT	712	10191101	70417805	\N	1530159255	626	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
199	ExclusiveCoin	EXCL	731	4647173	4647173	\N	1530159245	633	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
251	Crave	CRAVE	760	15366648	15366648	\N	1530159247	869	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
225	vTorrent	VTR	767	11604722	11604722	20000000	1530159246	766	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
189	BunnyCoin	BUN	779	103036607564	103036607564	\N	1530159245	594	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
145	Fantomcoin	FCN	803	7272036	7272036	\N	1530159245	370	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
198	Magi	XMG	829	8071594	8071594	\N	1530159245	629	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
248	LiteDoge	LDOGE	838	15031152049	15031152049	\N	1530159247	853	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
221	Bytecent	BYC	844	2193649	2193649	\N	1530159246	734	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
227	Unitus	UIS	852	58815845	58815845	\N	1530159247	781	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
235	Machinecoin	MAC	865	21435250	21435250	\N	1530159246	812	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
236	bitSilver	BITSILVER	908	21762	21762	\N	1530159246	813	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
206	Dashcoin	DSH	915	17574970	17574970	\N	1530159247	660	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
222	Bitcoin Fast	BCF	957	15042469	15042469	2500000000	1530159246	747	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
160	Stealth	XST	996	29148391	29148391	\N	1530159245	448	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
171	Carboncoin	CARBON	1023	15392021099	15392021099	\N	1530159244	502	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
161	TrustPlus	TRUST	1039	32086595	32086595	\N	1530159245	450	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
233	IncaKoin	NKA	1045	15518598235	15520598235	\N	1530159247	797	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
210	NuShares	NSR	1047	2777600756	3134648141	\N	1530159245	699	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
234	SmileyCoin	SMLY	1064	25960250000	25960250000	\N	1530159246	799	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
170	Cryptonite	XCN	1072	421644050	421644050	\N	1530159246	501	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
200	Trollcoin	TROLL	1079	575928515	575928515	\N	1530159245	638	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
166	Truckcoin	TRK	1087	194665131	194665131	\N	1530159245	468	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
152	Startcoin	START	1092	45079785	70782220	\N	1530159245	389	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
180	Halcyon	HAL	1097	6021571	6021571	\N	1530159245	545	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
195	bitBTC	BITBTC	1104	52	52	\N	1530159246	625	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
212	Rimbit	RBT	1113	197581050	401578118	\N	1530159246	703	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
190	Opal	OPAL	1116	15148351	15148351	\N	1530159245	597	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
224	PayCoin	XPY	1124	11906464	11906464	\N	1530066846	764	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
159	BritCoin	BRIT	1125	21268092	21268092	\N	1530159244	426	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
157	BlazeCoin	BLZ	1130	608557394	608557394	\N	1530159244	415	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
202	GlobalBoost-Y	BSTY	1144	14621176	14621176	\N	1530159245	644	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
197	Sterlingcoin	SLG	1158	4241006	4241006	\N	1530159245	627	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
177	Joincoin	J	1169	3131411	3131411	\N	1530159246	536	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
174	Titcoin	TIT	1170	49898202	49898202	\N	1530159244	513	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
254	8Bit	8BIT	1173	1467841	1467841	\N	1530159247	890	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
149	Granite	GRN	1187	39366300	40016300	65000000	1530159245	382	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
144	Coin2.1	C2	1193	78245975	133273764	\N	1530159245	367	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
136	QuazarCoin	QCN	1209	7133042	7133042	\N	1528332844	338	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
163	Quatloo	QTL	1210	7718883	7718883	\N	1530159244	461	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
204	Prime-XI	PXI	1218	21198130	21198130	\N	1530159246	656	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
191	Acoin	ACOIN	1228	1220085	1220085	\N	1530159246	601	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
175	Virtacoin	VTA	1234	5201310113	12666916683	21000000000	1530159255	520	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
267	Crypto	CTO	1237	13742738	13742738	\N	1530159247	933	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
239	PayCon	CON	1245	23042604	23042604	\N	1530159246	818	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
258	Californium	CF	1251	2446961	2446961	\N	1530159247	898	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
228	GoldPieces	GP	1255	1220161	1220161	\N	1530159246	785	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
249	SongCoin	SONG	1268	32565300	32565300	\N	1530159246	857	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
135	CryptCoin	CRYPT	1487	\N	6070409	\N	1530159245	337	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
772	XTD Coin	XTD	1506	\N	\N	\N	1530159258	1907	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
293	Axiom	AXIOM	1563	\N	\N	\N	1530159248	1020	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
387	PrismChain	PRM	1564	\N	\N	\N	1530159250	1271	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
333	AvatarCoin	AV	1570	\N	\N	\N	1530159249	1146	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
386	RichCoin	RICHX	1576	\N	5925522	\N	1530159249	1269	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
362	Lisk	LSK	24	107404900	122651348	\N	1530159249	1214	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
302	Siacoin	SC	32	35331238670	35331238670	\N	1530159248	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
368	Steem	STEEM	35	265419997	282394091	\N	1530159249	1230	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
388	Waves	WAVES	41	100000000	100000000	\N	1530159250	1274	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
367	DigixDAO	DGD	55	2000000	2000000	\N	1530159249	1229	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
315	Factom	FCT	98	8745102	8745102	\N	1530159248	1087	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
340	SaluS	SLS	248	1010662	1010662	\N	1530159248	1159	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
295	Aeon	AEON	277	15831459	15831459	\N	1530159248	1026	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
391	ION	ION	280	21345024	27245024	\N	1530159249	1281	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
294	LEOcoin	LEO	356	101743211	110100629	1000000000	1530159247	1022	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
304	Shift	SHIFT	366	12186140	12186140	\N	1530159248	1050	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
357	RevolutionVR	RVR	386	210000000	210000000	210000000	1530159249	1208	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
337	Radium	RADS	452	3499814	3499814	\N	1530159249	1154	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
303	Global Currency Reserve	GCR	498	104280024	104280024	\N	1530159248	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
311	Expanse	EXP	503	7906397	16906397	\N	1530159248	1070	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
288	Sprouts	SPRTS	513	14155438010585	14155438010585	\N	1530159248	1002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
279	Hexx	HXX	517	1667249	1667249	9999999	1530159247	977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
399	Rise	RISE	536	126213032	126213032	\N	1530159250	1294	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
370	Espers	ESP	598	21820752470	21820752470	50000000000	1530159249	1238	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
339	Yocoin	YOC	625	112194700	171704700	336000000	1530159248	1156	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
378	2GIVE	2GIVE	680	519365621	519365621	\N	1530159249	1252	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
372	HiCoin	XHI	682	4434602828	10000244678	\N	1530159250	1244	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
323	Elite	1337	701	26209489026	29011842141	\N	1530159249	1109	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
277	EuropeCoin	ERC	716	10080585	10080585	32000000	1530159248	964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
334	RussiaCoin	RC	739	8377873	8377873	\N	1530159249	1147	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
350	Memetic / PepeCoin	MEME	753	22670246	23037499	\N	1530159249	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
396	Breakout	BRK	761	18949258	18949258	\N	1530159250	1286	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
335	EverGreenCoin	EGC	780	13625343	13625343	\N	1530159249	1148	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
336	Creditbit	CRB	833	16691694	16691694	\N	1530159249	1153	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
384	MarteXcoin	MXT	867	3026849	3026849	5000000	1530159250	1266	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
327	DraftCoin	DFT	870	7912674	17912674	\N	1530159248	1120	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
283	Bitzeny	ZNY	889	75614500	197510000	250000000	1530159248	990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
276	FujiCoin	FJC	897	1310942755	1310942755	10000000000	1530159248	960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
369	Fantasy Cash	FANS	921	4602101	4602101	\N	1530159249	1234	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
354	BigUp	BIGUP	933	2137572489	2137572489	\N	1530159249	1198	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
393	Mineum	MNM	948	9436367	9586367	\N	1530159250	1283	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
274	bitEUR	BITEUR	950	107706	107706	\N	1530159247	954	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
310	Influxcoin	INFX	955	1673383	1673383	\N	1530159248	1069	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
348	KiloCoin	KLC	995	196297971	10025186872	\N	1530132849	1182	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
272	AudioCoin	ADC	1028	900564261	900564261	\N	1530159247	948	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
331	Adzcoin	ADZ	1046	43832201	43832201	84000000	1530159248	1136	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
332	Moin	MOIN	1082	7686117	7686117	\N	1530159248	1141	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
273	Synergy	SNRG	1095	3770122	3770122	\N	1530159247	951	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
373	AquariusCoin	ARCO	1100	1798740	1798740	\N	1530159250	1247	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
353	HOdlcoin	HODL	1107	164342925	250000000	\N	1530159249	1195	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
292	Manna	MANNA	1120	74579828	10043673073	\N	1530159248	1019	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
389	ICO OpenLedger	ICOO	1123	465952	465952	\N	1530159249	1276	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
342	Evil Coin	EVIL	1133	21020383	21020383	\N	1530159249	1165	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
318	Prototanium	PR	1149	196878	196878	\N	1530159248	1093	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
364	PostCoin	POST	1153	15868233	15868233	\N	1530159249	1218	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
307	SpaceCoin	SPACE	1159	23397598	23397598	\N	1530159247	1058	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
360	MojoCoin	MOJO	1161	12223022	12223022	\N	1530159249	1212	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
316	ParallelCoin	DUO	1166	314719	314719	\N	1530159267	1089	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
319	DigiCube	CUBE	1168	2429126009	2429126009	\N	1530119348	1100	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
395	GoldBlocks	GB	1172	15561232	15561232	\N	1530159250	1285	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
365	BERNcash	BERN	1181	71234301	71234301	\N	1530159250	1223	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
355	NevaCoin	NEVA	1184	3093305	3093305	\N	1530159249	1200	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
351	C-Bit	XCT	1194	157625875	157625875	\N	1530159249	1193	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
289	Helleniccoin	HNC	1198	67290382	67290382	100000000	1530159247	1004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
314	Swing	SWING	1203	3400040	3400040	\N	1530159248	1085	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
356	BumbaCoin	BUMBA	1214	23022694	23022694	\N	1530159249	1206	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
326	SecretCoin	SCRT	1220	4228672	4228672	\N	1529673850	1113	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
377	SixEleven	611	1223	449787	449787	\N	1530159250	1251	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
374	Bitcoin 21	XBTC21	1236	793108	7093108	\N	1529594952	1248	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
300	AmsterdamCoin	AMS	1242	50201886	81469427	\N	1530159247	1035	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
301	Eurocoin	EUC	1243	12416554	12416554	\N	1530159248	1038	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
397	Debitcoin	DBTC	1247	17999629	25999629	\N	1530159250	1288	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
398	Comet	CMT	1262	872830	872830	\N	1530159250	1291	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
371	FuzzBalls	FUZZ	1272	4829945	4829945	\N	1530159249	1241	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
291	Flaxscript	FLAX	1273	5623369	5623369	\N	1530159247	1010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
299	GuccioneCoin	GCC	1282	20285537	23775537	\N	1530159247	1033	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
347	Asiadigicoin	ADCN	1287	24931054	210000000	\N	1530159249	1176	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
269	ARbit	ARB	1297	8203320	8203320	\N	1530159247	938	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
338	Litecred	LTCR	1301	30227750	30227750	\N	1529611151	1155	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
305	VectorAI	VEC2	1308	17462801	17462801	\N	1530159247	1052	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
358	PosEx	PEX	1318	2453240	2453240	\N	1530092349	1209	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
285	AnarchistsPrime	ACP	1325	4394874	4394874	53760000	1530159248	994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
281	CrevaCoin	CREVA	1331	36390750	6240390800	\N	1530159247	986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
380	Alphabit	ABC	1458	\N	210000000	\N	1530159250	1256	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
390	Powercoin	PWR	1461	\N	500125816646	\N	1530159250	1279	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
383	TeslaCoilCoin	TESLA	1476	\N	100000000	\N	1530159250	1264	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
330	ClubCoin	CLUB	1485	\N	99888750	160000000	1530159249	1135	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
363	EDRCoin	EDRC	1498	\N	3407292	\N	1530159249	1216	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1451	Decentralized Machine Learning	DML	1507	\N	272937007	\N	1530159272	2679	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
515	Avoncoin	ACN	1508	\N	\N	\N	1530159253	1533	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
529	UR	UR	1528	\N	\N	\N	1530159253	1561	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
454	Levocoin	LEVO	1531	\N	\N	\N	1530159251	1429	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
412	First Bitcoin	BIT	1536	\N	20707629255	\N	1530159250	1323	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
437	Tellurion	TELL	1550	\N	\N	\N	1530159251	1393	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
419	Aces	ACES	1556	\N	\N	\N	1530159251	1351	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
453	Sakuracoin	SKR	1562	\N	\N	105100000	1530159251	1425	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
468	Regacoin	REGA	1566	\N	42403494	\N	1530159252	1459	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
414	UGAIN	GAIN	1574	\N	\N	\N	1530159250	1336	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
449	Rcoin	RCN	1575	\N	\N	\N	1530159251	1418	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
456	Cubits	QBT	1584	\N	73335366	300000000	1530137351	1435	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
458	Zcash	ZEC	22	4233919	4233919	\N	1530159251	1437	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
503	Maker	MKR	38	618228	1000000	\N	1530159253	1518	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
417	Stratis	STRAT	46	98912551	98912551	\N	1530159250	1343	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
505	Komodo	KMD	59	104254000	104254000	\N	1530159252	1521	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
448	ZCoin	XZC	106	5061709	5061709	21400000	1530159251	1414	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
446	Iconomi	ICN	130	99156976	99156976	\N	1530159251	1408	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
461	ZClassic	ZCL	196	4275150	4275150	21000000	1530159252	1447	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
447	SingularDTV	SNGLS	267	600000000	1000000000	\N	1530159251	1409	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
490	Wings	WINGS	288	89708333	100000000	\N	1530159252	1500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
478	DECENT	DCT	293	51306089	73197775	\N	1530159252	1478	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
408	Steem Dollars	SBD	303	15285834	15285834	\N	1530159251	1312	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
444	FirstBlood	1ST	343	85558371	93468691	\N	1530159251	1403	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
475	Pascal Coin	PASC	397	21829900	21829900	\N	1530159252	1473	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
435	Tao	XTO	405	32997063	32997063	\N	1530159251	1391	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
526	Chronobank	TIME	409	710113	710113	\N	1530159253	1556	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
452	Triggers	TRIG	414	32105578	32105578	\N	1530159252	1423	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
422	E-Dinar Coin	EDR	436	886211988	1011211988	999999999999999	1530159250	1358	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
477	Incent	INCNT	469	46016602	46016625	\N	1530159252	1475	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
429	LoMoCoin	LMC	501	236567932	321567932	\N	1530159251	1380	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
530	Swarm City	SWT	554	8274956	8274956	\N	1530159254	1562	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
479	Golos	GOLOS	584	124518891	124518891	\N	1530159252	1480	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
462	Zoin	ZOI	620	17902003	17902003	21000000	1530159251	1448	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
436	Pluton	PLU	627	850000	20000000	20000000	1530159251	1392	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
511	Waves Community Token	WCT	643	9964597	10000000	\N	1530159253	1527	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
404	Syndicate	SYNX	670	19531650	19531650	\N	1530159250	1304	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
415	Karbo	KRB	673	6102946	6102946	\N	1530159250	1340	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
426	B3Coin	KB3	684	729191520	729191520	\N	1530159251	1371	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
514	Global Cryptocurrency	GCC	700	1028276868	1418523436	2400000000	1530159253	1531	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
481	vSlice	VSL	722	33390496	33390496	\N	1530159252	1483	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
471	Hush	HUSH	763	4171838	4171838	21000000	1530159252	1466	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
491	Dix Asset	DIX	822	100000000000	100000000000	\N	1530159252	1501	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
402	PutinCoin	PUT	859	438223059	438223059	2000000000	1530159250	1299	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
528	Renos	RNS	883	33356077	33356077	\N	1530159253	1559	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
510	Zilbercoin	ZBC	904	7482298	9189021	\N	1530159253	1526	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
470	Veros	VRS	909	12787240	100000000	\N	1530159252	1465	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
520	Centurion	CNT	928	77663826	82663826	250000000	1530159253	1546	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
405	Cryptojacks	CJ	943	406568581	406568581	\N	1530159250	1306	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
517	Eryllium	ERY	966	12552178	17233560	100000000	1530159253	1535	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
522	Master Swiscoin	MSCN	974	45143320	1007644415	\N	1530159253	1550	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
521	Marijuanacoin	MAR	977	1631601	1631601	\N	1530159253	1548	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
423	Artex Coin	ATX	981	18781750	268781750	500000000	1530159250	1361	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
500	BitConnect	BCC	998	9667978	10440557	28000000	1530159252	1513	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
430	Bitcloud	BTDX	1017	23603437	23603437	43800000	1530159250	1381	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
492	Darcrus	DAR	1054	13600388	13600388	\N	1530159252	1503	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
493	InflationCoin	IFLT	1063	44790092020	44790092020	\N	1530159252	1504	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
413	Elementrem	ELE	1114	26133566	26133566	\N	1530159250	1334	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
508	Tattoocoin (Standard Edition)	TSE	1122	90421856	90421856	\N	1530159253	1524	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
400	ChessCoin	CHESS	1129	54032769	54032769	\N	1530159250	1297	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
467	Bitcurrency	BTCR	1135	169598616	169598616	\N	1530159252	1457	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
513	KushCoin	KUSH	1137	5563795	5563795	\N	1530159253	1529	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
450	Atomic Coin	ATOM	1151	16552595	16552595	252000000	1530159251	1420	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
472	Kurrent	KURT	1186	61364813	72764813	228000000	1530159252	1468	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
439	MustangCoin	MST	1216	630343	630343	3000000	1530159251	1396	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
434	Jin Coin	JIN	1229	9960402	9960402	9960595	1530159251	1390	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
516	BOAT	BOAT	1244	71245209	71245209	\N	1530159253	1534	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
438	Dollarcoin	DLC	1252	9106714	9106714	\N	1529909354	1395	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
524	Allion	ALL	1258	6199359	7323359	\N	1530159253	1554	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
497	BenjiRolls	BENJI	1266	20276099	20276099	\N	1530159252	1509	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
416	VapersCoin	VPRC	1267	780124964	1635124964	\N	1530159251	1341	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
466	ZetaMicron	ZMC	1280	600344291	600344291	\N	1530159251	1456	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
451	JobsCoin	JOBS	1286	106019270	200019300	\N	1530159251	1421	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
433	Zayedcoin	ZYD	1289	6243840	6243840	\N	1530159251	1389	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
425	Veltor	VLT	1290	554855	554855	\N	1530159251	1368	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
440	Beatcoin	XBTS	1295	1524686	2524686	\N	1530159251	1397	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
473	Creatio	XCRE	1300	20520514	20520514	\N	1530159252	1469	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
527	Argus	ARGUS	1320	1148324	5194373	\N	1530159253	1558	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
525	PRCoin	PRC	1321	22351800	802351800	\N	1530159253	1555	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
482	Dollar Online	DOLLAR	1324	753776	9601412	\N	1530071352	1485	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
474	Rawcoin	XRC	1326	704882	704882	\N	1530039249	1472	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
483	Vault Coin	VLTC	1334	30385540	530385540	1000000000	1530159252	1486	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
507	Magnum	MGM	1335	4340966	254340966	\N	1530159253	1523	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
489	Fargocoin	FRGC	1424	\N	529388114	\N	1530159252	1497	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
418	President Trump	PRES	1470	\N	57968072167	\N	1530159251	1348	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
420	President Johnson	GARY	1475	\N	57968072167	\N	1530159250	1352	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
463	WA Space	WA	1479	\N	\N	\N	1530159252	1449	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
485	T-coin	TCOIN	1497	\N	\N	\N	1530159252	1489	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
552	ZSEcoin	ZSE	1514	\N	7110804	\N	1530159254	1598	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
622	STEX	STEX	1515	\N	100000000	\N	1530159255	1707	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
532	MarxCoin	MARX	1525	\N	49312080	\N	1530159253	1565	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
658	Antimatter	ANTX	1532	\N	\N	\N	1530159256	1753	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
566	BlazerCoin	BLAZR	1537	\N	\N	\N	1530159254	1623	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
650	Huncoin	HNC	1541	\N	44355213	\N	1530159256	1742	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
600	Halloween Coin	HALLO	1553	\N	264678458	1500000000	1530159255	1679	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
640	Cheapcoin	CHEAP	1560	\N	\N	\N	1530159255	1728	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
649	Bitok	BITOK	1590	\N	2000000000	\N	1529819661	1741	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
617	Aeternity	AE	28	233020472	273685830	\N	1530159255	1700	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
534	Nano	NANO	39	133248289	133248289	133248290	1530159253	1567	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
656	GXChain	GXS	62	60000000	100000000	100000000	1530159256	1750	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
544	Ark	ARK	68	103485578	134735578	\N	1530159254	1586	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
661	FunFair	FUN	73	5010848189	10999873621	\N	1530159256	1757	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
625	Veritaseum	VERI	89	2036645	100000000	\N	1530159255	1710	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
636	SONM	SNM	126	359600000	444000000	\N	1530159255	1723	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
576	iExec RLC	RLC	135	80070793	86999785	\N	1530159255	1637	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
601	Aragon	ANT	145	28215645	39609524	\N	1530159254	1680	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
588	Gnosis	GNO	150	1104590	10000000	\N	1530159255	1659	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
559	Asch	XAS	153	93355331	114855331	\N	1530159254	1609	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
626	Electra	ECA	171	25923745299	26790901852	30000000000	1530159256	1711	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
585	Bitcore	BTX	236	15586120	17040347	21000000	1530159255	1654	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
602	PRIZM	PZM	247	21045854	21045854	6000000000	1530159255	1681	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
589	TokenCard	TKN	249	24279448	39406760	\N	1530159254	1660	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
629	MobileGo	MGO	275	98028877	100000000	\N	1530159255	1715	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
548	TaaS	TAAS	301	8146001	8146001	\N	1530159254	1592	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
549	Soarcoin	SOAR	313	1076641972	5000000000	5000000000	1530159253	1595	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
632	Peerplays	PPY	337	4421720	5538347	\N	1530159255	1719	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
547	Mercury	MER	348	100000000	100000000	\N	1530159253	1590	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
646	Elastic	XEL	363	91676277	100000000	\N	1530159256	1737	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
624	Quantum	QAU	369	74867103	239775150	\N	1530159255	1709	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
641	Cofound.it	CFI	376	325000000	500000000	\N	1530159256	1729	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
660	Flash	FLASH	393	900000000	900000000	900000000	1530159256	1755	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
560	DubaiCoin	DBIX	445	2232901	2232901	\N	1530159254	1611	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
598	Etheroll	DICE	456	7001623	7001623	7001622	1530159255	1677	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
545	Dynamic	DYN	511	5000598	14088918	\N	1530159254	1587	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
608	APX	APX	547	703179	803179	\N	1530159255	1688	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
539	Musicoin	MUSIC	562	776117568	776117568	\N	1530159253	1577	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
577	WeTrust	TRST	596	92147500	100000000	100000000	1530159255	1638	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
634	Mysterium	MYST	628	23004415	32433366	\N	1530159256	1721	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
567	Atmos	ATMOS	656	100576504	110576504	\N	1530159254	1624	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
612	Sumokoin	SUMO	672	5903148	14792037	88888888	1530159255	1694	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
579	Altcoin	ALT	730	123175	134063	\N	1530159254	1642	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
616	Ethbits	ETBS	775	1391604	1634691	\N	1530159255	1699	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
597	Creativecoin	CREA	802	14916651	14916651	115000000	1530159255	1676	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
590	Condensate	RAIN	824	220446730	220446730	500000000	1530159255	1662	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
648	Miners' Reward Token	MRT	847	10000000	10000000	\N	1530159256	1739	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
635	More Coin	MORE	860	2000000	30000000	\N	1530159255	1722	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
637	Linx	LINX	866	26173143	27173143	100000000	1530159256	1724	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
654	Onix	ONX	891	107072781	112119457	1151920000	1530159256	1747	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
609	MCAP	MCAP	902	10490000	100000000	\N	1530159255	1690	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
578	DeusCoin	DEUS	916	11079837	100005000	\N	1530159254	1640	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
594	iTicoin	ITI	920	32000	9999992	\N	1530159255	1671	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
595	Minereum	MNE	932	3210136	3210136	\N	1530159255	1673	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
583	ProCurrency	PROC	938	98752056	15005936851	\N	1530159255	1650	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
647	Coupecoin	COUPE	980	218281462	8001599000	\N	1530159256	1738	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
610	Project-X	NANOX	984	0	1	\N	1530159255	1691	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
564	E-coin	ECN	1011	350363	213270119	\N	1529942358	1618	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
657	Goodomy	GOOD	1014	620508777	888000000	\N	1530159256	1752	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
568	Ethereum Movie Venture	EMV	1043	6566666	6666666	\N	1529466559	1625	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
555	Universe	UNI	1057	27087221	38287221	\N	1530159254	1605	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
571	Zennies	ZENI	1068	1000812836	1000812836	\N	1530159254	1629	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
659	Bitradio	BRO	1071	6521407	11521411	\N	1530159256	1754	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
599	InsaneCoin	INSN	1080	20924820	21174820	30000000	1530159255	1678	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
543	Netko	NETKO	1094	5671315	5671315	\N	1530159253	1582	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
653	Leviar	XLC	1108	12250321	12250321	54000000	1530159256	1746	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
580	WavesGo	WGO	1152	8978579	8978581	\N	1530159254	1643	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
557	Impact	IMX	1163	110029768	110029768	\N	1530159254	1607	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
644	Octanox	OTX	1177	8500001	8500001	\N	1530159255	1733	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
630	Ammo Reloaded	AMMO	1211	77777777	77777777	\N	1530159256	1716	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
642	GlobalToken	GLT	1217	27971200	27971200	168000000	1530159256	1731	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
584	SpeedCash	SCS	1230	533323	546123	\N	1530159255	1651	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
611	Theresa May Coin	MAY	1235	50027600	50027600	100000000	1530159256	1693	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
631	Neuro	NRO	1246	54551527	56551527	\N	1530159256	1717	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
655	Bitcoin Planet	BTPL	1253	6804362	7302962	\N	1530159256	1748	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
551	Bankcoin	B@	1263	10291781	25000000	\N	1530159254	1597	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
591	Gold Pressed Latinum	GPL	1274	256527	256527	1000000	1530159255	1665	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
542	Honey	HONEY	1281	455955	455955	\N	1530159253	1581	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
593	FUNCoin	FUNC	1285	5848581	100000000	100000000	1530159255	1670	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
553	HealthyWormCoin	WORM	1291	115411545	115411545	\N	1530159254	1602	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
651	KingN Coin	KNC	1306	2009	2509	420000	1530159256	1743	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
538	MiloCoin	MILO	1314	10789954	10789954	30015000	1530159253	1576	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
541	BioBar	BIOB	1330	885756	985756	\N	1530159253	1579	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
574	Concoin	CONX	1333	744266	1595266	\N	1530159254	1632	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
535	LevoPlus	LVPS	1337	2052712	93052712	\N	1530159253	1568	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
621	Aidos Kuneen	ADK	1420	\N	25000000	\N	1530159255	1706	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
613	ZenGold	ZENGOLD	1471	\N	\N	\N	1530159255	1695	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
573	Internet of Things	XOT	1477	\N	21000000	21000000	1530159254	1631	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
735	ERA	ERA	1504	\N	6022910	240000000	1530159258	1851	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
776	Protean	PRN	1530	\N	\N	\N	1530159259	1913	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
741	Minex	MINEX	1533	\N	30000000	\N	1530159258	1863	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
733	Birds	BIRDS	1534	\N	\N	\N	1530159258	1849	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
682	UniversalRoyalCoin	UNRC	1551	\N	\N	\N	1530159259	1783	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
720	Royalties	XRY	1558	\N	18446748239	\N	1530159258	1835	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
732	Aseancoin	ASN	1561	\N	\N	\N	1530159257	1848	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
743	Wink	WINK	1567	\N	\N	80000000	1530159258	1865	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
782	SIGMAcoin	SIGMA	1580	\N	\N	\N	1530017957	1921	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
668	TurboCoin	TURBO	1585	\N	\N	\N	1530083956	1767	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
724	Binance Coin	BNB	15	114041290	194972068	\N	1530159258	1839	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
700	OmiseGO	OMG	21	102042552	140245398	\N	1530159257	1808	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
744	Bytom	BTM	30	1002499275	1407000000	\N	1530159258	1866	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
773	Nebulas	NAS	45	45500000	100000000	100000000	1530159259	1908	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
688	Populous	PPT	50	37004027	53252246	53252246	1530159257	1789	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
791	Loopring	LRC	56	572074043	1374956262	\N	1530159258	1934	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
785	Waltonchain	WTC	58	31144099	70000000	100000000	1530159259	1925	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
749	Dentacoin	DCN	72	325226613094	1963173416169	8000000000000	1530159262	1876	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
676	Monaco	MCO	91	15793831	31587682	\N	1530159256	1776	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
714	SmartCash	SMART	105	1053773052	1654817331	5000000000	1530159257	1828	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
672	Storj	STORJ	124	135787539	424999998	\N	1530159256	1772	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
780	Achain	ACT	132	541504084	1000000000	1000000000	1530159259	1918	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
699	Santiment Network Token	SAN	141	62660371	83337000	\N	1530159257	1807	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
713	Particl	PART	167	10018466	9022466	\N	1530159257	1826	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
687	Metal	MTL	198	25130243	66588888	\N	1530159257	1788	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
669	AdEx	ADX	210	73430701	100000000	100000000	1530159257	1768	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
705	Linda	LINDA	219	9040059492	9040059492	30000000000	1530159258	1814	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
679	Wagerr	WGR	237	183000000	198360471	200000000	1530159257	1779	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
738	district0x	DNT	284	600000000	1000000000	\N	1530159258	1856	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
766	YOYOW	YOYOW	306	272173444	300000000	1000000000	1530159258	1899	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
742	Blox	CDT	314	661987039	1000000000	\N	1530159258	1864	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
702	CVCoin	CVCOIN	382	9837033	15000000	\N	1530159257	1810	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
752	DeepOnion	ONION	384	15450839	20499963	25000000	1530159258	1881	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
683	Polybius	PLBT	392	3969565	3969565	\N	1530159256	1784	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
685	SunContract	SNC	404	119775804	122707503	\N	1530159257	1786	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
704	Rialto	XRL	422	76874279	100000000	\N	1530159257	1812	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
740	Stox	STX	457	42383707	57206476	\N	1530159258	1861	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
748	Blocktix	TIX	460	40000000	62500000	\N	1530159258	1873	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
759	InvestFeed	IFT	492	191381257	191381257	\N	1530159258	1888	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
779	bitqy	BQ	500	3112671431	10000000000	\N	1530159259	1917	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
726	Primalbase Token	PBT	610	1250	1250	1250	1530159258	1841	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
703	Nimiq Exchange Token	NET	611	10500000	10500000	\N	1530159257	1811	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
718	ToaCoin	TOA	616	2551671058	9006799258	\N	1530159257	1833	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
754	AdShares	ADST	642	19379103	19379103	\N	1530159258	1883	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
710	Starta	STA	693	5200017	5293348	\N	1530159257	1819	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
750	Rupaya	RUPX	711	27501288	27501288	\N	1530159258	1877	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
670	Denarius	DNR	733	3083062	3083062	10000000	1530159256	1769	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
783	Monoeci	XMCC	764	4896144	7316144	\N	1530159259	1922	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
677	CryptoPing	PING	769	9952089	9952089	\N	1530159256	1777	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
665	Ergo	EFYT	801	397300	5000000	5000000	1530159256	1762	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
778	BiblePay	BBP	812	729941409	729941409	5200000000	1530159258	1916	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
698	Sovereign Hero	HERO	843	4773	4773	\N	1530159257	1805	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
739	FundYourselfNow	FYN	872	927377	12500000	\N	1530159259	1857	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
790	Suretly	SUR	895	221989	237614	\N	1530159259	1933	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
734	Cream	CRM	911	45108749	45108749	100000000	1530159258	1850	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
745	Mao Zedong	MAO	925	6269298	6269298	\N	1530159258	1869	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
777	AdCoin	ACC	926	6500599	71493082	\N	1530159259	1915	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
693	DaxxCoin	DAXX	945	520891780	545891780	\N	1530159257	1797	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
696	Global Tour Coin	GTC	967	29887402	89786652	\N	1530159257	1801	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
786	BROTHER	BRAT	972	160000000	1000000000	\N	1530159259	1926	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
711	BitCoal	COAL	978	4500000	4500000	12500000	1530159257	1824	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
689	WomenCoin	WOMEN	982	44220400	44220400	25000000000	1530159257	1790	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
694	FuturXe	FXE	986	235421	84000000	\N	1530159257	1798	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
762	The ChampCoin	TCC	993	164925727	218000000	516085281	1530159258	1894	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
671	DAO.Casino	BET	1005	167270821	167270821	\N	1530159256	1771	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
753	BlockCAT	CAT	1018	7360121	9200151	\N	1530159258	1882	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
758	Monster Byte	MBI	1036	16822736	40000000	\N	1530013755	1887	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
747	NEVERDIE	NDC	1051	41004200	400000000	\N	1530159258	1872	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
761	Etheriya	RIYA	1061	1581531	1861531	100000000	1530159258	1890	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
706	Embers	MBRS	1065	50000000	50000000	\N	1530159257	1815	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
767	Growers International	GRWI	1093	1187325	1187325	\N	1530100459	1900	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
709	Bit20	BTWTY	1105	1	1	\N	1530154157	1818	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
725	300 Token	300	1183	300	300	300	1530154157	1840	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
760	CoinonatX	XCXT	1207	18961909	18961909	48252000	1530159259	1889	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
794	Fujinto	NTO	1215	65802448	400000000	\N	1530159259	1938	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
721	Signatum	SIGT	1227	107972766	107972766	\N	1530159257	1836	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
678	Useless Ethereum Token	UET	1259	3965716	3965716	\N	1528333162	1778	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
756	BitAsean	BAS	1277	5000000	30000000	\N	1530159258	1885	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
673	BnrtxCoin	BNX	1283	32655001	32655001	\N	1530110657	1773	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
764	Bolenum	BLN	1296	10000000	10000000	\N	1530159259	1897	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
680	Slevin	SLEVIN	1303	70000000	70000000	\N	1530159258	1781	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
674	SocialCoin	SOCC	1322	1384879	1384879	\N	1530159257	1774	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
787	Ulatech	ULA	1336	213187	54213187	90000000	1530159259	1927	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
774	ATMCoin	ATMC	1341	\N	10000000000	\N	1530159258	1910	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
692	Sphre AIR 	XID	1433	\N	30820620	\N	1530159257	1795	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
728	EmberCoin	EMB	1459	\N	861773921917	\N	1530159258	1843	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
746	First Bitcoin Capital	BITCF	1474	\N	3415923	\N	1530159258	1871	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
695	Rupee	RUP	1488	\N	24766900	84000000	1530159257	1799	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
859	EncryptoTel [ETH]	ETT	1505	\N	77663987	\N	1530159260	2018	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
903	Dutch Coin	DUTCH	1522	\N	\N	\N	1530159261	2067	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
890	Akuya Coin	AKY	1543	\N	5202901	\N	1530159262	2054	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
804	Magnetcoin	MAGN	1549	\N	6236171	\N	1530159260	1952	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
797	Cyder	CYDER	1571	\N	80000000	\N	1530159259	1945	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
825	Wi Coin	WIC	1579	\N	100000000	\N	1530159260	1979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
916	Bitcoin Gold	BTG	29	17091486	17191486	21000000	1530159261	2083	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
861	RChain	RHOC	42	360631360	870663574	1000000000	1530159261	2021	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
917	KuCoin Shares	KCS	53	90730576	180730576	\N	1530159262	2087	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
828	Kyber Network	KNC	76	134132697	215625349	\N	1530159260	1982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
838	Kin	KIN	78	756097560976	10000000000000	\N	1530159260	1993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
815	Decentraland	MANA	90	1050141509	2644403343	\N	1530159260	1966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
922	Nuls	NULS	99	40000000	40000000	\N	1530159261	2092	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
830	Substratum	SUB	104	383021000	472000000	\N	1530159259	1984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
841	SALT	SALT	122	59203151	120000000	\N	1530159260	1996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
806	Neblio	NEBL	143	13267190	14008718	\N	1530159259	1955	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
906	Request Network	REQ	148	697341633	999991397	\N	1530159261	2071	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
925	BOScoin	BOS	173	445898741	500000000	\N	1530159263	2095	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
914	Ambrosus	AMB	179	144590975	361477438	\N	1530159262	2081	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
926	Ripio Credit Network	RCN	263	491280791	999942647	\N	1530159261	2096	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
858	KickCoin	KICK	274	488493725	524878681	\N	1530159260	2017	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
894	AirSwap	AST	281	150000000	500000000	\N	1530159262	2058	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
812	Credo	CREDO	295	549891703	1374729257	\N	1530159259	1963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
802	Hive Project	HVN	316	375000000	500000000	\N	1530159259	1950	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
835	COSS	COSS	332	118810622	200000000	200000000	1530159260	1989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
849	Cobinhood	COB	367	363794097	1000000000	\N	1530159261	2006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
860	Viberate	VIB	368	170719799	200000000	\N	1530159260	2019	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
897	BlockMason Credit Protocol	BCPT	371	73348514	116158667	\N	1530159261	2061	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
884	Zeusshield	ZSC	374	1153170765	5642500000	\N	1530159261	2047	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
911	LIFE	LIFE	375	88942165923	100000000000	100000000000	1530159261	2078	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
845	ColossusXT	COLX	380	10942581566	11002114946	\N	1530159261	2001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
902	Everus	EVR	406	144973132	1000000000	\N	1530159261	2066	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
842	Ormeus Coin	ORME	411	17029321	200000000	\N	1530159260	1998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
822	Propy	PRO	420	19495147	100000000	\N	1530159260	1974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
872	Everex	EVX	423	16500000	25000000	\N	1530159262	2034	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
805	Moeda Loyalty Points	MDA	463	19628888	19628888	\N	1530159259	1954	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
799	Monetha	MTH	468	217471923	402400000	\N	1530159259	1947	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
905	DomRaider	DRT	497	591500000	1300000000	\N	1530159261	2070	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
918	EXRNchain	EXRN	509	92500000000	100000000000	\N	1530159261	2088	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
874	AirToken	AIR	524	1050000000	1491492558	\N	1530159260	2037	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
915	ICOS	ICOS	527	548607	560417	\N	1530159262	2082	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
800	Aventus	AVT	545	6000000	10000000	\N	1530159259	1948	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
896	Change	CAG	565	37109987	79184116	\N	1530159261	2060	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
878	BitcoinZ	BTCZ	597	2080612701	2080612701	21000000000	1530159260	2041	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
877	ALIS	ALIS	607	38805314	75209200	\N	1530159261	2040	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
826	Elixir	ELIX	621	31928096	31928096	\N	1530159260	1980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
919	ClearPoll	POLL	624	6999991	8999992	\N	1530159262	2089	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
819	ATBCoin	ATB	649	41988405	53965205	300000000	1530159260	1970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
862	Internxt	INXT	671	629610	629610	629610	1530159262	2022	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
879	HelloGold	HGT	721	263034654	1000000000	\N	1530159261	2042	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
816	Indorse Token	IND	737	37042886	170622047	\N	1530159259	1967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
834	Lampix	PIX	768	135322017	327154880	657154880	1530159260	1988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
901	XGOX	XGOX	793	2362389085	2615804430	\N	1530159261	2065	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
811	BuzzCoin	BUZZ	797	19805532823	19805532823	20000000000	1530159259	1962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
899	Tracto	TRCT	835	26912941	70000000	\N	1530159261	2063	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
831	Chronologic	DAY	846	714608	1026498	\N	1530159260	1985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
888	Authorship	ATS	855	99971428	100000000	\N	1530159261	2051	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
843	Kolion	KLN	884	700524	1000000	\N	1530159260	1999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
892	PiplCoin	PIPL	905	83444258	7489958537	7531907537	1530159261	2056	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
863	WhaleCoin	WHL	917	10192294	10192294	\N	1530159261	2024	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
865	EthBet	EBET	936	8504600	10000000	\N	1530159261	2026	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
908	Ethereum Gold	ETG	949	12000000	24000000	\N	1530159262	2074	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
891	ExchangeN	EXN	971	5100000	10000000	\N	1530159261	2055	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
873	PayPie	PPP	988	82500000	165000000	165000000	1530141561	2036	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
912	Hedge	HDG	992	3709674	5100033	\N	1529928268	2079	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
840	Target Coin	TGT	999	952429892	2000100000	\N	1530159260	1995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
868	REAL	REAL	1006	10055817	19717288	\N	1530159260	2030	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
818	Sociall	SCL	1012	16714020	16714020	\N	1530159260	1969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
803	Vsync	VSX	1032	160559294	168332594	\N	1530159260	1951	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
844	Musiconomi	MCI	1062	27689568	100000000	\N	1530159260	2000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
814	Bowhead	AHT	1070	8000000	100000000	\N	1530159259	1965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
867	Wild Crypto	WILD	1085	24373456	100000000	\N	1530159261	2029	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
827	Billionaire Token	XBL	1119	3268274	3315270	3315372	1530159260	1981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
923	Bitcoin Red	BTCRED	1138	20550001	21000000	\N	1530159262	2093	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
850	Regalcoin	REC	1146	12799009	16491413	27000000	1530159260	2007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
833	CryptoInsight	TKR	1162	12529747	12529747	\N	1530077960	1987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
813	DROXNE	DRXNE	1174	74865609	95432830	\N	1530159259	1964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
875	PoSToken	POS	1275	1014710	1214526	\N	1530159260	2038	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
796	Kronecoin	KRONE	1288	7068716	7068716	84000000	1530159259	1943	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
839	Interzone	ITZ	1311	2652019	3112019	\N	1530159261	1994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
856	Infinity Economics	XIN	1343	\N	9000000000	\N	1530159260	2013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
854	Tezos (Pre-Launch)	XTZ	1372	\N	\N	\N	1530159260	2011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
921	Exchange Union	XUC	1404	\N	3000000000	\N	1530159262	2091	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
820	iQuant	IQT	1425	\N	100000000	\N	1530159260	1971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
851	MSD	MSD	1453	\N	6088400259	30000000000	1530159261	2008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
895	BitSoar	BSR	1462	\N	3690117191	\N	1530159261	2059	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
847	HODL Bucks	HDLB	1490	\N	\N	2000000	1530159260	2004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
886	CORION	COR	1500	\N	9136859	\N	1530159261	2049	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
958	High Gain	HIGH	1510	\N	\N	\N	1530159262	2138	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1029	PlexCoin	PLX	1513	\N	1000000000	\N	1530159263	2228	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
986	NEO GOLD	NEOG	1524	\N	75000000	\N	1530159263	2174	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1055	StrikeBitClub	SBC	1540	\N	195247235	\N	1530159264	2259	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
943	BTCMoon	BTCM	1545	\N	21000000	\N	1530159262	2119	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1002	GOLD Reward Token	GRX	1557	\N	20000000	\N	1530159263	2192	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
939	BT2 [CST]	BT2	1559	\N	\N	\N	1530159263	2114	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
951	Bitbase	BTBc	1573	\N	20257950	100000000	1530159262	2129	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
999	SISA	SISA	1581	\N	50000000	\N	1530025760	2189	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1025	Bitcoin Diamond	BCD	37	153756875	156756875	210000000	1530159264	2222	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1018	QASH	QASH	101	350000000	1000000000	\N	1530159263	2213	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1041	Dragonchain	DRGN	114	238421940	433494437	\N	1530159264	2243	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
957	Electroneum	ETN	116	7278579397	7278579397	21000000000	1530159263	2137	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
955	Revain	R	128	186450000	484450000	484450000	1530159262	2135	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
961	Streamr DATAcoin	DATA	146	677154514	987154514	\N	1530159263	2143	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
952	Enjin Coin	ENJ	165	756192535	1000000000	\N	1530159262	2130	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
975	Raiden Network Token	RDN	181	50168936	100000000	\N	1530159263	2161	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1026	BLOCKv	VEE	194	1968986470	3646271241	\N	1530159263	2223	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1049	IoT Chain	ITC	201	60204000	100000000	\N	1530159264	2251	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1023	SpankChain	SPANK	212	300043386	1000000000	\N	1530159263	2219	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1037	ETHLend	LEND	226	1096556877	1299999942	\N	1530159264	2239	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
976	Delphy	DPY	233	43414390	100000000	\N	1530159262	2162	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
938	Red Pulse	RPX	242	807926304	1358371250	\N	1530159262	2112	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
959	MinexCoin	MNX	254	3945291	5899225	19000000	1530159262	2139	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
988	Decision Token	HST	292	32025998	48240070	\N	1530159263	2176	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
972	Phore	PHR	298	13617178	13617178	\N	1530159262	2158	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1040	Qbao	QBT	318	65351403	100000000	\N	1530159264	2242	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
944	Etherparty	FUEL	323	485847253	1000000000	\N	1530159263	2120	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
962	SHIELD	XSH	378	512973375	512973375	660000000	1530159262	2144	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1007	ALQO	ALQO	390	48526956	48626957	57879300	1530159263	2199	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
982	Oxycoin	OXY	395	109874595	109874595	\N	1530159263	2170	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
935	LUXCoin	LUX	413	1905393	4905393	60000000	1530159262	2107	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
948	Russian Miner Coin	RMC	458	1507	10757	\N	1530159263	2125	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
970	Aeron	ARN	478	13000000	20000000	\N	1530159263	2153	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1030	Divi	DIVX	480	5493185	6171607	\N	1530159264	2229	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1056	Bulwark	BWK	530	8617397	8936451	27000000	1530159264	2260	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
933	Pirl	PIRL	550	20226270	20226270	\N	1530159262	2105	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1047	Eroscoin	ERO	579	186744000	240000000	\N	1530159264	2249	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
937	Dovu	DOVU	591	79745430	963761390	\N	1530159262	2110	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
996	Privatix	PRIX	618	1182668	1275455	\N	1530159263	2184	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1054	Snovio	SNOV	645	404980448	651129644	\N	1530159264	2258	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
956	ATLANT	ATL	685	37551901	54175041	54175041	1530159262	2136	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1031	Monkey Project	MONK	692	1142912	1492862	\N	1530159264	2230	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
963	Pure	PURE	715	14478001	15587280	20000000	1530159262	2146	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
990	Upfiring	UFR	744	16793000	24000000	\N	1530159263	2178	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
989	Sharechain	SSS	745	2424023561	10000000000	\N	1530159263	2177	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1035	MyWish	WISH	751	18825212	19803895	\N	1530159264	2236	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1013	DigiPulse	DGPT	759	2262814	5420576	\N	1530159264	2207	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
985	Interstellar Holdings	HOLD	765	688603189	728134302	2000000000	1530159263	2173	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1006	Viuly	VIU	777	765906642	1000000000	\N	1530159263	2198	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
960	FORCE	FOR	781	123192742	126794083	200000000	1530159262	2142	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
968	Autonio	NIO	785	68338135	220466789	\N	1530159262	2151	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1005	Sugar Exchange	SGR	790	18395844	80000000	\N	1530159263	2196	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
997	IntenseCoin	ITNS	796	430625519	430625519	999481516	1530159263	2185	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
950	eBitcoin	EBTC	804	18897126	21000000	\N	1530159263	2127	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
991	Hat.Exchange	HAT	813	1452143	7000000	\N	1530159264	2179	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1022	Magnet	MAG	825	28926898	29176898	\N	1530159264	2218	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
945	Ellaism	ELLA	856	9184618	9184618	280000000	1530159262	2122	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
974	Innova	INN	862	3771980	4521980	42000000	1530159264	2160	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1057	SagaCoin	SAGA	874	4041129	6141129	42000000	1530159264	2261	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
984	Emphy	EPY	877	7902898	15375000	\N	1530159263	2172	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
931	Intelligent Trading Foundation	ITT	900	9799899	11500000	\N	1530159262	2103	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
964	ELTCOIN	ELTCOIN	931	90000000	100000000	\N	1530159263	2147	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
971	StarCash Network	STARS	960	959914	1033142	\N	1530159263	2157	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
965	Desire	DSR	968	2996172	3596172	\N	1530159262	2148	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1000	Astro	ASTRO	1003	3313833	6999999	\N	1529973860	2190	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
949	FlypMe	FYP	1015	17638681	35277363	\N	1530159262	2126	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
980	Blockpool	BPL	1020	22293890	25264095	\N	1530159262	2167	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
977	Zephyr	ZEPH	1022	125990535	2000000000	\N	1530159264	2163	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1048	MagicCoin	MAGE	1033	7409703	11159703	\N	1530159264	2250	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
998	EBCH	EBCH	1049	9285500	21000000	21000000	1530159263	2187	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
947	Qvolta	QVT	1091	7179776	10096722	\N	1530159262	2124	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
932	iEthereum	IETH	1115	17982000	18000000	\N	1530159262	2104	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1003	Aerium	AERM	1131	112204684	164348058	500000000	1530159263	2193	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1019	ZoZoCoin	ZZC	1160	1946488	7473288	27000000	1530064164	2214	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
978	ERC20	ERC20	1171	1574741156	1693691126	\N	1529885672	2165	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
936	Network Token	NTWK	1202	15592810	50000000	\N	1530159262	2109	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1053	Nekonium	NUKO	1213	12000829	21606559	\N	1530159264	2257	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1012	Phantomx	PNX	1231	26340826	26340826	\N	1530159264	2205	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
941	Roofs	ROOFS	1276	130000000	600000000	\N	1530159262	2117	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
929	JavaScript Token	JS	1284	7991996	7991996	\N	1530086362	2100	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1033	GlassCoin	GLS	1309	3082639	5534281	\N	1530159264	2232	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1027	POLY AI	AI	1339	2281981	29000000	\N	1530159264	2224	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1045	BlockCDN	BCDN	1442	\N	1000000000	\N	1530159264	2247	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1009	WINCOIN	WC	1445	\N	451276343	\N	1530159263	2201	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1004	BitSerial	BTE	1486	\N	28000000	\N	1530159263	2194	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
983	Abjcoin Commerce	ABJC	1494	\N	9233130	\N	1530159264	2171	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1134	NumusCash	NUMUS	1503	\N	\N	\N	1530159266	2347	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
220	Quotient	XQN	1517	\N	\N	\N	1530159246	733	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1137	GameChain System	GCS	1582	\N	2100000000	\N	1529746775	2350	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1119	ENTCash	ENT	1591	\N	600000000	1600000000	1525799359	2331	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1093	aelf	ELF	69	250000000	280000000	1000000000	1530159265	2299	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1133	WaykiChain	WICC	86	168400000	210000000	\N	1530159266	2346	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1124	Game.com	GTC	100	761444190	2000000000	\N	1530159265	2336	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1091	Storm	STORM	110	4494161945	10000000000	\N	1530159265	2297	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1132	High Performance Blockchain	HPB	125	29702632	100000000	\N	1530159265	2345	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1108	DeepBrain Chain	DBC	131	1500000000	10000000000	10000000000	1530159265	2316	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1096	DEW	DEW	138	103244553	200000000	\N	1530159265	2304	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1177	Bottos	BTO	147	498473628	1000000000	\N	1530159266	2392	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1100	Dai	DAI	159	43795276	43795276	\N	1530159265	2308	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1092	Dynamic Trading Rights	DTR	163	1218054044	3750000000	\N	1530159265	2298	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1072	Ignis	IGNIS	175	761143950	999449694	999449694	1530159265	2276	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1105	SIRIN LABS Token	SRN	187	229258029	573145073	\N	1530159265	2313	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1159	Trade Token	TIO	197	89921436	223534823	\N	1530159266	2373	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1178	Telcoin	TEL	204	30734017993	100000000000	\N	1530159266	2394	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1101	SophiaTX	SPHTX	213	192141767	350000000	\N	1530159265	2309	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1151	TokenClub	TCT	251	481425335	1000000000	\N	1530159266	2364	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1090	OST	OST	273	338884679	800000000	\N	1530159265	2296	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1155	INS Ecosystem	INS	276	30300918	50000000	\N	1530159266	2369	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1166	ATN	ATN	282	84302524	210000000	\N	1530159266	2380	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1097	NAGA	NGC	289	57672338	77910266	\N	1530159265	2305	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1184	OneRoot Network	RNT	294	239643281	400000000	\N	1530159266	2400	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1182	Selfkey	KEY	299	2016075804	5999999954	\N	1530159267	2398	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1131	AppCoins	APPC	312	100054312	246203093	\N	1530159266	2344	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1063	WaBi	WABI	324	45248033	99218023	\N	1530159264	2267	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1164	Karma	KRM	330	1782809241	3000000000	\N	1530159267	2378	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1112	QLINK	QLC	335	240000000	600000000	\N	1530159265	2321	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1161	QunQun	QUN	344	804148114	1500000000	\N	1530159266	2375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1129	Covesting	COV	357	17500000	20000000	\N	1530159266	2342	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1174	ugChain	UGC	383	568842039	1000000000	\N	1530159267	2389	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1104	DIMCOIN	DIM	389	2102485837	8986417068	9000000000	1530159265	2312	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1116	Olympus Labs	MOT	398	37811014	100000000	\N	1530159266	2327	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1125	Lamden	TAU	410	142215728	288090567	\N	1530159266	2337	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1110	Neumark	NEU	425	28740127	53014331	1500000000	1530159266	2318	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1147	Hacken	HKN	454	5238759	5600000	\N	1530159266	2360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1144	AI Doctor	AIDOC	462	443333332	777777777	\N	1530159266	2357	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1173	Bitcoin Atom	BCA	487	18081750	21000000	21000000	1530159267	2387	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1176	EchoLink	EKO	495	372810007	500000000	\N	1530159267	2391	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1154	REBL	REBL	512	170138719	326480305	\N	1530159267	2368	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1160	BitDegree	BDG	523	354569198	514800000	\N	1530159267	2374	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1185	Sense	SENSE	526	159112044	663636366	\N	1530159266	2402	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1141	GET Protocol	GET	539	11388258	33368773	\N	1530159266	2354	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1122	BitClave	CAT	553	501394406	1597746125	\N	1530159266	2334	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1163	Leverj	LEV	557	118090511	1000000000	\N	1530159266	2377	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1130	CanYaCoin	CAN	570	41874504	95827000	\N	1530159266	2343	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1115	Matryx	MTX	581	23224303	314159265	\N	1530159266	2325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1102	Bounty0x	BNTY	600	138192107	500000000	\N	1530159265	2310	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1143	CFun	CFUN	603	429429737	900000000	\N	1530159266	2356	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1084	Worldcore	WRC	678	175109299	245209299	\N	1530159264	2288	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1113	HEROcoin	PLAY	687	119754840	252165029	\N	1530159265	2323	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1066	SportyCo	SPF	708	52812425	70673454	\N	1530159264	2270	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1168	Spectre.ai Utility Token	SXUT	719	24529558	42980365	\N	1530159266	2382	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1170	Vezt	VZT	727	51583110	125000000	\N	1530159266	2384	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1153	Aigang	AIX	770	20784942	29274567	\N	1530159267	2367	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1139	Coinlancer	CL	778	70666779	300000000	\N	1530159266	2352	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1082	MicroMoney	AMM	800	11191834	17532943	\N	1530159265	2286	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1103	Ace	ACE	811	9248721	14476036	\N	1530159265	2311	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1067	Verify	CRED	830	13508864	29997543	\N	1530159265	2271	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1120	STRAKS	STAK	831	5292258	44070190	150000000	1530159265	2332	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1065	WandX	WAND	858	12244135	16013284	\N	1530159265	2269	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1068	Soma	SCT	871	5713467	14418075	\N	1530159265	2272	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1138	Numus	NMS	887	2750877	2750877	\N	1530159266	2351	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1064	CrowdCoin	CRC	927	2921760	3271760	\N	1530159264	2268	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1081	Bitair	BTCA	934	700000000	1000000000	\N	1530159264	2285	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1149	Steneum Coin	STN	954	2822589	5977433	20000000	1530159266	2362	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1126	Escroco	ESC	959	2154500	3100000	3100000	1530159266	2338	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1060	Tokugawa	TOK	964	1021644	1021644	\N	1530159265	2264	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1109	HomeBlockCoin	HBC	973	5000000	9529146	28000000	1530159265	2317	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1136	Mixin	XIN	987	438113	1000000	\N	1528823977	2349	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1167	Spectre.ai Dividend Token	SXDT	990	82073519	140270691	\N	1530159266	2381	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1089	Starbase	STAR	1013	187500000	1000000000	\N	1530125366	2295	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1080	Trident Group	TRDT	1271	1213024	3000000	\N	1530159265	2284	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1165	Kcash	KCASH	1355	\N	1000000000	\N	1530159266	2379	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1123	Lightning Bitcoin	LBTC	1366	\N	\N	21000000	1530159265	2335	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1078	Super Bitcoin	SBTC	1383	\N	\N	21210000	1530159265	2282	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1162	TopChain	TOPC	1386	\N	2100000000	\N	1530159267	2376	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1148	Show	SHOW	1390	\N	10000000000	\N	1530159266	2361	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1152	FairGame	FAIR	1403	\N	1200000000	\N	1530159266	2366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1077	BitcoinX	BCX	1412	\N	167361683927	210000000000	1530159264	2281	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1180	WETH	WETH	1428	\N	\N	\N	1530159266	2396	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1058	COMSA [ETH]	CMS	1448	\N	219042298	\N	1530159264	2262	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1062	COMSA [XEM]	CMS	1450	\N	\N	\N	1530159265	2266	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1157	United Traders Token	UTT	1456	\N	69403131	\N	1530159266	2371	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1169	Jingtum Tech	SWTC	1468	\N	599999999999	100000000000	1530159267	2383	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1156	Bitcoin God	GOD	1491	\N	\N	21000000	1530159267	2370	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1114	BigONE Token	BIG	1496	\N	200000000	200000000	1530159266	2324	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1295	Indicoin	INDI	1509	\N	360000000	\N	1530159268	2519	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1298	Superior Coin	SUP	1516	\N	385720236	\N	1530159269	2522	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
184	RabbitCoin	RBBT	1518	\N	130615575432	\N	1530159245	572	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1291	ACChain	ACC	1583	\N	\N	\N	1529847879	2515	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1233	PressOne	PRS	1594	\N	\N	\N	1528823980	2455	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1262	Candy	CANDY	1595	\N	1000000000000	\N	1528823980	2485	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1278	Huobi Token	HT	54	50000200	500000000	\N	1530159269	2502	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1306	Fusion	FSN	93	29684331	57344000	\N	1530159269	2530	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1210	Scry.info	DDD	96	300056960	1000000000	\N	1530159267	2428	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1272	Polymath	POLY	103	276420107	1000000000	\N	1530159268	2496	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1251	Matrix AI Network	MAN	121	150000000	250000000	1000000000	1530159268	2474	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1253	Ruff	RUFF	149	921800000	1840000000	\N	1530159268	2476	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1250	All Sports	SOC	152	864226846	1500000000	\N	1530159268	2473	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1224	CRYPTO20	C20	177	39714631	40656082	\N	1530159268	2444	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1227	Crypterium	CRPT	178	79056577	99983577	\N	1530159267	2447	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1236	Odyssey	OCN	184	4750000000	10000000000	\N	1530159268	2458	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1283	THEKEY	TKY	190	4704993287	9795844687	\N	1530159268	2507	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1226	DATA	DTA	207	4626502186	11500000000	11500000000	1530159267	2446	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1282	Swarm	SWM	218	51113355	100000000	\N	1530159269	2506	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1274	Jibrel Network	JNT	222	160000000	200000000	\N	1530159268	2498	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1316	Litecoin Cash	LCC	230	575670207	575670207	840000000	1530159269	2540	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1300	Universa	UTNP	235	1840486088	4997891952	\N	1530159269	2524	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1315	Republic Protocol	REN	241	557863049	1000000000	\N	1530159269	2539	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1245	LinkEye	LET	272	600000000	1000000000	\N	1530159268	2468	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1259	CPChain	CPC	286	288765852	999999999	\N	1530159268	2482	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1302	Envion	EVN	317	109660754	127425494	\N	1530159269	2526	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1218	YEE	YEE	320	1365218125	10000000000	\N	1530159268	2437	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1211	Mobius	MOBI	322	376657502	887990859	\N	1530159267	2429	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1223	Trinity Network Credit	TNC	353	333333333	1000000000	\N	1530159267	2443	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1249	Fortuna	FOTA	355	403728511	1000000000	\N	1530159268	2472	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1205	Aurora DAO	AURA	360	133408357	1000000000	\N	1530159267	2423	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1273	Medicalchain	MTN	364	185000000	500000000	\N	1530159268	2497	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1193	SpaceChain	SPC	365	514991707	1000000000	\N	1530159266	2410	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1312	Neurotoken	NTK	370	81027236	100000000	\N	1530159269	2536	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1270	STK	STK	388	341834585	500000000	\N	1530159269	2493	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1313	Gems 	GEM	401	1146363025	8000000000	\N	1530159269	2537	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1309	Restart Energy MWAT	MWAT	407	417727000	470000000	500000000	1530159269	2533	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1311	DADI	DADI	415	76362342	100000000	100000000	1530159269	2535	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1279	DMarket	DMT	434	50216064	56921773	\N	1530159268	2503	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1229	carVertical	CV	448	5666521283	9931143978	\N	1530159267	2450	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1303	SureRemit	RMT	451	500000000	1000000000	\N	1530159269	2527	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1275	SwissBorg	CHSB	473	575821133	1000000000	\N	1530159269	2499	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1248	Smartlands	SLT	476	5100896	7186785	\N	1530159268	2471	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1237	indaHash	IDH	494	399936259	400000000	\N	1530159268	2459	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1208	ShareX	SEXC	518	645515075	1000000000	\N	1530159268	2426	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1203	InsurePal	IPL	528	201000000	300000000	\N	1530159267	2421	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1201	Profile Utility Token	PUT	558	45289804	100000000	\N	1530159267	2419	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1267	CargoX	CXO	566	129071409	215119016	\N	1530159268	2490	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1297	BioCoin	BIO	573	628466438	826041400	\N	1530159269	2521	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1292	MktCoin	MLM	602	1154485505	2189685016	\N	1530159269	2516	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1204	IDEX Membership	IDXM	613	2000	2000	\N	1530159267	2422	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1277	adbank	ADB	631	500953700	1000000000	\N	1530159268	2501	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1255	CoinFi	COFI	634	172647909	300000000	\N	1530159269	2478	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1225	Block Array	ARY	647	68430738	88409933	\N	1530159268	2445	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1241	Devery	EVE	651	62918410	100000000	\N	1530159267	2464	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1310	Gladius Token	GLA	665	13990053	16825229	\N	1530159269	2534	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1304	Dether	DTH	697	72500000	100000000	\N	1530159269	2528	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1280	Iungo	ING	732	40000000	62553604	\N	1530159269	2504	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1200	Maverick Chain	MVC	754	100936231	200000000	\N	1530159267	2418	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1319	COPYTRACK	CPY	786	22342937	53000748	\N	1530159269	2543	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1194	Galactrum	ORE	789	1604264	2324264	\N	1530159267	2411	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1266	BitWhite	BTW	795	36325371	60342895	\N	1530159268	2489	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1294	LOCIcoin	LOCI	808	36518110	100000000	\N	1530159269	2518	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1290	Shekel	JEW	837	108579385	108579385	\N	1530159268	2514	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1318	Tidex Token	TDX	850	9499999	100000000	100000000	1530159269	2542	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1284	DCORP Utility	DRPU	869	3530373	3530373	\N	1530159268	2508	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1299	Tigereum	TIG	880	14907493	19743794	\N	1530159269	2523	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1256	Equal	EQL	907	324125737	797371886	\N	1530159268	2479	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1198	ArbitrageCT	ARCT	924	85565063	151639063	\N	1530159267	2415	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1228	Sparks	SPK	946	2448920	3297657	\N	1530159268	2448	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1252	Garlicoin	GRLC	958	9677751	9850152	69000000	1530159268	2475	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1239	Peerguess	GUESS	969	23348467	200000000	\N	1530159267	2461	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1196	Ethorse	HORSE	1027	100565600	125000000	\N	1530159267	2413	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1263	Speed Mining Service	SMS	1050	104680	300000	\N	1530159268	2486	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1247	CoinMeet	MEET	1357	\N	400000000	\N	1530159267	2470	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1197	RealChain	RCT	1362	\N	1000000000	\N	1530159267	2414	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1260	OceanChain	OC	1367	\N	\N	\N	1530159268	2483	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1257	HalalChain	HLC	1371	\N	1000000000	\N	1530159268	2480	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1213	StarChain	STC	1387	\N	1000000000	\N	1530159268	2432	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1222	Molecular Future	MOF	1389	\N	100000000	\N	1530159268	2441	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1216	LightChain	LIGHT	1401	\N	210000000000	\N	1530159267	2435	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1209	ChatCoin	CHAT	1405	\N	1000000000	\N	1530159267	2427	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1314	Nectar	NEC	1418	\N	1006926571	\N	1530159269	2538	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1265	ValueChain	VLC	1422	\N	300000000	\N	1530159268	2488	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1308	Etherecash	ECH	1423	\N	\N	\N	1530159269	2532	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1214	IPChain	IPC	1432	\N	96000000	\N	1530159267	2433	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1307	W3Coin	W3C	1465	\N	\N	\N	1530159269	2531	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1264	Electronic PK Chain	EPC	1467	\N	500000000	\N	1530159268	2487	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1191	Qube	QUBE	1472	\N	1000000000	\N	1530159267	2408	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1384	Lendroid Support Token	LST	1512	\N	1210071487	\N	1530159270	2609	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1360	Centrality	CENNZ	70	789800407	1200000000	\N	1530159270	2585	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1383	Mithril	MITH	74	306558608	1000000000	\N	1530159270	2608	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1366	Dropil	DROP	79	19741925300	30000000000	\N	1530159270	2591	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1363	Loom Network	LOOM	95	604679268	1000000000	\N	1530159270	2588	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1380	BnkToTheFuture	BFT	111	629990099	1000000000	\N	1530159270	2605	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1416	eosDAC	EOSDAC	117	660755177	1200000000	\N	1530159271	2644	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1414	CyberVein	CVT	137	1029409736	2147483648	\N	1530159271	2642	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1399	TokenPay	TPAY	144	15425785	19247552	25000000	1530159271	2627	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1321	Arcblock	ABT	157	93196613	186000000	\N	1530159269	2545	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1403	ODEM	ODE	164	177682511	268946131	\N	1530159271	2631	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1370	NANJCOIN	NANJ	189	19361889557	30000000000	\N	1530159270	2595	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1324	POA Network	POA	195	205318321	255810481	\N	1530159269	2548	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1335	Cube	AUTO	206	6274940000	7200000000	\N	1530159270	2559	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1330	Lympo	LYM	208	723440241	999999999	\N	1530159269	2554	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1351	Tokenomy	TEN	214	125000000	200000000	\N	1530159270	2576	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1375	LGO Exchange	LGO	240	119995679	217698062	\N	1530159271	2600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1387	BitRent	RNTB	245	841750000	942000000	\N	1530159270	2612	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1348	BABB	BAX	256	20999999999	50000000000	\N	1530159270	2572	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1352	Ravencoin	RVN	265	1230050206	1230050206	21000000000	1530159270	2577	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1361	Havven	HAV	271	62952186	100000000	\N	1530159270	2586	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1343	DATx	DATX	278	1391302551	10000000000	\N	1530159270	2567	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1417	U Network	UUU	311	5792573645	10000000000	\N	1530159271	2645	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1367	Banca	BANCA	328	17905181684	20000000000	\N	1530159270	2592	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1415	Sentinel	SENT	331	1999999999	2000000000	\N	1530159271	2643	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1429	BrahmaOS	BRM	333	619267130	3000000000	\N	1530159271	2657	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1329	Refereum	RFR	402	2367764838	5000000000	\N	1530159269	2553	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1421	DeviantCoin	DEV	426	2435051	6280920	88000000	1530159271	2649	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1353	TE-FOOD	TFD	429	468403572	567917833	1000000000	1530159270	2578	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1345	CoinPoker	CHP	444	288916723	354786435	\N	1530159270	2569	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1322	Remme	REM	453	601315910	1000000000	\N	1530159269	2546	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1441	MARK.SPACE	MRK	455	236101413	3000000000	\N	1530159271	2669	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1327	Bezop	BEZ	481	54634684	89267250	\N	1530159269	2551	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1373	Banyan Network	BBN	496	292873734	1000000000	\N	1530159270	2598	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1372	UpToken	UP	504	141877756	184638000	\N	1530159270	2597	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1354	ShipChain	SHIP	514	182294881	500000000	\N	1530159270	2579	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1396	Sentinel Chain	SENC	521	197269666	500000000	\N	1530159271	2624	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1449	Linker Coin	LNC	534	112776150	500000000	\N	1530159271	2677	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1400	Rentberry	BERRY	538	301464482	301473028	\N	1530159271	2628	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1377	NaPoleonX	NPX	544	25330000	29800000	\N	1530159270	2602	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1402	PolySwarm	NCT	549	1468214570	1885913076	\N	1530159270	2630	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1337	BitTube	TUBE	559	62550057	64330057	\N	1530159269	2561	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1385	Peculium	PCL	569	1096534269	9024960741	\N	1530159270	2610	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1390	Stipend	SPD	574	6482515	6720164	19340594	1530159270	2616	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1409	Fidelium	FID	575	111638415	191421673	\N	1530159271	2637	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1432	Aditus	ADI	593	234110888	750000000	\N	1530159271	2660	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1362	Fluz Fluz	FLUZ	599	204780000	204780000	\N	1530159270	2587	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1418	AdHive	ADH	601	107721314	392000000	\N	1530159271	2646	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1386	Spectiv	SIG	615	280982090	378851756	\N	1530159271	2611	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1355	Leadcoin	LDC	632	784399592	2627412706	\N	1530159270	2580	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1336	EZToken	EZT	633	11500000	50000000	\N	1530159269	2560	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1331	Sether	SETH	646	17294985	20136683	\N	1530159270	2555	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1437	Dero	DERO	648	2749479	18400000	\N	1530159271	2665	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1397	Vice Industry Token	VIT	652	230749949	4000000000	\N	1530159270	2625	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1444	SRCOIN	SRCOIN	659	5052048084	15000000000	\N	1530159271	2672	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1434	Haven Protocol	XHV	662	3182614	3182614	\N	1530159271	2662	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1376	1World	1WO	666	20591218	37219453	\N	1530159270	2601	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1391	IP Exchange	IPSX	674	802404382	1714102659	\N	1530159271	2617	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1393	BitStation	BSTN	694	2838685603	12000000000	\N	1530159271	2619	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1425	Auctus	AUC	702	16697784	65829658	\N	1530159271	2653	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1382	AMLT	AMLT	720	84518916	400000000	400000000	1530159270	2607	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1439	FintruX Network	FTX	740	55428631	100000000	\N	1530159271	2667	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1356	Sharpe Platform Token	SHP	746	17180144	32000000	\N	1530159270	2581	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1446	Masari	MSR	757	6090646	6090646	18500000	1530159271	2674	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1428	Daneel	DAN	774	34141165	69320719	\N	1530159271	2656	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1341	StarterCoin	STAC	794	282407189	342007189	\N	1530159269	2565	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1430	SyncFab	MFG	799	137157590	1000000000	\N	1530159271	2658	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1389	Blocklancer	LNC	834	120140384	152177339	\N	1530159270	2615	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1440	Earth Token	EARTH	868	205300250	750000000	\N	1530159272	2668	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1407	TokenDesk	TDS	888	10278325	14683321	\N	1530159271	2635	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1423	GreenMed	GRMD	923	11467373	14899993	\N	1530159271	2651	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1420	Bitsum	BSM	937	868151657	1844674407	\N	1530159271	2648	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1358	Octoin Coin	OCC	956	415195	797325	\N	1530159270	2583	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1448	PHI Token	PHI	1024	4997395	14109443	\N	1530159272	2676	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1408	BelugaPay	BBI	1076	4948463	60793471	\N	1530159271	2636	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1371	CK USD	CKUSD	1340	\N	\N	\N	1530159271	2596	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1433	Tripio	TRIO	1358	\N	5000000000	\N	1530159271	2661	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1431	Dignity	DIG	1370	\N	3000000000	\N	1530159271	2659	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1374	Noah Coin	NOAH	1382	\N	91584000000	\N	1530159270	2599	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1442	Pixie Coin	PXC	1409	\N	10000000000	\N	1530159271	2670	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1392	StockChain	SCC	1413	\N	10000000000	\N	1530159270	2618	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1435	StarCoin	KST	1427	\N	877631077	\N	1530159272	2663	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1427	Monero Classic	XMC	1438	\N	16016864	18400000	1530159271	2655	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1395	Consensus	SEN	1441	\N	1650000000	\N	1530159271	2621	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1404	Monero Original	XMO	1444	\N	16176665	\N	1530159271	2632	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1426	Budbo	BUBO	1466	\N	200000000	\N	1530159271	2654	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1424	Curriculum Vitae	CVH	1469	\N	1900000000	\N	1530159271	2652	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1411	Arbitracoin	ATC	1473	\N	131901470	\N	1530159271	2639	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1443	Cropcoin	CROP	1484	\N	27737520	100000000	1530159272	2671	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
297	SJWCoin	SJW	1519	\N	\N	\N	1530159248	1028	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1561	Shopin	SHOP	1596	\N	1500000000	\N	1529852088	2839	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1466	Nexo	NEXO	133	560000010	1000000000	\N	1530159272	2694	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1547	NKN	NKN	183	150646419	700000000	1000000000	1530159274	2780	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1544	IoTeX	IOTX	205	1141040005	10000000000	\N	1530159273	2777	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1468	DAEX	DAX	223	370300000	2000000000	\N	1530159272	2696	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1557	Endor Protocol	EDR	243	349681577	1500000000	\N	1530159273	2835	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1533	Cryptaur	CPT	250	6787146275	27662180148	\N	1530159273	2766	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1492	FuzeX	FXT	253	730326443	1087156610	\N	1530159273	2723	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1457	Zebi	ZCO	255	470992683	500000000	1000000000	1530159271	2685	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1555	Ivy	IVY	260	310869458	1610924200	\N	1530159274	2833	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1563	LoyalCoin	LYL	296	4934048956	9000000000	\N	1530159274	2841	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1478	Crowd Machine	CMCT	334	447440800	2000000000	\N	1530159272	2708	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1459	Proxeus	XES	358	198240350	300000000	\N	1530159272	2687	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1566	Shivom	OMX	427	501000002	3000000000	\N	1530159273	2844	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1473	BetterBetting	BETR	435	154738285	200585763	\N	1530159272	2703	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1577	CEEK VR	CEEK	443	270635598	1000000000	\N	1530159274	2856	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1469	Hydrogen	HYDRO	461	3062538428	11111111111	\N	1530159272	2698	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1524	Callisto Network	CLO	467	371262650	406718653	6500000000	1530159272	2757	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1487	PolicyPal Network	PAL	479	364228638	1000000000	\N	1530159272	2718	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1464	Nebula AI	NBAI	486	1162684117	4770681725	\N	1530159272	2692	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1521	HeroNode	HER	493	452857303	2000000000	\N	1530159273	2754	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1569	The Abyss	ABYSS	499	209468948	508628132	\N	1530159274	2847	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1575	PikcioChain	PKC	508	41992488	83927273	\N	1530159274	2854	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1495	DAOstack	GEN	531	35276316	60000000	\N	1530159273	2726	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1456	Aphelion	APH	542	36536301	70188440	\N	1530159272	2684	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1539	Digitex Futures	DGTX	568	700000000	1000000000	\N	1530159273	2772	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1490	APR Coin	APR	578	2742937	2742937	\N	1530159272	2721	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1542	Faceter	FACE	587	462558569	938641610	\N	1530159273	2775	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1458	Lendingblock	LND	605	591472963	1000000000	\N	1530159272	2686	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1452	Helbiz	HBZ	608	547522129	1005250000	\N	1530159272	2680	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1515	Loki	LOKI	612	15606500	27392246	\N	1530159273	2748	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1512	NPER	NPER	630	49935730	250000000	\N	1530159272	2744	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1467	VeriME	VME	653	145158045	400000000	\N	1530159272	2695	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1559	0xBitcoin	0xBTC	669	2877075	20999984	20999984	1530159274	2837	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1518	FundRequest	FND	691	31357853	98611464	\N	1530159273	2751	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1517	Oyster Shell	SHL	698	84692607	98592692	\N	1530159273	2750	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1477	FLIP	FLP	718	44730000	100000000	\N	1530159272	2707	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1523	Tokia	TKA	724	42135421	52669277	\N	1530159272	2756	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1541	Invacio	INV	734	47138066	60000000	\N	1530159274	2774	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1489	Parkgene	GENE	747	279760863	1000000000	\N	1530159272	2720	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1507	Digix Gold Token	DGX	756	42345	50300	\N	1530159272	2739	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1486	BoutsPro	BOUTS	784	76615188	2000000000	\N	1530159273	2717	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1497	TokenStars	TEAM	818	9927055	17818682	\N	1530159272	2729	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1455	TrakInvest	TRAK	823	83600010	155294118	\N	1530159271	2683	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1535	Fabric Token	FT	841	24593615	43593615	\N	1530159274	2768	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1462	Biotron	BTRN	848	30900316	1000000000	\N	1530159272	2690	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1519	Datarius Credit	DTRC	876	127756071	239992867	\N	1530159273	2752	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1474	Transcodium	TNS	893	35179544	88600000	\N	1530159273	2704	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1453	Origami	ORI	894	4225879	5527379	\N	1530159272	2681	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1476	Plancoin	PLAN	901	5472115	5472115	35000000	1530159272	2706	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1530	Morpheus Network	MORPH	1004	28406766	51065818	\N	1529825688	2763	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1485	ConnectJob	CJT	1042	112839768	166298157	\N	1530159272	2715	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1553	Seele	SEELE	1344	\N	1000000000	\N	1530159273	2830	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1560	PCHAIN	PAI	1351	\N	2100000000	\N	1530159273	2838	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1576	CashBet Coin	CBC	1352	\N	430000000	\N	1530159274	2855	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1502	EduCoin	EDU	1354	\N	15000000000	\N	1530159272	2734	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1527	Libra Credit	LBA	1356	\N	1000000000	\N	1530159273	2760	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1505	Global Social Chain	GSC	1360	\N	1000000000	\N	1530159272	2737	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1504	InsurChain	INSUR	1369	\N	20000000000	\N	1530159272	2736	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1488	Cybereits	CRE	1373	\N	1000000000	\N	1530159272	2719	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1496	Bezant	BZNT	1374	\N	1000000000	\N	1530159273	2727	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1482	MyToken	MT	1375	\N	4000000000	\N	1530159272	2712	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1529	Open Platform	OPEN	1376	\N	1000000000	\N	1530159273	2762	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1554	EJOY	EJOY	1377	\N	21000000000	\N	1530159273	2831	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1581	GoChain	GO	1384	\N	1000000000	\N	1530159274	2861	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1509	Intelligent Investment Chain	IIC	1388	\N	21000000000	\N	1530159273	2741	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1573	Engine	EGCC	1392	\N	10000000000	\N	1530159274	2852	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1508	Influence Chain	INC	1394	\N	1000000000	\N	1530159272	2740	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1580	XMax	XMX	1395	\N	30000000000	\N	1530159274	2859	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1501	Freyrchain	FREC	1396	\N	10000000000	\N	1530159272	2733	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1551	SPINDLE	SPD	1397	\N	10000000000	\N	1530159273	2828	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1484	Nexty	NTY	1399	\N	180000000000	180000000000	1530159272	2714	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1483	KEY	KEY	1402	\N	100000000000	\N	1530159272	2713	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1461	Rublix	RBLX	1410	\N	100000000	\N	1530159272	2689	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1536	Rhenium	XRH	1411	\N	8863934	\N	1530159274	2769	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1513	Dascoin	DASC	1414	\N	889868500	\N	1530159273	2746	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1579	Couchain	COU	1426	\N	30000000000	\N	1530159274	2858	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1532	XYO Network	XYO	1429	\N	14198877960	\N	1530159273	2765	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1574	MIRQ	MRQ	1430	\N	2085844	\N	1530159273	2853	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1500	Aston	ATX	1434	\N	1000000000	\N	1530159272	2732	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1465	Loopring [NEO]	LRN	1436	\N	139507605	\N	1530159272	2693	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1565	Ether Zero	ETZ	1443	\N	194000000	\N	1530159274	2843	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1460	Vipstar Coin	VIPS	1446	\N	60078425394	\N	1530159271	2688	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1552	REPO	REPO	1451	\N	356999900	\N	1530159273	2829	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1570	Paymon	PMNT	1452	\N	1000000000	\N	1530159273	2848	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1491	AC3	AC3	1457	\N	80123968	\N	1530159273	2722	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1514	BlockMesh	BMH	1464	\N	2000000000	\N	1530159273	2747	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1511	Bank Coin	BANK	1480	\N	21000000	\N	1530159273	2743	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1522	Hero	HERO	1489	\N	14765425	\N	1530159273	2755	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1499	Utrum	OOT	1495	\N	216000054	\N	1530159272	2731	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
457	DynamicCoin	DMC	1520	\N	10541442931	\N	1530159251	1436	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	Bitcoin	BTC	1	17119350	17119350	21000000	1530159272	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
296	Ethereum	ETH	2	100348832	100348832	\N	1530159261	1027	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
27	Ripple	XRP	3	39262097329	99991924336	100000000000	1530159253	52	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
667	EOS	EOS	5	896149492	900000000	1000000000	1530159256	1765	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	Litecoin	LTC	6	57166371	57166371	84000000	1530159242	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
173	Stellar	XLM	7	18760278085	104065507794	\N	1530159244	512	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
853	Cardano	ADA	8	25927070538	31112483745	45000000000	1530159260	2010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
633	IOTA	MIOTA	9	2779530283	2779530283	2779530283	1530159256	1720	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
716	Bitcoin Cash	BCH	4	17207613	17207613	21000000	1530159257	1831	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
808	TRON	TRX	11	65748111645	100000000000	\N	1530159259	1958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
428	NEO	NEO	13	65000000	100000000	100000000	1530159251	1376	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
410	Ethereum Classic	ETC	16	102619303	102619303	\N	1530159250	1321	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
770	VeChain	VEN	17	547499372	873378637	\N	1530159259	1904	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
253	NEM	XEM	18	8999999999	8999999999	\N	1530159246	873	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1342	Ontology	ONT	19	151292175	1000000000	\N	1530159269	2566	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
604	Qtum	QTUM	20	88664516	100664516	\N	1530159255	1684	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
928	ICON	ICX	23	387431340	400228740	\N	1530159262	2099	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1246	Zilliqa	ZIL	25	7575893444	12600000000	\N	1530159268	2469	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
343	Decred	DCR	26	7145743	7565743	21000000	1530159248	1168	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
164	BitShares	BTS	31	2637050000	2637050000	3600570502	1530159245	463	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
763	0x	ZRX	33	532475274	1000000000	\N	1530159258	1896	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
320	Augur	REP	36	11000000	11000000	\N	1530159248	1104	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
465	Golem	GNT	43	839242000	1000000000	\N	1530159252	1455	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1381	Wanchain	WAN	47	106152493	210000000	\N	1530159270	2606	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
614	Basic Attention Token	BAT	48	1000000000	1500000000	\N	1530159256	1697	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1350	Bitcoin Private	BTCP	49	20472953	20472953	21000000	1530159270	2575	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
769	Hshare	HSR	51	43163308	43163308	84000000	1530159258	1903	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
663	Status	SNT	52	3470483788	6804870174	\N	1530159256	1759	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1188	IOST	IOST	57	8400000000	21000000000	\N	1530159267	2405	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
866	Cryptonex	CNX	60	45341437	106779063	210000000	1530159261	2027	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
898	Aion	AION	61	167480575	465934587	\N	1530159261	2062	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
119	MaidSafeCoin	MAID	63	452552412	452552412	\N	1530159244	291	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
639	Bancor	BNT	64	50254800	75687301	\N	1530159255	1727	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1186	MOAC	MOAC	65	35897055	56483386	\N	1530159266	2403	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
409	Ardor	ARDR	66	998999495	998999495	998999495	1530159250	1320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
98	MonaCoin	MONA	71	60470925	60470925	\N	1530159243	213	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1410	Cortex	CTXC	75	149792458	299792458	\N	1530159271	2638	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
344	PIVX	PIVX	77	56592759	56592759	\N	1530159249	1169	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
881	Enigma	ENG	80	74836171	150000000	\N	1530159261	2044	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1199	Theta Token	THETA	81	663902689	1000000000	\N	1530159267	2416	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1269	Elastos	ELA	82	5226099	33674827	\N	1530159268	2492	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
684	Gas	GAS	84	10128375	17190378	100000000	1530159257	1785	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1044	CyberMiles	CMT	85	692460729	1000000000	\N	1530159264	2246	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1099	Bibox Token	BIX	88	104342466	269944749	\N	1530159265	2307	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
178	Syscoin	SYS	92	535933457	535933457	888000000	1530159245	541	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
708	Ethos	ETHOS	94	76853089	222295208	\N	1530159257	1817	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1339	TrueUSD	TUSD	97	80123627	80123627	\N	1530159270	2563	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1481	Docademic	MTC	102	289365393	850000000	\N	1530159272	2711	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1001	Paypex	PAYX	107	68428768	150000000	\N	1530159263	2191	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
953	Power Ledger	POWR	108	373406643	1000000000	\N	1530159262	2132	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
486	Byteball Bytes	GBYTE	112	645946	1000000	\N	1530159252	1492	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
615	ZenCash	ZEN	113	4156025	4156025	21000000	1530159255	1698	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1085	Gifto	GTO	118	533786482	1000000000	\N	1530159264	2289	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
165	BitcoinDark	BTCD	119	1288862	1288862	\N	1530159245	467	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1094	WAX	WAX	120	638089418	1850000000	\N	1530159265	2300	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
823	ChainLink	LINK	123	350000000	1000000000	\N	1530159261	1975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1070	MediShares	MDS	127	1017499234	2000000000	\N	1530159265	2274	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
707	Civic	CVC	129	342699966	1000000000	\N	1530159257	1816	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1206	SingularityNET	AGI	134	539673260	1000000000	\N	1530159267	2424	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
662	TenX	PAY	136	109200361	205218256	\N	1530159256	1758	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
565	Skycoin	SKY	139	9000000	25000000	100000000	1530159254	1619	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1454	Holo	HOT	140	133214575156	177619433541	\N	1530159271	2682	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1320	Nucleus Vision	NCASH	142	4362245098	10000000000	\N	1530159269	2544	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1073	SmartMesh	SMT	151	1413716694	3141592653	\N	1530159265	2277	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1034	Time New Bank	TNB	154	2361679677	5541679677	\N	1530159264	2235	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
880	Cindicator	CND	155	1445976590	2000000005	\N	1530159261	2043	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1317	Storiqa	STQ	156	8025845771	11287544272	\N	1530159269	2541	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1235	True Chain	TRUE	158	46448735	100000000	\N	1530159267	2457	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
757	Dent	DENT	160	10614760961	100000000000	\N	1530159258	1886	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1231	EDUCare	EKT	161	450000000	1000000000	\N	1530159268	2453	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1281	Bluzelle	BLZ	162	182957741	500000000	\N	1530159268	2505	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
108	Groestlcoin	GRS	168	70342294	70342294	105000000	1530159243	258	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
719	Pillar	PLR	170	259348201	800000000	\N	1530159258	1834	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1017	Quantstamp	QSP	172	617314171	976442388	\N	1530159263	2212	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1332	Credits	CS	174	137958656	249471071	\N	1530159269	2556	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1087	Genaro Network	GNX	180	241663510	675000000	\N	1530159265	2291	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1098	Bread	BRD	182	88422978	88862718	\N	1530159265	2306	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1472	Bitcoin Interest	BCI	185	18326892	18326892	22300000	1530159272	2702	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1562	QuarkChain	QKC	186	357431729	10000000000	\N	1530159274	2840	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1328	IHT Real Estate Protocol	IHT	191	516159153	1000000000	\N	1530159269	2552	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1405	Stakenet	XSN	192	68523273	78888866	\N	1530159271	2633	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
188	Ubiq	UBQ	193	41419350	41419350	\N	1530159246	588	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
793	Po.et	POE	200	2297132548	3141592653	\N	1530159259	1937	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1586	Merculet	MVP	475	912268199	10000000000	\N	1530159274	2869	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1587	FantasyGold	FGC	755	6508122	6780734	\N	1530159274	2870	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1590	Aurora	AOA	1353	\N	10000000000	\N	1530159274	2874	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1589	Metronome	MET	1378	\N	10005760	\N	1530159274	2873	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1592	Ternio	TERN	1393	\N	999966667	\N	1530159274	2876	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1594	DigiFinexToken	DFT	1398	\N	2100000000	\N	1530159274	2878	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1584	Bittwatt	BWT	1415	\N	9071175	\N	1530159274	2867	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1591	ALAX	ALX	1421	\N	1000000000	\N	1530159274	2875	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1588	EnergiToken	ETK	1431	\N	2500000000	\N	1530159274	2872	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1593	Bodhi [ETH]	BOE	1435	\N	100000000	\N	1530159274	2877	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
345	Safe Exchange Coin	SAFEX	199	1543157590	2147483647	2147483647	1530159249	1172	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
627	Quantum Resistant Ledger	QRL	224	52000000	65000000	105000000	1530159256	1712	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
424	Experience Points	XP	246	234099238585	268912698858	\N	1530159250	1367	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
72	Counterparty	XCP	264	2616225	2616225	\N	1530159243	132	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1095	MediBloc [QRC20]	MED	291	2966384100	4097545844	10000000000	1530159265	2303	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1406	XinFin Network	XDCE	326	3660947565	15000000000	\N	1530159271	2634	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
824	Blackmoon	BMC	338	21226890	60000000	\N	1530159259	1976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
341	Francs	FRN	1521	\N	6107268	\N	1530159248	1164	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
150	Donationcoin	DON	1538	\N	\N	\N	1530159245	385	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
930	Ethereum Lite	ELITE	1548	\N	1000000	\N	1530159261	2101	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
441	PROUD Money	PROUD	1568	\N	5711511682	\N	1530159251	1398	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1171	Cloud	CLD	1578	\N	60000000	\N	1530159266	2385	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
260	EggCoin	EGG	1588	\N	\N	\N	1529940248	912	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
993	Genesis Vision	GVT	202	3726781	4436644	\N	1530159263	2181	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1183	Internet Node Token	INT	217	281429000	1000000000	\N	1530159266	2399	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
871	BridgeCoin	BCO	229	27000000	27000000	27000000	1530159262	2033	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
167	Viacoin	VIA	239	23057575	23057575	23176392	1530159255	470	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
784	Tierion	TNT	290	428481269	1000000000	\N	1530159259	1923	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
401	LBRY Credits	LBC	300	167241196	542141200	\N	1530159250	1298	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1287	WePower	WPR	302	448809474	745248183	\N	1530159269	2511	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
900	Maecenas	ART	321	30150150	100000000	\N	1530159261	2064	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
592	Humaniq	HMQ	351	165571555	186903555	920952070	1530159254	1669	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
329	Synereo	AMP	381	100728564	622410799	\N	1530159248	1125	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1020	Energo	TSL	391	678361823	1000000000	\N	1530159263	2215	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
995	EA Coin	EAG	1526	\N	75206327	100000000	1530159263	2183	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
582	Tattoocoin (Limited Edition)	TLE	1546	\N	975608	\N	1530159254	1647	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
106	Gulden	NLG	211	400018700	471518700	\N	1530159243	254	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
111	WhiteCoin	XWC	261	249162254	249162254	\N	1530159243	268	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
987	DecentBet	DBET	305	128768039	186420963	\N	1530159264	2175	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1107	HTMLCOIN	HTML	315	65877343747	94044586504	\N	1530159265	2315	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1286	Datawallet	DXT	325	390222225	1000000000	\N	1530159269	2510	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
788	Primas	PST	385	51199999	100000000	\N	1530159259	1930	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
496	LandCoin	LDCN	1529	\N	19003881978	\N	1530159252	1507	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1326	Rock	RKT	215	375051999	900000000	\N	1530159269	2550	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
550	Edgeless	EDG	225	88087036	132046997	\N	1530159253	1596	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
322	PACcoin	$PAC	283	4029833406	4539815480	100000000000	1530159248	1107	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1585	Constellation	DAG	308	595356109	4000000000	\N	1530159274	2868	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
57	KlondikeCoin	KDC	1542	\N	\N	\N	1530159242	101	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
765	Smoke	SMOKE	1552	\N	13379987	420000000	1530159258	1898	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1189	InvestDigital	IDT	1592	\N	800000000	\N	1528823978	2406	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1413	Apex	CPX	216	429131314	676989090	\N	1530159271	2641	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1534	APIS	APIS	244	4416350572	9520000000	\N	1530159273	2767	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1220	SelfSell	SSC	327	390000000	1000000000	\N	1530159267	2439	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1175	Bankex	BKX	336	73946809	400000000	\N	1530159267	2390	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1349	Electrify.Asia	ELEC	346	436608433	750000000	\N	1530159270	2573	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
729	iXledger	IXT	387	35778844	65778844	\N	1530159258	1845	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
910	Runners	RUNNERS	1544	\N	\N	\N	1530159262	2077	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1244	OriginTrail	TRAC	220	268253992	500000000	\N	1530159268	2467	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1015	Ink	INK	227	463910527	1000000000	1000000000	1530159263	2209	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
619	Metaverse ETP	ETP	268	35949804	55349804	100000000	1530159255	1703	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
445	Pepe Cash	PEPECASH	345	701884009	701884009	\N	1530159251	1405	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1127	Bloom	BLT	394	47705031	150000000	\N	1530159265	2340	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
942	FAPcoin	FAP	1547	\N	400022341	\N	1530159263	2118	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
443	Omicron	OMC	1577	\N	10140044	\N	1530159251	1400	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
148	NavCoin	NAV	231	63011483	63011483	\N	1530159245	377	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1545	Eximchain	EXC	258	67306444	150000000	\N	1530159273	2778	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1346	TomoChain	TOMO	266	55000000	100000000	\N	1530159270	2570	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1258	Zeepin	ZPT	304	500000000	1000000000	\N	1530159268	2481	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1079	Datum	DAT	319	905358042	2653841598	\N	1530159265	2283	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
587	Lunyr	LUN	329	2297853	2703356	\N	1530159255	1658	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1379	Bitcoin Green	BITG	342	3798064	3798064	21000000	1530159270	2604	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
252	Pura	PURA	352	174172851	180955345	350000000	1530159246	870	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
74	TopCoin	TOP	1555	\N	41643721	\N	1530159243	135	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
361	GoldMaxCoin	GMX	1565	\N	84078950	\N	1530159249	1213	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
893	Eidoo	EDO	232	29261461	90208328	\N	1530159261	2057	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
103	FairCoin	FAIR	262	53193831	53193831	\N	1530159243	224	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
913	Modum	MOD	297	18266200	27266200	27266200	1530159262	2080	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
523	Melon	MLN	307	599400	749400	\N	1530159253	1552	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
829	VIBE	VIBE	339	200200144	267000000	\N	1530159260	1983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
575	XTRABYTES	XBY	349	430000000	650000000	650000000	1530159254	1636	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1305	Cashaa	CAS	359	415522566	1000000000	\N	1530159269	2529	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1016	Bodhi	BOT	379	40000000	100000000	100000000	1530159263	2211	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1301	Alphacat	ACAT	399	2790428084	6250000000	\N	1530159269	2525	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1192	EtherDelta Token	EDT	1593	\N	1500000000	\N	1529979864	2409	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1128	SwftCoin	SWFTC	252	3639990384	10000000000	\N	1530159265	2341	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1043	Presearch	PRE	259	155000000	170000000	1000000000	1530159264	2245	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1212	Hydro Protocol	HOT	269	702000000	1560000000	\N	1530159267	2430	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
723	OracleChain	OCT	310	30000000	200000000	\N	1530159258	1838	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1010	Oyster	PRL	350	84966676	98592692	\N	1530159263	2202	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
852	Bismuth	BIS	372	10840812	11406145	109999978	1530159260	2009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1540	GINcoin	GIN	257	2022956	2029946	\N	1530159273	2773	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1111	UTRUST	UTK	285	309089013	500000000	\N	1530159265	2320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
731	Mothership	MSP	309	140000000	200000000	\N	1530159258	1847	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1447	Dock	DOCK	347	379431647	1000000000	\N	1530159272	2675	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
155	Boolberry	BBR	377	11709823	11709823	18450000	1530159244	406	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1242	Blockport	BPT	396	52120933	69434800	\N	1530159267	2465	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
857	ATMChain	ATM	408	4660285460	10000000000	\N	1530159260	2015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1071	ProChain	PRA	412	49562749	100000000	\N	1530159265	2275	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
431	NoLimitCoin	NLC2	416	208401842	208401842	\N	1530159251	1382	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1510	Sakura Bloom	SKB	417	2582965294	6000000000	\N	1530159273	2742	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1190	AICHAIN	AIT	418	535067071	2100000000	\N	1530159267	2407	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
244	GridCoin	GRC	421	390312753	390312753	\N	1530159247	833	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
643	Numeraire	NMR	424	1349328	2349328	21000000	1530159256	1732	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
966	Unikoin Gold	UKG	428	141272371	1000000000	\N	1530159262	2149	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
53	Mooncoin	MOON	430	224370720035	224370720035	\N	1530159242	89	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1069	Uquid Coin	UQC	431	10000000	40000000	\N	1530159264	2273	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
45	Diamond	DMD	432	2838507	2838507	4380000	1530159242	77	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1254	Nework	NKC	437	147586172	1000000000	\N	1530159268	2477	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1582	Smartshare	SSP	439	2749934937	10000000000	\N	1530159274	2862	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
920	LATOKEN	LA	440	81037294	400000000	1000000000	1530159262	2090	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
562	Matchpool	GUP	446	75000000	98855150	\N	1530159254	1616	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1394	Switcheo	SWTH	447	522694673	1000000000	\N	1530159271	2620	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1550	Phantasma	SOUL	449	58332939	91136374	\N	1530159273	2827	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1531	Silent Notary	SNTR	450	82932191711	186462812051	\N	1530159273	2764	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1046	Cappasity	CAPP	459	457032658	562462096	\N	1530159264	2248	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
321	StrongHands	SHND	464	18984246847200	18984246847200	18984246847200	1530159248	1106	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1083	LockTrip	LOC	465	9292966	18585933	\N	1530159265	2287	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
675	adToken	ADT	470	600000000	1000000000	1000000000	1530159256	1775	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
681	Ecobit	ECOB	471	444444444	8888888888	\N	1530159256	1782	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
169	I/O Coin	IOC	472	16798944	16798944	\N	1530159246	495	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
737	OAX	OAX	474	25009250	100000000	\N	1530159258	1853	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1398	Friendz	FDZ	482	509077357	1142645649	\N	1530159271	2626	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1526	Patron	PAT	484	239954716	400000000	\N	1530159273	2759	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1538	RED	RED	485	130000009	200000000	\N	1530159273	2771	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1261	Hi Mutual Society	HMC	488	404100000	1000000000	\N	1530159268	2484	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
801	Agrello	DLT	489	85978873	130271020	\N	1530159259	1949	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
34	FlorinCoin	FLO	490	144600060	144600060	160000000	1530159248	64	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
924	Paragon	PRG	491	65936598	164936588	\N	1530159262	2094	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1135	Measurable Data Token	MDT	502	332384456	1000000000	\N	1530159266	2348	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1369	LatiumX	LATX	505	83090177	300000000	\N	1530159270	2594	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1074	HollyWoodCoin	HWC	507	5949222	25304500	\N	1530159264	2278	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
270	Gambit	GAM	510	1200279	1200279	\N	1530159247	939	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1525	Unibright	UBT	515	131427622	150000000	\N	1530159273	2758	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
312	SIBCoin	SIB	519	16841853	16841853	\N	1530159248	1082	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1288	U.CASH	UCASH	522	1844678441	21000000000	21000000000	1530159269	2512	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1364	Guaranteed Ethurance Token Extra	GETX	525	300000000	1000000000	\N	1530159270	2589	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1243	aXpire	AXP	529	265000000	350000000	\N	1530159268	2466	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
837	Rivetz	RVT	532	26244468	200000000	\N	1530159260	1991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
869	Hubii Network	HBT	533	13516418	31801784	\N	1530159260	2031	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
207	AurumCoin	AU	535	297949	297949	300000	1530159246	666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	Novacoin	NVC	537	2110653	2110653	\N	1530159242	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1150	Zap	ZAP	541	112148159	520000000	\N	1530159266	2363	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
143	BitSend	BSD	543	19625875	19625875	\N	1530159245	366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
638	ZrCoin	ZRC	546	3907503	4988894	\N	1530159255	1726	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1008	GoByte	GBX	548	1855973	2680960	31800000	1530159263	2200	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
480	Nexium	NXC	552	66520614	66520614	\N	1530159252	1481	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1075	Playkey	PKT	555	13631512	19893268	\N	1530159264	2279	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1438	Effect.AI	EFX	556	206668526	650000000	\N	1530159271	2666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1493	Zippie	ZIPT	560	169705413	1000000000	1000000000	1530159272	2724	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1470	Sharder	SS	561	283282765	350000000	500000000	1530159273	2699	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1422	CommerceBlock	CBT	563	173256686	743256686	\N	1530159271	2650	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1359	Debitum	DEB	564	192374697	400000000	\N	1530159270	2584	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1357	LALA World	LALA	567	189647051	250000000	\N	1530159270	2582	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
836	BitDice	CSNO	571	70000000	100000000	\N	1530159259	1990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1014	EncrypGen	DNA	580	62219914	70978131	\N	1530159263	2208	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1528	Local World Forwarders	LWF	582	94369844	105523325	\N	1530159273	2761	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1146	Polis	POLIS	583	2642361	2642361	25000000	1530159266	2359	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1271	Pareto Network	PARETO	585	245801795	500000000	\N	1530159269	2495	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
237	Dotcoin	DOT	586	308299250	573299250	890000000	1530159246	814	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
623	Patientory	PTOY	588	70000000	100002000	\N	1530159255	1708	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
494	Spectrecoin	XSPEC	589	20785264	20785264	\N	1530159252	1505	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
442	Sequence	SEQ	590	45742688	45742688	\N	1530159251	1399	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1032	Flixxo	FLIXX	592	79671513	189151329	\N	1530159264	2231	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1011	B2BX	B2B	594	16350644	19822337	\N	1530159264	2204	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1347	Graft	GRFT	595	289215459	1031318459	1844674407	1530159270	2571	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
85	Pandacoin	PND	604	32514916898	32514916898	\N	1530159243	161	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	GoldCoin	GLD	606	41109180	41109180	72245700	1530159242	25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1240	AidCoin	AID	609	40409478	100000000	\N	1530159267	2462	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1276	Zilla	ZLA	614	38466654	60000000	\N	1530159268	2500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1325	Ink Protocol	XNK	617	176630334	500000000	\N	1530159269	2549	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
308	Bitcrystals	BCY	619	23167827	23167827	\N	1530159248	1063	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
768	MyBit Token	MYB	629	68596043	180000000	\N	1530159259	1902	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1181	Hackspace Capital	HAC	635	323468789	1000000000	\N	1530159267	2397	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
556	Solaris	XLR	637	1389042	1421093	\N	1530159253	1606	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1333	Bee Token	BEE	639	169534596	500000000	\N	1530159269	2557	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1520	Colu Local Network	CLN	640	105676960	1540701334	\N	1530159273	2753	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
817	XPA	XPA	641	57177751	10000000000	\N	1530159259	1968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
771	TrueFlip	TFL	644	6247267	8924667	\N	1530159258	1905	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1344	JET8	J8T	650	452135505	1468857775	\N	1530159269	2568	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1479	Morpheus Labs	MITX	655	176560198	800000000	\N	1530159272	2709	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
403	Breakout Stake	BRX	657	6268082	6268082	6268082	1530159250	1303	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
51	FedoraCoin	TIPS	658	212269865434	482759907611	\N	1530159253	87	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1268	Travelflex	TRF	660	78808935	107228879	\N	1530159268	2491	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
153	Kore	KORE	661	2022465	2022465	12000000	1530159244	400	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
81	Pesetacoin	PTC	681	134555684	134555684	\N	1530159243	151	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
904	Open Trading Network	OTN	689	1925384	82630002	100000000	1530159262	2069	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
546	Tokes	TKS	713	3356174	50000000	\N	1530159253	1588	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1217	RefToken	REF	771	732429	50000000	\N	1530159267	2436	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
540	Zero	ZER	827	3002570	3002570	\N	1530159253	1578	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1086	YENTEN	YTN	965	8330378	8570350	84000000	1530159265	2290	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1061	Pioneer Coin	PCOIN	975	2891663	3787096	23000000	1530159265	2265	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
717	HarmonyCoin	HMC	985	561235	33565561235	67130000000	1530159257	1832	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1340	HOQU	HQX	663	151118386	300854380	\N	1530159269	2564	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1543	Travala	AVA	709	27226584	61571086	\N	1530159273	2776	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1042	Payfair	PFR	723	88999687	88999687	\N	1530159264	2244	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
620	eBoost	EBST	743	20000000	80828160	99990000	1530159255	1704	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1558	Bigbom	BBO	762	296651352	1999751537	\N	1530159274	2836	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
219	GCN Coin	GCN	810	157959560000	157959560000	\N	1530159246	730	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1401	Stellite	XTL	814	2982832499	3108832499	21000000000	1530159270	2629	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1475	Amon	AMN	854	126440558	1666666667	\N	1530159272	2705	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
992	bitJob	STU	864	48043991	200000000	\N	1530159263	2180	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
686	Jetcoin	JET	914	6823701	80000000	\N	1530159256	1787	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
495	Safe Trade Coin	XSTC	952	326829322	703990919	\N	1530159252	1506	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
712	LiteBitcoin	LBTC	962	28940333	172585874	1000000000	1530159257	1825	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
328	OBITS	OBITS	664	15674600	15674600	\N	1530159248	1123	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1334	Insights Network	INSTAR	707	130017349	214155387	\N	1530159269	2558	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1207	Gatcoin	GAT	714	529861449	1000000000	\N	1530159267	2425	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1051	Social Send	SEND	725	32074754	34264697	\N	1530159264	2255	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1445	Chainium	CHX	782	58255765	168956522	\N	1530159271	2673	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1038	onG.social	ONG	792	32081060	150000000	\N	1530159264	2240	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
618	Version	V	809	505380338	505380338	\N	1530159256	1702	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1142	OP Coin	OPC	815	1613177544	2227848828	\N	1530159266	2355	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
411	808Coin	808	845	129995317641	129995317641	\N	1530159250	1322	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
645	Unify	UNIFY	875	17860831	17860831	19276800	1530159256	1736	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
506	FirstCoin	FRST	885	31207528	110000000	\N	1530159252	1522	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
809	Oceanlab	OCL	906	46500000	50000000	\N	1530159260	1959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
909	Blue Protocol	BLUE	668	36645278	42000000	42000000	1530159261	2076	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
265	Universal Currency	UNIT	703	14253154	18353154	210000000	1530159247	921	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
179	Bitmark	BTM	717	8942987	8942987	\N	1530137345	543	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
366	Qwark	QWARK	729	57939018	206075989	\N	1530159250	1226	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
697	PeepCoin	PCN	736	17209161372	56409161372	\N	1530159257	1803	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1052	Bonpay	BON	748	11290301	21745688	\N	1530159264	2256	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1118	Pylon Network	PYLNT	791	355506	633858	\N	1530159265	2330	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1480	Live Stars	LIVE	832	39722531	54722996	\N	1530159272	2710	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
90	Photon	PHO	840	23516245035	23516245035	\N	1530159243	175	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17	Bitgem	BTG	939	61103	61103	\N	1530159242	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
554	Databits	DTB	994	22747809	22747809	\N	1530159253	1603	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1323	Experty	EXY	675	27088352	79404564	\N	1530159269	2547	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
469	Internet of People	IOP	695	3525843	3931947	21000000	1530159252	1464	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
33	I0Coin	I0C	706	20991908	20991908	\N	1530159277	63	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
290	Capricoin	CPC	726	1990045	200995023	205000000	1530159248	1008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1388	BlitzPredict	XBP	816	351792338	950873123	\N	1530159271	2614	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1050	Jiyo	JIYO	826	38552027	39128194	70560000	1530159264	2253	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
379	PlatinumBAR	XPTX	836	1041494	1041494	\N	1530159249	1254	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
691	Bitdeal	BDL	886	175583793	219596262	300000000	1530159257	1793	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
603	RouletteToken	RLT	896	10217807	10218530	\N	1530159254	1683	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
666	BriaCoin	BRIA	912	743431	743431	3000000	1530159256	1763	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
349	TrumpCoin	TRUMP	922	6601915	6601915	\N	1530159249	1185	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
730	GeyserCoin	GSR	979	46864	599334	4500000	1530159257	1846	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
464	Lykke	LKK	989	316809739	1285690000	\N	1527788953	1454	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
241	GeoCoin	GEO	677	3170551	4000000	\N	1530159246	823	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1338	Education Ecosystem	LEDU	704	217789857	362983094	\N	1530159270	2562	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
432	VeriumReserve	VRM	735	1679758	1679758	\N	1530159251	1387	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1021	Publica	PBL	749	18582933	33787150	\N	1530159263	2217	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
727	CampusCoin	CMPCO	772	433935049	633935049	1010000000	1530159257	1842	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1230	Tokenbox	TBX	788	11159772	16051590	\N	1530159268	2452	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
203	DigitalPrice	DP	806	19780674	27280675	\N	1530159245	654	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
946	Vulcano	VULC	819	2418102411	2486990966	\N	1530159262	2123	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1289	GoldMint	MNTP	828	1914997	10000000	\N	1530159268	2513	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
455	Advanced Technology Coin	ARC	878	24870949	24870949	\N	1530159251	1434	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1202	Nitro	NOX	898	7188734	120000000	\N	1530159267	2420	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
607	Digital Money Bits	DMB	903	85374172	95374172	131250000	1530159255	1687	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
864	FLiK	FLIK	919	60123682	80000000	600000000	1530159260	2025	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1498	Fitrova	FRV	929	7563036179	7588648240	\N	1530159272	2730	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1412	WCOIN	WIN	941	3569267	56642699	\N	1530159271	2640	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
376	Zurcoin	ZUR	970	87653034	87653034	\N	1530159249	1250	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1121	FidentiaX	FDX	679	105000000	130000000	\N	1530159265	2333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
855	Voise	VOISE	741	521625806	775513264	\N	1530159260	2012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
31	Sexcoin	SXC	766	127356157	127356157	\N	1530159253	58	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1036	EventChain	EVC	787	31250497	84000000	\N	1530159264	2237	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
934	Xenon	XNN	798	300000000	1000000000	\N	1530159262	2106	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
715	SkinCoin	SKIN	817	88183483	388183483	\N	1530159257	1830	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	Argentum	ARG	842	9735469	9735469	\N	1530159244	31	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
83	Cashcoin	CASH	882	47675905	47675905	\N	1530159243	159	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
375	Elcoin	EL	892	11208967	20935289	\N	1530159249	1249	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1238	Qbic	QBIC	935	2292387	3034279	52500000	1530159268	2460	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
690	Virta Unique Coin	VUC	976	61946725	61946725	120000000	1530159257	1792	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
298	TransferCoin	TX	686	6525735	6525735	\N	1530159247	1032	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1571	Hurify	HUR	705	111926311	273125000	\N	1530159273	2849	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	Terracoin	TRC	742	22935396	22935396	42000000	1530159242	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
205	Bitswift	SWIFT	805	3884635	3884635	\N	1530159247	659	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1516	Signals Network	SGN	853	85900721	185000000	\N	1530159273	2749	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1172	United Crypto Community	UCOM	873	1290226	2375226	18900000	1530159266	2386	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
271	Bata	BTA	913	5029075	5029075	10000000	1530159248	945	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
994	EagleCoin	EAGLE	953	2093421	3633153	\N	1530159263	2182	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
246	X-Coin	XCO	963	12384976	12384976	\N	1530159247	837	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
882	Coimatic 3.0	CTIC3	983	2259512	102000000	102000000	1530159262	2045	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1106	Cryptopay	CPAY	710	67559427	90414745	\N	1530159265	2314	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1548	Naviaddress	NAVI	750	242550845	1000000000	\N	1530159273	2825	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
846	TrezarCoin	TZC	821	95718600	107718600	400000000	1530159260	2002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19	Megacoin	MEC	839	37207862	37207862	42000000	1530159244	37	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
848	Obsidian	ODN	849	25000000	97047046	\N	1530159260	2005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1187	TOKYO	TOKC	947	164784422	273981148	\N	1530159266	2404	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
832	CHIPS	CHIPS	997	20992743	20992743	21000000	1530159260	1986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
172	CannabisCoin	CANN	773	77231176	91859176	\N	1530159244	506	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
385	Nullex	NLX	783	40477042	51530001	\N	1530159250	1268	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1179	Ignition	IC	820	697816	753140	5000000	1530159266	2395	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
807	VIVO	VIVO	851	2175180	2995180	\N	1530159259	1956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1296	Jesus Coin	JC	861	18317557939	20325184344	\N	1530159269	2520	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
29	Zetacoin	ZET	881	168255589	168255589	\N	1530159242	56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
570	Happycoin	HPC	910	14663578	14663578	100000000	1530159254	1628	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
216	TittieCoin	TTC	930	1259816434	1259816434	\N	1530159247	719	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1059	Kubera Coin	KBR	942	114423294	1162102077	\N	1530159264	2263	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
509	Solarflarecoin	SFC	951	14083450	14083450	\N	1530159252	1525	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1195	Harvest Masternode Coin	HC	961	2379509	3494588	10000000	1530159267	2412	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
954	Grid+	GRID	991	39236491	300000000	\N	1530159262	2134	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
406	HEAT	HEAT	1001	34911782	34911782	\N	1530159250	1308	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
76	Mintcoin	MINT	1007	24947260808	24947260808	\N	1530159243	141	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
487	PoSW Coin	POSW	1008	44100000	70000000	\N	1530159252	1495	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
789	Opus	OPT	1009	140080549	249308531	249308531	1530159259	1931	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
927	Mercury Protocol	GMT	1010	170309625	1000000000	\N	1529963670	2098	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
24	Bullion	CBX	1019	1016178	1016178	\N	1530159242	49	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
810	imbrex	REX	1025	8660756	24015497	\N	1530159259	1961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
979	Ties.DB	TIE	1026	40761740	59251278	\N	1530076165	2166	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
287	ChainCoin	CHC	1029	15309822	17339519	23000000	1530159248	999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
628	EncryptoTel [WAVES]	ETT	1030	62131190	77663987	\N	1530159257	1714	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
238	Kobocoin	KOBO	1035	24700248	24700248	\N	1530159246	815	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
187	WeAreSatoshi	WSX	1037	24532587	24532587	\N	1530159245	584	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
55	42-coin	42	1038	42	42	\N	1530159255	93	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1365	HireMatch	HIRE	1040	32215700	77780000	\N	1530159270	2590	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1436	CryCash	CRC	1041	4551636	7057137	\N	1530159271	2664	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1285	EtherSportz	ESZ	1048	4941600	6905580	\N	1530131669	2509	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
736	KekCoin	KEK	1053	10716385	11716385	21000000	1530159258	1852	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1158	Commodity Ad Network	CDX	1055	32550000	120000000	\N	1530159266	2372	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
278	The Cypherfunks	FUNK	1056	48037632499	48037632499	\N	1530159248	965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	WorldCoin	WDC	1058	119606941	119606941	\N	1530159242	16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
973	Farad	FRD	1059	135186444	183333333	\N	1530159262	2159	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
798	Masternodecoin	MTNC	1060	53003312	76934369	\N	1530159260	1946	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
606	EquiTrader	EQT	1066	10807419	11907419	\N	1530159255	1686	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
795	StarCredits	STRC	1067	4500000	20000000	20000000	1530159259	1942	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
652	Dinastycoin	DCY	1073	1669690916	1669690916	\N	1530159256	1745	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
232	MetalCoin	METAL	1074	76925527	76925527	\N	1529909647	796	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
250	Woodcoin	LOG	1075	8035193	8035193	\N	1529911450	859	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
569	InPay	INPAY	1081	10000000	10000000	\N	1530159254	1626	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
46	HoboNickels	HBN	1083	64151405	64151405	120000000	1530159242	78	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
69	QubitCoin	Q2C	1084	248919911	248919911	\N	1530159254	129	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
275	UniCoin	UNIC	1086	3034822	3034822	\N	1530159247	959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
381	LanaCoin	LANA	1088	916171805	916171805	\N	1530159249	1257	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18	Phoenixcoin	PXC	1090	67427775	67427775	\N	1530159242	35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1024	VoteCoin	VOT	1096	31893125	31893125	220000000	1530159264	2221	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
151	Piggycoin	PIGGY	1099	490434069	490434069	\N	1530159246	386	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
95	Bitcoin Scrypt	BTCS	1102	17424813	17424813	\N	1530159243	205	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
37	Joulecoin	XJO	1103	36130679	36130679	\N	1530159242	68	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
168	Triangles	TRI	1106	114079	114079	\N	1530159245	477	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
141	Motocoin	MOTO	1109	19642673	32173303	\N	1530159244	360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
77	Aricoin	ARI	1110	232432480	232432480	\N	1530159243	142	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
885	Ethereum Cash	ECASH	1117	14100000	15000000	\N	1530159261	2048	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
226	bitGold	BITGOLD	1118	189	189	\N	1530159255	778	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
499	PureVidz	VIDZ	1121	125279775	125279775	\N	1530159252	1511	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
427	Golfcoin	GOLF	1127	1274310562	1714310572	1800000000	1530159250	1375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
498	CryptoCarbon	CCRB	1128	3562111	70000000	70000000	1530159252	1510	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
137	SuperCoin	SUPER	1132	49114984	49114984	\N	1530159244	341	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
282	IrishCoin	IRL	1134	35486499	39986499	\N	1530159247	988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
876	Senderon	SDRN	1139	44126901	45625900	\N	1530159261	2039	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
47	Tigercoin	TGC	1142	43536800	43536800	\N	1530159253	79	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
969	CarTaxi Token	CTX	1143	39928144	59928144	\N	1530159262	2152	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
215	Gapcoin	GAP	1147	13385437	13385437	\N	1530159245	708	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
870	Crystal Clear 	CCT	1148	5223973	6924060	10000000	1530159260	2032	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
280	Ratecoin	XRA	1154	122449162	122449162	\N	1530159247	978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
309	Pakcoin	PAK	1156	57052450	57052450	182000000	1530159248	1066	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
563	Ultimate Secure Cash	USC	1157	10343113	38602656	200084200	1530159254	1617	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
346	Rubies	RBIES	1164	10415252	10415252	\N	1530159249	1175	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
65	UltraCoin	UTC	1167	47776744	47776744	\N	1530159254	121	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
255	LeaCoin	LEA	1176	369247315	369247315	2000000000	1530159247	892	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
664	ChanCoin	CHAN	1178	9163159	9163159	27000000	1530159256	1760	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
394	RevolverCoin	XRE	1179	22904373	22904373	\N	1530159250	1284	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
38	Datacoin	DTC	1182	31999133	31999133	\N	1530159242	69	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1028	Accelerator Network	ACC	1188	412414	567558	\N	1530159263	2225	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1039	Ccore	CCO	1190	1449999	10000000	\N	1530159263	2241	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
476	Eternity	ENT	1191	4344459	4344459	\N	1530159252	1474	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
306	Bolivarcoin	BOLI	1192	10681250	10681250	25000000	1530159248	1053	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
102	OctoCoin	888	1195	54897094	54897094	\N	1530159243	221	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
259	Advanced Internet Blocks	AIB	1196	32234319	31412139756	\N	1530159247	911	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
138	BoostCoin	BOST	1197	11855487	11855487	\N	1529776444	350	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
313	IslaCoin	ISL	1199	1513704	1513704	\N	1530159248	1084	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
208	Sativacoin	STV	1200	7094341	7094341	\N	1530043744	680	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
537	Pascal Lite	PASL	1201	5022100	5022100	\N	1530159254	1575	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
268	ParkByte	PKB	1204	4764026	4764026	\N	1530159248	934	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
561	Darsek	KED	1205	22504916	22504916	\N	1530159254	1614	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
52	RonPaulCoin	RPC	1208	943268	943268	\N	1530159242	88	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
755	DigitalDevelopersFund	DDF	1212	5118307	6428932	6428932	1530159258	1884	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
421	TajCoin	TAJ	1221	9650280	9650280	\N	1530159252	1353	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
325	SOILcoin	SOIL	1224	5702048	5702048	\N	1530159248	1111	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
26	GlobalCoin	GLC	1225	65171010	65171010	\N	1530159242	51	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
981	Grimcoin	GRIM	1232	188765210	202931948	\N	1530159263	2168	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
605	EcoCoin	ECO	1238	1163273	1164854	\N	1530159255	1685	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
392	High Voltage	HVCO	1239	1494171	1694171	\N	1530159250	1282	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
504	Digital Rupees	DRS	1249	510802961	510802961	\N	1530159253	1520	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
359	Cabbage	CAB	1298	10499996	10499996	\N	1530159249	1210	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
967	Credence Coin	CRDNC	1313	3427006	9227006	25000000	1530159263	2150	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1568	FuturoCoin	FTO	1345	\N	100000000	\N	1530159273	2846	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
775	Dalecoin	DALC	1240	467867	1000000	1000000	1530159259	1912	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
324	Money	$$$	1250	45887218	45887218	\N	1530159248	1110	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
518	Elysium	ELS	1260	12738398	12738398	18000000	1530159253	1539	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
572	Coinonat	CXT	1278	8623200	10123200	\N	1530159255	1630	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
382	PonziCoin	PONZI	1292	861099	861099	\N	1530159250	1259	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
284	BowsCoin	BSC	1327	5550102	5550102	\N	1530159247	993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1471	TrustNote	TTT	1347	\N	\N	\N	1530159272	2701	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1583	Sentinel Protocol	UPP	1368	\N	500000000	\N	1530159274	2866	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1572	TRAXIA	TMT	1379	\N	1000000000	\N	1530159274	2850	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1368	Dragon Coins	DRG	1416	\N	500000000	\N	1530159270	2593	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
781	NamoCoin	NAMO	1460	\N	560211620	1200000000	1530159258	1920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
821	Ethereum Dark	ETHD	1241	1500000	3019862	4200000	1530159259	1973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
140	BitQuark	BTQ	1261	10361348	10361348	\N	1530159244	356	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
792	LiteCoin Ultra	LTCU	1304	1031300	8531300	\N	1530159259	1935	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
502	iBank	IBANK	1329	4526324	4526324	\N	1530159252	1515	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1503	Content Neutrality Network	CNN	1349	\N	100000000000	\N	1530159272	2735	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1234	OFCOIN	OF	1364	\N	51200000000	\N	1530159268	2456	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1088	United Bitcoin	UBTC	1408	\N	21000000	21000000	1530159265	2293	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1564	Bankera	BNK	1419	\N	25000000000	\N	1530159273	2842	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
907	SegWit2x	B2X	1447	\N	16879800	21000000	1530159261	2072	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
519	Golos Gold	GBG	1481	\N	\N	\N	1530159253	1542	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
231	SoonCoin	SOON	1248	12462620	12462620	\N	1530159246	795	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
501	ICOBID	ICOB	1270	107048455	107048455	\N	1530159253	1514	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
512	Iconic	ICON	1302	592894	592894	\N	1530159253	1528	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
940	PlayerCoin	PLACO	1312	35120000	100120000	\N	1530159262	2115	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
722	Coimatic 2.0	CTIC2	1332	13532750	30132750	102000000	1530159257	1837	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1378	Pundi X	NPXS	1342	\N	68179231883	\N	1530159270	2603	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1219	Acute Angle Cloud	AAC	1363	\N	1000000000	\N	1530159267	2438	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1537	Cazcoin	CAZ	1455	\N	34062065	\N	1530159273	2770	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1140	CryptopiaFeeShares	CEFS	1478	\N	6300	\N	1530159266	2353	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
459	AllSafe	ASAFE2	1254	8200310	8200310	15000000	1530159251	1439	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
286	CompuCoin	CPN	1264	19615019	19615019	\N	1530159248	998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
586	Bitvolt	VOLT	1319	16588056	61608156	\N	1530159254	1657	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1549	ZIP	ZIP	1350	\N	100000000000	\N	1530159273	2826	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
484	Pabyosi Coin (Special)	PCS	1482	\N	30993751760	\N	1530159254	1487	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1117	Hyper Pay	HPY	1492	\N	2650000000	\N	1530159265	2329	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
533	Visio	VISIO	1256	51116031	63116031	\N	1530159254	1566	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
126	Dreamcoin	DRM	1294	2481017	2481017	\N	1529637845	316	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
243	Wild Beast Block	WBB	1323	181919	181919	\N	1530159247	831	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1221	Read	READ	1407	\N	2100000000	\N	1530159268	2440	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1578	SalPay	SAL	1417	\N	100000000	\N	1530159274	2857	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
883	Bastonet	BSN	1493	\N	50000000	\N	1530159261	2046	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
581	MACRON	MCRN	1265	401421401	401421401	\N	1530159255	1644	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
536	GeertCoin	GEERT	1293	5091200	5091200	\N	1530085453	1570	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
488	Luna Coin	LUNA	1305	1706429	1706429	\N	1530159252	1496	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
531	PIECoin	PIE	1316	11052595	11052595	\N	1530123853	1563	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1595	Origin Sport	ORS	1365	\N	300000000	\N	1530159274	2879	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1076	Filecoin [Futures]	FIL	1385	\N	\N	\N	1530159264	2280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1293	Animation Vision Cash	AVH	1406	\N	10000000000	\N	1530159269	2517	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
701	TerraNova	TER	1437	\N	1058739	\N	1530159257	1809	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
460	BipCoin	BIP	1269	1627261	1627261	\N	1530159251	1442	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
751	Shadow Token	SHDW	1279	7000000	10000000	\N	1530159258	1878	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
596	Cannation	CNNC	1310	2476893	2476893	\N	1530159254	1674	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1494	Skrumble Network	SKM	1346	\N	1500000000	\N	1530159272	2725	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1506	Super Game Chain	SGCC	1381	\N	20000000000	\N	1530159273	2738	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1215	Maggie	MAG	1391	\N	3200000000	\N	1530159268	2434	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
352	Independent Money System	IMS	1299	5368934	5368934	\N	1530159249	1194	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1232	UnlimitedIP	UIP	1361	\N	3000000000	\N	1530159268	2454	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1450	TraDove B2BCoin	BBC	1439	\N	393192965	\N	1530159271	2678	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1419	SnipCoin	SNIP	1449	\N	10000000000	\N	1530159271	2647	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
407	LetItRide	LIR	1307	37464974	37464974	\N	1530159251	1309	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
889	Royal Kingdom Coin	RKC	1317	2700000	15000000	\N	1530159261	2053	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
317	Save and Gain	SANDG	1328	3064800	3064800	\N	1530159248	1090	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
558	Tristar Coin	TSTR	1338	5027857	255027857	\N	1530159254	1608	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1463	Penta	PNT	1348	\N	50000000000	100000000000	1530159272	2691	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1145	Content and AD Network	CAN	1359	\N	1500000000	\N	1530159266	2358	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1546	Level Up Coin	LUC	1380	\N	1308800000	\N	1530159273	2779	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1596	Rate3	RTE	1400	\N	1000000000	\N	1530159274	2880	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1567	MediBloc [ERC20]	MEDX	1440	\N	10000000000	\N	1530159274	2845	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
887	Swisscoin	SIC	1454	\N	10200000000	\N	1530159261	2050	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20	Infinitecoin	IFC	1463	\N	90596274910	\N	1530159242	41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: coin_news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coin_news (id, coin_id, news_id) FROM stdin;
\.


--
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.currency (id, fiat, symbol) FROM stdin;
1	t	USD
2	t	EUR
3	t	CAD
4	t	GBP
5	t	HKD
6	f	BTC
7	f	ETH
\.


--
-- Data for Name: knex_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.knex_migrations (id, name, batch, migration_time) FROM stdin;
1	20180612164544_initial.js	1	2018-06-28 04:13:38.363+00
\.


--
-- Data for Name: knex_migrations_lock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.knex_migrations_lock (is_locked) FROM stdin;
0
\.


--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.news (id, title, content, source_id, link, created_at, counter) FROM stdin;
\.


--
-- Data for Name: news_alert; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.news_alert (id, user_id, coin_id, favourite, alert) FROM stdin;
\.


--
-- Data for Name: price; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price (id, coinmarketcap_id, currency_id, price, volume_24h, market_cap, percent_change_1h, percent_change_24h, percent_change_7d) FROM stdin;
1	1	1	\N	\N	\N	\N	\N	\N
2	2	1	\N	\N	\N	\N	\N	\N
3	3	1	\N	\N	\N	\N	\N	\N
4	4	1	\N	\N	\N	\N	\N	\N
5	5	1	\N	\N	\N	\N	\N	\N
6	6	1	\N	\N	\N	\N	\N	\N
7	8	1	\N	\N	\N	\N	\N	\N
8	9	1	\N	\N	\N	\N	\N	\N
9	10	1	\N	\N	\N	\N	\N	\N
10	13	1	\N	\N	\N	\N	\N	\N
11	14	1	\N	\N	\N	\N	\N	\N
12	16	1	\N	\N	\N	\N	\N	\N
13	18	1	\N	\N	\N	\N	\N	\N
14	25	1	\N	\N	\N	\N	\N	\N
15	31	1	\N	\N	\N	\N	\N	\N
16	32	1	\N	\N	\N	\N	\N	\N
17	34	1	\N	\N	\N	\N	\N	\N
18	35	1	\N	\N	\N	\N	\N	\N
19	37	1	\N	\N	\N	\N	\N	\N
20	41	1	\N	\N	\N	\N	\N	\N
21	42	1	\N	\N	\N	\N	\N	\N
22	43	1	\N	\N	\N	\N	\N	\N
23	45	1	\N	\N	\N	\N	\N	\N
24	49	1	\N	\N	\N	\N	\N	\N
25	50	1	\N	\N	\N	\N	\N	\N
26	51	1	\N	\N	\N	\N	\N	\N
27	52	1	\N	\N	\N	\N	\N	\N
28	53	1	\N	\N	\N	\N	\N	\N
29	56	1	\N	\N	\N	\N	\N	\N
30	57	1	\N	\N	\N	\N	\N	\N
31	58	1	\N	\N	\N	\N	\N	\N
32	61	1	\N	\N	\N	\N	\N	\N
33	63	1	\N	\N	\N	\N	\N	\N
34	64	1	\N	\N	\N	\N	\N	\N
35	66	1	\N	\N	\N	\N	\N	\N
36	67	1	\N	\N	\N	\N	\N	\N
37	68	1	\N	\N	\N	\N	\N	\N
38	69	1	\N	\N	\N	\N	\N	\N
39	70	1	\N	\N	\N	\N	\N	\N
40	71	1	\N	\N	\N	\N	\N	\N
41	72	1	\N	\N	\N	\N	\N	\N
42	74	1	\N	\N	\N	\N	\N	\N
43	75	1	\N	\N	\N	\N	\N	\N
44	76	1	\N	\N	\N	\N	\N	\N
45	77	1	\N	\N	\N	\N	\N	\N
46	78	1	\N	\N	\N	\N	\N	\N
47	79	1	\N	\N	\N	\N	\N	\N
48	80	1	\N	\N	\N	\N	\N	\N
49	83	1	\N	\N	\N	\N	\N	\N
50	84	1	\N	\N	\N	\N	\N	\N
51	87	1	\N	\N	\N	\N	\N	\N
52	88	1	\N	\N	\N	\N	\N	\N
53	89	1	\N	\N	\N	\N	\N	\N
54	90	1	\N	\N	\N	\N	\N	\N
55	93	1	\N	\N	\N	\N	\N	\N
56	99	1	\N	\N	\N	\N	\N	\N
57	101	1	\N	\N	\N	\N	\N	\N
58	103	1	\N	\N	\N	\N	\N	\N
59	109	1	\N	\N	\N	\N	\N	\N
60	113	1	\N	\N	\N	\N	\N	\N
61	114	1	\N	\N	\N	\N	\N	\N
62	117	1	\N	\N	\N	\N	\N	\N
63	118	1	\N	\N	\N	\N	\N	\N
64	120	1	\N	\N	\N	\N	\N	\N
65	121	1	\N	\N	\N	\N	\N	\N
66	122	1	\N	\N	\N	\N	\N	\N
67	125	1	\N	\N	\N	\N	\N	\N
68	128	1	\N	\N	\N	\N	\N	\N
69	129	1	\N	\N	\N	\N	\N	\N
70	130	1	\N	\N	\N	\N	\N	\N
71	131	1	\N	\N	\N	\N	\N	\N
72	132	1	\N	\N	\N	\N	\N	\N
73	134	1	\N	\N	\N	\N	\N	\N
74	135	1	\N	\N	\N	\N	\N	\N
75	138	1	\N	\N	\N	\N	\N	\N
76	141	1	\N	\N	\N	\N	\N	\N
77	142	1	\N	\N	\N	\N	\N	\N
78	145	1	\N	\N	\N	\N	\N	\N
79	148	1	\N	\N	\N	\N	\N	\N
80	150	1	\N	\N	\N	\N	\N	\N
81	151	1	\N	\N	\N	\N	\N	\N
82	154	1	\N	\N	\N	\N	\N	\N
83	159	1	\N	\N	\N	\N	\N	\N
84	160	1	\N	\N	\N	\N	\N	\N
85	161	1	\N	\N	\N	\N	\N	\N
86	164	1	\N	\N	\N	\N	\N	\N
87	168	1	\N	\N	\N	\N	\N	\N
88	170	1	\N	\N	\N	\N	\N	\N
89	174	1	\N	\N	\N	\N	\N	\N
90	175	1	\N	\N	\N	\N	\N	\N
91	181	1	\N	\N	\N	\N	\N	\N
92	182	1	\N	\N	\N	\N	\N	\N
93	199	1	\N	\N	\N	\N	\N	\N
94	201	1	\N	\N	\N	\N	\N	\N
95	205	1	\N	\N	\N	\N	\N	\N
96	206	1	\N	\N	\N	\N	\N	\N
97	212	1	\N	\N	\N	\N	\N	\N
98	213	1	\N	\N	\N	\N	\N	\N
99	215	1	\N	\N	\N	\N	\N	\N
100	217	1	\N	\N	\N	\N	\N	\N
101	218	1	\N	\N	\N	\N	\N	\N
102	221	1	\N	\N	\N	\N	\N	\N
103	224	1	\N	\N	\N	\N	\N	\N
104	233	1	\N	\N	\N	\N	\N	\N
105	234	1	\N	\N	\N	\N	\N	\N
106	254	1	\N	\N	\N	\N	\N	\N
107	257	1	\N	\N	\N	\N	\N	\N
108	258	1	\N	\N	\N	\N	\N	\N
109	260	1	\N	\N	\N	\N	\N	\N
110	263	1	\N	\N	\N	\N	\N	\N
111	268	1	\N	\N	\N	\N	\N	\N
112	269	1	\N	\N	\N	\N	\N	\N
113	275	1	\N	\N	\N	\N	\N	\N
114	276	1	\N	\N	\N	\N	\N	\N
115	278	1	\N	\N	\N	\N	\N	\N
116	279	1	\N	\N	\N	\N	\N	\N
117	287	1	\N	\N	\N	\N	\N	\N
118	290	1	\N	\N	\N	\N	\N	\N
119	291	1	\N	\N	\N	\N	\N	\N
120	293	1	\N	\N	\N	\N	\N	\N
121	295	1	\N	\N	\N	\N	\N	\N
122	298	1	\N	\N	\N	\N	\N	\N
123	304	1	\N	\N	\N	\N	\N	\N
124	312	1	\N	\N	\N	\N	\N	\N
125	313	1	\N	\N	\N	\N	\N	\N
126	316	1	\N	\N	\N	\N	\N	\N
127	317	1	\N	\N	\N	\N	\N	\N
128	322	1	\N	\N	\N	\N	\N	\N
129	323	1	\N	\N	\N	\N	\N	\N
130	325	1	\N	\N	\N	\N	\N	\N
131	328	1	\N	\N	\N	\N	\N	\N
132	331	1	\N	\N	\N	\N	\N	\N
133	333	1	\N	\N	\N	\N	\N	\N
134	334	1	\N	\N	\N	\N	\N	\N
135	337	1	\N	\N	\N	\N	\N	\N
136	338	1	\N	\N	\N	\N	\N	\N
137	341	1	\N	\N	\N	\N	\N	\N
138	350	1	\N	\N	\N	\N	\N	\N
139	353	1	\N	\N	\N	\N	\N	\N
140	356	1	\N	\N	\N	\N	\N	\N
141	360	1	\N	\N	\N	\N	\N	\N
142	362	1	\N	\N	\N	\N	\N	\N
143	366	1	\N	\N	\N	\N	\N	\N
144	367	1	\N	\N	\N	\N	\N	\N
145	370	1	\N	\N	\N	\N	\N	\N
146	372	1	\N	\N	\N	\N	\N	\N
147	374	1	\N	\N	\N	\N	\N	\N
148	377	1	\N	\N	\N	\N	\N	\N
149	382	1	\N	\N	\N	\N	\N	\N
150	385	1	\N	\N	\N	\N	\N	\N
151	386	1	\N	\N	\N	\N	\N	\N
152	389	1	\N	\N	\N	\N	\N	\N
153	400	1	\N	\N	\N	\N	\N	\N
154	405	1	\N	\N	\N	\N	\N	\N
155	406	1	\N	\N	\N	\N	\N	\N
156	411	1	\N	\N	\N	\N	\N	\N
157	415	1	\N	\N	\N	\N	\N	\N
158	416	1	\N	\N	\N	\N	\N	\N
159	426	1	\N	\N	\N	\N	\N	\N
160	448	1	\N	\N	\N	\N	\N	\N
161	450	1	\N	\N	\N	\N	\N	\N
162	460	1	\N	\N	\N	\N	\N	\N
163	461	1	\N	\N	\N	\N	\N	\N
164	463	1	\N	\N	\N	\N	\N	\N
165	467	1	\N	\N	\N	\N	\N	\N
166	468	1	\N	\N	\N	\N	\N	\N
167	470	1	\N	\N	\N	\N	\N	\N
168	477	1	\N	\N	\N	\N	\N	\N
169	495	1	\N	\N	\N	\N	\N	\N
170	501	1	\N	\N	\N	\N	\N	\N
171	502	1	\N	\N	\N	\N	\N	\N
172	506	1	\N	\N	\N	\N	\N	\N
173	512	1	\N	\N	\N	\N	\N	\N
174	513	1	\N	\N	\N	\N	\N	\N
175	520	1	\N	\N	\N	\N	\N	\N
176	525	1	\N	\N	\N	\N	\N	\N
177	536	1	\N	\N	\N	\N	\N	\N
178	541	1	\N	\N	\N	\N	\N	\N
179	543	1	\N	\N	\N	\N	\N	\N
180	545	1	\N	\N	\N	\N	\N	\N
181	549	1	\N	\N	\N	\N	\N	\N
182	551	1	\N	\N	\N	\N	\N	\N
183	558	1	\N	\N	\N	\N	\N	\N
184	572	1	\N	\N	\N	\N	\N	\N
185	573	1	\N	\N	\N	\N	\N	\N
186	576	1	\N	\N	\N	\N	\N	\N
187	584	1	\N	\N	\N	\N	\N	\N
188	588	1	\N	\N	\N	\N	\N	\N
189	594	1	\N	\N	\N	\N	\N	\N
190	597	1	\N	\N	\N	\N	\N	\N
191	601	1	\N	\N	\N	\N	\N	\N
192	606	1	\N	\N	\N	\N	\N	\N
193	623	1	\N	\N	\N	\N	\N	\N
194	624	1	\N	\N	\N	\N	\N	\N
195	625	1	\N	\N	\N	\N	\N	\N
196	626	1	\N	\N	\N	\N	\N	\N
197	627	1	\N	\N	\N	\N	\N	\N
198	629	1	\N	\N	\N	\N	\N	\N
199	633	1	\N	\N	\N	\N	\N	\N
200	638	1	\N	\N	\N	\N	\N	\N
201	643	1	\N	\N	\N	\N	\N	\N
202	644	1	\N	\N	\N	\N	\N	\N
203	654	1	\N	\N	\N	\N	\N	\N
204	656	1	\N	\N	\N	\N	\N	\N
205	659	1	\N	\N	\N	\N	\N	\N
206	660	1	\N	\N	\N	\N	\N	\N
207	666	1	\N	\N	\N	\N	\N	\N
208	680	1	\N	\N	\N	\N	\N	\N
209	693	1	\N	\N	\N	\N	\N	\N
210	699	1	\N	\N	\N	\N	\N	\N
211	702	1	\N	\N	\N	\N	\N	\N
212	703	1	\N	\N	\N	\N	\N	\N
213	706	1	\N	\N	\N	\N	\N	\N
214	707	1	\N	\N	\N	\N	\N	\N
215	708	1	\N	\N	\N	\N	\N	\N
216	719	1	\N	\N	\N	\N	\N	\N
217	720	1	\N	\N	\N	\N	\N	\N
218	723	1	\N	\N	\N	\N	\N	\N
219	730	1	\N	\N	\N	\N	\N	\N
220	733	1	\N	\N	\N	\N	\N	\N
221	734	1	\N	\N	\N	\N	\N	\N
222	747	1	\N	\N	\N	\N	\N	\N
223	760	1	\N	\N	\N	\N	\N	\N
224	764	1	\N	\N	\N	\N	\N	\N
225	766	1	\N	\N	\N	\N	\N	\N
226	778	1	\N	\N	\N	\N	\N	\N
227	781	1	\N	\N	\N	\N	\N	\N
228	785	1	\N	\N	\N	\N	\N	\N
229	788	1	\N	\N	\N	\N	\N	\N
230	789	1	\N	\N	\N	\N	\N	\N
231	795	1	\N	\N	\N	\N	\N	\N
232	796	1	\N	\N	\N	\N	\N	\N
233	797	1	\N	\N	\N	\N	\N	\N
234	799	1	\N	\N	\N	\N	\N	\N
235	812	1	\N	\N	\N	\N	\N	\N
236	813	1	\N	\N	\N	\N	\N	\N
237	814	1	\N	\N	\N	\N	\N	\N
238	815	1	\N	\N	\N	\N	\N	\N
239	818	1	\N	\N	\N	\N	\N	\N
240	819	1	\N	\N	\N	\N	\N	\N
241	823	1	\N	\N	\N	\N	\N	\N
242	825	1	\N	\N	\N	\N	\N	\N
243	831	1	\N	\N	\N	\N	\N	\N
244	833	1	\N	\N	\N	\N	\N	\N
245	836	1	\N	\N	\N	\N	\N	\N
246	837	1	\N	\N	\N	\N	\N	\N
247	841	1	\N	\N	\N	\N	\N	\N
248	853	1	\N	\N	\N	\N	\N	\N
249	857	1	\N	\N	\N	\N	\N	\N
250	859	1	\N	\N	\N	\N	\N	\N
251	869	1	\N	\N	\N	\N	\N	\N
252	870	1	\N	\N	\N	\N	\N	\N
253	873	1	\N	\N	\N	\N	\N	\N
254	890	1	\N	\N	\N	\N	\N	\N
255	892	1	\N	\N	\N	\N	\N	\N
256	894	1	\N	\N	\N	\N	\N	\N
257	895	1	\N	\N	\N	\N	\N	\N
258	898	1	\N	\N	\N	\N	\N	\N
259	911	1	\N	\N	\N	\N	\N	\N
260	912	1	\N	\N	\N	\N	\N	\N
261	914	1	\N	\N	\N	\N	\N	\N
262	916	1	\N	\N	\N	\N	\N	\N
263	918	1	\N	\N	\N	\N	\N	\N
264	920	1	\N	\N	\N	\N	\N	\N
265	921	1	\N	\N	\N	\N	\N	\N
266	924	1	\N	\N	\N	\N	\N	\N
267	933	1	\N	\N	\N	\N	\N	\N
268	934	1	\N	\N	\N	\N	\N	\N
269	938	1	\N	\N	\N	\N	\N	\N
270	939	1	\N	\N	\N	\N	\N	\N
271	945	1	\N	\N	\N	\N	\N	\N
272	948	1	\N	\N	\N	\N	\N	\N
273	951	1	\N	\N	\N	\N	\N	\N
274	954	1	\N	\N	\N	\N	\N	\N
275	959	1	\N	\N	\N	\N	\N	\N
276	960	1	\N	\N	\N	\N	\N	\N
277	964	1	\N	\N	\N	\N	\N	\N
278	965	1	\N	\N	\N	\N	\N	\N
279	977	1	\N	\N	\N	\N	\N	\N
280	978	1	\N	\N	\N	\N	\N	\N
281	986	1	\N	\N	\N	\N	\N	\N
282	988	1	\N	\N	\N	\N	\N	\N
283	990	1	\N	\N	\N	\N	\N	\N
284	993	1	\N	\N	\N	\N	\N	\N
285	994	1	\N	\N	\N	\N	\N	\N
286	998	1	\N	\N	\N	\N	\N	\N
287	999	1	\N	\N	\N	\N	\N	\N
288	1002	1	\N	\N	\N	\N	\N	\N
289	1004	1	\N	\N	\N	\N	\N	\N
290	1008	1	\N	\N	\N	\N	\N	\N
291	1010	1	\N	\N	\N	\N	\N	\N
292	1019	1	\N	\N	\N	\N	\N	\N
293	1020	1	\N	\N	\N	\N	\N	\N
294	1022	1	\N	\N	\N	\N	\N	\N
295	1026	1	\N	\N	\N	\N	\N	\N
296	1027	1	\N	\N	\N	\N	\N	\N
297	1028	1	\N	\N	\N	\N	\N	\N
298	1032	1	\N	\N	\N	\N	\N	\N
299	1033	1	\N	\N	\N	\N	\N	\N
300	1035	1	\N	\N	\N	\N	\N	\N
301	1038	1	\N	\N	\N	\N	\N	\N
302	1042	1	\N	\N	\N	\N	\N	\N
303	1044	1	\N	\N	\N	\N	\N	\N
304	1050	1	\N	\N	\N	\N	\N	\N
305	1052	1	\N	\N	\N	\N	\N	\N
306	1053	1	\N	\N	\N	\N	\N	\N
307	1058	1	\N	\N	\N	\N	\N	\N
308	1063	1	\N	\N	\N	\N	\N	\N
309	1066	1	\N	\N	\N	\N	\N	\N
310	1069	1	\N	\N	\N	\N	\N	\N
311	1070	1	\N	\N	\N	\N	\N	\N
312	1082	1	\N	\N	\N	\N	\N	\N
313	1084	1	\N	\N	\N	\N	\N	\N
314	1085	1	\N	\N	\N	\N	\N	\N
315	1087	1	\N	\N	\N	\N	\N	\N
316	1089	1	\N	\N	\N	\N	\N	\N
317	1090	1	\N	\N	\N	\N	\N	\N
318	1093	1	\N	\N	\N	\N	\N	\N
319	1100	1	\N	\N	\N	\N	\N	\N
320	1104	1	\N	\N	\N	\N	\N	\N
321	1106	1	\N	\N	\N	\N	\N	\N
322	1107	1	\N	\N	\N	\N	\N	\N
323	1109	1	\N	\N	\N	\N	\N	\N
324	1110	1	\N	\N	\N	\N	\N	\N
325	1111	1	\N	\N	\N	\N	\N	\N
326	1113	1	\N	\N	\N	\N	\N	\N
327	1120	1	\N	\N	\N	\N	\N	\N
328	1123	1	\N	\N	\N	\N	\N	\N
329	1125	1	\N	\N	\N	\N	\N	\N
330	1135	1	\N	\N	\N	\N	\N	\N
331	1136	1	\N	\N	\N	\N	\N	\N
332	1141	1	\N	\N	\N	\N	\N	\N
333	1146	1	\N	\N	\N	\N	\N	\N
334	1147	1	\N	\N	\N	\N	\N	\N
335	1148	1	\N	\N	\N	\N	\N	\N
336	1153	1	\N	\N	\N	\N	\N	\N
337	1154	1	\N	\N	\N	\N	\N	\N
338	1155	1	\N	\N	\N	\N	\N	\N
339	1156	1	\N	\N	\N	\N	\N	\N
340	1159	1	\N	\N	\N	\N	\N	\N
341	1164	1	\N	\N	\N	\N	\N	\N
342	1165	1	\N	\N	\N	\N	\N	\N
343	1168	1	\N	\N	\N	\N	\N	\N
344	1169	1	\N	\N	\N	\N	\N	\N
345	1172	1	\N	\N	\N	\N	\N	\N
346	1175	1	\N	\N	\N	\N	\N	\N
347	1176	1	\N	\N	\N	\N	\N	\N
348	1182	1	\N	\N	\N	\N	\N	\N
349	1185	1	\N	\N	\N	\N	\N	\N
350	1191	1	\N	\N	\N	\N	\N	\N
351	1193	1	\N	\N	\N	\N	\N	\N
352	1194	1	\N	\N	\N	\N	\N	\N
353	1195	1	\N	\N	\N	\N	\N	\N
354	1198	1	\N	\N	\N	\N	\N	\N
355	1200	1	\N	\N	\N	\N	\N	\N
356	1206	1	\N	\N	\N	\N	\N	\N
357	1208	1	\N	\N	\N	\N	\N	\N
358	1209	1	\N	\N	\N	\N	\N	\N
359	1210	1	\N	\N	\N	\N	\N	\N
360	1212	1	\N	\N	\N	\N	\N	\N
361	1213	1	\N	\N	\N	\N	\N	\N
362	1214	1	\N	\N	\N	\N	\N	\N
363	1216	1	\N	\N	\N	\N	\N	\N
364	1218	1	\N	\N	\N	\N	\N	\N
365	1223	1	\N	\N	\N	\N	\N	\N
366	1226	1	\N	\N	\N	\N	\N	\N
367	1229	1	\N	\N	\N	\N	\N	\N
368	1230	1	\N	\N	\N	\N	\N	\N
369	1234	1	\N	\N	\N	\N	\N	\N
370	1238	1	\N	\N	\N	\N	\N	\N
371	1241	1	\N	\N	\N	\N	\N	\N
372	1244	1	\N	\N	\N	\N	\N	\N
373	1247	1	\N	\N	\N	\N	\N	\N
374	1248	1	\N	\N	\N	\N	\N	\N
375	1249	1	\N	\N	\N	\N	\N	\N
376	1250	1	\N	\N	\N	\N	\N	\N
377	1251	1	\N	\N	\N	\N	\N	\N
378	1252	1	\N	\N	\N	\N	\N	\N
379	1254	1	\N	\N	\N	\N	\N	\N
380	1256	1	\N	\N	\N	\N	\N	\N
381	1257	1	\N	\N	\N	\N	\N	\N
382	1259	1	\N	\N	\N	\N	\N	\N
383	1264	1	\N	\N	\N	\N	\N	\N
384	1266	1	\N	\N	\N	\N	\N	\N
385	1268	1	\N	\N	\N	\N	\N	\N
386	1269	1	\N	\N	\N	\N	\N	\N
387	1271	1	\N	\N	\N	\N	\N	\N
388	1274	1	\N	\N	\N	\N	\N	\N
389	1276	1	\N	\N	\N	\N	\N	\N
390	1279	1	\N	\N	\N	\N	\N	\N
391	1281	1	\N	\N	\N	\N	\N	\N
392	1282	1	\N	\N	\N	\N	\N	\N
393	1283	1	\N	\N	\N	\N	\N	\N
394	1284	1	\N	\N	\N	\N	\N	\N
395	1285	1	\N	\N	\N	\N	\N	\N
396	1286	1	\N	\N	\N	\N	\N	\N
397	1288	1	\N	\N	\N	\N	\N	\N
398	1291	1	\N	\N	\N	\N	\N	\N
399	1294	1	\N	\N	\N	\N	\N	\N
400	1297	1	\N	\N	\N	\N	\N	\N
401	1298	1	\N	\N	\N	\N	\N	\N
402	1299	1	\N	\N	\N	\N	\N	\N
403	1303	1	\N	\N	\N	\N	\N	\N
404	1304	1	\N	\N	\N	\N	\N	\N
405	1306	1	\N	\N	\N	\N	\N	\N
406	1308	1	\N	\N	\N	\N	\N	\N
407	1309	1	\N	\N	\N	\N	\N	\N
408	1312	1	\N	\N	\N	\N	\N	\N
409	1320	1	\N	\N	\N	\N	\N	\N
410	1321	1	\N	\N	\N	\N	\N	\N
411	1322	1	\N	\N	\N	\N	\N	\N
412	1323	1	\N	\N	\N	\N	\N	\N
413	1334	1	\N	\N	\N	\N	\N	\N
414	1336	1	\N	\N	\N	\N	\N	\N
415	1340	1	\N	\N	\N	\N	\N	\N
416	1341	1	\N	\N	\N	\N	\N	\N
417	1343	1	\N	\N	\N	\N	\N	\N
418	1348	1	\N	\N	\N	\N	\N	\N
419	1351	1	\N	\N	\N	\N	\N	\N
420	1352	1	\N	\N	\N	\N	\N	\N
421	1353	1	\N	\N	\N	\N	\N	\N
422	1358	1	\N	\N	\N	\N	\N	\N
423	1361	1	\N	\N	\N	\N	\N	\N
424	1367	1	\N	\N	\N	\N	\N	\N
425	1368	1	\N	\N	\N	\N	\N	\N
426	1371	1	\N	\N	\N	\N	\N	\N
427	1375	1	\N	\N	\N	\N	\N	\N
428	1376	1	\N	\N	\N	\N	\N	\N
429	1380	1	\N	\N	\N	\N	\N	\N
430	1381	1	\N	\N	\N	\N	\N	\N
431	1382	1	\N	\N	\N	\N	\N	\N
432	1387	1	\N	\N	\N	\N	\N	\N
433	1389	1	\N	\N	\N	\N	\N	\N
434	1390	1	\N	\N	\N	\N	\N	\N
435	1391	1	\N	\N	\N	\N	\N	\N
436	1392	1	\N	\N	\N	\N	\N	\N
437	1393	1	\N	\N	\N	\N	\N	\N
438	1395	1	\N	\N	\N	\N	\N	\N
439	1396	1	\N	\N	\N	\N	\N	\N
440	1397	1	\N	\N	\N	\N	\N	\N
441	1398	1	\N	\N	\N	\N	\N	\N
442	1399	1	\N	\N	\N	\N	\N	\N
443	1400	1	\N	\N	\N	\N	\N	\N
444	1403	1	\N	\N	\N	\N	\N	\N
445	1405	1	\N	\N	\N	\N	\N	\N
446	1408	1	\N	\N	\N	\N	\N	\N
447	1409	1	\N	\N	\N	\N	\N	\N
448	1414	1	\N	\N	\N	\N	\N	\N
449	1418	1	\N	\N	\N	\N	\N	\N
450	1420	1	\N	\N	\N	\N	\N	\N
451	1421	1	\N	\N	\N	\N	\N	\N
452	1423	1	\N	\N	\N	\N	\N	\N
453	1425	1	\N	\N	\N	\N	\N	\N
454	1429	1	\N	\N	\N	\N	\N	\N
455	1434	1	\N	\N	\N	\N	\N	\N
456	1435	1	\N	\N	\N	\N	\N	\N
457	1436	1	\N	\N	\N	\N	\N	\N
458	1437	1	\N	\N	\N	\N	\N	\N
459	1439	1	\N	\N	\N	\N	\N	\N
460	1442	1	\N	\N	\N	\N	\N	\N
461	1447	1	\N	\N	\N	\N	\N	\N
462	1448	1	\N	\N	\N	\N	\N	\N
463	1449	1	\N	\N	\N	\N	\N	\N
464	1454	1	\N	\N	\N	\N	\N	\N
465	1455	1	\N	\N	\N	\N	\N	\N
466	1456	1	\N	\N	\N	\N	\N	\N
467	1457	1	\N	\N	\N	\N	\N	\N
468	1459	1	\N	\N	\N	\N	\N	\N
469	1464	1	\N	\N	\N	\N	\N	\N
470	1465	1	\N	\N	\N	\N	\N	\N
471	1466	1	\N	\N	\N	\N	\N	\N
472	1468	1	\N	\N	\N	\N	\N	\N
473	1469	1	\N	\N	\N	\N	\N	\N
474	1472	1	\N	\N	\N	\N	\N	\N
475	1473	1	\N	\N	\N	\N	\N	\N
476	1474	1	\N	\N	\N	\N	\N	\N
477	1475	1	\N	\N	\N	\N	\N	\N
478	1478	1	\N	\N	\N	\N	\N	\N
479	1480	1	\N	\N	\N	\N	\N	\N
480	1481	1	\N	\N	\N	\N	\N	\N
481	1483	1	\N	\N	\N	\N	\N	\N
482	1485	1	\N	\N	\N	\N	\N	\N
483	1486	1	\N	\N	\N	\N	\N	\N
484	1487	1	\N	\N	\N	\N	\N	\N
485	1489	1	\N	\N	\N	\N	\N	\N
486	1492	1	\N	\N	\N	\N	\N	\N
487	1495	1	\N	\N	\N	\N	\N	\N
488	1496	1	\N	\N	\N	\N	\N	\N
489	1497	1	\N	\N	\N	\N	\N	\N
490	1500	1	\N	\N	\N	\N	\N	\N
491	1501	1	\N	\N	\N	\N	\N	\N
492	1503	1	\N	\N	\N	\N	\N	\N
493	1504	1	\N	\N	\N	\N	\N	\N
494	1505	1	\N	\N	\N	\N	\N	\N
495	1506	1	\N	\N	\N	\N	\N	\N
496	1507	1	\N	\N	\N	\N	\N	\N
497	1509	1	\N	\N	\N	\N	\N	\N
498	1510	1	\N	\N	\N	\N	\N	\N
499	1511	1	\N	\N	\N	\N	\N	\N
500	1513	1	\N	\N	\N	\N	\N	\N
501	1514	1	\N	\N	\N	\N	\N	\N
502	1515	1	\N	\N	\N	\N	\N	\N
503	1518	1	\N	\N	\N	\N	\N	\N
504	1520	1	\N	\N	\N	\N	\N	\N
505	1521	1	\N	\N	\N	\N	\N	\N
506	1522	1	\N	\N	\N	\N	\N	\N
507	1523	1	\N	\N	\N	\N	\N	\N
508	1524	1	\N	\N	\N	\N	\N	\N
509	1525	1	\N	\N	\N	\N	\N	\N
510	1526	1	\N	\N	\N	\N	\N	\N
511	1527	1	\N	\N	\N	\N	\N	\N
512	1528	1	\N	\N	\N	\N	\N	\N
513	1529	1	\N	\N	\N	\N	\N	\N
514	1531	1	\N	\N	\N	\N	\N	\N
515	1533	1	\N	\N	\N	\N	\N	\N
516	1534	1	\N	\N	\N	\N	\N	\N
517	1535	1	\N	\N	\N	\N	\N	\N
518	1539	1	\N	\N	\N	\N	\N	\N
519	1542	1	\N	\N	\N	\N	\N	\N
520	1546	1	\N	\N	\N	\N	\N	\N
521	1548	1	\N	\N	\N	\N	\N	\N
522	1550	1	\N	\N	\N	\N	\N	\N
523	1552	1	\N	\N	\N	\N	\N	\N
524	1554	1	\N	\N	\N	\N	\N	\N
525	1555	1	\N	\N	\N	\N	\N	\N
526	1556	1	\N	\N	\N	\N	\N	\N
527	1558	1	\N	\N	\N	\N	\N	\N
528	1559	1	\N	\N	\N	\N	\N	\N
529	1561	1	\N	\N	\N	\N	\N	\N
530	1562	1	\N	\N	\N	\N	\N	\N
531	1563	1	\N	\N	\N	\N	\N	\N
532	1565	1	\N	\N	\N	\N	\N	\N
533	1566	1	\N	\N	\N	\N	\N	\N
534	1567	1	\N	\N	\N	\N	\N	\N
535	1568	1	\N	\N	\N	\N	\N	\N
536	1570	1	\N	\N	\N	\N	\N	\N
537	1575	1	\N	\N	\N	\N	\N	\N
538	1576	1	\N	\N	\N	\N	\N	\N
539	1577	1	\N	\N	\N	\N	\N	\N
540	1578	1	\N	\N	\N	\N	\N	\N
541	1579	1	\N	\N	\N	\N	\N	\N
542	1581	1	\N	\N	\N	\N	\N	\N
543	1582	1	\N	\N	\N	\N	\N	\N
544	1586	1	\N	\N	\N	\N	\N	\N
545	1587	1	\N	\N	\N	\N	\N	\N
546	1588	1	\N	\N	\N	\N	\N	\N
547	1590	1	\N	\N	\N	\N	\N	\N
548	1592	1	\N	\N	\N	\N	\N	\N
549	1595	1	\N	\N	\N	\N	\N	\N
550	1596	1	\N	\N	\N	\N	\N	\N
551	1597	1	\N	\N	\N	\N	\N	\N
552	1598	1	\N	\N	\N	\N	\N	\N
553	1602	1	\N	\N	\N	\N	\N	\N
554	1603	1	\N	\N	\N	\N	\N	\N
555	1605	1	\N	\N	\N	\N	\N	\N
556	1606	1	\N	\N	\N	\N	\N	\N
557	1607	1	\N	\N	\N	\N	\N	\N
558	1608	1	\N	\N	\N	\N	\N	\N
559	1609	1	\N	\N	\N	\N	\N	\N
560	1611	1	\N	\N	\N	\N	\N	\N
561	1614	1	\N	\N	\N	\N	\N	\N
562	1616	1	\N	\N	\N	\N	\N	\N
563	1617	1	\N	\N	\N	\N	\N	\N
564	1618	1	\N	\N	\N	\N	\N	\N
565	1619	1	\N	\N	\N	\N	\N	\N
566	1623	1	\N	\N	\N	\N	\N	\N
567	1624	1	\N	\N	\N	\N	\N	\N
568	1625	1	\N	\N	\N	\N	\N	\N
569	1626	1	\N	\N	\N	\N	\N	\N
570	1628	1	\N	\N	\N	\N	\N	\N
571	1629	1	\N	\N	\N	\N	\N	\N
572	1630	1	\N	\N	\N	\N	\N	\N
573	1631	1	\N	\N	\N	\N	\N	\N
574	1632	1	\N	\N	\N	\N	\N	\N
575	1636	1	\N	\N	\N	\N	\N	\N
576	1637	1	\N	\N	\N	\N	\N	\N
577	1638	1	\N	\N	\N	\N	\N	\N
578	1640	1	\N	\N	\N	\N	\N	\N
579	1642	1	\N	\N	\N	\N	\N	\N
580	1643	1	\N	\N	\N	\N	\N	\N
581	1644	1	\N	\N	\N	\N	\N	\N
582	1647	1	\N	\N	\N	\N	\N	\N
583	1650	1	\N	\N	\N	\N	\N	\N
584	1651	1	\N	\N	\N	\N	\N	\N
585	1654	1	\N	\N	\N	\N	\N	\N
586	1657	1	\N	\N	\N	\N	\N	\N
587	1658	1	\N	\N	\N	\N	\N	\N
588	1659	1	\N	\N	\N	\N	\N	\N
589	1660	1	\N	\N	\N	\N	\N	\N
590	1662	1	\N	\N	\N	\N	\N	\N
591	1665	1	\N	\N	\N	\N	\N	\N
592	1669	1	\N	\N	\N	\N	\N	\N
593	1670	1	\N	\N	\N	\N	\N	\N
594	1671	1	\N	\N	\N	\N	\N	\N
595	1673	1	\N	\N	\N	\N	\N	\N
596	1674	1	\N	\N	\N	\N	\N	\N
597	1676	1	\N	\N	\N	\N	\N	\N
598	1677	1	\N	\N	\N	\N	\N	\N
599	1678	1	\N	\N	\N	\N	\N	\N
600	1679	1	\N	\N	\N	\N	\N	\N
601	1680	1	\N	\N	\N	\N	\N	\N
602	1681	1	\N	\N	\N	\N	\N	\N
603	1683	1	\N	\N	\N	\N	\N	\N
604	1684	1	\N	\N	\N	\N	\N	\N
605	1685	1	\N	\N	\N	\N	\N	\N
606	1686	1	\N	\N	\N	\N	\N	\N
607	1687	1	\N	\N	\N	\N	\N	\N
608	1688	1	\N	\N	\N	\N	\N	\N
609	1690	1	\N	\N	\N	\N	\N	\N
610	1691	1	\N	\N	\N	\N	\N	\N
611	1693	1	\N	\N	\N	\N	\N	\N
612	1694	1	\N	\N	\N	\N	\N	\N
613	1695	1	\N	\N	\N	\N	\N	\N
614	1697	1	\N	\N	\N	\N	\N	\N
615	1698	1	\N	\N	\N	\N	\N	\N
616	1699	1	\N	\N	\N	\N	\N	\N
617	1700	1	\N	\N	\N	\N	\N	\N
618	1702	1	\N	\N	\N	\N	\N	\N
619	1703	1	\N	\N	\N	\N	\N	\N
620	1704	1	\N	\N	\N	\N	\N	\N
621	1706	1	\N	\N	\N	\N	\N	\N
622	1707	1	\N	\N	\N	\N	\N	\N
623	1708	1	\N	\N	\N	\N	\N	\N
624	1709	1	\N	\N	\N	\N	\N	\N
625	1710	1	\N	\N	\N	\N	\N	\N
626	1711	1	\N	\N	\N	\N	\N	\N
627	1712	1	\N	\N	\N	\N	\N	\N
628	1714	1	\N	\N	\N	\N	\N	\N
629	1715	1	\N	\N	\N	\N	\N	\N
630	1716	1	\N	\N	\N	\N	\N	\N
631	1717	1	\N	\N	\N	\N	\N	\N
632	1719	1	\N	\N	\N	\N	\N	\N
633	1720	1	\N	\N	\N	\N	\N	\N
634	1721	1	\N	\N	\N	\N	\N	\N
635	1722	1	\N	\N	\N	\N	\N	\N
636	1723	1	\N	\N	\N	\N	\N	\N
637	1724	1	\N	\N	\N	\N	\N	\N
638	1726	1	\N	\N	\N	\N	\N	\N
639	1727	1	\N	\N	\N	\N	\N	\N
640	1728	1	\N	\N	\N	\N	\N	\N
641	1729	1	\N	\N	\N	\N	\N	\N
642	1731	1	\N	\N	\N	\N	\N	\N
643	1732	1	\N	\N	\N	\N	\N	\N
644	1733	1	\N	\N	\N	\N	\N	\N
645	1736	1	\N	\N	\N	\N	\N	\N
646	1737	1	\N	\N	\N	\N	\N	\N
647	1738	1	\N	\N	\N	\N	\N	\N
648	1739	1	\N	\N	\N	\N	\N	\N
649	1741	1	\N	\N	\N	\N	\N	\N
650	1742	1	\N	\N	\N	\N	\N	\N
651	1743	1	\N	\N	\N	\N	\N	\N
652	1745	1	\N	\N	\N	\N	\N	\N
653	1746	1	\N	\N	\N	\N	\N	\N
654	1747	1	\N	\N	\N	\N	\N	\N
655	1748	1	\N	\N	\N	\N	\N	\N
656	1750	1	\N	\N	\N	\N	\N	\N
657	1752	1	\N	\N	\N	\N	\N	\N
658	1753	1	\N	\N	\N	\N	\N	\N
659	1754	1	\N	\N	\N	\N	\N	\N
660	1755	1	\N	\N	\N	\N	\N	\N
661	1757	1	\N	\N	\N	\N	\N	\N
662	1758	1	\N	\N	\N	\N	\N	\N
663	1759	1	\N	\N	\N	\N	\N	\N
664	1760	1	\N	\N	\N	\N	\N	\N
665	1762	1	\N	\N	\N	\N	\N	\N
666	1763	1	\N	\N	\N	\N	\N	\N
667	1765	1	\N	\N	\N	\N	\N	\N
668	1767	1	\N	\N	\N	\N	\N	\N
669	1768	1	\N	\N	\N	\N	\N	\N
670	1769	1	\N	\N	\N	\N	\N	\N
671	1771	1	\N	\N	\N	\N	\N	\N
672	1772	1	\N	\N	\N	\N	\N	\N
673	1773	1	\N	\N	\N	\N	\N	\N
674	1774	1	\N	\N	\N	\N	\N	\N
675	1775	1	\N	\N	\N	\N	\N	\N
676	1776	1	\N	\N	\N	\N	\N	\N
677	1777	1	\N	\N	\N	\N	\N	\N
678	1778	1	\N	\N	\N	\N	\N	\N
679	1779	1	\N	\N	\N	\N	\N	\N
680	1781	1	\N	\N	\N	\N	\N	\N
681	1782	1	\N	\N	\N	\N	\N	\N
682	1783	1	\N	\N	\N	\N	\N	\N
683	1784	1	\N	\N	\N	\N	\N	\N
684	1785	1	\N	\N	\N	\N	\N	\N
685	1786	1	\N	\N	\N	\N	\N	\N
686	1787	1	\N	\N	\N	\N	\N	\N
687	1788	1	\N	\N	\N	\N	\N	\N
688	1789	1	\N	\N	\N	\N	\N	\N
689	1790	1	\N	\N	\N	\N	\N	\N
690	1792	1	\N	\N	\N	\N	\N	\N
691	1793	1	\N	\N	\N	\N	\N	\N
692	1795	1	\N	\N	\N	\N	\N	\N
693	1797	1	\N	\N	\N	\N	\N	\N
694	1798	1	\N	\N	\N	\N	\N	\N
695	1799	1	\N	\N	\N	\N	\N	\N
696	1801	1	\N	\N	\N	\N	\N	\N
697	1803	1	\N	\N	\N	\N	\N	\N
698	1805	1	\N	\N	\N	\N	\N	\N
699	1807	1	\N	\N	\N	\N	\N	\N
700	1808	1	\N	\N	\N	\N	\N	\N
701	1809	1	\N	\N	\N	\N	\N	\N
702	1810	1	\N	\N	\N	\N	\N	\N
703	1811	1	\N	\N	\N	\N	\N	\N
704	1812	1	\N	\N	\N	\N	\N	\N
705	1814	1	\N	\N	\N	\N	\N	\N
706	1815	1	\N	\N	\N	\N	\N	\N
707	1816	1	\N	\N	\N	\N	\N	\N
708	1817	1	\N	\N	\N	\N	\N	\N
709	1818	1	\N	\N	\N	\N	\N	\N
710	1819	1	\N	\N	\N	\N	\N	\N
711	1824	1	\N	\N	\N	\N	\N	\N
712	1825	1	\N	\N	\N	\N	\N	\N
713	1826	1	\N	\N	\N	\N	\N	\N
714	1828	1	\N	\N	\N	\N	\N	\N
715	1830	1	\N	\N	\N	\N	\N	\N
716	1831	1	\N	\N	\N	\N	\N	\N
717	1832	1	\N	\N	\N	\N	\N	\N
718	1833	1	\N	\N	\N	\N	\N	\N
719	1834	1	\N	\N	\N	\N	\N	\N
720	1835	1	\N	\N	\N	\N	\N	\N
721	1836	1	\N	\N	\N	\N	\N	\N
722	1837	1	\N	\N	\N	\N	\N	\N
723	1838	1	\N	\N	\N	\N	\N	\N
724	1839	1	\N	\N	\N	\N	\N	\N
725	1840	1	\N	\N	\N	\N	\N	\N
726	1841	1	\N	\N	\N	\N	\N	\N
727	1842	1	\N	\N	\N	\N	\N	\N
728	1843	1	\N	\N	\N	\N	\N	\N
729	1845	1	\N	\N	\N	\N	\N	\N
730	1846	1	\N	\N	\N	\N	\N	\N
731	1847	1	\N	\N	\N	\N	\N	\N
732	1848	1	\N	\N	\N	\N	\N	\N
733	1849	1	\N	\N	\N	\N	\N	\N
734	1850	1	\N	\N	\N	\N	\N	\N
735	1851	1	\N	\N	\N	\N	\N	\N
736	1852	1	\N	\N	\N	\N	\N	\N
737	1853	1	\N	\N	\N	\N	\N	\N
738	1856	1	\N	\N	\N	\N	\N	\N
739	1857	1	\N	\N	\N	\N	\N	\N
740	1861	1	\N	\N	\N	\N	\N	\N
741	1863	1	\N	\N	\N	\N	\N	\N
742	1864	1	\N	\N	\N	\N	\N	\N
743	1865	1	\N	\N	\N	\N	\N	\N
744	1866	1	\N	\N	\N	\N	\N	\N
745	1869	1	\N	\N	\N	\N	\N	\N
746	1871	1	\N	\N	\N	\N	\N	\N
747	1872	1	\N	\N	\N	\N	\N	\N
748	1873	1	\N	\N	\N	\N	\N	\N
749	1876	1	\N	\N	\N	\N	\N	\N
750	1877	1	\N	\N	\N	\N	\N	\N
751	1878	1	\N	\N	\N	\N	\N	\N
752	1881	1	\N	\N	\N	\N	\N	\N
753	1882	1	\N	\N	\N	\N	\N	\N
754	1883	1	\N	\N	\N	\N	\N	\N
755	1884	1	\N	\N	\N	\N	\N	\N
756	1885	1	\N	\N	\N	\N	\N	\N
757	1886	1	\N	\N	\N	\N	\N	\N
758	1887	1	\N	\N	\N	\N	\N	\N
759	1888	1	\N	\N	\N	\N	\N	\N
760	1889	1	\N	\N	\N	\N	\N	\N
761	1890	1	\N	\N	\N	\N	\N	\N
762	1894	1	\N	\N	\N	\N	\N	\N
763	1896	1	\N	\N	\N	\N	\N	\N
764	1897	1	\N	\N	\N	\N	\N	\N
765	1898	1	\N	\N	\N	\N	\N	\N
766	1899	1	\N	\N	\N	\N	\N	\N
767	1900	1	\N	\N	\N	\N	\N	\N
768	1902	1	\N	\N	\N	\N	\N	\N
769	1903	1	\N	\N	\N	\N	\N	\N
770	1904	1	\N	\N	\N	\N	\N	\N
771	1905	1	\N	\N	\N	\N	\N	\N
772	1907	1	\N	\N	\N	\N	\N	\N
773	1908	1	\N	\N	\N	\N	\N	\N
774	1910	1	\N	\N	\N	\N	\N	\N
775	1912	1	\N	\N	\N	\N	\N	\N
776	1913	1	\N	\N	\N	\N	\N	\N
777	1915	1	\N	\N	\N	\N	\N	\N
778	1916	1	\N	\N	\N	\N	\N	\N
779	1917	1	\N	\N	\N	\N	\N	\N
780	1918	1	\N	\N	\N	\N	\N	\N
781	1920	1	\N	\N	\N	\N	\N	\N
782	1921	1	\N	\N	\N	\N	\N	\N
783	1922	1	\N	\N	\N	\N	\N	\N
784	1923	1	\N	\N	\N	\N	\N	\N
785	1925	1	\N	\N	\N	\N	\N	\N
786	1926	1	\N	\N	\N	\N	\N	\N
787	1927	1	\N	\N	\N	\N	\N	\N
788	1930	1	\N	\N	\N	\N	\N	\N
789	1931	1	\N	\N	\N	\N	\N	\N
790	1933	1	\N	\N	\N	\N	\N	\N
791	1934	1	\N	\N	\N	\N	\N	\N
792	1935	1	\N	\N	\N	\N	\N	\N
793	1937	1	\N	\N	\N	\N	\N	\N
794	1938	1	\N	\N	\N	\N	\N	\N
795	1942	1	\N	\N	\N	\N	\N	\N
796	1943	1	\N	\N	\N	\N	\N	\N
797	1945	1	\N	\N	\N	\N	\N	\N
798	1946	1	\N	\N	\N	\N	\N	\N
799	1947	1	\N	\N	\N	\N	\N	\N
800	1948	1	\N	\N	\N	\N	\N	\N
801	1949	1	\N	\N	\N	\N	\N	\N
802	1950	1	\N	\N	\N	\N	\N	\N
803	1951	1	\N	\N	\N	\N	\N	\N
804	1952	1	\N	\N	\N	\N	\N	\N
805	1954	1	\N	\N	\N	\N	\N	\N
806	1955	1	\N	\N	\N	\N	\N	\N
807	1956	1	\N	\N	\N	\N	\N	\N
808	1958	1	\N	\N	\N	\N	\N	\N
809	1959	1	\N	\N	\N	\N	\N	\N
810	1961	1	\N	\N	\N	\N	\N	\N
811	1962	1	\N	\N	\N	\N	\N	\N
812	1963	1	\N	\N	\N	\N	\N	\N
813	1964	1	\N	\N	\N	\N	\N	\N
814	1965	1	\N	\N	\N	\N	\N	\N
815	1966	1	\N	\N	\N	\N	\N	\N
816	1967	1	\N	\N	\N	\N	\N	\N
817	1968	1	\N	\N	\N	\N	\N	\N
818	1969	1	\N	\N	\N	\N	\N	\N
819	1970	1	\N	\N	\N	\N	\N	\N
820	1971	1	\N	\N	\N	\N	\N	\N
821	1973	1	\N	\N	\N	\N	\N	\N
822	1974	1	\N	\N	\N	\N	\N	\N
823	1975	1	\N	\N	\N	\N	\N	\N
824	1976	1	\N	\N	\N	\N	\N	\N
825	1979	1	\N	\N	\N	\N	\N	\N
826	1980	1	\N	\N	\N	\N	\N	\N
827	1981	1	\N	\N	\N	\N	\N	\N
828	1982	1	\N	\N	\N	\N	\N	\N
829	1983	1	\N	\N	\N	\N	\N	\N
830	1984	1	\N	\N	\N	\N	\N	\N
831	1985	1	\N	\N	\N	\N	\N	\N
832	1986	1	\N	\N	\N	\N	\N	\N
833	1987	1	\N	\N	\N	\N	\N	\N
834	1988	1	\N	\N	\N	\N	\N	\N
835	1989	1	\N	\N	\N	\N	\N	\N
836	1990	1	\N	\N	\N	\N	\N	\N
837	1991	1	\N	\N	\N	\N	\N	\N
838	1993	1	\N	\N	\N	\N	\N	\N
839	1994	1	\N	\N	\N	\N	\N	\N
840	1995	1	\N	\N	\N	\N	\N	\N
841	1996	1	\N	\N	\N	\N	\N	\N
842	1998	1	\N	\N	\N	\N	\N	\N
843	1999	1	\N	\N	\N	\N	\N	\N
844	2000	1	\N	\N	\N	\N	\N	\N
845	2001	1	\N	\N	\N	\N	\N	\N
846	2002	1	\N	\N	\N	\N	\N	\N
847	2004	1	\N	\N	\N	\N	\N	\N
848	2005	1	\N	\N	\N	\N	\N	\N
849	2006	1	\N	\N	\N	\N	\N	\N
850	2007	1	\N	\N	\N	\N	\N	\N
851	2008	1	\N	\N	\N	\N	\N	\N
852	2009	1	\N	\N	\N	\N	\N	\N
853	2010	1	\N	\N	\N	\N	\N	\N
854	2011	1	\N	\N	\N	\N	\N	\N
855	2012	1	\N	\N	\N	\N	\N	\N
856	2013	1	\N	\N	\N	\N	\N	\N
857	2015	1	\N	\N	\N	\N	\N	\N
858	2017	1	\N	\N	\N	\N	\N	\N
859	2018	1	\N	\N	\N	\N	\N	\N
860	2019	1	\N	\N	\N	\N	\N	\N
861	2021	1	\N	\N	\N	\N	\N	\N
862	2022	1	\N	\N	\N	\N	\N	\N
863	2024	1	\N	\N	\N	\N	\N	\N
864	2025	1	\N	\N	\N	\N	\N	\N
865	2026	1	\N	\N	\N	\N	\N	\N
866	2027	1	\N	\N	\N	\N	\N	\N
867	2029	1	\N	\N	\N	\N	\N	\N
868	2030	1	\N	\N	\N	\N	\N	\N
869	2031	1	\N	\N	\N	\N	\N	\N
870	2032	1	\N	\N	\N	\N	\N	\N
871	2033	1	\N	\N	\N	\N	\N	\N
872	2034	1	\N	\N	\N	\N	\N	\N
873	2036	1	\N	\N	\N	\N	\N	\N
874	2037	1	\N	\N	\N	\N	\N	\N
875	2038	1	\N	\N	\N	\N	\N	\N
876	2039	1	\N	\N	\N	\N	\N	\N
877	2040	1	\N	\N	\N	\N	\N	\N
878	2041	1	\N	\N	\N	\N	\N	\N
879	2042	1	\N	\N	\N	\N	\N	\N
880	2043	1	\N	\N	\N	\N	\N	\N
881	2044	1	\N	\N	\N	\N	\N	\N
882	2045	1	\N	\N	\N	\N	\N	\N
883	2046	1	\N	\N	\N	\N	\N	\N
884	2047	1	\N	\N	\N	\N	\N	\N
885	2048	1	\N	\N	\N	\N	\N	\N
886	2049	1	\N	\N	\N	\N	\N	\N
887	2050	1	\N	\N	\N	\N	\N	\N
888	2051	1	\N	\N	\N	\N	\N	\N
889	2053	1	\N	\N	\N	\N	\N	\N
890	2054	1	\N	\N	\N	\N	\N	\N
891	2055	1	\N	\N	\N	\N	\N	\N
892	2056	1	\N	\N	\N	\N	\N	\N
893	2057	1	\N	\N	\N	\N	\N	\N
894	2058	1	\N	\N	\N	\N	\N	\N
895	2059	1	\N	\N	\N	\N	\N	\N
896	2060	1	\N	\N	\N	\N	\N	\N
897	2061	1	\N	\N	\N	\N	\N	\N
898	2062	1	\N	\N	\N	\N	\N	\N
899	2063	1	\N	\N	\N	\N	\N	\N
900	2064	1	\N	\N	\N	\N	\N	\N
901	2065	1	\N	\N	\N	\N	\N	\N
902	2066	1	\N	\N	\N	\N	\N	\N
903	2067	1	\N	\N	\N	\N	\N	\N
904	2069	1	\N	\N	\N	\N	\N	\N
905	2070	1	\N	\N	\N	\N	\N	\N
906	2071	1	\N	\N	\N	\N	\N	\N
907	2072	1	\N	\N	\N	\N	\N	\N
908	2074	1	\N	\N	\N	\N	\N	\N
909	2076	1	\N	\N	\N	\N	\N	\N
910	2077	1	\N	\N	\N	\N	\N	\N
911	2078	1	\N	\N	\N	\N	\N	\N
912	2079	1	\N	\N	\N	\N	\N	\N
913	2080	1	\N	\N	\N	\N	\N	\N
914	2081	1	\N	\N	\N	\N	\N	\N
915	2082	1	\N	\N	\N	\N	\N	\N
916	2083	1	\N	\N	\N	\N	\N	\N
917	2087	1	\N	\N	\N	\N	\N	\N
918	2088	1	\N	\N	\N	\N	\N	\N
919	2089	1	\N	\N	\N	\N	\N	\N
920	2090	1	\N	\N	\N	\N	\N	\N
921	2091	1	\N	\N	\N	\N	\N	\N
922	2092	1	\N	\N	\N	\N	\N	\N
923	2093	1	\N	\N	\N	\N	\N	\N
924	2094	1	\N	\N	\N	\N	\N	\N
925	2095	1	\N	\N	\N	\N	\N	\N
926	2096	1	\N	\N	\N	\N	\N	\N
927	2098	1	\N	\N	\N	\N	\N	\N
928	2099	1	\N	\N	\N	\N	\N	\N
929	2100	1	\N	\N	\N	\N	\N	\N
930	2101	1	\N	\N	\N	\N	\N	\N
931	2103	1	\N	\N	\N	\N	\N	\N
932	2104	1	\N	\N	\N	\N	\N	\N
933	2105	1	\N	\N	\N	\N	\N	\N
934	2106	1	\N	\N	\N	\N	\N	\N
935	2107	1	\N	\N	\N	\N	\N	\N
936	2109	1	\N	\N	\N	\N	\N	\N
937	2110	1	\N	\N	\N	\N	\N	\N
938	2112	1	\N	\N	\N	\N	\N	\N
939	2114	1	\N	\N	\N	\N	\N	\N
940	2115	1	\N	\N	\N	\N	\N	\N
941	2117	1	\N	\N	\N	\N	\N	\N
942	2118	1	\N	\N	\N	\N	\N	\N
943	2119	1	\N	\N	\N	\N	\N	\N
944	2120	1	\N	\N	\N	\N	\N	\N
945	2122	1	\N	\N	\N	\N	\N	\N
946	2123	1	\N	\N	\N	\N	\N	\N
947	2124	1	\N	\N	\N	\N	\N	\N
948	2125	1	\N	\N	\N	\N	\N	\N
949	2126	1	\N	\N	\N	\N	\N	\N
950	2127	1	\N	\N	\N	\N	\N	\N
951	2129	1	\N	\N	\N	\N	\N	\N
952	2130	1	\N	\N	\N	\N	\N	\N
953	2132	1	\N	\N	\N	\N	\N	\N
954	2134	1	\N	\N	\N	\N	\N	\N
955	2135	1	\N	\N	\N	\N	\N	\N
956	2136	1	\N	\N	\N	\N	\N	\N
957	2137	1	\N	\N	\N	\N	\N	\N
958	2138	1	\N	\N	\N	\N	\N	\N
959	2139	1	\N	\N	\N	\N	\N	\N
960	2142	1	\N	\N	\N	\N	\N	\N
961	2143	1	\N	\N	\N	\N	\N	\N
962	2144	1	\N	\N	\N	\N	\N	\N
963	2146	1	\N	\N	\N	\N	\N	\N
964	2147	1	\N	\N	\N	\N	\N	\N
965	2148	1	\N	\N	\N	\N	\N	\N
966	2149	1	\N	\N	\N	\N	\N	\N
967	2150	1	\N	\N	\N	\N	\N	\N
968	2151	1	\N	\N	\N	\N	\N	\N
969	2152	1	\N	\N	\N	\N	\N	\N
970	2153	1	\N	\N	\N	\N	\N	\N
971	2157	1	\N	\N	\N	\N	\N	\N
972	2158	1	\N	\N	\N	\N	\N	\N
973	2159	1	\N	\N	\N	\N	\N	\N
974	2160	1	\N	\N	\N	\N	\N	\N
975	2161	1	\N	\N	\N	\N	\N	\N
976	2162	1	\N	\N	\N	\N	\N	\N
977	2163	1	\N	\N	\N	\N	\N	\N
978	2165	1	\N	\N	\N	\N	\N	\N
979	2166	1	\N	\N	\N	\N	\N	\N
980	2167	1	\N	\N	\N	\N	\N	\N
981	2168	1	\N	\N	\N	\N	\N	\N
982	2170	1	\N	\N	\N	\N	\N	\N
983	2171	1	\N	\N	\N	\N	\N	\N
984	2172	1	\N	\N	\N	\N	\N	\N
985	2173	1	\N	\N	\N	\N	\N	\N
986	2174	1	\N	\N	\N	\N	\N	\N
987	2175	1	\N	\N	\N	\N	\N	\N
988	2176	1	\N	\N	\N	\N	\N	\N
989	2177	1	\N	\N	\N	\N	\N	\N
990	2178	1	\N	\N	\N	\N	\N	\N
991	2179	1	\N	\N	\N	\N	\N	\N
992	2180	1	\N	\N	\N	\N	\N	\N
993	2181	1	\N	\N	\N	\N	\N	\N
994	2182	1	\N	\N	\N	\N	\N	\N
995	2183	1	\N	\N	\N	\N	\N	\N
996	2184	1	\N	\N	\N	\N	\N	\N
997	2185	1	\N	\N	\N	\N	\N	\N
998	2187	1	\N	\N	\N	\N	\N	\N
999	2189	1	\N	\N	\N	\N	\N	\N
1000	2190	1	\N	\N	\N	\N	\N	\N
1001	2191	1	\N	\N	\N	\N	\N	\N
1002	2192	1	\N	\N	\N	\N	\N	\N
1003	2193	1	\N	\N	\N	\N	\N	\N
1004	2194	1	\N	\N	\N	\N	\N	\N
1005	2196	1	\N	\N	\N	\N	\N	\N
1006	2198	1	\N	\N	\N	\N	\N	\N
1007	2199	1	\N	\N	\N	\N	\N	\N
1008	2200	1	\N	\N	\N	\N	\N	\N
1009	2201	1	\N	\N	\N	\N	\N	\N
1010	2202	1	\N	\N	\N	\N	\N	\N
1011	2204	1	\N	\N	\N	\N	\N	\N
1012	2205	1	\N	\N	\N	\N	\N	\N
1013	2207	1	\N	\N	\N	\N	\N	\N
1014	2208	1	\N	\N	\N	\N	\N	\N
1015	2209	1	\N	\N	\N	\N	\N	\N
1016	2211	1	\N	\N	\N	\N	\N	\N
1017	2212	1	\N	\N	\N	\N	\N	\N
1018	2213	1	\N	\N	\N	\N	\N	\N
1019	2214	1	\N	\N	\N	\N	\N	\N
1020	2215	1	\N	\N	\N	\N	\N	\N
1021	2217	1	\N	\N	\N	\N	\N	\N
1022	2218	1	\N	\N	\N	\N	\N	\N
1023	2219	1	\N	\N	\N	\N	\N	\N
1024	2221	1	\N	\N	\N	\N	\N	\N
1025	2222	1	\N	\N	\N	\N	\N	\N
1026	2223	1	\N	\N	\N	\N	\N	\N
1027	2224	1	\N	\N	\N	\N	\N	\N
1028	2225	1	\N	\N	\N	\N	\N	\N
1029	2228	1	\N	\N	\N	\N	\N	\N
1030	2229	1	\N	\N	\N	\N	\N	\N
1031	2230	1	\N	\N	\N	\N	\N	\N
1032	2231	1	\N	\N	\N	\N	\N	\N
1033	2232	1	\N	\N	\N	\N	\N	\N
1034	2235	1	\N	\N	\N	\N	\N	\N
1035	2236	1	\N	\N	\N	\N	\N	\N
1036	2237	1	\N	\N	\N	\N	\N	\N
1037	2239	1	\N	\N	\N	\N	\N	\N
1038	2240	1	\N	\N	\N	\N	\N	\N
1039	2241	1	\N	\N	\N	\N	\N	\N
1040	2242	1	\N	\N	\N	\N	\N	\N
1041	2243	1	\N	\N	\N	\N	\N	\N
1042	2244	1	\N	\N	\N	\N	\N	\N
1043	2245	1	\N	\N	\N	\N	\N	\N
1044	2246	1	\N	\N	\N	\N	\N	\N
1045	2247	1	\N	\N	\N	\N	\N	\N
1046	2248	1	\N	\N	\N	\N	\N	\N
1047	2249	1	\N	\N	\N	\N	\N	\N
1048	2250	1	\N	\N	\N	\N	\N	\N
1049	2251	1	\N	\N	\N	\N	\N	\N
1050	2253	1	\N	\N	\N	\N	\N	\N
1051	2255	1	\N	\N	\N	\N	\N	\N
1052	2256	1	\N	\N	\N	\N	\N	\N
1053	2257	1	\N	\N	\N	\N	\N	\N
1054	2258	1	\N	\N	\N	\N	\N	\N
1055	2259	1	\N	\N	\N	\N	\N	\N
1056	2260	1	\N	\N	\N	\N	\N	\N
1057	2261	1	\N	\N	\N	\N	\N	\N
1058	2262	1	\N	\N	\N	\N	\N	\N
1059	2263	1	\N	\N	\N	\N	\N	\N
1060	2264	1	\N	\N	\N	\N	\N	\N
1061	2265	1	\N	\N	\N	\N	\N	\N
1062	2266	1	\N	\N	\N	\N	\N	\N
1063	2267	1	\N	\N	\N	\N	\N	\N
1064	2268	1	\N	\N	\N	\N	\N	\N
1065	2269	1	\N	\N	\N	\N	\N	\N
1066	2270	1	\N	\N	\N	\N	\N	\N
1067	2271	1	\N	\N	\N	\N	\N	\N
1068	2272	1	\N	\N	\N	\N	\N	\N
1069	2273	1	\N	\N	\N	\N	\N	\N
1070	2274	1	\N	\N	\N	\N	\N	\N
1071	2275	1	\N	\N	\N	\N	\N	\N
1072	2276	1	\N	\N	\N	\N	\N	\N
1073	2277	1	\N	\N	\N	\N	\N	\N
1074	2278	1	\N	\N	\N	\N	\N	\N
1075	2279	1	\N	\N	\N	\N	\N	\N
1076	2280	1	\N	\N	\N	\N	\N	\N
1077	2281	1	\N	\N	\N	\N	\N	\N
1078	2282	1	\N	\N	\N	\N	\N	\N
1079	2283	1	\N	\N	\N	\N	\N	\N
1080	2284	1	\N	\N	\N	\N	\N	\N
1081	2285	1	\N	\N	\N	\N	\N	\N
1082	2286	1	\N	\N	\N	\N	\N	\N
1083	2287	1	\N	\N	\N	\N	\N	\N
1084	2288	1	\N	\N	\N	\N	\N	\N
1085	2289	1	\N	\N	\N	\N	\N	\N
1086	2290	1	\N	\N	\N	\N	\N	\N
1087	2291	1	\N	\N	\N	\N	\N	\N
1088	2293	1	\N	\N	\N	\N	\N	\N
1089	2295	1	\N	\N	\N	\N	\N	\N
1090	2296	1	\N	\N	\N	\N	\N	\N
1091	2297	1	\N	\N	\N	\N	\N	\N
1092	2298	1	\N	\N	\N	\N	\N	\N
1093	2299	1	\N	\N	\N	\N	\N	\N
1094	2300	1	\N	\N	\N	\N	\N	\N
1095	2303	1	\N	\N	\N	\N	\N	\N
1096	2304	1	\N	\N	\N	\N	\N	\N
1097	2305	1	\N	\N	\N	\N	\N	\N
1098	2306	1	\N	\N	\N	\N	\N	\N
1099	2307	1	\N	\N	\N	\N	\N	\N
1100	2308	1	\N	\N	\N	\N	\N	\N
1101	2309	1	\N	\N	\N	\N	\N	\N
1102	2310	1	\N	\N	\N	\N	\N	\N
1103	2311	1	\N	\N	\N	\N	\N	\N
1104	2312	1	\N	\N	\N	\N	\N	\N
1105	2313	1	\N	\N	\N	\N	\N	\N
1106	2314	1	\N	\N	\N	\N	\N	\N
1107	2315	1	\N	\N	\N	\N	\N	\N
1108	2316	1	\N	\N	\N	\N	\N	\N
1109	2317	1	\N	\N	\N	\N	\N	\N
1110	2318	1	\N	\N	\N	\N	\N	\N
1111	2320	1	\N	\N	\N	\N	\N	\N
1112	2321	1	\N	\N	\N	\N	\N	\N
1113	2323	1	\N	\N	\N	\N	\N	\N
1114	2324	1	\N	\N	\N	\N	\N	\N
1115	2325	1	\N	\N	\N	\N	\N	\N
1116	2327	1	\N	\N	\N	\N	\N	\N
1117	2329	1	\N	\N	\N	\N	\N	\N
1118	2330	1	\N	\N	\N	\N	\N	\N
1119	2331	1	\N	\N	\N	\N	\N	\N
1120	2332	1	\N	\N	\N	\N	\N	\N
1121	2333	1	\N	\N	\N	\N	\N	\N
1122	2334	1	\N	\N	\N	\N	\N	\N
1123	2335	1	\N	\N	\N	\N	\N	\N
1124	2336	1	\N	\N	\N	\N	\N	\N
1125	2337	1	\N	\N	\N	\N	\N	\N
1126	2338	1	\N	\N	\N	\N	\N	\N
1127	2340	1	\N	\N	\N	\N	\N	\N
1128	2341	1	\N	\N	\N	\N	\N	\N
1129	2342	1	\N	\N	\N	\N	\N	\N
1130	2343	1	\N	\N	\N	\N	\N	\N
1131	2344	1	\N	\N	\N	\N	\N	\N
1132	2345	1	\N	\N	\N	\N	\N	\N
1133	2346	1	\N	\N	\N	\N	\N	\N
1134	2347	1	\N	\N	\N	\N	\N	\N
1135	2348	1	\N	\N	\N	\N	\N	\N
1136	2349	1	\N	\N	\N	\N	\N	\N
1137	2350	1	\N	\N	\N	\N	\N	\N
1138	2351	1	\N	\N	\N	\N	\N	\N
1139	2352	1	\N	\N	\N	\N	\N	\N
1140	2353	1	\N	\N	\N	\N	\N	\N
1141	2354	1	\N	\N	\N	\N	\N	\N
1142	2355	1	\N	\N	\N	\N	\N	\N
1143	2356	1	\N	\N	\N	\N	\N	\N
1144	2357	1	\N	\N	\N	\N	\N	\N
1145	2358	1	\N	\N	\N	\N	\N	\N
1146	2359	1	\N	\N	\N	\N	\N	\N
1147	2360	1	\N	\N	\N	\N	\N	\N
1148	2361	1	\N	\N	\N	\N	\N	\N
1149	2362	1	\N	\N	\N	\N	\N	\N
1150	2363	1	\N	\N	\N	\N	\N	\N
1151	2364	1	\N	\N	\N	\N	\N	\N
1152	2366	1	\N	\N	\N	\N	\N	\N
1153	2367	1	\N	\N	\N	\N	\N	\N
1154	2368	1	\N	\N	\N	\N	\N	\N
1155	2369	1	\N	\N	\N	\N	\N	\N
1156	2370	1	\N	\N	\N	\N	\N	\N
1157	2371	1	\N	\N	\N	\N	\N	\N
1158	2372	1	\N	\N	\N	\N	\N	\N
1159	2373	1	\N	\N	\N	\N	\N	\N
1160	2374	1	\N	\N	\N	\N	\N	\N
1161	2375	1	\N	\N	\N	\N	\N	\N
1162	2376	1	\N	\N	\N	\N	\N	\N
1163	2377	1	\N	\N	\N	\N	\N	\N
1164	2378	1	\N	\N	\N	\N	\N	\N
1165	2379	1	\N	\N	\N	\N	\N	\N
1166	2380	1	\N	\N	\N	\N	\N	\N
1167	2381	1	\N	\N	\N	\N	\N	\N
1168	2382	1	\N	\N	\N	\N	\N	\N
1169	2383	1	\N	\N	\N	\N	\N	\N
1170	2384	1	\N	\N	\N	\N	\N	\N
1171	2385	1	\N	\N	\N	\N	\N	\N
1172	2386	1	\N	\N	\N	\N	\N	\N
1173	2387	1	\N	\N	\N	\N	\N	\N
1174	2389	1	\N	\N	\N	\N	\N	\N
1175	2390	1	\N	\N	\N	\N	\N	\N
1176	2391	1	\N	\N	\N	\N	\N	\N
1177	2392	1	\N	\N	\N	\N	\N	\N
1178	2394	1	\N	\N	\N	\N	\N	\N
1179	2395	1	\N	\N	\N	\N	\N	\N
1180	2396	1	\N	\N	\N	\N	\N	\N
1181	2397	1	\N	\N	\N	\N	\N	\N
1182	2398	1	\N	\N	\N	\N	\N	\N
1183	2399	1	\N	\N	\N	\N	\N	\N
1184	2400	1	\N	\N	\N	\N	\N	\N
1185	2402	1	\N	\N	\N	\N	\N	\N
1186	2403	1	\N	\N	\N	\N	\N	\N
1187	2404	1	\N	\N	\N	\N	\N	\N
1188	2405	1	\N	\N	\N	\N	\N	\N
1189	2406	1	\N	\N	\N	\N	\N	\N
1190	2407	1	\N	\N	\N	\N	\N	\N
1191	2408	1	\N	\N	\N	\N	\N	\N
1192	2409	1	\N	\N	\N	\N	\N	\N
1193	2410	1	\N	\N	\N	\N	\N	\N
1194	2411	1	\N	\N	\N	\N	\N	\N
1195	2412	1	\N	\N	\N	\N	\N	\N
1196	2413	1	\N	\N	\N	\N	\N	\N
1197	2414	1	\N	\N	\N	\N	\N	\N
1198	2415	1	\N	\N	\N	\N	\N	\N
1199	2416	1	\N	\N	\N	\N	\N	\N
1200	2418	1	\N	\N	\N	\N	\N	\N
1201	2419	1	\N	\N	\N	\N	\N	\N
1202	2420	1	\N	\N	\N	\N	\N	\N
1203	2421	1	\N	\N	\N	\N	\N	\N
1204	2422	1	\N	\N	\N	\N	\N	\N
1205	2423	1	\N	\N	\N	\N	\N	\N
1206	2424	1	\N	\N	\N	\N	\N	\N
1207	2425	1	\N	\N	\N	\N	\N	\N
1208	2426	1	\N	\N	\N	\N	\N	\N
1209	2427	1	\N	\N	\N	\N	\N	\N
1210	2428	1	\N	\N	\N	\N	\N	\N
1211	2429	1	\N	\N	\N	\N	\N	\N
1212	2430	1	\N	\N	\N	\N	\N	\N
1213	2432	1	\N	\N	\N	\N	\N	\N
1214	2433	1	\N	\N	\N	\N	\N	\N
1215	2434	1	\N	\N	\N	\N	\N	\N
1216	2435	1	\N	\N	\N	\N	\N	\N
1217	2436	1	\N	\N	\N	\N	\N	\N
1218	2437	1	\N	\N	\N	\N	\N	\N
1219	2438	1	\N	\N	\N	\N	\N	\N
1220	2439	1	\N	\N	\N	\N	\N	\N
1221	2440	1	\N	\N	\N	\N	\N	\N
1222	2441	1	\N	\N	\N	\N	\N	\N
1223	2443	1	\N	\N	\N	\N	\N	\N
1224	2444	1	\N	\N	\N	\N	\N	\N
1225	2445	1	\N	\N	\N	\N	\N	\N
1226	2446	1	\N	\N	\N	\N	\N	\N
1227	2447	1	\N	\N	\N	\N	\N	\N
1228	2448	1	\N	\N	\N	\N	\N	\N
1229	2450	1	\N	\N	\N	\N	\N	\N
1230	2452	1	\N	\N	\N	\N	\N	\N
1231	2453	1	\N	\N	\N	\N	\N	\N
1232	2454	1	\N	\N	\N	\N	\N	\N
1233	2455	1	\N	\N	\N	\N	\N	\N
1234	2456	1	\N	\N	\N	\N	\N	\N
1235	2457	1	\N	\N	\N	\N	\N	\N
1236	2458	1	\N	\N	\N	\N	\N	\N
1237	2459	1	\N	\N	\N	\N	\N	\N
1238	2460	1	\N	\N	\N	\N	\N	\N
1239	2461	1	\N	\N	\N	\N	\N	\N
1240	2462	1	\N	\N	\N	\N	\N	\N
1241	2464	1	\N	\N	\N	\N	\N	\N
1242	2465	1	\N	\N	\N	\N	\N	\N
1243	2466	1	\N	\N	\N	\N	\N	\N
1244	2467	1	\N	\N	\N	\N	\N	\N
1245	2468	1	\N	\N	\N	\N	\N	\N
1246	2469	1	\N	\N	\N	\N	\N	\N
1247	2470	1	\N	\N	\N	\N	\N	\N
1248	2471	1	\N	\N	\N	\N	\N	\N
1249	2472	1	\N	\N	\N	\N	\N	\N
1250	2473	1	\N	\N	\N	\N	\N	\N
1251	2474	1	\N	\N	\N	\N	\N	\N
1252	2475	1	\N	\N	\N	\N	\N	\N
1253	2476	1	\N	\N	\N	\N	\N	\N
1254	2477	1	\N	\N	\N	\N	\N	\N
1255	2478	1	\N	\N	\N	\N	\N	\N
1256	2479	1	\N	\N	\N	\N	\N	\N
1257	2480	1	\N	\N	\N	\N	\N	\N
1258	2481	1	\N	\N	\N	\N	\N	\N
1259	2482	1	\N	\N	\N	\N	\N	\N
1260	2483	1	\N	\N	\N	\N	\N	\N
1261	2484	1	\N	\N	\N	\N	\N	\N
1262	2485	1	\N	\N	\N	\N	\N	\N
1263	2486	1	\N	\N	\N	\N	\N	\N
1264	2487	1	\N	\N	\N	\N	\N	\N
1265	2488	1	\N	\N	\N	\N	\N	\N
1266	2489	1	\N	\N	\N	\N	\N	\N
1267	2490	1	\N	\N	\N	\N	\N	\N
1268	2491	1	\N	\N	\N	\N	\N	\N
1269	2492	1	\N	\N	\N	\N	\N	\N
1270	2493	1	\N	\N	\N	\N	\N	\N
1271	2495	1	\N	\N	\N	\N	\N	\N
1272	2496	1	\N	\N	\N	\N	\N	\N
1273	2497	1	\N	\N	\N	\N	\N	\N
1274	2498	1	\N	\N	\N	\N	\N	\N
1275	2499	1	\N	\N	\N	\N	\N	\N
1276	2500	1	\N	\N	\N	\N	\N	\N
1277	2501	1	\N	\N	\N	\N	\N	\N
1278	2502	1	\N	\N	\N	\N	\N	\N
1279	2503	1	\N	\N	\N	\N	\N	\N
1280	2504	1	\N	\N	\N	\N	\N	\N
1281	2505	1	\N	\N	\N	\N	\N	\N
1282	2506	1	\N	\N	\N	\N	\N	\N
1283	2507	1	\N	\N	\N	\N	\N	\N
1284	2508	1	\N	\N	\N	\N	\N	\N
1285	2509	1	\N	\N	\N	\N	\N	\N
1286	2510	1	\N	\N	\N	\N	\N	\N
1287	2511	1	\N	\N	\N	\N	\N	\N
1288	2512	1	\N	\N	\N	\N	\N	\N
1289	2513	1	\N	\N	\N	\N	\N	\N
1290	2514	1	\N	\N	\N	\N	\N	\N
1291	2515	1	\N	\N	\N	\N	\N	\N
1292	2516	1	\N	\N	\N	\N	\N	\N
1293	2517	1	\N	\N	\N	\N	\N	\N
1294	2518	1	\N	\N	\N	\N	\N	\N
1295	2519	1	\N	\N	\N	\N	\N	\N
1296	2520	1	\N	\N	\N	\N	\N	\N
1297	2521	1	\N	\N	\N	\N	\N	\N
1298	2522	1	\N	\N	\N	\N	\N	\N
1299	2523	1	\N	\N	\N	\N	\N	\N
1300	2524	1	\N	\N	\N	\N	\N	\N
1301	2525	1	\N	\N	\N	\N	\N	\N
1302	2526	1	\N	\N	\N	\N	\N	\N
1303	2527	1	\N	\N	\N	\N	\N	\N
1304	2528	1	\N	\N	\N	\N	\N	\N
1305	2529	1	\N	\N	\N	\N	\N	\N
1306	2530	1	\N	\N	\N	\N	\N	\N
1307	2531	1	\N	\N	\N	\N	\N	\N
1308	2532	1	\N	\N	\N	\N	\N	\N
1309	2533	1	\N	\N	\N	\N	\N	\N
1310	2534	1	\N	\N	\N	\N	\N	\N
1311	2535	1	\N	\N	\N	\N	\N	\N
1312	2536	1	\N	\N	\N	\N	\N	\N
1313	2537	1	\N	\N	\N	\N	\N	\N
1314	2538	1	\N	\N	\N	\N	\N	\N
1315	2539	1	\N	\N	\N	\N	\N	\N
1316	2540	1	\N	\N	\N	\N	\N	\N
1317	2541	1	\N	\N	\N	\N	\N	\N
1318	2542	1	\N	\N	\N	\N	\N	\N
1319	2543	1	\N	\N	\N	\N	\N	\N
1320	2544	1	\N	\N	\N	\N	\N	\N
1321	2545	1	\N	\N	\N	\N	\N	\N
1322	2546	1	\N	\N	\N	\N	\N	\N
1323	2547	1	\N	\N	\N	\N	\N	\N
1324	2548	1	\N	\N	\N	\N	\N	\N
1325	2549	1	\N	\N	\N	\N	\N	\N
1326	2550	1	\N	\N	\N	\N	\N	\N
1327	2551	1	\N	\N	\N	\N	\N	\N
1328	2552	1	\N	\N	\N	\N	\N	\N
1329	2553	1	\N	\N	\N	\N	\N	\N
1330	2554	1	\N	\N	\N	\N	\N	\N
1331	2555	1	\N	\N	\N	\N	\N	\N
1332	2556	1	\N	\N	\N	\N	\N	\N
1333	2557	1	\N	\N	\N	\N	\N	\N
1334	2558	1	\N	\N	\N	\N	\N	\N
1335	2559	1	\N	\N	\N	\N	\N	\N
1336	2560	1	\N	\N	\N	\N	\N	\N
1337	2561	1	\N	\N	\N	\N	\N	\N
1338	2562	1	\N	\N	\N	\N	\N	\N
1339	2563	1	\N	\N	\N	\N	\N	\N
1340	2564	1	\N	\N	\N	\N	\N	\N
1341	2565	1	\N	\N	\N	\N	\N	\N
1342	2566	1	\N	\N	\N	\N	\N	\N
1343	2567	1	\N	\N	\N	\N	\N	\N
1344	2568	1	\N	\N	\N	\N	\N	\N
1345	2569	1	\N	\N	\N	\N	\N	\N
1346	2570	1	\N	\N	\N	\N	\N	\N
1347	2571	1	\N	\N	\N	\N	\N	\N
1348	2572	1	\N	\N	\N	\N	\N	\N
1349	2573	1	\N	\N	\N	\N	\N	\N
1350	2575	1	\N	\N	\N	\N	\N	\N
1351	2576	1	\N	\N	\N	\N	\N	\N
1352	2577	1	\N	\N	\N	\N	\N	\N
1353	2578	1	\N	\N	\N	\N	\N	\N
1354	2579	1	\N	\N	\N	\N	\N	\N
1355	2580	1	\N	\N	\N	\N	\N	\N
1356	2581	1	\N	\N	\N	\N	\N	\N
1357	2582	1	\N	\N	\N	\N	\N	\N
1358	2583	1	\N	\N	\N	\N	\N	\N
1359	2584	1	\N	\N	\N	\N	\N	\N
1360	2585	1	\N	\N	\N	\N	\N	\N
1361	2586	1	\N	\N	\N	\N	\N	\N
1362	2587	1	\N	\N	\N	\N	\N	\N
1363	2588	1	\N	\N	\N	\N	\N	\N
1364	2589	1	\N	\N	\N	\N	\N	\N
1365	2590	1	\N	\N	\N	\N	\N	\N
1366	2591	1	\N	\N	\N	\N	\N	\N
1367	2592	1	\N	\N	\N	\N	\N	\N
1368	2593	1	\N	\N	\N	\N	\N	\N
1369	2594	1	\N	\N	\N	\N	\N	\N
1370	2595	1	\N	\N	\N	\N	\N	\N
1371	2596	1	\N	\N	\N	\N	\N	\N
1372	2597	1	\N	\N	\N	\N	\N	\N
1373	2598	1	\N	\N	\N	\N	\N	\N
1374	2599	1	\N	\N	\N	\N	\N	\N
1375	2600	1	\N	\N	\N	\N	\N	\N
1376	2601	1	\N	\N	\N	\N	\N	\N
1377	2602	1	\N	\N	\N	\N	\N	\N
1378	2603	1	\N	\N	\N	\N	\N	\N
1379	2604	1	\N	\N	\N	\N	\N	\N
1380	2605	1	\N	\N	\N	\N	\N	\N
1381	2606	1	\N	\N	\N	\N	\N	\N
1382	2607	1	\N	\N	\N	\N	\N	\N
1383	2608	1	\N	\N	\N	\N	\N	\N
1384	2609	1	\N	\N	\N	\N	\N	\N
1385	2610	1	\N	\N	\N	\N	\N	\N
1386	2611	1	\N	\N	\N	\N	\N	\N
1387	2612	1	\N	\N	\N	\N	\N	\N
1388	2614	1	\N	\N	\N	\N	\N	\N
1389	2615	1	\N	\N	\N	\N	\N	\N
1390	2616	1	\N	\N	\N	\N	\N	\N
1391	2617	1	\N	\N	\N	\N	\N	\N
1392	2618	1	\N	\N	\N	\N	\N	\N
1393	2619	1	\N	\N	\N	\N	\N	\N
1394	2620	1	\N	\N	\N	\N	\N	\N
1395	2621	1	\N	\N	\N	\N	\N	\N
1396	2624	1	\N	\N	\N	\N	\N	\N
1397	2625	1	\N	\N	\N	\N	\N	\N
1398	2626	1	\N	\N	\N	\N	\N	\N
1399	2627	1	\N	\N	\N	\N	\N	\N
1400	2628	1	\N	\N	\N	\N	\N	\N
1401	2629	1	\N	\N	\N	\N	\N	\N
1402	2630	1	\N	\N	\N	\N	\N	\N
1403	2631	1	\N	\N	\N	\N	\N	\N
1404	2632	1	\N	\N	\N	\N	\N	\N
1405	2633	1	\N	\N	\N	\N	\N	\N
1406	2634	1	\N	\N	\N	\N	\N	\N
1407	2635	1	\N	\N	\N	\N	\N	\N
1408	2636	1	\N	\N	\N	\N	\N	\N
1409	2637	1	\N	\N	\N	\N	\N	\N
1410	2638	1	\N	\N	\N	\N	\N	\N
1411	2639	1	\N	\N	\N	\N	\N	\N
1412	2640	1	\N	\N	\N	\N	\N	\N
1413	2641	1	\N	\N	\N	\N	\N	\N
1414	2642	1	\N	\N	\N	\N	\N	\N
1415	2643	1	\N	\N	\N	\N	\N	\N
1416	2644	1	\N	\N	\N	\N	\N	\N
1417	2645	1	\N	\N	\N	\N	\N	\N
1418	2646	1	\N	\N	\N	\N	\N	\N
1419	2647	1	\N	\N	\N	\N	\N	\N
1420	2648	1	\N	\N	\N	\N	\N	\N
1421	2649	1	\N	\N	\N	\N	\N	\N
1422	2650	1	\N	\N	\N	\N	\N	\N
1423	2651	1	\N	\N	\N	\N	\N	\N
1424	2652	1	\N	\N	\N	\N	\N	\N
1425	2653	1	\N	\N	\N	\N	\N	\N
1426	2654	1	\N	\N	\N	\N	\N	\N
1427	2655	1	\N	\N	\N	\N	\N	\N
1428	2656	1	\N	\N	\N	\N	\N	\N
1429	2657	1	\N	\N	\N	\N	\N	\N
1430	2658	1	\N	\N	\N	\N	\N	\N
1431	2659	1	\N	\N	\N	\N	\N	\N
1432	2660	1	\N	\N	\N	\N	\N	\N
1433	2661	1	\N	\N	\N	\N	\N	\N
1434	2662	1	\N	\N	\N	\N	\N	\N
1435	2663	1	\N	\N	\N	\N	\N	\N
1436	2664	1	\N	\N	\N	\N	\N	\N
1437	2665	1	\N	\N	\N	\N	\N	\N
1438	2666	1	\N	\N	\N	\N	\N	\N
1439	2667	1	\N	\N	\N	\N	\N	\N
1440	2668	1	\N	\N	\N	\N	\N	\N
1441	2669	1	\N	\N	\N	\N	\N	\N
1442	2670	1	\N	\N	\N	\N	\N	\N
1443	2671	1	\N	\N	\N	\N	\N	\N
1444	2672	1	\N	\N	\N	\N	\N	\N
1445	2673	1	\N	\N	\N	\N	\N	\N
1446	2674	1	\N	\N	\N	\N	\N	\N
1447	2675	1	\N	\N	\N	\N	\N	\N
1448	2676	1	\N	\N	\N	\N	\N	\N
1449	2677	1	\N	\N	\N	\N	\N	\N
1450	2678	1	\N	\N	\N	\N	\N	\N
1451	2679	1	\N	\N	\N	\N	\N	\N
1452	2680	1	\N	\N	\N	\N	\N	\N
1453	2681	1	\N	\N	\N	\N	\N	\N
1454	2682	1	\N	\N	\N	\N	\N	\N
1455	2683	1	\N	\N	\N	\N	\N	\N
1456	2684	1	\N	\N	\N	\N	\N	\N
1457	2685	1	\N	\N	\N	\N	\N	\N
1458	2686	1	\N	\N	\N	\N	\N	\N
1459	2687	1	\N	\N	\N	\N	\N	\N
1460	2688	1	\N	\N	\N	\N	\N	\N
1461	2689	1	\N	\N	\N	\N	\N	\N
1462	2690	1	\N	\N	\N	\N	\N	\N
1463	2691	1	\N	\N	\N	\N	\N	\N
1464	2692	1	\N	\N	\N	\N	\N	\N
1465	2693	1	\N	\N	\N	\N	\N	\N
1466	2694	1	\N	\N	\N	\N	\N	\N
1467	2695	1	\N	\N	\N	\N	\N	\N
1468	2696	1	\N	\N	\N	\N	\N	\N
1469	2698	1	\N	\N	\N	\N	\N	\N
1470	2699	1	\N	\N	\N	\N	\N	\N
1471	2701	1	\N	\N	\N	\N	\N	\N
1472	2702	1	\N	\N	\N	\N	\N	\N
1473	2703	1	\N	\N	\N	\N	\N	\N
1474	2704	1	\N	\N	\N	\N	\N	\N
1475	2705	1	\N	\N	\N	\N	\N	\N
1476	2706	1	\N	\N	\N	\N	\N	\N
1477	2707	1	\N	\N	\N	\N	\N	\N
1478	2708	1	\N	\N	\N	\N	\N	\N
1479	2709	1	\N	\N	\N	\N	\N	\N
1480	2710	1	\N	\N	\N	\N	\N	\N
1481	2711	1	\N	\N	\N	\N	\N	\N
1482	2712	1	\N	\N	\N	\N	\N	\N
1483	2713	1	\N	\N	\N	\N	\N	\N
1484	2714	1	\N	\N	\N	\N	\N	\N
1485	2715	1	\N	\N	\N	\N	\N	\N
1486	2717	1	\N	\N	\N	\N	\N	\N
1487	2718	1	\N	\N	\N	\N	\N	\N
1488	2719	1	\N	\N	\N	\N	\N	\N
1489	2720	1	\N	\N	\N	\N	\N	\N
1490	2721	1	\N	\N	\N	\N	\N	\N
1491	2722	1	\N	\N	\N	\N	\N	\N
1492	2723	1	\N	\N	\N	\N	\N	\N
1493	2724	1	\N	\N	\N	\N	\N	\N
1494	2725	1	\N	\N	\N	\N	\N	\N
1495	2726	1	\N	\N	\N	\N	\N	\N
1496	2727	1	\N	\N	\N	\N	\N	\N
1497	2729	1	\N	\N	\N	\N	\N	\N
1498	2730	1	\N	\N	\N	\N	\N	\N
1499	2731	1	\N	\N	\N	\N	\N	\N
1500	2732	1	\N	\N	\N	\N	\N	\N
1501	2733	1	\N	\N	\N	\N	\N	\N
1502	2734	1	\N	\N	\N	\N	\N	\N
1503	2735	1	\N	\N	\N	\N	\N	\N
1504	2736	1	\N	\N	\N	\N	\N	\N
1505	2737	1	\N	\N	\N	\N	\N	\N
1506	2738	1	\N	\N	\N	\N	\N	\N
1507	2739	1	\N	\N	\N	\N	\N	\N
1508	2740	1	\N	\N	\N	\N	\N	\N
1509	2741	1	\N	\N	\N	\N	\N	\N
1510	2742	1	\N	\N	\N	\N	\N	\N
1511	2743	1	\N	\N	\N	\N	\N	\N
1512	2744	1	\N	\N	\N	\N	\N	\N
1513	2746	1	\N	\N	\N	\N	\N	\N
1514	2747	1	\N	\N	\N	\N	\N	\N
1515	2748	1	\N	\N	\N	\N	\N	\N
1516	2749	1	\N	\N	\N	\N	\N	\N
1517	2750	1	\N	\N	\N	\N	\N	\N
1518	2751	1	\N	\N	\N	\N	\N	\N
1519	2752	1	\N	\N	\N	\N	\N	\N
1520	2753	1	\N	\N	\N	\N	\N	\N
1521	2754	1	\N	\N	\N	\N	\N	\N
1522	2755	1	\N	\N	\N	\N	\N	\N
1523	2756	1	\N	\N	\N	\N	\N	\N
1524	2757	1	\N	\N	\N	\N	\N	\N
1525	2758	1	\N	\N	\N	\N	\N	\N
1526	2759	1	\N	\N	\N	\N	\N	\N
1527	2760	1	\N	\N	\N	\N	\N	\N
1528	2761	1	\N	\N	\N	\N	\N	\N
1529	2762	1	\N	\N	\N	\N	\N	\N
1530	2763	1	\N	\N	\N	\N	\N	\N
1531	2764	1	\N	\N	\N	\N	\N	\N
1532	2765	1	\N	\N	\N	\N	\N	\N
1533	2766	1	\N	\N	\N	\N	\N	\N
1534	2767	1	\N	\N	\N	\N	\N	\N
1535	2768	1	\N	\N	\N	\N	\N	\N
1536	2769	1	\N	\N	\N	\N	\N	\N
1537	2770	1	\N	\N	\N	\N	\N	\N
1538	2771	1	\N	\N	\N	\N	\N	\N
1539	2772	1	\N	\N	\N	\N	\N	\N
1540	2773	1	\N	\N	\N	\N	\N	\N
1541	2774	1	\N	\N	\N	\N	\N	\N
1542	2775	1	\N	\N	\N	\N	\N	\N
1543	2776	1	\N	\N	\N	\N	\N	\N
1544	2777	1	\N	\N	\N	\N	\N	\N
1545	2778	1	\N	\N	\N	\N	\N	\N
1546	2779	1	\N	\N	\N	\N	\N	\N
1547	2780	1	\N	\N	\N	\N	\N	\N
1548	2825	1	\N	\N	\N	\N	\N	\N
1549	2826	1	\N	\N	\N	\N	\N	\N
1550	2827	1	\N	\N	\N	\N	\N	\N
1551	2828	1	\N	\N	\N	\N	\N	\N
1552	2829	1	\N	\N	\N	\N	\N	\N
1553	2830	1	\N	\N	\N	\N	\N	\N
1554	2831	1	\N	\N	\N	\N	\N	\N
1555	2833	1	\N	\N	\N	\N	\N	\N
1556	2834	1	\N	\N	\N	\N	\N	\N
1557	2835	1	\N	\N	\N	\N	\N	\N
1558	2836	1	\N	\N	\N	\N	\N	\N
1559	2837	1	\N	\N	\N	\N	\N	\N
1560	2838	1	\N	\N	\N	\N	\N	\N
1561	2839	1	\N	\N	\N	\N	\N	\N
1562	2840	1	\N	\N	\N	\N	\N	\N
1563	2841	1	\N	\N	\N	\N	\N	\N
1564	2842	1	\N	\N	\N	\N	\N	\N
1565	2843	1	\N	\N	\N	\N	\N	\N
1566	2844	1	\N	\N	\N	\N	\N	\N
1567	2845	1	\N	\N	\N	\N	\N	\N
1568	2846	1	\N	\N	\N	\N	\N	\N
1569	2847	1	\N	\N	\N	\N	\N	\N
1570	2848	1	\N	\N	\N	\N	\N	\N
1571	2849	1	\N	\N	\N	\N	\N	\N
1572	2850	1	\N	\N	\N	\N	\N	\N
1573	2852	1	\N	\N	\N	\N	\N	\N
1574	2853	1	\N	\N	\N	\N	\N	\N
1575	2854	1	\N	\N	\N	\N	\N	\N
1576	2855	1	\N	\N	\N	\N	\N	\N
1577	2856	1	\N	\N	\N	\N	\N	\N
1578	2857	1	\N	\N	\N	\N	\N	\N
1579	2858	1	\N	\N	\N	\N	\N	\N
1580	2859	1	\N	\N	\N	\N	\N	\N
1581	2861	1	\N	\N	\N	\N	\N	\N
1582	2862	1	\N	\N	\N	\N	\N	\N
1583	2866	1	\N	\N	\N	\N	\N	\N
1584	2867	1	\N	\N	\N	\N	\N	\N
1585	2868	1	\N	\N	\N	\N	\N	\N
1586	2869	1	\N	\N	\N	\N	\N	\N
1587	2870	1	\N	\N	\N	\N	\N	\N
1588	2872	1	\N	\N	\N	\N	\N	\N
1589	2873	1	\N	\N	\N	\N	\N	\N
1590	2874	1	\N	\N	\N	\N	\N	\N
1591	2875	1	\N	\N	\N	\N	\N	\N
1592	2876	1	\N	\N	\N	\N	\N	\N
1593	2877	1	\N	\N	\N	\N	\N	\N
1594	2878	1	\N	\N	\N	\N	\N	\N
1595	2879	1	\N	\N	\N	\N	\N	\N
1596	2880	1	\N	\N	\N	\N	\N	\N
1597	1	2	\N	\N	\N	\N	\N	\N
1598	2	2	\N	\N	\N	\N	\N	\N
1599	3	2	\N	\N	\N	\N	\N	\N
1600	4	2	\N	\N	\N	\N	\N	\N
1601	5	2	\N	\N	\N	\N	\N	\N
1602	6	2	\N	\N	\N	\N	\N	\N
1603	8	2	\N	\N	\N	\N	\N	\N
1604	9	2	\N	\N	\N	\N	\N	\N
1605	10	2	\N	\N	\N	\N	\N	\N
1606	13	2	\N	\N	\N	\N	\N	\N
1607	14	2	\N	\N	\N	\N	\N	\N
1608	16	2	\N	\N	\N	\N	\N	\N
1609	18	2	\N	\N	\N	\N	\N	\N
1610	25	2	\N	\N	\N	\N	\N	\N
1611	31	2	\N	\N	\N	\N	\N	\N
1612	32	2	\N	\N	\N	\N	\N	\N
1613	34	2	\N	\N	\N	\N	\N	\N
1614	35	2	\N	\N	\N	\N	\N	\N
1615	37	2	\N	\N	\N	\N	\N	\N
1616	41	2	\N	\N	\N	\N	\N	\N
1617	42	2	\N	\N	\N	\N	\N	\N
1618	43	2	\N	\N	\N	\N	\N	\N
1619	45	2	\N	\N	\N	\N	\N	\N
1620	49	2	\N	\N	\N	\N	\N	\N
1621	50	2	\N	\N	\N	\N	\N	\N
1622	51	2	\N	\N	\N	\N	\N	\N
1623	52	2	\N	\N	\N	\N	\N	\N
1624	53	2	\N	\N	\N	\N	\N	\N
1625	56	2	\N	\N	\N	\N	\N	\N
1626	57	2	\N	\N	\N	\N	\N	\N
1627	58	2	\N	\N	\N	\N	\N	\N
1628	61	2	\N	\N	\N	\N	\N	\N
1629	63	2	\N	\N	\N	\N	\N	\N
1630	64	2	\N	\N	\N	\N	\N	\N
1631	66	2	\N	\N	\N	\N	\N	\N
1632	67	2	\N	\N	\N	\N	\N	\N
1633	68	2	\N	\N	\N	\N	\N	\N
1634	69	2	\N	\N	\N	\N	\N	\N
1635	70	2	\N	\N	\N	\N	\N	\N
1636	71	2	\N	\N	\N	\N	\N	\N
1637	72	2	\N	\N	\N	\N	\N	\N
1638	74	2	\N	\N	\N	\N	\N	\N
1639	75	2	\N	\N	\N	\N	\N	\N
1640	76	2	\N	\N	\N	\N	\N	\N
1641	77	2	\N	\N	\N	\N	\N	\N
1642	78	2	\N	\N	\N	\N	\N	\N
1643	79	2	\N	\N	\N	\N	\N	\N
1644	80	2	\N	\N	\N	\N	\N	\N
1645	83	2	\N	\N	\N	\N	\N	\N
1646	84	2	\N	\N	\N	\N	\N	\N
1647	87	2	\N	\N	\N	\N	\N	\N
1648	88	2	\N	\N	\N	\N	\N	\N
1649	89	2	\N	\N	\N	\N	\N	\N
1650	90	2	\N	\N	\N	\N	\N	\N
1651	93	2	\N	\N	\N	\N	\N	\N
1652	99	2	\N	\N	\N	\N	\N	\N
1653	101	2	\N	\N	\N	\N	\N	\N
1654	103	2	\N	\N	\N	\N	\N	\N
1655	109	2	\N	\N	\N	\N	\N	\N
1656	113	2	\N	\N	\N	\N	\N	\N
1657	114	2	\N	\N	\N	\N	\N	\N
1658	117	2	\N	\N	\N	\N	\N	\N
1659	118	2	\N	\N	\N	\N	\N	\N
1660	120	2	\N	\N	\N	\N	\N	\N
1661	121	2	\N	\N	\N	\N	\N	\N
1662	122	2	\N	\N	\N	\N	\N	\N
1663	125	2	\N	\N	\N	\N	\N	\N
1664	128	2	\N	\N	\N	\N	\N	\N
1665	129	2	\N	\N	\N	\N	\N	\N
1666	130	2	\N	\N	\N	\N	\N	\N
1667	131	2	\N	\N	\N	\N	\N	\N
1668	132	2	\N	\N	\N	\N	\N	\N
1669	134	2	\N	\N	\N	\N	\N	\N
1670	135	2	\N	\N	\N	\N	\N	\N
1671	138	2	\N	\N	\N	\N	\N	\N
1672	141	2	\N	\N	\N	\N	\N	\N
1673	142	2	\N	\N	\N	\N	\N	\N
1674	145	2	\N	\N	\N	\N	\N	\N
1675	148	2	\N	\N	\N	\N	\N	\N
1676	150	2	\N	\N	\N	\N	\N	\N
1677	151	2	\N	\N	\N	\N	\N	\N
1678	154	2	\N	\N	\N	\N	\N	\N
1679	159	2	\N	\N	\N	\N	\N	\N
1680	160	2	\N	\N	\N	\N	\N	\N
1681	161	2	\N	\N	\N	\N	\N	\N
1682	164	2	\N	\N	\N	\N	\N	\N
1683	168	2	\N	\N	\N	\N	\N	\N
1684	170	2	\N	\N	\N	\N	\N	\N
1685	174	2	\N	\N	\N	\N	\N	\N
1686	175	2	\N	\N	\N	\N	\N	\N
1687	181	2	\N	\N	\N	\N	\N	\N
1688	182	2	\N	\N	\N	\N	\N	\N
1689	199	2	\N	\N	\N	\N	\N	\N
1690	201	2	\N	\N	\N	\N	\N	\N
1691	205	2	\N	\N	\N	\N	\N	\N
1692	206	2	\N	\N	\N	\N	\N	\N
1693	212	2	\N	\N	\N	\N	\N	\N
1694	213	2	\N	\N	\N	\N	\N	\N
1695	215	2	\N	\N	\N	\N	\N	\N
1696	217	2	\N	\N	\N	\N	\N	\N
1697	218	2	\N	\N	\N	\N	\N	\N
1698	221	2	\N	\N	\N	\N	\N	\N
1699	224	2	\N	\N	\N	\N	\N	\N
1700	233	2	\N	\N	\N	\N	\N	\N
1701	234	2	\N	\N	\N	\N	\N	\N
1702	254	2	\N	\N	\N	\N	\N	\N
1703	257	2	\N	\N	\N	\N	\N	\N
1704	258	2	\N	\N	\N	\N	\N	\N
1705	260	2	\N	\N	\N	\N	\N	\N
1706	263	2	\N	\N	\N	\N	\N	\N
1707	268	2	\N	\N	\N	\N	\N	\N
1708	269	2	\N	\N	\N	\N	\N	\N
1709	275	2	\N	\N	\N	\N	\N	\N
1710	276	2	\N	\N	\N	\N	\N	\N
1711	278	2	\N	\N	\N	\N	\N	\N
1712	279	2	\N	\N	\N	\N	\N	\N
1713	287	2	\N	\N	\N	\N	\N	\N
1714	290	2	\N	\N	\N	\N	\N	\N
1715	291	2	\N	\N	\N	\N	\N	\N
1716	293	2	\N	\N	\N	\N	\N	\N
1717	295	2	\N	\N	\N	\N	\N	\N
1718	298	2	\N	\N	\N	\N	\N	\N
1719	304	2	\N	\N	\N	\N	\N	\N
1720	312	2	\N	\N	\N	\N	\N	\N
1721	313	2	\N	\N	\N	\N	\N	\N
1722	316	2	\N	\N	\N	\N	\N	\N
1723	317	2	\N	\N	\N	\N	\N	\N
1724	322	2	\N	\N	\N	\N	\N	\N
1725	323	2	\N	\N	\N	\N	\N	\N
1726	325	2	\N	\N	\N	\N	\N	\N
1727	328	2	\N	\N	\N	\N	\N	\N
1728	331	2	\N	\N	\N	\N	\N	\N
1729	333	2	\N	\N	\N	\N	\N	\N
1730	334	2	\N	\N	\N	\N	\N	\N
1731	337	2	\N	\N	\N	\N	\N	\N
1732	338	2	\N	\N	\N	\N	\N	\N
1733	341	2	\N	\N	\N	\N	\N	\N
1734	350	2	\N	\N	\N	\N	\N	\N
1735	353	2	\N	\N	\N	\N	\N	\N
1736	356	2	\N	\N	\N	\N	\N	\N
1737	360	2	\N	\N	\N	\N	\N	\N
1738	362	2	\N	\N	\N	\N	\N	\N
1739	366	2	\N	\N	\N	\N	\N	\N
1740	367	2	\N	\N	\N	\N	\N	\N
1741	370	2	\N	\N	\N	\N	\N	\N
1742	372	2	\N	\N	\N	\N	\N	\N
1743	374	2	\N	\N	\N	\N	\N	\N
1744	377	2	\N	\N	\N	\N	\N	\N
1745	382	2	\N	\N	\N	\N	\N	\N
1746	385	2	\N	\N	\N	\N	\N	\N
1747	386	2	\N	\N	\N	\N	\N	\N
1748	389	2	\N	\N	\N	\N	\N	\N
1749	400	2	\N	\N	\N	\N	\N	\N
1750	405	2	\N	\N	\N	\N	\N	\N
1751	406	2	\N	\N	\N	\N	\N	\N
1752	411	2	\N	\N	\N	\N	\N	\N
1753	415	2	\N	\N	\N	\N	\N	\N
1754	416	2	\N	\N	\N	\N	\N	\N
1755	426	2	\N	\N	\N	\N	\N	\N
1756	448	2	\N	\N	\N	\N	\N	\N
1757	450	2	\N	\N	\N	\N	\N	\N
1758	460	2	\N	\N	\N	\N	\N	\N
1759	461	2	\N	\N	\N	\N	\N	\N
1760	463	2	\N	\N	\N	\N	\N	\N
1761	467	2	\N	\N	\N	\N	\N	\N
1762	468	2	\N	\N	\N	\N	\N	\N
1763	470	2	\N	\N	\N	\N	\N	\N
1764	477	2	\N	\N	\N	\N	\N	\N
1765	495	2	\N	\N	\N	\N	\N	\N
1766	501	2	\N	\N	\N	\N	\N	\N
1767	502	2	\N	\N	\N	\N	\N	\N
1768	506	2	\N	\N	\N	\N	\N	\N
1769	512	2	\N	\N	\N	\N	\N	\N
1770	513	2	\N	\N	\N	\N	\N	\N
1771	520	2	\N	\N	\N	\N	\N	\N
1772	525	2	\N	\N	\N	\N	\N	\N
1773	536	2	\N	\N	\N	\N	\N	\N
1774	541	2	\N	\N	\N	\N	\N	\N
1775	543	2	\N	\N	\N	\N	\N	\N
1776	545	2	\N	\N	\N	\N	\N	\N
1777	549	2	\N	\N	\N	\N	\N	\N
1778	551	2	\N	\N	\N	\N	\N	\N
1779	558	2	\N	\N	\N	\N	\N	\N
1780	572	2	\N	\N	\N	\N	\N	\N
1781	573	2	\N	\N	\N	\N	\N	\N
1782	576	2	\N	\N	\N	\N	\N	\N
1783	584	2	\N	\N	\N	\N	\N	\N
1784	588	2	\N	\N	\N	\N	\N	\N
1785	594	2	\N	\N	\N	\N	\N	\N
1786	597	2	\N	\N	\N	\N	\N	\N
1787	601	2	\N	\N	\N	\N	\N	\N
1788	606	2	\N	\N	\N	\N	\N	\N
1789	623	2	\N	\N	\N	\N	\N	\N
1790	624	2	\N	\N	\N	\N	\N	\N
1791	625	2	\N	\N	\N	\N	\N	\N
1792	626	2	\N	\N	\N	\N	\N	\N
1793	627	2	\N	\N	\N	\N	\N	\N
1794	629	2	\N	\N	\N	\N	\N	\N
1795	633	2	\N	\N	\N	\N	\N	\N
1796	638	2	\N	\N	\N	\N	\N	\N
1797	643	2	\N	\N	\N	\N	\N	\N
1798	644	2	\N	\N	\N	\N	\N	\N
1799	654	2	\N	\N	\N	\N	\N	\N
1800	656	2	\N	\N	\N	\N	\N	\N
1801	659	2	\N	\N	\N	\N	\N	\N
1802	660	2	\N	\N	\N	\N	\N	\N
1803	666	2	\N	\N	\N	\N	\N	\N
1804	680	2	\N	\N	\N	\N	\N	\N
1805	693	2	\N	\N	\N	\N	\N	\N
1806	699	2	\N	\N	\N	\N	\N	\N
1807	702	2	\N	\N	\N	\N	\N	\N
1808	703	2	\N	\N	\N	\N	\N	\N
1809	706	2	\N	\N	\N	\N	\N	\N
1810	707	2	\N	\N	\N	\N	\N	\N
1811	708	2	\N	\N	\N	\N	\N	\N
1812	719	2	\N	\N	\N	\N	\N	\N
1813	720	2	\N	\N	\N	\N	\N	\N
1814	723	2	\N	\N	\N	\N	\N	\N
1815	730	2	\N	\N	\N	\N	\N	\N
1816	733	2	\N	\N	\N	\N	\N	\N
1817	734	2	\N	\N	\N	\N	\N	\N
1818	747	2	\N	\N	\N	\N	\N	\N
1819	760	2	\N	\N	\N	\N	\N	\N
1820	764	2	\N	\N	\N	\N	\N	\N
1821	766	2	\N	\N	\N	\N	\N	\N
1822	778	2	\N	\N	\N	\N	\N	\N
1823	781	2	\N	\N	\N	\N	\N	\N
1824	785	2	\N	\N	\N	\N	\N	\N
1825	788	2	\N	\N	\N	\N	\N	\N
1826	789	2	\N	\N	\N	\N	\N	\N
1827	795	2	\N	\N	\N	\N	\N	\N
1828	796	2	\N	\N	\N	\N	\N	\N
1829	797	2	\N	\N	\N	\N	\N	\N
1830	799	2	\N	\N	\N	\N	\N	\N
1831	812	2	\N	\N	\N	\N	\N	\N
1832	813	2	\N	\N	\N	\N	\N	\N
1833	814	2	\N	\N	\N	\N	\N	\N
1834	815	2	\N	\N	\N	\N	\N	\N
1835	818	2	\N	\N	\N	\N	\N	\N
1836	819	2	\N	\N	\N	\N	\N	\N
1837	823	2	\N	\N	\N	\N	\N	\N
1838	825	2	\N	\N	\N	\N	\N	\N
1839	831	2	\N	\N	\N	\N	\N	\N
1840	833	2	\N	\N	\N	\N	\N	\N
1841	836	2	\N	\N	\N	\N	\N	\N
1842	837	2	\N	\N	\N	\N	\N	\N
1843	841	2	\N	\N	\N	\N	\N	\N
1844	853	2	\N	\N	\N	\N	\N	\N
1845	857	2	\N	\N	\N	\N	\N	\N
1846	859	2	\N	\N	\N	\N	\N	\N
1847	869	2	\N	\N	\N	\N	\N	\N
1848	870	2	\N	\N	\N	\N	\N	\N
1849	873	2	\N	\N	\N	\N	\N	\N
1850	890	2	\N	\N	\N	\N	\N	\N
1851	892	2	\N	\N	\N	\N	\N	\N
1852	894	2	\N	\N	\N	\N	\N	\N
1853	895	2	\N	\N	\N	\N	\N	\N
1854	898	2	\N	\N	\N	\N	\N	\N
1855	911	2	\N	\N	\N	\N	\N	\N
1856	912	2	\N	\N	\N	\N	\N	\N
1857	914	2	\N	\N	\N	\N	\N	\N
1858	916	2	\N	\N	\N	\N	\N	\N
1859	918	2	\N	\N	\N	\N	\N	\N
1860	920	2	\N	\N	\N	\N	\N	\N
1861	921	2	\N	\N	\N	\N	\N	\N
1862	924	2	\N	\N	\N	\N	\N	\N
1863	933	2	\N	\N	\N	\N	\N	\N
1864	934	2	\N	\N	\N	\N	\N	\N
1865	938	2	\N	\N	\N	\N	\N	\N
1866	939	2	\N	\N	\N	\N	\N	\N
1867	945	2	\N	\N	\N	\N	\N	\N
1868	948	2	\N	\N	\N	\N	\N	\N
1869	951	2	\N	\N	\N	\N	\N	\N
1870	954	2	\N	\N	\N	\N	\N	\N
1871	959	2	\N	\N	\N	\N	\N	\N
1872	960	2	\N	\N	\N	\N	\N	\N
1873	964	2	\N	\N	\N	\N	\N	\N
1874	965	2	\N	\N	\N	\N	\N	\N
1875	977	2	\N	\N	\N	\N	\N	\N
1876	978	2	\N	\N	\N	\N	\N	\N
1877	986	2	\N	\N	\N	\N	\N	\N
1878	988	2	\N	\N	\N	\N	\N	\N
1879	990	2	\N	\N	\N	\N	\N	\N
1880	993	2	\N	\N	\N	\N	\N	\N
1881	994	2	\N	\N	\N	\N	\N	\N
1882	998	2	\N	\N	\N	\N	\N	\N
1883	999	2	\N	\N	\N	\N	\N	\N
1884	1002	2	\N	\N	\N	\N	\N	\N
1885	1004	2	\N	\N	\N	\N	\N	\N
1886	1008	2	\N	\N	\N	\N	\N	\N
1887	1010	2	\N	\N	\N	\N	\N	\N
1888	1019	2	\N	\N	\N	\N	\N	\N
1889	1020	2	\N	\N	\N	\N	\N	\N
1890	1022	2	\N	\N	\N	\N	\N	\N
1891	1026	2	\N	\N	\N	\N	\N	\N
1892	1027	2	\N	\N	\N	\N	\N	\N
1893	1028	2	\N	\N	\N	\N	\N	\N
1894	1032	2	\N	\N	\N	\N	\N	\N
1895	1033	2	\N	\N	\N	\N	\N	\N
1896	1035	2	\N	\N	\N	\N	\N	\N
1897	1038	2	\N	\N	\N	\N	\N	\N
1898	1042	2	\N	\N	\N	\N	\N	\N
1899	1044	2	\N	\N	\N	\N	\N	\N
1900	1050	2	\N	\N	\N	\N	\N	\N
1901	1052	2	\N	\N	\N	\N	\N	\N
1902	1053	2	\N	\N	\N	\N	\N	\N
1903	1058	2	\N	\N	\N	\N	\N	\N
1904	1063	2	\N	\N	\N	\N	\N	\N
1905	1066	2	\N	\N	\N	\N	\N	\N
1906	1069	2	\N	\N	\N	\N	\N	\N
1907	1070	2	\N	\N	\N	\N	\N	\N
1908	1082	2	\N	\N	\N	\N	\N	\N
1909	1084	2	\N	\N	\N	\N	\N	\N
1910	1085	2	\N	\N	\N	\N	\N	\N
1911	1087	2	\N	\N	\N	\N	\N	\N
1912	1089	2	\N	\N	\N	\N	\N	\N
1913	1090	2	\N	\N	\N	\N	\N	\N
1914	1093	2	\N	\N	\N	\N	\N	\N
1915	1100	2	\N	\N	\N	\N	\N	\N
1916	1104	2	\N	\N	\N	\N	\N	\N
1917	1106	2	\N	\N	\N	\N	\N	\N
1918	1107	2	\N	\N	\N	\N	\N	\N
1919	1109	2	\N	\N	\N	\N	\N	\N
1920	1110	2	\N	\N	\N	\N	\N	\N
1921	1111	2	\N	\N	\N	\N	\N	\N
1922	1113	2	\N	\N	\N	\N	\N	\N
1923	1120	2	\N	\N	\N	\N	\N	\N
1924	1123	2	\N	\N	\N	\N	\N	\N
1925	1125	2	\N	\N	\N	\N	\N	\N
1926	1135	2	\N	\N	\N	\N	\N	\N
1927	1136	2	\N	\N	\N	\N	\N	\N
1928	1141	2	\N	\N	\N	\N	\N	\N
1929	1146	2	\N	\N	\N	\N	\N	\N
1930	1147	2	\N	\N	\N	\N	\N	\N
1931	1148	2	\N	\N	\N	\N	\N	\N
1932	1153	2	\N	\N	\N	\N	\N	\N
1933	1154	2	\N	\N	\N	\N	\N	\N
1934	1155	2	\N	\N	\N	\N	\N	\N
1935	1156	2	\N	\N	\N	\N	\N	\N
1936	1159	2	\N	\N	\N	\N	\N	\N
1937	1164	2	\N	\N	\N	\N	\N	\N
1938	1165	2	\N	\N	\N	\N	\N	\N
1939	1168	2	\N	\N	\N	\N	\N	\N
1940	1169	2	\N	\N	\N	\N	\N	\N
1941	1172	2	\N	\N	\N	\N	\N	\N
1942	1175	2	\N	\N	\N	\N	\N	\N
1943	1176	2	\N	\N	\N	\N	\N	\N
1944	1182	2	\N	\N	\N	\N	\N	\N
1945	1185	2	\N	\N	\N	\N	\N	\N
1946	1191	2	\N	\N	\N	\N	\N	\N
1947	1193	2	\N	\N	\N	\N	\N	\N
1948	1194	2	\N	\N	\N	\N	\N	\N
1949	1195	2	\N	\N	\N	\N	\N	\N
1950	1198	2	\N	\N	\N	\N	\N	\N
1951	1200	2	\N	\N	\N	\N	\N	\N
1952	1206	2	\N	\N	\N	\N	\N	\N
1953	1208	2	\N	\N	\N	\N	\N	\N
1954	1209	2	\N	\N	\N	\N	\N	\N
1955	1210	2	\N	\N	\N	\N	\N	\N
1956	1212	2	\N	\N	\N	\N	\N	\N
1957	1213	2	\N	\N	\N	\N	\N	\N
1958	1214	2	\N	\N	\N	\N	\N	\N
1959	1216	2	\N	\N	\N	\N	\N	\N
1960	1218	2	\N	\N	\N	\N	\N	\N
1961	1223	2	\N	\N	\N	\N	\N	\N
1962	1226	2	\N	\N	\N	\N	\N	\N
1963	1229	2	\N	\N	\N	\N	\N	\N
1964	1230	2	\N	\N	\N	\N	\N	\N
1965	1234	2	\N	\N	\N	\N	\N	\N
1966	1238	2	\N	\N	\N	\N	\N	\N
1967	1241	2	\N	\N	\N	\N	\N	\N
1968	1244	2	\N	\N	\N	\N	\N	\N
1969	1247	2	\N	\N	\N	\N	\N	\N
1970	1248	2	\N	\N	\N	\N	\N	\N
1971	1249	2	\N	\N	\N	\N	\N	\N
1972	1250	2	\N	\N	\N	\N	\N	\N
1973	1251	2	\N	\N	\N	\N	\N	\N
1974	1252	2	\N	\N	\N	\N	\N	\N
1975	1254	2	\N	\N	\N	\N	\N	\N
1976	1256	2	\N	\N	\N	\N	\N	\N
1977	1257	2	\N	\N	\N	\N	\N	\N
1978	1259	2	\N	\N	\N	\N	\N	\N
1979	1264	2	\N	\N	\N	\N	\N	\N
1980	1266	2	\N	\N	\N	\N	\N	\N
1981	1268	2	\N	\N	\N	\N	\N	\N
1982	1269	2	\N	\N	\N	\N	\N	\N
1983	1271	2	\N	\N	\N	\N	\N	\N
1984	1274	2	\N	\N	\N	\N	\N	\N
1985	1276	2	\N	\N	\N	\N	\N	\N
1986	1279	2	\N	\N	\N	\N	\N	\N
1987	1281	2	\N	\N	\N	\N	\N	\N
1988	1282	2	\N	\N	\N	\N	\N	\N
1989	1283	2	\N	\N	\N	\N	\N	\N
1990	1284	2	\N	\N	\N	\N	\N	\N
1991	1285	2	\N	\N	\N	\N	\N	\N
1992	1286	2	\N	\N	\N	\N	\N	\N
1993	1288	2	\N	\N	\N	\N	\N	\N
1994	1291	2	\N	\N	\N	\N	\N	\N
1995	1294	2	\N	\N	\N	\N	\N	\N
1996	1297	2	\N	\N	\N	\N	\N	\N
1997	1298	2	\N	\N	\N	\N	\N	\N
1998	1299	2	\N	\N	\N	\N	\N	\N
1999	1303	2	\N	\N	\N	\N	\N	\N
2000	1304	2	\N	\N	\N	\N	\N	\N
2001	1306	2	\N	\N	\N	\N	\N	\N
2002	1308	2	\N	\N	\N	\N	\N	\N
2003	1309	2	\N	\N	\N	\N	\N	\N
2004	1312	2	\N	\N	\N	\N	\N	\N
2005	1320	2	\N	\N	\N	\N	\N	\N
2006	1321	2	\N	\N	\N	\N	\N	\N
2007	1322	2	\N	\N	\N	\N	\N	\N
2008	1323	2	\N	\N	\N	\N	\N	\N
2009	1334	2	\N	\N	\N	\N	\N	\N
2010	1336	2	\N	\N	\N	\N	\N	\N
2011	1340	2	\N	\N	\N	\N	\N	\N
2012	1341	2	\N	\N	\N	\N	\N	\N
2013	1343	2	\N	\N	\N	\N	\N	\N
2014	1348	2	\N	\N	\N	\N	\N	\N
2015	1351	2	\N	\N	\N	\N	\N	\N
2016	1352	2	\N	\N	\N	\N	\N	\N
2017	1353	2	\N	\N	\N	\N	\N	\N
2018	1358	2	\N	\N	\N	\N	\N	\N
2019	1361	2	\N	\N	\N	\N	\N	\N
2020	1367	2	\N	\N	\N	\N	\N	\N
2021	1368	2	\N	\N	\N	\N	\N	\N
2022	1371	2	\N	\N	\N	\N	\N	\N
2023	1375	2	\N	\N	\N	\N	\N	\N
2024	1376	2	\N	\N	\N	\N	\N	\N
2025	1380	2	\N	\N	\N	\N	\N	\N
2026	1381	2	\N	\N	\N	\N	\N	\N
2027	1382	2	\N	\N	\N	\N	\N	\N
2028	1387	2	\N	\N	\N	\N	\N	\N
2029	1389	2	\N	\N	\N	\N	\N	\N
2030	1390	2	\N	\N	\N	\N	\N	\N
2031	1391	2	\N	\N	\N	\N	\N	\N
2032	1392	2	\N	\N	\N	\N	\N	\N
2033	1393	2	\N	\N	\N	\N	\N	\N
2034	1395	2	\N	\N	\N	\N	\N	\N
2035	1396	2	\N	\N	\N	\N	\N	\N
2036	1397	2	\N	\N	\N	\N	\N	\N
2037	1398	2	\N	\N	\N	\N	\N	\N
2038	1399	2	\N	\N	\N	\N	\N	\N
2039	1400	2	\N	\N	\N	\N	\N	\N
2040	1403	2	\N	\N	\N	\N	\N	\N
2041	1405	2	\N	\N	\N	\N	\N	\N
2042	1408	2	\N	\N	\N	\N	\N	\N
2043	1409	2	\N	\N	\N	\N	\N	\N
2044	1414	2	\N	\N	\N	\N	\N	\N
2045	1418	2	\N	\N	\N	\N	\N	\N
2046	1420	2	\N	\N	\N	\N	\N	\N
2047	1421	2	\N	\N	\N	\N	\N	\N
2048	1423	2	\N	\N	\N	\N	\N	\N
2049	1425	2	\N	\N	\N	\N	\N	\N
2050	1429	2	\N	\N	\N	\N	\N	\N
2051	1434	2	\N	\N	\N	\N	\N	\N
2052	1435	2	\N	\N	\N	\N	\N	\N
2053	1436	2	\N	\N	\N	\N	\N	\N
2054	1437	2	\N	\N	\N	\N	\N	\N
2055	1439	2	\N	\N	\N	\N	\N	\N
2056	1442	2	\N	\N	\N	\N	\N	\N
2057	1447	2	\N	\N	\N	\N	\N	\N
2058	1448	2	\N	\N	\N	\N	\N	\N
2059	1449	2	\N	\N	\N	\N	\N	\N
2060	1454	2	\N	\N	\N	\N	\N	\N
2061	1455	2	\N	\N	\N	\N	\N	\N
2062	1456	2	\N	\N	\N	\N	\N	\N
2063	1457	2	\N	\N	\N	\N	\N	\N
2064	1459	2	\N	\N	\N	\N	\N	\N
2065	1464	2	\N	\N	\N	\N	\N	\N
2066	1465	2	\N	\N	\N	\N	\N	\N
2067	1466	2	\N	\N	\N	\N	\N	\N
2068	1468	2	\N	\N	\N	\N	\N	\N
2069	1469	2	\N	\N	\N	\N	\N	\N
2070	1472	2	\N	\N	\N	\N	\N	\N
2071	1473	2	\N	\N	\N	\N	\N	\N
2072	1474	2	\N	\N	\N	\N	\N	\N
2073	1475	2	\N	\N	\N	\N	\N	\N
2074	1478	2	\N	\N	\N	\N	\N	\N
2075	1480	2	\N	\N	\N	\N	\N	\N
2076	1481	2	\N	\N	\N	\N	\N	\N
2077	1483	2	\N	\N	\N	\N	\N	\N
2078	1485	2	\N	\N	\N	\N	\N	\N
2079	1486	2	\N	\N	\N	\N	\N	\N
2080	1487	2	\N	\N	\N	\N	\N	\N
2081	1489	2	\N	\N	\N	\N	\N	\N
2082	1492	2	\N	\N	\N	\N	\N	\N
2083	1495	2	\N	\N	\N	\N	\N	\N
2084	1496	2	\N	\N	\N	\N	\N	\N
2085	1497	2	\N	\N	\N	\N	\N	\N
2086	1500	2	\N	\N	\N	\N	\N	\N
2087	1501	2	\N	\N	\N	\N	\N	\N
2088	1503	2	\N	\N	\N	\N	\N	\N
2089	1504	2	\N	\N	\N	\N	\N	\N
2090	1505	2	\N	\N	\N	\N	\N	\N
2091	1506	2	\N	\N	\N	\N	\N	\N
2092	1507	2	\N	\N	\N	\N	\N	\N
2093	1509	2	\N	\N	\N	\N	\N	\N
2094	1510	2	\N	\N	\N	\N	\N	\N
2095	1511	2	\N	\N	\N	\N	\N	\N
2096	1513	2	\N	\N	\N	\N	\N	\N
2097	1514	2	\N	\N	\N	\N	\N	\N
2098	1515	2	\N	\N	\N	\N	\N	\N
2099	1518	2	\N	\N	\N	\N	\N	\N
2100	1520	2	\N	\N	\N	\N	\N	\N
2101	1521	2	\N	\N	\N	\N	\N	\N
2102	1522	2	\N	\N	\N	\N	\N	\N
2103	1523	2	\N	\N	\N	\N	\N	\N
2104	1524	2	\N	\N	\N	\N	\N	\N
2105	1525	2	\N	\N	\N	\N	\N	\N
2106	1526	2	\N	\N	\N	\N	\N	\N
2107	1527	2	\N	\N	\N	\N	\N	\N
2108	1528	2	\N	\N	\N	\N	\N	\N
2109	1529	2	\N	\N	\N	\N	\N	\N
2110	1531	2	\N	\N	\N	\N	\N	\N
2111	1533	2	\N	\N	\N	\N	\N	\N
2112	1534	2	\N	\N	\N	\N	\N	\N
2113	1535	2	\N	\N	\N	\N	\N	\N
2114	1539	2	\N	\N	\N	\N	\N	\N
2115	1542	2	\N	\N	\N	\N	\N	\N
2116	1546	2	\N	\N	\N	\N	\N	\N
2117	1548	2	\N	\N	\N	\N	\N	\N
2118	1550	2	\N	\N	\N	\N	\N	\N
2119	1552	2	\N	\N	\N	\N	\N	\N
2120	1554	2	\N	\N	\N	\N	\N	\N
2121	1555	2	\N	\N	\N	\N	\N	\N
2122	1556	2	\N	\N	\N	\N	\N	\N
2123	1558	2	\N	\N	\N	\N	\N	\N
2124	1559	2	\N	\N	\N	\N	\N	\N
2125	1561	2	\N	\N	\N	\N	\N	\N
2126	1562	2	\N	\N	\N	\N	\N	\N
2127	1563	2	\N	\N	\N	\N	\N	\N
2128	1565	2	\N	\N	\N	\N	\N	\N
2129	1566	2	\N	\N	\N	\N	\N	\N
2130	1567	2	\N	\N	\N	\N	\N	\N
2131	1568	2	\N	\N	\N	\N	\N	\N
2132	1570	2	\N	\N	\N	\N	\N	\N
2133	1575	2	\N	\N	\N	\N	\N	\N
2134	1576	2	\N	\N	\N	\N	\N	\N
2135	1577	2	\N	\N	\N	\N	\N	\N
2136	1578	2	\N	\N	\N	\N	\N	\N
2137	1579	2	\N	\N	\N	\N	\N	\N
2138	1581	2	\N	\N	\N	\N	\N	\N
2139	1582	2	\N	\N	\N	\N	\N	\N
2140	1586	2	\N	\N	\N	\N	\N	\N
2141	1587	2	\N	\N	\N	\N	\N	\N
2142	1588	2	\N	\N	\N	\N	\N	\N
2143	1590	2	\N	\N	\N	\N	\N	\N
2144	1592	2	\N	\N	\N	\N	\N	\N
2145	1595	2	\N	\N	\N	\N	\N	\N
2146	1596	2	\N	\N	\N	\N	\N	\N
2147	1597	2	\N	\N	\N	\N	\N	\N
2148	1598	2	\N	\N	\N	\N	\N	\N
2149	1602	2	\N	\N	\N	\N	\N	\N
2150	1603	2	\N	\N	\N	\N	\N	\N
2151	1605	2	\N	\N	\N	\N	\N	\N
2152	1606	2	\N	\N	\N	\N	\N	\N
2153	1607	2	\N	\N	\N	\N	\N	\N
2154	1608	2	\N	\N	\N	\N	\N	\N
2155	1609	2	\N	\N	\N	\N	\N	\N
2156	1611	2	\N	\N	\N	\N	\N	\N
2157	1614	2	\N	\N	\N	\N	\N	\N
2158	1616	2	\N	\N	\N	\N	\N	\N
2159	1617	2	\N	\N	\N	\N	\N	\N
2160	1618	2	\N	\N	\N	\N	\N	\N
2161	1619	2	\N	\N	\N	\N	\N	\N
2162	1623	2	\N	\N	\N	\N	\N	\N
2163	1624	2	\N	\N	\N	\N	\N	\N
2164	1625	2	\N	\N	\N	\N	\N	\N
2165	1626	2	\N	\N	\N	\N	\N	\N
2166	1628	2	\N	\N	\N	\N	\N	\N
2167	1629	2	\N	\N	\N	\N	\N	\N
2168	1630	2	\N	\N	\N	\N	\N	\N
2169	1631	2	\N	\N	\N	\N	\N	\N
2170	1632	2	\N	\N	\N	\N	\N	\N
2171	1636	2	\N	\N	\N	\N	\N	\N
2172	1637	2	\N	\N	\N	\N	\N	\N
2173	1638	2	\N	\N	\N	\N	\N	\N
2174	1640	2	\N	\N	\N	\N	\N	\N
2175	1642	2	\N	\N	\N	\N	\N	\N
2176	1643	2	\N	\N	\N	\N	\N	\N
2177	1644	2	\N	\N	\N	\N	\N	\N
2178	1647	2	\N	\N	\N	\N	\N	\N
2179	1650	2	\N	\N	\N	\N	\N	\N
2180	1651	2	\N	\N	\N	\N	\N	\N
2181	1654	2	\N	\N	\N	\N	\N	\N
2182	1657	2	\N	\N	\N	\N	\N	\N
2183	1658	2	\N	\N	\N	\N	\N	\N
2184	1659	2	\N	\N	\N	\N	\N	\N
2185	1660	2	\N	\N	\N	\N	\N	\N
2186	1662	2	\N	\N	\N	\N	\N	\N
2187	1665	2	\N	\N	\N	\N	\N	\N
2188	1669	2	\N	\N	\N	\N	\N	\N
2189	1670	2	\N	\N	\N	\N	\N	\N
2190	1671	2	\N	\N	\N	\N	\N	\N
2191	1673	2	\N	\N	\N	\N	\N	\N
2192	1674	2	\N	\N	\N	\N	\N	\N
2193	1676	2	\N	\N	\N	\N	\N	\N
2194	1677	2	\N	\N	\N	\N	\N	\N
2195	1678	2	\N	\N	\N	\N	\N	\N
2196	1679	2	\N	\N	\N	\N	\N	\N
2197	1680	2	\N	\N	\N	\N	\N	\N
2198	1681	2	\N	\N	\N	\N	\N	\N
2199	1683	2	\N	\N	\N	\N	\N	\N
2200	1684	2	\N	\N	\N	\N	\N	\N
2201	1685	2	\N	\N	\N	\N	\N	\N
2202	1686	2	\N	\N	\N	\N	\N	\N
2203	1687	2	\N	\N	\N	\N	\N	\N
2204	1688	2	\N	\N	\N	\N	\N	\N
2205	1690	2	\N	\N	\N	\N	\N	\N
2206	1691	2	\N	\N	\N	\N	\N	\N
2207	1693	2	\N	\N	\N	\N	\N	\N
2208	1694	2	\N	\N	\N	\N	\N	\N
2209	1695	2	\N	\N	\N	\N	\N	\N
2210	1697	2	\N	\N	\N	\N	\N	\N
2211	1698	2	\N	\N	\N	\N	\N	\N
2212	1699	2	\N	\N	\N	\N	\N	\N
2213	1700	2	\N	\N	\N	\N	\N	\N
2214	1702	2	\N	\N	\N	\N	\N	\N
2215	1703	2	\N	\N	\N	\N	\N	\N
2216	1704	2	\N	\N	\N	\N	\N	\N
2217	1706	2	\N	\N	\N	\N	\N	\N
2218	1707	2	\N	\N	\N	\N	\N	\N
2219	1708	2	\N	\N	\N	\N	\N	\N
2220	1709	2	\N	\N	\N	\N	\N	\N
2221	1710	2	\N	\N	\N	\N	\N	\N
2222	1711	2	\N	\N	\N	\N	\N	\N
2223	1712	2	\N	\N	\N	\N	\N	\N
2224	1714	2	\N	\N	\N	\N	\N	\N
2225	1715	2	\N	\N	\N	\N	\N	\N
2226	1716	2	\N	\N	\N	\N	\N	\N
2227	1717	2	\N	\N	\N	\N	\N	\N
2228	1719	2	\N	\N	\N	\N	\N	\N
2229	1720	2	\N	\N	\N	\N	\N	\N
2230	1721	2	\N	\N	\N	\N	\N	\N
2231	1722	2	\N	\N	\N	\N	\N	\N
2232	1723	2	\N	\N	\N	\N	\N	\N
2233	1724	2	\N	\N	\N	\N	\N	\N
2234	1726	2	\N	\N	\N	\N	\N	\N
2235	1727	2	\N	\N	\N	\N	\N	\N
2236	1728	2	\N	\N	\N	\N	\N	\N
2237	1729	2	\N	\N	\N	\N	\N	\N
2238	1731	2	\N	\N	\N	\N	\N	\N
2239	1732	2	\N	\N	\N	\N	\N	\N
2240	1733	2	\N	\N	\N	\N	\N	\N
2241	1736	2	\N	\N	\N	\N	\N	\N
2242	1737	2	\N	\N	\N	\N	\N	\N
2243	1738	2	\N	\N	\N	\N	\N	\N
2244	1739	2	\N	\N	\N	\N	\N	\N
2245	1741	2	\N	\N	\N	\N	\N	\N
2246	1742	2	\N	\N	\N	\N	\N	\N
2247	1743	2	\N	\N	\N	\N	\N	\N
2248	1745	2	\N	\N	\N	\N	\N	\N
2249	1746	2	\N	\N	\N	\N	\N	\N
2250	1747	2	\N	\N	\N	\N	\N	\N
2251	1748	2	\N	\N	\N	\N	\N	\N
2252	1750	2	\N	\N	\N	\N	\N	\N
2253	1752	2	\N	\N	\N	\N	\N	\N
2254	1753	2	\N	\N	\N	\N	\N	\N
2255	1754	2	\N	\N	\N	\N	\N	\N
2256	1755	2	\N	\N	\N	\N	\N	\N
2257	1757	2	\N	\N	\N	\N	\N	\N
2258	1758	2	\N	\N	\N	\N	\N	\N
2259	1759	2	\N	\N	\N	\N	\N	\N
2260	1760	2	\N	\N	\N	\N	\N	\N
2261	1762	2	\N	\N	\N	\N	\N	\N
2262	1763	2	\N	\N	\N	\N	\N	\N
2263	1765	2	\N	\N	\N	\N	\N	\N
2264	1767	2	\N	\N	\N	\N	\N	\N
2265	1768	2	\N	\N	\N	\N	\N	\N
2266	1769	2	\N	\N	\N	\N	\N	\N
2267	1771	2	\N	\N	\N	\N	\N	\N
2268	1772	2	\N	\N	\N	\N	\N	\N
2269	1773	2	\N	\N	\N	\N	\N	\N
2270	1774	2	\N	\N	\N	\N	\N	\N
2271	1775	2	\N	\N	\N	\N	\N	\N
2272	1776	2	\N	\N	\N	\N	\N	\N
2273	1777	2	\N	\N	\N	\N	\N	\N
2274	1778	2	\N	\N	\N	\N	\N	\N
2275	1779	2	\N	\N	\N	\N	\N	\N
2276	1781	2	\N	\N	\N	\N	\N	\N
2277	1782	2	\N	\N	\N	\N	\N	\N
2278	1783	2	\N	\N	\N	\N	\N	\N
2279	1784	2	\N	\N	\N	\N	\N	\N
2280	1785	2	\N	\N	\N	\N	\N	\N
2281	1786	2	\N	\N	\N	\N	\N	\N
2282	1787	2	\N	\N	\N	\N	\N	\N
2283	1788	2	\N	\N	\N	\N	\N	\N
2284	1789	2	\N	\N	\N	\N	\N	\N
2285	1790	2	\N	\N	\N	\N	\N	\N
2286	1792	2	\N	\N	\N	\N	\N	\N
2287	1793	2	\N	\N	\N	\N	\N	\N
2288	1795	2	\N	\N	\N	\N	\N	\N
2289	1797	2	\N	\N	\N	\N	\N	\N
2290	1798	2	\N	\N	\N	\N	\N	\N
2291	1799	2	\N	\N	\N	\N	\N	\N
2292	1801	2	\N	\N	\N	\N	\N	\N
2293	1803	2	\N	\N	\N	\N	\N	\N
2294	1805	2	\N	\N	\N	\N	\N	\N
2295	1807	2	\N	\N	\N	\N	\N	\N
2296	1808	2	\N	\N	\N	\N	\N	\N
2297	1809	2	\N	\N	\N	\N	\N	\N
2298	1810	2	\N	\N	\N	\N	\N	\N
2299	1811	2	\N	\N	\N	\N	\N	\N
2300	1812	2	\N	\N	\N	\N	\N	\N
2301	1814	2	\N	\N	\N	\N	\N	\N
2302	1815	2	\N	\N	\N	\N	\N	\N
2303	1816	2	\N	\N	\N	\N	\N	\N
2304	1817	2	\N	\N	\N	\N	\N	\N
2305	1818	2	\N	\N	\N	\N	\N	\N
2306	1819	2	\N	\N	\N	\N	\N	\N
2307	1824	2	\N	\N	\N	\N	\N	\N
2308	1825	2	\N	\N	\N	\N	\N	\N
2309	1826	2	\N	\N	\N	\N	\N	\N
2310	1828	2	\N	\N	\N	\N	\N	\N
2311	1830	2	\N	\N	\N	\N	\N	\N
2312	1831	2	\N	\N	\N	\N	\N	\N
2313	1832	2	\N	\N	\N	\N	\N	\N
2314	1833	2	\N	\N	\N	\N	\N	\N
2315	1834	2	\N	\N	\N	\N	\N	\N
2316	1835	2	\N	\N	\N	\N	\N	\N
2317	1836	2	\N	\N	\N	\N	\N	\N
2318	1837	2	\N	\N	\N	\N	\N	\N
2319	1838	2	\N	\N	\N	\N	\N	\N
2320	1839	2	\N	\N	\N	\N	\N	\N
2321	1840	2	\N	\N	\N	\N	\N	\N
2322	1841	2	\N	\N	\N	\N	\N	\N
2323	1842	2	\N	\N	\N	\N	\N	\N
2324	1843	2	\N	\N	\N	\N	\N	\N
2325	1845	2	\N	\N	\N	\N	\N	\N
2326	1846	2	\N	\N	\N	\N	\N	\N
2327	1847	2	\N	\N	\N	\N	\N	\N
2328	1848	2	\N	\N	\N	\N	\N	\N
2329	1849	2	\N	\N	\N	\N	\N	\N
2330	1850	2	\N	\N	\N	\N	\N	\N
2331	1851	2	\N	\N	\N	\N	\N	\N
2332	1852	2	\N	\N	\N	\N	\N	\N
2333	1853	2	\N	\N	\N	\N	\N	\N
2334	1856	2	\N	\N	\N	\N	\N	\N
2335	1857	2	\N	\N	\N	\N	\N	\N
2336	1861	2	\N	\N	\N	\N	\N	\N
2337	1863	2	\N	\N	\N	\N	\N	\N
2338	1864	2	\N	\N	\N	\N	\N	\N
2339	1865	2	\N	\N	\N	\N	\N	\N
2340	1866	2	\N	\N	\N	\N	\N	\N
2341	1869	2	\N	\N	\N	\N	\N	\N
2342	1871	2	\N	\N	\N	\N	\N	\N
2343	1872	2	\N	\N	\N	\N	\N	\N
2344	1873	2	\N	\N	\N	\N	\N	\N
2345	1876	2	\N	\N	\N	\N	\N	\N
2346	1877	2	\N	\N	\N	\N	\N	\N
2347	1878	2	\N	\N	\N	\N	\N	\N
2348	1881	2	\N	\N	\N	\N	\N	\N
2349	1882	2	\N	\N	\N	\N	\N	\N
2350	1883	2	\N	\N	\N	\N	\N	\N
2351	1884	2	\N	\N	\N	\N	\N	\N
2352	1885	2	\N	\N	\N	\N	\N	\N
2353	1886	2	\N	\N	\N	\N	\N	\N
2354	1887	2	\N	\N	\N	\N	\N	\N
2355	1888	2	\N	\N	\N	\N	\N	\N
2356	1889	2	\N	\N	\N	\N	\N	\N
2357	1890	2	\N	\N	\N	\N	\N	\N
2358	1894	2	\N	\N	\N	\N	\N	\N
2359	1896	2	\N	\N	\N	\N	\N	\N
2360	1897	2	\N	\N	\N	\N	\N	\N
2361	1898	2	\N	\N	\N	\N	\N	\N
2362	1899	2	\N	\N	\N	\N	\N	\N
2363	1900	2	\N	\N	\N	\N	\N	\N
2364	1902	2	\N	\N	\N	\N	\N	\N
2365	1903	2	\N	\N	\N	\N	\N	\N
2366	1904	2	\N	\N	\N	\N	\N	\N
2367	1905	2	\N	\N	\N	\N	\N	\N
2368	1907	2	\N	\N	\N	\N	\N	\N
2369	1908	2	\N	\N	\N	\N	\N	\N
2370	1910	2	\N	\N	\N	\N	\N	\N
2371	1912	2	\N	\N	\N	\N	\N	\N
2372	1913	2	\N	\N	\N	\N	\N	\N
2373	1915	2	\N	\N	\N	\N	\N	\N
2374	1916	2	\N	\N	\N	\N	\N	\N
2375	1917	2	\N	\N	\N	\N	\N	\N
2376	1918	2	\N	\N	\N	\N	\N	\N
2377	1920	2	\N	\N	\N	\N	\N	\N
2378	1921	2	\N	\N	\N	\N	\N	\N
2379	1922	2	\N	\N	\N	\N	\N	\N
2380	1923	2	\N	\N	\N	\N	\N	\N
2381	1925	2	\N	\N	\N	\N	\N	\N
2382	1926	2	\N	\N	\N	\N	\N	\N
2383	1927	2	\N	\N	\N	\N	\N	\N
2384	1930	2	\N	\N	\N	\N	\N	\N
2385	1931	2	\N	\N	\N	\N	\N	\N
2386	1933	2	\N	\N	\N	\N	\N	\N
2387	1934	2	\N	\N	\N	\N	\N	\N
2388	1935	2	\N	\N	\N	\N	\N	\N
2389	1937	2	\N	\N	\N	\N	\N	\N
2390	1938	2	\N	\N	\N	\N	\N	\N
2391	1942	2	\N	\N	\N	\N	\N	\N
2392	1943	2	\N	\N	\N	\N	\N	\N
2393	1945	2	\N	\N	\N	\N	\N	\N
2394	1946	2	\N	\N	\N	\N	\N	\N
2395	1947	2	\N	\N	\N	\N	\N	\N
2396	1948	2	\N	\N	\N	\N	\N	\N
2397	1949	2	\N	\N	\N	\N	\N	\N
2398	1950	2	\N	\N	\N	\N	\N	\N
2399	1951	2	\N	\N	\N	\N	\N	\N
2400	1952	2	\N	\N	\N	\N	\N	\N
2401	1954	2	\N	\N	\N	\N	\N	\N
2402	1955	2	\N	\N	\N	\N	\N	\N
2403	1956	2	\N	\N	\N	\N	\N	\N
2404	1958	2	\N	\N	\N	\N	\N	\N
2405	1959	2	\N	\N	\N	\N	\N	\N
2406	1961	2	\N	\N	\N	\N	\N	\N
2407	1962	2	\N	\N	\N	\N	\N	\N
2408	1963	2	\N	\N	\N	\N	\N	\N
2409	1964	2	\N	\N	\N	\N	\N	\N
2410	1965	2	\N	\N	\N	\N	\N	\N
2411	1966	2	\N	\N	\N	\N	\N	\N
2412	1967	2	\N	\N	\N	\N	\N	\N
2413	1968	2	\N	\N	\N	\N	\N	\N
2414	1969	2	\N	\N	\N	\N	\N	\N
2415	1970	2	\N	\N	\N	\N	\N	\N
2416	1971	2	\N	\N	\N	\N	\N	\N
2417	1973	2	\N	\N	\N	\N	\N	\N
2418	1974	2	\N	\N	\N	\N	\N	\N
2419	1975	2	\N	\N	\N	\N	\N	\N
2420	1976	2	\N	\N	\N	\N	\N	\N
2421	1979	2	\N	\N	\N	\N	\N	\N
2422	1980	2	\N	\N	\N	\N	\N	\N
2423	1981	2	\N	\N	\N	\N	\N	\N
2424	1982	2	\N	\N	\N	\N	\N	\N
2425	1983	2	\N	\N	\N	\N	\N	\N
2426	1984	2	\N	\N	\N	\N	\N	\N
2427	1985	2	\N	\N	\N	\N	\N	\N
2428	1986	2	\N	\N	\N	\N	\N	\N
2429	1987	2	\N	\N	\N	\N	\N	\N
2430	1988	2	\N	\N	\N	\N	\N	\N
2431	1989	2	\N	\N	\N	\N	\N	\N
2432	1990	2	\N	\N	\N	\N	\N	\N
2433	1991	2	\N	\N	\N	\N	\N	\N
2434	1993	2	\N	\N	\N	\N	\N	\N
2435	1994	2	\N	\N	\N	\N	\N	\N
2436	1995	2	\N	\N	\N	\N	\N	\N
2437	1996	2	\N	\N	\N	\N	\N	\N
2438	1998	2	\N	\N	\N	\N	\N	\N
2439	1999	2	\N	\N	\N	\N	\N	\N
2440	2000	2	\N	\N	\N	\N	\N	\N
2441	2001	2	\N	\N	\N	\N	\N	\N
2442	2002	2	\N	\N	\N	\N	\N	\N
2443	2004	2	\N	\N	\N	\N	\N	\N
2444	2005	2	\N	\N	\N	\N	\N	\N
2445	2006	2	\N	\N	\N	\N	\N	\N
2446	2007	2	\N	\N	\N	\N	\N	\N
2447	2008	2	\N	\N	\N	\N	\N	\N
2448	2009	2	\N	\N	\N	\N	\N	\N
2449	2010	2	\N	\N	\N	\N	\N	\N
2450	2011	2	\N	\N	\N	\N	\N	\N
2451	2012	2	\N	\N	\N	\N	\N	\N
2452	2013	2	\N	\N	\N	\N	\N	\N
2453	2015	2	\N	\N	\N	\N	\N	\N
2454	2017	2	\N	\N	\N	\N	\N	\N
2455	2018	2	\N	\N	\N	\N	\N	\N
2456	2019	2	\N	\N	\N	\N	\N	\N
2457	2021	2	\N	\N	\N	\N	\N	\N
2458	2022	2	\N	\N	\N	\N	\N	\N
2459	2024	2	\N	\N	\N	\N	\N	\N
2460	2025	2	\N	\N	\N	\N	\N	\N
2461	2026	2	\N	\N	\N	\N	\N	\N
2462	2027	2	\N	\N	\N	\N	\N	\N
2463	2029	2	\N	\N	\N	\N	\N	\N
2464	2030	2	\N	\N	\N	\N	\N	\N
2465	2031	2	\N	\N	\N	\N	\N	\N
2466	2032	2	\N	\N	\N	\N	\N	\N
2467	2033	2	\N	\N	\N	\N	\N	\N
2468	2034	2	\N	\N	\N	\N	\N	\N
2469	2036	2	\N	\N	\N	\N	\N	\N
2470	2037	2	\N	\N	\N	\N	\N	\N
2471	2038	2	\N	\N	\N	\N	\N	\N
2472	2039	2	\N	\N	\N	\N	\N	\N
2473	2040	2	\N	\N	\N	\N	\N	\N
2474	2041	2	\N	\N	\N	\N	\N	\N
2475	2042	2	\N	\N	\N	\N	\N	\N
2476	2043	2	\N	\N	\N	\N	\N	\N
2477	2044	2	\N	\N	\N	\N	\N	\N
2478	2045	2	\N	\N	\N	\N	\N	\N
2479	2046	2	\N	\N	\N	\N	\N	\N
2480	2047	2	\N	\N	\N	\N	\N	\N
2481	2048	2	\N	\N	\N	\N	\N	\N
2482	2049	2	\N	\N	\N	\N	\N	\N
2483	2050	2	\N	\N	\N	\N	\N	\N
2484	2051	2	\N	\N	\N	\N	\N	\N
2485	2053	2	\N	\N	\N	\N	\N	\N
2486	2054	2	\N	\N	\N	\N	\N	\N
2487	2055	2	\N	\N	\N	\N	\N	\N
2488	2056	2	\N	\N	\N	\N	\N	\N
2489	2057	2	\N	\N	\N	\N	\N	\N
2490	2058	2	\N	\N	\N	\N	\N	\N
2491	2059	2	\N	\N	\N	\N	\N	\N
2492	2060	2	\N	\N	\N	\N	\N	\N
2493	2061	2	\N	\N	\N	\N	\N	\N
2494	2062	2	\N	\N	\N	\N	\N	\N
2495	2063	2	\N	\N	\N	\N	\N	\N
2496	2064	2	\N	\N	\N	\N	\N	\N
2497	2065	2	\N	\N	\N	\N	\N	\N
2498	2066	2	\N	\N	\N	\N	\N	\N
2499	2067	2	\N	\N	\N	\N	\N	\N
2500	2069	2	\N	\N	\N	\N	\N	\N
2501	2070	2	\N	\N	\N	\N	\N	\N
2502	2071	2	\N	\N	\N	\N	\N	\N
2503	2072	2	\N	\N	\N	\N	\N	\N
2504	2074	2	\N	\N	\N	\N	\N	\N
2505	2076	2	\N	\N	\N	\N	\N	\N
2506	2077	2	\N	\N	\N	\N	\N	\N
2507	2078	2	\N	\N	\N	\N	\N	\N
2508	2079	2	\N	\N	\N	\N	\N	\N
2509	2080	2	\N	\N	\N	\N	\N	\N
2510	2081	2	\N	\N	\N	\N	\N	\N
2511	2082	2	\N	\N	\N	\N	\N	\N
2512	2083	2	\N	\N	\N	\N	\N	\N
2513	2087	2	\N	\N	\N	\N	\N	\N
2514	2088	2	\N	\N	\N	\N	\N	\N
2515	2089	2	\N	\N	\N	\N	\N	\N
2516	2090	2	\N	\N	\N	\N	\N	\N
2517	2091	2	\N	\N	\N	\N	\N	\N
2518	2092	2	\N	\N	\N	\N	\N	\N
2519	2093	2	\N	\N	\N	\N	\N	\N
2520	2094	2	\N	\N	\N	\N	\N	\N
2521	2095	2	\N	\N	\N	\N	\N	\N
2522	2096	2	\N	\N	\N	\N	\N	\N
2523	2098	2	\N	\N	\N	\N	\N	\N
2524	2099	2	\N	\N	\N	\N	\N	\N
2525	2100	2	\N	\N	\N	\N	\N	\N
2526	2101	2	\N	\N	\N	\N	\N	\N
2527	2103	2	\N	\N	\N	\N	\N	\N
2528	2104	2	\N	\N	\N	\N	\N	\N
2529	2105	2	\N	\N	\N	\N	\N	\N
2530	2106	2	\N	\N	\N	\N	\N	\N
2531	2107	2	\N	\N	\N	\N	\N	\N
2532	2109	2	\N	\N	\N	\N	\N	\N
2533	2110	2	\N	\N	\N	\N	\N	\N
2534	2112	2	\N	\N	\N	\N	\N	\N
2535	2114	2	\N	\N	\N	\N	\N	\N
2536	2115	2	\N	\N	\N	\N	\N	\N
2537	2117	2	\N	\N	\N	\N	\N	\N
2538	2118	2	\N	\N	\N	\N	\N	\N
2539	2119	2	\N	\N	\N	\N	\N	\N
2540	2120	2	\N	\N	\N	\N	\N	\N
2541	2122	2	\N	\N	\N	\N	\N	\N
2542	2123	2	\N	\N	\N	\N	\N	\N
2543	2124	2	\N	\N	\N	\N	\N	\N
2544	2125	2	\N	\N	\N	\N	\N	\N
2545	2126	2	\N	\N	\N	\N	\N	\N
2546	2127	2	\N	\N	\N	\N	\N	\N
2547	2129	2	\N	\N	\N	\N	\N	\N
2548	2130	2	\N	\N	\N	\N	\N	\N
2549	2132	2	\N	\N	\N	\N	\N	\N
2550	2134	2	\N	\N	\N	\N	\N	\N
2551	2135	2	\N	\N	\N	\N	\N	\N
2552	2136	2	\N	\N	\N	\N	\N	\N
2553	2137	2	\N	\N	\N	\N	\N	\N
2554	2138	2	\N	\N	\N	\N	\N	\N
2555	2139	2	\N	\N	\N	\N	\N	\N
2556	2142	2	\N	\N	\N	\N	\N	\N
2557	2143	2	\N	\N	\N	\N	\N	\N
2558	2144	2	\N	\N	\N	\N	\N	\N
2559	2146	2	\N	\N	\N	\N	\N	\N
2560	2147	2	\N	\N	\N	\N	\N	\N
2561	2148	2	\N	\N	\N	\N	\N	\N
2562	2149	2	\N	\N	\N	\N	\N	\N
2563	2150	2	\N	\N	\N	\N	\N	\N
2564	2151	2	\N	\N	\N	\N	\N	\N
2565	2152	2	\N	\N	\N	\N	\N	\N
2566	2153	2	\N	\N	\N	\N	\N	\N
2567	2157	2	\N	\N	\N	\N	\N	\N
2568	2158	2	\N	\N	\N	\N	\N	\N
2569	2159	2	\N	\N	\N	\N	\N	\N
2570	2160	2	\N	\N	\N	\N	\N	\N
2571	2161	2	\N	\N	\N	\N	\N	\N
2572	2162	2	\N	\N	\N	\N	\N	\N
2573	2163	2	\N	\N	\N	\N	\N	\N
2574	2165	2	\N	\N	\N	\N	\N	\N
2575	2166	2	\N	\N	\N	\N	\N	\N
2576	2167	2	\N	\N	\N	\N	\N	\N
2577	2168	2	\N	\N	\N	\N	\N	\N
2578	2170	2	\N	\N	\N	\N	\N	\N
2579	2171	2	\N	\N	\N	\N	\N	\N
2580	2172	2	\N	\N	\N	\N	\N	\N
2581	2173	2	\N	\N	\N	\N	\N	\N
2582	2174	2	\N	\N	\N	\N	\N	\N
2583	2175	2	\N	\N	\N	\N	\N	\N
2584	2176	2	\N	\N	\N	\N	\N	\N
2585	2177	2	\N	\N	\N	\N	\N	\N
2586	2178	2	\N	\N	\N	\N	\N	\N
2587	2179	2	\N	\N	\N	\N	\N	\N
2588	2180	2	\N	\N	\N	\N	\N	\N
2589	2181	2	\N	\N	\N	\N	\N	\N
2590	2182	2	\N	\N	\N	\N	\N	\N
2591	2183	2	\N	\N	\N	\N	\N	\N
2592	2184	2	\N	\N	\N	\N	\N	\N
2593	2185	2	\N	\N	\N	\N	\N	\N
2594	2187	2	\N	\N	\N	\N	\N	\N
2595	2189	2	\N	\N	\N	\N	\N	\N
2596	2190	2	\N	\N	\N	\N	\N	\N
2597	2191	2	\N	\N	\N	\N	\N	\N
2598	2192	2	\N	\N	\N	\N	\N	\N
2599	2193	2	\N	\N	\N	\N	\N	\N
2600	2194	2	\N	\N	\N	\N	\N	\N
2601	2196	2	\N	\N	\N	\N	\N	\N
2602	2198	2	\N	\N	\N	\N	\N	\N
2603	2199	2	\N	\N	\N	\N	\N	\N
2604	2200	2	\N	\N	\N	\N	\N	\N
2605	2201	2	\N	\N	\N	\N	\N	\N
2606	2202	2	\N	\N	\N	\N	\N	\N
2607	2204	2	\N	\N	\N	\N	\N	\N
2608	2205	2	\N	\N	\N	\N	\N	\N
2609	2207	2	\N	\N	\N	\N	\N	\N
2610	2208	2	\N	\N	\N	\N	\N	\N
2611	2209	2	\N	\N	\N	\N	\N	\N
2612	2211	2	\N	\N	\N	\N	\N	\N
2613	2212	2	\N	\N	\N	\N	\N	\N
2614	2213	2	\N	\N	\N	\N	\N	\N
2615	2214	2	\N	\N	\N	\N	\N	\N
2616	2215	2	\N	\N	\N	\N	\N	\N
2617	2217	2	\N	\N	\N	\N	\N	\N
2618	2218	2	\N	\N	\N	\N	\N	\N
2619	2219	2	\N	\N	\N	\N	\N	\N
2620	2221	2	\N	\N	\N	\N	\N	\N
2621	2222	2	\N	\N	\N	\N	\N	\N
2622	2223	2	\N	\N	\N	\N	\N	\N
2623	2224	2	\N	\N	\N	\N	\N	\N
2624	2225	2	\N	\N	\N	\N	\N	\N
2625	2228	2	\N	\N	\N	\N	\N	\N
2626	2229	2	\N	\N	\N	\N	\N	\N
2627	2230	2	\N	\N	\N	\N	\N	\N
2628	2231	2	\N	\N	\N	\N	\N	\N
2629	2232	2	\N	\N	\N	\N	\N	\N
2630	2235	2	\N	\N	\N	\N	\N	\N
2631	2236	2	\N	\N	\N	\N	\N	\N
2632	2237	2	\N	\N	\N	\N	\N	\N
2633	2239	2	\N	\N	\N	\N	\N	\N
2634	2240	2	\N	\N	\N	\N	\N	\N
2635	2241	2	\N	\N	\N	\N	\N	\N
2636	2242	2	\N	\N	\N	\N	\N	\N
2637	2243	2	\N	\N	\N	\N	\N	\N
2638	2244	2	\N	\N	\N	\N	\N	\N
2639	2245	2	\N	\N	\N	\N	\N	\N
2640	2246	2	\N	\N	\N	\N	\N	\N
2641	2247	2	\N	\N	\N	\N	\N	\N
2642	2248	2	\N	\N	\N	\N	\N	\N
2643	2249	2	\N	\N	\N	\N	\N	\N
2644	2250	2	\N	\N	\N	\N	\N	\N
2645	2251	2	\N	\N	\N	\N	\N	\N
2646	2253	2	\N	\N	\N	\N	\N	\N
2647	2255	2	\N	\N	\N	\N	\N	\N
2648	2256	2	\N	\N	\N	\N	\N	\N
2649	2257	2	\N	\N	\N	\N	\N	\N
2650	2258	2	\N	\N	\N	\N	\N	\N
2651	2259	2	\N	\N	\N	\N	\N	\N
2652	2260	2	\N	\N	\N	\N	\N	\N
2653	2261	2	\N	\N	\N	\N	\N	\N
2654	2262	2	\N	\N	\N	\N	\N	\N
2655	2263	2	\N	\N	\N	\N	\N	\N
2656	2264	2	\N	\N	\N	\N	\N	\N
2657	2265	2	\N	\N	\N	\N	\N	\N
2658	2266	2	\N	\N	\N	\N	\N	\N
2659	2267	2	\N	\N	\N	\N	\N	\N
2660	2268	2	\N	\N	\N	\N	\N	\N
2661	2269	2	\N	\N	\N	\N	\N	\N
2662	2270	2	\N	\N	\N	\N	\N	\N
2663	2271	2	\N	\N	\N	\N	\N	\N
2664	2272	2	\N	\N	\N	\N	\N	\N
2665	2273	2	\N	\N	\N	\N	\N	\N
2666	2274	2	\N	\N	\N	\N	\N	\N
2667	2275	2	\N	\N	\N	\N	\N	\N
2668	2276	2	\N	\N	\N	\N	\N	\N
2669	2277	2	\N	\N	\N	\N	\N	\N
2670	2278	2	\N	\N	\N	\N	\N	\N
2671	2279	2	\N	\N	\N	\N	\N	\N
2672	2280	2	\N	\N	\N	\N	\N	\N
2673	2281	2	\N	\N	\N	\N	\N	\N
2674	2282	2	\N	\N	\N	\N	\N	\N
2675	2283	2	\N	\N	\N	\N	\N	\N
2676	2284	2	\N	\N	\N	\N	\N	\N
2677	2285	2	\N	\N	\N	\N	\N	\N
2678	2286	2	\N	\N	\N	\N	\N	\N
2679	2287	2	\N	\N	\N	\N	\N	\N
2680	2288	2	\N	\N	\N	\N	\N	\N
2681	2289	2	\N	\N	\N	\N	\N	\N
2682	2290	2	\N	\N	\N	\N	\N	\N
2683	2291	2	\N	\N	\N	\N	\N	\N
2684	2293	2	\N	\N	\N	\N	\N	\N
2685	2295	2	\N	\N	\N	\N	\N	\N
2686	2296	2	\N	\N	\N	\N	\N	\N
2687	2297	2	\N	\N	\N	\N	\N	\N
2688	2298	2	\N	\N	\N	\N	\N	\N
2689	2299	2	\N	\N	\N	\N	\N	\N
2690	2300	2	\N	\N	\N	\N	\N	\N
2691	2303	2	\N	\N	\N	\N	\N	\N
2692	2304	2	\N	\N	\N	\N	\N	\N
2693	2305	2	\N	\N	\N	\N	\N	\N
2694	2306	2	\N	\N	\N	\N	\N	\N
2695	2307	2	\N	\N	\N	\N	\N	\N
2696	2308	2	\N	\N	\N	\N	\N	\N
2697	2309	2	\N	\N	\N	\N	\N	\N
2698	2310	2	\N	\N	\N	\N	\N	\N
2699	2311	2	\N	\N	\N	\N	\N	\N
2700	2312	2	\N	\N	\N	\N	\N	\N
2701	2313	2	\N	\N	\N	\N	\N	\N
2702	2314	2	\N	\N	\N	\N	\N	\N
2703	2315	2	\N	\N	\N	\N	\N	\N
2704	2316	2	\N	\N	\N	\N	\N	\N
2705	2317	2	\N	\N	\N	\N	\N	\N
2706	2318	2	\N	\N	\N	\N	\N	\N
2707	2320	2	\N	\N	\N	\N	\N	\N
2708	2321	2	\N	\N	\N	\N	\N	\N
2709	2323	2	\N	\N	\N	\N	\N	\N
2710	2324	2	\N	\N	\N	\N	\N	\N
2711	2325	2	\N	\N	\N	\N	\N	\N
2712	2327	2	\N	\N	\N	\N	\N	\N
2713	2329	2	\N	\N	\N	\N	\N	\N
2714	2330	2	\N	\N	\N	\N	\N	\N
2715	2331	2	\N	\N	\N	\N	\N	\N
2716	2332	2	\N	\N	\N	\N	\N	\N
2717	2333	2	\N	\N	\N	\N	\N	\N
2718	2334	2	\N	\N	\N	\N	\N	\N
2719	2335	2	\N	\N	\N	\N	\N	\N
2720	2336	2	\N	\N	\N	\N	\N	\N
2721	2337	2	\N	\N	\N	\N	\N	\N
2722	2338	2	\N	\N	\N	\N	\N	\N
2723	2340	2	\N	\N	\N	\N	\N	\N
2724	2341	2	\N	\N	\N	\N	\N	\N
2725	2342	2	\N	\N	\N	\N	\N	\N
2726	2343	2	\N	\N	\N	\N	\N	\N
2727	2344	2	\N	\N	\N	\N	\N	\N
2728	2345	2	\N	\N	\N	\N	\N	\N
2729	2346	2	\N	\N	\N	\N	\N	\N
2730	2347	2	\N	\N	\N	\N	\N	\N
2731	2348	2	\N	\N	\N	\N	\N	\N
2732	2349	2	\N	\N	\N	\N	\N	\N
2733	2350	2	\N	\N	\N	\N	\N	\N
2734	2351	2	\N	\N	\N	\N	\N	\N
2735	2352	2	\N	\N	\N	\N	\N	\N
2736	2353	2	\N	\N	\N	\N	\N	\N
2737	2354	2	\N	\N	\N	\N	\N	\N
2738	2355	2	\N	\N	\N	\N	\N	\N
2739	2356	2	\N	\N	\N	\N	\N	\N
2740	2357	2	\N	\N	\N	\N	\N	\N
2741	2358	2	\N	\N	\N	\N	\N	\N
2742	2359	2	\N	\N	\N	\N	\N	\N
2743	2360	2	\N	\N	\N	\N	\N	\N
2744	2361	2	\N	\N	\N	\N	\N	\N
2745	2362	2	\N	\N	\N	\N	\N	\N
2746	2363	2	\N	\N	\N	\N	\N	\N
2747	2364	2	\N	\N	\N	\N	\N	\N
2748	2366	2	\N	\N	\N	\N	\N	\N
2749	2367	2	\N	\N	\N	\N	\N	\N
2750	2368	2	\N	\N	\N	\N	\N	\N
2751	2369	2	\N	\N	\N	\N	\N	\N
2752	2370	2	\N	\N	\N	\N	\N	\N
2753	2371	2	\N	\N	\N	\N	\N	\N
2754	2372	2	\N	\N	\N	\N	\N	\N
2755	2373	2	\N	\N	\N	\N	\N	\N
2756	2374	2	\N	\N	\N	\N	\N	\N
2757	2375	2	\N	\N	\N	\N	\N	\N
2758	2376	2	\N	\N	\N	\N	\N	\N
2759	2377	2	\N	\N	\N	\N	\N	\N
2760	2378	2	\N	\N	\N	\N	\N	\N
2761	2379	2	\N	\N	\N	\N	\N	\N
2762	2380	2	\N	\N	\N	\N	\N	\N
2763	2381	2	\N	\N	\N	\N	\N	\N
2764	2382	2	\N	\N	\N	\N	\N	\N
2765	2383	2	\N	\N	\N	\N	\N	\N
2766	2384	2	\N	\N	\N	\N	\N	\N
2767	2385	2	\N	\N	\N	\N	\N	\N
2768	2386	2	\N	\N	\N	\N	\N	\N
2769	2387	2	\N	\N	\N	\N	\N	\N
2770	2389	2	\N	\N	\N	\N	\N	\N
2771	2390	2	\N	\N	\N	\N	\N	\N
2772	2391	2	\N	\N	\N	\N	\N	\N
2773	2392	2	\N	\N	\N	\N	\N	\N
2774	2394	2	\N	\N	\N	\N	\N	\N
2775	2395	2	\N	\N	\N	\N	\N	\N
2776	2396	2	\N	\N	\N	\N	\N	\N
2777	2397	2	\N	\N	\N	\N	\N	\N
2778	2398	2	\N	\N	\N	\N	\N	\N
2779	2399	2	\N	\N	\N	\N	\N	\N
2780	2400	2	\N	\N	\N	\N	\N	\N
2781	2402	2	\N	\N	\N	\N	\N	\N
2782	2403	2	\N	\N	\N	\N	\N	\N
2783	2404	2	\N	\N	\N	\N	\N	\N
2784	2405	2	\N	\N	\N	\N	\N	\N
2785	2406	2	\N	\N	\N	\N	\N	\N
2786	2407	2	\N	\N	\N	\N	\N	\N
2787	2408	2	\N	\N	\N	\N	\N	\N
2788	2409	2	\N	\N	\N	\N	\N	\N
2789	2410	2	\N	\N	\N	\N	\N	\N
2790	2411	2	\N	\N	\N	\N	\N	\N
2791	2412	2	\N	\N	\N	\N	\N	\N
2792	2413	2	\N	\N	\N	\N	\N	\N
2793	2414	2	\N	\N	\N	\N	\N	\N
2794	2415	2	\N	\N	\N	\N	\N	\N
2795	2416	2	\N	\N	\N	\N	\N	\N
2796	2418	2	\N	\N	\N	\N	\N	\N
2797	2419	2	\N	\N	\N	\N	\N	\N
2798	2420	2	\N	\N	\N	\N	\N	\N
2799	2421	2	\N	\N	\N	\N	\N	\N
2800	2422	2	\N	\N	\N	\N	\N	\N
2801	2423	2	\N	\N	\N	\N	\N	\N
2802	2424	2	\N	\N	\N	\N	\N	\N
2803	2425	2	\N	\N	\N	\N	\N	\N
2804	2426	2	\N	\N	\N	\N	\N	\N
2805	2427	2	\N	\N	\N	\N	\N	\N
2806	2428	2	\N	\N	\N	\N	\N	\N
2807	2429	2	\N	\N	\N	\N	\N	\N
2808	2430	2	\N	\N	\N	\N	\N	\N
2809	2432	2	\N	\N	\N	\N	\N	\N
2810	2433	2	\N	\N	\N	\N	\N	\N
2811	2434	2	\N	\N	\N	\N	\N	\N
2812	2435	2	\N	\N	\N	\N	\N	\N
2813	2436	2	\N	\N	\N	\N	\N	\N
2814	2437	2	\N	\N	\N	\N	\N	\N
2815	2438	2	\N	\N	\N	\N	\N	\N
2816	2439	2	\N	\N	\N	\N	\N	\N
2817	2440	2	\N	\N	\N	\N	\N	\N
2818	2441	2	\N	\N	\N	\N	\N	\N
2819	2443	2	\N	\N	\N	\N	\N	\N
2820	2444	2	\N	\N	\N	\N	\N	\N
2821	2445	2	\N	\N	\N	\N	\N	\N
2822	2446	2	\N	\N	\N	\N	\N	\N
2823	2447	2	\N	\N	\N	\N	\N	\N
2824	2448	2	\N	\N	\N	\N	\N	\N
2825	2450	2	\N	\N	\N	\N	\N	\N
2826	2452	2	\N	\N	\N	\N	\N	\N
2827	2453	2	\N	\N	\N	\N	\N	\N
2828	2454	2	\N	\N	\N	\N	\N	\N
2829	2455	2	\N	\N	\N	\N	\N	\N
2830	2456	2	\N	\N	\N	\N	\N	\N
2831	2457	2	\N	\N	\N	\N	\N	\N
2832	2458	2	\N	\N	\N	\N	\N	\N
2833	2459	2	\N	\N	\N	\N	\N	\N
2834	2460	2	\N	\N	\N	\N	\N	\N
2835	2461	2	\N	\N	\N	\N	\N	\N
2836	2462	2	\N	\N	\N	\N	\N	\N
2837	2464	2	\N	\N	\N	\N	\N	\N
2838	2465	2	\N	\N	\N	\N	\N	\N
2839	2466	2	\N	\N	\N	\N	\N	\N
2840	2467	2	\N	\N	\N	\N	\N	\N
2841	2468	2	\N	\N	\N	\N	\N	\N
2842	2469	2	\N	\N	\N	\N	\N	\N
2843	2470	2	\N	\N	\N	\N	\N	\N
2844	2471	2	\N	\N	\N	\N	\N	\N
2845	2472	2	\N	\N	\N	\N	\N	\N
2846	2473	2	\N	\N	\N	\N	\N	\N
2847	2474	2	\N	\N	\N	\N	\N	\N
2848	2475	2	\N	\N	\N	\N	\N	\N
2849	2476	2	\N	\N	\N	\N	\N	\N
2850	2477	2	\N	\N	\N	\N	\N	\N
2851	2478	2	\N	\N	\N	\N	\N	\N
2852	2479	2	\N	\N	\N	\N	\N	\N
2853	2480	2	\N	\N	\N	\N	\N	\N
2854	2481	2	\N	\N	\N	\N	\N	\N
2855	2482	2	\N	\N	\N	\N	\N	\N
2856	2483	2	\N	\N	\N	\N	\N	\N
2857	2484	2	\N	\N	\N	\N	\N	\N
2858	2485	2	\N	\N	\N	\N	\N	\N
2859	2486	2	\N	\N	\N	\N	\N	\N
2860	2487	2	\N	\N	\N	\N	\N	\N
2861	2488	2	\N	\N	\N	\N	\N	\N
2862	2489	2	\N	\N	\N	\N	\N	\N
2863	2490	2	\N	\N	\N	\N	\N	\N
2864	2491	2	\N	\N	\N	\N	\N	\N
2865	2492	2	\N	\N	\N	\N	\N	\N
2866	2493	2	\N	\N	\N	\N	\N	\N
2867	2495	2	\N	\N	\N	\N	\N	\N
2868	2496	2	\N	\N	\N	\N	\N	\N
2869	2497	2	\N	\N	\N	\N	\N	\N
2870	2498	2	\N	\N	\N	\N	\N	\N
2871	2499	2	\N	\N	\N	\N	\N	\N
2872	2500	2	\N	\N	\N	\N	\N	\N
2873	2501	2	\N	\N	\N	\N	\N	\N
2874	2502	2	\N	\N	\N	\N	\N	\N
2875	2503	2	\N	\N	\N	\N	\N	\N
2876	2504	2	\N	\N	\N	\N	\N	\N
2877	2505	2	\N	\N	\N	\N	\N	\N
2878	2506	2	\N	\N	\N	\N	\N	\N
2879	2507	2	\N	\N	\N	\N	\N	\N
2880	2508	2	\N	\N	\N	\N	\N	\N
2881	2509	2	\N	\N	\N	\N	\N	\N
2882	2510	2	\N	\N	\N	\N	\N	\N
2883	2511	2	\N	\N	\N	\N	\N	\N
2884	2512	2	\N	\N	\N	\N	\N	\N
2885	2513	2	\N	\N	\N	\N	\N	\N
2886	2514	2	\N	\N	\N	\N	\N	\N
2887	2515	2	\N	\N	\N	\N	\N	\N
2888	2516	2	\N	\N	\N	\N	\N	\N
2889	2517	2	\N	\N	\N	\N	\N	\N
2890	2518	2	\N	\N	\N	\N	\N	\N
2891	2519	2	\N	\N	\N	\N	\N	\N
2892	2520	2	\N	\N	\N	\N	\N	\N
2893	2521	2	\N	\N	\N	\N	\N	\N
2894	2522	2	\N	\N	\N	\N	\N	\N
2895	2523	2	\N	\N	\N	\N	\N	\N
2896	2524	2	\N	\N	\N	\N	\N	\N
2897	2525	2	\N	\N	\N	\N	\N	\N
2898	2526	2	\N	\N	\N	\N	\N	\N
2899	2527	2	\N	\N	\N	\N	\N	\N
2900	2528	2	\N	\N	\N	\N	\N	\N
2901	2529	2	\N	\N	\N	\N	\N	\N
2902	2530	2	\N	\N	\N	\N	\N	\N
2903	2531	2	\N	\N	\N	\N	\N	\N
2904	2532	2	\N	\N	\N	\N	\N	\N
2905	2533	2	\N	\N	\N	\N	\N	\N
2906	2534	2	\N	\N	\N	\N	\N	\N
2907	2535	2	\N	\N	\N	\N	\N	\N
2908	2536	2	\N	\N	\N	\N	\N	\N
2909	2537	2	\N	\N	\N	\N	\N	\N
2910	2538	2	\N	\N	\N	\N	\N	\N
2911	2539	2	\N	\N	\N	\N	\N	\N
2912	2540	2	\N	\N	\N	\N	\N	\N
2913	2541	2	\N	\N	\N	\N	\N	\N
2914	2542	2	\N	\N	\N	\N	\N	\N
2915	2543	2	\N	\N	\N	\N	\N	\N
2916	2544	2	\N	\N	\N	\N	\N	\N
2917	2545	2	\N	\N	\N	\N	\N	\N
2918	2546	2	\N	\N	\N	\N	\N	\N
2919	2547	2	\N	\N	\N	\N	\N	\N
2920	2548	2	\N	\N	\N	\N	\N	\N
2921	2549	2	\N	\N	\N	\N	\N	\N
2922	2550	2	\N	\N	\N	\N	\N	\N
2923	2551	2	\N	\N	\N	\N	\N	\N
2924	2552	2	\N	\N	\N	\N	\N	\N
2925	2553	2	\N	\N	\N	\N	\N	\N
2926	2554	2	\N	\N	\N	\N	\N	\N
2927	2555	2	\N	\N	\N	\N	\N	\N
2928	2556	2	\N	\N	\N	\N	\N	\N
2929	2557	2	\N	\N	\N	\N	\N	\N
2930	2558	2	\N	\N	\N	\N	\N	\N
2931	2559	2	\N	\N	\N	\N	\N	\N
2932	2560	2	\N	\N	\N	\N	\N	\N
2933	2561	2	\N	\N	\N	\N	\N	\N
2934	2562	2	\N	\N	\N	\N	\N	\N
2935	2563	2	\N	\N	\N	\N	\N	\N
2936	2564	2	\N	\N	\N	\N	\N	\N
2937	2565	2	\N	\N	\N	\N	\N	\N
2938	2566	2	\N	\N	\N	\N	\N	\N
2939	2567	2	\N	\N	\N	\N	\N	\N
2940	2568	2	\N	\N	\N	\N	\N	\N
2941	2569	2	\N	\N	\N	\N	\N	\N
2942	2570	2	\N	\N	\N	\N	\N	\N
2943	2571	2	\N	\N	\N	\N	\N	\N
2944	2572	2	\N	\N	\N	\N	\N	\N
2945	2573	2	\N	\N	\N	\N	\N	\N
2946	2575	2	\N	\N	\N	\N	\N	\N
2947	2576	2	\N	\N	\N	\N	\N	\N
2948	2577	2	\N	\N	\N	\N	\N	\N
2949	2578	2	\N	\N	\N	\N	\N	\N
2950	2579	2	\N	\N	\N	\N	\N	\N
2951	2580	2	\N	\N	\N	\N	\N	\N
2952	2581	2	\N	\N	\N	\N	\N	\N
2953	2582	2	\N	\N	\N	\N	\N	\N
2954	2583	2	\N	\N	\N	\N	\N	\N
2955	2584	2	\N	\N	\N	\N	\N	\N
2956	2585	2	\N	\N	\N	\N	\N	\N
2957	2586	2	\N	\N	\N	\N	\N	\N
2958	2587	2	\N	\N	\N	\N	\N	\N
2959	2588	2	\N	\N	\N	\N	\N	\N
2960	2589	2	\N	\N	\N	\N	\N	\N
2961	2590	2	\N	\N	\N	\N	\N	\N
2962	2591	2	\N	\N	\N	\N	\N	\N
2963	2592	2	\N	\N	\N	\N	\N	\N
2964	2593	2	\N	\N	\N	\N	\N	\N
2965	2594	2	\N	\N	\N	\N	\N	\N
2966	2595	2	\N	\N	\N	\N	\N	\N
2967	2596	2	\N	\N	\N	\N	\N	\N
2968	2597	2	\N	\N	\N	\N	\N	\N
2969	2598	2	\N	\N	\N	\N	\N	\N
2970	2599	2	\N	\N	\N	\N	\N	\N
2971	2600	2	\N	\N	\N	\N	\N	\N
2972	2601	2	\N	\N	\N	\N	\N	\N
2973	2602	2	\N	\N	\N	\N	\N	\N
2974	2603	2	\N	\N	\N	\N	\N	\N
2975	2604	2	\N	\N	\N	\N	\N	\N
2976	2605	2	\N	\N	\N	\N	\N	\N
2977	2606	2	\N	\N	\N	\N	\N	\N
2978	2607	2	\N	\N	\N	\N	\N	\N
2979	2608	2	\N	\N	\N	\N	\N	\N
2980	2609	2	\N	\N	\N	\N	\N	\N
2981	2610	2	\N	\N	\N	\N	\N	\N
2982	2611	2	\N	\N	\N	\N	\N	\N
2983	2612	2	\N	\N	\N	\N	\N	\N
2984	2614	2	\N	\N	\N	\N	\N	\N
2985	2615	2	\N	\N	\N	\N	\N	\N
2986	2616	2	\N	\N	\N	\N	\N	\N
2987	2617	2	\N	\N	\N	\N	\N	\N
2988	2618	2	\N	\N	\N	\N	\N	\N
2989	2619	2	\N	\N	\N	\N	\N	\N
2990	2620	2	\N	\N	\N	\N	\N	\N
2991	2621	2	\N	\N	\N	\N	\N	\N
2992	2624	2	\N	\N	\N	\N	\N	\N
2993	2625	2	\N	\N	\N	\N	\N	\N
2994	2626	2	\N	\N	\N	\N	\N	\N
2995	2627	2	\N	\N	\N	\N	\N	\N
2996	2628	2	\N	\N	\N	\N	\N	\N
2997	2629	2	\N	\N	\N	\N	\N	\N
2998	2630	2	\N	\N	\N	\N	\N	\N
2999	2631	2	\N	\N	\N	\N	\N	\N
3000	2632	2	\N	\N	\N	\N	\N	\N
3001	2633	2	\N	\N	\N	\N	\N	\N
3002	2634	2	\N	\N	\N	\N	\N	\N
3003	2635	2	\N	\N	\N	\N	\N	\N
3004	2636	2	\N	\N	\N	\N	\N	\N
3005	2637	2	\N	\N	\N	\N	\N	\N
3006	2638	2	\N	\N	\N	\N	\N	\N
3007	2639	2	\N	\N	\N	\N	\N	\N
3008	2640	2	\N	\N	\N	\N	\N	\N
3009	2641	2	\N	\N	\N	\N	\N	\N
3010	2642	2	\N	\N	\N	\N	\N	\N
3011	2643	2	\N	\N	\N	\N	\N	\N
3012	2644	2	\N	\N	\N	\N	\N	\N
3013	2645	2	\N	\N	\N	\N	\N	\N
3014	2646	2	\N	\N	\N	\N	\N	\N
3015	2647	2	\N	\N	\N	\N	\N	\N
3016	2648	2	\N	\N	\N	\N	\N	\N
3017	2649	2	\N	\N	\N	\N	\N	\N
3018	2650	2	\N	\N	\N	\N	\N	\N
3019	2651	2	\N	\N	\N	\N	\N	\N
3020	2652	2	\N	\N	\N	\N	\N	\N
3021	2653	2	\N	\N	\N	\N	\N	\N
3022	2654	2	\N	\N	\N	\N	\N	\N
3023	2655	2	\N	\N	\N	\N	\N	\N
3024	2656	2	\N	\N	\N	\N	\N	\N
3025	2657	2	\N	\N	\N	\N	\N	\N
3026	2658	2	\N	\N	\N	\N	\N	\N
3027	2659	2	\N	\N	\N	\N	\N	\N
3028	2660	2	\N	\N	\N	\N	\N	\N
3029	2661	2	\N	\N	\N	\N	\N	\N
3030	2662	2	\N	\N	\N	\N	\N	\N
3031	2663	2	\N	\N	\N	\N	\N	\N
3032	2664	2	\N	\N	\N	\N	\N	\N
3033	2665	2	\N	\N	\N	\N	\N	\N
3034	2666	2	\N	\N	\N	\N	\N	\N
3035	2667	2	\N	\N	\N	\N	\N	\N
3036	2668	2	\N	\N	\N	\N	\N	\N
3037	2669	2	\N	\N	\N	\N	\N	\N
3038	2670	2	\N	\N	\N	\N	\N	\N
3039	2671	2	\N	\N	\N	\N	\N	\N
3040	2672	2	\N	\N	\N	\N	\N	\N
3041	2673	2	\N	\N	\N	\N	\N	\N
3042	2674	2	\N	\N	\N	\N	\N	\N
3043	2675	2	\N	\N	\N	\N	\N	\N
3044	2676	2	\N	\N	\N	\N	\N	\N
3045	2677	2	\N	\N	\N	\N	\N	\N
3046	2678	2	\N	\N	\N	\N	\N	\N
3047	2679	2	\N	\N	\N	\N	\N	\N
3048	2680	2	\N	\N	\N	\N	\N	\N
3049	2681	2	\N	\N	\N	\N	\N	\N
3050	2682	2	\N	\N	\N	\N	\N	\N
3051	2683	2	\N	\N	\N	\N	\N	\N
3052	2684	2	\N	\N	\N	\N	\N	\N
3053	2685	2	\N	\N	\N	\N	\N	\N
3054	2686	2	\N	\N	\N	\N	\N	\N
3055	2687	2	\N	\N	\N	\N	\N	\N
3056	2688	2	\N	\N	\N	\N	\N	\N
3057	2689	2	\N	\N	\N	\N	\N	\N
3058	2690	2	\N	\N	\N	\N	\N	\N
3059	2691	2	\N	\N	\N	\N	\N	\N
3060	2692	2	\N	\N	\N	\N	\N	\N
3061	2693	2	\N	\N	\N	\N	\N	\N
3062	2694	2	\N	\N	\N	\N	\N	\N
3063	2695	2	\N	\N	\N	\N	\N	\N
3064	2696	2	\N	\N	\N	\N	\N	\N
3065	2698	2	\N	\N	\N	\N	\N	\N
3066	2699	2	\N	\N	\N	\N	\N	\N
3067	2701	2	\N	\N	\N	\N	\N	\N
3068	2702	2	\N	\N	\N	\N	\N	\N
3069	2703	2	\N	\N	\N	\N	\N	\N
3070	2704	2	\N	\N	\N	\N	\N	\N
3071	2705	2	\N	\N	\N	\N	\N	\N
3072	2706	2	\N	\N	\N	\N	\N	\N
3073	2707	2	\N	\N	\N	\N	\N	\N
3074	2708	2	\N	\N	\N	\N	\N	\N
3075	2709	2	\N	\N	\N	\N	\N	\N
3076	2710	2	\N	\N	\N	\N	\N	\N
3077	2711	2	\N	\N	\N	\N	\N	\N
3078	2712	2	\N	\N	\N	\N	\N	\N
3079	2713	2	\N	\N	\N	\N	\N	\N
3080	2714	2	\N	\N	\N	\N	\N	\N
3081	2715	2	\N	\N	\N	\N	\N	\N
3082	2717	2	\N	\N	\N	\N	\N	\N
3083	2718	2	\N	\N	\N	\N	\N	\N
3084	2719	2	\N	\N	\N	\N	\N	\N
3085	2720	2	\N	\N	\N	\N	\N	\N
3086	2721	2	\N	\N	\N	\N	\N	\N
3087	2722	2	\N	\N	\N	\N	\N	\N
3088	2723	2	\N	\N	\N	\N	\N	\N
3089	2724	2	\N	\N	\N	\N	\N	\N
3090	2725	2	\N	\N	\N	\N	\N	\N
3091	2726	2	\N	\N	\N	\N	\N	\N
3092	2727	2	\N	\N	\N	\N	\N	\N
3093	2729	2	\N	\N	\N	\N	\N	\N
3094	2730	2	\N	\N	\N	\N	\N	\N
3095	2731	2	\N	\N	\N	\N	\N	\N
3096	2732	2	\N	\N	\N	\N	\N	\N
3097	2733	2	\N	\N	\N	\N	\N	\N
3098	2734	2	\N	\N	\N	\N	\N	\N
3099	2735	2	\N	\N	\N	\N	\N	\N
3100	2736	2	\N	\N	\N	\N	\N	\N
3101	2737	2	\N	\N	\N	\N	\N	\N
3102	2738	2	\N	\N	\N	\N	\N	\N
3103	2739	2	\N	\N	\N	\N	\N	\N
3104	2740	2	\N	\N	\N	\N	\N	\N
3105	2741	2	\N	\N	\N	\N	\N	\N
3106	2742	2	\N	\N	\N	\N	\N	\N
3107	2743	2	\N	\N	\N	\N	\N	\N
3108	2744	2	\N	\N	\N	\N	\N	\N
3109	2746	2	\N	\N	\N	\N	\N	\N
3110	2747	2	\N	\N	\N	\N	\N	\N
3111	2748	2	\N	\N	\N	\N	\N	\N
3112	2749	2	\N	\N	\N	\N	\N	\N
3113	2750	2	\N	\N	\N	\N	\N	\N
3114	2751	2	\N	\N	\N	\N	\N	\N
3115	2752	2	\N	\N	\N	\N	\N	\N
3116	2753	2	\N	\N	\N	\N	\N	\N
3117	2754	2	\N	\N	\N	\N	\N	\N
3118	2755	2	\N	\N	\N	\N	\N	\N
3119	2756	2	\N	\N	\N	\N	\N	\N
3120	2757	2	\N	\N	\N	\N	\N	\N
3121	2758	2	\N	\N	\N	\N	\N	\N
3122	2759	2	\N	\N	\N	\N	\N	\N
3123	2760	2	\N	\N	\N	\N	\N	\N
3124	2761	2	\N	\N	\N	\N	\N	\N
3125	2762	2	\N	\N	\N	\N	\N	\N
3126	2763	2	\N	\N	\N	\N	\N	\N
3127	2764	2	\N	\N	\N	\N	\N	\N
3128	2765	2	\N	\N	\N	\N	\N	\N
3129	2766	2	\N	\N	\N	\N	\N	\N
3130	2767	2	\N	\N	\N	\N	\N	\N
3131	2768	2	\N	\N	\N	\N	\N	\N
3132	2769	2	\N	\N	\N	\N	\N	\N
3133	2770	2	\N	\N	\N	\N	\N	\N
3134	2771	2	\N	\N	\N	\N	\N	\N
3135	2772	2	\N	\N	\N	\N	\N	\N
3136	2773	2	\N	\N	\N	\N	\N	\N
3137	2774	2	\N	\N	\N	\N	\N	\N
3138	2775	2	\N	\N	\N	\N	\N	\N
3139	2776	2	\N	\N	\N	\N	\N	\N
3140	2777	2	\N	\N	\N	\N	\N	\N
3141	2778	2	\N	\N	\N	\N	\N	\N
3142	2779	2	\N	\N	\N	\N	\N	\N
3143	2780	2	\N	\N	\N	\N	\N	\N
3144	2825	2	\N	\N	\N	\N	\N	\N
3145	2826	2	\N	\N	\N	\N	\N	\N
3146	2827	2	\N	\N	\N	\N	\N	\N
3147	2828	2	\N	\N	\N	\N	\N	\N
3148	2829	2	\N	\N	\N	\N	\N	\N
3149	2830	2	\N	\N	\N	\N	\N	\N
3150	2831	2	\N	\N	\N	\N	\N	\N
3151	2833	2	\N	\N	\N	\N	\N	\N
3152	2834	2	\N	\N	\N	\N	\N	\N
3153	2835	2	\N	\N	\N	\N	\N	\N
3154	2836	2	\N	\N	\N	\N	\N	\N
3155	2837	2	\N	\N	\N	\N	\N	\N
3156	2838	2	\N	\N	\N	\N	\N	\N
3157	2839	2	\N	\N	\N	\N	\N	\N
3158	2840	2	\N	\N	\N	\N	\N	\N
3159	2841	2	\N	\N	\N	\N	\N	\N
3160	2842	2	\N	\N	\N	\N	\N	\N
3161	2843	2	\N	\N	\N	\N	\N	\N
3162	2844	2	\N	\N	\N	\N	\N	\N
3163	2845	2	\N	\N	\N	\N	\N	\N
3164	2846	2	\N	\N	\N	\N	\N	\N
3165	2847	2	\N	\N	\N	\N	\N	\N
3166	2848	2	\N	\N	\N	\N	\N	\N
3167	2849	2	\N	\N	\N	\N	\N	\N
3168	2850	2	\N	\N	\N	\N	\N	\N
3169	2852	2	\N	\N	\N	\N	\N	\N
3170	2853	2	\N	\N	\N	\N	\N	\N
3171	2854	2	\N	\N	\N	\N	\N	\N
3172	2855	2	\N	\N	\N	\N	\N	\N
3173	2856	2	\N	\N	\N	\N	\N	\N
3174	2857	2	\N	\N	\N	\N	\N	\N
3175	2858	2	\N	\N	\N	\N	\N	\N
3176	2859	2	\N	\N	\N	\N	\N	\N
3177	2861	2	\N	\N	\N	\N	\N	\N
3178	2862	2	\N	\N	\N	\N	\N	\N
3179	2866	2	\N	\N	\N	\N	\N	\N
3180	2867	2	\N	\N	\N	\N	\N	\N
3181	2868	2	\N	\N	\N	\N	\N	\N
3182	2869	2	\N	\N	\N	\N	\N	\N
3183	2870	2	\N	\N	\N	\N	\N	\N
3184	2872	2	\N	\N	\N	\N	\N	\N
3185	2873	2	\N	\N	\N	\N	\N	\N
3186	2874	2	\N	\N	\N	\N	\N	\N
3187	2875	2	\N	\N	\N	\N	\N	\N
3188	2876	2	\N	\N	\N	\N	\N	\N
3189	2877	2	\N	\N	\N	\N	\N	\N
3190	2878	2	\N	\N	\N	\N	\N	\N
3191	2879	2	\N	\N	\N	\N	\N	\N
3192	2880	2	\N	\N	\N	\N	\N	\N
3193	1	3	\N	\N	\N	\N	\N	\N
3194	2	3	\N	\N	\N	\N	\N	\N
3195	3	3	\N	\N	\N	\N	\N	\N
3196	4	3	\N	\N	\N	\N	\N	\N
3197	5	3	\N	\N	\N	\N	\N	\N
3198	6	3	\N	\N	\N	\N	\N	\N
3199	8	3	\N	\N	\N	\N	\N	\N
3200	9	3	\N	\N	\N	\N	\N	\N
3201	10	3	\N	\N	\N	\N	\N	\N
3202	13	3	\N	\N	\N	\N	\N	\N
3203	14	3	\N	\N	\N	\N	\N	\N
3204	16	3	\N	\N	\N	\N	\N	\N
3205	18	3	\N	\N	\N	\N	\N	\N
3206	25	3	\N	\N	\N	\N	\N	\N
3207	31	3	\N	\N	\N	\N	\N	\N
3208	32	3	\N	\N	\N	\N	\N	\N
3209	34	3	\N	\N	\N	\N	\N	\N
3210	35	3	\N	\N	\N	\N	\N	\N
3211	37	3	\N	\N	\N	\N	\N	\N
3212	41	3	\N	\N	\N	\N	\N	\N
3213	42	3	\N	\N	\N	\N	\N	\N
3214	43	3	\N	\N	\N	\N	\N	\N
3215	45	3	\N	\N	\N	\N	\N	\N
3216	49	3	\N	\N	\N	\N	\N	\N
3217	50	3	\N	\N	\N	\N	\N	\N
3218	51	3	\N	\N	\N	\N	\N	\N
3219	52	3	\N	\N	\N	\N	\N	\N
3220	53	3	\N	\N	\N	\N	\N	\N
3221	56	3	\N	\N	\N	\N	\N	\N
3222	57	3	\N	\N	\N	\N	\N	\N
3223	58	3	\N	\N	\N	\N	\N	\N
3224	61	3	\N	\N	\N	\N	\N	\N
3225	63	3	\N	\N	\N	\N	\N	\N
3226	64	3	\N	\N	\N	\N	\N	\N
3227	66	3	\N	\N	\N	\N	\N	\N
3228	67	3	\N	\N	\N	\N	\N	\N
3229	68	3	\N	\N	\N	\N	\N	\N
3230	69	3	\N	\N	\N	\N	\N	\N
3231	70	3	\N	\N	\N	\N	\N	\N
3232	71	3	\N	\N	\N	\N	\N	\N
3233	72	3	\N	\N	\N	\N	\N	\N
3234	74	3	\N	\N	\N	\N	\N	\N
3235	75	3	\N	\N	\N	\N	\N	\N
3236	76	3	\N	\N	\N	\N	\N	\N
3237	77	3	\N	\N	\N	\N	\N	\N
3238	78	3	\N	\N	\N	\N	\N	\N
3239	79	3	\N	\N	\N	\N	\N	\N
3240	80	3	\N	\N	\N	\N	\N	\N
3241	83	3	\N	\N	\N	\N	\N	\N
3242	84	3	\N	\N	\N	\N	\N	\N
3243	87	3	\N	\N	\N	\N	\N	\N
3244	88	3	\N	\N	\N	\N	\N	\N
3245	89	3	\N	\N	\N	\N	\N	\N
3246	90	3	\N	\N	\N	\N	\N	\N
3247	93	3	\N	\N	\N	\N	\N	\N
3248	99	3	\N	\N	\N	\N	\N	\N
3249	101	3	\N	\N	\N	\N	\N	\N
3250	103	3	\N	\N	\N	\N	\N	\N
3251	109	3	\N	\N	\N	\N	\N	\N
3252	113	3	\N	\N	\N	\N	\N	\N
3253	114	3	\N	\N	\N	\N	\N	\N
3254	117	3	\N	\N	\N	\N	\N	\N
3255	118	3	\N	\N	\N	\N	\N	\N
3256	120	3	\N	\N	\N	\N	\N	\N
3257	121	3	\N	\N	\N	\N	\N	\N
3258	122	3	\N	\N	\N	\N	\N	\N
3259	125	3	\N	\N	\N	\N	\N	\N
3260	128	3	\N	\N	\N	\N	\N	\N
3261	129	3	\N	\N	\N	\N	\N	\N
3262	130	3	\N	\N	\N	\N	\N	\N
3263	131	3	\N	\N	\N	\N	\N	\N
3264	132	3	\N	\N	\N	\N	\N	\N
3265	134	3	\N	\N	\N	\N	\N	\N
3266	135	3	\N	\N	\N	\N	\N	\N
3267	138	3	\N	\N	\N	\N	\N	\N
3268	141	3	\N	\N	\N	\N	\N	\N
3269	142	3	\N	\N	\N	\N	\N	\N
3270	145	3	\N	\N	\N	\N	\N	\N
3271	148	3	\N	\N	\N	\N	\N	\N
3272	150	3	\N	\N	\N	\N	\N	\N
3273	151	3	\N	\N	\N	\N	\N	\N
3274	154	3	\N	\N	\N	\N	\N	\N
3275	159	3	\N	\N	\N	\N	\N	\N
3276	160	3	\N	\N	\N	\N	\N	\N
3277	161	3	\N	\N	\N	\N	\N	\N
3278	164	3	\N	\N	\N	\N	\N	\N
3279	168	3	\N	\N	\N	\N	\N	\N
3280	170	3	\N	\N	\N	\N	\N	\N
3281	174	3	\N	\N	\N	\N	\N	\N
3282	175	3	\N	\N	\N	\N	\N	\N
3283	181	3	\N	\N	\N	\N	\N	\N
3284	182	3	\N	\N	\N	\N	\N	\N
3285	199	3	\N	\N	\N	\N	\N	\N
3286	201	3	\N	\N	\N	\N	\N	\N
3287	205	3	\N	\N	\N	\N	\N	\N
3288	206	3	\N	\N	\N	\N	\N	\N
3289	212	3	\N	\N	\N	\N	\N	\N
3290	213	3	\N	\N	\N	\N	\N	\N
3291	215	3	\N	\N	\N	\N	\N	\N
3292	217	3	\N	\N	\N	\N	\N	\N
3293	218	3	\N	\N	\N	\N	\N	\N
3294	221	3	\N	\N	\N	\N	\N	\N
3295	224	3	\N	\N	\N	\N	\N	\N
3296	233	3	\N	\N	\N	\N	\N	\N
3297	234	3	\N	\N	\N	\N	\N	\N
3298	254	3	\N	\N	\N	\N	\N	\N
3299	257	3	\N	\N	\N	\N	\N	\N
3300	258	3	\N	\N	\N	\N	\N	\N
3301	260	3	\N	\N	\N	\N	\N	\N
3302	263	3	\N	\N	\N	\N	\N	\N
3303	268	3	\N	\N	\N	\N	\N	\N
3304	269	3	\N	\N	\N	\N	\N	\N
3305	275	3	\N	\N	\N	\N	\N	\N
3306	276	3	\N	\N	\N	\N	\N	\N
3307	278	3	\N	\N	\N	\N	\N	\N
3308	279	3	\N	\N	\N	\N	\N	\N
3309	287	3	\N	\N	\N	\N	\N	\N
3310	290	3	\N	\N	\N	\N	\N	\N
3311	291	3	\N	\N	\N	\N	\N	\N
3312	293	3	\N	\N	\N	\N	\N	\N
3313	295	3	\N	\N	\N	\N	\N	\N
3314	298	3	\N	\N	\N	\N	\N	\N
3315	304	3	\N	\N	\N	\N	\N	\N
3316	312	3	\N	\N	\N	\N	\N	\N
3317	313	3	\N	\N	\N	\N	\N	\N
3318	316	3	\N	\N	\N	\N	\N	\N
3319	317	3	\N	\N	\N	\N	\N	\N
3320	322	3	\N	\N	\N	\N	\N	\N
3321	323	3	\N	\N	\N	\N	\N	\N
3322	325	3	\N	\N	\N	\N	\N	\N
3323	328	3	\N	\N	\N	\N	\N	\N
3324	331	3	\N	\N	\N	\N	\N	\N
3325	333	3	\N	\N	\N	\N	\N	\N
3326	334	3	\N	\N	\N	\N	\N	\N
3327	337	3	\N	\N	\N	\N	\N	\N
3328	338	3	\N	\N	\N	\N	\N	\N
3329	341	3	\N	\N	\N	\N	\N	\N
3330	350	3	\N	\N	\N	\N	\N	\N
3331	353	3	\N	\N	\N	\N	\N	\N
3332	356	3	\N	\N	\N	\N	\N	\N
3333	360	3	\N	\N	\N	\N	\N	\N
3334	362	3	\N	\N	\N	\N	\N	\N
3335	366	3	\N	\N	\N	\N	\N	\N
3336	367	3	\N	\N	\N	\N	\N	\N
3337	370	3	\N	\N	\N	\N	\N	\N
3338	372	3	\N	\N	\N	\N	\N	\N
3339	374	3	\N	\N	\N	\N	\N	\N
3340	377	3	\N	\N	\N	\N	\N	\N
3341	382	3	\N	\N	\N	\N	\N	\N
3342	385	3	\N	\N	\N	\N	\N	\N
3343	386	3	\N	\N	\N	\N	\N	\N
3344	389	3	\N	\N	\N	\N	\N	\N
3345	400	3	\N	\N	\N	\N	\N	\N
3346	405	3	\N	\N	\N	\N	\N	\N
3347	406	3	\N	\N	\N	\N	\N	\N
3348	411	3	\N	\N	\N	\N	\N	\N
3349	415	3	\N	\N	\N	\N	\N	\N
3350	416	3	\N	\N	\N	\N	\N	\N
3351	426	3	\N	\N	\N	\N	\N	\N
3352	448	3	\N	\N	\N	\N	\N	\N
3353	450	3	\N	\N	\N	\N	\N	\N
3354	460	3	\N	\N	\N	\N	\N	\N
3355	461	3	\N	\N	\N	\N	\N	\N
3356	463	3	\N	\N	\N	\N	\N	\N
3357	467	3	\N	\N	\N	\N	\N	\N
3358	468	3	\N	\N	\N	\N	\N	\N
3359	470	3	\N	\N	\N	\N	\N	\N
3360	477	3	\N	\N	\N	\N	\N	\N
3361	495	3	\N	\N	\N	\N	\N	\N
3362	501	3	\N	\N	\N	\N	\N	\N
3363	502	3	\N	\N	\N	\N	\N	\N
3364	506	3	\N	\N	\N	\N	\N	\N
3365	512	3	\N	\N	\N	\N	\N	\N
3366	513	3	\N	\N	\N	\N	\N	\N
3367	520	3	\N	\N	\N	\N	\N	\N
3368	525	3	\N	\N	\N	\N	\N	\N
3369	536	3	\N	\N	\N	\N	\N	\N
3370	541	3	\N	\N	\N	\N	\N	\N
3371	543	3	\N	\N	\N	\N	\N	\N
3372	545	3	\N	\N	\N	\N	\N	\N
3373	549	3	\N	\N	\N	\N	\N	\N
3374	551	3	\N	\N	\N	\N	\N	\N
3375	558	3	\N	\N	\N	\N	\N	\N
3376	572	3	\N	\N	\N	\N	\N	\N
3377	573	3	\N	\N	\N	\N	\N	\N
3378	576	3	\N	\N	\N	\N	\N	\N
3379	584	3	\N	\N	\N	\N	\N	\N
3380	588	3	\N	\N	\N	\N	\N	\N
3381	594	3	\N	\N	\N	\N	\N	\N
3382	597	3	\N	\N	\N	\N	\N	\N
3383	601	3	\N	\N	\N	\N	\N	\N
3384	606	3	\N	\N	\N	\N	\N	\N
3385	623	3	\N	\N	\N	\N	\N	\N
3386	624	3	\N	\N	\N	\N	\N	\N
3387	625	3	\N	\N	\N	\N	\N	\N
3388	626	3	\N	\N	\N	\N	\N	\N
3389	627	3	\N	\N	\N	\N	\N	\N
3390	629	3	\N	\N	\N	\N	\N	\N
3391	633	3	\N	\N	\N	\N	\N	\N
3392	638	3	\N	\N	\N	\N	\N	\N
3393	643	3	\N	\N	\N	\N	\N	\N
3394	644	3	\N	\N	\N	\N	\N	\N
3395	654	3	\N	\N	\N	\N	\N	\N
3396	656	3	\N	\N	\N	\N	\N	\N
3397	659	3	\N	\N	\N	\N	\N	\N
3398	660	3	\N	\N	\N	\N	\N	\N
3399	666	3	\N	\N	\N	\N	\N	\N
3400	680	3	\N	\N	\N	\N	\N	\N
3401	693	3	\N	\N	\N	\N	\N	\N
3402	699	3	\N	\N	\N	\N	\N	\N
3403	702	3	\N	\N	\N	\N	\N	\N
3404	703	3	\N	\N	\N	\N	\N	\N
3405	706	3	\N	\N	\N	\N	\N	\N
3406	707	3	\N	\N	\N	\N	\N	\N
3407	708	3	\N	\N	\N	\N	\N	\N
3408	719	3	\N	\N	\N	\N	\N	\N
3409	720	3	\N	\N	\N	\N	\N	\N
3410	723	3	\N	\N	\N	\N	\N	\N
3411	730	3	\N	\N	\N	\N	\N	\N
3412	733	3	\N	\N	\N	\N	\N	\N
3413	734	3	\N	\N	\N	\N	\N	\N
3414	747	3	\N	\N	\N	\N	\N	\N
3415	760	3	\N	\N	\N	\N	\N	\N
3416	764	3	\N	\N	\N	\N	\N	\N
3417	766	3	\N	\N	\N	\N	\N	\N
3418	778	3	\N	\N	\N	\N	\N	\N
3419	781	3	\N	\N	\N	\N	\N	\N
3420	785	3	\N	\N	\N	\N	\N	\N
3421	788	3	\N	\N	\N	\N	\N	\N
3422	789	3	\N	\N	\N	\N	\N	\N
3423	795	3	\N	\N	\N	\N	\N	\N
3424	796	3	\N	\N	\N	\N	\N	\N
3425	797	3	\N	\N	\N	\N	\N	\N
3426	799	3	\N	\N	\N	\N	\N	\N
3427	812	3	\N	\N	\N	\N	\N	\N
3428	813	3	\N	\N	\N	\N	\N	\N
3429	814	3	\N	\N	\N	\N	\N	\N
3430	815	3	\N	\N	\N	\N	\N	\N
3431	818	3	\N	\N	\N	\N	\N	\N
3432	819	3	\N	\N	\N	\N	\N	\N
3433	823	3	\N	\N	\N	\N	\N	\N
3434	825	3	\N	\N	\N	\N	\N	\N
3435	831	3	\N	\N	\N	\N	\N	\N
3436	833	3	\N	\N	\N	\N	\N	\N
3437	836	3	\N	\N	\N	\N	\N	\N
3438	837	3	\N	\N	\N	\N	\N	\N
3439	841	3	\N	\N	\N	\N	\N	\N
3440	853	3	\N	\N	\N	\N	\N	\N
3441	857	3	\N	\N	\N	\N	\N	\N
3442	859	3	\N	\N	\N	\N	\N	\N
3443	869	3	\N	\N	\N	\N	\N	\N
3444	870	3	\N	\N	\N	\N	\N	\N
3445	873	3	\N	\N	\N	\N	\N	\N
3446	890	3	\N	\N	\N	\N	\N	\N
3447	892	3	\N	\N	\N	\N	\N	\N
3448	894	3	\N	\N	\N	\N	\N	\N
3449	895	3	\N	\N	\N	\N	\N	\N
3450	898	3	\N	\N	\N	\N	\N	\N
3451	911	3	\N	\N	\N	\N	\N	\N
3452	912	3	\N	\N	\N	\N	\N	\N
3453	914	3	\N	\N	\N	\N	\N	\N
3454	916	3	\N	\N	\N	\N	\N	\N
3455	918	3	\N	\N	\N	\N	\N	\N
3456	920	3	\N	\N	\N	\N	\N	\N
3457	921	3	\N	\N	\N	\N	\N	\N
3458	924	3	\N	\N	\N	\N	\N	\N
3459	933	3	\N	\N	\N	\N	\N	\N
3460	934	3	\N	\N	\N	\N	\N	\N
3461	938	3	\N	\N	\N	\N	\N	\N
3462	939	3	\N	\N	\N	\N	\N	\N
3463	945	3	\N	\N	\N	\N	\N	\N
3464	948	3	\N	\N	\N	\N	\N	\N
3465	951	3	\N	\N	\N	\N	\N	\N
3466	954	3	\N	\N	\N	\N	\N	\N
3467	959	3	\N	\N	\N	\N	\N	\N
3468	960	3	\N	\N	\N	\N	\N	\N
3469	964	3	\N	\N	\N	\N	\N	\N
3470	965	3	\N	\N	\N	\N	\N	\N
3471	977	3	\N	\N	\N	\N	\N	\N
3472	978	3	\N	\N	\N	\N	\N	\N
3473	986	3	\N	\N	\N	\N	\N	\N
3474	988	3	\N	\N	\N	\N	\N	\N
3475	990	3	\N	\N	\N	\N	\N	\N
3476	993	3	\N	\N	\N	\N	\N	\N
3477	994	3	\N	\N	\N	\N	\N	\N
3478	998	3	\N	\N	\N	\N	\N	\N
3479	999	3	\N	\N	\N	\N	\N	\N
3480	1002	3	\N	\N	\N	\N	\N	\N
3481	1004	3	\N	\N	\N	\N	\N	\N
3482	1008	3	\N	\N	\N	\N	\N	\N
3483	1010	3	\N	\N	\N	\N	\N	\N
3484	1019	3	\N	\N	\N	\N	\N	\N
3485	1020	3	\N	\N	\N	\N	\N	\N
3486	1022	3	\N	\N	\N	\N	\N	\N
3487	1026	3	\N	\N	\N	\N	\N	\N
3488	1027	3	\N	\N	\N	\N	\N	\N
3489	1028	3	\N	\N	\N	\N	\N	\N
3490	1032	3	\N	\N	\N	\N	\N	\N
3491	1033	3	\N	\N	\N	\N	\N	\N
3492	1035	3	\N	\N	\N	\N	\N	\N
3493	1038	3	\N	\N	\N	\N	\N	\N
3494	1042	3	\N	\N	\N	\N	\N	\N
3495	1044	3	\N	\N	\N	\N	\N	\N
3496	1050	3	\N	\N	\N	\N	\N	\N
3497	1052	3	\N	\N	\N	\N	\N	\N
3498	1053	3	\N	\N	\N	\N	\N	\N
3499	1058	3	\N	\N	\N	\N	\N	\N
3500	1063	3	\N	\N	\N	\N	\N	\N
3501	1066	3	\N	\N	\N	\N	\N	\N
3502	1069	3	\N	\N	\N	\N	\N	\N
3503	1070	3	\N	\N	\N	\N	\N	\N
3504	1082	3	\N	\N	\N	\N	\N	\N
3505	1084	3	\N	\N	\N	\N	\N	\N
3506	1085	3	\N	\N	\N	\N	\N	\N
3507	1087	3	\N	\N	\N	\N	\N	\N
3508	1089	3	\N	\N	\N	\N	\N	\N
3509	1090	3	\N	\N	\N	\N	\N	\N
3510	1093	3	\N	\N	\N	\N	\N	\N
3511	1100	3	\N	\N	\N	\N	\N	\N
3512	1104	3	\N	\N	\N	\N	\N	\N
3513	1106	3	\N	\N	\N	\N	\N	\N
3514	1107	3	\N	\N	\N	\N	\N	\N
3515	1109	3	\N	\N	\N	\N	\N	\N
3516	1110	3	\N	\N	\N	\N	\N	\N
3517	1111	3	\N	\N	\N	\N	\N	\N
3518	1113	3	\N	\N	\N	\N	\N	\N
3519	1120	3	\N	\N	\N	\N	\N	\N
3520	1123	3	\N	\N	\N	\N	\N	\N
3521	1125	3	\N	\N	\N	\N	\N	\N
3522	1135	3	\N	\N	\N	\N	\N	\N
3523	1136	3	\N	\N	\N	\N	\N	\N
3524	1141	3	\N	\N	\N	\N	\N	\N
3525	1146	3	\N	\N	\N	\N	\N	\N
3526	1147	3	\N	\N	\N	\N	\N	\N
3527	1148	3	\N	\N	\N	\N	\N	\N
3528	1153	3	\N	\N	\N	\N	\N	\N
3529	1154	3	\N	\N	\N	\N	\N	\N
3530	1155	3	\N	\N	\N	\N	\N	\N
3531	1156	3	\N	\N	\N	\N	\N	\N
3532	1159	3	\N	\N	\N	\N	\N	\N
3533	1164	3	\N	\N	\N	\N	\N	\N
3534	1165	3	\N	\N	\N	\N	\N	\N
3535	1168	3	\N	\N	\N	\N	\N	\N
3536	1169	3	\N	\N	\N	\N	\N	\N
3537	1172	3	\N	\N	\N	\N	\N	\N
3538	1175	3	\N	\N	\N	\N	\N	\N
3539	1176	3	\N	\N	\N	\N	\N	\N
3540	1182	3	\N	\N	\N	\N	\N	\N
3541	1185	3	\N	\N	\N	\N	\N	\N
3542	1191	3	\N	\N	\N	\N	\N	\N
3543	1193	3	\N	\N	\N	\N	\N	\N
3544	1194	3	\N	\N	\N	\N	\N	\N
3545	1195	3	\N	\N	\N	\N	\N	\N
3546	1198	3	\N	\N	\N	\N	\N	\N
3547	1200	3	\N	\N	\N	\N	\N	\N
3548	1206	3	\N	\N	\N	\N	\N	\N
3549	1208	3	\N	\N	\N	\N	\N	\N
3550	1209	3	\N	\N	\N	\N	\N	\N
3551	1210	3	\N	\N	\N	\N	\N	\N
3552	1212	3	\N	\N	\N	\N	\N	\N
3553	1213	3	\N	\N	\N	\N	\N	\N
3554	1214	3	\N	\N	\N	\N	\N	\N
3555	1216	3	\N	\N	\N	\N	\N	\N
3556	1218	3	\N	\N	\N	\N	\N	\N
3557	1223	3	\N	\N	\N	\N	\N	\N
3558	1226	3	\N	\N	\N	\N	\N	\N
3559	1229	3	\N	\N	\N	\N	\N	\N
3560	1230	3	\N	\N	\N	\N	\N	\N
3561	1234	3	\N	\N	\N	\N	\N	\N
3562	1238	3	\N	\N	\N	\N	\N	\N
3563	1241	3	\N	\N	\N	\N	\N	\N
3564	1244	3	\N	\N	\N	\N	\N	\N
3565	1247	3	\N	\N	\N	\N	\N	\N
3566	1248	3	\N	\N	\N	\N	\N	\N
3567	1249	3	\N	\N	\N	\N	\N	\N
3568	1250	3	\N	\N	\N	\N	\N	\N
3569	1251	3	\N	\N	\N	\N	\N	\N
3570	1252	3	\N	\N	\N	\N	\N	\N
3571	1254	3	\N	\N	\N	\N	\N	\N
3572	1256	3	\N	\N	\N	\N	\N	\N
3573	1257	3	\N	\N	\N	\N	\N	\N
3574	1259	3	\N	\N	\N	\N	\N	\N
3575	1264	3	\N	\N	\N	\N	\N	\N
3576	1266	3	\N	\N	\N	\N	\N	\N
3577	1268	3	\N	\N	\N	\N	\N	\N
3578	1269	3	\N	\N	\N	\N	\N	\N
3579	1271	3	\N	\N	\N	\N	\N	\N
3580	1274	3	\N	\N	\N	\N	\N	\N
3581	1276	3	\N	\N	\N	\N	\N	\N
3582	1279	3	\N	\N	\N	\N	\N	\N
3583	1281	3	\N	\N	\N	\N	\N	\N
3584	1282	3	\N	\N	\N	\N	\N	\N
3585	1283	3	\N	\N	\N	\N	\N	\N
3586	1284	3	\N	\N	\N	\N	\N	\N
3587	1285	3	\N	\N	\N	\N	\N	\N
3588	1286	3	\N	\N	\N	\N	\N	\N
3589	1288	3	\N	\N	\N	\N	\N	\N
3590	1291	3	\N	\N	\N	\N	\N	\N
3591	1294	3	\N	\N	\N	\N	\N	\N
3592	1297	3	\N	\N	\N	\N	\N	\N
3593	1298	3	\N	\N	\N	\N	\N	\N
3594	1299	3	\N	\N	\N	\N	\N	\N
3595	1303	3	\N	\N	\N	\N	\N	\N
3596	1304	3	\N	\N	\N	\N	\N	\N
3597	1306	3	\N	\N	\N	\N	\N	\N
3598	1308	3	\N	\N	\N	\N	\N	\N
3599	1309	3	\N	\N	\N	\N	\N	\N
3600	1312	3	\N	\N	\N	\N	\N	\N
3601	1320	3	\N	\N	\N	\N	\N	\N
3602	1321	3	\N	\N	\N	\N	\N	\N
3603	1322	3	\N	\N	\N	\N	\N	\N
3604	1323	3	\N	\N	\N	\N	\N	\N
3605	1334	3	\N	\N	\N	\N	\N	\N
3606	1336	3	\N	\N	\N	\N	\N	\N
3607	1340	3	\N	\N	\N	\N	\N	\N
3608	1341	3	\N	\N	\N	\N	\N	\N
3609	1343	3	\N	\N	\N	\N	\N	\N
3610	1348	3	\N	\N	\N	\N	\N	\N
3611	1351	3	\N	\N	\N	\N	\N	\N
3612	1352	3	\N	\N	\N	\N	\N	\N
3613	1353	3	\N	\N	\N	\N	\N	\N
3614	1358	3	\N	\N	\N	\N	\N	\N
3615	1361	3	\N	\N	\N	\N	\N	\N
3616	1367	3	\N	\N	\N	\N	\N	\N
3617	1368	3	\N	\N	\N	\N	\N	\N
3618	1371	3	\N	\N	\N	\N	\N	\N
3619	1375	3	\N	\N	\N	\N	\N	\N
3620	1376	3	\N	\N	\N	\N	\N	\N
3621	1380	3	\N	\N	\N	\N	\N	\N
3622	1381	3	\N	\N	\N	\N	\N	\N
3623	1382	3	\N	\N	\N	\N	\N	\N
3624	1387	3	\N	\N	\N	\N	\N	\N
3625	1389	3	\N	\N	\N	\N	\N	\N
3626	1390	3	\N	\N	\N	\N	\N	\N
3627	1391	3	\N	\N	\N	\N	\N	\N
3628	1392	3	\N	\N	\N	\N	\N	\N
3629	1393	3	\N	\N	\N	\N	\N	\N
3630	1395	3	\N	\N	\N	\N	\N	\N
3631	1396	3	\N	\N	\N	\N	\N	\N
3632	1397	3	\N	\N	\N	\N	\N	\N
3633	1398	3	\N	\N	\N	\N	\N	\N
3634	1399	3	\N	\N	\N	\N	\N	\N
3635	1400	3	\N	\N	\N	\N	\N	\N
3636	1403	3	\N	\N	\N	\N	\N	\N
3637	1405	3	\N	\N	\N	\N	\N	\N
3638	1408	3	\N	\N	\N	\N	\N	\N
3639	1409	3	\N	\N	\N	\N	\N	\N
3640	1414	3	\N	\N	\N	\N	\N	\N
3641	1418	3	\N	\N	\N	\N	\N	\N
3642	1420	3	\N	\N	\N	\N	\N	\N
3643	1421	3	\N	\N	\N	\N	\N	\N
3644	1423	3	\N	\N	\N	\N	\N	\N
3645	1425	3	\N	\N	\N	\N	\N	\N
3646	1429	3	\N	\N	\N	\N	\N	\N
3647	1434	3	\N	\N	\N	\N	\N	\N
3648	1435	3	\N	\N	\N	\N	\N	\N
3649	1436	3	\N	\N	\N	\N	\N	\N
3650	1437	3	\N	\N	\N	\N	\N	\N
3651	1439	3	\N	\N	\N	\N	\N	\N
3652	1442	3	\N	\N	\N	\N	\N	\N
3653	1447	3	\N	\N	\N	\N	\N	\N
3654	1448	3	\N	\N	\N	\N	\N	\N
3655	1449	3	\N	\N	\N	\N	\N	\N
3656	1454	3	\N	\N	\N	\N	\N	\N
3657	1455	3	\N	\N	\N	\N	\N	\N
3658	1456	3	\N	\N	\N	\N	\N	\N
3659	1457	3	\N	\N	\N	\N	\N	\N
3660	1459	3	\N	\N	\N	\N	\N	\N
3661	1464	3	\N	\N	\N	\N	\N	\N
3662	1465	3	\N	\N	\N	\N	\N	\N
3663	1466	3	\N	\N	\N	\N	\N	\N
3664	1468	3	\N	\N	\N	\N	\N	\N
3665	1469	3	\N	\N	\N	\N	\N	\N
3666	1472	3	\N	\N	\N	\N	\N	\N
3667	1473	3	\N	\N	\N	\N	\N	\N
3668	1474	3	\N	\N	\N	\N	\N	\N
3669	1475	3	\N	\N	\N	\N	\N	\N
3670	1478	3	\N	\N	\N	\N	\N	\N
3671	1480	3	\N	\N	\N	\N	\N	\N
3672	1481	3	\N	\N	\N	\N	\N	\N
3673	1483	3	\N	\N	\N	\N	\N	\N
3674	1485	3	\N	\N	\N	\N	\N	\N
3675	1486	3	\N	\N	\N	\N	\N	\N
3676	1487	3	\N	\N	\N	\N	\N	\N
3677	1489	3	\N	\N	\N	\N	\N	\N
3678	1492	3	\N	\N	\N	\N	\N	\N
3679	1495	3	\N	\N	\N	\N	\N	\N
3680	1496	3	\N	\N	\N	\N	\N	\N
3681	1497	3	\N	\N	\N	\N	\N	\N
3682	1500	3	\N	\N	\N	\N	\N	\N
3683	1501	3	\N	\N	\N	\N	\N	\N
3684	1503	3	\N	\N	\N	\N	\N	\N
3685	1504	3	\N	\N	\N	\N	\N	\N
3686	1505	3	\N	\N	\N	\N	\N	\N
3687	1506	3	\N	\N	\N	\N	\N	\N
3688	1507	3	\N	\N	\N	\N	\N	\N
3689	1509	3	\N	\N	\N	\N	\N	\N
3690	1510	3	\N	\N	\N	\N	\N	\N
3691	1511	3	\N	\N	\N	\N	\N	\N
3692	1513	3	\N	\N	\N	\N	\N	\N
3693	1514	3	\N	\N	\N	\N	\N	\N
3694	1515	3	\N	\N	\N	\N	\N	\N
3695	1518	3	\N	\N	\N	\N	\N	\N
3696	1520	3	\N	\N	\N	\N	\N	\N
3697	1521	3	\N	\N	\N	\N	\N	\N
3698	1522	3	\N	\N	\N	\N	\N	\N
3699	1523	3	\N	\N	\N	\N	\N	\N
3700	1524	3	\N	\N	\N	\N	\N	\N
3701	1525	3	\N	\N	\N	\N	\N	\N
3702	1526	3	\N	\N	\N	\N	\N	\N
3703	1527	3	\N	\N	\N	\N	\N	\N
3704	1528	3	\N	\N	\N	\N	\N	\N
3705	1529	3	\N	\N	\N	\N	\N	\N
3706	1531	3	\N	\N	\N	\N	\N	\N
3707	1533	3	\N	\N	\N	\N	\N	\N
3708	1534	3	\N	\N	\N	\N	\N	\N
3709	1535	3	\N	\N	\N	\N	\N	\N
3710	1539	3	\N	\N	\N	\N	\N	\N
3711	1542	3	\N	\N	\N	\N	\N	\N
3712	1546	3	\N	\N	\N	\N	\N	\N
3713	1548	3	\N	\N	\N	\N	\N	\N
3714	1550	3	\N	\N	\N	\N	\N	\N
3715	1552	3	\N	\N	\N	\N	\N	\N
3716	1554	3	\N	\N	\N	\N	\N	\N
3717	1555	3	\N	\N	\N	\N	\N	\N
3718	1556	3	\N	\N	\N	\N	\N	\N
3719	1558	3	\N	\N	\N	\N	\N	\N
3720	1559	3	\N	\N	\N	\N	\N	\N
3721	1561	3	\N	\N	\N	\N	\N	\N
3722	1562	3	\N	\N	\N	\N	\N	\N
3723	1563	3	\N	\N	\N	\N	\N	\N
3724	1565	3	\N	\N	\N	\N	\N	\N
3725	1566	3	\N	\N	\N	\N	\N	\N
3726	1567	3	\N	\N	\N	\N	\N	\N
3727	1568	3	\N	\N	\N	\N	\N	\N
3728	1570	3	\N	\N	\N	\N	\N	\N
3729	1575	3	\N	\N	\N	\N	\N	\N
3730	1576	3	\N	\N	\N	\N	\N	\N
3731	1577	3	\N	\N	\N	\N	\N	\N
3732	1578	3	\N	\N	\N	\N	\N	\N
3733	1579	3	\N	\N	\N	\N	\N	\N
3734	1581	3	\N	\N	\N	\N	\N	\N
3735	1582	3	\N	\N	\N	\N	\N	\N
3736	1586	3	\N	\N	\N	\N	\N	\N
3737	1587	3	\N	\N	\N	\N	\N	\N
3738	1588	3	\N	\N	\N	\N	\N	\N
3739	1590	3	\N	\N	\N	\N	\N	\N
3740	1592	3	\N	\N	\N	\N	\N	\N
3741	1595	3	\N	\N	\N	\N	\N	\N
3742	1596	3	\N	\N	\N	\N	\N	\N
3743	1597	3	\N	\N	\N	\N	\N	\N
3744	1598	3	\N	\N	\N	\N	\N	\N
3745	1602	3	\N	\N	\N	\N	\N	\N
3746	1603	3	\N	\N	\N	\N	\N	\N
3747	1605	3	\N	\N	\N	\N	\N	\N
3748	1606	3	\N	\N	\N	\N	\N	\N
3749	1607	3	\N	\N	\N	\N	\N	\N
3750	1608	3	\N	\N	\N	\N	\N	\N
3751	1609	3	\N	\N	\N	\N	\N	\N
3752	1611	3	\N	\N	\N	\N	\N	\N
3753	1614	3	\N	\N	\N	\N	\N	\N
3754	1616	3	\N	\N	\N	\N	\N	\N
3755	1617	3	\N	\N	\N	\N	\N	\N
3756	1618	3	\N	\N	\N	\N	\N	\N
3757	1619	3	\N	\N	\N	\N	\N	\N
3758	1623	3	\N	\N	\N	\N	\N	\N
3759	1624	3	\N	\N	\N	\N	\N	\N
3760	1625	3	\N	\N	\N	\N	\N	\N
3761	1626	3	\N	\N	\N	\N	\N	\N
3762	1628	3	\N	\N	\N	\N	\N	\N
3763	1629	3	\N	\N	\N	\N	\N	\N
3764	1630	3	\N	\N	\N	\N	\N	\N
3765	1631	3	\N	\N	\N	\N	\N	\N
3766	1632	3	\N	\N	\N	\N	\N	\N
3767	1636	3	\N	\N	\N	\N	\N	\N
3768	1637	3	\N	\N	\N	\N	\N	\N
3769	1638	3	\N	\N	\N	\N	\N	\N
3770	1640	3	\N	\N	\N	\N	\N	\N
3771	1642	3	\N	\N	\N	\N	\N	\N
3772	1643	3	\N	\N	\N	\N	\N	\N
3773	1644	3	\N	\N	\N	\N	\N	\N
3774	1647	3	\N	\N	\N	\N	\N	\N
3775	1650	3	\N	\N	\N	\N	\N	\N
3776	1651	3	\N	\N	\N	\N	\N	\N
3777	1654	3	\N	\N	\N	\N	\N	\N
3778	1657	3	\N	\N	\N	\N	\N	\N
3779	1658	3	\N	\N	\N	\N	\N	\N
3780	1659	3	\N	\N	\N	\N	\N	\N
3781	1660	3	\N	\N	\N	\N	\N	\N
3782	1662	3	\N	\N	\N	\N	\N	\N
3783	1665	3	\N	\N	\N	\N	\N	\N
3784	1669	3	\N	\N	\N	\N	\N	\N
3785	1670	3	\N	\N	\N	\N	\N	\N
3786	1671	3	\N	\N	\N	\N	\N	\N
3787	1673	3	\N	\N	\N	\N	\N	\N
3788	1674	3	\N	\N	\N	\N	\N	\N
3789	1676	3	\N	\N	\N	\N	\N	\N
3790	1677	3	\N	\N	\N	\N	\N	\N
3791	1678	3	\N	\N	\N	\N	\N	\N
3792	1679	3	\N	\N	\N	\N	\N	\N
3793	1680	3	\N	\N	\N	\N	\N	\N
3794	1681	3	\N	\N	\N	\N	\N	\N
3795	1683	3	\N	\N	\N	\N	\N	\N
3796	1684	3	\N	\N	\N	\N	\N	\N
3797	1685	3	\N	\N	\N	\N	\N	\N
3798	1686	3	\N	\N	\N	\N	\N	\N
3799	1687	3	\N	\N	\N	\N	\N	\N
3800	1688	3	\N	\N	\N	\N	\N	\N
3801	1690	3	\N	\N	\N	\N	\N	\N
3802	1691	3	\N	\N	\N	\N	\N	\N
3803	1693	3	\N	\N	\N	\N	\N	\N
3804	1694	3	\N	\N	\N	\N	\N	\N
3805	1695	3	\N	\N	\N	\N	\N	\N
3806	1697	3	\N	\N	\N	\N	\N	\N
3807	1698	3	\N	\N	\N	\N	\N	\N
3808	1699	3	\N	\N	\N	\N	\N	\N
3809	1700	3	\N	\N	\N	\N	\N	\N
3810	1702	3	\N	\N	\N	\N	\N	\N
3811	1703	3	\N	\N	\N	\N	\N	\N
3812	1704	3	\N	\N	\N	\N	\N	\N
3813	1706	3	\N	\N	\N	\N	\N	\N
3814	1707	3	\N	\N	\N	\N	\N	\N
3815	1708	3	\N	\N	\N	\N	\N	\N
3816	1709	3	\N	\N	\N	\N	\N	\N
3817	1710	3	\N	\N	\N	\N	\N	\N
3818	1711	3	\N	\N	\N	\N	\N	\N
3819	1712	3	\N	\N	\N	\N	\N	\N
3820	1714	3	\N	\N	\N	\N	\N	\N
3821	1715	3	\N	\N	\N	\N	\N	\N
3822	1716	3	\N	\N	\N	\N	\N	\N
3823	1717	3	\N	\N	\N	\N	\N	\N
3824	1719	3	\N	\N	\N	\N	\N	\N
3825	1720	3	\N	\N	\N	\N	\N	\N
3826	1721	3	\N	\N	\N	\N	\N	\N
3827	1722	3	\N	\N	\N	\N	\N	\N
3828	1723	3	\N	\N	\N	\N	\N	\N
3829	1724	3	\N	\N	\N	\N	\N	\N
3830	1726	3	\N	\N	\N	\N	\N	\N
3831	1727	3	\N	\N	\N	\N	\N	\N
3832	1728	3	\N	\N	\N	\N	\N	\N
3833	1729	3	\N	\N	\N	\N	\N	\N
3834	1731	3	\N	\N	\N	\N	\N	\N
3835	1732	3	\N	\N	\N	\N	\N	\N
3836	1733	3	\N	\N	\N	\N	\N	\N
3837	1736	3	\N	\N	\N	\N	\N	\N
3838	1737	3	\N	\N	\N	\N	\N	\N
3839	1738	3	\N	\N	\N	\N	\N	\N
3840	1739	3	\N	\N	\N	\N	\N	\N
3841	1741	3	\N	\N	\N	\N	\N	\N
3842	1742	3	\N	\N	\N	\N	\N	\N
3843	1743	3	\N	\N	\N	\N	\N	\N
3844	1745	3	\N	\N	\N	\N	\N	\N
3845	1746	3	\N	\N	\N	\N	\N	\N
3846	1747	3	\N	\N	\N	\N	\N	\N
3847	1748	3	\N	\N	\N	\N	\N	\N
3848	1750	3	\N	\N	\N	\N	\N	\N
3849	1752	3	\N	\N	\N	\N	\N	\N
3850	1753	3	\N	\N	\N	\N	\N	\N
3851	1754	3	\N	\N	\N	\N	\N	\N
3852	1755	3	\N	\N	\N	\N	\N	\N
3853	1757	3	\N	\N	\N	\N	\N	\N
3854	1758	3	\N	\N	\N	\N	\N	\N
3855	1759	3	\N	\N	\N	\N	\N	\N
3856	1760	3	\N	\N	\N	\N	\N	\N
3857	1762	3	\N	\N	\N	\N	\N	\N
3858	1763	3	\N	\N	\N	\N	\N	\N
3859	1765	3	\N	\N	\N	\N	\N	\N
3860	1767	3	\N	\N	\N	\N	\N	\N
3861	1768	3	\N	\N	\N	\N	\N	\N
3862	1769	3	\N	\N	\N	\N	\N	\N
3863	1771	3	\N	\N	\N	\N	\N	\N
3864	1772	3	\N	\N	\N	\N	\N	\N
3865	1773	3	\N	\N	\N	\N	\N	\N
3866	1774	3	\N	\N	\N	\N	\N	\N
3867	1775	3	\N	\N	\N	\N	\N	\N
3868	1776	3	\N	\N	\N	\N	\N	\N
3869	1777	3	\N	\N	\N	\N	\N	\N
3870	1778	3	\N	\N	\N	\N	\N	\N
3871	1779	3	\N	\N	\N	\N	\N	\N
3872	1781	3	\N	\N	\N	\N	\N	\N
3873	1782	3	\N	\N	\N	\N	\N	\N
3874	1783	3	\N	\N	\N	\N	\N	\N
3875	1784	3	\N	\N	\N	\N	\N	\N
3876	1785	3	\N	\N	\N	\N	\N	\N
3877	1786	3	\N	\N	\N	\N	\N	\N
3878	1787	3	\N	\N	\N	\N	\N	\N
3879	1788	3	\N	\N	\N	\N	\N	\N
3880	1789	3	\N	\N	\N	\N	\N	\N
3881	1790	3	\N	\N	\N	\N	\N	\N
3882	1792	3	\N	\N	\N	\N	\N	\N
3883	1793	3	\N	\N	\N	\N	\N	\N
3884	1795	3	\N	\N	\N	\N	\N	\N
3885	1797	3	\N	\N	\N	\N	\N	\N
3886	1798	3	\N	\N	\N	\N	\N	\N
3887	1799	3	\N	\N	\N	\N	\N	\N
3888	1801	3	\N	\N	\N	\N	\N	\N
3889	1803	3	\N	\N	\N	\N	\N	\N
3890	1805	3	\N	\N	\N	\N	\N	\N
3891	1807	3	\N	\N	\N	\N	\N	\N
3892	1808	3	\N	\N	\N	\N	\N	\N
3893	1809	3	\N	\N	\N	\N	\N	\N
3894	1810	3	\N	\N	\N	\N	\N	\N
3895	1811	3	\N	\N	\N	\N	\N	\N
3896	1812	3	\N	\N	\N	\N	\N	\N
3897	1814	3	\N	\N	\N	\N	\N	\N
3898	1815	3	\N	\N	\N	\N	\N	\N
3899	1816	3	\N	\N	\N	\N	\N	\N
3900	1817	3	\N	\N	\N	\N	\N	\N
3901	1818	3	\N	\N	\N	\N	\N	\N
3902	1819	3	\N	\N	\N	\N	\N	\N
3903	1824	3	\N	\N	\N	\N	\N	\N
3904	1825	3	\N	\N	\N	\N	\N	\N
3905	1826	3	\N	\N	\N	\N	\N	\N
3906	1828	3	\N	\N	\N	\N	\N	\N
3907	1830	3	\N	\N	\N	\N	\N	\N
3908	1831	3	\N	\N	\N	\N	\N	\N
3909	1832	3	\N	\N	\N	\N	\N	\N
3910	1833	3	\N	\N	\N	\N	\N	\N
3911	1834	3	\N	\N	\N	\N	\N	\N
3912	1835	3	\N	\N	\N	\N	\N	\N
3913	1836	3	\N	\N	\N	\N	\N	\N
3914	1837	3	\N	\N	\N	\N	\N	\N
3915	1838	3	\N	\N	\N	\N	\N	\N
3916	1839	3	\N	\N	\N	\N	\N	\N
3917	1840	3	\N	\N	\N	\N	\N	\N
3918	1841	3	\N	\N	\N	\N	\N	\N
3919	1842	3	\N	\N	\N	\N	\N	\N
3920	1843	3	\N	\N	\N	\N	\N	\N
3921	1845	3	\N	\N	\N	\N	\N	\N
3922	1846	3	\N	\N	\N	\N	\N	\N
3923	1847	3	\N	\N	\N	\N	\N	\N
3924	1848	3	\N	\N	\N	\N	\N	\N
3925	1849	3	\N	\N	\N	\N	\N	\N
3926	1850	3	\N	\N	\N	\N	\N	\N
3927	1851	3	\N	\N	\N	\N	\N	\N
3928	1852	3	\N	\N	\N	\N	\N	\N
3929	1853	3	\N	\N	\N	\N	\N	\N
3930	1856	3	\N	\N	\N	\N	\N	\N
3931	1857	3	\N	\N	\N	\N	\N	\N
3932	1861	3	\N	\N	\N	\N	\N	\N
3933	1863	3	\N	\N	\N	\N	\N	\N
3934	1864	3	\N	\N	\N	\N	\N	\N
3935	1865	3	\N	\N	\N	\N	\N	\N
3936	1866	3	\N	\N	\N	\N	\N	\N
3937	1869	3	\N	\N	\N	\N	\N	\N
3938	1871	3	\N	\N	\N	\N	\N	\N
3939	1872	3	\N	\N	\N	\N	\N	\N
3940	1873	3	\N	\N	\N	\N	\N	\N
3941	1876	3	\N	\N	\N	\N	\N	\N
3942	1877	3	\N	\N	\N	\N	\N	\N
3943	1878	3	\N	\N	\N	\N	\N	\N
3944	1881	3	\N	\N	\N	\N	\N	\N
3945	1882	3	\N	\N	\N	\N	\N	\N
3946	1883	3	\N	\N	\N	\N	\N	\N
3947	1884	3	\N	\N	\N	\N	\N	\N
3948	1885	3	\N	\N	\N	\N	\N	\N
3949	1886	3	\N	\N	\N	\N	\N	\N
3950	1887	3	\N	\N	\N	\N	\N	\N
3951	1888	3	\N	\N	\N	\N	\N	\N
3952	1889	3	\N	\N	\N	\N	\N	\N
3953	1890	3	\N	\N	\N	\N	\N	\N
3954	1894	3	\N	\N	\N	\N	\N	\N
3955	1896	3	\N	\N	\N	\N	\N	\N
3956	1897	3	\N	\N	\N	\N	\N	\N
3957	1898	3	\N	\N	\N	\N	\N	\N
3958	1899	3	\N	\N	\N	\N	\N	\N
3959	1900	3	\N	\N	\N	\N	\N	\N
3960	1902	3	\N	\N	\N	\N	\N	\N
3961	1903	3	\N	\N	\N	\N	\N	\N
3962	1904	3	\N	\N	\N	\N	\N	\N
3963	1905	3	\N	\N	\N	\N	\N	\N
3964	1907	3	\N	\N	\N	\N	\N	\N
3965	1908	3	\N	\N	\N	\N	\N	\N
3966	1910	3	\N	\N	\N	\N	\N	\N
3967	1912	3	\N	\N	\N	\N	\N	\N
3968	1913	3	\N	\N	\N	\N	\N	\N
3969	1915	3	\N	\N	\N	\N	\N	\N
3970	1916	3	\N	\N	\N	\N	\N	\N
3971	1917	3	\N	\N	\N	\N	\N	\N
3972	1918	3	\N	\N	\N	\N	\N	\N
3973	1920	3	\N	\N	\N	\N	\N	\N
3974	1921	3	\N	\N	\N	\N	\N	\N
3975	1922	3	\N	\N	\N	\N	\N	\N
3976	1923	3	\N	\N	\N	\N	\N	\N
3977	1925	3	\N	\N	\N	\N	\N	\N
3978	1926	3	\N	\N	\N	\N	\N	\N
3979	1927	3	\N	\N	\N	\N	\N	\N
3980	1930	3	\N	\N	\N	\N	\N	\N
3981	1931	3	\N	\N	\N	\N	\N	\N
3982	1933	3	\N	\N	\N	\N	\N	\N
3983	1934	3	\N	\N	\N	\N	\N	\N
3984	1935	3	\N	\N	\N	\N	\N	\N
3985	1937	3	\N	\N	\N	\N	\N	\N
3986	1938	3	\N	\N	\N	\N	\N	\N
3987	1942	3	\N	\N	\N	\N	\N	\N
3988	1943	3	\N	\N	\N	\N	\N	\N
3989	1945	3	\N	\N	\N	\N	\N	\N
3990	1946	3	\N	\N	\N	\N	\N	\N
3991	1947	3	\N	\N	\N	\N	\N	\N
3992	1948	3	\N	\N	\N	\N	\N	\N
3993	1949	3	\N	\N	\N	\N	\N	\N
3994	1950	3	\N	\N	\N	\N	\N	\N
3995	1951	3	\N	\N	\N	\N	\N	\N
3996	1952	3	\N	\N	\N	\N	\N	\N
3997	1954	3	\N	\N	\N	\N	\N	\N
3998	1955	3	\N	\N	\N	\N	\N	\N
3999	1956	3	\N	\N	\N	\N	\N	\N
4000	1958	3	\N	\N	\N	\N	\N	\N
4001	1959	3	\N	\N	\N	\N	\N	\N
4002	1961	3	\N	\N	\N	\N	\N	\N
4003	1962	3	\N	\N	\N	\N	\N	\N
4004	1963	3	\N	\N	\N	\N	\N	\N
4005	1964	3	\N	\N	\N	\N	\N	\N
4006	1965	3	\N	\N	\N	\N	\N	\N
4007	1966	3	\N	\N	\N	\N	\N	\N
4008	1967	3	\N	\N	\N	\N	\N	\N
4009	1968	3	\N	\N	\N	\N	\N	\N
4010	1969	3	\N	\N	\N	\N	\N	\N
4011	1970	3	\N	\N	\N	\N	\N	\N
4012	1971	3	\N	\N	\N	\N	\N	\N
4013	1973	3	\N	\N	\N	\N	\N	\N
4014	1974	3	\N	\N	\N	\N	\N	\N
4015	1975	3	\N	\N	\N	\N	\N	\N
4016	1976	3	\N	\N	\N	\N	\N	\N
4017	1979	3	\N	\N	\N	\N	\N	\N
4018	1980	3	\N	\N	\N	\N	\N	\N
4019	1981	3	\N	\N	\N	\N	\N	\N
4020	1982	3	\N	\N	\N	\N	\N	\N
4021	1983	3	\N	\N	\N	\N	\N	\N
4022	1984	3	\N	\N	\N	\N	\N	\N
4023	1985	3	\N	\N	\N	\N	\N	\N
4024	1986	3	\N	\N	\N	\N	\N	\N
4025	1987	3	\N	\N	\N	\N	\N	\N
4026	1988	3	\N	\N	\N	\N	\N	\N
4027	1989	3	\N	\N	\N	\N	\N	\N
4028	1990	3	\N	\N	\N	\N	\N	\N
4029	1991	3	\N	\N	\N	\N	\N	\N
4030	1993	3	\N	\N	\N	\N	\N	\N
4031	1994	3	\N	\N	\N	\N	\N	\N
4032	1995	3	\N	\N	\N	\N	\N	\N
4033	1996	3	\N	\N	\N	\N	\N	\N
4034	1998	3	\N	\N	\N	\N	\N	\N
4035	1999	3	\N	\N	\N	\N	\N	\N
4036	2000	3	\N	\N	\N	\N	\N	\N
4037	2001	3	\N	\N	\N	\N	\N	\N
4038	2002	3	\N	\N	\N	\N	\N	\N
4039	2004	3	\N	\N	\N	\N	\N	\N
4040	2005	3	\N	\N	\N	\N	\N	\N
4041	2006	3	\N	\N	\N	\N	\N	\N
4042	2007	3	\N	\N	\N	\N	\N	\N
4043	2008	3	\N	\N	\N	\N	\N	\N
4044	2009	3	\N	\N	\N	\N	\N	\N
4045	2010	3	\N	\N	\N	\N	\N	\N
4046	2011	3	\N	\N	\N	\N	\N	\N
4047	2012	3	\N	\N	\N	\N	\N	\N
4048	2013	3	\N	\N	\N	\N	\N	\N
4049	2015	3	\N	\N	\N	\N	\N	\N
4050	2017	3	\N	\N	\N	\N	\N	\N
4051	2018	3	\N	\N	\N	\N	\N	\N
4052	2019	3	\N	\N	\N	\N	\N	\N
4053	2021	3	\N	\N	\N	\N	\N	\N
4054	2022	3	\N	\N	\N	\N	\N	\N
4055	2024	3	\N	\N	\N	\N	\N	\N
4056	2025	3	\N	\N	\N	\N	\N	\N
4057	2026	3	\N	\N	\N	\N	\N	\N
4058	2027	3	\N	\N	\N	\N	\N	\N
4059	2029	3	\N	\N	\N	\N	\N	\N
4060	2030	3	\N	\N	\N	\N	\N	\N
4061	2031	3	\N	\N	\N	\N	\N	\N
4062	2032	3	\N	\N	\N	\N	\N	\N
4063	2033	3	\N	\N	\N	\N	\N	\N
4064	2034	3	\N	\N	\N	\N	\N	\N
4065	2036	3	\N	\N	\N	\N	\N	\N
4066	2037	3	\N	\N	\N	\N	\N	\N
4067	2038	3	\N	\N	\N	\N	\N	\N
4068	2039	3	\N	\N	\N	\N	\N	\N
4069	2040	3	\N	\N	\N	\N	\N	\N
4070	2041	3	\N	\N	\N	\N	\N	\N
4071	2042	3	\N	\N	\N	\N	\N	\N
4072	2043	3	\N	\N	\N	\N	\N	\N
4073	2044	3	\N	\N	\N	\N	\N	\N
4074	2045	3	\N	\N	\N	\N	\N	\N
4075	2046	3	\N	\N	\N	\N	\N	\N
4076	2047	3	\N	\N	\N	\N	\N	\N
4077	2048	3	\N	\N	\N	\N	\N	\N
4078	2049	3	\N	\N	\N	\N	\N	\N
4079	2050	3	\N	\N	\N	\N	\N	\N
4080	2051	3	\N	\N	\N	\N	\N	\N
4081	2053	3	\N	\N	\N	\N	\N	\N
4082	2054	3	\N	\N	\N	\N	\N	\N
4083	2055	3	\N	\N	\N	\N	\N	\N
4084	2056	3	\N	\N	\N	\N	\N	\N
4085	2057	3	\N	\N	\N	\N	\N	\N
4086	2058	3	\N	\N	\N	\N	\N	\N
4087	2059	3	\N	\N	\N	\N	\N	\N
4088	2060	3	\N	\N	\N	\N	\N	\N
4089	2061	3	\N	\N	\N	\N	\N	\N
4090	2062	3	\N	\N	\N	\N	\N	\N
4091	2063	3	\N	\N	\N	\N	\N	\N
4092	2064	3	\N	\N	\N	\N	\N	\N
4093	2065	3	\N	\N	\N	\N	\N	\N
4094	2066	3	\N	\N	\N	\N	\N	\N
4095	2067	3	\N	\N	\N	\N	\N	\N
4096	2069	3	\N	\N	\N	\N	\N	\N
4097	2070	3	\N	\N	\N	\N	\N	\N
4098	2071	3	\N	\N	\N	\N	\N	\N
4099	2072	3	\N	\N	\N	\N	\N	\N
4100	2074	3	\N	\N	\N	\N	\N	\N
4101	2076	3	\N	\N	\N	\N	\N	\N
4102	2077	3	\N	\N	\N	\N	\N	\N
4103	2078	3	\N	\N	\N	\N	\N	\N
4104	2079	3	\N	\N	\N	\N	\N	\N
4105	2080	3	\N	\N	\N	\N	\N	\N
4106	2081	3	\N	\N	\N	\N	\N	\N
4107	2082	3	\N	\N	\N	\N	\N	\N
4108	2083	3	\N	\N	\N	\N	\N	\N
4109	2087	3	\N	\N	\N	\N	\N	\N
4110	2088	3	\N	\N	\N	\N	\N	\N
4111	2089	3	\N	\N	\N	\N	\N	\N
4112	2090	3	\N	\N	\N	\N	\N	\N
4113	2091	3	\N	\N	\N	\N	\N	\N
4114	2092	3	\N	\N	\N	\N	\N	\N
4115	2093	3	\N	\N	\N	\N	\N	\N
4116	2094	3	\N	\N	\N	\N	\N	\N
4117	2095	3	\N	\N	\N	\N	\N	\N
4118	2096	3	\N	\N	\N	\N	\N	\N
4119	2098	3	\N	\N	\N	\N	\N	\N
4120	2099	3	\N	\N	\N	\N	\N	\N
4121	2100	3	\N	\N	\N	\N	\N	\N
4122	2101	3	\N	\N	\N	\N	\N	\N
4123	2103	3	\N	\N	\N	\N	\N	\N
4124	2104	3	\N	\N	\N	\N	\N	\N
4125	2105	3	\N	\N	\N	\N	\N	\N
4126	2106	3	\N	\N	\N	\N	\N	\N
4127	2107	3	\N	\N	\N	\N	\N	\N
4128	2109	3	\N	\N	\N	\N	\N	\N
4129	2110	3	\N	\N	\N	\N	\N	\N
4130	2112	3	\N	\N	\N	\N	\N	\N
4131	2114	3	\N	\N	\N	\N	\N	\N
4132	2115	3	\N	\N	\N	\N	\N	\N
4133	2117	3	\N	\N	\N	\N	\N	\N
4134	2118	3	\N	\N	\N	\N	\N	\N
4135	2119	3	\N	\N	\N	\N	\N	\N
4136	2120	3	\N	\N	\N	\N	\N	\N
4137	2122	3	\N	\N	\N	\N	\N	\N
4138	2123	3	\N	\N	\N	\N	\N	\N
4139	2124	3	\N	\N	\N	\N	\N	\N
4140	2125	3	\N	\N	\N	\N	\N	\N
4141	2126	3	\N	\N	\N	\N	\N	\N
4142	2127	3	\N	\N	\N	\N	\N	\N
4143	2129	3	\N	\N	\N	\N	\N	\N
4144	2130	3	\N	\N	\N	\N	\N	\N
4145	2132	3	\N	\N	\N	\N	\N	\N
4146	2134	3	\N	\N	\N	\N	\N	\N
4147	2135	3	\N	\N	\N	\N	\N	\N
4148	2136	3	\N	\N	\N	\N	\N	\N
4149	2137	3	\N	\N	\N	\N	\N	\N
4150	2138	3	\N	\N	\N	\N	\N	\N
4151	2139	3	\N	\N	\N	\N	\N	\N
4152	2142	3	\N	\N	\N	\N	\N	\N
4153	2143	3	\N	\N	\N	\N	\N	\N
4154	2144	3	\N	\N	\N	\N	\N	\N
4155	2146	3	\N	\N	\N	\N	\N	\N
4156	2147	3	\N	\N	\N	\N	\N	\N
4157	2148	3	\N	\N	\N	\N	\N	\N
4158	2149	3	\N	\N	\N	\N	\N	\N
4159	2150	3	\N	\N	\N	\N	\N	\N
4160	2151	3	\N	\N	\N	\N	\N	\N
4161	2152	3	\N	\N	\N	\N	\N	\N
4162	2153	3	\N	\N	\N	\N	\N	\N
4163	2157	3	\N	\N	\N	\N	\N	\N
4164	2158	3	\N	\N	\N	\N	\N	\N
4165	2159	3	\N	\N	\N	\N	\N	\N
4166	2160	3	\N	\N	\N	\N	\N	\N
4167	2161	3	\N	\N	\N	\N	\N	\N
4168	2162	3	\N	\N	\N	\N	\N	\N
4169	2163	3	\N	\N	\N	\N	\N	\N
4170	2165	3	\N	\N	\N	\N	\N	\N
4171	2166	3	\N	\N	\N	\N	\N	\N
4172	2167	3	\N	\N	\N	\N	\N	\N
4173	2168	3	\N	\N	\N	\N	\N	\N
4174	2170	3	\N	\N	\N	\N	\N	\N
4175	2171	3	\N	\N	\N	\N	\N	\N
4176	2172	3	\N	\N	\N	\N	\N	\N
4177	2173	3	\N	\N	\N	\N	\N	\N
4178	2174	3	\N	\N	\N	\N	\N	\N
4179	2175	3	\N	\N	\N	\N	\N	\N
4180	2176	3	\N	\N	\N	\N	\N	\N
4181	2177	3	\N	\N	\N	\N	\N	\N
4182	2178	3	\N	\N	\N	\N	\N	\N
4183	2179	3	\N	\N	\N	\N	\N	\N
4184	2180	3	\N	\N	\N	\N	\N	\N
4185	2181	3	\N	\N	\N	\N	\N	\N
4186	2182	3	\N	\N	\N	\N	\N	\N
4187	2183	3	\N	\N	\N	\N	\N	\N
4188	2184	3	\N	\N	\N	\N	\N	\N
4189	2185	3	\N	\N	\N	\N	\N	\N
4190	2187	3	\N	\N	\N	\N	\N	\N
4191	2189	3	\N	\N	\N	\N	\N	\N
4192	2190	3	\N	\N	\N	\N	\N	\N
4193	2191	3	\N	\N	\N	\N	\N	\N
4194	2192	3	\N	\N	\N	\N	\N	\N
4195	2193	3	\N	\N	\N	\N	\N	\N
4196	2194	3	\N	\N	\N	\N	\N	\N
4197	2196	3	\N	\N	\N	\N	\N	\N
4198	2198	3	\N	\N	\N	\N	\N	\N
4199	2199	3	\N	\N	\N	\N	\N	\N
4200	2200	3	\N	\N	\N	\N	\N	\N
4201	2201	3	\N	\N	\N	\N	\N	\N
4202	2202	3	\N	\N	\N	\N	\N	\N
4203	2204	3	\N	\N	\N	\N	\N	\N
4204	2205	3	\N	\N	\N	\N	\N	\N
4205	2207	3	\N	\N	\N	\N	\N	\N
4206	2208	3	\N	\N	\N	\N	\N	\N
4207	2209	3	\N	\N	\N	\N	\N	\N
4208	2211	3	\N	\N	\N	\N	\N	\N
4209	2212	3	\N	\N	\N	\N	\N	\N
4210	2213	3	\N	\N	\N	\N	\N	\N
4211	2214	3	\N	\N	\N	\N	\N	\N
4212	2215	3	\N	\N	\N	\N	\N	\N
4213	2217	3	\N	\N	\N	\N	\N	\N
4214	2218	3	\N	\N	\N	\N	\N	\N
4215	2219	3	\N	\N	\N	\N	\N	\N
4216	2221	3	\N	\N	\N	\N	\N	\N
4217	2222	3	\N	\N	\N	\N	\N	\N
4218	2223	3	\N	\N	\N	\N	\N	\N
4219	2224	3	\N	\N	\N	\N	\N	\N
4220	2225	3	\N	\N	\N	\N	\N	\N
4221	2228	3	\N	\N	\N	\N	\N	\N
4222	2229	3	\N	\N	\N	\N	\N	\N
4223	2230	3	\N	\N	\N	\N	\N	\N
4224	2231	3	\N	\N	\N	\N	\N	\N
4225	2232	3	\N	\N	\N	\N	\N	\N
4226	2235	3	\N	\N	\N	\N	\N	\N
4227	2236	3	\N	\N	\N	\N	\N	\N
4228	2237	3	\N	\N	\N	\N	\N	\N
4229	2239	3	\N	\N	\N	\N	\N	\N
4230	2240	3	\N	\N	\N	\N	\N	\N
4231	2241	3	\N	\N	\N	\N	\N	\N
4232	2242	3	\N	\N	\N	\N	\N	\N
4233	2243	3	\N	\N	\N	\N	\N	\N
4234	2244	3	\N	\N	\N	\N	\N	\N
4235	2245	3	\N	\N	\N	\N	\N	\N
4236	2246	3	\N	\N	\N	\N	\N	\N
4237	2247	3	\N	\N	\N	\N	\N	\N
4238	2248	3	\N	\N	\N	\N	\N	\N
4239	2249	3	\N	\N	\N	\N	\N	\N
4240	2250	3	\N	\N	\N	\N	\N	\N
4241	2251	3	\N	\N	\N	\N	\N	\N
4242	2253	3	\N	\N	\N	\N	\N	\N
4243	2255	3	\N	\N	\N	\N	\N	\N
4244	2256	3	\N	\N	\N	\N	\N	\N
4245	2257	3	\N	\N	\N	\N	\N	\N
4246	2258	3	\N	\N	\N	\N	\N	\N
4247	2259	3	\N	\N	\N	\N	\N	\N
4248	2260	3	\N	\N	\N	\N	\N	\N
4249	2261	3	\N	\N	\N	\N	\N	\N
4250	2262	3	\N	\N	\N	\N	\N	\N
4251	2263	3	\N	\N	\N	\N	\N	\N
4252	2264	3	\N	\N	\N	\N	\N	\N
4253	2265	3	\N	\N	\N	\N	\N	\N
4254	2266	3	\N	\N	\N	\N	\N	\N
4255	2267	3	\N	\N	\N	\N	\N	\N
4256	2268	3	\N	\N	\N	\N	\N	\N
4257	2269	3	\N	\N	\N	\N	\N	\N
4258	2270	3	\N	\N	\N	\N	\N	\N
4259	2271	3	\N	\N	\N	\N	\N	\N
4260	2272	3	\N	\N	\N	\N	\N	\N
4261	2273	3	\N	\N	\N	\N	\N	\N
4262	2274	3	\N	\N	\N	\N	\N	\N
4263	2275	3	\N	\N	\N	\N	\N	\N
4264	2276	3	\N	\N	\N	\N	\N	\N
4265	2277	3	\N	\N	\N	\N	\N	\N
4266	2278	3	\N	\N	\N	\N	\N	\N
4267	2279	3	\N	\N	\N	\N	\N	\N
4268	2280	3	\N	\N	\N	\N	\N	\N
4269	2281	3	\N	\N	\N	\N	\N	\N
4270	2282	3	\N	\N	\N	\N	\N	\N
4271	2283	3	\N	\N	\N	\N	\N	\N
4272	2284	3	\N	\N	\N	\N	\N	\N
4273	2285	3	\N	\N	\N	\N	\N	\N
4274	2286	3	\N	\N	\N	\N	\N	\N
4275	2287	3	\N	\N	\N	\N	\N	\N
4276	2288	3	\N	\N	\N	\N	\N	\N
4277	2289	3	\N	\N	\N	\N	\N	\N
4278	2290	3	\N	\N	\N	\N	\N	\N
4279	2291	3	\N	\N	\N	\N	\N	\N
4280	2293	3	\N	\N	\N	\N	\N	\N
4281	2295	3	\N	\N	\N	\N	\N	\N
4282	2296	3	\N	\N	\N	\N	\N	\N
4283	2297	3	\N	\N	\N	\N	\N	\N
4284	2298	3	\N	\N	\N	\N	\N	\N
4285	2299	3	\N	\N	\N	\N	\N	\N
4286	2300	3	\N	\N	\N	\N	\N	\N
4287	2303	3	\N	\N	\N	\N	\N	\N
4288	2304	3	\N	\N	\N	\N	\N	\N
4289	2305	3	\N	\N	\N	\N	\N	\N
4290	2306	3	\N	\N	\N	\N	\N	\N
4291	2307	3	\N	\N	\N	\N	\N	\N
4292	2308	3	\N	\N	\N	\N	\N	\N
4293	2309	3	\N	\N	\N	\N	\N	\N
4294	2310	3	\N	\N	\N	\N	\N	\N
4295	2311	3	\N	\N	\N	\N	\N	\N
4296	2312	3	\N	\N	\N	\N	\N	\N
4297	2313	3	\N	\N	\N	\N	\N	\N
4298	2314	3	\N	\N	\N	\N	\N	\N
4299	2315	3	\N	\N	\N	\N	\N	\N
4300	2316	3	\N	\N	\N	\N	\N	\N
4301	2317	3	\N	\N	\N	\N	\N	\N
4302	2318	3	\N	\N	\N	\N	\N	\N
4303	2320	3	\N	\N	\N	\N	\N	\N
4304	2321	3	\N	\N	\N	\N	\N	\N
4305	2323	3	\N	\N	\N	\N	\N	\N
4306	2324	3	\N	\N	\N	\N	\N	\N
4307	2325	3	\N	\N	\N	\N	\N	\N
4308	2327	3	\N	\N	\N	\N	\N	\N
4309	2329	3	\N	\N	\N	\N	\N	\N
4310	2330	3	\N	\N	\N	\N	\N	\N
4311	2331	3	\N	\N	\N	\N	\N	\N
4312	2332	3	\N	\N	\N	\N	\N	\N
4313	2333	3	\N	\N	\N	\N	\N	\N
4314	2334	3	\N	\N	\N	\N	\N	\N
4315	2335	3	\N	\N	\N	\N	\N	\N
4316	2336	3	\N	\N	\N	\N	\N	\N
4317	2337	3	\N	\N	\N	\N	\N	\N
4318	2338	3	\N	\N	\N	\N	\N	\N
4319	2340	3	\N	\N	\N	\N	\N	\N
4320	2341	3	\N	\N	\N	\N	\N	\N
4321	2342	3	\N	\N	\N	\N	\N	\N
4322	2343	3	\N	\N	\N	\N	\N	\N
4323	2344	3	\N	\N	\N	\N	\N	\N
4324	2345	3	\N	\N	\N	\N	\N	\N
4325	2346	3	\N	\N	\N	\N	\N	\N
4326	2347	3	\N	\N	\N	\N	\N	\N
4327	2348	3	\N	\N	\N	\N	\N	\N
4328	2349	3	\N	\N	\N	\N	\N	\N
4329	2350	3	\N	\N	\N	\N	\N	\N
4330	2351	3	\N	\N	\N	\N	\N	\N
4331	2352	3	\N	\N	\N	\N	\N	\N
4332	2353	3	\N	\N	\N	\N	\N	\N
4333	2354	3	\N	\N	\N	\N	\N	\N
4334	2355	3	\N	\N	\N	\N	\N	\N
4335	2356	3	\N	\N	\N	\N	\N	\N
4336	2357	3	\N	\N	\N	\N	\N	\N
4337	2358	3	\N	\N	\N	\N	\N	\N
4338	2359	3	\N	\N	\N	\N	\N	\N
4339	2360	3	\N	\N	\N	\N	\N	\N
4340	2361	3	\N	\N	\N	\N	\N	\N
4341	2362	3	\N	\N	\N	\N	\N	\N
4342	2363	3	\N	\N	\N	\N	\N	\N
4343	2364	3	\N	\N	\N	\N	\N	\N
4344	2366	3	\N	\N	\N	\N	\N	\N
4345	2367	3	\N	\N	\N	\N	\N	\N
4346	2368	3	\N	\N	\N	\N	\N	\N
4347	2369	3	\N	\N	\N	\N	\N	\N
4348	2370	3	\N	\N	\N	\N	\N	\N
4349	2371	3	\N	\N	\N	\N	\N	\N
4350	2372	3	\N	\N	\N	\N	\N	\N
4351	2373	3	\N	\N	\N	\N	\N	\N
4352	2374	3	\N	\N	\N	\N	\N	\N
4353	2375	3	\N	\N	\N	\N	\N	\N
4354	2376	3	\N	\N	\N	\N	\N	\N
4355	2377	3	\N	\N	\N	\N	\N	\N
4356	2378	3	\N	\N	\N	\N	\N	\N
4357	2379	3	\N	\N	\N	\N	\N	\N
4358	2380	3	\N	\N	\N	\N	\N	\N
4359	2381	3	\N	\N	\N	\N	\N	\N
4360	2382	3	\N	\N	\N	\N	\N	\N
4361	2383	3	\N	\N	\N	\N	\N	\N
4362	2384	3	\N	\N	\N	\N	\N	\N
4363	2385	3	\N	\N	\N	\N	\N	\N
4364	2386	3	\N	\N	\N	\N	\N	\N
4365	2387	3	\N	\N	\N	\N	\N	\N
4366	2389	3	\N	\N	\N	\N	\N	\N
4367	2390	3	\N	\N	\N	\N	\N	\N
4368	2391	3	\N	\N	\N	\N	\N	\N
4369	2392	3	\N	\N	\N	\N	\N	\N
4370	2394	3	\N	\N	\N	\N	\N	\N
4371	2395	3	\N	\N	\N	\N	\N	\N
4372	2396	3	\N	\N	\N	\N	\N	\N
4373	2397	3	\N	\N	\N	\N	\N	\N
4374	2398	3	\N	\N	\N	\N	\N	\N
4375	2399	3	\N	\N	\N	\N	\N	\N
4376	2400	3	\N	\N	\N	\N	\N	\N
4377	2402	3	\N	\N	\N	\N	\N	\N
4378	2403	3	\N	\N	\N	\N	\N	\N
4379	2404	3	\N	\N	\N	\N	\N	\N
4380	2405	3	\N	\N	\N	\N	\N	\N
4381	2406	3	\N	\N	\N	\N	\N	\N
4382	2407	3	\N	\N	\N	\N	\N	\N
4383	2408	3	\N	\N	\N	\N	\N	\N
4384	2409	3	\N	\N	\N	\N	\N	\N
4385	2410	3	\N	\N	\N	\N	\N	\N
4386	2411	3	\N	\N	\N	\N	\N	\N
4387	2412	3	\N	\N	\N	\N	\N	\N
4388	2413	3	\N	\N	\N	\N	\N	\N
4389	2414	3	\N	\N	\N	\N	\N	\N
4390	2415	3	\N	\N	\N	\N	\N	\N
4391	2416	3	\N	\N	\N	\N	\N	\N
4392	2418	3	\N	\N	\N	\N	\N	\N
4393	2419	3	\N	\N	\N	\N	\N	\N
4394	2420	3	\N	\N	\N	\N	\N	\N
4395	2421	3	\N	\N	\N	\N	\N	\N
4396	2422	3	\N	\N	\N	\N	\N	\N
4397	2423	3	\N	\N	\N	\N	\N	\N
4398	2424	3	\N	\N	\N	\N	\N	\N
4399	2425	3	\N	\N	\N	\N	\N	\N
4400	2426	3	\N	\N	\N	\N	\N	\N
4401	2427	3	\N	\N	\N	\N	\N	\N
4402	2428	3	\N	\N	\N	\N	\N	\N
4403	2429	3	\N	\N	\N	\N	\N	\N
4404	2430	3	\N	\N	\N	\N	\N	\N
4405	2432	3	\N	\N	\N	\N	\N	\N
4406	2433	3	\N	\N	\N	\N	\N	\N
4407	2434	3	\N	\N	\N	\N	\N	\N
4408	2435	3	\N	\N	\N	\N	\N	\N
4409	2436	3	\N	\N	\N	\N	\N	\N
4410	2437	3	\N	\N	\N	\N	\N	\N
4411	2438	3	\N	\N	\N	\N	\N	\N
4412	2439	3	\N	\N	\N	\N	\N	\N
4413	2440	3	\N	\N	\N	\N	\N	\N
4414	2441	3	\N	\N	\N	\N	\N	\N
4415	2443	3	\N	\N	\N	\N	\N	\N
4416	2444	3	\N	\N	\N	\N	\N	\N
4417	2445	3	\N	\N	\N	\N	\N	\N
4418	2446	3	\N	\N	\N	\N	\N	\N
4419	2447	3	\N	\N	\N	\N	\N	\N
4420	2448	3	\N	\N	\N	\N	\N	\N
4421	2450	3	\N	\N	\N	\N	\N	\N
4422	2452	3	\N	\N	\N	\N	\N	\N
4423	2453	3	\N	\N	\N	\N	\N	\N
4424	2454	3	\N	\N	\N	\N	\N	\N
4425	2455	3	\N	\N	\N	\N	\N	\N
4426	2456	3	\N	\N	\N	\N	\N	\N
4427	2457	3	\N	\N	\N	\N	\N	\N
4428	2458	3	\N	\N	\N	\N	\N	\N
4429	2459	3	\N	\N	\N	\N	\N	\N
4430	2460	3	\N	\N	\N	\N	\N	\N
4431	2461	3	\N	\N	\N	\N	\N	\N
4432	2462	3	\N	\N	\N	\N	\N	\N
4433	2464	3	\N	\N	\N	\N	\N	\N
4434	2465	3	\N	\N	\N	\N	\N	\N
4435	2466	3	\N	\N	\N	\N	\N	\N
4436	2467	3	\N	\N	\N	\N	\N	\N
4437	2468	3	\N	\N	\N	\N	\N	\N
4438	2469	3	\N	\N	\N	\N	\N	\N
4439	2470	3	\N	\N	\N	\N	\N	\N
4440	2471	3	\N	\N	\N	\N	\N	\N
4441	2472	3	\N	\N	\N	\N	\N	\N
4442	2473	3	\N	\N	\N	\N	\N	\N
4443	2474	3	\N	\N	\N	\N	\N	\N
4444	2475	3	\N	\N	\N	\N	\N	\N
4445	2476	3	\N	\N	\N	\N	\N	\N
4446	2477	3	\N	\N	\N	\N	\N	\N
4447	2478	3	\N	\N	\N	\N	\N	\N
4448	2479	3	\N	\N	\N	\N	\N	\N
4449	2480	3	\N	\N	\N	\N	\N	\N
4450	2481	3	\N	\N	\N	\N	\N	\N
4451	2482	3	\N	\N	\N	\N	\N	\N
4452	2483	3	\N	\N	\N	\N	\N	\N
4453	2484	3	\N	\N	\N	\N	\N	\N
4454	2485	3	\N	\N	\N	\N	\N	\N
4455	2486	3	\N	\N	\N	\N	\N	\N
4456	2487	3	\N	\N	\N	\N	\N	\N
4457	2488	3	\N	\N	\N	\N	\N	\N
4458	2489	3	\N	\N	\N	\N	\N	\N
4459	2490	3	\N	\N	\N	\N	\N	\N
4460	2491	3	\N	\N	\N	\N	\N	\N
4461	2492	3	\N	\N	\N	\N	\N	\N
4462	2493	3	\N	\N	\N	\N	\N	\N
4463	2495	3	\N	\N	\N	\N	\N	\N
4464	2496	3	\N	\N	\N	\N	\N	\N
4465	2497	3	\N	\N	\N	\N	\N	\N
4466	2498	3	\N	\N	\N	\N	\N	\N
4467	2499	3	\N	\N	\N	\N	\N	\N
4468	2500	3	\N	\N	\N	\N	\N	\N
4469	2501	3	\N	\N	\N	\N	\N	\N
4470	2502	3	\N	\N	\N	\N	\N	\N
4471	2503	3	\N	\N	\N	\N	\N	\N
4472	2504	3	\N	\N	\N	\N	\N	\N
4473	2505	3	\N	\N	\N	\N	\N	\N
4474	2506	3	\N	\N	\N	\N	\N	\N
4475	2507	3	\N	\N	\N	\N	\N	\N
4476	2508	3	\N	\N	\N	\N	\N	\N
4477	2509	3	\N	\N	\N	\N	\N	\N
4478	2510	3	\N	\N	\N	\N	\N	\N
4479	2511	3	\N	\N	\N	\N	\N	\N
4480	2512	3	\N	\N	\N	\N	\N	\N
4481	2513	3	\N	\N	\N	\N	\N	\N
4482	2514	3	\N	\N	\N	\N	\N	\N
4483	2515	3	\N	\N	\N	\N	\N	\N
4484	2516	3	\N	\N	\N	\N	\N	\N
4485	2517	3	\N	\N	\N	\N	\N	\N
4486	2518	3	\N	\N	\N	\N	\N	\N
4487	2519	3	\N	\N	\N	\N	\N	\N
4488	2520	3	\N	\N	\N	\N	\N	\N
4489	2521	3	\N	\N	\N	\N	\N	\N
4490	2522	3	\N	\N	\N	\N	\N	\N
4491	2523	3	\N	\N	\N	\N	\N	\N
4492	2524	3	\N	\N	\N	\N	\N	\N
4493	2525	3	\N	\N	\N	\N	\N	\N
4494	2526	3	\N	\N	\N	\N	\N	\N
4495	2527	3	\N	\N	\N	\N	\N	\N
4496	2528	3	\N	\N	\N	\N	\N	\N
4497	2529	3	\N	\N	\N	\N	\N	\N
4498	2530	3	\N	\N	\N	\N	\N	\N
4499	2531	3	\N	\N	\N	\N	\N	\N
4500	2532	3	\N	\N	\N	\N	\N	\N
4501	2533	3	\N	\N	\N	\N	\N	\N
4502	2534	3	\N	\N	\N	\N	\N	\N
4503	2535	3	\N	\N	\N	\N	\N	\N
4504	2536	3	\N	\N	\N	\N	\N	\N
4505	2537	3	\N	\N	\N	\N	\N	\N
4506	2538	3	\N	\N	\N	\N	\N	\N
4507	2539	3	\N	\N	\N	\N	\N	\N
4508	2540	3	\N	\N	\N	\N	\N	\N
4509	2541	3	\N	\N	\N	\N	\N	\N
4510	2542	3	\N	\N	\N	\N	\N	\N
4511	2543	3	\N	\N	\N	\N	\N	\N
4512	2544	3	\N	\N	\N	\N	\N	\N
4513	2545	3	\N	\N	\N	\N	\N	\N
4514	2546	3	\N	\N	\N	\N	\N	\N
4515	2547	3	\N	\N	\N	\N	\N	\N
4516	2548	3	\N	\N	\N	\N	\N	\N
4517	2549	3	\N	\N	\N	\N	\N	\N
4518	2550	3	\N	\N	\N	\N	\N	\N
4519	2551	3	\N	\N	\N	\N	\N	\N
4520	2552	3	\N	\N	\N	\N	\N	\N
4521	2553	3	\N	\N	\N	\N	\N	\N
4522	2554	3	\N	\N	\N	\N	\N	\N
4523	2555	3	\N	\N	\N	\N	\N	\N
4524	2556	3	\N	\N	\N	\N	\N	\N
4525	2557	3	\N	\N	\N	\N	\N	\N
4526	2558	3	\N	\N	\N	\N	\N	\N
4527	2559	3	\N	\N	\N	\N	\N	\N
4528	2560	3	\N	\N	\N	\N	\N	\N
4529	2561	3	\N	\N	\N	\N	\N	\N
4530	2562	3	\N	\N	\N	\N	\N	\N
4531	2563	3	\N	\N	\N	\N	\N	\N
4532	2564	3	\N	\N	\N	\N	\N	\N
4533	2565	3	\N	\N	\N	\N	\N	\N
4534	2566	3	\N	\N	\N	\N	\N	\N
4535	2567	3	\N	\N	\N	\N	\N	\N
4536	2568	3	\N	\N	\N	\N	\N	\N
4537	2569	3	\N	\N	\N	\N	\N	\N
4538	2570	3	\N	\N	\N	\N	\N	\N
4539	2571	3	\N	\N	\N	\N	\N	\N
4540	2572	3	\N	\N	\N	\N	\N	\N
4541	2573	3	\N	\N	\N	\N	\N	\N
4542	2575	3	\N	\N	\N	\N	\N	\N
4543	2576	3	\N	\N	\N	\N	\N	\N
4544	2577	3	\N	\N	\N	\N	\N	\N
4545	2578	3	\N	\N	\N	\N	\N	\N
4546	2579	3	\N	\N	\N	\N	\N	\N
4547	2580	3	\N	\N	\N	\N	\N	\N
4548	2581	3	\N	\N	\N	\N	\N	\N
4549	2582	3	\N	\N	\N	\N	\N	\N
4550	2583	3	\N	\N	\N	\N	\N	\N
4551	2584	3	\N	\N	\N	\N	\N	\N
4552	2585	3	\N	\N	\N	\N	\N	\N
4553	2586	3	\N	\N	\N	\N	\N	\N
4554	2587	3	\N	\N	\N	\N	\N	\N
4555	2588	3	\N	\N	\N	\N	\N	\N
4556	2589	3	\N	\N	\N	\N	\N	\N
4557	2590	3	\N	\N	\N	\N	\N	\N
4558	2591	3	\N	\N	\N	\N	\N	\N
4559	2592	3	\N	\N	\N	\N	\N	\N
4560	2593	3	\N	\N	\N	\N	\N	\N
4561	2594	3	\N	\N	\N	\N	\N	\N
4562	2595	3	\N	\N	\N	\N	\N	\N
4563	2596	3	\N	\N	\N	\N	\N	\N
4564	2597	3	\N	\N	\N	\N	\N	\N
4565	2598	3	\N	\N	\N	\N	\N	\N
4566	2599	3	\N	\N	\N	\N	\N	\N
4567	2600	3	\N	\N	\N	\N	\N	\N
4568	2601	3	\N	\N	\N	\N	\N	\N
4569	2602	3	\N	\N	\N	\N	\N	\N
4570	2603	3	\N	\N	\N	\N	\N	\N
4571	2604	3	\N	\N	\N	\N	\N	\N
4572	2605	3	\N	\N	\N	\N	\N	\N
4573	2606	3	\N	\N	\N	\N	\N	\N
4574	2607	3	\N	\N	\N	\N	\N	\N
4575	2608	3	\N	\N	\N	\N	\N	\N
4576	2609	3	\N	\N	\N	\N	\N	\N
4577	2610	3	\N	\N	\N	\N	\N	\N
4578	2611	3	\N	\N	\N	\N	\N	\N
4579	2612	3	\N	\N	\N	\N	\N	\N
4580	2614	3	\N	\N	\N	\N	\N	\N
4581	2615	3	\N	\N	\N	\N	\N	\N
4582	2616	3	\N	\N	\N	\N	\N	\N
4583	2617	3	\N	\N	\N	\N	\N	\N
4584	2618	3	\N	\N	\N	\N	\N	\N
4585	2619	3	\N	\N	\N	\N	\N	\N
4586	2620	3	\N	\N	\N	\N	\N	\N
4587	2621	3	\N	\N	\N	\N	\N	\N
4588	2624	3	\N	\N	\N	\N	\N	\N
4589	2625	3	\N	\N	\N	\N	\N	\N
4590	2626	3	\N	\N	\N	\N	\N	\N
4591	2627	3	\N	\N	\N	\N	\N	\N
4592	2628	3	\N	\N	\N	\N	\N	\N
4593	2629	3	\N	\N	\N	\N	\N	\N
4594	2630	3	\N	\N	\N	\N	\N	\N
4595	2631	3	\N	\N	\N	\N	\N	\N
4596	2632	3	\N	\N	\N	\N	\N	\N
4597	2633	3	\N	\N	\N	\N	\N	\N
4598	2634	3	\N	\N	\N	\N	\N	\N
4599	2635	3	\N	\N	\N	\N	\N	\N
4600	2636	3	\N	\N	\N	\N	\N	\N
4601	2637	3	\N	\N	\N	\N	\N	\N
4602	2638	3	\N	\N	\N	\N	\N	\N
4603	2639	3	\N	\N	\N	\N	\N	\N
4604	2640	3	\N	\N	\N	\N	\N	\N
4605	2641	3	\N	\N	\N	\N	\N	\N
4606	2642	3	\N	\N	\N	\N	\N	\N
4607	2643	3	\N	\N	\N	\N	\N	\N
4608	2644	3	\N	\N	\N	\N	\N	\N
4609	2645	3	\N	\N	\N	\N	\N	\N
4610	2646	3	\N	\N	\N	\N	\N	\N
4611	2647	3	\N	\N	\N	\N	\N	\N
4612	2648	3	\N	\N	\N	\N	\N	\N
4613	2649	3	\N	\N	\N	\N	\N	\N
4614	2650	3	\N	\N	\N	\N	\N	\N
4615	2651	3	\N	\N	\N	\N	\N	\N
4616	2652	3	\N	\N	\N	\N	\N	\N
4617	2653	3	\N	\N	\N	\N	\N	\N
4618	2654	3	\N	\N	\N	\N	\N	\N
4619	2655	3	\N	\N	\N	\N	\N	\N
4620	2656	3	\N	\N	\N	\N	\N	\N
4621	2657	3	\N	\N	\N	\N	\N	\N
4622	2658	3	\N	\N	\N	\N	\N	\N
4623	2659	3	\N	\N	\N	\N	\N	\N
4624	2660	3	\N	\N	\N	\N	\N	\N
4625	2661	3	\N	\N	\N	\N	\N	\N
4626	2662	3	\N	\N	\N	\N	\N	\N
4627	2663	3	\N	\N	\N	\N	\N	\N
4628	2664	3	\N	\N	\N	\N	\N	\N
4629	2665	3	\N	\N	\N	\N	\N	\N
4630	2666	3	\N	\N	\N	\N	\N	\N
4631	2667	3	\N	\N	\N	\N	\N	\N
4632	2668	3	\N	\N	\N	\N	\N	\N
4633	2669	3	\N	\N	\N	\N	\N	\N
4634	2670	3	\N	\N	\N	\N	\N	\N
4635	2671	3	\N	\N	\N	\N	\N	\N
4636	2672	3	\N	\N	\N	\N	\N	\N
4637	2673	3	\N	\N	\N	\N	\N	\N
4638	2674	3	\N	\N	\N	\N	\N	\N
4639	2675	3	\N	\N	\N	\N	\N	\N
4640	2676	3	\N	\N	\N	\N	\N	\N
4641	2677	3	\N	\N	\N	\N	\N	\N
4642	2678	3	\N	\N	\N	\N	\N	\N
4643	2679	3	\N	\N	\N	\N	\N	\N
4644	2680	3	\N	\N	\N	\N	\N	\N
4645	2681	3	\N	\N	\N	\N	\N	\N
4646	2682	3	\N	\N	\N	\N	\N	\N
4647	2683	3	\N	\N	\N	\N	\N	\N
4648	2684	3	\N	\N	\N	\N	\N	\N
4649	2685	3	\N	\N	\N	\N	\N	\N
4650	2686	3	\N	\N	\N	\N	\N	\N
4651	2687	3	\N	\N	\N	\N	\N	\N
4652	2688	3	\N	\N	\N	\N	\N	\N
4653	2689	3	\N	\N	\N	\N	\N	\N
4654	2690	3	\N	\N	\N	\N	\N	\N
4655	2691	3	\N	\N	\N	\N	\N	\N
4656	2692	3	\N	\N	\N	\N	\N	\N
4657	2693	3	\N	\N	\N	\N	\N	\N
4658	2694	3	\N	\N	\N	\N	\N	\N
4659	2695	3	\N	\N	\N	\N	\N	\N
4660	2696	3	\N	\N	\N	\N	\N	\N
4661	2698	3	\N	\N	\N	\N	\N	\N
4662	2699	3	\N	\N	\N	\N	\N	\N
4663	2701	3	\N	\N	\N	\N	\N	\N
4664	2702	3	\N	\N	\N	\N	\N	\N
4665	2703	3	\N	\N	\N	\N	\N	\N
4666	2704	3	\N	\N	\N	\N	\N	\N
4667	2705	3	\N	\N	\N	\N	\N	\N
4668	2706	3	\N	\N	\N	\N	\N	\N
4669	2707	3	\N	\N	\N	\N	\N	\N
4670	2708	3	\N	\N	\N	\N	\N	\N
4671	2709	3	\N	\N	\N	\N	\N	\N
4672	2710	3	\N	\N	\N	\N	\N	\N
4673	2711	3	\N	\N	\N	\N	\N	\N
4674	2712	3	\N	\N	\N	\N	\N	\N
4675	2713	3	\N	\N	\N	\N	\N	\N
4676	2714	3	\N	\N	\N	\N	\N	\N
4677	2715	3	\N	\N	\N	\N	\N	\N
4678	2717	3	\N	\N	\N	\N	\N	\N
4679	2718	3	\N	\N	\N	\N	\N	\N
4680	2719	3	\N	\N	\N	\N	\N	\N
4681	2720	3	\N	\N	\N	\N	\N	\N
4682	2721	3	\N	\N	\N	\N	\N	\N
4683	2722	3	\N	\N	\N	\N	\N	\N
4684	2723	3	\N	\N	\N	\N	\N	\N
4685	2724	3	\N	\N	\N	\N	\N	\N
4686	2725	3	\N	\N	\N	\N	\N	\N
4687	2726	3	\N	\N	\N	\N	\N	\N
4688	2727	3	\N	\N	\N	\N	\N	\N
4689	2729	3	\N	\N	\N	\N	\N	\N
4690	2730	3	\N	\N	\N	\N	\N	\N
4691	2731	3	\N	\N	\N	\N	\N	\N
4692	2732	3	\N	\N	\N	\N	\N	\N
4693	2733	3	\N	\N	\N	\N	\N	\N
4694	2734	3	\N	\N	\N	\N	\N	\N
4695	2735	3	\N	\N	\N	\N	\N	\N
4696	2736	3	\N	\N	\N	\N	\N	\N
4697	2737	3	\N	\N	\N	\N	\N	\N
4698	2738	3	\N	\N	\N	\N	\N	\N
4699	2739	3	\N	\N	\N	\N	\N	\N
4700	2740	3	\N	\N	\N	\N	\N	\N
4701	2741	3	\N	\N	\N	\N	\N	\N
4702	2742	3	\N	\N	\N	\N	\N	\N
4703	2743	3	\N	\N	\N	\N	\N	\N
4704	2744	3	\N	\N	\N	\N	\N	\N
4705	2746	3	\N	\N	\N	\N	\N	\N
4706	2747	3	\N	\N	\N	\N	\N	\N
4707	2748	3	\N	\N	\N	\N	\N	\N
4708	2749	3	\N	\N	\N	\N	\N	\N
4709	2750	3	\N	\N	\N	\N	\N	\N
4710	2751	3	\N	\N	\N	\N	\N	\N
4711	2752	3	\N	\N	\N	\N	\N	\N
4712	2753	3	\N	\N	\N	\N	\N	\N
4713	2754	3	\N	\N	\N	\N	\N	\N
4714	2755	3	\N	\N	\N	\N	\N	\N
4715	2756	3	\N	\N	\N	\N	\N	\N
4716	2757	3	\N	\N	\N	\N	\N	\N
4717	2758	3	\N	\N	\N	\N	\N	\N
4718	2759	3	\N	\N	\N	\N	\N	\N
4719	2760	3	\N	\N	\N	\N	\N	\N
4720	2761	3	\N	\N	\N	\N	\N	\N
4721	2762	3	\N	\N	\N	\N	\N	\N
4722	2763	3	\N	\N	\N	\N	\N	\N
4723	2764	3	\N	\N	\N	\N	\N	\N
4724	2765	3	\N	\N	\N	\N	\N	\N
4725	2766	3	\N	\N	\N	\N	\N	\N
4726	2767	3	\N	\N	\N	\N	\N	\N
4727	2768	3	\N	\N	\N	\N	\N	\N
4728	2769	3	\N	\N	\N	\N	\N	\N
4729	2770	3	\N	\N	\N	\N	\N	\N
4730	2771	3	\N	\N	\N	\N	\N	\N
4731	2772	3	\N	\N	\N	\N	\N	\N
4732	2773	3	\N	\N	\N	\N	\N	\N
4733	2774	3	\N	\N	\N	\N	\N	\N
4734	2775	3	\N	\N	\N	\N	\N	\N
4735	2776	3	\N	\N	\N	\N	\N	\N
4736	2777	3	\N	\N	\N	\N	\N	\N
4737	2778	3	\N	\N	\N	\N	\N	\N
4738	2779	3	\N	\N	\N	\N	\N	\N
4739	2780	3	\N	\N	\N	\N	\N	\N
4740	2825	3	\N	\N	\N	\N	\N	\N
4741	2826	3	\N	\N	\N	\N	\N	\N
4742	2827	3	\N	\N	\N	\N	\N	\N
4743	2828	3	\N	\N	\N	\N	\N	\N
4744	2829	3	\N	\N	\N	\N	\N	\N
4745	2830	3	\N	\N	\N	\N	\N	\N
4746	2831	3	\N	\N	\N	\N	\N	\N
4747	2833	3	\N	\N	\N	\N	\N	\N
4748	2834	3	\N	\N	\N	\N	\N	\N
4749	2835	3	\N	\N	\N	\N	\N	\N
4750	2836	3	\N	\N	\N	\N	\N	\N
4751	2837	3	\N	\N	\N	\N	\N	\N
4752	2838	3	\N	\N	\N	\N	\N	\N
4753	2839	3	\N	\N	\N	\N	\N	\N
4754	2840	3	\N	\N	\N	\N	\N	\N
4755	2841	3	\N	\N	\N	\N	\N	\N
4756	2842	3	\N	\N	\N	\N	\N	\N
4757	2843	3	\N	\N	\N	\N	\N	\N
4758	2844	3	\N	\N	\N	\N	\N	\N
4759	2845	3	\N	\N	\N	\N	\N	\N
4760	2846	3	\N	\N	\N	\N	\N	\N
4761	2847	3	\N	\N	\N	\N	\N	\N
4762	2848	3	\N	\N	\N	\N	\N	\N
4763	2849	3	\N	\N	\N	\N	\N	\N
4764	2850	3	\N	\N	\N	\N	\N	\N
4765	2852	3	\N	\N	\N	\N	\N	\N
4766	2853	3	\N	\N	\N	\N	\N	\N
4767	2854	3	\N	\N	\N	\N	\N	\N
4768	2855	3	\N	\N	\N	\N	\N	\N
4769	2856	3	\N	\N	\N	\N	\N	\N
4770	2857	3	\N	\N	\N	\N	\N	\N
4771	2858	3	\N	\N	\N	\N	\N	\N
4772	2859	3	\N	\N	\N	\N	\N	\N
4773	2861	3	\N	\N	\N	\N	\N	\N
4774	2862	3	\N	\N	\N	\N	\N	\N
4775	2866	3	\N	\N	\N	\N	\N	\N
4776	2867	3	\N	\N	\N	\N	\N	\N
4777	2868	3	\N	\N	\N	\N	\N	\N
4778	2869	3	\N	\N	\N	\N	\N	\N
4779	2870	3	\N	\N	\N	\N	\N	\N
4780	2872	3	\N	\N	\N	\N	\N	\N
4781	2873	3	\N	\N	\N	\N	\N	\N
4782	2874	3	\N	\N	\N	\N	\N	\N
4783	2875	3	\N	\N	\N	\N	\N	\N
4784	2876	3	\N	\N	\N	\N	\N	\N
4785	2877	3	\N	\N	\N	\N	\N	\N
4786	2878	3	\N	\N	\N	\N	\N	\N
4787	2879	3	\N	\N	\N	\N	\N	\N
4788	2880	3	\N	\N	\N	\N	\N	\N
4789	1	4	\N	\N	\N	\N	\N	\N
4790	2	4	\N	\N	\N	\N	\N	\N
4791	3	4	\N	\N	\N	\N	\N	\N
4792	4	4	\N	\N	\N	\N	\N	\N
4793	5	4	\N	\N	\N	\N	\N	\N
4794	6	4	\N	\N	\N	\N	\N	\N
4795	8	4	\N	\N	\N	\N	\N	\N
4796	9	4	\N	\N	\N	\N	\N	\N
4797	10	4	\N	\N	\N	\N	\N	\N
4798	13	4	\N	\N	\N	\N	\N	\N
4799	14	4	\N	\N	\N	\N	\N	\N
4800	16	4	\N	\N	\N	\N	\N	\N
4801	18	4	\N	\N	\N	\N	\N	\N
4802	25	4	\N	\N	\N	\N	\N	\N
4803	31	4	\N	\N	\N	\N	\N	\N
4804	32	4	\N	\N	\N	\N	\N	\N
4805	34	4	\N	\N	\N	\N	\N	\N
4806	35	4	\N	\N	\N	\N	\N	\N
4807	37	4	\N	\N	\N	\N	\N	\N
4808	41	4	\N	\N	\N	\N	\N	\N
4809	42	4	\N	\N	\N	\N	\N	\N
4810	43	4	\N	\N	\N	\N	\N	\N
4811	45	4	\N	\N	\N	\N	\N	\N
4812	49	4	\N	\N	\N	\N	\N	\N
4813	50	4	\N	\N	\N	\N	\N	\N
4814	51	4	\N	\N	\N	\N	\N	\N
4815	52	4	\N	\N	\N	\N	\N	\N
4816	53	4	\N	\N	\N	\N	\N	\N
4817	56	4	\N	\N	\N	\N	\N	\N
4818	57	4	\N	\N	\N	\N	\N	\N
4819	58	4	\N	\N	\N	\N	\N	\N
4820	61	4	\N	\N	\N	\N	\N	\N
4821	63	4	\N	\N	\N	\N	\N	\N
4822	64	4	\N	\N	\N	\N	\N	\N
4823	66	4	\N	\N	\N	\N	\N	\N
4824	67	4	\N	\N	\N	\N	\N	\N
4825	68	4	\N	\N	\N	\N	\N	\N
4826	69	4	\N	\N	\N	\N	\N	\N
4827	70	4	\N	\N	\N	\N	\N	\N
4828	71	4	\N	\N	\N	\N	\N	\N
4829	72	4	\N	\N	\N	\N	\N	\N
4830	74	4	\N	\N	\N	\N	\N	\N
4831	75	4	\N	\N	\N	\N	\N	\N
4832	76	4	\N	\N	\N	\N	\N	\N
4833	77	4	\N	\N	\N	\N	\N	\N
4834	78	4	\N	\N	\N	\N	\N	\N
4835	79	4	\N	\N	\N	\N	\N	\N
4836	80	4	\N	\N	\N	\N	\N	\N
4837	83	4	\N	\N	\N	\N	\N	\N
4838	84	4	\N	\N	\N	\N	\N	\N
4839	87	4	\N	\N	\N	\N	\N	\N
4840	88	4	\N	\N	\N	\N	\N	\N
4841	89	4	\N	\N	\N	\N	\N	\N
4842	90	4	\N	\N	\N	\N	\N	\N
4843	93	4	\N	\N	\N	\N	\N	\N
4844	99	4	\N	\N	\N	\N	\N	\N
4845	101	4	\N	\N	\N	\N	\N	\N
4846	103	4	\N	\N	\N	\N	\N	\N
4847	109	4	\N	\N	\N	\N	\N	\N
4848	113	4	\N	\N	\N	\N	\N	\N
4849	114	4	\N	\N	\N	\N	\N	\N
4850	117	4	\N	\N	\N	\N	\N	\N
4851	118	4	\N	\N	\N	\N	\N	\N
4852	120	4	\N	\N	\N	\N	\N	\N
4853	121	4	\N	\N	\N	\N	\N	\N
4854	122	4	\N	\N	\N	\N	\N	\N
4855	125	4	\N	\N	\N	\N	\N	\N
4856	128	4	\N	\N	\N	\N	\N	\N
4857	129	4	\N	\N	\N	\N	\N	\N
4858	130	4	\N	\N	\N	\N	\N	\N
4859	131	4	\N	\N	\N	\N	\N	\N
4860	132	4	\N	\N	\N	\N	\N	\N
4861	134	4	\N	\N	\N	\N	\N	\N
4862	135	4	\N	\N	\N	\N	\N	\N
4863	138	4	\N	\N	\N	\N	\N	\N
4864	141	4	\N	\N	\N	\N	\N	\N
4865	142	4	\N	\N	\N	\N	\N	\N
4866	145	4	\N	\N	\N	\N	\N	\N
4867	148	4	\N	\N	\N	\N	\N	\N
4868	150	4	\N	\N	\N	\N	\N	\N
4869	151	4	\N	\N	\N	\N	\N	\N
4870	154	4	\N	\N	\N	\N	\N	\N
4871	159	4	\N	\N	\N	\N	\N	\N
4872	160	4	\N	\N	\N	\N	\N	\N
4873	161	4	\N	\N	\N	\N	\N	\N
4874	164	4	\N	\N	\N	\N	\N	\N
4875	168	4	\N	\N	\N	\N	\N	\N
4876	170	4	\N	\N	\N	\N	\N	\N
4877	174	4	\N	\N	\N	\N	\N	\N
4878	175	4	\N	\N	\N	\N	\N	\N
4879	181	4	\N	\N	\N	\N	\N	\N
4880	182	4	\N	\N	\N	\N	\N	\N
4881	199	4	\N	\N	\N	\N	\N	\N
4882	201	4	\N	\N	\N	\N	\N	\N
4883	205	4	\N	\N	\N	\N	\N	\N
4884	206	4	\N	\N	\N	\N	\N	\N
4885	212	4	\N	\N	\N	\N	\N	\N
4886	213	4	\N	\N	\N	\N	\N	\N
4887	215	4	\N	\N	\N	\N	\N	\N
4888	217	4	\N	\N	\N	\N	\N	\N
4889	218	4	\N	\N	\N	\N	\N	\N
4890	221	4	\N	\N	\N	\N	\N	\N
4891	224	4	\N	\N	\N	\N	\N	\N
4892	233	4	\N	\N	\N	\N	\N	\N
4893	234	4	\N	\N	\N	\N	\N	\N
4894	254	4	\N	\N	\N	\N	\N	\N
4895	257	4	\N	\N	\N	\N	\N	\N
4896	258	4	\N	\N	\N	\N	\N	\N
4897	260	4	\N	\N	\N	\N	\N	\N
4898	263	4	\N	\N	\N	\N	\N	\N
4899	268	4	\N	\N	\N	\N	\N	\N
4900	269	4	\N	\N	\N	\N	\N	\N
4901	275	4	\N	\N	\N	\N	\N	\N
4902	276	4	\N	\N	\N	\N	\N	\N
4903	278	4	\N	\N	\N	\N	\N	\N
4904	279	4	\N	\N	\N	\N	\N	\N
4905	287	4	\N	\N	\N	\N	\N	\N
4906	290	4	\N	\N	\N	\N	\N	\N
4907	291	4	\N	\N	\N	\N	\N	\N
4908	293	4	\N	\N	\N	\N	\N	\N
4909	295	4	\N	\N	\N	\N	\N	\N
4910	298	4	\N	\N	\N	\N	\N	\N
4911	304	4	\N	\N	\N	\N	\N	\N
4912	312	4	\N	\N	\N	\N	\N	\N
4913	313	4	\N	\N	\N	\N	\N	\N
4914	316	4	\N	\N	\N	\N	\N	\N
4915	317	4	\N	\N	\N	\N	\N	\N
4916	322	4	\N	\N	\N	\N	\N	\N
4917	323	4	\N	\N	\N	\N	\N	\N
4918	325	4	\N	\N	\N	\N	\N	\N
4919	328	4	\N	\N	\N	\N	\N	\N
4920	331	4	\N	\N	\N	\N	\N	\N
4921	333	4	\N	\N	\N	\N	\N	\N
4922	334	4	\N	\N	\N	\N	\N	\N
4923	337	4	\N	\N	\N	\N	\N	\N
4924	338	4	\N	\N	\N	\N	\N	\N
4925	341	4	\N	\N	\N	\N	\N	\N
4926	350	4	\N	\N	\N	\N	\N	\N
4927	353	4	\N	\N	\N	\N	\N	\N
4928	356	4	\N	\N	\N	\N	\N	\N
4929	360	4	\N	\N	\N	\N	\N	\N
4930	362	4	\N	\N	\N	\N	\N	\N
4931	366	4	\N	\N	\N	\N	\N	\N
4932	367	4	\N	\N	\N	\N	\N	\N
4933	370	4	\N	\N	\N	\N	\N	\N
4934	372	4	\N	\N	\N	\N	\N	\N
4935	374	4	\N	\N	\N	\N	\N	\N
4936	377	4	\N	\N	\N	\N	\N	\N
4937	382	4	\N	\N	\N	\N	\N	\N
4938	385	4	\N	\N	\N	\N	\N	\N
4939	386	4	\N	\N	\N	\N	\N	\N
4940	389	4	\N	\N	\N	\N	\N	\N
4941	400	4	\N	\N	\N	\N	\N	\N
4942	405	4	\N	\N	\N	\N	\N	\N
4943	406	4	\N	\N	\N	\N	\N	\N
4944	411	4	\N	\N	\N	\N	\N	\N
4945	415	4	\N	\N	\N	\N	\N	\N
4946	416	4	\N	\N	\N	\N	\N	\N
4947	426	4	\N	\N	\N	\N	\N	\N
4948	448	4	\N	\N	\N	\N	\N	\N
4949	450	4	\N	\N	\N	\N	\N	\N
4950	460	4	\N	\N	\N	\N	\N	\N
4951	461	4	\N	\N	\N	\N	\N	\N
4952	463	4	\N	\N	\N	\N	\N	\N
4953	467	4	\N	\N	\N	\N	\N	\N
4954	468	4	\N	\N	\N	\N	\N	\N
4955	470	4	\N	\N	\N	\N	\N	\N
4956	477	4	\N	\N	\N	\N	\N	\N
4957	495	4	\N	\N	\N	\N	\N	\N
4958	501	4	\N	\N	\N	\N	\N	\N
4959	502	4	\N	\N	\N	\N	\N	\N
4960	506	4	\N	\N	\N	\N	\N	\N
4961	512	4	\N	\N	\N	\N	\N	\N
4962	513	4	\N	\N	\N	\N	\N	\N
4963	520	4	\N	\N	\N	\N	\N	\N
4964	525	4	\N	\N	\N	\N	\N	\N
4965	536	4	\N	\N	\N	\N	\N	\N
4966	541	4	\N	\N	\N	\N	\N	\N
4967	543	4	\N	\N	\N	\N	\N	\N
4968	545	4	\N	\N	\N	\N	\N	\N
4969	549	4	\N	\N	\N	\N	\N	\N
4970	551	4	\N	\N	\N	\N	\N	\N
4971	558	4	\N	\N	\N	\N	\N	\N
4972	572	4	\N	\N	\N	\N	\N	\N
4973	573	4	\N	\N	\N	\N	\N	\N
4974	576	4	\N	\N	\N	\N	\N	\N
4975	584	4	\N	\N	\N	\N	\N	\N
4976	588	4	\N	\N	\N	\N	\N	\N
4977	594	4	\N	\N	\N	\N	\N	\N
4978	597	4	\N	\N	\N	\N	\N	\N
4979	601	4	\N	\N	\N	\N	\N	\N
4980	606	4	\N	\N	\N	\N	\N	\N
4981	623	4	\N	\N	\N	\N	\N	\N
4982	624	4	\N	\N	\N	\N	\N	\N
4983	625	4	\N	\N	\N	\N	\N	\N
4984	626	4	\N	\N	\N	\N	\N	\N
4985	627	4	\N	\N	\N	\N	\N	\N
4986	629	4	\N	\N	\N	\N	\N	\N
4987	633	4	\N	\N	\N	\N	\N	\N
4988	638	4	\N	\N	\N	\N	\N	\N
4989	643	4	\N	\N	\N	\N	\N	\N
4990	644	4	\N	\N	\N	\N	\N	\N
4991	654	4	\N	\N	\N	\N	\N	\N
4992	656	4	\N	\N	\N	\N	\N	\N
4993	659	4	\N	\N	\N	\N	\N	\N
4994	660	4	\N	\N	\N	\N	\N	\N
4995	666	4	\N	\N	\N	\N	\N	\N
4996	680	4	\N	\N	\N	\N	\N	\N
4997	693	4	\N	\N	\N	\N	\N	\N
4998	699	4	\N	\N	\N	\N	\N	\N
4999	702	4	\N	\N	\N	\N	\N	\N
5000	703	4	\N	\N	\N	\N	\N	\N
5001	706	4	\N	\N	\N	\N	\N	\N
5002	707	4	\N	\N	\N	\N	\N	\N
5003	708	4	\N	\N	\N	\N	\N	\N
5004	719	4	\N	\N	\N	\N	\N	\N
5005	720	4	\N	\N	\N	\N	\N	\N
5006	723	4	\N	\N	\N	\N	\N	\N
5007	730	4	\N	\N	\N	\N	\N	\N
5008	733	4	\N	\N	\N	\N	\N	\N
5009	734	4	\N	\N	\N	\N	\N	\N
5010	747	4	\N	\N	\N	\N	\N	\N
5011	760	4	\N	\N	\N	\N	\N	\N
5012	764	4	\N	\N	\N	\N	\N	\N
5013	766	4	\N	\N	\N	\N	\N	\N
5014	778	4	\N	\N	\N	\N	\N	\N
5015	781	4	\N	\N	\N	\N	\N	\N
5016	785	4	\N	\N	\N	\N	\N	\N
5017	788	4	\N	\N	\N	\N	\N	\N
5018	789	4	\N	\N	\N	\N	\N	\N
5019	795	4	\N	\N	\N	\N	\N	\N
5020	796	4	\N	\N	\N	\N	\N	\N
5021	797	4	\N	\N	\N	\N	\N	\N
5022	799	4	\N	\N	\N	\N	\N	\N
5023	812	4	\N	\N	\N	\N	\N	\N
5024	813	4	\N	\N	\N	\N	\N	\N
5025	814	4	\N	\N	\N	\N	\N	\N
5026	815	4	\N	\N	\N	\N	\N	\N
5027	818	4	\N	\N	\N	\N	\N	\N
5028	819	4	\N	\N	\N	\N	\N	\N
5029	823	4	\N	\N	\N	\N	\N	\N
5030	825	4	\N	\N	\N	\N	\N	\N
5031	831	4	\N	\N	\N	\N	\N	\N
5032	833	4	\N	\N	\N	\N	\N	\N
5033	836	4	\N	\N	\N	\N	\N	\N
5034	837	4	\N	\N	\N	\N	\N	\N
5035	841	4	\N	\N	\N	\N	\N	\N
5036	853	4	\N	\N	\N	\N	\N	\N
5037	857	4	\N	\N	\N	\N	\N	\N
5038	859	4	\N	\N	\N	\N	\N	\N
5039	869	4	\N	\N	\N	\N	\N	\N
5040	870	4	\N	\N	\N	\N	\N	\N
5041	873	4	\N	\N	\N	\N	\N	\N
5042	890	4	\N	\N	\N	\N	\N	\N
5043	892	4	\N	\N	\N	\N	\N	\N
5044	894	4	\N	\N	\N	\N	\N	\N
5045	895	4	\N	\N	\N	\N	\N	\N
5046	898	4	\N	\N	\N	\N	\N	\N
5047	911	4	\N	\N	\N	\N	\N	\N
5048	912	4	\N	\N	\N	\N	\N	\N
5049	914	4	\N	\N	\N	\N	\N	\N
5050	916	4	\N	\N	\N	\N	\N	\N
5051	918	4	\N	\N	\N	\N	\N	\N
5052	920	4	\N	\N	\N	\N	\N	\N
5053	921	4	\N	\N	\N	\N	\N	\N
5054	924	4	\N	\N	\N	\N	\N	\N
5055	933	4	\N	\N	\N	\N	\N	\N
5056	934	4	\N	\N	\N	\N	\N	\N
5057	938	4	\N	\N	\N	\N	\N	\N
5058	939	4	\N	\N	\N	\N	\N	\N
5059	945	4	\N	\N	\N	\N	\N	\N
5060	948	4	\N	\N	\N	\N	\N	\N
5061	951	4	\N	\N	\N	\N	\N	\N
5062	954	4	\N	\N	\N	\N	\N	\N
5063	959	4	\N	\N	\N	\N	\N	\N
5064	960	4	\N	\N	\N	\N	\N	\N
5065	964	4	\N	\N	\N	\N	\N	\N
5066	965	4	\N	\N	\N	\N	\N	\N
5067	977	4	\N	\N	\N	\N	\N	\N
5068	978	4	\N	\N	\N	\N	\N	\N
5069	986	4	\N	\N	\N	\N	\N	\N
5070	988	4	\N	\N	\N	\N	\N	\N
5071	990	4	\N	\N	\N	\N	\N	\N
5072	993	4	\N	\N	\N	\N	\N	\N
5073	994	4	\N	\N	\N	\N	\N	\N
5074	998	4	\N	\N	\N	\N	\N	\N
5075	999	4	\N	\N	\N	\N	\N	\N
5076	1002	4	\N	\N	\N	\N	\N	\N
5077	1004	4	\N	\N	\N	\N	\N	\N
5078	1008	4	\N	\N	\N	\N	\N	\N
5079	1010	4	\N	\N	\N	\N	\N	\N
5080	1019	4	\N	\N	\N	\N	\N	\N
5081	1020	4	\N	\N	\N	\N	\N	\N
5082	1022	4	\N	\N	\N	\N	\N	\N
5083	1026	4	\N	\N	\N	\N	\N	\N
5084	1027	4	\N	\N	\N	\N	\N	\N
5085	1028	4	\N	\N	\N	\N	\N	\N
5086	1032	4	\N	\N	\N	\N	\N	\N
5087	1033	4	\N	\N	\N	\N	\N	\N
5088	1035	4	\N	\N	\N	\N	\N	\N
5089	1038	4	\N	\N	\N	\N	\N	\N
5090	1042	4	\N	\N	\N	\N	\N	\N
5091	1044	4	\N	\N	\N	\N	\N	\N
5092	1050	4	\N	\N	\N	\N	\N	\N
5093	1052	4	\N	\N	\N	\N	\N	\N
5094	1053	4	\N	\N	\N	\N	\N	\N
5095	1058	4	\N	\N	\N	\N	\N	\N
5096	1063	4	\N	\N	\N	\N	\N	\N
5097	1066	4	\N	\N	\N	\N	\N	\N
5098	1069	4	\N	\N	\N	\N	\N	\N
5099	1070	4	\N	\N	\N	\N	\N	\N
5100	1082	4	\N	\N	\N	\N	\N	\N
5101	1084	4	\N	\N	\N	\N	\N	\N
5102	1085	4	\N	\N	\N	\N	\N	\N
5103	1087	4	\N	\N	\N	\N	\N	\N
5104	1089	4	\N	\N	\N	\N	\N	\N
5105	1090	4	\N	\N	\N	\N	\N	\N
5106	1093	4	\N	\N	\N	\N	\N	\N
5107	1100	4	\N	\N	\N	\N	\N	\N
5108	1104	4	\N	\N	\N	\N	\N	\N
5109	1106	4	\N	\N	\N	\N	\N	\N
5110	1107	4	\N	\N	\N	\N	\N	\N
5111	1109	4	\N	\N	\N	\N	\N	\N
5112	1110	4	\N	\N	\N	\N	\N	\N
5113	1111	4	\N	\N	\N	\N	\N	\N
5114	1113	4	\N	\N	\N	\N	\N	\N
5115	1120	4	\N	\N	\N	\N	\N	\N
5116	1123	4	\N	\N	\N	\N	\N	\N
5117	1125	4	\N	\N	\N	\N	\N	\N
5118	1135	4	\N	\N	\N	\N	\N	\N
5119	1136	4	\N	\N	\N	\N	\N	\N
5120	1141	4	\N	\N	\N	\N	\N	\N
5121	1146	4	\N	\N	\N	\N	\N	\N
5122	1147	4	\N	\N	\N	\N	\N	\N
5123	1148	4	\N	\N	\N	\N	\N	\N
5124	1153	4	\N	\N	\N	\N	\N	\N
5125	1154	4	\N	\N	\N	\N	\N	\N
5126	1155	4	\N	\N	\N	\N	\N	\N
5127	1156	4	\N	\N	\N	\N	\N	\N
5128	1159	4	\N	\N	\N	\N	\N	\N
5129	1164	4	\N	\N	\N	\N	\N	\N
5130	1165	4	\N	\N	\N	\N	\N	\N
5131	1168	4	\N	\N	\N	\N	\N	\N
5132	1169	4	\N	\N	\N	\N	\N	\N
5133	1172	4	\N	\N	\N	\N	\N	\N
5134	1175	4	\N	\N	\N	\N	\N	\N
5135	1176	4	\N	\N	\N	\N	\N	\N
5136	1182	4	\N	\N	\N	\N	\N	\N
5137	1185	4	\N	\N	\N	\N	\N	\N
5138	1191	4	\N	\N	\N	\N	\N	\N
5139	1193	4	\N	\N	\N	\N	\N	\N
5140	1194	4	\N	\N	\N	\N	\N	\N
5141	1195	4	\N	\N	\N	\N	\N	\N
5142	1198	4	\N	\N	\N	\N	\N	\N
5143	1200	4	\N	\N	\N	\N	\N	\N
5144	1206	4	\N	\N	\N	\N	\N	\N
5145	1208	4	\N	\N	\N	\N	\N	\N
5146	1209	4	\N	\N	\N	\N	\N	\N
5147	1210	4	\N	\N	\N	\N	\N	\N
5148	1212	4	\N	\N	\N	\N	\N	\N
5149	1213	4	\N	\N	\N	\N	\N	\N
5150	1214	4	\N	\N	\N	\N	\N	\N
5151	1216	4	\N	\N	\N	\N	\N	\N
5152	1218	4	\N	\N	\N	\N	\N	\N
5153	1223	4	\N	\N	\N	\N	\N	\N
5154	1226	4	\N	\N	\N	\N	\N	\N
5155	1229	4	\N	\N	\N	\N	\N	\N
5156	1230	4	\N	\N	\N	\N	\N	\N
5157	1234	4	\N	\N	\N	\N	\N	\N
5158	1238	4	\N	\N	\N	\N	\N	\N
5159	1241	4	\N	\N	\N	\N	\N	\N
5160	1244	4	\N	\N	\N	\N	\N	\N
5161	1247	4	\N	\N	\N	\N	\N	\N
5162	1248	4	\N	\N	\N	\N	\N	\N
5163	1249	4	\N	\N	\N	\N	\N	\N
5164	1250	4	\N	\N	\N	\N	\N	\N
5165	1251	4	\N	\N	\N	\N	\N	\N
5166	1252	4	\N	\N	\N	\N	\N	\N
5167	1254	4	\N	\N	\N	\N	\N	\N
5168	1256	4	\N	\N	\N	\N	\N	\N
5169	1257	4	\N	\N	\N	\N	\N	\N
5170	1259	4	\N	\N	\N	\N	\N	\N
5171	1264	4	\N	\N	\N	\N	\N	\N
5172	1266	4	\N	\N	\N	\N	\N	\N
5173	1268	4	\N	\N	\N	\N	\N	\N
5174	1269	4	\N	\N	\N	\N	\N	\N
5175	1271	4	\N	\N	\N	\N	\N	\N
5176	1274	4	\N	\N	\N	\N	\N	\N
5177	1276	4	\N	\N	\N	\N	\N	\N
5178	1279	4	\N	\N	\N	\N	\N	\N
5179	1281	4	\N	\N	\N	\N	\N	\N
5180	1282	4	\N	\N	\N	\N	\N	\N
5181	1283	4	\N	\N	\N	\N	\N	\N
5182	1284	4	\N	\N	\N	\N	\N	\N
5183	1285	4	\N	\N	\N	\N	\N	\N
5184	1286	4	\N	\N	\N	\N	\N	\N
5185	1288	4	\N	\N	\N	\N	\N	\N
5186	1291	4	\N	\N	\N	\N	\N	\N
5187	1294	4	\N	\N	\N	\N	\N	\N
5188	1297	4	\N	\N	\N	\N	\N	\N
5189	1298	4	\N	\N	\N	\N	\N	\N
5190	1299	4	\N	\N	\N	\N	\N	\N
5191	1303	4	\N	\N	\N	\N	\N	\N
5192	1304	4	\N	\N	\N	\N	\N	\N
5193	1306	4	\N	\N	\N	\N	\N	\N
5194	1308	4	\N	\N	\N	\N	\N	\N
5195	1309	4	\N	\N	\N	\N	\N	\N
5196	1312	4	\N	\N	\N	\N	\N	\N
5197	1320	4	\N	\N	\N	\N	\N	\N
5198	1321	4	\N	\N	\N	\N	\N	\N
5199	1322	4	\N	\N	\N	\N	\N	\N
5200	1323	4	\N	\N	\N	\N	\N	\N
5201	1334	4	\N	\N	\N	\N	\N	\N
5202	1336	4	\N	\N	\N	\N	\N	\N
5203	1340	4	\N	\N	\N	\N	\N	\N
5204	1341	4	\N	\N	\N	\N	\N	\N
5205	1343	4	\N	\N	\N	\N	\N	\N
5206	1348	4	\N	\N	\N	\N	\N	\N
5207	1351	4	\N	\N	\N	\N	\N	\N
5208	1352	4	\N	\N	\N	\N	\N	\N
5209	1353	4	\N	\N	\N	\N	\N	\N
5210	1358	4	\N	\N	\N	\N	\N	\N
5211	1361	4	\N	\N	\N	\N	\N	\N
5212	1367	4	\N	\N	\N	\N	\N	\N
5213	1368	4	\N	\N	\N	\N	\N	\N
5214	1371	4	\N	\N	\N	\N	\N	\N
5215	1375	4	\N	\N	\N	\N	\N	\N
5216	1376	4	\N	\N	\N	\N	\N	\N
5217	1380	4	\N	\N	\N	\N	\N	\N
5218	1381	4	\N	\N	\N	\N	\N	\N
5219	1382	4	\N	\N	\N	\N	\N	\N
5220	1387	4	\N	\N	\N	\N	\N	\N
5221	1389	4	\N	\N	\N	\N	\N	\N
5222	1390	4	\N	\N	\N	\N	\N	\N
5223	1391	4	\N	\N	\N	\N	\N	\N
5224	1392	4	\N	\N	\N	\N	\N	\N
5225	1393	4	\N	\N	\N	\N	\N	\N
5226	1395	4	\N	\N	\N	\N	\N	\N
5227	1396	4	\N	\N	\N	\N	\N	\N
5228	1397	4	\N	\N	\N	\N	\N	\N
5229	1398	4	\N	\N	\N	\N	\N	\N
5230	1399	4	\N	\N	\N	\N	\N	\N
5231	1400	4	\N	\N	\N	\N	\N	\N
5232	1403	4	\N	\N	\N	\N	\N	\N
5233	1405	4	\N	\N	\N	\N	\N	\N
5234	1408	4	\N	\N	\N	\N	\N	\N
5235	1409	4	\N	\N	\N	\N	\N	\N
5236	1414	4	\N	\N	\N	\N	\N	\N
5237	1418	4	\N	\N	\N	\N	\N	\N
5238	1420	4	\N	\N	\N	\N	\N	\N
5239	1421	4	\N	\N	\N	\N	\N	\N
5240	1423	4	\N	\N	\N	\N	\N	\N
5241	1425	4	\N	\N	\N	\N	\N	\N
5242	1429	4	\N	\N	\N	\N	\N	\N
5243	1434	4	\N	\N	\N	\N	\N	\N
5244	1435	4	\N	\N	\N	\N	\N	\N
5245	1436	4	\N	\N	\N	\N	\N	\N
5246	1437	4	\N	\N	\N	\N	\N	\N
5247	1439	4	\N	\N	\N	\N	\N	\N
5248	1442	4	\N	\N	\N	\N	\N	\N
5249	1447	4	\N	\N	\N	\N	\N	\N
5250	1448	4	\N	\N	\N	\N	\N	\N
5251	1449	4	\N	\N	\N	\N	\N	\N
5252	1454	4	\N	\N	\N	\N	\N	\N
5253	1455	4	\N	\N	\N	\N	\N	\N
5254	1456	4	\N	\N	\N	\N	\N	\N
5255	1457	4	\N	\N	\N	\N	\N	\N
5256	1459	4	\N	\N	\N	\N	\N	\N
5257	1464	4	\N	\N	\N	\N	\N	\N
5258	1465	4	\N	\N	\N	\N	\N	\N
5259	1466	4	\N	\N	\N	\N	\N	\N
5260	1468	4	\N	\N	\N	\N	\N	\N
5261	1469	4	\N	\N	\N	\N	\N	\N
5262	1472	4	\N	\N	\N	\N	\N	\N
5263	1473	4	\N	\N	\N	\N	\N	\N
5264	1474	4	\N	\N	\N	\N	\N	\N
5265	1475	4	\N	\N	\N	\N	\N	\N
5266	1478	4	\N	\N	\N	\N	\N	\N
5267	1480	4	\N	\N	\N	\N	\N	\N
5268	1481	4	\N	\N	\N	\N	\N	\N
5269	1483	4	\N	\N	\N	\N	\N	\N
5270	1485	4	\N	\N	\N	\N	\N	\N
5271	1486	4	\N	\N	\N	\N	\N	\N
5272	1487	4	\N	\N	\N	\N	\N	\N
5273	1489	4	\N	\N	\N	\N	\N	\N
5274	1492	4	\N	\N	\N	\N	\N	\N
5275	1495	4	\N	\N	\N	\N	\N	\N
5276	1496	4	\N	\N	\N	\N	\N	\N
5277	1497	4	\N	\N	\N	\N	\N	\N
5278	1500	4	\N	\N	\N	\N	\N	\N
5279	1501	4	\N	\N	\N	\N	\N	\N
5280	1503	4	\N	\N	\N	\N	\N	\N
5281	1504	4	\N	\N	\N	\N	\N	\N
5282	1505	4	\N	\N	\N	\N	\N	\N
5283	1506	4	\N	\N	\N	\N	\N	\N
5284	1507	4	\N	\N	\N	\N	\N	\N
5285	1509	4	\N	\N	\N	\N	\N	\N
5286	1510	4	\N	\N	\N	\N	\N	\N
5287	1511	4	\N	\N	\N	\N	\N	\N
5288	1513	4	\N	\N	\N	\N	\N	\N
5289	1514	4	\N	\N	\N	\N	\N	\N
5290	1515	4	\N	\N	\N	\N	\N	\N
5291	1518	4	\N	\N	\N	\N	\N	\N
5292	1520	4	\N	\N	\N	\N	\N	\N
5293	1521	4	\N	\N	\N	\N	\N	\N
5294	1522	4	\N	\N	\N	\N	\N	\N
5295	1523	4	\N	\N	\N	\N	\N	\N
5296	1524	4	\N	\N	\N	\N	\N	\N
5297	1525	4	\N	\N	\N	\N	\N	\N
5298	1526	4	\N	\N	\N	\N	\N	\N
5299	1527	4	\N	\N	\N	\N	\N	\N
5300	1528	4	\N	\N	\N	\N	\N	\N
5301	1529	4	\N	\N	\N	\N	\N	\N
5302	1531	4	\N	\N	\N	\N	\N	\N
5303	1533	4	\N	\N	\N	\N	\N	\N
5304	1534	4	\N	\N	\N	\N	\N	\N
5305	1535	4	\N	\N	\N	\N	\N	\N
5306	1539	4	\N	\N	\N	\N	\N	\N
5307	1542	4	\N	\N	\N	\N	\N	\N
5308	1546	4	\N	\N	\N	\N	\N	\N
5309	1548	4	\N	\N	\N	\N	\N	\N
5310	1550	4	\N	\N	\N	\N	\N	\N
5311	1552	4	\N	\N	\N	\N	\N	\N
5312	1554	4	\N	\N	\N	\N	\N	\N
5313	1555	4	\N	\N	\N	\N	\N	\N
5314	1556	4	\N	\N	\N	\N	\N	\N
5315	1558	4	\N	\N	\N	\N	\N	\N
5316	1559	4	\N	\N	\N	\N	\N	\N
5317	1561	4	\N	\N	\N	\N	\N	\N
5318	1562	4	\N	\N	\N	\N	\N	\N
5319	1563	4	\N	\N	\N	\N	\N	\N
5320	1565	4	\N	\N	\N	\N	\N	\N
5321	1566	4	\N	\N	\N	\N	\N	\N
5322	1567	4	\N	\N	\N	\N	\N	\N
5323	1568	4	\N	\N	\N	\N	\N	\N
5324	1570	4	\N	\N	\N	\N	\N	\N
5325	1575	4	\N	\N	\N	\N	\N	\N
5326	1576	4	\N	\N	\N	\N	\N	\N
5327	1577	4	\N	\N	\N	\N	\N	\N
5328	1578	4	\N	\N	\N	\N	\N	\N
5329	1579	4	\N	\N	\N	\N	\N	\N
5330	1581	4	\N	\N	\N	\N	\N	\N
5331	1582	4	\N	\N	\N	\N	\N	\N
5332	1586	4	\N	\N	\N	\N	\N	\N
5333	1587	4	\N	\N	\N	\N	\N	\N
5334	1588	4	\N	\N	\N	\N	\N	\N
5335	1590	4	\N	\N	\N	\N	\N	\N
5336	1592	4	\N	\N	\N	\N	\N	\N
5337	1595	4	\N	\N	\N	\N	\N	\N
5338	1596	4	\N	\N	\N	\N	\N	\N
5339	1597	4	\N	\N	\N	\N	\N	\N
5340	1598	4	\N	\N	\N	\N	\N	\N
5341	1602	4	\N	\N	\N	\N	\N	\N
5342	1603	4	\N	\N	\N	\N	\N	\N
5343	1605	4	\N	\N	\N	\N	\N	\N
5344	1606	4	\N	\N	\N	\N	\N	\N
5345	1607	4	\N	\N	\N	\N	\N	\N
5346	1608	4	\N	\N	\N	\N	\N	\N
5347	1609	4	\N	\N	\N	\N	\N	\N
5348	1611	4	\N	\N	\N	\N	\N	\N
5349	1614	4	\N	\N	\N	\N	\N	\N
5350	1616	4	\N	\N	\N	\N	\N	\N
5351	1617	4	\N	\N	\N	\N	\N	\N
5352	1618	4	\N	\N	\N	\N	\N	\N
5353	1619	4	\N	\N	\N	\N	\N	\N
5354	1623	4	\N	\N	\N	\N	\N	\N
5355	1624	4	\N	\N	\N	\N	\N	\N
5356	1625	4	\N	\N	\N	\N	\N	\N
5357	1626	4	\N	\N	\N	\N	\N	\N
5358	1628	4	\N	\N	\N	\N	\N	\N
5359	1629	4	\N	\N	\N	\N	\N	\N
5360	1630	4	\N	\N	\N	\N	\N	\N
5361	1631	4	\N	\N	\N	\N	\N	\N
5362	1632	4	\N	\N	\N	\N	\N	\N
5363	1636	4	\N	\N	\N	\N	\N	\N
5364	1637	4	\N	\N	\N	\N	\N	\N
5365	1638	4	\N	\N	\N	\N	\N	\N
5366	1640	4	\N	\N	\N	\N	\N	\N
5367	1642	4	\N	\N	\N	\N	\N	\N
5368	1643	4	\N	\N	\N	\N	\N	\N
5369	1644	4	\N	\N	\N	\N	\N	\N
5370	1647	4	\N	\N	\N	\N	\N	\N
5371	1650	4	\N	\N	\N	\N	\N	\N
5372	1651	4	\N	\N	\N	\N	\N	\N
5373	1654	4	\N	\N	\N	\N	\N	\N
5374	1657	4	\N	\N	\N	\N	\N	\N
5375	1658	4	\N	\N	\N	\N	\N	\N
5376	1659	4	\N	\N	\N	\N	\N	\N
5377	1660	4	\N	\N	\N	\N	\N	\N
5378	1662	4	\N	\N	\N	\N	\N	\N
5379	1665	4	\N	\N	\N	\N	\N	\N
5380	1669	4	\N	\N	\N	\N	\N	\N
5381	1670	4	\N	\N	\N	\N	\N	\N
5382	1671	4	\N	\N	\N	\N	\N	\N
5383	1673	4	\N	\N	\N	\N	\N	\N
5384	1674	4	\N	\N	\N	\N	\N	\N
5385	1676	4	\N	\N	\N	\N	\N	\N
5386	1677	4	\N	\N	\N	\N	\N	\N
5387	1678	4	\N	\N	\N	\N	\N	\N
5388	1679	4	\N	\N	\N	\N	\N	\N
5389	1680	4	\N	\N	\N	\N	\N	\N
5390	1681	4	\N	\N	\N	\N	\N	\N
5391	1683	4	\N	\N	\N	\N	\N	\N
5392	1684	4	\N	\N	\N	\N	\N	\N
5393	1685	4	\N	\N	\N	\N	\N	\N
5394	1686	4	\N	\N	\N	\N	\N	\N
5395	1687	4	\N	\N	\N	\N	\N	\N
5396	1688	4	\N	\N	\N	\N	\N	\N
5397	1690	4	\N	\N	\N	\N	\N	\N
5398	1691	4	\N	\N	\N	\N	\N	\N
5399	1693	4	\N	\N	\N	\N	\N	\N
5400	1694	4	\N	\N	\N	\N	\N	\N
5401	1695	4	\N	\N	\N	\N	\N	\N
5402	1697	4	\N	\N	\N	\N	\N	\N
5403	1698	4	\N	\N	\N	\N	\N	\N
5404	1699	4	\N	\N	\N	\N	\N	\N
5405	1700	4	\N	\N	\N	\N	\N	\N
5406	1702	4	\N	\N	\N	\N	\N	\N
5407	1703	4	\N	\N	\N	\N	\N	\N
5408	1704	4	\N	\N	\N	\N	\N	\N
5409	1706	4	\N	\N	\N	\N	\N	\N
5410	1707	4	\N	\N	\N	\N	\N	\N
5411	1708	4	\N	\N	\N	\N	\N	\N
5412	1709	4	\N	\N	\N	\N	\N	\N
5413	1710	4	\N	\N	\N	\N	\N	\N
5414	1711	4	\N	\N	\N	\N	\N	\N
5415	1712	4	\N	\N	\N	\N	\N	\N
5416	1714	4	\N	\N	\N	\N	\N	\N
5417	1715	4	\N	\N	\N	\N	\N	\N
5418	1716	4	\N	\N	\N	\N	\N	\N
5419	1717	4	\N	\N	\N	\N	\N	\N
5420	1719	4	\N	\N	\N	\N	\N	\N
5421	1720	4	\N	\N	\N	\N	\N	\N
5422	1721	4	\N	\N	\N	\N	\N	\N
5423	1722	4	\N	\N	\N	\N	\N	\N
5424	1723	4	\N	\N	\N	\N	\N	\N
5425	1724	4	\N	\N	\N	\N	\N	\N
5426	1726	4	\N	\N	\N	\N	\N	\N
5427	1727	4	\N	\N	\N	\N	\N	\N
5428	1728	4	\N	\N	\N	\N	\N	\N
5429	1729	4	\N	\N	\N	\N	\N	\N
5430	1731	4	\N	\N	\N	\N	\N	\N
5431	1732	4	\N	\N	\N	\N	\N	\N
5432	1733	4	\N	\N	\N	\N	\N	\N
5433	1736	4	\N	\N	\N	\N	\N	\N
5434	1737	4	\N	\N	\N	\N	\N	\N
5435	1738	4	\N	\N	\N	\N	\N	\N
5436	1739	4	\N	\N	\N	\N	\N	\N
5437	1741	4	\N	\N	\N	\N	\N	\N
5438	1742	4	\N	\N	\N	\N	\N	\N
5439	1743	4	\N	\N	\N	\N	\N	\N
5440	1745	4	\N	\N	\N	\N	\N	\N
5441	1746	4	\N	\N	\N	\N	\N	\N
5442	1747	4	\N	\N	\N	\N	\N	\N
5443	1748	4	\N	\N	\N	\N	\N	\N
5444	1750	4	\N	\N	\N	\N	\N	\N
5445	1752	4	\N	\N	\N	\N	\N	\N
5446	1753	4	\N	\N	\N	\N	\N	\N
5447	1754	4	\N	\N	\N	\N	\N	\N
5448	1755	4	\N	\N	\N	\N	\N	\N
5449	1757	4	\N	\N	\N	\N	\N	\N
5450	1758	4	\N	\N	\N	\N	\N	\N
5451	1759	4	\N	\N	\N	\N	\N	\N
5452	1760	4	\N	\N	\N	\N	\N	\N
5453	1762	4	\N	\N	\N	\N	\N	\N
5454	1763	4	\N	\N	\N	\N	\N	\N
5455	1765	4	\N	\N	\N	\N	\N	\N
5456	1767	4	\N	\N	\N	\N	\N	\N
5457	1768	4	\N	\N	\N	\N	\N	\N
5458	1769	4	\N	\N	\N	\N	\N	\N
5459	1771	4	\N	\N	\N	\N	\N	\N
5460	1772	4	\N	\N	\N	\N	\N	\N
5461	1773	4	\N	\N	\N	\N	\N	\N
5462	1774	4	\N	\N	\N	\N	\N	\N
5463	1775	4	\N	\N	\N	\N	\N	\N
5464	1776	4	\N	\N	\N	\N	\N	\N
5465	1777	4	\N	\N	\N	\N	\N	\N
5466	1778	4	\N	\N	\N	\N	\N	\N
5467	1779	4	\N	\N	\N	\N	\N	\N
5468	1781	4	\N	\N	\N	\N	\N	\N
5469	1782	4	\N	\N	\N	\N	\N	\N
5470	1783	4	\N	\N	\N	\N	\N	\N
5471	1784	4	\N	\N	\N	\N	\N	\N
5472	1785	4	\N	\N	\N	\N	\N	\N
5473	1786	4	\N	\N	\N	\N	\N	\N
5474	1787	4	\N	\N	\N	\N	\N	\N
5475	1788	4	\N	\N	\N	\N	\N	\N
5476	1789	4	\N	\N	\N	\N	\N	\N
5477	1790	4	\N	\N	\N	\N	\N	\N
5478	1792	4	\N	\N	\N	\N	\N	\N
5479	1793	4	\N	\N	\N	\N	\N	\N
5480	1795	4	\N	\N	\N	\N	\N	\N
5481	1797	4	\N	\N	\N	\N	\N	\N
5482	1798	4	\N	\N	\N	\N	\N	\N
5483	1799	4	\N	\N	\N	\N	\N	\N
5484	1801	4	\N	\N	\N	\N	\N	\N
5485	1803	4	\N	\N	\N	\N	\N	\N
5486	1805	4	\N	\N	\N	\N	\N	\N
5487	1807	4	\N	\N	\N	\N	\N	\N
5488	1808	4	\N	\N	\N	\N	\N	\N
5489	1809	4	\N	\N	\N	\N	\N	\N
5490	1810	4	\N	\N	\N	\N	\N	\N
5491	1811	4	\N	\N	\N	\N	\N	\N
5492	1812	4	\N	\N	\N	\N	\N	\N
5493	1814	4	\N	\N	\N	\N	\N	\N
5494	1815	4	\N	\N	\N	\N	\N	\N
5495	1816	4	\N	\N	\N	\N	\N	\N
5496	1817	4	\N	\N	\N	\N	\N	\N
5497	1818	4	\N	\N	\N	\N	\N	\N
5498	1819	4	\N	\N	\N	\N	\N	\N
5499	1824	4	\N	\N	\N	\N	\N	\N
5500	1825	4	\N	\N	\N	\N	\N	\N
5501	1826	4	\N	\N	\N	\N	\N	\N
5502	1828	4	\N	\N	\N	\N	\N	\N
5503	1830	4	\N	\N	\N	\N	\N	\N
5504	1831	4	\N	\N	\N	\N	\N	\N
5505	1832	4	\N	\N	\N	\N	\N	\N
5506	1833	4	\N	\N	\N	\N	\N	\N
5507	1834	4	\N	\N	\N	\N	\N	\N
5508	1835	4	\N	\N	\N	\N	\N	\N
5509	1836	4	\N	\N	\N	\N	\N	\N
5510	1837	4	\N	\N	\N	\N	\N	\N
5511	1838	4	\N	\N	\N	\N	\N	\N
5512	1839	4	\N	\N	\N	\N	\N	\N
5513	1840	4	\N	\N	\N	\N	\N	\N
5514	1841	4	\N	\N	\N	\N	\N	\N
5515	1842	4	\N	\N	\N	\N	\N	\N
5516	1843	4	\N	\N	\N	\N	\N	\N
5517	1845	4	\N	\N	\N	\N	\N	\N
5518	1846	4	\N	\N	\N	\N	\N	\N
5519	1847	4	\N	\N	\N	\N	\N	\N
5520	1848	4	\N	\N	\N	\N	\N	\N
5521	1849	4	\N	\N	\N	\N	\N	\N
5522	1850	4	\N	\N	\N	\N	\N	\N
5523	1851	4	\N	\N	\N	\N	\N	\N
5524	1852	4	\N	\N	\N	\N	\N	\N
5525	1853	4	\N	\N	\N	\N	\N	\N
5526	1856	4	\N	\N	\N	\N	\N	\N
5527	1857	4	\N	\N	\N	\N	\N	\N
5528	1861	4	\N	\N	\N	\N	\N	\N
5529	1863	4	\N	\N	\N	\N	\N	\N
5530	1864	4	\N	\N	\N	\N	\N	\N
5531	1865	4	\N	\N	\N	\N	\N	\N
5532	1866	4	\N	\N	\N	\N	\N	\N
5533	1869	4	\N	\N	\N	\N	\N	\N
5534	1871	4	\N	\N	\N	\N	\N	\N
5535	1872	4	\N	\N	\N	\N	\N	\N
5536	1873	4	\N	\N	\N	\N	\N	\N
5537	1876	4	\N	\N	\N	\N	\N	\N
5538	1877	4	\N	\N	\N	\N	\N	\N
5539	1878	4	\N	\N	\N	\N	\N	\N
5540	1881	4	\N	\N	\N	\N	\N	\N
5541	1882	4	\N	\N	\N	\N	\N	\N
5542	1883	4	\N	\N	\N	\N	\N	\N
5543	1884	4	\N	\N	\N	\N	\N	\N
5544	1885	4	\N	\N	\N	\N	\N	\N
5545	1886	4	\N	\N	\N	\N	\N	\N
5546	1887	4	\N	\N	\N	\N	\N	\N
5547	1888	4	\N	\N	\N	\N	\N	\N
5548	1889	4	\N	\N	\N	\N	\N	\N
5549	1890	4	\N	\N	\N	\N	\N	\N
5550	1894	4	\N	\N	\N	\N	\N	\N
5551	1896	4	\N	\N	\N	\N	\N	\N
5552	1897	4	\N	\N	\N	\N	\N	\N
5553	1898	4	\N	\N	\N	\N	\N	\N
5554	1899	4	\N	\N	\N	\N	\N	\N
5555	1900	4	\N	\N	\N	\N	\N	\N
5556	1902	4	\N	\N	\N	\N	\N	\N
5557	1903	4	\N	\N	\N	\N	\N	\N
5558	1904	4	\N	\N	\N	\N	\N	\N
5559	1905	4	\N	\N	\N	\N	\N	\N
5560	1907	4	\N	\N	\N	\N	\N	\N
5561	1908	4	\N	\N	\N	\N	\N	\N
5562	1910	4	\N	\N	\N	\N	\N	\N
5563	1912	4	\N	\N	\N	\N	\N	\N
5564	1913	4	\N	\N	\N	\N	\N	\N
5565	1915	4	\N	\N	\N	\N	\N	\N
5566	1916	4	\N	\N	\N	\N	\N	\N
5567	1917	4	\N	\N	\N	\N	\N	\N
5568	1918	4	\N	\N	\N	\N	\N	\N
5569	1920	4	\N	\N	\N	\N	\N	\N
5570	1921	4	\N	\N	\N	\N	\N	\N
5571	1922	4	\N	\N	\N	\N	\N	\N
5572	1923	4	\N	\N	\N	\N	\N	\N
5573	1925	4	\N	\N	\N	\N	\N	\N
5574	1926	4	\N	\N	\N	\N	\N	\N
5575	1927	4	\N	\N	\N	\N	\N	\N
5576	1930	4	\N	\N	\N	\N	\N	\N
5577	1931	4	\N	\N	\N	\N	\N	\N
5578	1933	4	\N	\N	\N	\N	\N	\N
5579	1934	4	\N	\N	\N	\N	\N	\N
5580	1935	4	\N	\N	\N	\N	\N	\N
5581	1937	4	\N	\N	\N	\N	\N	\N
5582	1938	4	\N	\N	\N	\N	\N	\N
5583	1942	4	\N	\N	\N	\N	\N	\N
5584	1943	4	\N	\N	\N	\N	\N	\N
5585	1945	4	\N	\N	\N	\N	\N	\N
5586	1946	4	\N	\N	\N	\N	\N	\N
5587	1947	4	\N	\N	\N	\N	\N	\N
5588	1948	4	\N	\N	\N	\N	\N	\N
5589	1949	4	\N	\N	\N	\N	\N	\N
5590	1950	4	\N	\N	\N	\N	\N	\N
5591	1951	4	\N	\N	\N	\N	\N	\N
5592	1952	4	\N	\N	\N	\N	\N	\N
5593	1954	4	\N	\N	\N	\N	\N	\N
5594	1955	4	\N	\N	\N	\N	\N	\N
5595	1956	4	\N	\N	\N	\N	\N	\N
5596	1958	4	\N	\N	\N	\N	\N	\N
5597	1959	4	\N	\N	\N	\N	\N	\N
5598	1961	4	\N	\N	\N	\N	\N	\N
5599	1962	4	\N	\N	\N	\N	\N	\N
5600	1963	4	\N	\N	\N	\N	\N	\N
5601	1964	4	\N	\N	\N	\N	\N	\N
5602	1965	4	\N	\N	\N	\N	\N	\N
5603	1966	4	\N	\N	\N	\N	\N	\N
5604	1967	4	\N	\N	\N	\N	\N	\N
5605	1968	4	\N	\N	\N	\N	\N	\N
5606	1969	4	\N	\N	\N	\N	\N	\N
5607	1970	4	\N	\N	\N	\N	\N	\N
5608	1971	4	\N	\N	\N	\N	\N	\N
5609	1973	4	\N	\N	\N	\N	\N	\N
5610	1974	4	\N	\N	\N	\N	\N	\N
5611	1975	4	\N	\N	\N	\N	\N	\N
5612	1976	4	\N	\N	\N	\N	\N	\N
5613	1979	4	\N	\N	\N	\N	\N	\N
5614	1980	4	\N	\N	\N	\N	\N	\N
5615	1981	4	\N	\N	\N	\N	\N	\N
5616	1982	4	\N	\N	\N	\N	\N	\N
5617	1983	4	\N	\N	\N	\N	\N	\N
5618	1984	4	\N	\N	\N	\N	\N	\N
5619	1985	4	\N	\N	\N	\N	\N	\N
5620	1986	4	\N	\N	\N	\N	\N	\N
5621	1987	4	\N	\N	\N	\N	\N	\N
5622	1988	4	\N	\N	\N	\N	\N	\N
5623	1989	4	\N	\N	\N	\N	\N	\N
5624	1990	4	\N	\N	\N	\N	\N	\N
5625	1991	4	\N	\N	\N	\N	\N	\N
5626	1993	4	\N	\N	\N	\N	\N	\N
5627	1994	4	\N	\N	\N	\N	\N	\N
5628	1995	4	\N	\N	\N	\N	\N	\N
5629	1996	4	\N	\N	\N	\N	\N	\N
5630	1998	4	\N	\N	\N	\N	\N	\N
5631	1999	4	\N	\N	\N	\N	\N	\N
5632	2000	4	\N	\N	\N	\N	\N	\N
5633	2001	4	\N	\N	\N	\N	\N	\N
5634	2002	4	\N	\N	\N	\N	\N	\N
5635	2004	4	\N	\N	\N	\N	\N	\N
5636	2005	4	\N	\N	\N	\N	\N	\N
5637	2006	4	\N	\N	\N	\N	\N	\N
5638	2007	4	\N	\N	\N	\N	\N	\N
5639	2008	4	\N	\N	\N	\N	\N	\N
5640	2009	4	\N	\N	\N	\N	\N	\N
5641	2010	4	\N	\N	\N	\N	\N	\N
5642	2011	4	\N	\N	\N	\N	\N	\N
5643	2012	4	\N	\N	\N	\N	\N	\N
5644	2013	4	\N	\N	\N	\N	\N	\N
5645	2015	4	\N	\N	\N	\N	\N	\N
5646	2017	4	\N	\N	\N	\N	\N	\N
5647	2018	4	\N	\N	\N	\N	\N	\N
5648	2019	4	\N	\N	\N	\N	\N	\N
5649	2021	4	\N	\N	\N	\N	\N	\N
5650	2022	4	\N	\N	\N	\N	\N	\N
5651	2024	4	\N	\N	\N	\N	\N	\N
5652	2025	4	\N	\N	\N	\N	\N	\N
5653	2026	4	\N	\N	\N	\N	\N	\N
5654	2027	4	\N	\N	\N	\N	\N	\N
5655	2029	4	\N	\N	\N	\N	\N	\N
5656	2030	4	\N	\N	\N	\N	\N	\N
5657	2031	4	\N	\N	\N	\N	\N	\N
5658	2032	4	\N	\N	\N	\N	\N	\N
5659	2033	4	\N	\N	\N	\N	\N	\N
5660	2034	4	\N	\N	\N	\N	\N	\N
5661	2036	4	\N	\N	\N	\N	\N	\N
5662	2037	4	\N	\N	\N	\N	\N	\N
5663	2038	4	\N	\N	\N	\N	\N	\N
5664	2039	4	\N	\N	\N	\N	\N	\N
5665	2040	4	\N	\N	\N	\N	\N	\N
5666	2041	4	\N	\N	\N	\N	\N	\N
5667	2042	4	\N	\N	\N	\N	\N	\N
5668	2043	4	\N	\N	\N	\N	\N	\N
5669	2044	4	\N	\N	\N	\N	\N	\N
5670	2045	4	\N	\N	\N	\N	\N	\N
5671	2046	4	\N	\N	\N	\N	\N	\N
5672	2047	4	\N	\N	\N	\N	\N	\N
5673	2048	4	\N	\N	\N	\N	\N	\N
5674	2049	4	\N	\N	\N	\N	\N	\N
5675	2050	4	\N	\N	\N	\N	\N	\N
5676	2051	4	\N	\N	\N	\N	\N	\N
5677	2053	4	\N	\N	\N	\N	\N	\N
5678	2054	4	\N	\N	\N	\N	\N	\N
5679	2055	4	\N	\N	\N	\N	\N	\N
5680	2056	4	\N	\N	\N	\N	\N	\N
5681	2057	4	\N	\N	\N	\N	\N	\N
5682	2058	4	\N	\N	\N	\N	\N	\N
5683	2059	4	\N	\N	\N	\N	\N	\N
5684	2060	4	\N	\N	\N	\N	\N	\N
5685	2061	4	\N	\N	\N	\N	\N	\N
5686	2062	4	\N	\N	\N	\N	\N	\N
5687	2063	4	\N	\N	\N	\N	\N	\N
5688	2064	4	\N	\N	\N	\N	\N	\N
5689	2065	4	\N	\N	\N	\N	\N	\N
5690	2066	4	\N	\N	\N	\N	\N	\N
5691	2067	4	\N	\N	\N	\N	\N	\N
5692	2069	4	\N	\N	\N	\N	\N	\N
5693	2070	4	\N	\N	\N	\N	\N	\N
5694	2071	4	\N	\N	\N	\N	\N	\N
5695	2072	4	\N	\N	\N	\N	\N	\N
5696	2074	4	\N	\N	\N	\N	\N	\N
5697	2076	4	\N	\N	\N	\N	\N	\N
5698	2077	4	\N	\N	\N	\N	\N	\N
5699	2078	4	\N	\N	\N	\N	\N	\N
5700	2079	4	\N	\N	\N	\N	\N	\N
5701	2080	4	\N	\N	\N	\N	\N	\N
5702	2081	4	\N	\N	\N	\N	\N	\N
5703	2082	4	\N	\N	\N	\N	\N	\N
5704	2083	4	\N	\N	\N	\N	\N	\N
5705	2087	4	\N	\N	\N	\N	\N	\N
5706	2088	4	\N	\N	\N	\N	\N	\N
5707	2089	4	\N	\N	\N	\N	\N	\N
5708	2090	4	\N	\N	\N	\N	\N	\N
5709	2091	4	\N	\N	\N	\N	\N	\N
5710	2092	4	\N	\N	\N	\N	\N	\N
5711	2093	4	\N	\N	\N	\N	\N	\N
5712	2094	4	\N	\N	\N	\N	\N	\N
5713	2095	4	\N	\N	\N	\N	\N	\N
5714	2096	4	\N	\N	\N	\N	\N	\N
5715	2098	4	\N	\N	\N	\N	\N	\N
5716	2099	4	\N	\N	\N	\N	\N	\N
5717	2100	4	\N	\N	\N	\N	\N	\N
5718	2101	4	\N	\N	\N	\N	\N	\N
5719	2103	4	\N	\N	\N	\N	\N	\N
5720	2104	4	\N	\N	\N	\N	\N	\N
5721	2105	4	\N	\N	\N	\N	\N	\N
5722	2106	4	\N	\N	\N	\N	\N	\N
5723	2107	4	\N	\N	\N	\N	\N	\N
5724	2109	4	\N	\N	\N	\N	\N	\N
5725	2110	4	\N	\N	\N	\N	\N	\N
5726	2112	4	\N	\N	\N	\N	\N	\N
5727	2114	4	\N	\N	\N	\N	\N	\N
5728	2115	4	\N	\N	\N	\N	\N	\N
5729	2117	4	\N	\N	\N	\N	\N	\N
5730	2118	4	\N	\N	\N	\N	\N	\N
5731	2119	4	\N	\N	\N	\N	\N	\N
5732	2120	4	\N	\N	\N	\N	\N	\N
5733	2122	4	\N	\N	\N	\N	\N	\N
5734	2123	4	\N	\N	\N	\N	\N	\N
5735	2124	4	\N	\N	\N	\N	\N	\N
5736	2125	4	\N	\N	\N	\N	\N	\N
5737	2126	4	\N	\N	\N	\N	\N	\N
5738	2127	4	\N	\N	\N	\N	\N	\N
5739	2129	4	\N	\N	\N	\N	\N	\N
5740	2130	4	\N	\N	\N	\N	\N	\N
5741	2132	4	\N	\N	\N	\N	\N	\N
5742	2134	4	\N	\N	\N	\N	\N	\N
5743	2135	4	\N	\N	\N	\N	\N	\N
5744	2136	4	\N	\N	\N	\N	\N	\N
5745	2137	4	\N	\N	\N	\N	\N	\N
5746	2138	4	\N	\N	\N	\N	\N	\N
5747	2139	4	\N	\N	\N	\N	\N	\N
5748	2142	4	\N	\N	\N	\N	\N	\N
5749	2143	4	\N	\N	\N	\N	\N	\N
5750	2144	4	\N	\N	\N	\N	\N	\N
5751	2146	4	\N	\N	\N	\N	\N	\N
5752	2147	4	\N	\N	\N	\N	\N	\N
5753	2148	4	\N	\N	\N	\N	\N	\N
5754	2149	4	\N	\N	\N	\N	\N	\N
5755	2150	4	\N	\N	\N	\N	\N	\N
5756	2151	4	\N	\N	\N	\N	\N	\N
5757	2152	4	\N	\N	\N	\N	\N	\N
5758	2153	4	\N	\N	\N	\N	\N	\N
5759	2157	4	\N	\N	\N	\N	\N	\N
5760	2158	4	\N	\N	\N	\N	\N	\N
5761	2159	4	\N	\N	\N	\N	\N	\N
5762	2160	4	\N	\N	\N	\N	\N	\N
5763	2161	4	\N	\N	\N	\N	\N	\N
5764	2162	4	\N	\N	\N	\N	\N	\N
5765	2163	4	\N	\N	\N	\N	\N	\N
5766	2165	4	\N	\N	\N	\N	\N	\N
5767	2166	4	\N	\N	\N	\N	\N	\N
5768	2167	4	\N	\N	\N	\N	\N	\N
5769	2168	4	\N	\N	\N	\N	\N	\N
5770	2170	4	\N	\N	\N	\N	\N	\N
5771	2171	4	\N	\N	\N	\N	\N	\N
5772	2172	4	\N	\N	\N	\N	\N	\N
5773	2173	4	\N	\N	\N	\N	\N	\N
5774	2174	4	\N	\N	\N	\N	\N	\N
5775	2175	4	\N	\N	\N	\N	\N	\N
5776	2176	4	\N	\N	\N	\N	\N	\N
5777	2177	4	\N	\N	\N	\N	\N	\N
5778	2178	4	\N	\N	\N	\N	\N	\N
5779	2179	4	\N	\N	\N	\N	\N	\N
5780	2180	4	\N	\N	\N	\N	\N	\N
5781	2181	4	\N	\N	\N	\N	\N	\N
5782	2182	4	\N	\N	\N	\N	\N	\N
5783	2183	4	\N	\N	\N	\N	\N	\N
5784	2184	4	\N	\N	\N	\N	\N	\N
5785	2185	4	\N	\N	\N	\N	\N	\N
5786	2187	4	\N	\N	\N	\N	\N	\N
5787	2189	4	\N	\N	\N	\N	\N	\N
5788	2190	4	\N	\N	\N	\N	\N	\N
5789	2191	4	\N	\N	\N	\N	\N	\N
5790	2192	4	\N	\N	\N	\N	\N	\N
5791	2193	4	\N	\N	\N	\N	\N	\N
5792	2194	4	\N	\N	\N	\N	\N	\N
5793	2196	4	\N	\N	\N	\N	\N	\N
5794	2198	4	\N	\N	\N	\N	\N	\N
5795	2199	4	\N	\N	\N	\N	\N	\N
5796	2200	4	\N	\N	\N	\N	\N	\N
5797	2201	4	\N	\N	\N	\N	\N	\N
5798	2202	4	\N	\N	\N	\N	\N	\N
5799	2204	4	\N	\N	\N	\N	\N	\N
5800	2205	4	\N	\N	\N	\N	\N	\N
5801	2207	4	\N	\N	\N	\N	\N	\N
5802	2208	4	\N	\N	\N	\N	\N	\N
5803	2209	4	\N	\N	\N	\N	\N	\N
5804	2211	4	\N	\N	\N	\N	\N	\N
5805	2212	4	\N	\N	\N	\N	\N	\N
5806	2213	4	\N	\N	\N	\N	\N	\N
5807	2214	4	\N	\N	\N	\N	\N	\N
5808	2215	4	\N	\N	\N	\N	\N	\N
5809	2217	4	\N	\N	\N	\N	\N	\N
5810	2218	4	\N	\N	\N	\N	\N	\N
5811	2219	4	\N	\N	\N	\N	\N	\N
5812	2221	4	\N	\N	\N	\N	\N	\N
5813	2222	4	\N	\N	\N	\N	\N	\N
5814	2223	4	\N	\N	\N	\N	\N	\N
5815	2224	4	\N	\N	\N	\N	\N	\N
5816	2225	4	\N	\N	\N	\N	\N	\N
5817	2228	4	\N	\N	\N	\N	\N	\N
5818	2229	4	\N	\N	\N	\N	\N	\N
5819	2230	4	\N	\N	\N	\N	\N	\N
5820	2231	4	\N	\N	\N	\N	\N	\N
5821	2232	4	\N	\N	\N	\N	\N	\N
5822	2235	4	\N	\N	\N	\N	\N	\N
5823	2236	4	\N	\N	\N	\N	\N	\N
5824	2237	4	\N	\N	\N	\N	\N	\N
5825	2239	4	\N	\N	\N	\N	\N	\N
5826	2240	4	\N	\N	\N	\N	\N	\N
5827	2241	4	\N	\N	\N	\N	\N	\N
5828	2242	4	\N	\N	\N	\N	\N	\N
5829	2243	4	\N	\N	\N	\N	\N	\N
5830	2244	4	\N	\N	\N	\N	\N	\N
5831	2245	4	\N	\N	\N	\N	\N	\N
5832	2246	4	\N	\N	\N	\N	\N	\N
5833	2247	4	\N	\N	\N	\N	\N	\N
5834	2248	4	\N	\N	\N	\N	\N	\N
5835	2249	4	\N	\N	\N	\N	\N	\N
5836	2250	4	\N	\N	\N	\N	\N	\N
5837	2251	4	\N	\N	\N	\N	\N	\N
5838	2253	4	\N	\N	\N	\N	\N	\N
5839	2255	4	\N	\N	\N	\N	\N	\N
5840	2256	4	\N	\N	\N	\N	\N	\N
5841	2257	4	\N	\N	\N	\N	\N	\N
5842	2258	4	\N	\N	\N	\N	\N	\N
5843	2259	4	\N	\N	\N	\N	\N	\N
5844	2260	4	\N	\N	\N	\N	\N	\N
5845	2261	4	\N	\N	\N	\N	\N	\N
5846	2262	4	\N	\N	\N	\N	\N	\N
5847	2263	4	\N	\N	\N	\N	\N	\N
5848	2264	4	\N	\N	\N	\N	\N	\N
5849	2265	4	\N	\N	\N	\N	\N	\N
5850	2266	4	\N	\N	\N	\N	\N	\N
5851	2267	4	\N	\N	\N	\N	\N	\N
5852	2268	4	\N	\N	\N	\N	\N	\N
5853	2269	4	\N	\N	\N	\N	\N	\N
5854	2270	4	\N	\N	\N	\N	\N	\N
5855	2271	4	\N	\N	\N	\N	\N	\N
5856	2272	4	\N	\N	\N	\N	\N	\N
5857	2273	4	\N	\N	\N	\N	\N	\N
5858	2274	4	\N	\N	\N	\N	\N	\N
5859	2275	4	\N	\N	\N	\N	\N	\N
5860	2276	4	\N	\N	\N	\N	\N	\N
5861	2277	4	\N	\N	\N	\N	\N	\N
5862	2278	4	\N	\N	\N	\N	\N	\N
5863	2279	4	\N	\N	\N	\N	\N	\N
5864	2280	4	\N	\N	\N	\N	\N	\N
5865	2281	4	\N	\N	\N	\N	\N	\N
5866	2282	4	\N	\N	\N	\N	\N	\N
5867	2283	4	\N	\N	\N	\N	\N	\N
5868	2284	4	\N	\N	\N	\N	\N	\N
5869	2285	4	\N	\N	\N	\N	\N	\N
5870	2286	4	\N	\N	\N	\N	\N	\N
5871	2287	4	\N	\N	\N	\N	\N	\N
5872	2288	4	\N	\N	\N	\N	\N	\N
5873	2289	4	\N	\N	\N	\N	\N	\N
5874	2290	4	\N	\N	\N	\N	\N	\N
5875	2291	4	\N	\N	\N	\N	\N	\N
5876	2293	4	\N	\N	\N	\N	\N	\N
5877	2295	4	\N	\N	\N	\N	\N	\N
5878	2296	4	\N	\N	\N	\N	\N	\N
5879	2297	4	\N	\N	\N	\N	\N	\N
5880	2298	4	\N	\N	\N	\N	\N	\N
5881	2299	4	\N	\N	\N	\N	\N	\N
5882	2300	4	\N	\N	\N	\N	\N	\N
5883	2303	4	\N	\N	\N	\N	\N	\N
5884	2304	4	\N	\N	\N	\N	\N	\N
5885	2305	4	\N	\N	\N	\N	\N	\N
5886	2306	4	\N	\N	\N	\N	\N	\N
5887	2307	4	\N	\N	\N	\N	\N	\N
5888	2308	4	\N	\N	\N	\N	\N	\N
5889	2309	4	\N	\N	\N	\N	\N	\N
5890	2310	4	\N	\N	\N	\N	\N	\N
5891	2311	4	\N	\N	\N	\N	\N	\N
5892	2312	4	\N	\N	\N	\N	\N	\N
5893	2313	4	\N	\N	\N	\N	\N	\N
5894	2314	4	\N	\N	\N	\N	\N	\N
5895	2315	4	\N	\N	\N	\N	\N	\N
5896	2316	4	\N	\N	\N	\N	\N	\N
5897	2317	4	\N	\N	\N	\N	\N	\N
5898	2318	4	\N	\N	\N	\N	\N	\N
5899	2320	4	\N	\N	\N	\N	\N	\N
5900	2321	4	\N	\N	\N	\N	\N	\N
5901	2323	4	\N	\N	\N	\N	\N	\N
5902	2324	4	\N	\N	\N	\N	\N	\N
5903	2325	4	\N	\N	\N	\N	\N	\N
5904	2327	4	\N	\N	\N	\N	\N	\N
5905	2329	4	\N	\N	\N	\N	\N	\N
5906	2330	4	\N	\N	\N	\N	\N	\N
5907	2331	4	\N	\N	\N	\N	\N	\N
5908	2332	4	\N	\N	\N	\N	\N	\N
5909	2333	4	\N	\N	\N	\N	\N	\N
5910	2334	4	\N	\N	\N	\N	\N	\N
5911	2335	4	\N	\N	\N	\N	\N	\N
5912	2336	4	\N	\N	\N	\N	\N	\N
5913	2337	4	\N	\N	\N	\N	\N	\N
5914	2338	4	\N	\N	\N	\N	\N	\N
5915	2340	4	\N	\N	\N	\N	\N	\N
5916	2341	4	\N	\N	\N	\N	\N	\N
5917	2342	4	\N	\N	\N	\N	\N	\N
5918	2343	4	\N	\N	\N	\N	\N	\N
5919	2344	4	\N	\N	\N	\N	\N	\N
5920	2345	4	\N	\N	\N	\N	\N	\N
5921	2346	4	\N	\N	\N	\N	\N	\N
5922	2347	4	\N	\N	\N	\N	\N	\N
5923	2348	4	\N	\N	\N	\N	\N	\N
5924	2349	4	\N	\N	\N	\N	\N	\N
5925	2350	4	\N	\N	\N	\N	\N	\N
5926	2351	4	\N	\N	\N	\N	\N	\N
5927	2352	4	\N	\N	\N	\N	\N	\N
5928	2353	4	\N	\N	\N	\N	\N	\N
5929	2354	4	\N	\N	\N	\N	\N	\N
5930	2355	4	\N	\N	\N	\N	\N	\N
5931	2356	4	\N	\N	\N	\N	\N	\N
5932	2357	4	\N	\N	\N	\N	\N	\N
5933	2358	4	\N	\N	\N	\N	\N	\N
5934	2359	4	\N	\N	\N	\N	\N	\N
5935	2360	4	\N	\N	\N	\N	\N	\N
5936	2361	4	\N	\N	\N	\N	\N	\N
5937	2362	4	\N	\N	\N	\N	\N	\N
5938	2363	4	\N	\N	\N	\N	\N	\N
5939	2364	4	\N	\N	\N	\N	\N	\N
5940	2366	4	\N	\N	\N	\N	\N	\N
5941	2367	4	\N	\N	\N	\N	\N	\N
5942	2368	4	\N	\N	\N	\N	\N	\N
5943	2369	4	\N	\N	\N	\N	\N	\N
5944	2370	4	\N	\N	\N	\N	\N	\N
5945	2371	4	\N	\N	\N	\N	\N	\N
5946	2372	4	\N	\N	\N	\N	\N	\N
5947	2373	4	\N	\N	\N	\N	\N	\N
5948	2374	4	\N	\N	\N	\N	\N	\N
5949	2375	4	\N	\N	\N	\N	\N	\N
5950	2376	4	\N	\N	\N	\N	\N	\N
5951	2377	4	\N	\N	\N	\N	\N	\N
5952	2378	4	\N	\N	\N	\N	\N	\N
5953	2379	4	\N	\N	\N	\N	\N	\N
5954	2380	4	\N	\N	\N	\N	\N	\N
5955	2381	4	\N	\N	\N	\N	\N	\N
5956	2382	4	\N	\N	\N	\N	\N	\N
5957	2383	4	\N	\N	\N	\N	\N	\N
5958	2384	4	\N	\N	\N	\N	\N	\N
5959	2385	4	\N	\N	\N	\N	\N	\N
5960	2386	4	\N	\N	\N	\N	\N	\N
5961	2387	4	\N	\N	\N	\N	\N	\N
5962	2389	4	\N	\N	\N	\N	\N	\N
5963	2390	4	\N	\N	\N	\N	\N	\N
5964	2391	4	\N	\N	\N	\N	\N	\N
5965	2392	4	\N	\N	\N	\N	\N	\N
5966	2394	4	\N	\N	\N	\N	\N	\N
5967	2395	4	\N	\N	\N	\N	\N	\N
5968	2396	4	\N	\N	\N	\N	\N	\N
5969	2397	4	\N	\N	\N	\N	\N	\N
5970	2398	4	\N	\N	\N	\N	\N	\N
5971	2399	4	\N	\N	\N	\N	\N	\N
5972	2400	4	\N	\N	\N	\N	\N	\N
5973	2402	4	\N	\N	\N	\N	\N	\N
5974	2403	4	\N	\N	\N	\N	\N	\N
5975	2404	4	\N	\N	\N	\N	\N	\N
5976	2405	4	\N	\N	\N	\N	\N	\N
5977	2406	4	\N	\N	\N	\N	\N	\N
5978	2407	4	\N	\N	\N	\N	\N	\N
5979	2408	4	\N	\N	\N	\N	\N	\N
5980	2409	4	\N	\N	\N	\N	\N	\N
5981	2410	4	\N	\N	\N	\N	\N	\N
5982	2411	4	\N	\N	\N	\N	\N	\N
5983	2412	4	\N	\N	\N	\N	\N	\N
5984	2413	4	\N	\N	\N	\N	\N	\N
5985	2414	4	\N	\N	\N	\N	\N	\N
5986	2415	4	\N	\N	\N	\N	\N	\N
5987	2416	4	\N	\N	\N	\N	\N	\N
5988	2418	4	\N	\N	\N	\N	\N	\N
5989	2419	4	\N	\N	\N	\N	\N	\N
5990	2420	4	\N	\N	\N	\N	\N	\N
5991	2421	4	\N	\N	\N	\N	\N	\N
5992	2422	4	\N	\N	\N	\N	\N	\N
5993	2423	4	\N	\N	\N	\N	\N	\N
5994	2424	4	\N	\N	\N	\N	\N	\N
5995	2425	4	\N	\N	\N	\N	\N	\N
5996	2426	4	\N	\N	\N	\N	\N	\N
5997	2427	4	\N	\N	\N	\N	\N	\N
5998	2428	4	\N	\N	\N	\N	\N	\N
5999	2429	4	\N	\N	\N	\N	\N	\N
6000	2430	4	\N	\N	\N	\N	\N	\N
6001	2432	4	\N	\N	\N	\N	\N	\N
6002	2433	4	\N	\N	\N	\N	\N	\N
6003	2434	4	\N	\N	\N	\N	\N	\N
6004	2435	4	\N	\N	\N	\N	\N	\N
6005	2436	4	\N	\N	\N	\N	\N	\N
6006	2437	4	\N	\N	\N	\N	\N	\N
6007	2438	4	\N	\N	\N	\N	\N	\N
6008	2439	4	\N	\N	\N	\N	\N	\N
6009	2440	4	\N	\N	\N	\N	\N	\N
6010	2441	4	\N	\N	\N	\N	\N	\N
6011	2443	4	\N	\N	\N	\N	\N	\N
6012	2444	4	\N	\N	\N	\N	\N	\N
6013	2445	4	\N	\N	\N	\N	\N	\N
6014	2446	4	\N	\N	\N	\N	\N	\N
6015	2447	4	\N	\N	\N	\N	\N	\N
6016	2448	4	\N	\N	\N	\N	\N	\N
6017	2450	4	\N	\N	\N	\N	\N	\N
6018	2452	4	\N	\N	\N	\N	\N	\N
6019	2453	4	\N	\N	\N	\N	\N	\N
6020	2454	4	\N	\N	\N	\N	\N	\N
6021	2455	4	\N	\N	\N	\N	\N	\N
6022	2456	4	\N	\N	\N	\N	\N	\N
6023	2457	4	\N	\N	\N	\N	\N	\N
6024	2458	4	\N	\N	\N	\N	\N	\N
6025	2459	4	\N	\N	\N	\N	\N	\N
6026	2460	4	\N	\N	\N	\N	\N	\N
6027	2461	4	\N	\N	\N	\N	\N	\N
6028	2462	4	\N	\N	\N	\N	\N	\N
6029	2464	4	\N	\N	\N	\N	\N	\N
6030	2465	4	\N	\N	\N	\N	\N	\N
6031	2466	4	\N	\N	\N	\N	\N	\N
6032	2467	4	\N	\N	\N	\N	\N	\N
6033	2468	4	\N	\N	\N	\N	\N	\N
6034	2469	4	\N	\N	\N	\N	\N	\N
6035	2470	4	\N	\N	\N	\N	\N	\N
6036	2471	4	\N	\N	\N	\N	\N	\N
6037	2472	4	\N	\N	\N	\N	\N	\N
6038	2473	4	\N	\N	\N	\N	\N	\N
6039	2474	4	\N	\N	\N	\N	\N	\N
6040	2475	4	\N	\N	\N	\N	\N	\N
6041	2476	4	\N	\N	\N	\N	\N	\N
6042	2477	4	\N	\N	\N	\N	\N	\N
6043	2478	4	\N	\N	\N	\N	\N	\N
6044	2479	4	\N	\N	\N	\N	\N	\N
6045	2480	4	\N	\N	\N	\N	\N	\N
6046	2481	4	\N	\N	\N	\N	\N	\N
6047	2482	4	\N	\N	\N	\N	\N	\N
6048	2483	4	\N	\N	\N	\N	\N	\N
6049	2484	4	\N	\N	\N	\N	\N	\N
6050	2485	4	\N	\N	\N	\N	\N	\N
6051	2486	4	\N	\N	\N	\N	\N	\N
6052	2487	4	\N	\N	\N	\N	\N	\N
6053	2488	4	\N	\N	\N	\N	\N	\N
6054	2489	4	\N	\N	\N	\N	\N	\N
6055	2490	4	\N	\N	\N	\N	\N	\N
6056	2491	4	\N	\N	\N	\N	\N	\N
6057	2492	4	\N	\N	\N	\N	\N	\N
6058	2493	4	\N	\N	\N	\N	\N	\N
6059	2495	4	\N	\N	\N	\N	\N	\N
6060	2496	4	\N	\N	\N	\N	\N	\N
6061	2497	4	\N	\N	\N	\N	\N	\N
6062	2498	4	\N	\N	\N	\N	\N	\N
6063	2499	4	\N	\N	\N	\N	\N	\N
6064	2500	4	\N	\N	\N	\N	\N	\N
6065	2501	4	\N	\N	\N	\N	\N	\N
6066	2502	4	\N	\N	\N	\N	\N	\N
6067	2503	4	\N	\N	\N	\N	\N	\N
6068	2504	4	\N	\N	\N	\N	\N	\N
6069	2505	4	\N	\N	\N	\N	\N	\N
6070	2506	4	\N	\N	\N	\N	\N	\N
6071	2507	4	\N	\N	\N	\N	\N	\N
6072	2508	4	\N	\N	\N	\N	\N	\N
6073	2509	4	\N	\N	\N	\N	\N	\N
6074	2510	4	\N	\N	\N	\N	\N	\N
6075	2511	4	\N	\N	\N	\N	\N	\N
6076	2512	4	\N	\N	\N	\N	\N	\N
6077	2513	4	\N	\N	\N	\N	\N	\N
6078	2514	4	\N	\N	\N	\N	\N	\N
6079	2515	4	\N	\N	\N	\N	\N	\N
6080	2516	4	\N	\N	\N	\N	\N	\N
6081	2517	4	\N	\N	\N	\N	\N	\N
6082	2518	4	\N	\N	\N	\N	\N	\N
6083	2519	4	\N	\N	\N	\N	\N	\N
6084	2520	4	\N	\N	\N	\N	\N	\N
6085	2521	4	\N	\N	\N	\N	\N	\N
6086	2522	4	\N	\N	\N	\N	\N	\N
6087	2523	4	\N	\N	\N	\N	\N	\N
6088	2524	4	\N	\N	\N	\N	\N	\N
6089	2525	4	\N	\N	\N	\N	\N	\N
6090	2526	4	\N	\N	\N	\N	\N	\N
6091	2527	4	\N	\N	\N	\N	\N	\N
6092	2528	4	\N	\N	\N	\N	\N	\N
6093	2529	4	\N	\N	\N	\N	\N	\N
6094	2530	4	\N	\N	\N	\N	\N	\N
6095	2531	4	\N	\N	\N	\N	\N	\N
6096	2532	4	\N	\N	\N	\N	\N	\N
6097	2533	4	\N	\N	\N	\N	\N	\N
6098	2534	4	\N	\N	\N	\N	\N	\N
6099	2535	4	\N	\N	\N	\N	\N	\N
6100	2536	4	\N	\N	\N	\N	\N	\N
6101	2537	4	\N	\N	\N	\N	\N	\N
6102	2538	4	\N	\N	\N	\N	\N	\N
6103	2539	4	\N	\N	\N	\N	\N	\N
6104	2540	4	\N	\N	\N	\N	\N	\N
6105	2541	4	\N	\N	\N	\N	\N	\N
6106	2542	4	\N	\N	\N	\N	\N	\N
6107	2543	4	\N	\N	\N	\N	\N	\N
6108	2544	4	\N	\N	\N	\N	\N	\N
6109	2545	4	\N	\N	\N	\N	\N	\N
6110	2546	4	\N	\N	\N	\N	\N	\N
6111	2547	4	\N	\N	\N	\N	\N	\N
6112	2548	4	\N	\N	\N	\N	\N	\N
6113	2549	4	\N	\N	\N	\N	\N	\N
6114	2550	4	\N	\N	\N	\N	\N	\N
6115	2551	4	\N	\N	\N	\N	\N	\N
6116	2552	4	\N	\N	\N	\N	\N	\N
6117	2553	4	\N	\N	\N	\N	\N	\N
6118	2554	4	\N	\N	\N	\N	\N	\N
6119	2555	4	\N	\N	\N	\N	\N	\N
6120	2556	4	\N	\N	\N	\N	\N	\N
6121	2557	4	\N	\N	\N	\N	\N	\N
6122	2558	4	\N	\N	\N	\N	\N	\N
6123	2559	4	\N	\N	\N	\N	\N	\N
6124	2560	4	\N	\N	\N	\N	\N	\N
6125	2561	4	\N	\N	\N	\N	\N	\N
6126	2562	4	\N	\N	\N	\N	\N	\N
6127	2563	4	\N	\N	\N	\N	\N	\N
6128	2564	4	\N	\N	\N	\N	\N	\N
6129	2565	4	\N	\N	\N	\N	\N	\N
6130	2566	4	\N	\N	\N	\N	\N	\N
6131	2567	4	\N	\N	\N	\N	\N	\N
6132	2568	4	\N	\N	\N	\N	\N	\N
6133	2569	4	\N	\N	\N	\N	\N	\N
6134	2570	4	\N	\N	\N	\N	\N	\N
6135	2571	4	\N	\N	\N	\N	\N	\N
6136	2572	4	\N	\N	\N	\N	\N	\N
6137	2573	4	\N	\N	\N	\N	\N	\N
6138	2575	4	\N	\N	\N	\N	\N	\N
6139	2576	4	\N	\N	\N	\N	\N	\N
6140	2577	4	\N	\N	\N	\N	\N	\N
6141	2578	4	\N	\N	\N	\N	\N	\N
6142	2579	4	\N	\N	\N	\N	\N	\N
6143	2580	4	\N	\N	\N	\N	\N	\N
6144	2581	4	\N	\N	\N	\N	\N	\N
6145	2582	4	\N	\N	\N	\N	\N	\N
6146	2583	4	\N	\N	\N	\N	\N	\N
6147	2584	4	\N	\N	\N	\N	\N	\N
6148	2585	4	\N	\N	\N	\N	\N	\N
6149	2586	4	\N	\N	\N	\N	\N	\N
6150	2587	4	\N	\N	\N	\N	\N	\N
6151	2588	4	\N	\N	\N	\N	\N	\N
6152	2589	4	\N	\N	\N	\N	\N	\N
6153	2590	4	\N	\N	\N	\N	\N	\N
6154	2591	4	\N	\N	\N	\N	\N	\N
6155	2592	4	\N	\N	\N	\N	\N	\N
6156	2593	4	\N	\N	\N	\N	\N	\N
6157	2594	4	\N	\N	\N	\N	\N	\N
6158	2595	4	\N	\N	\N	\N	\N	\N
6159	2596	4	\N	\N	\N	\N	\N	\N
6160	2597	4	\N	\N	\N	\N	\N	\N
6161	2598	4	\N	\N	\N	\N	\N	\N
6162	2599	4	\N	\N	\N	\N	\N	\N
6163	2600	4	\N	\N	\N	\N	\N	\N
6164	2601	4	\N	\N	\N	\N	\N	\N
6165	2602	4	\N	\N	\N	\N	\N	\N
6166	2603	4	\N	\N	\N	\N	\N	\N
6167	2604	4	\N	\N	\N	\N	\N	\N
6168	2605	4	\N	\N	\N	\N	\N	\N
6169	2606	4	\N	\N	\N	\N	\N	\N
6170	2607	4	\N	\N	\N	\N	\N	\N
6171	2608	4	\N	\N	\N	\N	\N	\N
6172	2609	4	\N	\N	\N	\N	\N	\N
6173	2610	4	\N	\N	\N	\N	\N	\N
6174	2611	4	\N	\N	\N	\N	\N	\N
6175	2612	4	\N	\N	\N	\N	\N	\N
6176	2614	4	\N	\N	\N	\N	\N	\N
6177	2615	4	\N	\N	\N	\N	\N	\N
6178	2616	4	\N	\N	\N	\N	\N	\N
6179	2617	4	\N	\N	\N	\N	\N	\N
6180	2618	4	\N	\N	\N	\N	\N	\N
6181	2619	4	\N	\N	\N	\N	\N	\N
6182	2620	4	\N	\N	\N	\N	\N	\N
6183	2621	4	\N	\N	\N	\N	\N	\N
6184	2624	4	\N	\N	\N	\N	\N	\N
6185	2625	4	\N	\N	\N	\N	\N	\N
6186	2626	4	\N	\N	\N	\N	\N	\N
6187	2627	4	\N	\N	\N	\N	\N	\N
6188	2628	4	\N	\N	\N	\N	\N	\N
6189	2629	4	\N	\N	\N	\N	\N	\N
6190	2630	4	\N	\N	\N	\N	\N	\N
6191	2631	4	\N	\N	\N	\N	\N	\N
6192	2632	4	\N	\N	\N	\N	\N	\N
6193	2633	4	\N	\N	\N	\N	\N	\N
6194	2634	4	\N	\N	\N	\N	\N	\N
6195	2635	4	\N	\N	\N	\N	\N	\N
6196	2636	4	\N	\N	\N	\N	\N	\N
6197	2637	4	\N	\N	\N	\N	\N	\N
6198	2638	4	\N	\N	\N	\N	\N	\N
6199	2639	4	\N	\N	\N	\N	\N	\N
6200	2640	4	\N	\N	\N	\N	\N	\N
6201	2641	4	\N	\N	\N	\N	\N	\N
6202	2642	4	\N	\N	\N	\N	\N	\N
6203	2643	4	\N	\N	\N	\N	\N	\N
6204	2644	4	\N	\N	\N	\N	\N	\N
6205	2645	4	\N	\N	\N	\N	\N	\N
6206	2646	4	\N	\N	\N	\N	\N	\N
6207	2647	4	\N	\N	\N	\N	\N	\N
6208	2648	4	\N	\N	\N	\N	\N	\N
6209	2649	4	\N	\N	\N	\N	\N	\N
6210	2650	4	\N	\N	\N	\N	\N	\N
6211	2651	4	\N	\N	\N	\N	\N	\N
6212	2652	4	\N	\N	\N	\N	\N	\N
6213	2653	4	\N	\N	\N	\N	\N	\N
6214	2654	4	\N	\N	\N	\N	\N	\N
6215	2655	4	\N	\N	\N	\N	\N	\N
6216	2656	4	\N	\N	\N	\N	\N	\N
6217	2657	4	\N	\N	\N	\N	\N	\N
6218	2658	4	\N	\N	\N	\N	\N	\N
6219	2659	4	\N	\N	\N	\N	\N	\N
6220	2660	4	\N	\N	\N	\N	\N	\N
6221	2661	4	\N	\N	\N	\N	\N	\N
6222	2662	4	\N	\N	\N	\N	\N	\N
6223	2663	4	\N	\N	\N	\N	\N	\N
6224	2664	4	\N	\N	\N	\N	\N	\N
6225	2665	4	\N	\N	\N	\N	\N	\N
6226	2666	4	\N	\N	\N	\N	\N	\N
6227	2667	4	\N	\N	\N	\N	\N	\N
6228	2668	4	\N	\N	\N	\N	\N	\N
6229	2669	4	\N	\N	\N	\N	\N	\N
6230	2670	4	\N	\N	\N	\N	\N	\N
6231	2671	4	\N	\N	\N	\N	\N	\N
6232	2672	4	\N	\N	\N	\N	\N	\N
6233	2673	4	\N	\N	\N	\N	\N	\N
6234	2674	4	\N	\N	\N	\N	\N	\N
6235	2675	4	\N	\N	\N	\N	\N	\N
6236	2676	4	\N	\N	\N	\N	\N	\N
6237	2677	4	\N	\N	\N	\N	\N	\N
6238	2678	4	\N	\N	\N	\N	\N	\N
6239	2679	4	\N	\N	\N	\N	\N	\N
6240	2680	4	\N	\N	\N	\N	\N	\N
6241	2681	4	\N	\N	\N	\N	\N	\N
6242	2682	4	\N	\N	\N	\N	\N	\N
6243	2683	4	\N	\N	\N	\N	\N	\N
6244	2684	4	\N	\N	\N	\N	\N	\N
6245	2685	4	\N	\N	\N	\N	\N	\N
6246	2686	4	\N	\N	\N	\N	\N	\N
6247	2687	4	\N	\N	\N	\N	\N	\N
6248	2688	4	\N	\N	\N	\N	\N	\N
6249	2689	4	\N	\N	\N	\N	\N	\N
6250	2690	4	\N	\N	\N	\N	\N	\N
6251	2691	4	\N	\N	\N	\N	\N	\N
6252	2692	4	\N	\N	\N	\N	\N	\N
6253	2693	4	\N	\N	\N	\N	\N	\N
6254	2694	4	\N	\N	\N	\N	\N	\N
6255	2695	4	\N	\N	\N	\N	\N	\N
6256	2696	4	\N	\N	\N	\N	\N	\N
6257	2698	4	\N	\N	\N	\N	\N	\N
6258	2699	4	\N	\N	\N	\N	\N	\N
6259	2701	4	\N	\N	\N	\N	\N	\N
6260	2702	4	\N	\N	\N	\N	\N	\N
6261	2703	4	\N	\N	\N	\N	\N	\N
6262	2704	4	\N	\N	\N	\N	\N	\N
6263	2705	4	\N	\N	\N	\N	\N	\N
6264	2706	4	\N	\N	\N	\N	\N	\N
6265	2707	4	\N	\N	\N	\N	\N	\N
6266	2708	4	\N	\N	\N	\N	\N	\N
6267	2709	4	\N	\N	\N	\N	\N	\N
6268	2710	4	\N	\N	\N	\N	\N	\N
6269	2711	4	\N	\N	\N	\N	\N	\N
6270	2712	4	\N	\N	\N	\N	\N	\N
6271	2713	4	\N	\N	\N	\N	\N	\N
6272	2714	4	\N	\N	\N	\N	\N	\N
6273	2715	4	\N	\N	\N	\N	\N	\N
6274	2717	4	\N	\N	\N	\N	\N	\N
6275	2718	4	\N	\N	\N	\N	\N	\N
6276	2719	4	\N	\N	\N	\N	\N	\N
6277	2720	4	\N	\N	\N	\N	\N	\N
6278	2721	4	\N	\N	\N	\N	\N	\N
6279	2722	4	\N	\N	\N	\N	\N	\N
6280	2723	4	\N	\N	\N	\N	\N	\N
6281	2724	4	\N	\N	\N	\N	\N	\N
6282	2725	4	\N	\N	\N	\N	\N	\N
6283	2726	4	\N	\N	\N	\N	\N	\N
6284	2727	4	\N	\N	\N	\N	\N	\N
6285	2729	4	\N	\N	\N	\N	\N	\N
6286	2730	4	\N	\N	\N	\N	\N	\N
6287	2731	4	\N	\N	\N	\N	\N	\N
6288	2732	4	\N	\N	\N	\N	\N	\N
6289	2733	4	\N	\N	\N	\N	\N	\N
6290	2734	4	\N	\N	\N	\N	\N	\N
6291	2735	4	\N	\N	\N	\N	\N	\N
6292	2736	4	\N	\N	\N	\N	\N	\N
6293	2737	4	\N	\N	\N	\N	\N	\N
6294	2738	4	\N	\N	\N	\N	\N	\N
6295	2739	4	\N	\N	\N	\N	\N	\N
6296	2740	4	\N	\N	\N	\N	\N	\N
6297	2741	4	\N	\N	\N	\N	\N	\N
6298	2742	4	\N	\N	\N	\N	\N	\N
6299	2743	4	\N	\N	\N	\N	\N	\N
6300	2744	4	\N	\N	\N	\N	\N	\N
6301	2746	4	\N	\N	\N	\N	\N	\N
6302	2747	4	\N	\N	\N	\N	\N	\N
6303	2748	4	\N	\N	\N	\N	\N	\N
6304	2749	4	\N	\N	\N	\N	\N	\N
6305	2750	4	\N	\N	\N	\N	\N	\N
6306	2751	4	\N	\N	\N	\N	\N	\N
6307	2752	4	\N	\N	\N	\N	\N	\N
6308	2753	4	\N	\N	\N	\N	\N	\N
6309	2754	4	\N	\N	\N	\N	\N	\N
6310	2755	4	\N	\N	\N	\N	\N	\N
6311	2756	4	\N	\N	\N	\N	\N	\N
6312	2757	4	\N	\N	\N	\N	\N	\N
6313	2758	4	\N	\N	\N	\N	\N	\N
6314	2759	4	\N	\N	\N	\N	\N	\N
6315	2760	4	\N	\N	\N	\N	\N	\N
6316	2761	4	\N	\N	\N	\N	\N	\N
6317	2762	4	\N	\N	\N	\N	\N	\N
6318	2763	4	\N	\N	\N	\N	\N	\N
6319	2764	4	\N	\N	\N	\N	\N	\N
6320	2765	4	\N	\N	\N	\N	\N	\N
6321	2766	4	\N	\N	\N	\N	\N	\N
6322	2767	4	\N	\N	\N	\N	\N	\N
6323	2768	4	\N	\N	\N	\N	\N	\N
6324	2769	4	\N	\N	\N	\N	\N	\N
6325	2770	4	\N	\N	\N	\N	\N	\N
6326	2771	4	\N	\N	\N	\N	\N	\N
6327	2772	4	\N	\N	\N	\N	\N	\N
6328	2773	4	\N	\N	\N	\N	\N	\N
6329	2774	4	\N	\N	\N	\N	\N	\N
6330	2775	4	\N	\N	\N	\N	\N	\N
6331	2776	4	\N	\N	\N	\N	\N	\N
6332	2777	4	\N	\N	\N	\N	\N	\N
6333	2778	4	\N	\N	\N	\N	\N	\N
6334	2779	4	\N	\N	\N	\N	\N	\N
6335	2780	4	\N	\N	\N	\N	\N	\N
6336	2825	4	\N	\N	\N	\N	\N	\N
6337	2826	4	\N	\N	\N	\N	\N	\N
6338	2827	4	\N	\N	\N	\N	\N	\N
6339	2828	4	\N	\N	\N	\N	\N	\N
6340	2829	4	\N	\N	\N	\N	\N	\N
6341	2830	4	\N	\N	\N	\N	\N	\N
6342	2831	4	\N	\N	\N	\N	\N	\N
6343	2833	4	\N	\N	\N	\N	\N	\N
6344	2834	4	\N	\N	\N	\N	\N	\N
6345	2835	4	\N	\N	\N	\N	\N	\N
6346	2836	4	\N	\N	\N	\N	\N	\N
6347	2837	4	\N	\N	\N	\N	\N	\N
6348	2838	4	\N	\N	\N	\N	\N	\N
6349	2839	4	\N	\N	\N	\N	\N	\N
6350	2840	4	\N	\N	\N	\N	\N	\N
6351	2841	4	\N	\N	\N	\N	\N	\N
6352	2842	4	\N	\N	\N	\N	\N	\N
6353	2843	4	\N	\N	\N	\N	\N	\N
6354	2844	4	\N	\N	\N	\N	\N	\N
6355	2845	4	\N	\N	\N	\N	\N	\N
6356	2846	4	\N	\N	\N	\N	\N	\N
6357	2847	4	\N	\N	\N	\N	\N	\N
6358	2848	4	\N	\N	\N	\N	\N	\N
6359	2849	4	\N	\N	\N	\N	\N	\N
6360	2850	4	\N	\N	\N	\N	\N	\N
6361	2852	4	\N	\N	\N	\N	\N	\N
6362	2853	4	\N	\N	\N	\N	\N	\N
6363	2854	4	\N	\N	\N	\N	\N	\N
6364	2855	4	\N	\N	\N	\N	\N	\N
6365	2856	4	\N	\N	\N	\N	\N	\N
6366	2857	4	\N	\N	\N	\N	\N	\N
6367	2858	4	\N	\N	\N	\N	\N	\N
6368	2859	4	\N	\N	\N	\N	\N	\N
6369	2861	4	\N	\N	\N	\N	\N	\N
6370	2862	4	\N	\N	\N	\N	\N	\N
6371	2866	4	\N	\N	\N	\N	\N	\N
6372	2867	4	\N	\N	\N	\N	\N	\N
6373	2868	4	\N	\N	\N	\N	\N	\N
6374	2869	4	\N	\N	\N	\N	\N	\N
6375	2870	4	\N	\N	\N	\N	\N	\N
6376	2872	4	\N	\N	\N	\N	\N	\N
6377	2873	4	\N	\N	\N	\N	\N	\N
6378	2874	4	\N	\N	\N	\N	\N	\N
6379	2875	4	\N	\N	\N	\N	\N	\N
6380	2876	4	\N	\N	\N	\N	\N	\N
6381	2877	4	\N	\N	\N	\N	\N	\N
6382	2878	4	\N	\N	\N	\N	\N	\N
6383	2879	4	\N	\N	\N	\N	\N	\N
6384	2880	4	\N	\N	\N	\N	\N	\N
6385	1	5	\N	\N	\N	\N	\N	\N
6386	2	5	\N	\N	\N	\N	\N	\N
6387	3	5	\N	\N	\N	\N	\N	\N
6388	4	5	\N	\N	\N	\N	\N	\N
6389	5	5	\N	\N	\N	\N	\N	\N
6390	6	5	\N	\N	\N	\N	\N	\N
6391	8	5	\N	\N	\N	\N	\N	\N
6392	9	5	\N	\N	\N	\N	\N	\N
6393	10	5	\N	\N	\N	\N	\N	\N
6394	13	5	\N	\N	\N	\N	\N	\N
6395	14	5	\N	\N	\N	\N	\N	\N
6396	16	5	\N	\N	\N	\N	\N	\N
6397	18	5	\N	\N	\N	\N	\N	\N
6398	25	5	\N	\N	\N	\N	\N	\N
6399	31	5	\N	\N	\N	\N	\N	\N
6400	32	5	\N	\N	\N	\N	\N	\N
6401	34	5	\N	\N	\N	\N	\N	\N
6402	35	5	\N	\N	\N	\N	\N	\N
6403	37	5	\N	\N	\N	\N	\N	\N
6404	41	5	\N	\N	\N	\N	\N	\N
6405	42	5	\N	\N	\N	\N	\N	\N
6406	43	5	\N	\N	\N	\N	\N	\N
6407	45	5	\N	\N	\N	\N	\N	\N
6408	49	5	\N	\N	\N	\N	\N	\N
6409	50	5	\N	\N	\N	\N	\N	\N
6410	51	5	\N	\N	\N	\N	\N	\N
6411	52	5	\N	\N	\N	\N	\N	\N
6412	53	5	\N	\N	\N	\N	\N	\N
6413	56	5	\N	\N	\N	\N	\N	\N
6414	57	5	\N	\N	\N	\N	\N	\N
6415	58	5	\N	\N	\N	\N	\N	\N
6416	61	5	\N	\N	\N	\N	\N	\N
6417	63	5	\N	\N	\N	\N	\N	\N
6418	64	5	\N	\N	\N	\N	\N	\N
6419	66	5	\N	\N	\N	\N	\N	\N
6420	67	5	\N	\N	\N	\N	\N	\N
6421	68	5	\N	\N	\N	\N	\N	\N
6422	69	5	\N	\N	\N	\N	\N	\N
6423	70	5	\N	\N	\N	\N	\N	\N
6424	71	5	\N	\N	\N	\N	\N	\N
6425	72	5	\N	\N	\N	\N	\N	\N
6426	74	5	\N	\N	\N	\N	\N	\N
6427	75	5	\N	\N	\N	\N	\N	\N
6428	76	5	\N	\N	\N	\N	\N	\N
6429	77	5	\N	\N	\N	\N	\N	\N
6430	78	5	\N	\N	\N	\N	\N	\N
6431	79	5	\N	\N	\N	\N	\N	\N
6432	80	5	\N	\N	\N	\N	\N	\N
6433	83	5	\N	\N	\N	\N	\N	\N
6434	84	5	\N	\N	\N	\N	\N	\N
6435	87	5	\N	\N	\N	\N	\N	\N
6436	88	5	\N	\N	\N	\N	\N	\N
6437	89	5	\N	\N	\N	\N	\N	\N
6438	90	5	\N	\N	\N	\N	\N	\N
6439	93	5	\N	\N	\N	\N	\N	\N
6440	99	5	\N	\N	\N	\N	\N	\N
6441	101	5	\N	\N	\N	\N	\N	\N
6442	103	5	\N	\N	\N	\N	\N	\N
6443	109	5	\N	\N	\N	\N	\N	\N
6444	113	5	\N	\N	\N	\N	\N	\N
6445	114	5	\N	\N	\N	\N	\N	\N
6446	117	5	\N	\N	\N	\N	\N	\N
6447	118	5	\N	\N	\N	\N	\N	\N
6448	120	5	\N	\N	\N	\N	\N	\N
6449	121	5	\N	\N	\N	\N	\N	\N
6450	122	5	\N	\N	\N	\N	\N	\N
6451	125	5	\N	\N	\N	\N	\N	\N
6452	128	5	\N	\N	\N	\N	\N	\N
6453	129	5	\N	\N	\N	\N	\N	\N
6454	130	5	\N	\N	\N	\N	\N	\N
6455	131	5	\N	\N	\N	\N	\N	\N
6456	132	5	\N	\N	\N	\N	\N	\N
6457	134	5	\N	\N	\N	\N	\N	\N
6458	135	5	\N	\N	\N	\N	\N	\N
6459	138	5	\N	\N	\N	\N	\N	\N
6460	141	5	\N	\N	\N	\N	\N	\N
6461	142	5	\N	\N	\N	\N	\N	\N
6462	145	5	\N	\N	\N	\N	\N	\N
6463	148	5	\N	\N	\N	\N	\N	\N
6464	150	5	\N	\N	\N	\N	\N	\N
6465	151	5	\N	\N	\N	\N	\N	\N
6466	154	5	\N	\N	\N	\N	\N	\N
6467	159	5	\N	\N	\N	\N	\N	\N
6468	160	5	\N	\N	\N	\N	\N	\N
6469	161	5	\N	\N	\N	\N	\N	\N
6470	164	5	\N	\N	\N	\N	\N	\N
6471	168	5	\N	\N	\N	\N	\N	\N
6472	170	5	\N	\N	\N	\N	\N	\N
6473	174	5	\N	\N	\N	\N	\N	\N
6474	175	5	\N	\N	\N	\N	\N	\N
6475	181	5	\N	\N	\N	\N	\N	\N
6476	182	5	\N	\N	\N	\N	\N	\N
6477	199	5	\N	\N	\N	\N	\N	\N
6478	201	5	\N	\N	\N	\N	\N	\N
6479	205	5	\N	\N	\N	\N	\N	\N
6480	206	5	\N	\N	\N	\N	\N	\N
6481	212	5	\N	\N	\N	\N	\N	\N
6482	213	5	\N	\N	\N	\N	\N	\N
6483	215	5	\N	\N	\N	\N	\N	\N
6484	217	5	\N	\N	\N	\N	\N	\N
6485	218	5	\N	\N	\N	\N	\N	\N
6486	221	5	\N	\N	\N	\N	\N	\N
6487	224	5	\N	\N	\N	\N	\N	\N
6488	233	5	\N	\N	\N	\N	\N	\N
6489	234	5	\N	\N	\N	\N	\N	\N
6490	254	5	\N	\N	\N	\N	\N	\N
6491	257	5	\N	\N	\N	\N	\N	\N
6492	258	5	\N	\N	\N	\N	\N	\N
6493	260	5	\N	\N	\N	\N	\N	\N
6494	263	5	\N	\N	\N	\N	\N	\N
6495	268	5	\N	\N	\N	\N	\N	\N
6496	269	5	\N	\N	\N	\N	\N	\N
6497	275	5	\N	\N	\N	\N	\N	\N
6498	276	5	\N	\N	\N	\N	\N	\N
6499	278	5	\N	\N	\N	\N	\N	\N
6500	279	5	\N	\N	\N	\N	\N	\N
6501	287	5	\N	\N	\N	\N	\N	\N
6502	290	5	\N	\N	\N	\N	\N	\N
6503	291	5	\N	\N	\N	\N	\N	\N
6504	293	5	\N	\N	\N	\N	\N	\N
6505	295	5	\N	\N	\N	\N	\N	\N
6506	298	5	\N	\N	\N	\N	\N	\N
6507	304	5	\N	\N	\N	\N	\N	\N
6508	312	5	\N	\N	\N	\N	\N	\N
6509	313	5	\N	\N	\N	\N	\N	\N
6510	316	5	\N	\N	\N	\N	\N	\N
6511	317	5	\N	\N	\N	\N	\N	\N
6512	322	5	\N	\N	\N	\N	\N	\N
6513	323	5	\N	\N	\N	\N	\N	\N
6514	325	5	\N	\N	\N	\N	\N	\N
6515	328	5	\N	\N	\N	\N	\N	\N
6516	331	5	\N	\N	\N	\N	\N	\N
6517	333	5	\N	\N	\N	\N	\N	\N
6518	334	5	\N	\N	\N	\N	\N	\N
6519	337	5	\N	\N	\N	\N	\N	\N
6520	338	5	\N	\N	\N	\N	\N	\N
6521	341	5	\N	\N	\N	\N	\N	\N
6522	350	5	\N	\N	\N	\N	\N	\N
6523	353	5	\N	\N	\N	\N	\N	\N
6524	356	5	\N	\N	\N	\N	\N	\N
6525	360	5	\N	\N	\N	\N	\N	\N
6526	362	5	\N	\N	\N	\N	\N	\N
6527	366	5	\N	\N	\N	\N	\N	\N
6528	367	5	\N	\N	\N	\N	\N	\N
6529	370	5	\N	\N	\N	\N	\N	\N
6530	372	5	\N	\N	\N	\N	\N	\N
6531	374	5	\N	\N	\N	\N	\N	\N
6532	377	5	\N	\N	\N	\N	\N	\N
6533	382	5	\N	\N	\N	\N	\N	\N
6534	385	5	\N	\N	\N	\N	\N	\N
6535	386	5	\N	\N	\N	\N	\N	\N
6536	389	5	\N	\N	\N	\N	\N	\N
6537	400	5	\N	\N	\N	\N	\N	\N
6538	405	5	\N	\N	\N	\N	\N	\N
6539	406	5	\N	\N	\N	\N	\N	\N
6540	411	5	\N	\N	\N	\N	\N	\N
6541	415	5	\N	\N	\N	\N	\N	\N
6542	416	5	\N	\N	\N	\N	\N	\N
6543	426	5	\N	\N	\N	\N	\N	\N
6544	448	5	\N	\N	\N	\N	\N	\N
6545	450	5	\N	\N	\N	\N	\N	\N
6546	460	5	\N	\N	\N	\N	\N	\N
6547	461	5	\N	\N	\N	\N	\N	\N
6548	463	5	\N	\N	\N	\N	\N	\N
6549	467	5	\N	\N	\N	\N	\N	\N
6550	468	5	\N	\N	\N	\N	\N	\N
6551	470	5	\N	\N	\N	\N	\N	\N
6552	477	5	\N	\N	\N	\N	\N	\N
6553	495	5	\N	\N	\N	\N	\N	\N
6554	501	5	\N	\N	\N	\N	\N	\N
6555	502	5	\N	\N	\N	\N	\N	\N
6556	506	5	\N	\N	\N	\N	\N	\N
6557	512	5	\N	\N	\N	\N	\N	\N
6558	513	5	\N	\N	\N	\N	\N	\N
6559	520	5	\N	\N	\N	\N	\N	\N
6560	525	5	\N	\N	\N	\N	\N	\N
6561	536	5	\N	\N	\N	\N	\N	\N
6562	541	5	\N	\N	\N	\N	\N	\N
6563	543	5	\N	\N	\N	\N	\N	\N
6564	545	5	\N	\N	\N	\N	\N	\N
6565	549	5	\N	\N	\N	\N	\N	\N
6566	551	5	\N	\N	\N	\N	\N	\N
6567	558	5	\N	\N	\N	\N	\N	\N
6568	572	5	\N	\N	\N	\N	\N	\N
6569	573	5	\N	\N	\N	\N	\N	\N
6570	576	5	\N	\N	\N	\N	\N	\N
6571	584	5	\N	\N	\N	\N	\N	\N
6572	588	5	\N	\N	\N	\N	\N	\N
6573	594	5	\N	\N	\N	\N	\N	\N
6574	597	5	\N	\N	\N	\N	\N	\N
6575	601	5	\N	\N	\N	\N	\N	\N
6576	606	5	\N	\N	\N	\N	\N	\N
6577	623	5	\N	\N	\N	\N	\N	\N
6578	624	5	\N	\N	\N	\N	\N	\N
6579	625	5	\N	\N	\N	\N	\N	\N
6580	626	5	\N	\N	\N	\N	\N	\N
6581	627	5	\N	\N	\N	\N	\N	\N
6582	629	5	\N	\N	\N	\N	\N	\N
6583	633	5	\N	\N	\N	\N	\N	\N
6584	638	5	\N	\N	\N	\N	\N	\N
6585	643	5	\N	\N	\N	\N	\N	\N
6586	644	5	\N	\N	\N	\N	\N	\N
6587	654	5	\N	\N	\N	\N	\N	\N
6588	656	5	\N	\N	\N	\N	\N	\N
6589	659	5	\N	\N	\N	\N	\N	\N
6590	660	5	\N	\N	\N	\N	\N	\N
6591	666	5	\N	\N	\N	\N	\N	\N
6592	680	5	\N	\N	\N	\N	\N	\N
6593	693	5	\N	\N	\N	\N	\N	\N
6594	699	5	\N	\N	\N	\N	\N	\N
6595	702	5	\N	\N	\N	\N	\N	\N
6596	703	5	\N	\N	\N	\N	\N	\N
6597	706	5	\N	\N	\N	\N	\N	\N
6598	707	5	\N	\N	\N	\N	\N	\N
6599	708	5	\N	\N	\N	\N	\N	\N
6600	719	5	\N	\N	\N	\N	\N	\N
6601	720	5	\N	\N	\N	\N	\N	\N
6602	723	5	\N	\N	\N	\N	\N	\N
6603	730	5	\N	\N	\N	\N	\N	\N
6604	733	5	\N	\N	\N	\N	\N	\N
6605	734	5	\N	\N	\N	\N	\N	\N
6606	747	5	\N	\N	\N	\N	\N	\N
6607	760	5	\N	\N	\N	\N	\N	\N
6608	764	5	\N	\N	\N	\N	\N	\N
6609	766	5	\N	\N	\N	\N	\N	\N
6610	778	5	\N	\N	\N	\N	\N	\N
6611	781	5	\N	\N	\N	\N	\N	\N
6612	785	5	\N	\N	\N	\N	\N	\N
6613	788	5	\N	\N	\N	\N	\N	\N
6614	789	5	\N	\N	\N	\N	\N	\N
6615	795	5	\N	\N	\N	\N	\N	\N
6616	796	5	\N	\N	\N	\N	\N	\N
6617	797	5	\N	\N	\N	\N	\N	\N
6618	799	5	\N	\N	\N	\N	\N	\N
6619	812	5	\N	\N	\N	\N	\N	\N
6620	813	5	\N	\N	\N	\N	\N	\N
6621	814	5	\N	\N	\N	\N	\N	\N
6622	815	5	\N	\N	\N	\N	\N	\N
6623	818	5	\N	\N	\N	\N	\N	\N
6624	819	5	\N	\N	\N	\N	\N	\N
6625	823	5	\N	\N	\N	\N	\N	\N
6626	825	5	\N	\N	\N	\N	\N	\N
6627	831	5	\N	\N	\N	\N	\N	\N
6628	833	5	\N	\N	\N	\N	\N	\N
6629	836	5	\N	\N	\N	\N	\N	\N
6630	837	5	\N	\N	\N	\N	\N	\N
6631	841	5	\N	\N	\N	\N	\N	\N
6632	853	5	\N	\N	\N	\N	\N	\N
6633	857	5	\N	\N	\N	\N	\N	\N
6634	859	5	\N	\N	\N	\N	\N	\N
6635	869	5	\N	\N	\N	\N	\N	\N
6636	870	5	\N	\N	\N	\N	\N	\N
6637	873	5	\N	\N	\N	\N	\N	\N
6638	890	5	\N	\N	\N	\N	\N	\N
6639	892	5	\N	\N	\N	\N	\N	\N
6640	894	5	\N	\N	\N	\N	\N	\N
6641	895	5	\N	\N	\N	\N	\N	\N
6642	898	5	\N	\N	\N	\N	\N	\N
6643	911	5	\N	\N	\N	\N	\N	\N
6644	912	5	\N	\N	\N	\N	\N	\N
6645	914	5	\N	\N	\N	\N	\N	\N
6646	916	5	\N	\N	\N	\N	\N	\N
6647	918	5	\N	\N	\N	\N	\N	\N
6648	920	5	\N	\N	\N	\N	\N	\N
6649	921	5	\N	\N	\N	\N	\N	\N
6650	924	5	\N	\N	\N	\N	\N	\N
6651	933	5	\N	\N	\N	\N	\N	\N
6652	934	5	\N	\N	\N	\N	\N	\N
6653	938	5	\N	\N	\N	\N	\N	\N
6654	939	5	\N	\N	\N	\N	\N	\N
6655	945	5	\N	\N	\N	\N	\N	\N
6656	948	5	\N	\N	\N	\N	\N	\N
6657	951	5	\N	\N	\N	\N	\N	\N
6658	954	5	\N	\N	\N	\N	\N	\N
6659	959	5	\N	\N	\N	\N	\N	\N
6660	960	5	\N	\N	\N	\N	\N	\N
6661	964	5	\N	\N	\N	\N	\N	\N
6662	965	5	\N	\N	\N	\N	\N	\N
6663	977	5	\N	\N	\N	\N	\N	\N
6664	978	5	\N	\N	\N	\N	\N	\N
6665	986	5	\N	\N	\N	\N	\N	\N
6666	988	5	\N	\N	\N	\N	\N	\N
6667	990	5	\N	\N	\N	\N	\N	\N
6668	993	5	\N	\N	\N	\N	\N	\N
6669	994	5	\N	\N	\N	\N	\N	\N
6670	998	5	\N	\N	\N	\N	\N	\N
6671	999	5	\N	\N	\N	\N	\N	\N
6672	1002	5	\N	\N	\N	\N	\N	\N
6673	1004	5	\N	\N	\N	\N	\N	\N
6674	1008	5	\N	\N	\N	\N	\N	\N
6675	1010	5	\N	\N	\N	\N	\N	\N
6676	1019	5	\N	\N	\N	\N	\N	\N
6677	1020	5	\N	\N	\N	\N	\N	\N
6678	1022	5	\N	\N	\N	\N	\N	\N
6679	1026	5	\N	\N	\N	\N	\N	\N
6680	1027	5	\N	\N	\N	\N	\N	\N
6681	1028	5	\N	\N	\N	\N	\N	\N
6682	1032	5	\N	\N	\N	\N	\N	\N
6683	1033	5	\N	\N	\N	\N	\N	\N
6684	1035	5	\N	\N	\N	\N	\N	\N
6685	1038	5	\N	\N	\N	\N	\N	\N
6686	1042	5	\N	\N	\N	\N	\N	\N
6687	1044	5	\N	\N	\N	\N	\N	\N
6688	1050	5	\N	\N	\N	\N	\N	\N
6689	1052	5	\N	\N	\N	\N	\N	\N
6690	1053	5	\N	\N	\N	\N	\N	\N
6691	1058	5	\N	\N	\N	\N	\N	\N
6692	1063	5	\N	\N	\N	\N	\N	\N
6693	1066	5	\N	\N	\N	\N	\N	\N
6694	1069	5	\N	\N	\N	\N	\N	\N
6695	1070	5	\N	\N	\N	\N	\N	\N
6696	1082	5	\N	\N	\N	\N	\N	\N
6697	1084	5	\N	\N	\N	\N	\N	\N
6698	1085	5	\N	\N	\N	\N	\N	\N
6699	1087	5	\N	\N	\N	\N	\N	\N
6700	1089	5	\N	\N	\N	\N	\N	\N
6701	1090	5	\N	\N	\N	\N	\N	\N
6702	1093	5	\N	\N	\N	\N	\N	\N
6703	1100	5	\N	\N	\N	\N	\N	\N
6704	1104	5	\N	\N	\N	\N	\N	\N
6705	1106	5	\N	\N	\N	\N	\N	\N
6706	1107	5	\N	\N	\N	\N	\N	\N
6707	1109	5	\N	\N	\N	\N	\N	\N
6708	1110	5	\N	\N	\N	\N	\N	\N
6709	1111	5	\N	\N	\N	\N	\N	\N
6710	1113	5	\N	\N	\N	\N	\N	\N
6711	1120	5	\N	\N	\N	\N	\N	\N
6712	1123	5	\N	\N	\N	\N	\N	\N
6713	1125	5	\N	\N	\N	\N	\N	\N
6714	1135	5	\N	\N	\N	\N	\N	\N
6715	1136	5	\N	\N	\N	\N	\N	\N
6716	1141	5	\N	\N	\N	\N	\N	\N
6717	1146	5	\N	\N	\N	\N	\N	\N
6718	1147	5	\N	\N	\N	\N	\N	\N
6719	1148	5	\N	\N	\N	\N	\N	\N
6720	1153	5	\N	\N	\N	\N	\N	\N
6721	1154	5	\N	\N	\N	\N	\N	\N
6722	1155	5	\N	\N	\N	\N	\N	\N
6723	1156	5	\N	\N	\N	\N	\N	\N
6724	1159	5	\N	\N	\N	\N	\N	\N
6725	1164	5	\N	\N	\N	\N	\N	\N
6726	1165	5	\N	\N	\N	\N	\N	\N
6727	1168	5	\N	\N	\N	\N	\N	\N
6728	1169	5	\N	\N	\N	\N	\N	\N
6729	1172	5	\N	\N	\N	\N	\N	\N
6730	1175	5	\N	\N	\N	\N	\N	\N
6731	1176	5	\N	\N	\N	\N	\N	\N
6732	1182	5	\N	\N	\N	\N	\N	\N
6733	1185	5	\N	\N	\N	\N	\N	\N
6734	1191	5	\N	\N	\N	\N	\N	\N
6735	1193	5	\N	\N	\N	\N	\N	\N
6736	1194	5	\N	\N	\N	\N	\N	\N
6737	1195	5	\N	\N	\N	\N	\N	\N
6738	1198	5	\N	\N	\N	\N	\N	\N
6739	1200	5	\N	\N	\N	\N	\N	\N
6740	1206	5	\N	\N	\N	\N	\N	\N
6741	1208	5	\N	\N	\N	\N	\N	\N
6742	1209	5	\N	\N	\N	\N	\N	\N
6743	1210	5	\N	\N	\N	\N	\N	\N
6744	1212	5	\N	\N	\N	\N	\N	\N
6745	1213	5	\N	\N	\N	\N	\N	\N
6746	1214	5	\N	\N	\N	\N	\N	\N
6747	1216	5	\N	\N	\N	\N	\N	\N
6748	1218	5	\N	\N	\N	\N	\N	\N
6749	1223	5	\N	\N	\N	\N	\N	\N
6750	1226	5	\N	\N	\N	\N	\N	\N
6751	1229	5	\N	\N	\N	\N	\N	\N
6752	1230	5	\N	\N	\N	\N	\N	\N
6753	1234	5	\N	\N	\N	\N	\N	\N
6754	1238	5	\N	\N	\N	\N	\N	\N
6755	1241	5	\N	\N	\N	\N	\N	\N
6756	1244	5	\N	\N	\N	\N	\N	\N
6757	1247	5	\N	\N	\N	\N	\N	\N
6758	1248	5	\N	\N	\N	\N	\N	\N
6759	1249	5	\N	\N	\N	\N	\N	\N
6760	1250	5	\N	\N	\N	\N	\N	\N
6761	1251	5	\N	\N	\N	\N	\N	\N
6762	1252	5	\N	\N	\N	\N	\N	\N
6763	1254	5	\N	\N	\N	\N	\N	\N
6764	1256	5	\N	\N	\N	\N	\N	\N
6765	1257	5	\N	\N	\N	\N	\N	\N
6766	1259	5	\N	\N	\N	\N	\N	\N
6767	1264	5	\N	\N	\N	\N	\N	\N
6768	1266	5	\N	\N	\N	\N	\N	\N
6769	1268	5	\N	\N	\N	\N	\N	\N
6770	1269	5	\N	\N	\N	\N	\N	\N
6771	1271	5	\N	\N	\N	\N	\N	\N
6772	1274	5	\N	\N	\N	\N	\N	\N
6773	1276	5	\N	\N	\N	\N	\N	\N
6774	1279	5	\N	\N	\N	\N	\N	\N
6775	1281	5	\N	\N	\N	\N	\N	\N
6776	1282	5	\N	\N	\N	\N	\N	\N
6777	1283	5	\N	\N	\N	\N	\N	\N
6778	1284	5	\N	\N	\N	\N	\N	\N
6779	1285	5	\N	\N	\N	\N	\N	\N
6780	1286	5	\N	\N	\N	\N	\N	\N
6781	1288	5	\N	\N	\N	\N	\N	\N
6782	1291	5	\N	\N	\N	\N	\N	\N
6783	1294	5	\N	\N	\N	\N	\N	\N
6784	1297	5	\N	\N	\N	\N	\N	\N
6785	1298	5	\N	\N	\N	\N	\N	\N
6786	1299	5	\N	\N	\N	\N	\N	\N
6787	1303	5	\N	\N	\N	\N	\N	\N
6788	1304	5	\N	\N	\N	\N	\N	\N
6789	1306	5	\N	\N	\N	\N	\N	\N
6790	1308	5	\N	\N	\N	\N	\N	\N
6791	1309	5	\N	\N	\N	\N	\N	\N
6792	1312	5	\N	\N	\N	\N	\N	\N
6793	1320	5	\N	\N	\N	\N	\N	\N
6794	1321	5	\N	\N	\N	\N	\N	\N
6795	1322	5	\N	\N	\N	\N	\N	\N
6796	1323	5	\N	\N	\N	\N	\N	\N
6797	1334	5	\N	\N	\N	\N	\N	\N
6798	1336	5	\N	\N	\N	\N	\N	\N
6799	1340	5	\N	\N	\N	\N	\N	\N
6800	1341	5	\N	\N	\N	\N	\N	\N
6801	1343	5	\N	\N	\N	\N	\N	\N
6802	1348	5	\N	\N	\N	\N	\N	\N
6803	1351	5	\N	\N	\N	\N	\N	\N
6804	1352	5	\N	\N	\N	\N	\N	\N
6805	1353	5	\N	\N	\N	\N	\N	\N
6806	1358	5	\N	\N	\N	\N	\N	\N
6807	1361	5	\N	\N	\N	\N	\N	\N
6808	1367	5	\N	\N	\N	\N	\N	\N
6809	1368	5	\N	\N	\N	\N	\N	\N
6810	1371	5	\N	\N	\N	\N	\N	\N
6811	1375	5	\N	\N	\N	\N	\N	\N
6812	1376	5	\N	\N	\N	\N	\N	\N
6813	1380	5	\N	\N	\N	\N	\N	\N
6814	1381	5	\N	\N	\N	\N	\N	\N
6815	1382	5	\N	\N	\N	\N	\N	\N
6816	1387	5	\N	\N	\N	\N	\N	\N
6817	1389	5	\N	\N	\N	\N	\N	\N
6818	1390	5	\N	\N	\N	\N	\N	\N
6819	1391	5	\N	\N	\N	\N	\N	\N
6820	1392	5	\N	\N	\N	\N	\N	\N
6821	1393	5	\N	\N	\N	\N	\N	\N
6822	1395	5	\N	\N	\N	\N	\N	\N
6823	1396	5	\N	\N	\N	\N	\N	\N
6824	1397	5	\N	\N	\N	\N	\N	\N
6825	1398	5	\N	\N	\N	\N	\N	\N
6826	1399	5	\N	\N	\N	\N	\N	\N
6827	1400	5	\N	\N	\N	\N	\N	\N
6828	1403	5	\N	\N	\N	\N	\N	\N
6829	1405	5	\N	\N	\N	\N	\N	\N
6830	1408	5	\N	\N	\N	\N	\N	\N
6831	1409	5	\N	\N	\N	\N	\N	\N
6832	1414	5	\N	\N	\N	\N	\N	\N
6833	1418	5	\N	\N	\N	\N	\N	\N
6834	1420	5	\N	\N	\N	\N	\N	\N
6835	1421	5	\N	\N	\N	\N	\N	\N
6836	1423	5	\N	\N	\N	\N	\N	\N
6837	1425	5	\N	\N	\N	\N	\N	\N
6838	1429	5	\N	\N	\N	\N	\N	\N
6839	1434	5	\N	\N	\N	\N	\N	\N
6840	1435	5	\N	\N	\N	\N	\N	\N
6841	1436	5	\N	\N	\N	\N	\N	\N
6842	1437	5	\N	\N	\N	\N	\N	\N
6843	1439	5	\N	\N	\N	\N	\N	\N
6844	1442	5	\N	\N	\N	\N	\N	\N
6845	1447	5	\N	\N	\N	\N	\N	\N
6846	1448	5	\N	\N	\N	\N	\N	\N
6847	1449	5	\N	\N	\N	\N	\N	\N
6848	1454	5	\N	\N	\N	\N	\N	\N
6849	1455	5	\N	\N	\N	\N	\N	\N
6850	1456	5	\N	\N	\N	\N	\N	\N
6851	1457	5	\N	\N	\N	\N	\N	\N
6852	1459	5	\N	\N	\N	\N	\N	\N
6853	1464	5	\N	\N	\N	\N	\N	\N
6854	1465	5	\N	\N	\N	\N	\N	\N
6855	1466	5	\N	\N	\N	\N	\N	\N
6856	1468	5	\N	\N	\N	\N	\N	\N
6857	1469	5	\N	\N	\N	\N	\N	\N
6858	1472	5	\N	\N	\N	\N	\N	\N
6859	1473	5	\N	\N	\N	\N	\N	\N
6860	1474	5	\N	\N	\N	\N	\N	\N
6861	1475	5	\N	\N	\N	\N	\N	\N
6862	1478	5	\N	\N	\N	\N	\N	\N
6863	1480	5	\N	\N	\N	\N	\N	\N
6864	1481	5	\N	\N	\N	\N	\N	\N
6865	1483	5	\N	\N	\N	\N	\N	\N
6866	1485	5	\N	\N	\N	\N	\N	\N
6867	1486	5	\N	\N	\N	\N	\N	\N
6868	1487	5	\N	\N	\N	\N	\N	\N
6869	1489	5	\N	\N	\N	\N	\N	\N
6870	1492	5	\N	\N	\N	\N	\N	\N
6871	1495	5	\N	\N	\N	\N	\N	\N
6872	1496	5	\N	\N	\N	\N	\N	\N
6873	1497	5	\N	\N	\N	\N	\N	\N
6874	1500	5	\N	\N	\N	\N	\N	\N
6875	1501	5	\N	\N	\N	\N	\N	\N
6876	1503	5	\N	\N	\N	\N	\N	\N
6877	1504	5	\N	\N	\N	\N	\N	\N
6878	1505	5	\N	\N	\N	\N	\N	\N
6879	1506	5	\N	\N	\N	\N	\N	\N
6880	1507	5	\N	\N	\N	\N	\N	\N
6881	1509	5	\N	\N	\N	\N	\N	\N
6882	1510	5	\N	\N	\N	\N	\N	\N
6883	1511	5	\N	\N	\N	\N	\N	\N
6884	1513	5	\N	\N	\N	\N	\N	\N
6885	1514	5	\N	\N	\N	\N	\N	\N
6886	1515	5	\N	\N	\N	\N	\N	\N
6887	1518	5	\N	\N	\N	\N	\N	\N
6888	1520	5	\N	\N	\N	\N	\N	\N
6889	1521	5	\N	\N	\N	\N	\N	\N
6890	1522	5	\N	\N	\N	\N	\N	\N
6891	1523	5	\N	\N	\N	\N	\N	\N
6892	1524	5	\N	\N	\N	\N	\N	\N
6893	1525	5	\N	\N	\N	\N	\N	\N
6894	1526	5	\N	\N	\N	\N	\N	\N
6895	1527	5	\N	\N	\N	\N	\N	\N
6896	1528	5	\N	\N	\N	\N	\N	\N
6897	1529	5	\N	\N	\N	\N	\N	\N
6898	1531	5	\N	\N	\N	\N	\N	\N
6899	1533	5	\N	\N	\N	\N	\N	\N
6900	1534	5	\N	\N	\N	\N	\N	\N
6901	1535	5	\N	\N	\N	\N	\N	\N
6902	1539	5	\N	\N	\N	\N	\N	\N
6903	1542	5	\N	\N	\N	\N	\N	\N
6904	1546	5	\N	\N	\N	\N	\N	\N
6905	1548	5	\N	\N	\N	\N	\N	\N
6906	1550	5	\N	\N	\N	\N	\N	\N
6907	1552	5	\N	\N	\N	\N	\N	\N
6908	1554	5	\N	\N	\N	\N	\N	\N
6909	1555	5	\N	\N	\N	\N	\N	\N
6910	1556	5	\N	\N	\N	\N	\N	\N
6911	1558	5	\N	\N	\N	\N	\N	\N
6912	1559	5	\N	\N	\N	\N	\N	\N
6913	1561	5	\N	\N	\N	\N	\N	\N
6914	1562	5	\N	\N	\N	\N	\N	\N
6915	1563	5	\N	\N	\N	\N	\N	\N
6916	1565	5	\N	\N	\N	\N	\N	\N
6917	1566	5	\N	\N	\N	\N	\N	\N
6918	1567	5	\N	\N	\N	\N	\N	\N
6919	1568	5	\N	\N	\N	\N	\N	\N
6920	1570	5	\N	\N	\N	\N	\N	\N
6921	1575	5	\N	\N	\N	\N	\N	\N
6922	1576	5	\N	\N	\N	\N	\N	\N
6923	1577	5	\N	\N	\N	\N	\N	\N
6924	1578	5	\N	\N	\N	\N	\N	\N
6925	1579	5	\N	\N	\N	\N	\N	\N
6926	1581	5	\N	\N	\N	\N	\N	\N
6927	1582	5	\N	\N	\N	\N	\N	\N
6928	1586	5	\N	\N	\N	\N	\N	\N
6929	1587	5	\N	\N	\N	\N	\N	\N
6930	1588	5	\N	\N	\N	\N	\N	\N
6931	1590	5	\N	\N	\N	\N	\N	\N
6932	1592	5	\N	\N	\N	\N	\N	\N
6933	1595	5	\N	\N	\N	\N	\N	\N
6934	1596	5	\N	\N	\N	\N	\N	\N
6935	1597	5	\N	\N	\N	\N	\N	\N
6936	1598	5	\N	\N	\N	\N	\N	\N
6937	1602	5	\N	\N	\N	\N	\N	\N
6938	1603	5	\N	\N	\N	\N	\N	\N
6939	1605	5	\N	\N	\N	\N	\N	\N
6940	1606	5	\N	\N	\N	\N	\N	\N
6941	1607	5	\N	\N	\N	\N	\N	\N
6942	1608	5	\N	\N	\N	\N	\N	\N
6943	1609	5	\N	\N	\N	\N	\N	\N
6944	1611	5	\N	\N	\N	\N	\N	\N
6945	1614	5	\N	\N	\N	\N	\N	\N
6946	1616	5	\N	\N	\N	\N	\N	\N
6947	1617	5	\N	\N	\N	\N	\N	\N
6948	1618	5	\N	\N	\N	\N	\N	\N
6949	1619	5	\N	\N	\N	\N	\N	\N
6950	1623	5	\N	\N	\N	\N	\N	\N
6951	1624	5	\N	\N	\N	\N	\N	\N
6952	1625	5	\N	\N	\N	\N	\N	\N
6953	1626	5	\N	\N	\N	\N	\N	\N
6954	1628	5	\N	\N	\N	\N	\N	\N
6955	1629	5	\N	\N	\N	\N	\N	\N
6956	1630	5	\N	\N	\N	\N	\N	\N
6957	1631	5	\N	\N	\N	\N	\N	\N
6958	1632	5	\N	\N	\N	\N	\N	\N
6959	1636	5	\N	\N	\N	\N	\N	\N
6960	1637	5	\N	\N	\N	\N	\N	\N
6961	1638	5	\N	\N	\N	\N	\N	\N
6962	1640	5	\N	\N	\N	\N	\N	\N
6963	1642	5	\N	\N	\N	\N	\N	\N
6964	1643	5	\N	\N	\N	\N	\N	\N
6965	1644	5	\N	\N	\N	\N	\N	\N
6966	1647	5	\N	\N	\N	\N	\N	\N
6967	1650	5	\N	\N	\N	\N	\N	\N
6968	1651	5	\N	\N	\N	\N	\N	\N
6969	1654	5	\N	\N	\N	\N	\N	\N
6970	1657	5	\N	\N	\N	\N	\N	\N
6971	1658	5	\N	\N	\N	\N	\N	\N
6972	1659	5	\N	\N	\N	\N	\N	\N
6973	1660	5	\N	\N	\N	\N	\N	\N
6974	1662	5	\N	\N	\N	\N	\N	\N
6975	1665	5	\N	\N	\N	\N	\N	\N
6976	1669	5	\N	\N	\N	\N	\N	\N
6977	1670	5	\N	\N	\N	\N	\N	\N
6978	1671	5	\N	\N	\N	\N	\N	\N
6979	1673	5	\N	\N	\N	\N	\N	\N
6980	1674	5	\N	\N	\N	\N	\N	\N
6981	1676	5	\N	\N	\N	\N	\N	\N
6982	1677	5	\N	\N	\N	\N	\N	\N
6983	1678	5	\N	\N	\N	\N	\N	\N
6984	1679	5	\N	\N	\N	\N	\N	\N
6985	1680	5	\N	\N	\N	\N	\N	\N
6986	1681	5	\N	\N	\N	\N	\N	\N
6987	1683	5	\N	\N	\N	\N	\N	\N
6988	1684	5	\N	\N	\N	\N	\N	\N
6989	1685	5	\N	\N	\N	\N	\N	\N
6990	1686	5	\N	\N	\N	\N	\N	\N
6991	1687	5	\N	\N	\N	\N	\N	\N
6992	1688	5	\N	\N	\N	\N	\N	\N
6993	1690	5	\N	\N	\N	\N	\N	\N
6994	1691	5	\N	\N	\N	\N	\N	\N
6995	1693	5	\N	\N	\N	\N	\N	\N
6996	1694	5	\N	\N	\N	\N	\N	\N
6997	1695	5	\N	\N	\N	\N	\N	\N
6998	1697	5	\N	\N	\N	\N	\N	\N
6999	1698	5	\N	\N	\N	\N	\N	\N
7000	1699	5	\N	\N	\N	\N	\N	\N
7001	1700	5	\N	\N	\N	\N	\N	\N
7002	1702	5	\N	\N	\N	\N	\N	\N
7003	1703	5	\N	\N	\N	\N	\N	\N
7004	1704	5	\N	\N	\N	\N	\N	\N
7005	1706	5	\N	\N	\N	\N	\N	\N
7006	1707	5	\N	\N	\N	\N	\N	\N
7007	1708	5	\N	\N	\N	\N	\N	\N
7008	1709	5	\N	\N	\N	\N	\N	\N
7009	1710	5	\N	\N	\N	\N	\N	\N
7010	1711	5	\N	\N	\N	\N	\N	\N
7011	1712	5	\N	\N	\N	\N	\N	\N
7012	1714	5	\N	\N	\N	\N	\N	\N
7013	1715	5	\N	\N	\N	\N	\N	\N
7014	1716	5	\N	\N	\N	\N	\N	\N
7015	1717	5	\N	\N	\N	\N	\N	\N
7016	1719	5	\N	\N	\N	\N	\N	\N
7017	1720	5	\N	\N	\N	\N	\N	\N
7018	1721	5	\N	\N	\N	\N	\N	\N
7019	1722	5	\N	\N	\N	\N	\N	\N
7020	1723	5	\N	\N	\N	\N	\N	\N
7021	1724	5	\N	\N	\N	\N	\N	\N
7022	1726	5	\N	\N	\N	\N	\N	\N
7023	1727	5	\N	\N	\N	\N	\N	\N
7024	1728	5	\N	\N	\N	\N	\N	\N
7025	1729	5	\N	\N	\N	\N	\N	\N
7026	1731	5	\N	\N	\N	\N	\N	\N
7027	1732	5	\N	\N	\N	\N	\N	\N
7028	1733	5	\N	\N	\N	\N	\N	\N
7029	1736	5	\N	\N	\N	\N	\N	\N
7030	1737	5	\N	\N	\N	\N	\N	\N
7031	1738	5	\N	\N	\N	\N	\N	\N
7032	1739	5	\N	\N	\N	\N	\N	\N
7033	1741	5	\N	\N	\N	\N	\N	\N
7034	1742	5	\N	\N	\N	\N	\N	\N
7035	1743	5	\N	\N	\N	\N	\N	\N
7036	1745	5	\N	\N	\N	\N	\N	\N
7037	1746	5	\N	\N	\N	\N	\N	\N
7038	1747	5	\N	\N	\N	\N	\N	\N
7039	1748	5	\N	\N	\N	\N	\N	\N
7040	1750	5	\N	\N	\N	\N	\N	\N
7041	1752	5	\N	\N	\N	\N	\N	\N
7042	1753	5	\N	\N	\N	\N	\N	\N
7043	1754	5	\N	\N	\N	\N	\N	\N
7044	1755	5	\N	\N	\N	\N	\N	\N
7045	1757	5	\N	\N	\N	\N	\N	\N
7046	1758	5	\N	\N	\N	\N	\N	\N
7047	1759	5	\N	\N	\N	\N	\N	\N
7048	1760	5	\N	\N	\N	\N	\N	\N
7049	1762	5	\N	\N	\N	\N	\N	\N
7050	1763	5	\N	\N	\N	\N	\N	\N
7051	1765	5	\N	\N	\N	\N	\N	\N
7052	1767	5	\N	\N	\N	\N	\N	\N
7053	1768	5	\N	\N	\N	\N	\N	\N
7054	1769	5	\N	\N	\N	\N	\N	\N
7055	1771	5	\N	\N	\N	\N	\N	\N
7056	1772	5	\N	\N	\N	\N	\N	\N
7057	1773	5	\N	\N	\N	\N	\N	\N
7058	1774	5	\N	\N	\N	\N	\N	\N
7059	1775	5	\N	\N	\N	\N	\N	\N
7060	1776	5	\N	\N	\N	\N	\N	\N
7061	1777	5	\N	\N	\N	\N	\N	\N
7062	1778	5	\N	\N	\N	\N	\N	\N
7063	1779	5	\N	\N	\N	\N	\N	\N
7064	1781	5	\N	\N	\N	\N	\N	\N
7065	1782	5	\N	\N	\N	\N	\N	\N
7066	1783	5	\N	\N	\N	\N	\N	\N
7067	1784	5	\N	\N	\N	\N	\N	\N
7068	1785	5	\N	\N	\N	\N	\N	\N
7069	1786	5	\N	\N	\N	\N	\N	\N
7070	1787	5	\N	\N	\N	\N	\N	\N
7071	1788	5	\N	\N	\N	\N	\N	\N
7072	1789	5	\N	\N	\N	\N	\N	\N
7073	1790	5	\N	\N	\N	\N	\N	\N
7074	1792	5	\N	\N	\N	\N	\N	\N
7075	1793	5	\N	\N	\N	\N	\N	\N
7076	1795	5	\N	\N	\N	\N	\N	\N
7077	1797	5	\N	\N	\N	\N	\N	\N
7078	1798	5	\N	\N	\N	\N	\N	\N
7079	1799	5	\N	\N	\N	\N	\N	\N
7080	1801	5	\N	\N	\N	\N	\N	\N
7081	1803	5	\N	\N	\N	\N	\N	\N
7082	1805	5	\N	\N	\N	\N	\N	\N
7083	1807	5	\N	\N	\N	\N	\N	\N
7084	1808	5	\N	\N	\N	\N	\N	\N
7085	1809	5	\N	\N	\N	\N	\N	\N
7086	1810	5	\N	\N	\N	\N	\N	\N
7087	1811	5	\N	\N	\N	\N	\N	\N
7088	1812	5	\N	\N	\N	\N	\N	\N
7089	1814	5	\N	\N	\N	\N	\N	\N
7090	1815	5	\N	\N	\N	\N	\N	\N
7091	1816	5	\N	\N	\N	\N	\N	\N
7092	1817	5	\N	\N	\N	\N	\N	\N
7093	1818	5	\N	\N	\N	\N	\N	\N
7094	1819	5	\N	\N	\N	\N	\N	\N
7095	1824	5	\N	\N	\N	\N	\N	\N
7096	1825	5	\N	\N	\N	\N	\N	\N
7097	1826	5	\N	\N	\N	\N	\N	\N
7098	1828	5	\N	\N	\N	\N	\N	\N
7099	1830	5	\N	\N	\N	\N	\N	\N
7100	1831	5	\N	\N	\N	\N	\N	\N
7101	1832	5	\N	\N	\N	\N	\N	\N
7102	1833	5	\N	\N	\N	\N	\N	\N
7103	1834	5	\N	\N	\N	\N	\N	\N
7104	1835	5	\N	\N	\N	\N	\N	\N
7105	1836	5	\N	\N	\N	\N	\N	\N
7106	1837	5	\N	\N	\N	\N	\N	\N
7107	1838	5	\N	\N	\N	\N	\N	\N
7108	1839	5	\N	\N	\N	\N	\N	\N
7109	1840	5	\N	\N	\N	\N	\N	\N
7110	1841	5	\N	\N	\N	\N	\N	\N
7111	1842	5	\N	\N	\N	\N	\N	\N
7112	1843	5	\N	\N	\N	\N	\N	\N
7113	1845	5	\N	\N	\N	\N	\N	\N
7114	1846	5	\N	\N	\N	\N	\N	\N
7115	1847	5	\N	\N	\N	\N	\N	\N
7116	1848	5	\N	\N	\N	\N	\N	\N
7117	1849	5	\N	\N	\N	\N	\N	\N
7118	1850	5	\N	\N	\N	\N	\N	\N
7119	1851	5	\N	\N	\N	\N	\N	\N
7120	1852	5	\N	\N	\N	\N	\N	\N
7121	1853	5	\N	\N	\N	\N	\N	\N
7122	1856	5	\N	\N	\N	\N	\N	\N
7123	1857	5	\N	\N	\N	\N	\N	\N
7124	1861	5	\N	\N	\N	\N	\N	\N
7125	1863	5	\N	\N	\N	\N	\N	\N
7126	1864	5	\N	\N	\N	\N	\N	\N
7127	1865	5	\N	\N	\N	\N	\N	\N
7128	1866	5	\N	\N	\N	\N	\N	\N
7129	1869	5	\N	\N	\N	\N	\N	\N
7130	1871	5	\N	\N	\N	\N	\N	\N
7131	1872	5	\N	\N	\N	\N	\N	\N
7132	1873	5	\N	\N	\N	\N	\N	\N
7133	1876	5	\N	\N	\N	\N	\N	\N
7134	1877	5	\N	\N	\N	\N	\N	\N
7135	1878	5	\N	\N	\N	\N	\N	\N
7136	1881	5	\N	\N	\N	\N	\N	\N
7137	1882	5	\N	\N	\N	\N	\N	\N
7138	1883	5	\N	\N	\N	\N	\N	\N
7139	1884	5	\N	\N	\N	\N	\N	\N
7140	1885	5	\N	\N	\N	\N	\N	\N
7141	1886	5	\N	\N	\N	\N	\N	\N
7142	1887	5	\N	\N	\N	\N	\N	\N
7143	1888	5	\N	\N	\N	\N	\N	\N
7144	1889	5	\N	\N	\N	\N	\N	\N
7145	1890	5	\N	\N	\N	\N	\N	\N
7146	1894	5	\N	\N	\N	\N	\N	\N
7147	1896	5	\N	\N	\N	\N	\N	\N
7148	1897	5	\N	\N	\N	\N	\N	\N
7149	1898	5	\N	\N	\N	\N	\N	\N
7150	1899	5	\N	\N	\N	\N	\N	\N
7151	1900	5	\N	\N	\N	\N	\N	\N
7152	1902	5	\N	\N	\N	\N	\N	\N
7153	1903	5	\N	\N	\N	\N	\N	\N
7154	1904	5	\N	\N	\N	\N	\N	\N
7155	1905	5	\N	\N	\N	\N	\N	\N
7156	1907	5	\N	\N	\N	\N	\N	\N
7157	1908	5	\N	\N	\N	\N	\N	\N
7158	1910	5	\N	\N	\N	\N	\N	\N
7159	1912	5	\N	\N	\N	\N	\N	\N
7160	1913	5	\N	\N	\N	\N	\N	\N
7161	1915	5	\N	\N	\N	\N	\N	\N
7162	1916	5	\N	\N	\N	\N	\N	\N
7163	1917	5	\N	\N	\N	\N	\N	\N
7164	1918	5	\N	\N	\N	\N	\N	\N
7165	1920	5	\N	\N	\N	\N	\N	\N
7166	1921	5	\N	\N	\N	\N	\N	\N
7167	1922	5	\N	\N	\N	\N	\N	\N
7168	1923	5	\N	\N	\N	\N	\N	\N
7169	1925	5	\N	\N	\N	\N	\N	\N
7170	1926	5	\N	\N	\N	\N	\N	\N
7171	1927	5	\N	\N	\N	\N	\N	\N
7172	1930	5	\N	\N	\N	\N	\N	\N
7173	1931	5	\N	\N	\N	\N	\N	\N
7174	1933	5	\N	\N	\N	\N	\N	\N
7175	1934	5	\N	\N	\N	\N	\N	\N
7176	1935	5	\N	\N	\N	\N	\N	\N
7177	1937	5	\N	\N	\N	\N	\N	\N
7178	1938	5	\N	\N	\N	\N	\N	\N
7179	1942	5	\N	\N	\N	\N	\N	\N
7180	1943	5	\N	\N	\N	\N	\N	\N
7181	1945	5	\N	\N	\N	\N	\N	\N
7182	1946	5	\N	\N	\N	\N	\N	\N
7183	1947	5	\N	\N	\N	\N	\N	\N
7184	1948	5	\N	\N	\N	\N	\N	\N
7185	1949	5	\N	\N	\N	\N	\N	\N
7186	1950	5	\N	\N	\N	\N	\N	\N
7187	1951	5	\N	\N	\N	\N	\N	\N
7188	1952	5	\N	\N	\N	\N	\N	\N
7189	1954	5	\N	\N	\N	\N	\N	\N
7190	1955	5	\N	\N	\N	\N	\N	\N
7191	1956	5	\N	\N	\N	\N	\N	\N
7192	1958	5	\N	\N	\N	\N	\N	\N
7193	1959	5	\N	\N	\N	\N	\N	\N
7194	1961	5	\N	\N	\N	\N	\N	\N
7195	1962	5	\N	\N	\N	\N	\N	\N
7196	1963	5	\N	\N	\N	\N	\N	\N
7197	1964	5	\N	\N	\N	\N	\N	\N
7198	1965	5	\N	\N	\N	\N	\N	\N
7199	1966	5	\N	\N	\N	\N	\N	\N
7200	1967	5	\N	\N	\N	\N	\N	\N
7201	1968	5	\N	\N	\N	\N	\N	\N
7202	1969	5	\N	\N	\N	\N	\N	\N
7203	1970	5	\N	\N	\N	\N	\N	\N
7204	1971	5	\N	\N	\N	\N	\N	\N
7205	1973	5	\N	\N	\N	\N	\N	\N
7206	1974	5	\N	\N	\N	\N	\N	\N
7207	1975	5	\N	\N	\N	\N	\N	\N
7208	1976	5	\N	\N	\N	\N	\N	\N
7209	1979	5	\N	\N	\N	\N	\N	\N
7210	1980	5	\N	\N	\N	\N	\N	\N
7211	1981	5	\N	\N	\N	\N	\N	\N
7212	1982	5	\N	\N	\N	\N	\N	\N
7213	1983	5	\N	\N	\N	\N	\N	\N
7214	1984	5	\N	\N	\N	\N	\N	\N
7215	1985	5	\N	\N	\N	\N	\N	\N
7216	1986	5	\N	\N	\N	\N	\N	\N
7217	1987	5	\N	\N	\N	\N	\N	\N
7218	1988	5	\N	\N	\N	\N	\N	\N
7219	1989	5	\N	\N	\N	\N	\N	\N
7220	1990	5	\N	\N	\N	\N	\N	\N
7221	1991	5	\N	\N	\N	\N	\N	\N
7222	1993	5	\N	\N	\N	\N	\N	\N
7223	1994	5	\N	\N	\N	\N	\N	\N
7224	1995	5	\N	\N	\N	\N	\N	\N
7225	1996	5	\N	\N	\N	\N	\N	\N
7226	1998	5	\N	\N	\N	\N	\N	\N
7227	1999	5	\N	\N	\N	\N	\N	\N
7228	2000	5	\N	\N	\N	\N	\N	\N
7229	2001	5	\N	\N	\N	\N	\N	\N
7230	2002	5	\N	\N	\N	\N	\N	\N
7231	2004	5	\N	\N	\N	\N	\N	\N
7232	2005	5	\N	\N	\N	\N	\N	\N
7233	2006	5	\N	\N	\N	\N	\N	\N
7234	2007	5	\N	\N	\N	\N	\N	\N
7235	2008	5	\N	\N	\N	\N	\N	\N
7236	2009	5	\N	\N	\N	\N	\N	\N
7237	2010	5	\N	\N	\N	\N	\N	\N
7238	2011	5	\N	\N	\N	\N	\N	\N
7239	2012	5	\N	\N	\N	\N	\N	\N
7240	2013	5	\N	\N	\N	\N	\N	\N
7241	2015	5	\N	\N	\N	\N	\N	\N
7242	2017	5	\N	\N	\N	\N	\N	\N
7243	2018	5	\N	\N	\N	\N	\N	\N
7244	2019	5	\N	\N	\N	\N	\N	\N
7245	2021	5	\N	\N	\N	\N	\N	\N
7246	2022	5	\N	\N	\N	\N	\N	\N
7247	2024	5	\N	\N	\N	\N	\N	\N
7248	2025	5	\N	\N	\N	\N	\N	\N
7249	2026	5	\N	\N	\N	\N	\N	\N
7250	2027	5	\N	\N	\N	\N	\N	\N
7251	2029	5	\N	\N	\N	\N	\N	\N
7252	2030	5	\N	\N	\N	\N	\N	\N
7253	2031	5	\N	\N	\N	\N	\N	\N
7254	2032	5	\N	\N	\N	\N	\N	\N
7255	2033	5	\N	\N	\N	\N	\N	\N
7256	2034	5	\N	\N	\N	\N	\N	\N
7257	2036	5	\N	\N	\N	\N	\N	\N
7258	2037	5	\N	\N	\N	\N	\N	\N
7259	2038	5	\N	\N	\N	\N	\N	\N
7260	2039	5	\N	\N	\N	\N	\N	\N
7261	2040	5	\N	\N	\N	\N	\N	\N
7262	2041	5	\N	\N	\N	\N	\N	\N
7263	2042	5	\N	\N	\N	\N	\N	\N
7264	2043	5	\N	\N	\N	\N	\N	\N
7265	2044	5	\N	\N	\N	\N	\N	\N
7266	2045	5	\N	\N	\N	\N	\N	\N
7267	2046	5	\N	\N	\N	\N	\N	\N
7268	2047	5	\N	\N	\N	\N	\N	\N
7269	2048	5	\N	\N	\N	\N	\N	\N
7270	2049	5	\N	\N	\N	\N	\N	\N
7271	2050	5	\N	\N	\N	\N	\N	\N
7272	2051	5	\N	\N	\N	\N	\N	\N
7273	2053	5	\N	\N	\N	\N	\N	\N
7274	2054	5	\N	\N	\N	\N	\N	\N
7275	2055	5	\N	\N	\N	\N	\N	\N
7276	2056	5	\N	\N	\N	\N	\N	\N
7277	2057	5	\N	\N	\N	\N	\N	\N
7278	2058	5	\N	\N	\N	\N	\N	\N
7279	2059	5	\N	\N	\N	\N	\N	\N
7280	2060	5	\N	\N	\N	\N	\N	\N
7281	2061	5	\N	\N	\N	\N	\N	\N
7282	2062	5	\N	\N	\N	\N	\N	\N
7283	2063	5	\N	\N	\N	\N	\N	\N
7284	2064	5	\N	\N	\N	\N	\N	\N
7285	2065	5	\N	\N	\N	\N	\N	\N
7286	2066	5	\N	\N	\N	\N	\N	\N
7287	2067	5	\N	\N	\N	\N	\N	\N
7288	2069	5	\N	\N	\N	\N	\N	\N
7289	2070	5	\N	\N	\N	\N	\N	\N
7290	2071	5	\N	\N	\N	\N	\N	\N
7291	2072	5	\N	\N	\N	\N	\N	\N
7292	2074	5	\N	\N	\N	\N	\N	\N
7293	2076	5	\N	\N	\N	\N	\N	\N
7294	2077	5	\N	\N	\N	\N	\N	\N
7295	2078	5	\N	\N	\N	\N	\N	\N
7296	2079	5	\N	\N	\N	\N	\N	\N
7297	2080	5	\N	\N	\N	\N	\N	\N
7298	2081	5	\N	\N	\N	\N	\N	\N
7299	2082	5	\N	\N	\N	\N	\N	\N
7300	2083	5	\N	\N	\N	\N	\N	\N
7301	2087	5	\N	\N	\N	\N	\N	\N
7302	2088	5	\N	\N	\N	\N	\N	\N
7303	2089	5	\N	\N	\N	\N	\N	\N
7304	2090	5	\N	\N	\N	\N	\N	\N
7305	2091	5	\N	\N	\N	\N	\N	\N
7306	2092	5	\N	\N	\N	\N	\N	\N
7307	2093	5	\N	\N	\N	\N	\N	\N
7308	2094	5	\N	\N	\N	\N	\N	\N
7309	2095	5	\N	\N	\N	\N	\N	\N
7310	2096	5	\N	\N	\N	\N	\N	\N
7311	2098	5	\N	\N	\N	\N	\N	\N
7312	2099	5	\N	\N	\N	\N	\N	\N
7313	2100	5	\N	\N	\N	\N	\N	\N
7314	2101	5	\N	\N	\N	\N	\N	\N
7315	2103	5	\N	\N	\N	\N	\N	\N
7316	2104	5	\N	\N	\N	\N	\N	\N
7317	2105	5	\N	\N	\N	\N	\N	\N
7318	2106	5	\N	\N	\N	\N	\N	\N
7319	2107	5	\N	\N	\N	\N	\N	\N
7320	2109	5	\N	\N	\N	\N	\N	\N
7321	2110	5	\N	\N	\N	\N	\N	\N
7322	2112	5	\N	\N	\N	\N	\N	\N
7323	2114	5	\N	\N	\N	\N	\N	\N
7324	2115	5	\N	\N	\N	\N	\N	\N
7325	2117	5	\N	\N	\N	\N	\N	\N
7326	2118	5	\N	\N	\N	\N	\N	\N
7327	2119	5	\N	\N	\N	\N	\N	\N
7328	2120	5	\N	\N	\N	\N	\N	\N
7329	2122	5	\N	\N	\N	\N	\N	\N
7330	2123	5	\N	\N	\N	\N	\N	\N
7331	2124	5	\N	\N	\N	\N	\N	\N
7332	2125	5	\N	\N	\N	\N	\N	\N
7333	2126	5	\N	\N	\N	\N	\N	\N
7334	2127	5	\N	\N	\N	\N	\N	\N
7335	2129	5	\N	\N	\N	\N	\N	\N
7336	2130	5	\N	\N	\N	\N	\N	\N
7337	2132	5	\N	\N	\N	\N	\N	\N
7338	2134	5	\N	\N	\N	\N	\N	\N
7339	2135	5	\N	\N	\N	\N	\N	\N
7340	2136	5	\N	\N	\N	\N	\N	\N
7341	2137	5	\N	\N	\N	\N	\N	\N
7342	2138	5	\N	\N	\N	\N	\N	\N
7343	2139	5	\N	\N	\N	\N	\N	\N
7344	2142	5	\N	\N	\N	\N	\N	\N
7345	2143	5	\N	\N	\N	\N	\N	\N
7346	2144	5	\N	\N	\N	\N	\N	\N
7347	2146	5	\N	\N	\N	\N	\N	\N
7348	2147	5	\N	\N	\N	\N	\N	\N
7349	2148	5	\N	\N	\N	\N	\N	\N
7350	2149	5	\N	\N	\N	\N	\N	\N
7351	2150	5	\N	\N	\N	\N	\N	\N
7352	2151	5	\N	\N	\N	\N	\N	\N
7353	2152	5	\N	\N	\N	\N	\N	\N
7354	2153	5	\N	\N	\N	\N	\N	\N
7355	2157	5	\N	\N	\N	\N	\N	\N
7356	2158	5	\N	\N	\N	\N	\N	\N
7357	2159	5	\N	\N	\N	\N	\N	\N
7358	2160	5	\N	\N	\N	\N	\N	\N
7359	2161	5	\N	\N	\N	\N	\N	\N
7360	2162	5	\N	\N	\N	\N	\N	\N
7361	2163	5	\N	\N	\N	\N	\N	\N
7362	2165	5	\N	\N	\N	\N	\N	\N
7363	2166	5	\N	\N	\N	\N	\N	\N
7364	2167	5	\N	\N	\N	\N	\N	\N
7365	2168	5	\N	\N	\N	\N	\N	\N
7366	2170	5	\N	\N	\N	\N	\N	\N
7367	2171	5	\N	\N	\N	\N	\N	\N
7368	2172	5	\N	\N	\N	\N	\N	\N
7369	2173	5	\N	\N	\N	\N	\N	\N
7370	2174	5	\N	\N	\N	\N	\N	\N
7371	2175	5	\N	\N	\N	\N	\N	\N
7372	2176	5	\N	\N	\N	\N	\N	\N
7373	2177	5	\N	\N	\N	\N	\N	\N
7374	2178	5	\N	\N	\N	\N	\N	\N
7375	2179	5	\N	\N	\N	\N	\N	\N
7376	2180	5	\N	\N	\N	\N	\N	\N
7377	2181	5	\N	\N	\N	\N	\N	\N
7378	2182	5	\N	\N	\N	\N	\N	\N
7379	2183	5	\N	\N	\N	\N	\N	\N
7380	2184	5	\N	\N	\N	\N	\N	\N
7381	2185	5	\N	\N	\N	\N	\N	\N
7382	2187	5	\N	\N	\N	\N	\N	\N
7383	2189	5	\N	\N	\N	\N	\N	\N
7384	2190	5	\N	\N	\N	\N	\N	\N
7385	2191	5	\N	\N	\N	\N	\N	\N
7386	2192	5	\N	\N	\N	\N	\N	\N
7387	2193	5	\N	\N	\N	\N	\N	\N
7388	2194	5	\N	\N	\N	\N	\N	\N
7389	2196	5	\N	\N	\N	\N	\N	\N
7390	2198	5	\N	\N	\N	\N	\N	\N
7391	2199	5	\N	\N	\N	\N	\N	\N
7392	2200	5	\N	\N	\N	\N	\N	\N
7393	2201	5	\N	\N	\N	\N	\N	\N
7394	2202	5	\N	\N	\N	\N	\N	\N
7395	2204	5	\N	\N	\N	\N	\N	\N
7396	2205	5	\N	\N	\N	\N	\N	\N
7397	2207	5	\N	\N	\N	\N	\N	\N
7398	2208	5	\N	\N	\N	\N	\N	\N
7399	2209	5	\N	\N	\N	\N	\N	\N
7400	2211	5	\N	\N	\N	\N	\N	\N
7401	2212	5	\N	\N	\N	\N	\N	\N
7402	2213	5	\N	\N	\N	\N	\N	\N
7403	2214	5	\N	\N	\N	\N	\N	\N
7404	2215	5	\N	\N	\N	\N	\N	\N
7405	2217	5	\N	\N	\N	\N	\N	\N
7406	2218	5	\N	\N	\N	\N	\N	\N
7407	2219	5	\N	\N	\N	\N	\N	\N
7408	2221	5	\N	\N	\N	\N	\N	\N
7409	2222	5	\N	\N	\N	\N	\N	\N
7410	2223	5	\N	\N	\N	\N	\N	\N
7411	2224	5	\N	\N	\N	\N	\N	\N
7412	2225	5	\N	\N	\N	\N	\N	\N
7413	2228	5	\N	\N	\N	\N	\N	\N
7414	2229	5	\N	\N	\N	\N	\N	\N
7415	2230	5	\N	\N	\N	\N	\N	\N
7416	2231	5	\N	\N	\N	\N	\N	\N
7417	2232	5	\N	\N	\N	\N	\N	\N
7418	2235	5	\N	\N	\N	\N	\N	\N
7419	2236	5	\N	\N	\N	\N	\N	\N
7420	2237	5	\N	\N	\N	\N	\N	\N
7421	2239	5	\N	\N	\N	\N	\N	\N
7422	2240	5	\N	\N	\N	\N	\N	\N
7423	2241	5	\N	\N	\N	\N	\N	\N
7424	2242	5	\N	\N	\N	\N	\N	\N
7425	2243	5	\N	\N	\N	\N	\N	\N
7426	2244	5	\N	\N	\N	\N	\N	\N
7427	2245	5	\N	\N	\N	\N	\N	\N
7428	2246	5	\N	\N	\N	\N	\N	\N
7429	2247	5	\N	\N	\N	\N	\N	\N
7430	2248	5	\N	\N	\N	\N	\N	\N
7431	2249	5	\N	\N	\N	\N	\N	\N
7432	2250	5	\N	\N	\N	\N	\N	\N
7433	2251	5	\N	\N	\N	\N	\N	\N
7434	2253	5	\N	\N	\N	\N	\N	\N
7435	2255	5	\N	\N	\N	\N	\N	\N
7436	2256	5	\N	\N	\N	\N	\N	\N
7437	2257	5	\N	\N	\N	\N	\N	\N
7438	2258	5	\N	\N	\N	\N	\N	\N
7439	2259	5	\N	\N	\N	\N	\N	\N
7440	2260	5	\N	\N	\N	\N	\N	\N
7441	2261	5	\N	\N	\N	\N	\N	\N
7442	2262	5	\N	\N	\N	\N	\N	\N
7443	2263	5	\N	\N	\N	\N	\N	\N
7444	2264	5	\N	\N	\N	\N	\N	\N
7445	2265	5	\N	\N	\N	\N	\N	\N
7446	2266	5	\N	\N	\N	\N	\N	\N
7447	2267	5	\N	\N	\N	\N	\N	\N
7448	2268	5	\N	\N	\N	\N	\N	\N
7449	2269	5	\N	\N	\N	\N	\N	\N
7450	2270	5	\N	\N	\N	\N	\N	\N
7451	2271	5	\N	\N	\N	\N	\N	\N
7452	2272	5	\N	\N	\N	\N	\N	\N
7453	2273	5	\N	\N	\N	\N	\N	\N
7454	2274	5	\N	\N	\N	\N	\N	\N
7455	2275	5	\N	\N	\N	\N	\N	\N
7456	2276	5	\N	\N	\N	\N	\N	\N
7457	2277	5	\N	\N	\N	\N	\N	\N
7458	2278	5	\N	\N	\N	\N	\N	\N
7459	2279	5	\N	\N	\N	\N	\N	\N
7460	2280	5	\N	\N	\N	\N	\N	\N
7461	2281	5	\N	\N	\N	\N	\N	\N
7462	2282	5	\N	\N	\N	\N	\N	\N
7463	2283	5	\N	\N	\N	\N	\N	\N
7464	2284	5	\N	\N	\N	\N	\N	\N
7465	2285	5	\N	\N	\N	\N	\N	\N
7466	2286	5	\N	\N	\N	\N	\N	\N
7467	2287	5	\N	\N	\N	\N	\N	\N
7468	2288	5	\N	\N	\N	\N	\N	\N
7469	2289	5	\N	\N	\N	\N	\N	\N
7470	2290	5	\N	\N	\N	\N	\N	\N
7471	2291	5	\N	\N	\N	\N	\N	\N
7472	2293	5	\N	\N	\N	\N	\N	\N
7473	2295	5	\N	\N	\N	\N	\N	\N
7474	2296	5	\N	\N	\N	\N	\N	\N
7475	2297	5	\N	\N	\N	\N	\N	\N
7476	2298	5	\N	\N	\N	\N	\N	\N
7477	2299	5	\N	\N	\N	\N	\N	\N
7478	2300	5	\N	\N	\N	\N	\N	\N
7479	2303	5	\N	\N	\N	\N	\N	\N
7480	2304	5	\N	\N	\N	\N	\N	\N
7481	2305	5	\N	\N	\N	\N	\N	\N
7482	2306	5	\N	\N	\N	\N	\N	\N
7483	2307	5	\N	\N	\N	\N	\N	\N
7484	2308	5	\N	\N	\N	\N	\N	\N
7485	2309	5	\N	\N	\N	\N	\N	\N
7486	2310	5	\N	\N	\N	\N	\N	\N
7487	2311	5	\N	\N	\N	\N	\N	\N
7488	2312	5	\N	\N	\N	\N	\N	\N
7489	2313	5	\N	\N	\N	\N	\N	\N
7490	2314	5	\N	\N	\N	\N	\N	\N
7491	2315	5	\N	\N	\N	\N	\N	\N
7492	2316	5	\N	\N	\N	\N	\N	\N
7493	2317	5	\N	\N	\N	\N	\N	\N
7494	2318	5	\N	\N	\N	\N	\N	\N
7495	2320	5	\N	\N	\N	\N	\N	\N
7496	2321	5	\N	\N	\N	\N	\N	\N
7497	2323	5	\N	\N	\N	\N	\N	\N
7498	2324	5	\N	\N	\N	\N	\N	\N
7499	2325	5	\N	\N	\N	\N	\N	\N
7500	2327	5	\N	\N	\N	\N	\N	\N
7501	2329	5	\N	\N	\N	\N	\N	\N
7502	2330	5	\N	\N	\N	\N	\N	\N
7503	2331	5	\N	\N	\N	\N	\N	\N
7504	2332	5	\N	\N	\N	\N	\N	\N
7505	2333	5	\N	\N	\N	\N	\N	\N
7506	2334	5	\N	\N	\N	\N	\N	\N
7507	2335	5	\N	\N	\N	\N	\N	\N
7508	2336	5	\N	\N	\N	\N	\N	\N
7509	2337	5	\N	\N	\N	\N	\N	\N
7510	2338	5	\N	\N	\N	\N	\N	\N
7511	2340	5	\N	\N	\N	\N	\N	\N
7512	2341	5	\N	\N	\N	\N	\N	\N
7513	2342	5	\N	\N	\N	\N	\N	\N
7514	2343	5	\N	\N	\N	\N	\N	\N
7515	2344	5	\N	\N	\N	\N	\N	\N
7516	2345	5	\N	\N	\N	\N	\N	\N
7517	2346	5	\N	\N	\N	\N	\N	\N
7518	2347	5	\N	\N	\N	\N	\N	\N
7519	2348	5	\N	\N	\N	\N	\N	\N
7520	2349	5	\N	\N	\N	\N	\N	\N
7521	2350	5	\N	\N	\N	\N	\N	\N
7522	2351	5	\N	\N	\N	\N	\N	\N
7523	2352	5	\N	\N	\N	\N	\N	\N
7524	2353	5	\N	\N	\N	\N	\N	\N
7525	2354	5	\N	\N	\N	\N	\N	\N
7526	2355	5	\N	\N	\N	\N	\N	\N
7527	2356	5	\N	\N	\N	\N	\N	\N
7528	2357	5	\N	\N	\N	\N	\N	\N
7529	2358	5	\N	\N	\N	\N	\N	\N
7530	2359	5	\N	\N	\N	\N	\N	\N
7531	2360	5	\N	\N	\N	\N	\N	\N
7532	2361	5	\N	\N	\N	\N	\N	\N
7533	2362	5	\N	\N	\N	\N	\N	\N
7534	2363	5	\N	\N	\N	\N	\N	\N
7535	2364	5	\N	\N	\N	\N	\N	\N
7536	2366	5	\N	\N	\N	\N	\N	\N
7537	2367	5	\N	\N	\N	\N	\N	\N
7538	2368	5	\N	\N	\N	\N	\N	\N
7539	2369	5	\N	\N	\N	\N	\N	\N
7540	2370	5	\N	\N	\N	\N	\N	\N
7541	2371	5	\N	\N	\N	\N	\N	\N
7542	2372	5	\N	\N	\N	\N	\N	\N
7543	2373	5	\N	\N	\N	\N	\N	\N
7544	2374	5	\N	\N	\N	\N	\N	\N
7545	2375	5	\N	\N	\N	\N	\N	\N
7546	2376	5	\N	\N	\N	\N	\N	\N
7547	2377	5	\N	\N	\N	\N	\N	\N
7548	2378	5	\N	\N	\N	\N	\N	\N
7549	2379	5	\N	\N	\N	\N	\N	\N
7550	2380	5	\N	\N	\N	\N	\N	\N
7551	2381	5	\N	\N	\N	\N	\N	\N
7552	2382	5	\N	\N	\N	\N	\N	\N
7553	2383	5	\N	\N	\N	\N	\N	\N
7554	2384	5	\N	\N	\N	\N	\N	\N
7555	2385	5	\N	\N	\N	\N	\N	\N
7556	2386	5	\N	\N	\N	\N	\N	\N
7557	2387	5	\N	\N	\N	\N	\N	\N
7558	2389	5	\N	\N	\N	\N	\N	\N
7559	2390	5	\N	\N	\N	\N	\N	\N
7560	2391	5	\N	\N	\N	\N	\N	\N
7561	2392	5	\N	\N	\N	\N	\N	\N
7562	2394	5	\N	\N	\N	\N	\N	\N
7563	2395	5	\N	\N	\N	\N	\N	\N
7564	2396	5	\N	\N	\N	\N	\N	\N
7565	2397	5	\N	\N	\N	\N	\N	\N
7566	2398	5	\N	\N	\N	\N	\N	\N
7567	2399	5	\N	\N	\N	\N	\N	\N
7568	2400	5	\N	\N	\N	\N	\N	\N
7569	2402	5	\N	\N	\N	\N	\N	\N
7570	2403	5	\N	\N	\N	\N	\N	\N
7571	2404	5	\N	\N	\N	\N	\N	\N
7572	2405	5	\N	\N	\N	\N	\N	\N
7573	2406	5	\N	\N	\N	\N	\N	\N
7574	2407	5	\N	\N	\N	\N	\N	\N
7575	2408	5	\N	\N	\N	\N	\N	\N
7576	2409	5	\N	\N	\N	\N	\N	\N
7577	2410	5	\N	\N	\N	\N	\N	\N
7578	2411	5	\N	\N	\N	\N	\N	\N
7579	2412	5	\N	\N	\N	\N	\N	\N
7580	2413	5	\N	\N	\N	\N	\N	\N
7581	2414	5	\N	\N	\N	\N	\N	\N
7582	2415	5	\N	\N	\N	\N	\N	\N
7583	2416	5	\N	\N	\N	\N	\N	\N
7584	2418	5	\N	\N	\N	\N	\N	\N
7585	2419	5	\N	\N	\N	\N	\N	\N
7586	2420	5	\N	\N	\N	\N	\N	\N
7587	2421	5	\N	\N	\N	\N	\N	\N
7588	2422	5	\N	\N	\N	\N	\N	\N
7589	2423	5	\N	\N	\N	\N	\N	\N
7590	2424	5	\N	\N	\N	\N	\N	\N
7591	2425	5	\N	\N	\N	\N	\N	\N
7592	2426	5	\N	\N	\N	\N	\N	\N
7593	2427	5	\N	\N	\N	\N	\N	\N
7594	2428	5	\N	\N	\N	\N	\N	\N
7595	2429	5	\N	\N	\N	\N	\N	\N
7596	2430	5	\N	\N	\N	\N	\N	\N
7597	2432	5	\N	\N	\N	\N	\N	\N
7598	2433	5	\N	\N	\N	\N	\N	\N
7599	2434	5	\N	\N	\N	\N	\N	\N
7600	2435	5	\N	\N	\N	\N	\N	\N
7601	2436	5	\N	\N	\N	\N	\N	\N
7602	2437	5	\N	\N	\N	\N	\N	\N
7603	2438	5	\N	\N	\N	\N	\N	\N
7604	2439	5	\N	\N	\N	\N	\N	\N
7605	2440	5	\N	\N	\N	\N	\N	\N
7606	2441	5	\N	\N	\N	\N	\N	\N
7607	2443	5	\N	\N	\N	\N	\N	\N
7608	2444	5	\N	\N	\N	\N	\N	\N
7609	2445	5	\N	\N	\N	\N	\N	\N
7610	2446	5	\N	\N	\N	\N	\N	\N
7611	2447	5	\N	\N	\N	\N	\N	\N
7612	2448	5	\N	\N	\N	\N	\N	\N
7613	2450	5	\N	\N	\N	\N	\N	\N
7614	2452	5	\N	\N	\N	\N	\N	\N
7615	2453	5	\N	\N	\N	\N	\N	\N
7616	2454	5	\N	\N	\N	\N	\N	\N
7617	2455	5	\N	\N	\N	\N	\N	\N
7618	2456	5	\N	\N	\N	\N	\N	\N
7619	2457	5	\N	\N	\N	\N	\N	\N
7620	2458	5	\N	\N	\N	\N	\N	\N
7621	2459	5	\N	\N	\N	\N	\N	\N
7622	2460	5	\N	\N	\N	\N	\N	\N
7623	2461	5	\N	\N	\N	\N	\N	\N
7624	2462	5	\N	\N	\N	\N	\N	\N
7625	2464	5	\N	\N	\N	\N	\N	\N
7626	2465	5	\N	\N	\N	\N	\N	\N
7627	2466	5	\N	\N	\N	\N	\N	\N
7628	2467	5	\N	\N	\N	\N	\N	\N
7629	2468	5	\N	\N	\N	\N	\N	\N
7630	2469	5	\N	\N	\N	\N	\N	\N
7631	2470	5	\N	\N	\N	\N	\N	\N
7632	2471	5	\N	\N	\N	\N	\N	\N
7633	2472	5	\N	\N	\N	\N	\N	\N
7634	2473	5	\N	\N	\N	\N	\N	\N
7635	2474	5	\N	\N	\N	\N	\N	\N
7636	2475	5	\N	\N	\N	\N	\N	\N
7637	2476	5	\N	\N	\N	\N	\N	\N
7638	2477	5	\N	\N	\N	\N	\N	\N
7639	2478	5	\N	\N	\N	\N	\N	\N
7640	2479	5	\N	\N	\N	\N	\N	\N
7641	2480	5	\N	\N	\N	\N	\N	\N
7642	2481	5	\N	\N	\N	\N	\N	\N
7643	2482	5	\N	\N	\N	\N	\N	\N
7644	2483	5	\N	\N	\N	\N	\N	\N
7645	2484	5	\N	\N	\N	\N	\N	\N
7646	2485	5	\N	\N	\N	\N	\N	\N
7647	2486	5	\N	\N	\N	\N	\N	\N
7648	2487	5	\N	\N	\N	\N	\N	\N
7649	2488	5	\N	\N	\N	\N	\N	\N
7650	2489	5	\N	\N	\N	\N	\N	\N
7651	2490	5	\N	\N	\N	\N	\N	\N
7652	2491	5	\N	\N	\N	\N	\N	\N
7653	2492	5	\N	\N	\N	\N	\N	\N
7654	2493	5	\N	\N	\N	\N	\N	\N
7655	2495	5	\N	\N	\N	\N	\N	\N
7656	2496	5	\N	\N	\N	\N	\N	\N
7657	2497	5	\N	\N	\N	\N	\N	\N
7658	2498	5	\N	\N	\N	\N	\N	\N
7659	2499	5	\N	\N	\N	\N	\N	\N
7660	2500	5	\N	\N	\N	\N	\N	\N
7661	2501	5	\N	\N	\N	\N	\N	\N
7662	2502	5	\N	\N	\N	\N	\N	\N
7663	2503	5	\N	\N	\N	\N	\N	\N
7664	2504	5	\N	\N	\N	\N	\N	\N
7665	2505	5	\N	\N	\N	\N	\N	\N
7666	2506	5	\N	\N	\N	\N	\N	\N
7667	2507	5	\N	\N	\N	\N	\N	\N
7668	2508	5	\N	\N	\N	\N	\N	\N
7669	2509	5	\N	\N	\N	\N	\N	\N
7670	2510	5	\N	\N	\N	\N	\N	\N
7671	2511	5	\N	\N	\N	\N	\N	\N
7672	2512	5	\N	\N	\N	\N	\N	\N
7673	2513	5	\N	\N	\N	\N	\N	\N
7674	2514	5	\N	\N	\N	\N	\N	\N
7675	2515	5	\N	\N	\N	\N	\N	\N
7676	2516	5	\N	\N	\N	\N	\N	\N
7677	2517	5	\N	\N	\N	\N	\N	\N
7678	2518	5	\N	\N	\N	\N	\N	\N
7679	2519	5	\N	\N	\N	\N	\N	\N
7680	2520	5	\N	\N	\N	\N	\N	\N
7681	2521	5	\N	\N	\N	\N	\N	\N
7682	2522	5	\N	\N	\N	\N	\N	\N
7683	2523	5	\N	\N	\N	\N	\N	\N
7684	2524	5	\N	\N	\N	\N	\N	\N
7685	2525	5	\N	\N	\N	\N	\N	\N
7686	2526	5	\N	\N	\N	\N	\N	\N
7687	2527	5	\N	\N	\N	\N	\N	\N
7688	2528	5	\N	\N	\N	\N	\N	\N
7689	2529	5	\N	\N	\N	\N	\N	\N
7690	2530	5	\N	\N	\N	\N	\N	\N
7691	2531	5	\N	\N	\N	\N	\N	\N
7692	2532	5	\N	\N	\N	\N	\N	\N
7693	2533	5	\N	\N	\N	\N	\N	\N
7694	2534	5	\N	\N	\N	\N	\N	\N
7695	2535	5	\N	\N	\N	\N	\N	\N
7696	2536	5	\N	\N	\N	\N	\N	\N
7697	2537	5	\N	\N	\N	\N	\N	\N
7698	2538	5	\N	\N	\N	\N	\N	\N
7699	2539	5	\N	\N	\N	\N	\N	\N
7700	2540	5	\N	\N	\N	\N	\N	\N
7701	2541	5	\N	\N	\N	\N	\N	\N
7702	2542	5	\N	\N	\N	\N	\N	\N
7703	2543	5	\N	\N	\N	\N	\N	\N
7704	2544	5	\N	\N	\N	\N	\N	\N
7705	2545	5	\N	\N	\N	\N	\N	\N
7706	2546	5	\N	\N	\N	\N	\N	\N
7707	2547	5	\N	\N	\N	\N	\N	\N
7708	2548	5	\N	\N	\N	\N	\N	\N
7709	2549	5	\N	\N	\N	\N	\N	\N
7710	2550	5	\N	\N	\N	\N	\N	\N
7711	2551	5	\N	\N	\N	\N	\N	\N
7712	2552	5	\N	\N	\N	\N	\N	\N
7713	2553	5	\N	\N	\N	\N	\N	\N
7714	2554	5	\N	\N	\N	\N	\N	\N
7715	2555	5	\N	\N	\N	\N	\N	\N
7716	2556	5	\N	\N	\N	\N	\N	\N
7717	2557	5	\N	\N	\N	\N	\N	\N
7718	2558	5	\N	\N	\N	\N	\N	\N
7719	2559	5	\N	\N	\N	\N	\N	\N
7720	2560	5	\N	\N	\N	\N	\N	\N
7721	2561	5	\N	\N	\N	\N	\N	\N
7722	2562	5	\N	\N	\N	\N	\N	\N
7723	2563	5	\N	\N	\N	\N	\N	\N
7724	2564	5	\N	\N	\N	\N	\N	\N
7725	2565	5	\N	\N	\N	\N	\N	\N
7726	2566	5	\N	\N	\N	\N	\N	\N
7727	2567	5	\N	\N	\N	\N	\N	\N
7728	2568	5	\N	\N	\N	\N	\N	\N
7729	2569	5	\N	\N	\N	\N	\N	\N
7730	2570	5	\N	\N	\N	\N	\N	\N
7731	2571	5	\N	\N	\N	\N	\N	\N
7732	2572	5	\N	\N	\N	\N	\N	\N
7733	2573	5	\N	\N	\N	\N	\N	\N
7734	2575	5	\N	\N	\N	\N	\N	\N
7735	2576	5	\N	\N	\N	\N	\N	\N
7736	2577	5	\N	\N	\N	\N	\N	\N
7737	2578	5	\N	\N	\N	\N	\N	\N
7738	2579	5	\N	\N	\N	\N	\N	\N
7739	2580	5	\N	\N	\N	\N	\N	\N
7740	2581	5	\N	\N	\N	\N	\N	\N
7741	2582	5	\N	\N	\N	\N	\N	\N
7742	2583	5	\N	\N	\N	\N	\N	\N
7743	2584	5	\N	\N	\N	\N	\N	\N
7744	2585	5	\N	\N	\N	\N	\N	\N
7745	2586	5	\N	\N	\N	\N	\N	\N
7746	2587	5	\N	\N	\N	\N	\N	\N
7747	2588	5	\N	\N	\N	\N	\N	\N
7748	2589	5	\N	\N	\N	\N	\N	\N
7749	2590	5	\N	\N	\N	\N	\N	\N
7750	2591	5	\N	\N	\N	\N	\N	\N
7751	2592	5	\N	\N	\N	\N	\N	\N
7752	2593	5	\N	\N	\N	\N	\N	\N
7753	2594	5	\N	\N	\N	\N	\N	\N
7754	2595	5	\N	\N	\N	\N	\N	\N
7755	2596	5	\N	\N	\N	\N	\N	\N
7756	2597	5	\N	\N	\N	\N	\N	\N
7757	2598	5	\N	\N	\N	\N	\N	\N
7758	2599	5	\N	\N	\N	\N	\N	\N
7759	2600	5	\N	\N	\N	\N	\N	\N
7760	2601	5	\N	\N	\N	\N	\N	\N
7761	2602	5	\N	\N	\N	\N	\N	\N
7762	2603	5	\N	\N	\N	\N	\N	\N
7763	2604	5	\N	\N	\N	\N	\N	\N
7764	2605	5	\N	\N	\N	\N	\N	\N
7765	2606	5	\N	\N	\N	\N	\N	\N
7766	2607	5	\N	\N	\N	\N	\N	\N
7767	2608	5	\N	\N	\N	\N	\N	\N
7768	2609	5	\N	\N	\N	\N	\N	\N
7769	2610	5	\N	\N	\N	\N	\N	\N
7770	2611	5	\N	\N	\N	\N	\N	\N
7771	2612	5	\N	\N	\N	\N	\N	\N
7772	2614	5	\N	\N	\N	\N	\N	\N
7773	2615	5	\N	\N	\N	\N	\N	\N
7774	2616	5	\N	\N	\N	\N	\N	\N
7775	2617	5	\N	\N	\N	\N	\N	\N
7776	2618	5	\N	\N	\N	\N	\N	\N
7777	2619	5	\N	\N	\N	\N	\N	\N
7778	2620	5	\N	\N	\N	\N	\N	\N
7779	2621	5	\N	\N	\N	\N	\N	\N
7780	2624	5	\N	\N	\N	\N	\N	\N
7781	2625	5	\N	\N	\N	\N	\N	\N
7782	2626	5	\N	\N	\N	\N	\N	\N
7783	2627	5	\N	\N	\N	\N	\N	\N
7784	2628	5	\N	\N	\N	\N	\N	\N
7785	2629	5	\N	\N	\N	\N	\N	\N
7786	2630	5	\N	\N	\N	\N	\N	\N
7787	2631	5	\N	\N	\N	\N	\N	\N
7788	2632	5	\N	\N	\N	\N	\N	\N
7789	2633	5	\N	\N	\N	\N	\N	\N
7790	2634	5	\N	\N	\N	\N	\N	\N
7791	2635	5	\N	\N	\N	\N	\N	\N
7792	2636	5	\N	\N	\N	\N	\N	\N
7793	2637	5	\N	\N	\N	\N	\N	\N
7794	2638	5	\N	\N	\N	\N	\N	\N
7795	2639	5	\N	\N	\N	\N	\N	\N
7796	2640	5	\N	\N	\N	\N	\N	\N
7797	2641	5	\N	\N	\N	\N	\N	\N
7798	2642	5	\N	\N	\N	\N	\N	\N
7799	2643	5	\N	\N	\N	\N	\N	\N
7800	2644	5	\N	\N	\N	\N	\N	\N
7801	2645	5	\N	\N	\N	\N	\N	\N
7802	2646	5	\N	\N	\N	\N	\N	\N
7803	2647	5	\N	\N	\N	\N	\N	\N
7804	2648	5	\N	\N	\N	\N	\N	\N
7805	2649	5	\N	\N	\N	\N	\N	\N
7806	2650	5	\N	\N	\N	\N	\N	\N
7807	2651	5	\N	\N	\N	\N	\N	\N
7808	2652	5	\N	\N	\N	\N	\N	\N
7809	2653	5	\N	\N	\N	\N	\N	\N
7810	2654	5	\N	\N	\N	\N	\N	\N
7811	2655	5	\N	\N	\N	\N	\N	\N
7812	2656	5	\N	\N	\N	\N	\N	\N
7813	2657	5	\N	\N	\N	\N	\N	\N
7814	2658	5	\N	\N	\N	\N	\N	\N
7815	2659	5	\N	\N	\N	\N	\N	\N
7816	2660	5	\N	\N	\N	\N	\N	\N
7817	2661	5	\N	\N	\N	\N	\N	\N
7818	2662	5	\N	\N	\N	\N	\N	\N
7819	2663	5	\N	\N	\N	\N	\N	\N
7820	2664	5	\N	\N	\N	\N	\N	\N
7821	2665	5	\N	\N	\N	\N	\N	\N
7822	2666	5	\N	\N	\N	\N	\N	\N
7823	2667	5	\N	\N	\N	\N	\N	\N
7824	2668	5	\N	\N	\N	\N	\N	\N
7825	2669	5	\N	\N	\N	\N	\N	\N
7826	2670	5	\N	\N	\N	\N	\N	\N
7827	2671	5	\N	\N	\N	\N	\N	\N
7828	2672	5	\N	\N	\N	\N	\N	\N
7829	2673	5	\N	\N	\N	\N	\N	\N
7830	2674	5	\N	\N	\N	\N	\N	\N
7831	2675	5	\N	\N	\N	\N	\N	\N
7832	2676	5	\N	\N	\N	\N	\N	\N
7833	2677	5	\N	\N	\N	\N	\N	\N
7834	2678	5	\N	\N	\N	\N	\N	\N
7835	2679	5	\N	\N	\N	\N	\N	\N
7836	2680	5	\N	\N	\N	\N	\N	\N
7837	2681	5	\N	\N	\N	\N	\N	\N
7838	2682	5	\N	\N	\N	\N	\N	\N
7839	2683	5	\N	\N	\N	\N	\N	\N
7840	2684	5	\N	\N	\N	\N	\N	\N
7841	2685	5	\N	\N	\N	\N	\N	\N
7842	2686	5	\N	\N	\N	\N	\N	\N
7843	2687	5	\N	\N	\N	\N	\N	\N
7844	2688	5	\N	\N	\N	\N	\N	\N
7845	2689	5	\N	\N	\N	\N	\N	\N
7846	2690	5	\N	\N	\N	\N	\N	\N
7847	2691	5	\N	\N	\N	\N	\N	\N
7848	2692	5	\N	\N	\N	\N	\N	\N
7849	2693	5	\N	\N	\N	\N	\N	\N
7850	2694	5	\N	\N	\N	\N	\N	\N
7851	2695	5	\N	\N	\N	\N	\N	\N
7852	2696	5	\N	\N	\N	\N	\N	\N
7853	2698	5	\N	\N	\N	\N	\N	\N
7854	2699	5	\N	\N	\N	\N	\N	\N
7855	2701	5	\N	\N	\N	\N	\N	\N
7856	2702	5	\N	\N	\N	\N	\N	\N
7857	2703	5	\N	\N	\N	\N	\N	\N
7858	2704	5	\N	\N	\N	\N	\N	\N
7859	2705	5	\N	\N	\N	\N	\N	\N
7860	2706	5	\N	\N	\N	\N	\N	\N
7861	2707	5	\N	\N	\N	\N	\N	\N
7862	2708	5	\N	\N	\N	\N	\N	\N
7863	2709	5	\N	\N	\N	\N	\N	\N
7864	2710	5	\N	\N	\N	\N	\N	\N
7865	2711	5	\N	\N	\N	\N	\N	\N
7866	2712	5	\N	\N	\N	\N	\N	\N
7867	2713	5	\N	\N	\N	\N	\N	\N
7868	2714	5	\N	\N	\N	\N	\N	\N
7869	2715	5	\N	\N	\N	\N	\N	\N
7870	2717	5	\N	\N	\N	\N	\N	\N
7871	2718	5	\N	\N	\N	\N	\N	\N
7872	2719	5	\N	\N	\N	\N	\N	\N
7873	2720	5	\N	\N	\N	\N	\N	\N
7874	2721	5	\N	\N	\N	\N	\N	\N
7875	2722	5	\N	\N	\N	\N	\N	\N
7876	2723	5	\N	\N	\N	\N	\N	\N
7877	2724	5	\N	\N	\N	\N	\N	\N
7878	2725	5	\N	\N	\N	\N	\N	\N
7879	2726	5	\N	\N	\N	\N	\N	\N
7880	2727	5	\N	\N	\N	\N	\N	\N
7881	2729	5	\N	\N	\N	\N	\N	\N
7882	2730	5	\N	\N	\N	\N	\N	\N
7883	2731	5	\N	\N	\N	\N	\N	\N
7884	2732	5	\N	\N	\N	\N	\N	\N
7885	2733	5	\N	\N	\N	\N	\N	\N
7886	2734	5	\N	\N	\N	\N	\N	\N
7887	2735	5	\N	\N	\N	\N	\N	\N
7888	2736	5	\N	\N	\N	\N	\N	\N
7889	2737	5	\N	\N	\N	\N	\N	\N
7890	2738	5	\N	\N	\N	\N	\N	\N
7891	2739	5	\N	\N	\N	\N	\N	\N
7892	2740	5	\N	\N	\N	\N	\N	\N
7893	2741	5	\N	\N	\N	\N	\N	\N
7894	2742	5	\N	\N	\N	\N	\N	\N
7895	2743	5	\N	\N	\N	\N	\N	\N
7896	2744	5	\N	\N	\N	\N	\N	\N
7897	2746	5	\N	\N	\N	\N	\N	\N
7898	2747	5	\N	\N	\N	\N	\N	\N
7899	2748	5	\N	\N	\N	\N	\N	\N
7900	2749	5	\N	\N	\N	\N	\N	\N
7901	2750	5	\N	\N	\N	\N	\N	\N
7902	2751	5	\N	\N	\N	\N	\N	\N
7903	2752	5	\N	\N	\N	\N	\N	\N
7904	2753	5	\N	\N	\N	\N	\N	\N
7905	2754	5	\N	\N	\N	\N	\N	\N
7906	2755	5	\N	\N	\N	\N	\N	\N
7907	2756	5	\N	\N	\N	\N	\N	\N
7908	2757	5	\N	\N	\N	\N	\N	\N
7909	2758	5	\N	\N	\N	\N	\N	\N
7910	2759	5	\N	\N	\N	\N	\N	\N
7911	2760	5	\N	\N	\N	\N	\N	\N
7912	2761	5	\N	\N	\N	\N	\N	\N
7913	2762	5	\N	\N	\N	\N	\N	\N
7914	2763	5	\N	\N	\N	\N	\N	\N
7915	2764	5	\N	\N	\N	\N	\N	\N
7916	2765	5	\N	\N	\N	\N	\N	\N
7917	2766	5	\N	\N	\N	\N	\N	\N
7918	2767	5	\N	\N	\N	\N	\N	\N
7919	2768	5	\N	\N	\N	\N	\N	\N
7920	2769	5	\N	\N	\N	\N	\N	\N
7921	2770	5	\N	\N	\N	\N	\N	\N
7922	2771	5	\N	\N	\N	\N	\N	\N
7923	2772	5	\N	\N	\N	\N	\N	\N
7924	2773	5	\N	\N	\N	\N	\N	\N
7925	2774	5	\N	\N	\N	\N	\N	\N
7926	2775	5	\N	\N	\N	\N	\N	\N
7927	2776	5	\N	\N	\N	\N	\N	\N
7928	2777	5	\N	\N	\N	\N	\N	\N
7929	2778	5	\N	\N	\N	\N	\N	\N
7930	2779	5	\N	\N	\N	\N	\N	\N
7931	2780	5	\N	\N	\N	\N	\N	\N
7932	2825	5	\N	\N	\N	\N	\N	\N
7933	2826	5	\N	\N	\N	\N	\N	\N
7934	2827	5	\N	\N	\N	\N	\N	\N
7935	2828	5	\N	\N	\N	\N	\N	\N
7936	2829	5	\N	\N	\N	\N	\N	\N
7937	2830	5	\N	\N	\N	\N	\N	\N
7938	2831	5	\N	\N	\N	\N	\N	\N
7939	2833	5	\N	\N	\N	\N	\N	\N
7940	2834	5	\N	\N	\N	\N	\N	\N
7941	2835	5	\N	\N	\N	\N	\N	\N
7942	2836	5	\N	\N	\N	\N	\N	\N
7943	2837	5	\N	\N	\N	\N	\N	\N
7944	2838	5	\N	\N	\N	\N	\N	\N
7945	2839	5	\N	\N	\N	\N	\N	\N
7946	2840	5	\N	\N	\N	\N	\N	\N
7947	2841	5	\N	\N	\N	\N	\N	\N
7948	2842	5	\N	\N	\N	\N	\N	\N
7949	2843	5	\N	\N	\N	\N	\N	\N
7950	2844	5	\N	\N	\N	\N	\N	\N
7951	2845	5	\N	\N	\N	\N	\N	\N
7952	2846	5	\N	\N	\N	\N	\N	\N
7953	2847	5	\N	\N	\N	\N	\N	\N
7954	2848	5	\N	\N	\N	\N	\N	\N
7955	2849	5	\N	\N	\N	\N	\N	\N
7956	2850	5	\N	\N	\N	\N	\N	\N
7957	2852	5	\N	\N	\N	\N	\N	\N
7958	2853	5	\N	\N	\N	\N	\N	\N
7959	2854	5	\N	\N	\N	\N	\N	\N
7960	2855	5	\N	\N	\N	\N	\N	\N
7961	2856	5	\N	\N	\N	\N	\N	\N
7962	2857	5	\N	\N	\N	\N	\N	\N
7963	2858	5	\N	\N	\N	\N	\N	\N
7964	2859	5	\N	\N	\N	\N	\N	\N
7965	2861	5	\N	\N	\N	\N	\N	\N
7966	2862	5	\N	\N	\N	\N	\N	\N
7967	2866	5	\N	\N	\N	\N	\N	\N
7968	2867	5	\N	\N	\N	\N	\N	\N
7969	2868	5	\N	\N	\N	\N	\N	\N
7970	2869	5	\N	\N	\N	\N	\N	\N
7971	2870	5	\N	\N	\N	\N	\N	\N
7972	2872	5	\N	\N	\N	\N	\N	\N
7973	2873	5	\N	\N	\N	\N	\N	\N
7974	2874	5	\N	\N	\N	\N	\N	\N
7975	2875	5	\N	\N	\N	\N	\N	\N
7976	2876	5	\N	\N	\N	\N	\N	\N
7977	2877	5	\N	\N	\N	\N	\N	\N
7978	2878	5	\N	\N	\N	\N	\N	\N
7979	2879	5	\N	\N	\N	\N	\N	\N
7980	2880	5	\N	\N	\N	\N	\N	\N
7981	1	6	\N	\N	\N	\N	\N	\N
7982	2	6	\N	\N	\N	\N	\N	\N
7983	3	6	\N	\N	\N	\N	\N	\N
7984	4	6	\N	\N	\N	\N	\N	\N
7985	5	6	\N	\N	\N	\N	\N	\N
7986	6	6	\N	\N	\N	\N	\N	\N
7987	8	6	\N	\N	\N	\N	\N	\N
7988	9	6	\N	\N	\N	\N	\N	\N
7989	10	6	\N	\N	\N	\N	\N	\N
7990	13	6	\N	\N	\N	\N	\N	\N
7991	14	6	\N	\N	\N	\N	\N	\N
7992	16	6	\N	\N	\N	\N	\N	\N
7993	18	6	\N	\N	\N	\N	\N	\N
7994	25	6	\N	\N	\N	\N	\N	\N
7995	31	6	\N	\N	\N	\N	\N	\N
7996	32	6	\N	\N	\N	\N	\N	\N
7997	34	6	\N	\N	\N	\N	\N	\N
7998	35	6	\N	\N	\N	\N	\N	\N
7999	37	6	\N	\N	\N	\N	\N	\N
8000	41	6	\N	\N	\N	\N	\N	\N
8001	42	6	\N	\N	\N	\N	\N	\N
8002	43	6	\N	\N	\N	\N	\N	\N
8003	45	6	\N	\N	\N	\N	\N	\N
8004	49	6	\N	\N	\N	\N	\N	\N
8005	50	6	\N	\N	\N	\N	\N	\N
8006	51	6	\N	\N	\N	\N	\N	\N
8007	52	6	\N	\N	\N	\N	\N	\N
8008	53	6	\N	\N	\N	\N	\N	\N
8009	56	6	\N	\N	\N	\N	\N	\N
8010	57	6	\N	\N	\N	\N	\N	\N
8011	58	6	\N	\N	\N	\N	\N	\N
8012	61	6	\N	\N	\N	\N	\N	\N
8013	63	6	\N	\N	\N	\N	\N	\N
8014	64	6	\N	\N	\N	\N	\N	\N
8015	66	6	\N	\N	\N	\N	\N	\N
8016	67	6	\N	\N	\N	\N	\N	\N
8017	68	6	\N	\N	\N	\N	\N	\N
8018	69	6	\N	\N	\N	\N	\N	\N
8019	70	6	\N	\N	\N	\N	\N	\N
8020	71	6	\N	\N	\N	\N	\N	\N
8021	72	6	\N	\N	\N	\N	\N	\N
8022	74	6	\N	\N	\N	\N	\N	\N
8023	75	6	\N	\N	\N	\N	\N	\N
8024	76	6	\N	\N	\N	\N	\N	\N
8025	77	6	\N	\N	\N	\N	\N	\N
8026	78	6	\N	\N	\N	\N	\N	\N
8027	79	6	\N	\N	\N	\N	\N	\N
8028	80	6	\N	\N	\N	\N	\N	\N
8029	83	6	\N	\N	\N	\N	\N	\N
8030	84	6	\N	\N	\N	\N	\N	\N
8031	87	6	\N	\N	\N	\N	\N	\N
8032	88	6	\N	\N	\N	\N	\N	\N
8033	89	6	\N	\N	\N	\N	\N	\N
8034	90	6	\N	\N	\N	\N	\N	\N
8035	93	6	\N	\N	\N	\N	\N	\N
8036	99	6	\N	\N	\N	\N	\N	\N
8037	101	6	\N	\N	\N	\N	\N	\N
8038	103	6	\N	\N	\N	\N	\N	\N
8039	109	6	\N	\N	\N	\N	\N	\N
8040	113	6	\N	\N	\N	\N	\N	\N
8041	114	6	\N	\N	\N	\N	\N	\N
8042	117	6	\N	\N	\N	\N	\N	\N
8043	118	6	\N	\N	\N	\N	\N	\N
8044	120	6	\N	\N	\N	\N	\N	\N
8045	121	6	\N	\N	\N	\N	\N	\N
8046	122	6	\N	\N	\N	\N	\N	\N
8047	125	6	\N	\N	\N	\N	\N	\N
8048	128	6	\N	\N	\N	\N	\N	\N
8049	129	6	\N	\N	\N	\N	\N	\N
8050	130	6	\N	\N	\N	\N	\N	\N
8051	131	6	\N	\N	\N	\N	\N	\N
8052	132	6	\N	\N	\N	\N	\N	\N
8053	134	6	\N	\N	\N	\N	\N	\N
8054	135	6	\N	\N	\N	\N	\N	\N
8055	138	6	\N	\N	\N	\N	\N	\N
8056	141	6	\N	\N	\N	\N	\N	\N
8057	142	6	\N	\N	\N	\N	\N	\N
8058	145	6	\N	\N	\N	\N	\N	\N
8059	148	6	\N	\N	\N	\N	\N	\N
8060	150	6	\N	\N	\N	\N	\N	\N
8061	151	6	\N	\N	\N	\N	\N	\N
8062	154	6	\N	\N	\N	\N	\N	\N
8063	159	6	\N	\N	\N	\N	\N	\N
8064	160	6	\N	\N	\N	\N	\N	\N
8065	161	6	\N	\N	\N	\N	\N	\N
8066	164	6	\N	\N	\N	\N	\N	\N
8067	168	6	\N	\N	\N	\N	\N	\N
8068	170	6	\N	\N	\N	\N	\N	\N
8069	174	6	\N	\N	\N	\N	\N	\N
8070	175	6	\N	\N	\N	\N	\N	\N
8071	181	6	\N	\N	\N	\N	\N	\N
8072	182	6	\N	\N	\N	\N	\N	\N
8073	199	6	\N	\N	\N	\N	\N	\N
8074	201	6	\N	\N	\N	\N	\N	\N
8075	205	6	\N	\N	\N	\N	\N	\N
8076	206	6	\N	\N	\N	\N	\N	\N
8077	212	6	\N	\N	\N	\N	\N	\N
8078	213	6	\N	\N	\N	\N	\N	\N
8079	215	6	\N	\N	\N	\N	\N	\N
8080	217	6	\N	\N	\N	\N	\N	\N
8081	218	6	\N	\N	\N	\N	\N	\N
8082	221	6	\N	\N	\N	\N	\N	\N
8083	224	6	\N	\N	\N	\N	\N	\N
8084	233	6	\N	\N	\N	\N	\N	\N
8085	234	6	\N	\N	\N	\N	\N	\N
8086	254	6	\N	\N	\N	\N	\N	\N
8087	257	6	\N	\N	\N	\N	\N	\N
8088	258	6	\N	\N	\N	\N	\N	\N
8089	260	6	\N	\N	\N	\N	\N	\N
8090	263	6	\N	\N	\N	\N	\N	\N
8091	268	6	\N	\N	\N	\N	\N	\N
8092	269	6	\N	\N	\N	\N	\N	\N
8093	275	6	\N	\N	\N	\N	\N	\N
8094	276	6	\N	\N	\N	\N	\N	\N
8095	278	6	\N	\N	\N	\N	\N	\N
8096	279	6	\N	\N	\N	\N	\N	\N
8097	287	6	\N	\N	\N	\N	\N	\N
8098	290	6	\N	\N	\N	\N	\N	\N
8099	291	6	\N	\N	\N	\N	\N	\N
8100	293	6	\N	\N	\N	\N	\N	\N
8101	295	6	\N	\N	\N	\N	\N	\N
8102	298	6	\N	\N	\N	\N	\N	\N
8103	304	6	\N	\N	\N	\N	\N	\N
8104	312	6	\N	\N	\N	\N	\N	\N
8105	313	6	\N	\N	\N	\N	\N	\N
8106	316	6	\N	\N	\N	\N	\N	\N
8107	317	6	\N	\N	\N	\N	\N	\N
8108	322	6	\N	\N	\N	\N	\N	\N
8109	323	6	\N	\N	\N	\N	\N	\N
8110	325	6	\N	\N	\N	\N	\N	\N
8111	328	6	\N	\N	\N	\N	\N	\N
8112	331	6	\N	\N	\N	\N	\N	\N
8113	333	6	\N	\N	\N	\N	\N	\N
8114	334	6	\N	\N	\N	\N	\N	\N
8115	337	6	\N	\N	\N	\N	\N	\N
8116	338	6	\N	\N	\N	\N	\N	\N
8117	341	6	\N	\N	\N	\N	\N	\N
8118	350	6	\N	\N	\N	\N	\N	\N
8119	353	6	\N	\N	\N	\N	\N	\N
8120	356	6	\N	\N	\N	\N	\N	\N
8121	360	6	\N	\N	\N	\N	\N	\N
8122	362	6	\N	\N	\N	\N	\N	\N
8123	366	6	\N	\N	\N	\N	\N	\N
8124	367	6	\N	\N	\N	\N	\N	\N
8125	370	6	\N	\N	\N	\N	\N	\N
8126	372	6	\N	\N	\N	\N	\N	\N
8127	374	6	\N	\N	\N	\N	\N	\N
8128	377	6	\N	\N	\N	\N	\N	\N
8129	382	6	\N	\N	\N	\N	\N	\N
8130	385	6	\N	\N	\N	\N	\N	\N
8131	386	6	\N	\N	\N	\N	\N	\N
8132	389	6	\N	\N	\N	\N	\N	\N
8133	400	6	\N	\N	\N	\N	\N	\N
8134	405	6	\N	\N	\N	\N	\N	\N
8135	406	6	\N	\N	\N	\N	\N	\N
8136	411	6	\N	\N	\N	\N	\N	\N
8137	415	6	\N	\N	\N	\N	\N	\N
8138	416	6	\N	\N	\N	\N	\N	\N
8139	426	6	\N	\N	\N	\N	\N	\N
8140	448	6	\N	\N	\N	\N	\N	\N
8141	450	6	\N	\N	\N	\N	\N	\N
8142	460	6	\N	\N	\N	\N	\N	\N
8143	461	6	\N	\N	\N	\N	\N	\N
8144	463	6	\N	\N	\N	\N	\N	\N
8145	467	6	\N	\N	\N	\N	\N	\N
8146	468	6	\N	\N	\N	\N	\N	\N
8147	470	6	\N	\N	\N	\N	\N	\N
8148	477	6	\N	\N	\N	\N	\N	\N
8149	495	6	\N	\N	\N	\N	\N	\N
8150	501	6	\N	\N	\N	\N	\N	\N
8151	502	6	\N	\N	\N	\N	\N	\N
8152	506	6	\N	\N	\N	\N	\N	\N
8153	512	6	\N	\N	\N	\N	\N	\N
8154	513	6	\N	\N	\N	\N	\N	\N
8155	520	6	\N	\N	\N	\N	\N	\N
8156	525	6	\N	\N	\N	\N	\N	\N
8157	536	6	\N	\N	\N	\N	\N	\N
8158	541	6	\N	\N	\N	\N	\N	\N
8159	543	6	\N	\N	\N	\N	\N	\N
8160	545	6	\N	\N	\N	\N	\N	\N
8161	549	6	\N	\N	\N	\N	\N	\N
8162	551	6	\N	\N	\N	\N	\N	\N
8163	558	6	\N	\N	\N	\N	\N	\N
8164	572	6	\N	\N	\N	\N	\N	\N
8165	573	6	\N	\N	\N	\N	\N	\N
8166	576	6	\N	\N	\N	\N	\N	\N
8167	584	6	\N	\N	\N	\N	\N	\N
8168	588	6	\N	\N	\N	\N	\N	\N
8169	594	6	\N	\N	\N	\N	\N	\N
8170	597	6	\N	\N	\N	\N	\N	\N
8171	601	6	\N	\N	\N	\N	\N	\N
8172	606	6	\N	\N	\N	\N	\N	\N
8173	623	6	\N	\N	\N	\N	\N	\N
8174	624	6	\N	\N	\N	\N	\N	\N
8175	625	6	\N	\N	\N	\N	\N	\N
8176	626	6	\N	\N	\N	\N	\N	\N
8177	627	6	\N	\N	\N	\N	\N	\N
8178	629	6	\N	\N	\N	\N	\N	\N
8179	633	6	\N	\N	\N	\N	\N	\N
8180	638	6	\N	\N	\N	\N	\N	\N
8181	643	6	\N	\N	\N	\N	\N	\N
8182	644	6	\N	\N	\N	\N	\N	\N
8183	654	6	\N	\N	\N	\N	\N	\N
8184	656	6	\N	\N	\N	\N	\N	\N
8185	659	6	\N	\N	\N	\N	\N	\N
8186	660	6	\N	\N	\N	\N	\N	\N
8187	666	6	\N	\N	\N	\N	\N	\N
8188	680	6	\N	\N	\N	\N	\N	\N
8189	693	6	\N	\N	\N	\N	\N	\N
8190	699	6	\N	\N	\N	\N	\N	\N
8191	702	6	\N	\N	\N	\N	\N	\N
8192	703	6	\N	\N	\N	\N	\N	\N
8193	706	6	\N	\N	\N	\N	\N	\N
8194	707	6	\N	\N	\N	\N	\N	\N
8195	708	6	\N	\N	\N	\N	\N	\N
8196	719	6	\N	\N	\N	\N	\N	\N
8197	720	6	\N	\N	\N	\N	\N	\N
8198	723	6	\N	\N	\N	\N	\N	\N
8199	730	6	\N	\N	\N	\N	\N	\N
8200	733	6	\N	\N	\N	\N	\N	\N
8201	734	6	\N	\N	\N	\N	\N	\N
8202	747	6	\N	\N	\N	\N	\N	\N
8203	760	6	\N	\N	\N	\N	\N	\N
8204	764	6	\N	\N	\N	\N	\N	\N
8205	766	6	\N	\N	\N	\N	\N	\N
8206	778	6	\N	\N	\N	\N	\N	\N
8207	781	6	\N	\N	\N	\N	\N	\N
8208	785	6	\N	\N	\N	\N	\N	\N
8209	788	6	\N	\N	\N	\N	\N	\N
8210	789	6	\N	\N	\N	\N	\N	\N
8211	795	6	\N	\N	\N	\N	\N	\N
8212	796	6	\N	\N	\N	\N	\N	\N
8213	797	6	\N	\N	\N	\N	\N	\N
8214	799	6	\N	\N	\N	\N	\N	\N
8215	812	6	\N	\N	\N	\N	\N	\N
8216	813	6	\N	\N	\N	\N	\N	\N
8217	814	6	\N	\N	\N	\N	\N	\N
8218	815	6	\N	\N	\N	\N	\N	\N
8219	818	6	\N	\N	\N	\N	\N	\N
8220	819	6	\N	\N	\N	\N	\N	\N
8221	823	6	\N	\N	\N	\N	\N	\N
8222	825	6	\N	\N	\N	\N	\N	\N
8223	831	6	\N	\N	\N	\N	\N	\N
8224	833	6	\N	\N	\N	\N	\N	\N
8225	836	6	\N	\N	\N	\N	\N	\N
8226	837	6	\N	\N	\N	\N	\N	\N
8227	841	6	\N	\N	\N	\N	\N	\N
8228	853	6	\N	\N	\N	\N	\N	\N
8229	857	6	\N	\N	\N	\N	\N	\N
8230	859	6	\N	\N	\N	\N	\N	\N
8231	869	6	\N	\N	\N	\N	\N	\N
8232	870	6	\N	\N	\N	\N	\N	\N
8233	873	6	\N	\N	\N	\N	\N	\N
8234	890	6	\N	\N	\N	\N	\N	\N
8235	892	6	\N	\N	\N	\N	\N	\N
8236	894	6	\N	\N	\N	\N	\N	\N
8237	895	6	\N	\N	\N	\N	\N	\N
8238	898	6	\N	\N	\N	\N	\N	\N
8239	911	6	\N	\N	\N	\N	\N	\N
8240	912	6	\N	\N	\N	\N	\N	\N
8241	914	6	\N	\N	\N	\N	\N	\N
8242	916	6	\N	\N	\N	\N	\N	\N
8243	918	6	\N	\N	\N	\N	\N	\N
8244	920	6	\N	\N	\N	\N	\N	\N
8245	921	6	\N	\N	\N	\N	\N	\N
8246	924	6	\N	\N	\N	\N	\N	\N
8247	933	6	\N	\N	\N	\N	\N	\N
8248	934	6	\N	\N	\N	\N	\N	\N
8249	938	6	\N	\N	\N	\N	\N	\N
8250	939	6	\N	\N	\N	\N	\N	\N
8251	945	6	\N	\N	\N	\N	\N	\N
8252	948	6	\N	\N	\N	\N	\N	\N
8253	951	6	\N	\N	\N	\N	\N	\N
8254	954	6	\N	\N	\N	\N	\N	\N
8255	959	6	\N	\N	\N	\N	\N	\N
8256	960	6	\N	\N	\N	\N	\N	\N
8257	964	6	\N	\N	\N	\N	\N	\N
8258	965	6	\N	\N	\N	\N	\N	\N
8259	977	6	\N	\N	\N	\N	\N	\N
8260	978	6	\N	\N	\N	\N	\N	\N
8261	986	6	\N	\N	\N	\N	\N	\N
8262	988	6	\N	\N	\N	\N	\N	\N
8263	990	6	\N	\N	\N	\N	\N	\N
8264	993	6	\N	\N	\N	\N	\N	\N
8265	994	6	\N	\N	\N	\N	\N	\N
8266	998	6	\N	\N	\N	\N	\N	\N
8267	999	6	\N	\N	\N	\N	\N	\N
8268	1002	6	\N	\N	\N	\N	\N	\N
8269	1004	6	\N	\N	\N	\N	\N	\N
8270	1008	6	\N	\N	\N	\N	\N	\N
8271	1010	6	\N	\N	\N	\N	\N	\N
8272	1019	6	\N	\N	\N	\N	\N	\N
8273	1020	6	\N	\N	\N	\N	\N	\N
8274	1022	6	\N	\N	\N	\N	\N	\N
8275	1026	6	\N	\N	\N	\N	\N	\N
8276	1027	6	\N	\N	\N	\N	\N	\N
8277	1028	6	\N	\N	\N	\N	\N	\N
8278	1032	6	\N	\N	\N	\N	\N	\N
8279	1033	6	\N	\N	\N	\N	\N	\N
8280	1035	6	\N	\N	\N	\N	\N	\N
8281	1038	6	\N	\N	\N	\N	\N	\N
8282	1042	6	\N	\N	\N	\N	\N	\N
8283	1044	6	\N	\N	\N	\N	\N	\N
8284	1050	6	\N	\N	\N	\N	\N	\N
8285	1052	6	\N	\N	\N	\N	\N	\N
8286	1053	6	\N	\N	\N	\N	\N	\N
8287	1058	6	\N	\N	\N	\N	\N	\N
8288	1063	6	\N	\N	\N	\N	\N	\N
8289	1066	6	\N	\N	\N	\N	\N	\N
8290	1069	6	\N	\N	\N	\N	\N	\N
8291	1070	6	\N	\N	\N	\N	\N	\N
8292	1082	6	\N	\N	\N	\N	\N	\N
8293	1084	6	\N	\N	\N	\N	\N	\N
8294	1085	6	\N	\N	\N	\N	\N	\N
8295	1087	6	\N	\N	\N	\N	\N	\N
8296	1089	6	\N	\N	\N	\N	\N	\N
8297	1090	6	\N	\N	\N	\N	\N	\N
8298	1093	6	\N	\N	\N	\N	\N	\N
8299	1100	6	\N	\N	\N	\N	\N	\N
8300	1104	6	\N	\N	\N	\N	\N	\N
8301	1106	6	\N	\N	\N	\N	\N	\N
8302	1107	6	\N	\N	\N	\N	\N	\N
8303	1109	6	\N	\N	\N	\N	\N	\N
8304	1110	6	\N	\N	\N	\N	\N	\N
8305	1111	6	\N	\N	\N	\N	\N	\N
8306	1113	6	\N	\N	\N	\N	\N	\N
8307	1120	6	\N	\N	\N	\N	\N	\N
8308	1123	6	\N	\N	\N	\N	\N	\N
8309	1125	6	\N	\N	\N	\N	\N	\N
8310	1135	6	\N	\N	\N	\N	\N	\N
8311	1136	6	\N	\N	\N	\N	\N	\N
8312	1141	6	\N	\N	\N	\N	\N	\N
8313	1146	6	\N	\N	\N	\N	\N	\N
8314	1147	6	\N	\N	\N	\N	\N	\N
8315	1148	6	\N	\N	\N	\N	\N	\N
8316	1153	6	\N	\N	\N	\N	\N	\N
8317	1154	6	\N	\N	\N	\N	\N	\N
8318	1155	6	\N	\N	\N	\N	\N	\N
8319	1156	6	\N	\N	\N	\N	\N	\N
8320	1159	6	\N	\N	\N	\N	\N	\N
8321	1164	6	\N	\N	\N	\N	\N	\N
8322	1165	6	\N	\N	\N	\N	\N	\N
8323	1168	6	\N	\N	\N	\N	\N	\N
8324	1169	6	\N	\N	\N	\N	\N	\N
8325	1172	6	\N	\N	\N	\N	\N	\N
8326	1175	6	\N	\N	\N	\N	\N	\N
8327	1176	6	\N	\N	\N	\N	\N	\N
8328	1182	6	\N	\N	\N	\N	\N	\N
8329	1185	6	\N	\N	\N	\N	\N	\N
8330	1191	6	\N	\N	\N	\N	\N	\N
8331	1193	6	\N	\N	\N	\N	\N	\N
8332	1194	6	\N	\N	\N	\N	\N	\N
8333	1195	6	\N	\N	\N	\N	\N	\N
8334	1198	6	\N	\N	\N	\N	\N	\N
8335	1200	6	\N	\N	\N	\N	\N	\N
8336	1206	6	\N	\N	\N	\N	\N	\N
8337	1208	6	\N	\N	\N	\N	\N	\N
8338	1209	6	\N	\N	\N	\N	\N	\N
8339	1210	6	\N	\N	\N	\N	\N	\N
8340	1212	6	\N	\N	\N	\N	\N	\N
8341	1213	6	\N	\N	\N	\N	\N	\N
8342	1214	6	\N	\N	\N	\N	\N	\N
8343	1216	6	\N	\N	\N	\N	\N	\N
8344	1218	6	\N	\N	\N	\N	\N	\N
8345	1223	6	\N	\N	\N	\N	\N	\N
8346	1226	6	\N	\N	\N	\N	\N	\N
8347	1229	6	\N	\N	\N	\N	\N	\N
8348	1230	6	\N	\N	\N	\N	\N	\N
8349	1234	6	\N	\N	\N	\N	\N	\N
8350	1238	6	\N	\N	\N	\N	\N	\N
8351	1241	6	\N	\N	\N	\N	\N	\N
8352	1244	6	\N	\N	\N	\N	\N	\N
8353	1247	6	\N	\N	\N	\N	\N	\N
8354	1248	6	\N	\N	\N	\N	\N	\N
8355	1249	6	\N	\N	\N	\N	\N	\N
8356	1250	6	\N	\N	\N	\N	\N	\N
8357	1251	6	\N	\N	\N	\N	\N	\N
8358	1252	6	\N	\N	\N	\N	\N	\N
8359	1254	6	\N	\N	\N	\N	\N	\N
8360	1256	6	\N	\N	\N	\N	\N	\N
8361	1257	6	\N	\N	\N	\N	\N	\N
8362	1259	6	\N	\N	\N	\N	\N	\N
8363	1264	6	\N	\N	\N	\N	\N	\N
8364	1266	6	\N	\N	\N	\N	\N	\N
8365	1268	6	\N	\N	\N	\N	\N	\N
8366	1269	6	\N	\N	\N	\N	\N	\N
8367	1271	6	\N	\N	\N	\N	\N	\N
8368	1274	6	\N	\N	\N	\N	\N	\N
8369	1276	6	\N	\N	\N	\N	\N	\N
8370	1279	6	\N	\N	\N	\N	\N	\N
8371	1281	6	\N	\N	\N	\N	\N	\N
8372	1282	6	\N	\N	\N	\N	\N	\N
8373	1283	6	\N	\N	\N	\N	\N	\N
8374	1284	6	\N	\N	\N	\N	\N	\N
8375	1285	6	\N	\N	\N	\N	\N	\N
8376	1286	6	\N	\N	\N	\N	\N	\N
8377	1288	6	\N	\N	\N	\N	\N	\N
8378	1291	6	\N	\N	\N	\N	\N	\N
8379	1294	6	\N	\N	\N	\N	\N	\N
8380	1297	6	\N	\N	\N	\N	\N	\N
8381	1298	6	\N	\N	\N	\N	\N	\N
8382	1299	6	\N	\N	\N	\N	\N	\N
8383	1303	6	\N	\N	\N	\N	\N	\N
8384	1304	6	\N	\N	\N	\N	\N	\N
8385	1306	6	\N	\N	\N	\N	\N	\N
8386	1308	6	\N	\N	\N	\N	\N	\N
8387	1309	6	\N	\N	\N	\N	\N	\N
8388	1312	6	\N	\N	\N	\N	\N	\N
8389	1320	6	\N	\N	\N	\N	\N	\N
8390	1321	6	\N	\N	\N	\N	\N	\N
8391	1322	6	\N	\N	\N	\N	\N	\N
8392	1323	6	\N	\N	\N	\N	\N	\N
8393	1334	6	\N	\N	\N	\N	\N	\N
8394	1336	6	\N	\N	\N	\N	\N	\N
8395	1340	6	\N	\N	\N	\N	\N	\N
8396	1341	6	\N	\N	\N	\N	\N	\N
8397	1343	6	\N	\N	\N	\N	\N	\N
8398	1348	6	\N	\N	\N	\N	\N	\N
8399	1351	6	\N	\N	\N	\N	\N	\N
8400	1352	6	\N	\N	\N	\N	\N	\N
8401	1353	6	\N	\N	\N	\N	\N	\N
8402	1358	6	\N	\N	\N	\N	\N	\N
8403	1361	6	\N	\N	\N	\N	\N	\N
8404	1367	6	\N	\N	\N	\N	\N	\N
8405	1368	6	\N	\N	\N	\N	\N	\N
8406	1371	6	\N	\N	\N	\N	\N	\N
8407	1375	6	\N	\N	\N	\N	\N	\N
8408	1376	6	\N	\N	\N	\N	\N	\N
8409	1380	6	\N	\N	\N	\N	\N	\N
8410	1381	6	\N	\N	\N	\N	\N	\N
8411	1382	6	\N	\N	\N	\N	\N	\N
8412	1387	6	\N	\N	\N	\N	\N	\N
8413	1389	6	\N	\N	\N	\N	\N	\N
8414	1390	6	\N	\N	\N	\N	\N	\N
8415	1391	6	\N	\N	\N	\N	\N	\N
8416	1392	6	\N	\N	\N	\N	\N	\N
8417	1393	6	\N	\N	\N	\N	\N	\N
8418	1395	6	\N	\N	\N	\N	\N	\N
8419	1396	6	\N	\N	\N	\N	\N	\N
8420	1397	6	\N	\N	\N	\N	\N	\N
8421	1398	6	\N	\N	\N	\N	\N	\N
8422	1399	6	\N	\N	\N	\N	\N	\N
8423	1400	6	\N	\N	\N	\N	\N	\N
8424	1403	6	\N	\N	\N	\N	\N	\N
8425	1405	6	\N	\N	\N	\N	\N	\N
8426	1408	6	\N	\N	\N	\N	\N	\N
8427	1409	6	\N	\N	\N	\N	\N	\N
8428	1414	6	\N	\N	\N	\N	\N	\N
8429	1418	6	\N	\N	\N	\N	\N	\N
8430	1420	6	\N	\N	\N	\N	\N	\N
8431	1421	6	\N	\N	\N	\N	\N	\N
8432	1423	6	\N	\N	\N	\N	\N	\N
8433	1425	6	\N	\N	\N	\N	\N	\N
8434	1429	6	\N	\N	\N	\N	\N	\N
8435	1434	6	\N	\N	\N	\N	\N	\N
8436	1435	6	\N	\N	\N	\N	\N	\N
8437	1436	6	\N	\N	\N	\N	\N	\N
8438	1437	6	\N	\N	\N	\N	\N	\N
8439	1439	6	\N	\N	\N	\N	\N	\N
8440	1442	6	\N	\N	\N	\N	\N	\N
8441	1447	6	\N	\N	\N	\N	\N	\N
8442	1448	6	\N	\N	\N	\N	\N	\N
8443	1449	6	\N	\N	\N	\N	\N	\N
8444	1454	6	\N	\N	\N	\N	\N	\N
8445	1455	6	\N	\N	\N	\N	\N	\N
8446	1456	6	\N	\N	\N	\N	\N	\N
8447	1457	6	\N	\N	\N	\N	\N	\N
8448	1459	6	\N	\N	\N	\N	\N	\N
8449	1464	6	\N	\N	\N	\N	\N	\N
8450	1465	6	\N	\N	\N	\N	\N	\N
8451	1466	6	\N	\N	\N	\N	\N	\N
8452	1468	6	\N	\N	\N	\N	\N	\N
8453	1469	6	\N	\N	\N	\N	\N	\N
8454	1472	6	\N	\N	\N	\N	\N	\N
8455	1473	6	\N	\N	\N	\N	\N	\N
8456	1474	6	\N	\N	\N	\N	\N	\N
8457	1475	6	\N	\N	\N	\N	\N	\N
8458	1478	6	\N	\N	\N	\N	\N	\N
8459	1480	6	\N	\N	\N	\N	\N	\N
8460	1481	6	\N	\N	\N	\N	\N	\N
8461	1483	6	\N	\N	\N	\N	\N	\N
8462	1485	6	\N	\N	\N	\N	\N	\N
8463	1486	6	\N	\N	\N	\N	\N	\N
8464	1487	6	\N	\N	\N	\N	\N	\N
8465	1489	6	\N	\N	\N	\N	\N	\N
8466	1492	6	\N	\N	\N	\N	\N	\N
8467	1495	6	\N	\N	\N	\N	\N	\N
8468	1496	6	\N	\N	\N	\N	\N	\N
8469	1497	6	\N	\N	\N	\N	\N	\N
8470	1500	6	\N	\N	\N	\N	\N	\N
8471	1501	6	\N	\N	\N	\N	\N	\N
8472	1503	6	\N	\N	\N	\N	\N	\N
8473	1504	6	\N	\N	\N	\N	\N	\N
8474	1505	6	\N	\N	\N	\N	\N	\N
8475	1506	6	\N	\N	\N	\N	\N	\N
8476	1507	6	\N	\N	\N	\N	\N	\N
8477	1509	6	\N	\N	\N	\N	\N	\N
8478	1510	6	\N	\N	\N	\N	\N	\N
8479	1511	6	\N	\N	\N	\N	\N	\N
8480	1513	6	\N	\N	\N	\N	\N	\N
8481	1514	6	\N	\N	\N	\N	\N	\N
8482	1515	6	\N	\N	\N	\N	\N	\N
8483	1518	6	\N	\N	\N	\N	\N	\N
8484	1520	6	\N	\N	\N	\N	\N	\N
8485	1521	6	\N	\N	\N	\N	\N	\N
8486	1522	6	\N	\N	\N	\N	\N	\N
8487	1523	6	\N	\N	\N	\N	\N	\N
8488	1524	6	\N	\N	\N	\N	\N	\N
8489	1525	6	\N	\N	\N	\N	\N	\N
8490	1526	6	\N	\N	\N	\N	\N	\N
8491	1527	6	\N	\N	\N	\N	\N	\N
8492	1528	6	\N	\N	\N	\N	\N	\N
8493	1529	6	\N	\N	\N	\N	\N	\N
8494	1531	6	\N	\N	\N	\N	\N	\N
8495	1533	6	\N	\N	\N	\N	\N	\N
8496	1534	6	\N	\N	\N	\N	\N	\N
8497	1535	6	\N	\N	\N	\N	\N	\N
8498	1539	6	\N	\N	\N	\N	\N	\N
8499	1542	6	\N	\N	\N	\N	\N	\N
8500	1546	6	\N	\N	\N	\N	\N	\N
8501	1548	6	\N	\N	\N	\N	\N	\N
8502	1550	6	\N	\N	\N	\N	\N	\N
8503	1552	6	\N	\N	\N	\N	\N	\N
8504	1554	6	\N	\N	\N	\N	\N	\N
8505	1555	6	\N	\N	\N	\N	\N	\N
8506	1556	6	\N	\N	\N	\N	\N	\N
8507	1558	6	\N	\N	\N	\N	\N	\N
8508	1559	6	\N	\N	\N	\N	\N	\N
8509	1561	6	\N	\N	\N	\N	\N	\N
8510	1562	6	\N	\N	\N	\N	\N	\N
8511	1563	6	\N	\N	\N	\N	\N	\N
8512	1565	6	\N	\N	\N	\N	\N	\N
8513	1566	6	\N	\N	\N	\N	\N	\N
8514	1567	6	\N	\N	\N	\N	\N	\N
8515	1568	6	\N	\N	\N	\N	\N	\N
8516	1570	6	\N	\N	\N	\N	\N	\N
8517	1575	6	\N	\N	\N	\N	\N	\N
8518	1576	6	\N	\N	\N	\N	\N	\N
8519	1577	6	\N	\N	\N	\N	\N	\N
8520	1578	6	\N	\N	\N	\N	\N	\N
8521	1579	6	\N	\N	\N	\N	\N	\N
8522	1581	6	\N	\N	\N	\N	\N	\N
8523	1582	6	\N	\N	\N	\N	\N	\N
8524	1586	6	\N	\N	\N	\N	\N	\N
8525	1587	6	\N	\N	\N	\N	\N	\N
8526	1588	6	\N	\N	\N	\N	\N	\N
8527	1590	6	\N	\N	\N	\N	\N	\N
8528	1592	6	\N	\N	\N	\N	\N	\N
8529	1595	6	\N	\N	\N	\N	\N	\N
8530	1596	6	\N	\N	\N	\N	\N	\N
8531	1597	6	\N	\N	\N	\N	\N	\N
8532	1598	6	\N	\N	\N	\N	\N	\N
8533	1602	6	\N	\N	\N	\N	\N	\N
8534	1603	6	\N	\N	\N	\N	\N	\N
8535	1605	6	\N	\N	\N	\N	\N	\N
8536	1606	6	\N	\N	\N	\N	\N	\N
8537	1607	6	\N	\N	\N	\N	\N	\N
8538	1608	6	\N	\N	\N	\N	\N	\N
8539	1609	6	\N	\N	\N	\N	\N	\N
8540	1611	6	\N	\N	\N	\N	\N	\N
8541	1614	6	\N	\N	\N	\N	\N	\N
8542	1616	6	\N	\N	\N	\N	\N	\N
8543	1617	6	\N	\N	\N	\N	\N	\N
8544	1618	6	\N	\N	\N	\N	\N	\N
8545	1619	6	\N	\N	\N	\N	\N	\N
8546	1623	6	\N	\N	\N	\N	\N	\N
8547	1624	6	\N	\N	\N	\N	\N	\N
8548	1625	6	\N	\N	\N	\N	\N	\N
8549	1626	6	\N	\N	\N	\N	\N	\N
8550	1628	6	\N	\N	\N	\N	\N	\N
8551	1629	6	\N	\N	\N	\N	\N	\N
8552	1630	6	\N	\N	\N	\N	\N	\N
8553	1631	6	\N	\N	\N	\N	\N	\N
8554	1632	6	\N	\N	\N	\N	\N	\N
8555	1636	6	\N	\N	\N	\N	\N	\N
8556	1637	6	\N	\N	\N	\N	\N	\N
8557	1638	6	\N	\N	\N	\N	\N	\N
8558	1640	6	\N	\N	\N	\N	\N	\N
8559	1642	6	\N	\N	\N	\N	\N	\N
8560	1643	6	\N	\N	\N	\N	\N	\N
8561	1644	6	\N	\N	\N	\N	\N	\N
8562	1647	6	\N	\N	\N	\N	\N	\N
8563	1650	6	\N	\N	\N	\N	\N	\N
8564	1651	6	\N	\N	\N	\N	\N	\N
8565	1654	6	\N	\N	\N	\N	\N	\N
8566	1657	6	\N	\N	\N	\N	\N	\N
8567	1658	6	\N	\N	\N	\N	\N	\N
8568	1659	6	\N	\N	\N	\N	\N	\N
8569	1660	6	\N	\N	\N	\N	\N	\N
8570	1662	6	\N	\N	\N	\N	\N	\N
8571	1665	6	\N	\N	\N	\N	\N	\N
8572	1669	6	\N	\N	\N	\N	\N	\N
8573	1670	6	\N	\N	\N	\N	\N	\N
8574	1671	6	\N	\N	\N	\N	\N	\N
8575	1673	6	\N	\N	\N	\N	\N	\N
8576	1674	6	\N	\N	\N	\N	\N	\N
8577	1676	6	\N	\N	\N	\N	\N	\N
8578	1677	6	\N	\N	\N	\N	\N	\N
8579	1678	6	\N	\N	\N	\N	\N	\N
8580	1679	6	\N	\N	\N	\N	\N	\N
8581	1680	6	\N	\N	\N	\N	\N	\N
8582	1681	6	\N	\N	\N	\N	\N	\N
8583	1683	6	\N	\N	\N	\N	\N	\N
8584	1684	6	\N	\N	\N	\N	\N	\N
8585	1685	6	\N	\N	\N	\N	\N	\N
8586	1686	6	\N	\N	\N	\N	\N	\N
8587	1687	6	\N	\N	\N	\N	\N	\N
8588	1688	6	\N	\N	\N	\N	\N	\N
8589	1690	6	\N	\N	\N	\N	\N	\N
8590	1691	6	\N	\N	\N	\N	\N	\N
8591	1693	6	\N	\N	\N	\N	\N	\N
8592	1694	6	\N	\N	\N	\N	\N	\N
8593	1695	6	\N	\N	\N	\N	\N	\N
8594	1697	6	\N	\N	\N	\N	\N	\N
8595	1698	6	\N	\N	\N	\N	\N	\N
8596	1699	6	\N	\N	\N	\N	\N	\N
8597	1700	6	\N	\N	\N	\N	\N	\N
8598	1702	6	\N	\N	\N	\N	\N	\N
8599	1703	6	\N	\N	\N	\N	\N	\N
8600	1704	6	\N	\N	\N	\N	\N	\N
8601	1706	6	\N	\N	\N	\N	\N	\N
8602	1707	6	\N	\N	\N	\N	\N	\N
8603	1708	6	\N	\N	\N	\N	\N	\N
8604	1709	6	\N	\N	\N	\N	\N	\N
8605	1710	6	\N	\N	\N	\N	\N	\N
8606	1711	6	\N	\N	\N	\N	\N	\N
8607	1712	6	\N	\N	\N	\N	\N	\N
8608	1714	6	\N	\N	\N	\N	\N	\N
8609	1715	6	\N	\N	\N	\N	\N	\N
8610	1716	6	\N	\N	\N	\N	\N	\N
8611	1717	6	\N	\N	\N	\N	\N	\N
8612	1719	6	\N	\N	\N	\N	\N	\N
8613	1720	6	\N	\N	\N	\N	\N	\N
8614	1721	6	\N	\N	\N	\N	\N	\N
8615	1722	6	\N	\N	\N	\N	\N	\N
8616	1723	6	\N	\N	\N	\N	\N	\N
8617	1724	6	\N	\N	\N	\N	\N	\N
8618	1726	6	\N	\N	\N	\N	\N	\N
8619	1727	6	\N	\N	\N	\N	\N	\N
8620	1728	6	\N	\N	\N	\N	\N	\N
8621	1729	6	\N	\N	\N	\N	\N	\N
8622	1731	6	\N	\N	\N	\N	\N	\N
8623	1732	6	\N	\N	\N	\N	\N	\N
8624	1733	6	\N	\N	\N	\N	\N	\N
8625	1736	6	\N	\N	\N	\N	\N	\N
8626	1737	6	\N	\N	\N	\N	\N	\N
8627	1738	6	\N	\N	\N	\N	\N	\N
8628	1739	6	\N	\N	\N	\N	\N	\N
8629	1741	6	\N	\N	\N	\N	\N	\N
8630	1742	6	\N	\N	\N	\N	\N	\N
8631	1743	6	\N	\N	\N	\N	\N	\N
8632	1745	6	\N	\N	\N	\N	\N	\N
8633	1746	6	\N	\N	\N	\N	\N	\N
8634	1747	6	\N	\N	\N	\N	\N	\N
8635	1748	6	\N	\N	\N	\N	\N	\N
8636	1750	6	\N	\N	\N	\N	\N	\N
8637	1752	6	\N	\N	\N	\N	\N	\N
8638	1753	6	\N	\N	\N	\N	\N	\N
8639	1754	6	\N	\N	\N	\N	\N	\N
8640	1755	6	\N	\N	\N	\N	\N	\N
8641	1757	6	\N	\N	\N	\N	\N	\N
8642	1758	6	\N	\N	\N	\N	\N	\N
8643	1759	6	\N	\N	\N	\N	\N	\N
8644	1760	6	\N	\N	\N	\N	\N	\N
8645	1762	6	\N	\N	\N	\N	\N	\N
8646	1763	6	\N	\N	\N	\N	\N	\N
8647	1765	6	\N	\N	\N	\N	\N	\N
8648	1767	6	\N	\N	\N	\N	\N	\N
8649	1768	6	\N	\N	\N	\N	\N	\N
8650	1769	6	\N	\N	\N	\N	\N	\N
8651	1771	6	\N	\N	\N	\N	\N	\N
8652	1772	6	\N	\N	\N	\N	\N	\N
8653	1773	6	\N	\N	\N	\N	\N	\N
8654	1774	6	\N	\N	\N	\N	\N	\N
8655	1775	6	\N	\N	\N	\N	\N	\N
8656	1776	6	\N	\N	\N	\N	\N	\N
8657	1777	6	\N	\N	\N	\N	\N	\N
8658	1778	6	\N	\N	\N	\N	\N	\N
8659	1779	6	\N	\N	\N	\N	\N	\N
8660	1781	6	\N	\N	\N	\N	\N	\N
8661	1782	6	\N	\N	\N	\N	\N	\N
8662	1783	6	\N	\N	\N	\N	\N	\N
8663	1784	6	\N	\N	\N	\N	\N	\N
8664	1785	6	\N	\N	\N	\N	\N	\N
8665	1786	6	\N	\N	\N	\N	\N	\N
8666	1787	6	\N	\N	\N	\N	\N	\N
8667	1788	6	\N	\N	\N	\N	\N	\N
8668	1789	6	\N	\N	\N	\N	\N	\N
8669	1790	6	\N	\N	\N	\N	\N	\N
8670	1792	6	\N	\N	\N	\N	\N	\N
8671	1793	6	\N	\N	\N	\N	\N	\N
8672	1795	6	\N	\N	\N	\N	\N	\N
8673	1797	6	\N	\N	\N	\N	\N	\N
8674	1798	6	\N	\N	\N	\N	\N	\N
8675	1799	6	\N	\N	\N	\N	\N	\N
8676	1801	6	\N	\N	\N	\N	\N	\N
8677	1803	6	\N	\N	\N	\N	\N	\N
8678	1805	6	\N	\N	\N	\N	\N	\N
8679	1807	6	\N	\N	\N	\N	\N	\N
8680	1808	6	\N	\N	\N	\N	\N	\N
8681	1809	6	\N	\N	\N	\N	\N	\N
8682	1810	6	\N	\N	\N	\N	\N	\N
8683	1811	6	\N	\N	\N	\N	\N	\N
8684	1812	6	\N	\N	\N	\N	\N	\N
8685	1814	6	\N	\N	\N	\N	\N	\N
8686	1815	6	\N	\N	\N	\N	\N	\N
8687	1816	6	\N	\N	\N	\N	\N	\N
8688	1817	6	\N	\N	\N	\N	\N	\N
8689	1818	6	\N	\N	\N	\N	\N	\N
8690	1819	6	\N	\N	\N	\N	\N	\N
8691	1824	6	\N	\N	\N	\N	\N	\N
8692	1825	6	\N	\N	\N	\N	\N	\N
8693	1826	6	\N	\N	\N	\N	\N	\N
8694	1828	6	\N	\N	\N	\N	\N	\N
8695	1830	6	\N	\N	\N	\N	\N	\N
8696	1831	6	\N	\N	\N	\N	\N	\N
8697	1832	6	\N	\N	\N	\N	\N	\N
8698	1833	6	\N	\N	\N	\N	\N	\N
8699	1834	6	\N	\N	\N	\N	\N	\N
8700	1835	6	\N	\N	\N	\N	\N	\N
8701	1836	6	\N	\N	\N	\N	\N	\N
8702	1837	6	\N	\N	\N	\N	\N	\N
8703	1838	6	\N	\N	\N	\N	\N	\N
8704	1839	6	\N	\N	\N	\N	\N	\N
8705	1840	6	\N	\N	\N	\N	\N	\N
8706	1841	6	\N	\N	\N	\N	\N	\N
8707	1842	6	\N	\N	\N	\N	\N	\N
8708	1843	6	\N	\N	\N	\N	\N	\N
8709	1845	6	\N	\N	\N	\N	\N	\N
8710	1846	6	\N	\N	\N	\N	\N	\N
8711	1847	6	\N	\N	\N	\N	\N	\N
8712	1848	6	\N	\N	\N	\N	\N	\N
8713	1849	6	\N	\N	\N	\N	\N	\N
8714	1850	6	\N	\N	\N	\N	\N	\N
8715	1851	6	\N	\N	\N	\N	\N	\N
8716	1852	6	\N	\N	\N	\N	\N	\N
8717	1853	6	\N	\N	\N	\N	\N	\N
8718	1856	6	\N	\N	\N	\N	\N	\N
8719	1857	6	\N	\N	\N	\N	\N	\N
8720	1861	6	\N	\N	\N	\N	\N	\N
8721	1863	6	\N	\N	\N	\N	\N	\N
8722	1864	6	\N	\N	\N	\N	\N	\N
8723	1865	6	\N	\N	\N	\N	\N	\N
8724	1866	6	\N	\N	\N	\N	\N	\N
8725	1869	6	\N	\N	\N	\N	\N	\N
8726	1871	6	\N	\N	\N	\N	\N	\N
8727	1872	6	\N	\N	\N	\N	\N	\N
8728	1873	6	\N	\N	\N	\N	\N	\N
8729	1876	6	\N	\N	\N	\N	\N	\N
8730	1877	6	\N	\N	\N	\N	\N	\N
8731	1878	6	\N	\N	\N	\N	\N	\N
8732	1881	6	\N	\N	\N	\N	\N	\N
8733	1882	6	\N	\N	\N	\N	\N	\N
8734	1883	6	\N	\N	\N	\N	\N	\N
8735	1884	6	\N	\N	\N	\N	\N	\N
8736	1885	6	\N	\N	\N	\N	\N	\N
8737	1886	6	\N	\N	\N	\N	\N	\N
8738	1887	6	\N	\N	\N	\N	\N	\N
8739	1888	6	\N	\N	\N	\N	\N	\N
8740	1889	6	\N	\N	\N	\N	\N	\N
8741	1890	6	\N	\N	\N	\N	\N	\N
8742	1894	6	\N	\N	\N	\N	\N	\N
8743	1896	6	\N	\N	\N	\N	\N	\N
8744	1897	6	\N	\N	\N	\N	\N	\N
8745	1898	6	\N	\N	\N	\N	\N	\N
8746	1899	6	\N	\N	\N	\N	\N	\N
8747	1900	6	\N	\N	\N	\N	\N	\N
8748	1902	6	\N	\N	\N	\N	\N	\N
8749	1903	6	\N	\N	\N	\N	\N	\N
8750	1904	6	\N	\N	\N	\N	\N	\N
8751	1905	6	\N	\N	\N	\N	\N	\N
8752	1907	6	\N	\N	\N	\N	\N	\N
8753	1908	6	\N	\N	\N	\N	\N	\N
8754	1910	6	\N	\N	\N	\N	\N	\N
8755	1912	6	\N	\N	\N	\N	\N	\N
8756	1913	6	\N	\N	\N	\N	\N	\N
8757	1915	6	\N	\N	\N	\N	\N	\N
8758	1916	6	\N	\N	\N	\N	\N	\N
8759	1917	6	\N	\N	\N	\N	\N	\N
8760	1918	6	\N	\N	\N	\N	\N	\N
8761	1920	6	\N	\N	\N	\N	\N	\N
8762	1921	6	\N	\N	\N	\N	\N	\N
8763	1922	6	\N	\N	\N	\N	\N	\N
8764	1923	6	\N	\N	\N	\N	\N	\N
8765	1925	6	\N	\N	\N	\N	\N	\N
8766	1926	6	\N	\N	\N	\N	\N	\N
8767	1927	6	\N	\N	\N	\N	\N	\N
8768	1930	6	\N	\N	\N	\N	\N	\N
8769	1931	6	\N	\N	\N	\N	\N	\N
8770	1933	6	\N	\N	\N	\N	\N	\N
8771	1934	6	\N	\N	\N	\N	\N	\N
8772	1935	6	\N	\N	\N	\N	\N	\N
8773	1937	6	\N	\N	\N	\N	\N	\N
8774	1938	6	\N	\N	\N	\N	\N	\N
8775	1942	6	\N	\N	\N	\N	\N	\N
8776	1943	6	\N	\N	\N	\N	\N	\N
8777	1945	6	\N	\N	\N	\N	\N	\N
8778	1946	6	\N	\N	\N	\N	\N	\N
8779	1947	6	\N	\N	\N	\N	\N	\N
8780	1948	6	\N	\N	\N	\N	\N	\N
8781	1949	6	\N	\N	\N	\N	\N	\N
8782	1950	6	\N	\N	\N	\N	\N	\N
8783	1951	6	\N	\N	\N	\N	\N	\N
8784	1952	6	\N	\N	\N	\N	\N	\N
8785	1954	6	\N	\N	\N	\N	\N	\N
8786	1955	6	\N	\N	\N	\N	\N	\N
8787	1956	6	\N	\N	\N	\N	\N	\N
8788	1958	6	\N	\N	\N	\N	\N	\N
8789	1959	6	\N	\N	\N	\N	\N	\N
8790	1961	6	\N	\N	\N	\N	\N	\N
8791	1962	6	\N	\N	\N	\N	\N	\N
8792	1963	6	\N	\N	\N	\N	\N	\N
8793	1964	6	\N	\N	\N	\N	\N	\N
8794	1965	6	\N	\N	\N	\N	\N	\N
8795	1966	6	\N	\N	\N	\N	\N	\N
8796	1967	6	\N	\N	\N	\N	\N	\N
8797	1968	6	\N	\N	\N	\N	\N	\N
8798	1969	6	\N	\N	\N	\N	\N	\N
8799	1970	6	\N	\N	\N	\N	\N	\N
8800	1971	6	\N	\N	\N	\N	\N	\N
8801	1973	6	\N	\N	\N	\N	\N	\N
8802	1974	6	\N	\N	\N	\N	\N	\N
8803	1975	6	\N	\N	\N	\N	\N	\N
8804	1976	6	\N	\N	\N	\N	\N	\N
8805	1979	6	\N	\N	\N	\N	\N	\N
8806	1980	6	\N	\N	\N	\N	\N	\N
8807	1981	6	\N	\N	\N	\N	\N	\N
8808	1982	6	\N	\N	\N	\N	\N	\N
8809	1983	6	\N	\N	\N	\N	\N	\N
8810	1984	6	\N	\N	\N	\N	\N	\N
8811	1985	6	\N	\N	\N	\N	\N	\N
8812	1986	6	\N	\N	\N	\N	\N	\N
8813	1987	6	\N	\N	\N	\N	\N	\N
8814	1988	6	\N	\N	\N	\N	\N	\N
8815	1989	6	\N	\N	\N	\N	\N	\N
8816	1990	6	\N	\N	\N	\N	\N	\N
8817	1991	6	\N	\N	\N	\N	\N	\N
8818	1993	6	\N	\N	\N	\N	\N	\N
8819	1994	6	\N	\N	\N	\N	\N	\N
8820	1995	6	\N	\N	\N	\N	\N	\N
8821	1996	6	\N	\N	\N	\N	\N	\N
8822	1998	6	\N	\N	\N	\N	\N	\N
8823	1999	6	\N	\N	\N	\N	\N	\N
8824	2000	6	\N	\N	\N	\N	\N	\N
8825	2001	6	\N	\N	\N	\N	\N	\N
8826	2002	6	\N	\N	\N	\N	\N	\N
8827	2004	6	\N	\N	\N	\N	\N	\N
8828	2005	6	\N	\N	\N	\N	\N	\N
8829	2006	6	\N	\N	\N	\N	\N	\N
8830	2007	6	\N	\N	\N	\N	\N	\N
8831	2008	6	\N	\N	\N	\N	\N	\N
8832	2009	6	\N	\N	\N	\N	\N	\N
8833	2010	6	\N	\N	\N	\N	\N	\N
8834	2011	6	\N	\N	\N	\N	\N	\N
8835	2012	6	\N	\N	\N	\N	\N	\N
8836	2013	6	\N	\N	\N	\N	\N	\N
8837	2015	6	\N	\N	\N	\N	\N	\N
8838	2017	6	\N	\N	\N	\N	\N	\N
8839	2018	6	\N	\N	\N	\N	\N	\N
8840	2019	6	\N	\N	\N	\N	\N	\N
8841	2021	6	\N	\N	\N	\N	\N	\N
8842	2022	6	\N	\N	\N	\N	\N	\N
8843	2024	6	\N	\N	\N	\N	\N	\N
8844	2025	6	\N	\N	\N	\N	\N	\N
8845	2026	6	\N	\N	\N	\N	\N	\N
8846	2027	6	\N	\N	\N	\N	\N	\N
8847	2029	6	\N	\N	\N	\N	\N	\N
8848	2030	6	\N	\N	\N	\N	\N	\N
8849	2031	6	\N	\N	\N	\N	\N	\N
8850	2032	6	\N	\N	\N	\N	\N	\N
8851	2033	6	\N	\N	\N	\N	\N	\N
8852	2034	6	\N	\N	\N	\N	\N	\N
8853	2036	6	\N	\N	\N	\N	\N	\N
8854	2037	6	\N	\N	\N	\N	\N	\N
8855	2038	6	\N	\N	\N	\N	\N	\N
8856	2039	6	\N	\N	\N	\N	\N	\N
8857	2040	6	\N	\N	\N	\N	\N	\N
8858	2041	6	\N	\N	\N	\N	\N	\N
8859	2042	6	\N	\N	\N	\N	\N	\N
8860	2043	6	\N	\N	\N	\N	\N	\N
8861	2044	6	\N	\N	\N	\N	\N	\N
8862	2045	6	\N	\N	\N	\N	\N	\N
8863	2046	6	\N	\N	\N	\N	\N	\N
8864	2047	6	\N	\N	\N	\N	\N	\N
8865	2048	6	\N	\N	\N	\N	\N	\N
8866	2049	6	\N	\N	\N	\N	\N	\N
8867	2050	6	\N	\N	\N	\N	\N	\N
8868	2051	6	\N	\N	\N	\N	\N	\N
8869	2053	6	\N	\N	\N	\N	\N	\N
8870	2054	6	\N	\N	\N	\N	\N	\N
8871	2055	6	\N	\N	\N	\N	\N	\N
8872	2056	6	\N	\N	\N	\N	\N	\N
8873	2057	6	\N	\N	\N	\N	\N	\N
8874	2058	6	\N	\N	\N	\N	\N	\N
8875	2059	6	\N	\N	\N	\N	\N	\N
8876	2060	6	\N	\N	\N	\N	\N	\N
8877	2061	6	\N	\N	\N	\N	\N	\N
8878	2062	6	\N	\N	\N	\N	\N	\N
8879	2063	6	\N	\N	\N	\N	\N	\N
8880	2064	6	\N	\N	\N	\N	\N	\N
8881	2065	6	\N	\N	\N	\N	\N	\N
8882	2066	6	\N	\N	\N	\N	\N	\N
8883	2067	6	\N	\N	\N	\N	\N	\N
8884	2069	6	\N	\N	\N	\N	\N	\N
8885	2070	6	\N	\N	\N	\N	\N	\N
8886	2071	6	\N	\N	\N	\N	\N	\N
8887	2072	6	\N	\N	\N	\N	\N	\N
8888	2074	6	\N	\N	\N	\N	\N	\N
8889	2076	6	\N	\N	\N	\N	\N	\N
8890	2077	6	\N	\N	\N	\N	\N	\N
8891	2078	6	\N	\N	\N	\N	\N	\N
8892	2079	6	\N	\N	\N	\N	\N	\N
8893	2080	6	\N	\N	\N	\N	\N	\N
8894	2081	6	\N	\N	\N	\N	\N	\N
8895	2082	6	\N	\N	\N	\N	\N	\N
8896	2083	6	\N	\N	\N	\N	\N	\N
8897	2087	6	\N	\N	\N	\N	\N	\N
8898	2088	6	\N	\N	\N	\N	\N	\N
8899	2089	6	\N	\N	\N	\N	\N	\N
8900	2090	6	\N	\N	\N	\N	\N	\N
8901	2091	6	\N	\N	\N	\N	\N	\N
8902	2092	6	\N	\N	\N	\N	\N	\N
8903	2093	6	\N	\N	\N	\N	\N	\N
8904	2094	6	\N	\N	\N	\N	\N	\N
8905	2095	6	\N	\N	\N	\N	\N	\N
8906	2096	6	\N	\N	\N	\N	\N	\N
8907	2098	6	\N	\N	\N	\N	\N	\N
8908	2099	6	\N	\N	\N	\N	\N	\N
8909	2100	6	\N	\N	\N	\N	\N	\N
8910	2101	6	\N	\N	\N	\N	\N	\N
8911	2103	6	\N	\N	\N	\N	\N	\N
8912	2104	6	\N	\N	\N	\N	\N	\N
8913	2105	6	\N	\N	\N	\N	\N	\N
8914	2106	6	\N	\N	\N	\N	\N	\N
8915	2107	6	\N	\N	\N	\N	\N	\N
8916	2109	6	\N	\N	\N	\N	\N	\N
8917	2110	6	\N	\N	\N	\N	\N	\N
8918	2112	6	\N	\N	\N	\N	\N	\N
8919	2114	6	\N	\N	\N	\N	\N	\N
8920	2115	6	\N	\N	\N	\N	\N	\N
8921	2117	6	\N	\N	\N	\N	\N	\N
8922	2118	6	\N	\N	\N	\N	\N	\N
8923	2119	6	\N	\N	\N	\N	\N	\N
8924	2120	6	\N	\N	\N	\N	\N	\N
8925	2122	6	\N	\N	\N	\N	\N	\N
8926	2123	6	\N	\N	\N	\N	\N	\N
8927	2124	6	\N	\N	\N	\N	\N	\N
8928	2125	6	\N	\N	\N	\N	\N	\N
8929	2126	6	\N	\N	\N	\N	\N	\N
8930	2127	6	\N	\N	\N	\N	\N	\N
8931	2129	6	\N	\N	\N	\N	\N	\N
8932	2130	6	\N	\N	\N	\N	\N	\N
8933	2132	6	\N	\N	\N	\N	\N	\N
8934	2134	6	\N	\N	\N	\N	\N	\N
8935	2135	6	\N	\N	\N	\N	\N	\N
8936	2136	6	\N	\N	\N	\N	\N	\N
8937	2137	6	\N	\N	\N	\N	\N	\N
8938	2138	6	\N	\N	\N	\N	\N	\N
8939	2139	6	\N	\N	\N	\N	\N	\N
8940	2142	6	\N	\N	\N	\N	\N	\N
8941	2143	6	\N	\N	\N	\N	\N	\N
8942	2144	6	\N	\N	\N	\N	\N	\N
8943	2146	6	\N	\N	\N	\N	\N	\N
8944	2147	6	\N	\N	\N	\N	\N	\N
8945	2148	6	\N	\N	\N	\N	\N	\N
8946	2149	6	\N	\N	\N	\N	\N	\N
8947	2150	6	\N	\N	\N	\N	\N	\N
8948	2151	6	\N	\N	\N	\N	\N	\N
8949	2152	6	\N	\N	\N	\N	\N	\N
8950	2153	6	\N	\N	\N	\N	\N	\N
8951	2157	6	\N	\N	\N	\N	\N	\N
8952	2158	6	\N	\N	\N	\N	\N	\N
8953	2159	6	\N	\N	\N	\N	\N	\N
8954	2160	6	\N	\N	\N	\N	\N	\N
8955	2161	6	\N	\N	\N	\N	\N	\N
8956	2162	6	\N	\N	\N	\N	\N	\N
8957	2163	6	\N	\N	\N	\N	\N	\N
8958	2165	6	\N	\N	\N	\N	\N	\N
8959	2166	6	\N	\N	\N	\N	\N	\N
8960	2167	6	\N	\N	\N	\N	\N	\N
8961	2168	6	\N	\N	\N	\N	\N	\N
8962	2170	6	\N	\N	\N	\N	\N	\N
8963	2171	6	\N	\N	\N	\N	\N	\N
8964	2172	6	\N	\N	\N	\N	\N	\N
8965	2173	6	\N	\N	\N	\N	\N	\N
8966	2174	6	\N	\N	\N	\N	\N	\N
8967	2175	6	\N	\N	\N	\N	\N	\N
8968	2176	6	\N	\N	\N	\N	\N	\N
8969	2177	6	\N	\N	\N	\N	\N	\N
8970	2178	6	\N	\N	\N	\N	\N	\N
8971	2179	6	\N	\N	\N	\N	\N	\N
8972	2180	6	\N	\N	\N	\N	\N	\N
8973	2181	6	\N	\N	\N	\N	\N	\N
8974	2182	6	\N	\N	\N	\N	\N	\N
8975	2183	6	\N	\N	\N	\N	\N	\N
8976	2184	6	\N	\N	\N	\N	\N	\N
8977	2185	6	\N	\N	\N	\N	\N	\N
8978	2187	6	\N	\N	\N	\N	\N	\N
8979	2189	6	\N	\N	\N	\N	\N	\N
8980	2190	6	\N	\N	\N	\N	\N	\N
8981	2191	6	\N	\N	\N	\N	\N	\N
8982	2192	6	\N	\N	\N	\N	\N	\N
8983	2193	6	\N	\N	\N	\N	\N	\N
8984	2194	6	\N	\N	\N	\N	\N	\N
8985	2196	6	\N	\N	\N	\N	\N	\N
8986	2198	6	\N	\N	\N	\N	\N	\N
8987	2199	6	\N	\N	\N	\N	\N	\N
8988	2200	6	\N	\N	\N	\N	\N	\N
8989	2201	6	\N	\N	\N	\N	\N	\N
8990	2202	6	\N	\N	\N	\N	\N	\N
8991	2204	6	\N	\N	\N	\N	\N	\N
8992	2205	6	\N	\N	\N	\N	\N	\N
8993	2207	6	\N	\N	\N	\N	\N	\N
8994	2208	6	\N	\N	\N	\N	\N	\N
8995	2209	6	\N	\N	\N	\N	\N	\N
8996	2211	6	\N	\N	\N	\N	\N	\N
8997	2212	6	\N	\N	\N	\N	\N	\N
8998	2213	6	\N	\N	\N	\N	\N	\N
8999	2214	6	\N	\N	\N	\N	\N	\N
9000	2215	6	\N	\N	\N	\N	\N	\N
9001	2217	6	\N	\N	\N	\N	\N	\N
9002	2218	6	\N	\N	\N	\N	\N	\N
9003	2219	6	\N	\N	\N	\N	\N	\N
9004	2221	6	\N	\N	\N	\N	\N	\N
9005	2222	6	\N	\N	\N	\N	\N	\N
9006	2223	6	\N	\N	\N	\N	\N	\N
9007	2224	6	\N	\N	\N	\N	\N	\N
9008	2225	6	\N	\N	\N	\N	\N	\N
9009	2228	6	\N	\N	\N	\N	\N	\N
9010	2229	6	\N	\N	\N	\N	\N	\N
9011	2230	6	\N	\N	\N	\N	\N	\N
9012	2231	6	\N	\N	\N	\N	\N	\N
9013	2232	6	\N	\N	\N	\N	\N	\N
9014	2235	6	\N	\N	\N	\N	\N	\N
9015	2236	6	\N	\N	\N	\N	\N	\N
9016	2237	6	\N	\N	\N	\N	\N	\N
9017	2239	6	\N	\N	\N	\N	\N	\N
9018	2240	6	\N	\N	\N	\N	\N	\N
9019	2241	6	\N	\N	\N	\N	\N	\N
9020	2242	6	\N	\N	\N	\N	\N	\N
9021	2243	6	\N	\N	\N	\N	\N	\N
9022	2244	6	\N	\N	\N	\N	\N	\N
9023	2245	6	\N	\N	\N	\N	\N	\N
9024	2246	6	\N	\N	\N	\N	\N	\N
9025	2247	6	\N	\N	\N	\N	\N	\N
9026	2248	6	\N	\N	\N	\N	\N	\N
9027	2249	6	\N	\N	\N	\N	\N	\N
9028	2250	6	\N	\N	\N	\N	\N	\N
9029	2251	6	\N	\N	\N	\N	\N	\N
9030	2253	6	\N	\N	\N	\N	\N	\N
9031	2255	6	\N	\N	\N	\N	\N	\N
9032	2256	6	\N	\N	\N	\N	\N	\N
9033	2257	6	\N	\N	\N	\N	\N	\N
9034	2258	6	\N	\N	\N	\N	\N	\N
9035	2259	6	\N	\N	\N	\N	\N	\N
9036	2260	6	\N	\N	\N	\N	\N	\N
9037	2261	6	\N	\N	\N	\N	\N	\N
9038	2262	6	\N	\N	\N	\N	\N	\N
9039	2263	6	\N	\N	\N	\N	\N	\N
9040	2264	6	\N	\N	\N	\N	\N	\N
9041	2265	6	\N	\N	\N	\N	\N	\N
9042	2266	6	\N	\N	\N	\N	\N	\N
9043	2267	6	\N	\N	\N	\N	\N	\N
9044	2268	6	\N	\N	\N	\N	\N	\N
9045	2269	6	\N	\N	\N	\N	\N	\N
9046	2270	6	\N	\N	\N	\N	\N	\N
9047	2271	6	\N	\N	\N	\N	\N	\N
9048	2272	6	\N	\N	\N	\N	\N	\N
9049	2273	6	\N	\N	\N	\N	\N	\N
9050	2274	6	\N	\N	\N	\N	\N	\N
9051	2275	6	\N	\N	\N	\N	\N	\N
9052	2276	6	\N	\N	\N	\N	\N	\N
9053	2277	6	\N	\N	\N	\N	\N	\N
9054	2278	6	\N	\N	\N	\N	\N	\N
9055	2279	6	\N	\N	\N	\N	\N	\N
9056	2280	6	\N	\N	\N	\N	\N	\N
9057	2281	6	\N	\N	\N	\N	\N	\N
9058	2282	6	\N	\N	\N	\N	\N	\N
9059	2283	6	\N	\N	\N	\N	\N	\N
9060	2284	6	\N	\N	\N	\N	\N	\N
9061	2285	6	\N	\N	\N	\N	\N	\N
9062	2286	6	\N	\N	\N	\N	\N	\N
9063	2287	6	\N	\N	\N	\N	\N	\N
9064	2288	6	\N	\N	\N	\N	\N	\N
9065	2289	6	\N	\N	\N	\N	\N	\N
9066	2290	6	\N	\N	\N	\N	\N	\N
9067	2291	6	\N	\N	\N	\N	\N	\N
9068	2293	6	\N	\N	\N	\N	\N	\N
9069	2295	6	\N	\N	\N	\N	\N	\N
9070	2296	6	\N	\N	\N	\N	\N	\N
9071	2297	6	\N	\N	\N	\N	\N	\N
9072	2298	6	\N	\N	\N	\N	\N	\N
9073	2299	6	\N	\N	\N	\N	\N	\N
9074	2300	6	\N	\N	\N	\N	\N	\N
9075	2303	6	\N	\N	\N	\N	\N	\N
9076	2304	6	\N	\N	\N	\N	\N	\N
9077	2305	6	\N	\N	\N	\N	\N	\N
9078	2306	6	\N	\N	\N	\N	\N	\N
9079	2307	6	\N	\N	\N	\N	\N	\N
9080	2308	6	\N	\N	\N	\N	\N	\N
9081	2309	6	\N	\N	\N	\N	\N	\N
9082	2310	6	\N	\N	\N	\N	\N	\N
9083	2311	6	\N	\N	\N	\N	\N	\N
9084	2312	6	\N	\N	\N	\N	\N	\N
9085	2313	6	\N	\N	\N	\N	\N	\N
9086	2314	6	\N	\N	\N	\N	\N	\N
9087	2315	6	\N	\N	\N	\N	\N	\N
9088	2316	6	\N	\N	\N	\N	\N	\N
9089	2317	6	\N	\N	\N	\N	\N	\N
9090	2318	6	\N	\N	\N	\N	\N	\N
9091	2320	6	\N	\N	\N	\N	\N	\N
9092	2321	6	\N	\N	\N	\N	\N	\N
9093	2323	6	\N	\N	\N	\N	\N	\N
9094	2324	6	\N	\N	\N	\N	\N	\N
9095	2325	6	\N	\N	\N	\N	\N	\N
9096	2327	6	\N	\N	\N	\N	\N	\N
9097	2329	6	\N	\N	\N	\N	\N	\N
9098	2330	6	\N	\N	\N	\N	\N	\N
9099	2331	6	\N	\N	\N	\N	\N	\N
9100	2332	6	\N	\N	\N	\N	\N	\N
9101	2333	6	\N	\N	\N	\N	\N	\N
9102	2334	6	\N	\N	\N	\N	\N	\N
9103	2335	6	\N	\N	\N	\N	\N	\N
9104	2336	6	\N	\N	\N	\N	\N	\N
9105	2337	6	\N	\N	\N	\N	\N	\N
9106	2338	6	\N	\N	\N	\N	\N	\N
9107	2340	6	\N	\N	\N	\N	\N	\N
9108	2341	6	\N	\N	\N	\N	\N	\N
9109	2342	6	\N	\N	\N	\N	\N	\N
9110	2343	6	\N	\N	\N	\N	\N	\N
9111	2344	6	\N	\N	\N	\N	\N	\N
9112	2345	6	\N	\N	\N	\N	\N	\N
9113	2346	6	\N	\N	\N	\N	\N	\N
9114	2347	6	\N	\N	\N	\N	\N	\N
9115	2348	6	\N	\N	\N	\N	\N	\N
9116	2349	6	\N	\N	\N	\N	\N	\N
9117	2350	6	\N	\N	\N	\N	\N	\N
9118	2351	6	\N	\N	\N	\N	\N	\N
9119	2352	6	\N	\N	\N	\N	\N	\N
9120	2353	6	\N	\N	\N	\N	\N	\N
9121	2354	6	\N	\N	\N	\N	\N	\N
9122	2355	6	\N	\N	\N	\N	\N	\N
9123	2356	6	\N	\N	\N	\N	\N	\N
9124	2357	6	\N	\N	\N	\N	\N	\N
9125	2358	6	\N	\N	\N	\N	\N	\N
9126	2359	6	\N	\N	\N	\N	\N	\N
9127	2360	6	\N	\N	\N	\N	\N	\N
9128	2361	6	\N	\N	\N	\N	\N	\N
9129	2362	6	\N	\N	\N	\N	\N	\N
9130	2363	6	\N	\N	\N	\N	\N	\N
9131	2364	6	\N	\N	\N	\N	\N	\N
9132	2366	6	\N	\N	\N	\N	\N	\N
9133	2367	6	\N	\N	\N	\N	\N	\N
9134	2368	6	\N	\N	\N	\N	\N	\N
9135	2369	6	\N	\N	\N	\N	\N	\N
9136	2370	6	\N	\N	\N	\N	\N	\N
9137	2371	6	\N	\N	\N	\N	\N	\N
9138	2372	6	\N	\N	\N	\N	\N	\N
9139	2373	6	\N	\N	\N	\N	\N	\N
9140	2374	6	\N	\N	\N	\N	\N	\N
9141	2375	6	\N	\N	\N	\N	\N	\N
9142	2376	6	\N	\N	\N	\N	\N	\N
9143	2377	6	\N	\N	\N	\N	\N	\N
9144	2378	6	\N	\N	\N	\N	\N	\N
9145	2379	6	\N	\N	\N	\N	\N	\N
9146	2380	6	\N	\N	\N	\N	\N	\N
9147	2381	6	\N	\N	\N	\N	\N	\N
9148	2382	6	\N	\N	\N	\N	\N	\N
9149	2383	6	\N	\N	\N	\N	\N	\N
9150	2384	6	\N	\N	\N	\N	\N	\N
9151	2385	6	\N	\N	\N	\N	\N	\N
9152	2386	6	\N	\N	\N	\N	\N	\N
9153	2387	6	\N	\N	\N	\N	\N	\N
9154	2389	6	\N	\N	\N	\N	\N	\N
9155	2390	6	\N	\N	\N	\N	\N	\N
9156	2391	6	\N	\N	\N	\N	\N	\N
9157	2392	6	\N	\N	\N	\N	\N	\N
9158	2394	6	\N	\N	\N	\N	\N	\N
9159	2395	6	\N	\N	\N	\N	\N	\N
9160	2396	6	\N	\N	\N	\N	\N	\N
9161	2397	6	\N	\N	\N	\N	\N	\N
9162	2398	6	\N	\N	\N	\N	\N	\N
9163	2399	6	\N	\N	\N	\N	\N	\N
9164	2400	6	\N	\N	\N	\N	\N	\N
9165	2402	6	\N	\N	\N	\N	\N	\N
9166	2403	6	\N	\N	\N	\N	\N	\N
9167	2404	6	\N	\N	\N	\N	\N	\N
9168	2405	6	\N	\N	\N	\N	\N	\N
9169	2406	6	\N	\N	\N	\N	\N	\N
9170	2407	6	\N	\N	\N	\N	\N	\N
9171	2408	6	\N	\N	\N	\N	\N	\N
9172	2409	6	\N	\N	\N	\N	\N	\N
9173	2410	6	\N	\N	\N	\N	\N	\N
9174	2411	6	\N	\N	\N	\N	\N	\N
9175	2412	6	\N	\N	\N	\N	\N	\N
9176	2413	6	\N	\N	\N	\N	\N	\N
9177	2414	6	\N	\N	\N	\N	\N	\N
9178	2415	6	\N	\N	\N	\N	\N	\N
9179	2416	6	\N	\N	\N	\N	\N	\N
9180	2418	6	\N	\N	\N	\N	\N	\N
9181	2419	6	\N	\N	\N	\N	\N	\N
9182	2420	6	\N	\N	\N	\N	\N	\N
9183	2421	6	\N	\N	\N	\N	\N	\N
9184	2422	6	\N	\N	\N	\N	\N	\N
9185	2423	6	\N	\N	\N	\N	\N	\N
9186	2424	6	\N	\N	\N	\N	\N	\N
9187	2425	6	\N	\N	\N	\N	\N	\N
9188	2426	6	\N	\N	\N	\N	\N	\N
9189	2427	6	\N	\N	\N	\N	\N	\N
9190	2428	6	\N	\N	\N	\N	\N	\N
9191	2429	6	\N	\N	\N	\N	\N	\N
9192	2430	6	\N	\N	\N	\N	\N	\N
9193	2432	6	\N	\N	\N	\N	\N	\N
9194	2433	6	\N	\N	\N	\N	\N	\N
9195	2434	6	\N	\N	\N	\N	\N	\N
9196	2435	6	\N	\N	\N	\N	\N	\N
9197	2436	6	\N	\N	\N	\N	\N	\N
9198	2437	6	\N	\N	\N	\N	\N	\N
9199	2438	6	\N	\N	\N	\N	\N	\N
9200	2439	6	\N	\N	\N	\N	\N	\N
9201	2440	6	\N	\N	\N	\N	\N	\N
9202	2441	6	\N	\N	\N	\N	\N	\N
9203	2443	6	\N	\N	\N	\N	\N	\N
9204	2444	6	\N	\N	\N	\N	\N	\N
9205	2445	6	\N	\N	\N	\N	\N	\N
9206	2446	6	\N	\N	\N	\N	\N	\N
9207	2447	6	\N	\N	\N	\N	\N	\N
9208	2448	6	\N	\N	\N	\N	\N	\N
9209	2450	6	\N	\N	\N	\N	\N	\N
9210	2452	6	\N	\N	\N	\N	\N	\N
9211	2453	6	\N	\N	\N	\N	\N	\N
9212	2454	6	\N	\N	\N	\N	\N	\N
9213	2455	6	\N	\N	\N	\N	\N	\N
9214	2456	6	\N	\N	\N	\N	\N	\N
9215	2457	6	\N	\N	\N	\N	\N	\N
9216	2458	6	\N	\N	\N	\N	\N	\N
9217	2459	6	\N	\N	\N	\N	\N	\N
9218	2460	6	\N	\N	\N	\N	\N	\N
9219	2461	6	\N	\N	\N	\N	\N	\N
9220	2462	6	\N	\N	\N	\N	\N	\N
9221	2464	6	\N	\N	\N	\N	\N	\N
9222	2465	6	\N	\N	\N	\N	\N	\N
9223	2466	6	\N	\N	\N	\N	\N	\N
9224	2467	6	\N	\N	\N	\N	\N	\N
9225	2468	6	\N	\N	\N	\N	\N	\N
9226	2469	6	\N	\N	\N	\N	\N	\N
9227	2470	6	\N	\N	\N	\N	\N	\N
9228	2471	6	\N	\N	\N	\N	\N	\N
9229	2472	6	\N	\N	\N	\N	\N	\N
9230	2473	6	\N	\N	\N	\N	\N	\N
9231	2474	6	\N	\N	\N	\N	\N	\N
9232	2475	6	\N	\N	\N	\N	\N	\N
9233	2476	6	\N	\N	\N	\N	\N	\N
9234	2477	6	\N	\N	\N	\N	\N	\N
9235	2478	6	\N	\N	\N	\N	\N	\N
9236	2479	6	\N	\N	\N	\N	\N	\N
9237	2480	6	\N	\N	\N	\N	\N	\N
9238	2481	6	\N	\N	\N	\N	\N	\N
9239	2482	6	\N	\N	\N	\N	\N	\N
9240	2483	6	\N	\N	\N	\N	\N	\N
9241	2484	6	\N	\N	\N	\N	\N	\N
9242	2485	6	\N	\N	\N	\N	\N	\N
9243	2486	6	\N	\N	\N	\N	\N	\N
9244	2487	6	\N	\N	\N	\N	\N	\N
9245	2488	6	\N	\N	\N	\N	\N	\N
9246	2489	6	\N	\N	\N	\N	\N	\N
9247	2490	6	\N	\N	\N	\N	\N	\N
9248	2491	6	\N	\N	\N	\N	\N	\N
9249	2492	6	\N	\N	\N	\N	\N	\N
9250	2493	6	\N	\N	\N	\N	\N	\N
9251	2495	6	\N	\N	\N	\N	\N	\N
9252	2496	6	\N	\N	\N	\N	\N	\N
9253	2497	6	\N	\N	\N	\N	\N	\N
9254	2498	6	\N	\N	\N	\N	\N	\N
9255	2499	6	\N	\N	\N	\N	\N	\N
9256	2500	6	\N	\N	\N	\N	\N	\N
9257	2501	6	\N	\N	\N	\N	\N	\N
9258	2502	6	\N	\N	\N	\N	\N	\N
9259	2503	6	\N	\N	\N	\N	\N	\N
9260	2504	6	\N	\N	\N	\N	\N	\N
9261	2505	6	\N	\N	\N	\N	\N	\N
9262	2506	6	\N	\N	\N	\N	\N	\N
9263	2507	6	\N	\N	\N	\N	\N	\N
9264	2508	6	\N	\N	\N	\N	\N	\N
9265	2509	6	\N	\N	\N	\N	\N	\N
9266	2510	6	\N	\N	\N	\N	\N	\N
9267	2511	6	\N	\N	\N	\N	\N	\N
9268	2512	6	\N	\N	\N	\N	\N	\N
9269	2513	6	\N	\N	\N	\N	\N	\N
9270	2514	6	\N	\N	\N	\N	\N	\N
9271	2515	6	\N	\N	\N	\N	\N	\N
9272	2516	6	\N	\N	\N	\N	\N	\N
9273	2517	6	\N	\N	\N	\N	\N	\N
9274	2518	6	\N	\N	\N	\N	\N	\N
9275	2519	6	\N	\N	\N	\N	\N	\N
9276	2520	6	\N	\N	\N	\N	\N	\N
9277	2521	6	\N	\N	\N	\N	\N	\N
9278	2522	6	\N	\N	\N	\N	\N	\N
9279	2523	6	\N	\N	\N	\N	\N	\N
9280	2524	6	\N	\N	\N	\N	\N	\N
9281	2525	6	\N	\N	\N	\N	\N	\N
9282	2526	6	\N	\N	\N	\N	\N	\N
9283	2527	6	\N	\N	\N	\N	\N	\N
9284	2528	6	\N	\N	\N	\N	\N	\N
9285	2529	6	\N	\N	\N	\N	\N	\N
9286	2530	6	\N	\N	\N	\N	\N	\N
9287	2531	6	\N	\N	\N	\N	\N	\N
9288	2532	6	\N	\N	\N	\N	\N	\N
9289	2533	6	\N	\N	\N	\N	\N	\N
9290	2534	6	\N	\N	\N	\N	\N	\N
9291	2535	6	\N	\N	\N	\N	\N	\N
9292	2536	6	\N	\N	\N	\N	\N	\N
9293	2537	6	\N	\N	\N	\N	\N	\N
9294	2538	6	\N	\N	\N	\N	\N	\N
9295	2539	6	\N	\N	\N	\N	\N	\N
9296	2540	6	\N	\N	\N	\N	\N	\N
9297	2541	6	\N	\N	\N	\N	\N	\N
9298	2542	6	\N	\N	\N	\N	\N	\N
9299	2543	6	\N	\N	\N	\N	\N	\N
9300	2544	6	\N	\N	\N	\N	\N	\N
9301	2545	6	\N	\N	\N	\N	\N	\N
9302	2546	6	\N	\N	\N	\N	\N	\N
9303	2547	6	\N	\N	\N	\N	\N	\N
9304	2548	6	\N	\N	\N	\N	\N	\N
9305	2549	6	\N	\N	\N	\N	\N	\N
9306	2550	6	\N	\N	\N	\N	\N	\N
9307	2551	6	\N	\N	\N	\N	\N	\N
9308	2552	6	\N	\N	\N	\N	\N	\N
9309	2553	6	\N	\N	\N	\N	\N	\N
9310	2554	6	\N	\N	\N	\N	\N	\N
9311	2555	6	\N	\N	\N	\N	\N	\N
9312	2556	6	\N	\N	\N	\N	\N	\N
9313	2557	6	\N	\N	\N	\N	\N	\N
9314	2558	6	\N	\N	\N	\N	\N	\N
9315	2559	6	\N	\N	\N	\N	\N	\N
9316	2560	6	\N	\N	\N	\N	\N	\N
9317	2561	6	\N	\N	\N	\N	\N	\N
9318	2562	6	\N	\N	\N	\N	\N	\N
9319	2563	6	\N	\N	\N	\N	\N	\N
9320	2564	6	\N	\N	\N	\N	\N	\N
9321	2565	6	\N	\N	\N	\N	\N	\N
9322	2566	6	\N	\N	\N	\N	\N	\N
9323	2567	6	\N	\N	\N	\N	\N	\N
9324	2568	6	\N	\N	\N	\N	\N	\N
9325	2569	6	\N	\N	\N	\N	\N	\N
9326	2570	6	\N	\N	\N	\N	\N	\N
9327	2571	6	\N	\N	\N	\N	\N	\N
9328	2572	6	\N	\N	\N	\N	\N	\N
9329	2573	6	\N	\N	\N	\N	\N	\N
9330	2575	6	\N	\N	\N	\N	\N	\N
9331	2576	6	\N	\N	\N	\N	\N	\N
9332	2577	6	\N	\N	\N	\N	\N	\N
9333	2578	6	\N	\N	\N	\N	\N	\N
9334	2579	6	\N	\N	\N	\N	\N	\N
9335	2580	6	\N	\N	\N	\N	\N	\N
9336	2581	6	\N	\N	\N	\N	\N	\N
9337	2582	6	\N	\N	\N	\N	\N	\N
9338	2583	6	\N	\N	\N	\N	\N	\N
9339	2584	6	\N	\N	\N	\N	\N	\N
9340	2585	6	\N	\N	\N	\N	\N	\N
9341	2586	6	\N	\N	\N	\N	\N	\N
9342	2587	6	\N	\N	\N	\N	\N	\N
9343	2588	6	\N	\N	\N	\N	\N	\N
9344	2589	6	\N	\N	\N	\N	\N	\N
9345	2590	6	\N	\N	\N	\N	\N	\N
9346	2591	6	\N	\N	\N	\N	\N	\N
9347	2592	6	\N	\N	\N	\N	\N	\N
9348	2593	6	\N	\N	\N	\N	\N	\N
9349	2594	6	\N	\N	\N	\N	\N	\N
9350	2595	6	\N	\N	\N	\N	\N	\N
9351	2596	6	\N	\N	\N	\N	\N	\N
9352	2597	6	\N	\N	\N	\N	\N	\N
9353	2598	6	\N	\N	\N	\N	\N	\N
9354	2599	6	\N	\N	\N	\N	\N	\N
9355	2600	6	\N	\N	\N	\N	\N	\N
9356	2601	6	\N	\N	\N	\N	\N	\N
9357	2602	6	\N	\N	\N	\N	\N	\N
9358	2603	6	\N	\N	\N	\N	\N	\N
9359	2604	6	\N	\N	\N	\N	\N	\N
9360	2605	6	\N	\N	\N	\N	\N	\N
9361	2606	6	\N	\N	\N	\N	\N	\N
9362	2607	6	\N	\N	\N	\N	\N	\N
9363	2608	6	\N	\N	\N	\N	\N	\N
9364	2609	6	\N	\N	\N	\N	\N	\N
9365	2610	6	\N	\N	\N	\N	\N	\N
9366	2611	6	\N	\N	\N	\N	\N	\N
9367	2612	6	\N	\N	\N	\N	\N	\N
9368	2614	6	\N	\N	\N	\N	\N	\N
9369	2615	6	\N	\N	\N	\N	\N	\N
9370	2616	6	\N	\N	\N	\N	\N	\N
9371	2617	6	\N	\N	\N	\N	\N	\N
9372	2618	6	\N	\N	\N	\N	\N	\N
9373	2619	6	\N	\N	\N	\N	\N	\N
9374	2620	6	\N	\N	\N	\N	\N	\N
9375	2621	6	\N	\N	\N	\N	\N	\N
9376	2624	6	\N	\N	\N	\N	\N	\N
9377	2625	6	\N	\N	\N	\N	\N	\N
9378	2626	6	\N	\N	\N	\N	\N	\N
9379	2627	6	\N	\N	\N	\N	\N	\N
9380	2628	6	\N	\N	\N	\N	\N	\N
9381	2629	6	\N	\N	\N	\N	\N	\N
9382	2630	6	\N	\N	\N	\N	\N	\N
9383	2631	6	\N	\N	\N	\N	\N	\N
9384	2632	6	\N	\N	\N	\N	\N	\N
9385	2633	6	\N	\N	\N	\N	\N	\N
9386	2634	6	\N	\N	\N	\N	\N	\N
9387	2635	6	\N	\N	\N	\N	\N	\N
9388	2636	6	\N	\N	\N	\N	\N	\N
9389	2637	6	\N	\N	\N	\N	\N	\N
9390	2638	6	\N	\N	\N	\N	\N	\N
9391	2639	6	\N	\N	\N	\N	\N	\N
9392	2640	6	\N	\N	\N	\N	\N	\N
9393	2641	6	\N	\N	\N	\N	\N	\N
9394	2642	6	\N	\N	\N	\N	\N	\N
9395	2643	6	\N	\N	\N	\N	\N	\N
9396	2644	6	\N	\N	\N	\N	\N	\N
9397	2645	6	\N	\N	\N	\N	\N	\N
9398	2646	6	\N	\N	\N	\N	\N	\N
9399	2647	6	\N	\N	\N	\N	\N	\N
9400	2648	6	\N	\N	\N	\N	\N	\N
9401	2649	6	\N	\N	\N	\N	\N	\N
9402	2650	6	\N	\N	\N	\N	\N	\N
9403	2651	6	\N	\N	\N	\N	\N	\N
9404	2652	6	\N	\N	\N	\N	\N	\N
9405	2653	6	\N	\N	\N	\N	\N	\N
9406	2654	6	\N	\N	\N	\N	\N	\N
9407	2655	6	\N	\N	\N	\N	\N	\N
9408	2656	6	\N	\N	\N	\N	\N	\N
9409	2657	6	\N	\N	\N	\N	\N	\N
9410	2658	6	\N	\N	\N	\N	\N	\N
9411	2659	6	\N	\N	\N	\N	\N	\N
9412	2660	6	\N	\N	\N	\N	\N	\N
9413	2661	6	\N	\N	\N	\N	\N	\N
9414	2662	6	\N	\N	\N	\N	\N	\N
9415	2663	6	\N	\N	\N	\N	\N	\N
9416	2664	6	\N	\N	\N	\N	\N	\N
9417	2665	6	\N	\N	\N	\N	\N	\N
9418	2666	6	\N	\N	\N	\N	\N	\N
9419	2667	6	\N	\N	\N	\N	\N	\N
9420	2668	6	\N	\N	\N	\N	\N	\N
9421	2669	6	\N	\N	\N	\N	\N	\N
9422	2670	6	\N	\N	\N	\N	\N	\N
9423	2671	6	\N	\N	\N	\N	\N	\N
9424	2672	6	\N	\N	\N	\N	\N	\N
9425	2673	6	\N	\N	\N	\N	\N	\N
9426	2674	6	\N	\N	\N	\N	\N	\N
9427	2675	6	\N	\N	\N	\N	\N	\N
9428	2676	6	\N	\N	\N	\N	\N	\N
9429	2677	6	\N	\N	\N	\N	\N	\N
9430	2678	6	\N	\N	\N	\N	\N	\N
9431	2679	6	\N	\N	\N	\N	\N	\N
9432	2680	6	\N	\N	\N	\N	\N	\N
9433	2681	6	\N	\N	\N	\N	\N	\N
9434	2682	6	\N	\N	\N	\N	\N	\N
9435	2683	6	\N	\N	\N	\N	\N	\N
9436	2684	6	\N	\N	\N	\N	\N	\N
9437	2685	6	\N	\N	\N	\N	\N	\N
9438	2686	6	\N	\N	\N	\N	\N	\N
9439	2687	6	\N	\N	\N	\N	\N	\N
9440	2688	6	\N	\N	\N	\N	\N	\N
9441	2689	6	\N	\N	\N	\N	\N	\N
9442	2690	6	\N	\N	\N	\N	\N	\N
9443	2691	6	\N	\N	\N	\N	\N	\N
9444	2692	6	\N	\N	\N	\N	\N	\N
9445	2693	6	\N	\N	\N	\N	\N	\N
9446	2694	6	\N	\N	\N	\N	\N	\N
9447	2695	6	\N	\N	\N	\N	\N	\N
9448	2696	6	\N	\N	\N	\N	\N	\N
9449	2698	6	\N	\N	\N	\N	\N	\N
9450	2699	6	\N	\N	\N	\N	\N	\N
9451	2701	6	\N	\N	\N	\N	\N	\N
9452	2702	6	\N	\N	\N	\N	\N	\N
9453	2703	6	\N	\N	\N	\N	\N	\N
9454	2704	6	\N	\N	\N	\N	\N	\N
9455	2705	6	\N	\N	\N	\N	\N	\N
9456	2706	6	\N	\N	\N	\N	\N	\N
9457	2707	6	\N	\N	\N	\N	\N	\N
9458	2708	6	\N	\N	\N	\N	\N	\N
9459	2709	6	\N	\N	\N	\N	\N	\N
9460	2710	6	\N	\N	\N	\N	\N	\N
9461	2711	6	\N	\N	\N	\N	\N	\N
9462	2712	6	\N	\N	\N	\N	\N	\N
9463	2713	6	\N	\N	\N	\N	\N	\N
9464	2714	6	\N	\N	\N	\N	\N	\N
9465	2715	6	\N	\N	\N	\N	\N	\N
9466	2717	6	\N	\N	\N	\N	\N	\N
9467	2718	6	\N	\N	\N	\N	\N	\N
9468	2719	6	\N	\N	\N	\N	\N	\N
9469	2720	6	\N	\N	\N	\N	\N	\N
9470	2721	6	\N	\N	\N	\N	\N	\N
9471	2722	6	\N	\N	\N	\N	\N	\N
9472	2723	6	\N	\N	\N	\N	\N	\N
9473	2724	6	\N	\N	\N	\N	\N	\N
9474	2725	6	\N	\N	\N	\N	\N	\N
9475	2726	6	\N	\N	\N	\N	\N	\N
9476	2727	6	\N	\N	\N	\N	\N	\N
9477	2729	6	\N	\N	\N	\N	\N	\N
9478	2730	6	\N	\N	\N	\N	\N	\N
9479	2731	6	\N	\N	\N	\N	\N	\N
9480	2732	6	\N	\N	\N	\N	\N	\N
9481	2733	6	\N	\N	\N	\N	\N	\N
9482	2734	6	\N	\N	\N	\N	\N	\N
9483	2735	6	\N	\N	\N	\N	\N	\N
9484	2736	6	\N	\N	\N	\N	\N	\N
9485	2737	6	\N	\N	\N	\N	\N	\N
9486	2738	6	\N	\N	\N	\N	\N	\N
9487	2739	6	\N	\N	\N	\N	\N	\N
9488	2740	6	\N	\N	\N	\N	\N	\N
9489	2741	6	\N	\N	\N	\N	\N	\N
9490	2742	6	\N	\N	\N	\N	\N	\N
9491	2743	6	\N	\N	\N	\N	\N	\N
9492	2744	6	\N	\N	\N	\N	\N	\N
9493	2746	6	\N	\N	\N	\N	\N	\N
9494	2747	6	\N	\N	\N	\N	\N	\N
9495	2748	6	\N	\N	\N	\N	\N	\N
9496	2749	6	\N	\N	\N	\N	\N	\N
9497	2750	6	\N	\N	\N	\N	\N	\N
9498	2751	6	\N	\N	\N	\N	\N	\N
9499	2752	6	\N	\N	\N	\N	\N	\N
9500	2753	6	\N	\N	\N	\N	\N	\N
9501	2754	6	\N	\N	\N	\N	\N	\N
9502	2755	6	\N	\N	\N	\N	\N	\N
9503	2756	6	\N	\N	\N	\N	\N	\N
9504	2757	6	\N	\N	\N	\N	\N	\N
9505	2758	6	\N	\N	\N	\N	\N	\N
9506	2759	6	\N	\N	\N	\N	\N	\N
9507	2760	6	\N	\N	\N	\N	\N	\N
9508	2761	6	\N	\N	\N	\N	\N	\N
9509	2762	6	\N	\N	\N	\N	\N	\N
9510	2763	6	\N	\N	\N	\N	\N	\N
9511	2764	6	\N	\N	\N	\N	\N	\N
9512	2765	6	\N	\N	\N	\N	\N	\N
9513	2766	6	\N	\N	\N	\N	\N	\N
9514	2767	6	\N	\N	\N	\N	\N	\N
9515	2768	6	\N	\N	\N	\N	\N	\N
9516	2769	6	\N	\N	\N	\N	\N	\N
9517	2770	6	\N	\N	\N	\N	\N	\N
9518	2771	6	\N	\N	\N	\N	\N	\N
9519	2772	6	\N	\N	\N	\N	\N	\N
9520	2773	6	\N	\N	\N	\N	\N	\N
9521	2774	6	\N	\N	\N	\N	\N	\N
9522	2775	6	\N	\N	\N	\N	\N	\N
9523	2776	6	\N	\N	\N	\N	\N	\N
9524	2777	6	\N	\N	\N	\N	\N	\N
9525	2778	6	\N	\N	\N	\N	\N	\N
9526	2779	6	\N	\N	\N	\N	\N	\N
9527	2780	6	\N	\N	\N	\N	\N	\N
9528	2825	6	\N	\N	\N	\N	\N	\N
9529	2826	6	\N	\N	\N	\N	\N	\N
9530	2827	6	\N	\N	\N	\N	\N	\N
9531	2828	6	\N	\N	\N	\N	\N	\N
9532	2829	6	\N	\N	\N	\N	\N	\N
9533	2830	6	\N	\N	\N	\N	\N	\N
9534	2831	6	\N	\N	\N	\N	\N	\N
9535	2833	6	\N	\N	\N	\N	\N	\N
9536	2834	6	\N	\N	\N	\N	\N	\N
9537	2835	6	\N	\N	\N	\N	\N	\N
9538	2836	6	\N	\N	\N	\N	\N	\N
9539	2837	6	\N	\N	\N	\N	\N	\N
9540	2838	6	\N	\N	\N	\N	\N	\N
9541	2839	6	\N	\N	\N	\N	\N	\N
9542	2840	6	\N	\N	\N	\N	\N	\N
9543	2841	6	\N	\N	\N	\N	\N	\N
9544	2842	6	\N	\N	\N	\N	\N	\N
9545	2843	6	\N	\N	\N	\N	\N	\N
9546	2844	6	\N	\N	\N	\N	\N	\N
9547	2845	6	\N	\N	\N	\N	\N	\N
9548	2846	6	\N	\N	\N	\N	\N	\N
9549	2847	6	\N	\N	\N	\N	\N	\N
9550	2848	6	\N	\N	\N	\N	\N	\N
9551	2849	6	\N	\N	\N	\N	\N	\N
9552	2850	6	\N	\N	\N	\N	\N	\N
9553	2852	6	\N	\N	\N	\N	\N	\N
9554	2853	6	\N	\N	\N	\N	\N	\N
9555	2854	6	\N	\N	\N	\N	\N	\N
9556	2855	6	\N	\N	\N	\N	\N	\N
9557	2856	6	\N	\N	\N	\N	\N	\N
9558	2857	6	\N	\N	\N	\N	\N	\N
9559	2858	6	\N	\N	\N	\N	\N	\N
9560	2859	6	\N	\N	\N	\N	\N	\N
9561	2861	6	\N	\N	\N	\N	\N	\N
9562	2862	6	\N	\N	\N	\N	\N	\N
9563	2866	6	\N	\N	\N	\N	\N	\N
9564	2867	6	\N	\N	\N	\N	\N	\N
9565	2868	6	\N	\N	\N	\N	\N	\N
9566	2869	6	\N	\N	\N	\N	\N	\N
9567	2870	6	\N	\N	\N	\N	\N	\N
9568	2872	6	\N	\N	\N	\N	\N	\N
9569	2873	6	\N	\N	\N	\N	\N	\N
9570	2874	6	\N	\N	\N	\N	\N	\N
9571	2875	6	\N	\N	\N	\N	\N	\N
9572	2876	6	\N	\N	\N	\N	\N	\N
9573	2877	6	\N	\N	\N	\N	\N	\N
9574	2878	6	\N	\N	\N	\N	\N	\N
9575	2879	6	\N	\N	\N	\N	\N	\N
9576	2880	6	\N	\N	\N	\N	\N	\N
9577	1	7	\N	\N	\N	\N	\N	\N
9578	2	7	\N	\N	\N	\N	\N	\N
9579	3	7	\N	\N	\N	\N	\N	\N
9580	4	7	\N	\N	\N	\N	\N	\N
9581	5	7	\N	\N	\N	\N	\N	\N
9582	6	7	\N	\N	\N	\N	\N	\N
9583	8	7	\N	\N	\N	\N	\N	\N
9584	9	7	\N	\N	\N	\N	\N	\N
9585	10	7	\N	\N	\N	\N	\N	\N
9586	13	7	\N	\N	\N	\N	\N	\N
9587	14	7	\N	\N	\N	\N	\N	\N
9588	16	7	\N	\N	\N	\N	\N	\N
9589	18	7	\N	\N	\N	\N	\N	\N
9590	25	7	\N	\N	\N	\N	\N	\N
9591	31	7	\N	\N	\N	\N	\N	\N
9592	32	7	\N	\N	\N	\N	\N	\N
9593	34	7	\N	\N	\N	\N	\N	\N
9594	35	7	\N	\N	\N	\N	\N	\N
9595	37	7	\N	\N	\N	\N	\N	\N
9596	41	7	\N	\N	\N	\N	\N	\N
9597	42	7	\N	\N	\N	\N	\N	\N
9598	43	7	\N	\N	\N	\N	\N	\N
9599	45	7	\N	\N	\N	\N	\N	\N
9600	49	7	\N	\N	\N	\N	\N	\N
9601	50	7	\N	\N	\N	\N	\N	\N
9602	51	7	\N	\N	\N	\N	\N	\N
9603	52	7	\N	\N	\N	\N	\N	\N
9604	53	7	\N	\N	\N	\N	\N	\N
9605	56	7	\N	\N	\N	\N	\N	\N
9606	57	7	\N	\N	\N	\N	\N	\N
9607	58	7	\N	\N	\N	\N	\N	\N
9608	61	7	\N	\N	\N	\N	\N	\N
9609	63	7	\N	\N	\N	\N	\N	\N
9610	64	7	\N	\N	\N	\N	\N	\N
9611	66	7	\N	\N	\N	\N	\N	\N
9612	67	7	\N	\N	\N	\N	\N	\N
9613	68	7	\N	\N	\N	\N	\N	\N
9614	69	7	\N	\N	\N	\N	\N	\N
9615	70	7	\N	\N	\N	\N	\N	\N
9616	71	7	\N	\N	\N	\N	\N	\N
9617	72	7	\N	\N	\N	\N	\N	\N
9618	74	7	\N	\N	\N	\N	\N	\N
9619	75	7	\N	\N	\N	\N	\N	\N
9620	76	7	\N	\N	\N	\N	\N	\N
9621	77	7	\N	\N	\N	\N	\N	\N
9622	78	7	\N	\N	\N	\N	\N	\N
9623	79	7	\N	\N	\N	\N	\N	\N
9624	80	7	\N	\N	\N	\N	\N	\N
9625	83	7	\N	\N	\N	\N	\N	\N
9626	84	7	\N	\N	\N	\N	\N	\N
9627	87	7	\N	\N	\N	\N	\N	\N
9628	88	7	\N	\N	\N	\N	\N	\N
9629	89	7	\N	\N	\N	\N	\N	\N
9630	90	7	\N	\N	\N	\N	\N	\N
9631	93	7	\N	\N	\N	\N	\N	\N
9632	99	7	\N	\N	\N	\N	\N	\N
9633	101	7	\N	\N	\N	\N	\N	\N
9634	103	7	\N	\N	\N	\N	\N	\N
9635	109	7	\N	\N	\N	\N	\N	\N
9636	113	7	\N	\N	\N	\N	\N	\N
9637	114	7	\N	\N	\N	\N	\N	\N
9638	117	7	\N	\N	\N	\N	\N	\N
9639	118	7	\N	\N	\N	\N	\N	\N
9640	120	7	\N	\N	\N	\N	\N	\N
9641	121	7	\N	\N	\N	\N	\N	\N
9642	122	7	\N	\N	\N	\N	\N	\N
9643	125	7	\N	\N	\N	\N	\N	\N
9644	128	7	\N	\N	\N	\N	\N	\N
9645	129	7	\N	\N	\N	\N	\N	\N
9646	130	7	\N	\N	\N	\N	\N	\N
9647	131	7	\N	\N	\N	\N	\N	\N
9648	132	7	\N	\N	\N	\N	\N	\N
9649	134	7	\N	\N	\N	\N	\N	\N
9650	135	7	\N	\N	\N	\N	\N	\N
9651	138	7	\N	\N	\N	\N	\N	\N
9652	141	7	\N	\N	\N	\N	\N	\N
9653	142	7	\N	\N	\N	\N	\N	\N
9654	145	7	\N	\N	\N	\N	\N	\N
9655	148	7	\N	\N	\N	\N	\N	\N
9656	150	7	\N	\N	\N	\N	\N	\N
9657	151	7	\N	\N	\N	\N	\N	\N
9658	154	7	\N	\N	\N	\N	\N	\N
9659	159	7	\N	\N	\N	\N	\N	\N
9660	160	7	\N	\N	\N	\N	\N	\N
9661	161	7	\N	\N	\N	\N	\N	\N
9662	164	7	\N	\N	\N	\N	\N	\N
9663	168	7	\N	\N	\N	\N	\N	\N
9664	170	7	\N	\N	\N	\N	\N	\N
9665	174	7	\N	\N	\N	\N	\N	\N
9666	175	7	\N	\N	\N	\N	\N	\N
9667	181	7	\N	\N	\N	\N	\N	\N
9668	182	7	\N	\N	\N	\N	\N	\N
9669	199	7	\N	\N	\N	\N	\N	\N
9670	201	7	\N	\N	\N	\N	\N	\N
9671	205	7	\N	\N	\N	\N	\N	\N
9672	206	7	\N	\N	\N	\N	\N	\N
9673	212	7	\N	\N	\N	\N	\N	\N
9674	213	7	\N	\N	\N	\N	\N	\N
9675	215	7	\N	\N	\N	\N	\N	\N
9676	217	7	\N	\N	\N	\N	\N	\N
9677	218	7	\N	\N	\N	\N	\N	\N
9678	221	7	\N	\N	\N	\N	\N	\N
9679	224	7	\N	\N	\N	\N	\N	\N
9680	233	7	\N	\N	\N	\N	\N	\N
9681	234	7	\N	\N	\N	\N	\N	\N
9682	254	7	\N	\N	\N	\N	\N	\N
9683	257	7	\N	\N	\N	\N	\N	\N
9684	258	7	\N	\N	\N	\N	\N	\N
9685	260	7	\N	\N	\N	\N	\N	\N
9686	263	7	\N	\N	\N	\N	\N	\N
9687	268	7	\N	\N	\N	\N	\N	\N
9688	269	7	\N	\N	\N	\N	\N	\N
9689	275	7	\N	\N	\N	\N	\N	\N
9690	276	7	\N	\N	\N	\N	\N	\N
9691	278	7	\N	\N	\N	\N	\N	\N
9692	279	7	\N	\N	\N	\N	\N	\N
9693	287	7	\N	\N	\N	\N	\N	\N
9694	290	7	\N	\N	\N	\N	\N	\N
9695	291	7	\N	\N	\N	\N	\N	\N
9696	293	7	\N	\N	\N	\N	\N	\N
9697	295	7	\N	\N	\N	\N	\N	\N
9698	298	7	\N	\N	\N	\N	\N	\N
9699	304	7	\N	\N	\N	\N	\N	\N
9700	312	7	\N	\N	\N	\N	\N	\N
9701	313	7	\N	\N	\N	\N	\N	\N
9702	316	7	\N	\N	\N	\N	\N	\N
9703	317	7	\N	\N	\N	\N	\N	\N
9704	322	7	\N	\N	\N	\N	\N	\N
9705	323	7	\N	\N	\N	\N	\N	\N
9706	325	7	\N	\N	\N	\N	\N	\N
9707	328	7	\N	\N	\N	\N	\N	\N
9708	331	7	\N	\N	\N	\N	\N	\N
9709	333	7	\N	\N	\N	\N	\N	\N
9710	334	7	\N	\N	\N	\N	\N	\N
9711	337	7	\N	\N	\N	\N	\N	\N
9712	338	7	\N	\N	\N	\N	\N	\N
9713	341	7	\N	\N	\N	\N	\N	\N
9714	350	7	\N	\N	\N	\N	\N	\N
9715	353	7	\N	\N	\N	\N	\N	\N
9716	356	7	\N	\N	\N	\N	\N	\N
9717	360	7	\N	\N	\N	\N	\N	\N
9718	362	7	\N	\N	\N	\N	\N	\N
9719	366	7	\N	\N	\N	\N	\N	\N
9720	367	7	\N	\N	\N	\N	\N	\N
9721	370	7	\N	\N	\N	\N	\N	\N
9722	372	7	\N	\N	\N	\N	\N	\N
9723	374	7	\N	\N	\N	\N	\N	\N
9724	377	7	\N	\N	\N	\N	\N	\N
9725	382	7	\N	\N	\N	\N	\N	\N
9726	385	7	\N	\N	\N	\N	\N	\N
9727	386	7	\N	\N	\N	\N	\N	\N
9728	389	7	\N	\N	\N	\N	\N	\N
9729	400	7	\N	\N	\N	\N	\N	\N
9730	405	7	\N	\N	\N	\N	\N	\N
9731	406	7	\N	\N	\N	\N	\N	\N
9732	411	7	\N	\N	\N	\N	\N	\N
9733	415	7	\N	\N	\N	\N	\N	\N
9734	416	7	\N	\N	\N	\N	\N	\N
9735	426	7	\N	\N	\N	\N	\N	\N
9736	448	7	\N	\N	\N	\N	\N	\N
9737	450	7	\N	\N	\N	\N	\N	\N
9738	460	7	\N	\N	\N	\N	\N	\N
9739	461	7	\N	\N	\N	\N	\N	\N
9740	463	7	\N	\N	\N	\N	\N	\N
9741	467	7	\N	\N	\N	\N	\N	\N
9742	468	7	\N	\N	\N	\N	\N	\N
9743	470	7	\N	\N	\N	\N	\N	\N
9744	477	7	\N	\N	\N	\N	\N	\N
9745	495	7	\N	\N	\N	\N	\N	\N
9746	501	7	\N	\N	\N	\N	\N	\N
9747	502	7	\N	\N	\N	\N	\N	\N
9748	506	7	\N	\N	\N	\N	\N	\N
9749	512	7	\N	\N	\N	\N	\N	\N
9750	513	7	\N	\N	\N	\N	\N	\N
9751	520	7	\N	\N	\N	\N	\N	\N
9752	525	7	\N	\N	\N	\N	\N	\N
9753	536	7	\N	\N	\N	\N	\N	\N
9754	541	7	\N	\N	\N	\N	\N	\N
9755	543	7	\N	\N	\N	\N	\N	\N
9756	545	7	\N	\N	\N	\N	\N	\N
9757	549	7	\N	\N	\N	\N	\N	\N
9758	551	7	\N	\N	\N	\N	\N	\N
9759	558	7	\N	\N	\N	\N	\N	\N
9760	572	7	\N	\N	\N	\N	\N	\N
9761	573	7	\N	\N	\N	\N	\N	\N
9762	576	7	\N	\N	\N	\N	\N	\N
9763	584	7	\N	\N	\N	\N	\N	\N
9764	588	7	\N	\N	\N	\N	\N	\N
9765	594	7	\N	\N	\N	\N	\N	\N
9766	597	7	\N	\N	\N	\N	\N	\N
9767	601	7	\N	\N	\N	\N	\N	\N
9768	606	7	\N	\N	\N	\N	\N	\N
9769	623	7	\N	\N	\N	\N	\N	\N
9770	624	7	\N	\N	\N	\N	\N	\N
9771	625	7	\N	\N	\N	\N	\N	\N
9772	626	7	\N	\N	\N	\N	\N	\N
9773	627	7	\N	\N	\N	\N	\N	\N
9774	629	7	\N	\N	\N	\N	\N	\N
9775	633	7	\N	\N	\N	\N	\N	\N
9776	638	7	\N	\N	\N	\N	\N	\N
9777	643	7	\N	\N	\N	\N	\N	\N
9778	644	7	\N	\N	\N	\N	\N	\N
9779	654	7	\N	\N	\N	\N	\N	\N
9780	656	7	\N	\N	\N	\N	\N	\N
9781	659	7	\N	\N	\N	\N	\N	\N
9782	660	7	\N	\N	\N	\N	\N	\N
9783	666	7	\N	\N	\N	\N	\N	\N
9784	680	7	\N	\N	\N	\N	\N	\N
9785	693	7	\N	\N	\N	\N	\N	\N
9786	699	7	\N	\N	\N	\N	\N	\N
9787	702	7	\N	\N	\N	\N	\N	\N
9788	703	7	\N	\N	\N	\N	\N	\N
9789	706	7	\N	\N	\N	\N	\N	\N
9790	707	7	\N	\N	\N	\N	\N	\N
9791	708	7	\N	\N	\N	\N	\N	\N
9792	719	7	\N	\N	\N	\N	\N	\N
9793	720	7	\N	\N	\N	\N	\N	\N
9794	723	7	\N	\N	\N	\N	\N	\N
9795	730	7	\N	\N	\N	\N	\N	\N
9796	733	7	\N	\N	\N	\N	\N	\N
9797	734	7	\N	\N	\N	\N	\N	\N
9798	747	7	\N	\N	\N	\N	\N	\N
9799	760	7	\N	\N	\N	\N	\N	\N
9800	764	7	\N	\N	\N	\N	\N	\N
9801	766	7	\N	\N	\N	\N	\N	\N
9802	778	7	\N	\N	\N	\N	\N	\N
9803	781	7	\N	\N	\N	\N	\N	\N
9804	785	7	\N	\N	\N	\N	\N	\N
9805	788	7	\N	\N	\N	\N	\N	\N
9806	789	7	\N	\N	\N	\N	\N	\N
9807	795	7	\N	\N	\N	\N	\N	\N
9808	796	7	\N	\N	\N	\N	\N	\N
9809	797	7	\N	\N	\N	\N	\N	\N
9810	799	7	\N	\N	\N	\N	\N	\N
9811	812	7	\N	\N	\N	\N	\N	\N
9812	813	7	\N	\N	\N	\N	\N	\N
9813	814	7	\N	\N	\N	\N	\N	\N
9814	815	7	\N	\N	\N	\N	\N	\N
9815	818	7	\N	\N	\N	\N	\N	\N
9816	819	7	\N	\N	\N	\N	\N	\N
9817	823	7	\N	\N	\N	\N	\N	\N
9818	825	7	\N	\N	\N	\N	\N	\N
9819	831	7	\N	\N	\N	\N	\N	\N
9820	833	7	\N	\N	\N	\N	\N	\N
9821	836	7	\N	\N	\N	\N	\N	\N
9822	837	7	\N	\N	\N	\N	\N	\N
9823	841	7	\N	\N	\N	\N	\N	\N
9824	853	7	\N	\N	\N	\N	\N	\N
9825	857	7	\N	\N	\N	\N	\N	\N
9826	859	7	\N	\N	\N	\N	\N	\N
9827	869	7	\N	\N	\N	\N	\N	\N
9828	870	7	\N	\N	\N	\N	\N	\N
9829	873	7	\N	\N	\N	\N	\N	\N
9830	890	7	\N	\N	\N	\N	\N	\N
9831	892	7	\N	\N	\N	\N	\N	\N
9832	894	7	\N	\N	\N	\N	\N	\N
9833	895	7	\N	\N	\N	\N	\N	\N
9834	898	7	\N	\N	\N	\N	\N	\N
9835	911	7	\N	\N	\N	\N	\N	\N
9836	912	7	\N	\N	\N	\N	\N	\N
9837	914	7	\N	\N	\N	\N	\N	\N
9838	916	7	\N	\N	\N	\N	\N	\N
9839	918	7	\N	\N	\N	\N	\N	\N
9840	920	7	\N	\N	\N	\N	\N	\N
9841	921	7	\N	\N	\N	\N	\N	\N
9842	924	7	\N	\N	\N	\N	\N	\N
9843	933	7	\N	\N	\N	\N	\N	\N
9844	934	7	\N	\N	\N	\N	\N	\N
9845	938	7	\N	\N	\N	\N	\N	\N
9846	939	7	\N	\N	\N	\N	\N	\N
9847	945	7	\N	\N	\N	\N	\N	\N
9848	948	7	\N	\N	\N	\N	\N	\N
9849	951	7	\N	\N	\N	\N	\N	\N
9850	954	7	\N	\N	\N	\N	\N	\N
9851	959	7	\N	\N	\N	\N	\N	\N
9852	960	7	\N	\N	\N	\N	\N	\N
9853	964	7	\N	\N	\N	\N	\N	\N
9854	965	7	\N	\N	\N	\N	\N	\N
9855	977	7	\N	\N	\N	\N	\N	\N
9856	978	7	\N	\N	\N	\N	\N	\N
9857	986	7	\N	\N	\N	\N	\N	\N
9858	988	7	\N	\N	\N	\N	\N	\N
9859	990	7	\N	\N	\N	\N	\N	\N
9860	993	7	\N	\N	\N	\N	\N	\N
9861	994	7	\N	\N	\N	\N	\N	\N
9862	998	7	\N	\N	\N	\N	\N	\N
9863	999	7	\N	\N	\N	\N	\N	\N
9864	1002	7	\N	\N	\N	\N	\N	\N
9865	1004	7	\N	\N	\N	\N	\N	\N
9866	1008	7	\N	\N	\N	\N	\N	\N
9867	1010	7	\N	\N	\N	\N	\N	\N
9868	1019	7	\N	\N	\N	\N	\N	\N
9869	1020	7	\N	\N	\N	\N	\N	\N
9870	1022	7	\N	\N	\N	\N	\N	\N
9871	1026	7	\N	\N	\N	\N	\N	\N
9872	1027	7	\N	\N	\N	\N	\N	\N
9873	1028	7	\N	\N	\N	\N	\N	\N
9874	1032	7	\N	\N	\N	\N	\N	\N
9875	1033	7	\N	\N	\N	\N	\N	\N
9876	1035	7	\N	\N	\N	\N	\N	\N
9877	1038	7	\N	\N	\N	\N	\N	\N
9878	1042	7	\N	\N	\N	\N	\N	\N
9879	1044	7	\N	\N	\N	\N	\N	\N
9880	1050	7	\N	\N	\N	\N	\N	\N
9881	1052	7	\N	\N	\N	\N	\N	\N
9882	1053	7	\N	\N	\N	\N	\N	\N
9883	1058	7	\N	\N	\N	\N	\N	\N
9884	1063	7	\N	\N	\N	\N	\N	\N
9885	1066	7	\N	\N	\N	\N	\N	\N
9886	1069	7	\N	\N	\N	\N	\N	\N
9887	1070	7	\N	\N	\N	\N	\N	\N
9888	1082	7	\N	\N	\N	\N	\N	\N
9889	1084	7	\N	\N	\N	\N	\N	\N
9890	1085	7	\N	\N	\N	\N	\N	\N
9891	1087	7	\N	\N	\N	\N	\N	\N
9892	1089	7	\N	\N	\N	\N	\N	\N
9893	1090	7	\N	\N	\N	\N	\N	\N
9894	1093	7	\N	\N	\N	\N	\N	\N
9895	1100	7	\N	\N	\N	\N	\N	\N
9896	1104	7	\N	\N	\N	\N	\N	\N
9897	1106	7	\N	\N	\N	\N	\N	\N
9898	1107	7	\N	\N	\N	\N	\N	\N
9899	1109	7	\N	\N	\N	\N	\N	\N
9900	1110	7	\N	\N	\N	\N	\N	\N
9901	1111	7	\N	\N	\N	\N	\N	\N
9902	1113	7	\N	\N	\N	\N	\N	\N
9903	1120	7	\N	\N	\N	\N	\N	\N
9904	1123	7	\N	\N	\N	\N	\N	\N
9905	1125	7	\N	\N	\N	\N	\N	\N
9906	1135	7	\N	\N	\N	\N	\N	\N
9907	1136	7	\N	\N	\N	\N	\N	\N
9908	1141	7	\N	\N	\N	\N	\N	\N
9909	1146	7	\N	\N	\N	\N	\N	\N
9910	1147	7	\N	\N	\N	\N	\N	\N
9911	1148	7	\N	\N	\N	\N	\N	\N
9912	1153	7	\N	\N	\N	\N	\N	\N
9913	1154	7	\N	\N	\N	\N	\N	\N
9914	1155	7	\N	\N	\N	\N	\N	\N
9915	1156	7	\N	\N	\N	\N	\N	\N
9916	1159	7	\N	\N	\N	\N	\N	\N
9917	1164	7	\N	\N	\N	\N	\N	\N
9918	1165	7	\N	\N	\N	\N	\N	\N
9919	1168	7	\N	\N	\N	\N	\N	\N
9920	1169	7	\N	\N	\N	\N	\N	\N
9921	1172	7	\N	\N	\N	\N	\N	\N
9922	1175	7	\N	\N	\N	\N	\N	\N
9923	1176	7	\N	\N	\N	\N	\N	\N
9924	1182	7	\N	\N	\N	\N	\N	\N
9925	1185	7	\N	\N	\N	\N	\N	\N
9926	1191	7	\N	\N	\N	\N	\N	\N
9927	1193	7	\N	\N	\N	\N	\N	\N
9928	1194	7	\N	\N	\N	\N	\N	\N
9929	1195	7	\N	\N	\N	\N	\N	\N
9930	1198	7	\N	\N	\N	\N	\N	\N
9931	1200	7	\N	\N	\N	\N	\N	\N
9932	1206	7	\N	\N	\N	\N	\N	\N
9933	1208	7	\N	\N	\N	\N	\N	\N
9934	1209	7	\N	\N	\N	\N	\N	\N
9935	1210	7	\N	\N	\N	\N	\N	\N
9936	1212	7	\N	\N	\N	\N	\N	\N
9937	1213	7	\N	\N	\N	\N	\N	\N
9938	1214	7	\N	\N	\N	\N	\N	\N
9939	1216	7	\N	\N	\N	\N	\N	\N
9940	1218	7	\N	\N	\N	\N	\N	\N
9941	1223	7	\N	\N	\N	\N	\N	\N
9942	1226	7	\N	\N	\N	\N	\N	\N
9943	1229	7	\N	\N	\N	\N	\N	\N
9944	1230	7	\N	\N	\N	\N	\N	\N
9945	1234	7	\N	\N	\N	\N	\N	\N
9946	1238	7	\N	\N	\N	\N	\N	\N
9947	1241	7	\N	\N	\N	\N	\N	\N
9948	1244	7	\N	\N	\N	\N	\N	\N
9949	1247	7	\N	\N	\N	\N	\N	\N
9950	1248	7	\N	\N	\N	\N	\N	\N
9951	1249	7	\N	\N	\N	\N	\N	\N
9952	1250	7	\N	\N	\N	\N	\N	\N
9953	1251	7	\N	\N	\N	\N	\N	\N
9954	1252	7	\N	\N	\N	\N	\N	\N
9955	1254	7	\N	\N	\N	\N	\N	\N
9956	1256	7	\N	\N	\N	\N	\N	\N
9957	1257	7	\N	\N	\N	\N	\N	\N
9958	1259	7	\N	\N	\N	\N	\N	\N
9959	1264	7	\N	\N	\N	\N	\N	\N
9960	1266	7	\N	\N	\N	\N	\N	\N
9961	1268	7	\N	\N	\N	\N	\N	\N
9962	1269	7	\N	\N	\N	\N	\N	\N
9963	1271	7	\N	\N	\N	\N	\N	\N
9964	1274	7	\N	\N	\N	\N	\N	\N
9965	1276	7	\N	\N	\N	\N	\N	\N
9966	1279	7	\N	\N	\N	\N	\N	\N
9967	1281	7	\N	\N	\N	\N	\N	\N
9968	1282	7	\N	\N	\N	\N	\N	\N
9969	1283	7	\N	\N	\N	\N	\N	\N
9970	1284	7	\N	\N	\N	\N	\N	\N
9971	1285	7	\N	\N	\N	\N	\N	\N
9972	1286	7	\N	\N	\N	\N	\N	\N
9973	1288	7	\N	\N	\N	\N	\N	\N
9974	1291	7	\N	\N	\N	\N	\N	\N
9975	1294	7	\N	\N	\N	\N	\N	\N
9976	1297	7	\N	\N	\N	\N	\N	\N
9977	1298	7	\N	\N	\N	\N	\N	\N
9978	1299	7	\N	\N	\N	\N	\N	\N
9979	1303	7	\N	\N	\N	\N	\N	\N
9980	1304	7	\N	\N	\N	\N	\N	\N
9981	1306	7	\N	\N	\N	\N	\N	\N
9982	1308	7	\N	\N	\N	\N	\N	\N
9983	1309	7	\N	\N	\N	\N	\N	\N
9984	1312	7	\N	\N	\N	\N	\N	\N
9985	1320	7	\N	\N	\N	\N	\N	\N
9986	1321	7	\N	\N	\N	\N	\N	\N
9987	1322	7	\N	\N	\N	\N	\N	\N
9988	1323	7	\N	\N	\N	\N	\N	\N
9989	1334	7	\N	\N	\N	\N	\N	\N
9990	1336	7	\N	\N	\N	\N	\N	\N
9991	1340	7	\N	\N	\N	\N	\N	\N
9992	1341	7	\N	\N	\N	\N	\N	\N
9993	1343	7	\N	\N	\N	\N	\N	\N
9994	1348	7	\N	\N	\N	\N	\N	\N
9995	1351	7	\N	\N	\N	\N	\N	\N
9996	1352	7	\N	\N	\N	\N	\N	\N
9997	1353	7	\N	\N	\N	\N	\N	\N
9998	1358	7	\N	\N	\N	\N	\N	\N
9999	1361	7	\N	\N	\N	\N	\N	\N
10000	1367	7	\N	\N	\N	\N	\N	\N
10001	1368	7	\N	\N	\N	\N	\N	\N
10002	1371	7	\N	\N	\N	\N	\N	\N
10003	1375	7	\N	\N	\N	\N	\N	\N
10004	1376	7	\N	\N	\N	\N	\N	\N
10005	1380	7	\N	\N	\N	\N	\N	\N
10006	1381	7	\N	\N	\N	\N	\N	\N
10007	1382	7	\N	\N	\N	\N	\N	\N
10008	1387	7	\N	\N	\N	\N	\N	\N
10009	1389	7	\N	\N	\N	\N	\N	\N
10010	1390	7	\N	\N	\N	\N	\N	\N
10011	1391	7	\N	\N	\N	\N	\N	\N
10012	1392	7	\N	\N	\N	\N	\N	\N
10013	1393	7	\N	\N	\N	\N	\N	\N
10014	1395	7	\N	\N	\N	\N	\N	\N
10015	1396	7	\N	\N	\N	\N	\N	\N
10016	1397	7	\N	\N	\N	\N	\N	\N
10017	1398	7	\N	\N	\N	\N	\N	\N
10018	1399	7	\N	\N	\N	\N	\N	\N
10019	1400	7	\N	\N	\N	\N	\N	\N
10020	1403	7	\N	\N	\N	\N	\N	\N
10021	1405	7	\N	\N	\N	\N	\N	\N
10022	1408	7	\N	\N	\N	\N	\N	\N
10023	1409	7	\N	\N	\N	\N	\N	\N
10024	1414	7	\N	\N	\N	\N	\N	\N
10025	1418	7	\N	\N	\N	\N	\N	\N
10026	1420	7	\N	\N	\N	\N	\N	\N
10027	1421	7	\N	\N	\N	\N	\N	\N
10028	1423	7	\N	\N	\N	\N	\N	\N
10029	1425	7	\N	\N	\N	\N	\N	\N
10030	1429	7	\N	\N	\N	\N	\N	\N
10031	1434	7	\N	\N	\N	\N	\N	\N
10032	1435	7	\N	\N	\N	\N	\N	\N
10033	1436	7	\N	\N	\N	\N	\N	\N
10034	1437	7	\N	\N	\N	\N	\N	\N
10035	1439	7	\N	\N	\N	\N	\N	\N
10036	1442	7	\N	\N	\N	\N	\N	\N
10037	1447	7	\N	\N	\N	\N	\N	\N
10038	1448	7	\N	\N	\N	\N	\N	\N
10039	1449	7	\N	\N	\N	\N	\N	\N
10040	1454	7	\N	\N	\N	\N	\N	\N
10041	1455	7	\N	\N	\N	\N	\N	\N
10042	1456	7	\N	\N	\N	\N	\N	\N
10043	1457	7	\N	\N	\N	\N	\N	\N
10044	1459	7	\N	\N	\N	\N	\N	\N
10045	1464	7	\N	\N	\N	\N	\N	\N
10046	1465	7	\N	\N	\N	\N	\N	\N
10047	1466	7	\N	\N	\N	\N	\N	\N
10048	1468	7	\N	\N	\N	\N	\N	\N
10049	1469	7	\N	\N	\N	\N	\N	\N
10050	1472	7	\N	\N	\N	\N	\N	\N
10051	1473	7	\N	\N	\N	\N	\N	\N
10052	1474	7	\N	\N	\N	\N	\N	\N
10053	1475	7	\N	\N	\N	\N	\N	\N
10054	1478	7	\N	\N	\N	\N	\N	\N
10055	1480	7	\N	\N	\N	\N	\N	\N
10056	1481	7	\N	\N	\N	\N	\N	\N
10057	1483	7	\N	\N	\N	\N	\N	\N
10058	1485	7	\N	\N	\N	\N	\N	\N
10059	1486	7	\N	\N	\N	\N	\N	\N
10060	1487	7	\N	\N	\N	\N	\N	\N
10061	1489	7	\N	\N	\N	\N	\N	\N
10062	1492	7	\N	\N	\N	\N	\N	\N
10063	1495	7	\N	\N	\N	\N	\N	\N
10064	1496	7	\N	\N	\N	\N	\N	\N
10065	1497	7	\N	\N	\N	\N	\N	\N
10066	1500	7	\N	\N	\N	\N	\N	\N
10067	1501	7	\N	\N	\N	\N	\N	\N
10068	1503	7	\N	\N	\N	\N	\N	\N
10069	1504	7	\N	\N	\N	\N	\N	\N
10070	1505	7	\N	\N	\N	\N	\N	\N
10071	1506	7	\N	\N	\N	\N	\N	\N
10072	1507	7	\N	\N	\N	\N	\N	\N
10073	1509	7	\N	\N	\N	\N	\N	\N
10074	1510	7	\N	\N	\N	\N	\N	\N
10075	1511	7	\N	\N	\N	\N	\N	\N
10076	1513	7	\N	\N	\N	\N	\N	\N
10077	1514	7	\N	\N	\N	\N	\N	\N
10078	1515	7	\N	\N	\N	\N	\N	\N
10079	1518	7	\N	\N	\N	\N	\N	\N
10080	1520	7	\N	\N	\N	\N	\N	\N
10081	1521	7	\N	\N	\N	\N	\N	\N
10082	1522	7	\N	\N	\N	\N	\N	\N
10083	1523	7	\N	\N	\N	\N	\N	\N
10084	1524	7	\N	\N	\N	\N	\N	\N
10085	1525	7	\N	\N	\N	\N	\N	\N
10086	1526	7	\N	\N	\N	\N	\N	\N
10087	1527	7	\N	\N	\N	\N	\N	\N
10088	1528	7	\N	\N	\N	\N	\N	\N
10089	1529	7	\N	\N	\N	\N	\N	\N
10090	1531	7	\N	\N	\N	\N	\N	\N
10091	1533	7	\N	\N	\N	\N	\N	\N
10092	1534	7	\N	\N	\N	\N	\N	\N
10093	1535	7	\N	\N	\N	\N	\N	\N
10094	1539	7	\N	\N	\N	\N	\N	\N
10095	1542	7	\N	\N	\N	\N	\N	\N
10096	1546	7	\N	\N	\N	\N	\N	\N
10097	1548	7	\N	\N	\N	\N	\N	\N
10098	1550	7	\N	\N	\N	\N	\N	\N
10099	1552	7	\N	\N	\N	\N	\N	\N
10100	1554	7	\N	\N	\N	\N	\N	\N
10101	1555	7	\N	\N	\N	\N	\N	\N
10102	1556	7	\N	\N	\N	\N	\N	\N
10103	1558	7	\N	\N	\N	\N	\N	\N
10104	1559	7	\N	\N	\N	\N	\N	\N
10105	1561	7	\N	\N	\N	\N	\N	\N
10106	1562	7	\N	\N	\N	\N	\N	\N
10107	1563	7	\N	\N	\N	\N	\N	\N
10108	1565	7	\N	\N	\N	\N	\N	\N
10109	1566	7	\N	\N	\N	\N	\N	\N
10110	1567	7	\N	\N	\N	\N	\N	\N
10111	1568	7	\N	\N	\N	\N	\N	\N
10112	1570	7	\N	\N	\N	\N	\N	\N
10113	1575	7	\N	\N	\N	\N	\N	\N
10114	1576	7	\N	\N	\N	\N	\N	\N
10115	1577	7	\N	\N	\N	\N	\N	\N
10116	1578	7	\N	\N	\N	\N	\N	\N
10117	1579	7	\N	\N	\N	\N	\N	\N
10118	1581	7	\N	\N	\N	\N	\N	\N
10119	1582	7	\N	\N	\N	\N	\N	\N
10120	1586	7	\N	\N	\N	\N	\N	\N
10121	1587	7	\N	\N	\N	\N	\N	\N
10122	1588	7	\N	\N	\N	\N	\N	\N
10123	1590	7	\N	\N	\N	\N	\N	\N
10124	1592	7	\N	\N	\N	\N	\N	\N
10125	1595	7	\N	\N	\N	\N	\N	\N
10126	1596	7	\N	\N	\N	\N	\N	\N
10127	1597	7	\N	\N	\N	\N	\N	\N
10128	1598	7	\N	\N	\N	\N	\N	\N
10129	1602	7	\N	\N	\N	\N	\N	\N
10130	1603	7	\N	\N	\N	\N	\N	\N
10131	1605	7	\N	\N	\N	\N	\N	\N
10132	1606	7	\N	\N	\N	\N	\N	\N
10133	1607	7	\N	\N	\N	\N	\N	\N
10134	1608	7	\N	\N	\N	\N	\N	\N
10135	1609	7	\N	\N	\N	\N	\N	\N
10136	1611	7	\N	\N	\N	\N	\N	\N
10137	1614	7	\N	\N	\N	\N	\N	\N
10138	1616	7	\N	\N	\N	\N	\N	\N
10139	1617	7	\N	\N	\N	\N	\N	\N
10140	1618	7	\N	\N	\N	\N	\N	\N
10141	1619	7	\N	\N	\N	\N	\N	\N
10142	1623	7	\N	\N	\N	\N	\N	\N
10143	1624	7	\N	\N	\N	\N	\N	\N
10144	1625	7	\N	\N	\N	\N	\N	\N
10145	1626	7	\N	\N	\N	\N	\N	\N
10146	1628	7	\N	\N	\N	\N	\N	\N
10147	1629	7	\N	\N	\N	\N	\N	\N
10148	1630	7	\N	\N	\N	\N	\N	\N
10149	1631	7	\N	\N	\N	\N	\N	\N
10150	1632	7	\N	\N	\N	\N	\N	\N
10151	1636	7	\N	\N	\N	\N	\N	\N
10152	1637	7	\N	\N	\N	\N	\N	\N
10153	1638	7	\N	\N	\N	\N	\N	\N
10154	1640	7	\N	\N	\N	\N	\N	\N
10155	1642	7	\N	\N	\N	\N	\N	\N
10156	1643	7	\N	\N	\N	\N	\N	\N
10157	1644	7	\N	\N	\N	\N	\N	\N
10158	1647	7	\N	\N	\N	\N	\N	\N
10159	1650	7	\N	\N	\N	\N	\N	\N
10160	1651	7	\N	\N	\N	\N	\N	\N
10161	1654	7	\N	\N	\N	\N	\N	\N
10162	1657	7	\N	\N	\N	\N	\N	\N
10163	1658	7	\N	\N	\N	\N	\N	\N
10164	1659	7	\N	\N	\N	\N	\N	\N
10165	1660	7	\N	\N	\N	\N	\N	\N
10166	1662	7	\N	\N	\N	\N	\N	\N
10167	1665	7	\N	\N	\N	\N	\N	\N
10168	1669	7	\N	\N	\N	\N	\N	\N
10169	1670	7	\N	\N	\N	\N	\N	\N
10170	1671	7	\N	\N	\N	\N	\N	\N
10171	1673	7	\N	\N	\N	\N	\N	\N
10172	1674	7	\N	\N	\N	\N	\N	\N
10173	1676	7	\N	\N	\N	\N	\N	\N
10174	1677	7	\N	\N	\N	\N	\N	\N
10175	1678	7	\N	\N	\N	\N	\N	\N
10176	1679	7	\N	\N	\N	\N	\N	\N
10177	1680	7	\N	\N	\N	\N	\N	\N
10178	1681	7	\N	\N	\N	\N	\N	\N
10179	1683	7	\N	\N	\N	\N	\N	\N
10180	1684	7	\N	\N	\N	\N	\N	\N
10181	1685	7	\N	\N	\N	\N	\N	\N
10182	1686	7	\N	\N	\N	\N	\N	\N
10183	1687	7	\N	\N	\N	\N	\N	\N
10184	1688	7	\N	\N	\N	\N	\N	\N
10185	1690	7	\N	\N	\N	\N	\N	\N
10186	1691	7	\N	\N	\N	\N	\N	\N
10187	1693	7	\N	\N	\N	\N	\N	\N
10188	1694	7	\N	\N	\N	\N	\N	\N
10189	1695	7	\N	\N	\N	\N	\N	\N
10190	1697	7	\N	\N	\N	\N	\N	\N
10191	1698	7	\N	\N	\N	\N	\N	\N
10192	1699	7	\N	\N	\N	\N	\N	\N
10193	1700	7	\N	\N	\N	\N	\N	\N
10194	1702	7	\N	\N	\N	\N	\N	\N
10195	1703	7	\N	\N	\N	\N	\N	\N
10196	1704	7	\N	\N	\N	\N	\N	\N
10197	1706	7	\N	\N	\N	\N	\N	\N
10198	1707	7	\N	\N	\N	\N	\N	\N
10199	1708	7	\N	\N	\N	\N	\N	\N
10200	1709	7	\N	\N	\N	\N	\N	\N
10201	1710	7	\N	\N	\N	\N	\N	\N
10202	1711	7	\N	\N	\N	\N	\N	\N
10203	1712	7	\N	\N	\N	\N	\N	\N
10204	1714	7	\N	\N	\N	\N	\N	\N
10205	1715	7	\N	\N	\N	\N	\N	\N
10206	1716	7	\N	\N	\N	\N	\N	\N
10207	1717	7	\N	\N	\N	\N	\N	\N
10208	1719	7	\N	\N	\N	\N	\N	\N
10209	1720	7	\N	\N	\N	\N	\N	\N
10210	1721	7	\N	\N	\N	\N	\N	\N
10211	1722	7	\N	\N	\N	\N	\N	\N
10212	1723	7	\N	\N	\N	\N	\N	\N
10213	1724	7	\N	\N	\N	\N	\N	\N
10214	1726	7	\N	\N	\N	\N	\N	\N
10215	1727	7	\N	\N	\N	\N	\N	\N
10216	1728	7	\N	\N	\N	\N	\N	\N
10217	1729	7	\N	\N	\N	\N	\N	\N
10218	1731	7	\N	\N	\N	\N	\N	\N
10219	1732	7	\N	\N	\N	\N	\N	\N
10220	1733	7	\N	\N	\N	\N	\N	\N
10221	1736	7	\N	\N	\N	\N	\N	\N
10222	1737	7	\N	\N	\N	\N	\N	\N
10223	1738	7	\N	\N	\N	\N	\N	\N
10224	1739	7	\N	\N	\N	\N	\N	\N
10225	1741	7	\N	\N	\N	\N	\N	\N
10226	1742	7	\N	\N	\N	\N	\N	\N
10227	1743	7	\N	\N	\N	\N	\N	\N
10228	1745	7	\N	\N	\N	\N	\N	\N
10229	1746	7	\N	\N	\N	\N	\N	\N
10230	1747	7	\N	\N	\N	\N	\N	\N
10231	1748	7	\N	\N	\N	\N	\N	\N
10232	1750	7	\N	\N	\N	\N	\N	\N
10233	1752	7	\N	\N	\N	\N	\N	\N
10234	1753	7	\N	\N	\N	\N	\N	\N
10235	1754	7	\N	\N	\N	\N	\N	\N
10236	1755	7	\N	\N	\N	\N	\N	\N
10237	1757	7	\N	\N	\N	\N	\N	\N
10238	1758	7	\N	\N	\N	\N	\N	\N
10239	1759	7	\N	\N	\N	\N	\N	\N
10240	1760	7	\N	\N	\N	\N	\N	\N
10241	1762	7	\N	\N	\N	\N	\N	\N
10242	1763	7	\N	\N	\N	\N	\N	\N
10243	1765	7	\N	\N	\N	\N	\N	\N
10244	1767	7	\N	\N	\N	\N	\N	\N
10245	1768	7	\N	\N	\N	\N	\N	\N
10246	1769	7	\N	\N	\N	\N	\N	\N
10247	1771	7	\N	\N	\N	\N	\N	\N
10248	1772	7	\N	\N	\N	\N	\N	\N
10249	1773	7	\N	\N	\N	\N	\N	\N
10250	1774	7	\N	\N	\N	\N	\N	\N
10251	1775	7	\N	\N	\N	\N	\N	\N
10252	1776	7	\N	\N	\N	\N	\N	\N
10253	1777	7	\N	\N	\N	\N	\N	\N
10254	1778	7	\N	\N	\N	\N	\N	\N
10255	1779	7	\N	\N	\N	\N	\N	\N
10256	1781	7	\N	\N	\N	\N	\N	\N
10257	1782	7	\N	\N	\N	\N	\N	\N
10258	1783	7	\N	\N	\N	\N	\N	\N
10259	1784	7	\N	\N	\N	\N	\N	\N
10260	1785	7	\N	\N	\N	\N	\N	\N
10261	1786	7	\N	\N	\N	\N	\N	\N
10262	1787	7	\N	\N	\N	\N	\N	\N
10263	1788	7	\N	\N	\N	\N	\N	\N
10264	1789	7	\N	\N	\N	\N	\N	\N
10265	1790	7	\N	\N	\N	\N	\N	\N
10266	1792	7	\N	\N	\N	\N	\N	\N
10267	1793	7	\N	\N	\N	\N	\N	\N
10268	1795	7	\N	\N	\N	\N	\N	\N
10269	1797	7	\N	\N	\N	\N	\N	\N
10270	1798	7	\N	\N	\N	\N	\N	\N
10271	1799	7	\N	\N	\N	\N	\N	\N
10272	1801	7	\N	\N	\N	\N	\N	\N
10273	1803	7	\N	\N	\N	\N	\N	\N
10274	1805	7	\N	\N	\N	\N	\N	\N
10275	1807	7	\N	\N	\N	\N	\N	\N
10276	1808	7	\N	\N	\N	\N	\N	\N
10277	1809	7	\N	\N	\N	\N	\N	\N
10278	1810	7	\N	\N	\N	\N	\N	\N
10279	1811	7	\N	\N	\N	\N	\N	\N
10280	1812	7	\N	\N	\N	\N	\N	\N
10281	1814	7	\N	\N	\N	\N	\N	\N
10282	1815	7	\N	\N	\N	\N	\N	\N
10283	1816	7	\N	\N	\N	\N	\N	\N
10284	1817	7	\N	\N	\N	\N	\N	\N
10285	1818	7	\N	\N	\N	\N	\N	\N
10286	1819	7	\N	\N	\N	\N	\N	\N
10287	1824	7	\N	\N	\N	\N	\N	\N
10288	1825	7	\N	\N	\N	\N	\N	\N
10289	1826	7	\N	\N	\N	\N	\N	\N
10290	1828	7	\N	\N	\N	\N	\N	\N
10291	1830	7	\N	\N	\N	\N	\N	\N
10292	1831	7	\N	\N	\N	\N	\N	\N
10293	1832	7	\N	\N	\N	\N	\N	\N
10294	1833	7	\N	\N	\N	\N	\N	\N
10295	1834	7	\N	\N	\N	\N	\N	\N
10296	1835	7	\N	\N	\N	\N	\N	\N
10297	1836	7	\N	\N	\N	\N	\N	\N
10298	1837	7	\N	\N	\N	\N	\N	\N
10299	1838	7	\N	\N	\N	\N	\N	\N
10300	1839	7	\N	\N	\N	\N	\N	\N
10301	1840	7	\N	\N	\N	\N	\N	\N
10302	1841	7	\N	\N	\N	\N	\N	\N
10303	1842	7	\N	\N	\N	\N	\N	\N
10304	1843	7	\N	\N	\N	\N	\N	\N
10305	1845	7	\N	\N	\N	\N	\N	\N
10306	1846	7	\N	\N	\N	\N	\N	\N
10307	1847	7	\N	\N	\N	\N	\N	\N
10308	1848	7	\N	\N	\N	\N	\N	\N
10309	1849	7	\N	\N	\N	\N	\N	\N
10310	1850	7	\N	\N	\N	\N	\N	\N
10311	1851	7	\N	\N	\N	\N	\N	\N
10312	1852	7	\N	\N	\N	\N	\N	\N
10313	1853	7	\N	\N	\N	\N	\N	\N
10314	1856	7	\N	\N	\N	\N	\N	\N
10315	1857	7	\N	\N	\N	\N	\N	\N
10316	1861	7	\N	\N	\N	\N	\N	\N
10317	1863	7	\N	\N	\N	\N	\N	\N
10318	1864	7	\N	\N	\N	\N	\N	\N
10319	1865	7	\N	\N	\N	\N	\N	\N
10320	1866	7	\N	\N	\N	\N	\N	\N
10321	1869	7	\N	\N	\N	\N	\N	\N
10322	1871	7	\N	\N	\N	\N	\N	\N
10323	1872	7	\N	\N	\N	\N	\N	\N
10324	1873	7	\N	\N	\N	\N	\N	\N
10325	1876	7	\N	\N	\N	\N	\N	\N
10326	1877	7	\N	\N	\N	\N	\N	\N
10327	1878	7	\N	\N	\N	\N	\N	\N
10328	1881	7	\N	\N	\N	\N	\N	\N
10329	1882	7	\N	\N	\N	\N	\N	\N
10330	1883	7	\N	\N	\N	\N	\N	\N
10331	1884	7	\N	\N	\N	\N	\N	\N
10332	1885	7	\N	\N	\N	\N	\N	\N
10333	1886	7	\N	\N	\N	\N	\N	\N
10334	1887	7	\N	\N	\N	\N	\N	\N
10335	1888	7	\N	\N	\N	\N	\N	\N
10336	1889	7	\N	\N	\N	\N	\N	\N
10337	1890	7	\N	\N	\N	\N	\N	\N
10338	1894	7	\N	\N	\N	\N	\N	\N
10339	1896	7	\N	\N	\N	\N	\N	\N
10340	1897	7	\N	\N	\N	\N	\N	\N
10341	1898	7	\N	\N	\N	\N	\N	\N
10342	1899	7	\N	\N	\N	\N	\N	\N
10343	1900	7	\N	\N	\N	\N	\N	\N
10344	1902	7	\N	\N	\N	\N	\N	\N
10345	1903	7	\N	\N	\N	\N	\N	\N
10346	1904	7	\N	\N	\N	\N	\N	\N
10347	1905	7	\N	\N	\N	\N	\N	\N
10348	1907	7	\N	\N	\N	\N	\N	\N
10349	1908	7	\N	\N	\N	\N	\N	\N
10350	1910	7	\N	\N	\N	\N	\N	\N
10351	1912	7	\N	\N	\N	\N	\N	\N
10352	1913	7	\N	\N	\N	\N	\N	\N
10353	1915	7	\N	\N	\N	\N	\N	\N
10354	1916	7	\N	\N	\N	\N	\N	\N
10355	1917	7	\N	\N	\N	\N	\N	\N
10356	1918	7	\N	\N	\N	\N	\N	\N
10357	1920	7	\N	\N	\N	\N	\N	\N
10358	1921	7	\N	\N	\N	\N	\N	\N
10359	1922	7	\N	\N	\N	\N	\N	\N
10360	1923	7	\N	\N	\N	\N	\N	\N
10361	1925	7	\N	\N	\N	\N	\N	\N
10362	1926	7	\N	\N	\N	\N	\N	\N
10363	1927	7	\N	\N	\N	\N	\N	\N
10364	1930	7	\N	\N	\N	\N	\N	\N
10365	1931	7	\N	\N	\N	\N	\N	\N
10366	1933	7	\N	\N	\N	\N	\N	\N
10367	1934	7	\N	\N	\N	\N	\N	\N
10368	1935	7	\N	\N	\N	\N	\N	\N
10369	1937	7	\N	\N	\N	\N	\N	\N
10370	1938	7	\N	\N	\N	\N	\N	\N
10371	1942	7	\N	\N	\N	\N	\N	\N
10372	1943	7	\N	\N	\N	\N	\N	\N
10373	1945	7	\N	\N	\N	\N	\N	\N
10374	1946	7	\N	\N	\N	\N	\N	\N
10375	1947	7	\N	\N	\N	\N	\N	\N
10376	1948	7	\N	\N	\N	\N	\N	\N
10377	1949	7	\N	\N	\N	\N	\N	\N
10378	1950	7	\N	\N	\N	\N	\N	\N
10379	1951	7	\N	\N	\N	\N	\N	\N
10380	1952	7	\N	\N	\N	\N	\N	\N
10381	1954	7	\N	\N	\N	\N	\N	\N
10382	1955	7	\N	\N	\N	\N	\N	\N
10383	1956	7	\N	\N	\N	\N	\N	\N
10384	1958	7	\N	\N	\N	\N	\N	\N
10385	1959	7	\N	\N	\N	\N	\N	\N
10386	1961	7	\N	\N	\N	\N	\N	\N
10387	1962	7	\N	\N	\N	\N	\N	\N
10388	1963	7	\N	\N	\N	\N	\N	\N
10389	1964	7	\N	\N	\N	\N	\N	\N
10390	1965	7	\N	\N	\N	\N	\N	\N
10391	1966	7	\N	\N	\N	\N	\N	\N
10392	1967	7	\N	\N	\N	\N	\N	\N
10393	1968	7	\N	\N	\N	\N	\N	\N
10394	1969	7	\N	\N	\N	\N	\N	\N
10395	1970	7	\N	\N	\N	\N	\N	\N
10396	1971	7	\N	\N	\N	\N	\N	\N
10397	1973	7	\N	\N	\N	\N	\N	\N
10398	1974	7	\N	\N	\N	\N	\N	\N
10399	1975	7	\N	\N	\N	\N	\N	\N
10400	1976	7	\N	\N	\N	\N	\N	\N
10401	1979	7	\N	\N	\N	\N	\N	\N
10402	1980	7	\N	\N	\N	\N	\N	\N
10403	1981	7	\N	\N	\N	\N	\N	\N
10404	1982	7	\N	\N	\N	\N	\N	\N
10405	1983	7	\N	\N	\N	\N	\N	\N
10406	1984	7	\N	\N	\N	\N	\N	\N
10407	1985	7	\N	\N	\N	\N	\N	\N
10408	1986	7	\N	\N	\N	\N	\N	\N
10409	1987	7	\N	\N	\N	\N	\N	\N
10410	1988	7	\N	\N	\N	\N	\N	\N
10411	1989	7	\N	\N	\N	\N	\N	\N
10412	1990	7	\N	\N	\N	\N	\N	\N
10413	1991	7	\N	\N	\N	\N	\N	\N
10414	1993	7	\N	\N	\N	\N	\N	\N
10415	1994	7	\N	\N	\N	\N	\N	\N
10416	1995	7	\N	\N	\N	\N	\N	\N
10417	1996	7	\N	\N	\N	\N	\N	\N
10418	1998	7	\N	\N	\N	\N	\N	\N
10419	1999	7	\N	\N	\N	\N	\N	\N
10420	2000	7	\N	\N	\N	\N	\N	\N
10421	2001	7	\N	\N	\N	\N	\N	\N
10422	2002	7	\N	\N	\N	\N	\N	\N
10423	2004	7	\N	\N	\N	\N	\N	\N
10424	2005	7	\N	\N	\N	\N	\N	\N
10425	2006	7	\N	\N	\N	\N	\N	\N
10426	2007	7	\N	\N	\N	\N	\N	\N
10427	2008	7	\N	\N	\N	\N	\N	\N
10428	2009	7	\N	\N	\N	\N	\N	\N
10429	2010	7	\N	\N	\N	\N	\N	\N
10430	2011	7	\N	\N	\N	\N	\N	\N
10431	2012	7	\N	\N	\N	\N	\N	\N
10432	2013	7	\N	\N	\N	\N	\N	\N
10433	2015	7	\N	\N	\N	\N	\N	\N
10434	2017	7	\N	\N	\N	\N	\N	\N
10435	2018	7	\N	\N	\N	\N	\N	\N
10436	2019	7	\N	\N	\N	\N	\N	\N
10437	2021	7	\N	\N	\N	\N	\N	\N
10438	2022	7	\N	\N	\N	\N	\N	\N
10439	2024	7	\N	\N	\N	\N	\N	\N
10440	2025	7	\N	\N	\N	\N	\N	\N
10441	2026	7	\N	\N	\N	\N	\N	\N
10442	2027	7	\N	\N	\N	\N	\N	\N
10443	2029	7	\N	\N	\N	\N	\N	\N
10444	2030	7	\N	\N	\N	\N	\N	\N
10445	2031	7	\N	\N	\N	\N	\N	\N
10446	2032	7	\N	\N	\N	\N	\N	\N
10447	2033	7	\N	\N	\N	\N	\N	\N
10448	2034	7	\N	\N	\N	\N	\N	\N
10449	2036	7	\N	\N	\N	\N	\N	\N
10450	2037	7	\N	\N	\N	\N	\N	\N
10451	2038	7	\N	\N	\N	\N	\N	\N
10452	2039	7	\N	\N	\N	\N	\N	\N
10453	2040	7	\N	\N	\N	\N	\N	\N
10454	2041	7	\N	\N	\N	\N	\N	\N
10455	2042	7	\N	\N	\N	\N	\N	\N
10456	2043	7	\N	\N	\N	\N	\N	\N
10457	2044	7	\N	\N	\N	\N	\N	\N
10458	2045	7	\N	\N	\N	\N	\N	\N
10459	2046	7	\N	\N	\N	\N	\N	\N
10460	2047	7	\N	\N	\N	\N	\N	\N
10461	2048	7	\N	\N	\N	\N	\N	\N
10462	2049	7	\N	\N	\N	\N	\N	\N
10463	2050	7	\N	\N	\N	\N	\N	\N
10464	2051	7	\N	\N	\N	\N	\N	\N
10465	2053	7	\N	\N	\N	\N	\N	\N
10466	2054	7	\N	\N	\N	\N	\N	\N
10467	2055	7	\N	\N	\N	\N	\N	\N
10468	2056	7	\N	\N	\N	\N	\N	\N
10469	2057	7	\N	\N	\N	\N	\N	\N
10470	2058	7	\N	\N	\N	\N	\N	\N
10471	2059	7	\N	\N	\N	\N	\N	\N
10472	2060	7	\N	\N	\N	\N	\N	\N
10473	2061	7	\N	\N	\N	\N	\N	\N
10474	2062	7	\N	\N	\N	\N	\N	\N
10475	2063	7	\N	\N	\N	\N	\N	\N
10476	2064	7	\N	\N	\N	\N	\N	\N
10477	2065	7	\N	\N	\N	\N	\N	\N
10478	2066	7	\N	\N	\N	\N	\N	\N
10479	2067	7	\N	\N	\N	\N	\N	\N
10480	2069	7	\N	\N	\N	\N	\N	\N
10481	2070	7	\N	\N	\N	\N	\N	\N
10482	2071	7	\N	\N	\N	\N	\N	\N
10483	2072	7	\N	\N	\N	\N	\N	\N
10484	2074	7	\N	\N	\N	\N	\N	\N
10485	2076	7	\N	\N	\N	\N	\N	\N
10486	2077	7	\N	\N	\N	\N	\N	\N
10487	2078	7	\N	\N	\N	\N	\N	\N
10488	2079	7	\N	\N	\N	\N	\N	\N
10489	2080	7	\N	\N	\N	\N	\N	\N
10490	2081	7	\N	\N	\N	\N	\N	\N
10491	2082	7	\N	\N	\N	\N	\N	\N
10492	2083	7	\N	\N	\N	\N	\N	\N
10493	2087	7	\N	\N	\N	\N	\N	\N
10494	2088	7	\N	\N	\N	\N	\N	\N
10495	2089	7	\N	\N	\N	\N	\N	\N
10496	2090	7	\N	\N	\N	\N	\N	\N
10497	2091	7	\N	\N	\N	\N	\N	\N
10498	2092	7	\N	\N	\N	\N	\N	\N
10499	2093	7	\N	\N	\N	\N	\N	\N
10500	2094	7	\N	\N	\N	\N	\N	\N
10501	2095	7	\N	\N	\N	\N	\N	\N
10502	2096	7	\N	\N	\N	\N	\N	\N
10503	2098	7	\N	\N	\N	\N	\N	\N
10504	2099	7	\N	\N	\N	\N	\N	\N
10505	2100	7	\N	\N	\N	\N	\N	\N
10506	2101	7	\N	\N	\N	\N	\N	\N
10507	2103	7	\N	\N	\N	\N	\N	\N
10508	2104	7	\N	\N	\N	\N	\N	\N
10509	2105	7	\N	\N	\N	\N	\N	\N
10510	2106	7	\N	\N	\N	\N	\N	\N
10511	2107	7	\N	\N	\N	\N	\N	\N
10512	2109	7	\N	\N	\N	\N	\N	\N
10513	2110	7	\N	\N	\N	\N	\N	\N
10514	2112	7	\N	\N	\N	\N	\N	\N
10515	2114	7	\N	\N	\N	\N	\N	\N
10516	2115	7	\N	\N	\N	\N	\N	\N
10517	2117	7	\N	\N	\N	\N	\N	\N
10518	2118	7	\N	\N	\N	\N	\N	\N
10519	2119	7	\N	\N	\N	\N	\N	\N
10520	2120	7	\N	\N	\N	\N	\N	\N
10521	2122	7	\N	\N	\N	\N	\N	\N
10522	2123	7	\N	\N	\N	\N	\N	\N
10523	2124	7	\N	\N	\N	\N	\N	\N
10524	2125	7	\N	\N	\N	\N	\N	\N
10525	2126	7	\N	\N	\N	\N	\N	\N
10526	2127	7	\N	\N	\N	\N	\N	\N
10527	2129	7	\N	\N	\N	\N	\N	\N
10528	2130	7	\N	\N	\N	\N	\N	\N
10529	2132	7	\N	\N	\N	\N	\N	\N
10530	2134	7	\N	\N	\N	\N	\N	\N
10531	2135	7	\N	\N	\N	\N	\N	\N
10532	2136	7	\N	\N	\N	\N	\N	\N
10533	2137	7	\N	\N	\N	\N	\N	\N
10534	2138	7	\N	\N	\N	\N	\N	\N
10535	2139	7	\N	\N	\N	\N	\N	\N
10536	2142	7	\N	\N	\N	\N	\N	\N
10537	2143	7	\N	\N	\N	\N	\N	\N
10538	2144	7	\N	\N	\N	\N	\N	\N
10539	2146	7	\N	\N	\N	\N	\N	\N
10540	2147	7	\N	\N	\N	\N	\N	\N
10541	2148	7	\N	\N	\N	\N	\N	\N
10542	2149	7	\N	\N	\N	\N	\N	\N
10543	2150	7	\N	\N	\N	\N	\N	\N
10544	2151	7	\N	\N	\N	\N	\N	\N
10545	2152	7	\N	\N	\N	\N	\N	\N
10546	2153	7	\N	\N	\N	\N	\N	\N
10547	2157	7	\N	\N	\N	\N	\N	\N
10548	2158	7	\N	\N	\N	\N	\N	\N
10549	2159	7	\N	\N	\N	\N	\N	\N
10550	2160	7	\N	\N	\N	\N	\N	\N
10551	2161	7	\N	\N	\N	\N	\N	\N
10552	2162	7	\N	\N	\N	\N	\N	\N
10553	2163	7	\N	\N	\N	\N	\N	\N
10554	2165	7	\N	\N	\N	\N	\N	\N
10555	2166	7	\N	\N	\N	\N	\N	\N
10556	2167	7	\N	\N	\N	\N	\N	\N
10557	2168	7	\N	\N	\N	\N	\N	\N
10558	2170	7	\N	\N	\N	\N	\N	\N
10559	2171	7	\N	\N	\N	\N	\N	\N
10560	2172	7	\N	\N	\N	\N	\N	\N
10561	2173	7	\N	\N	\N	\N	\N	\N
10562	2174	7	\N	\N	\N	\N	\N	\N
10563	2175	7	\N	\N	\N	\N	\N	\N
10564	2176	7	\N	\N	\N	\N	\N	\N
10565	2177	7	\N	\N	\N	\N	\N	\N
10566	2178	7	\N	\N	\N	\N	\N	\N
10567	2179	7	\N	\N	\N	\N	\N	\N
10568	2180	7	\N	\N	\N	\N	\N	\N
10569	2181	7	\N	\N	\N	\N	\N	\N
10570	2182	7	\N	\N	\N	\N	\N	\N
10571	2183	7	\N	\N	\N	\N	\N	\N
10572	2184	7	\N	\N	\N	\N	\N	\N
10573	2185	7	\N	\N	\N	\N	\N	\N
10574	2187	7	\N	\N	\N	\N	\N	\N
10575	2189	7	\N	\N	\N	\N	\N	\N
10576	2190	7	\N	\N	\N	\N	\N	\N
10577	2191	7	\N	\N	\N	\N	\N	\N
10578	2192	7	\N	\N	\N	\N	\N	\N
10579	2193	7	\N	\N	\N	\N	\N	\N
10580	2194	7	\N	\N	\N	\N	\N	\N
10581	2196	7	\N	\N	\N	\N	\N	\N
10582	2198	7	\N	\N	\N	\N	\N	\N
10583	2199	7	\N	\N	\N	\N	\N	\N
10584	2200	7	\N	\N	\N	\N	\N	\N
10585	2201	7	\N	\N	\N	\N	\N	\N
10586	2202	7	\N	\N	\N	\N	\N	\N
10587	2204	7	\N	\N	\N	\N	\N	\N
10588	2205	7	\N	\N	\N	\N	\N	\N
10589	2207	7	\N	\N	\N	\N	\N	\N
10590	2208	7	\N	\N	\N	\N	\N	\N
10591	2209	7	\N	\N	\N	\N	\N	\N
10592	2211	7	\N	\N	\N	\N	\N	\N
10593	2212	7	\N	\N	\N	\N	\N	\N
10594	2213	7	\N	\N	\N	\N	\N	\N
10595	2214	7	\N	\N	\N	\N	\N	\N
10596	2215	7	\N	\N	\N	\N	\N	\N
10597	2217	7	\N	\N	\N	\N	\N	\N
10598	2218	7	\N	\N	\N	\N	\N	\N
10599	2219	7	\N	\N	\N	\N	\N	\N
10600	2221	7	\N	\N	\N	\N	\N	\N
10601	2222	7	\N	\N	\N	\N	\N	\N
10602	2223	7	\N	\N	\N	\N	\N	\N
10603	2224	7	\N	\N	\N	\N	\N	\N
10604	2225	7	\N	\N	\N	\N	\N	\N
10605	2228	7	\N	\N	\N	\N	\N	\N
10606	2229	7	\N	\N	\N	\N	\N	\N
10607	2230	7	\N	\N	\N	\N	\N	\N
10608	2231	7	\N	\N	\N	\N	\N	\N
10609	2232	7	\N	\N	\N	\N	\N	\N
10610	2235	7	\N	\N	\N	\N	\N	\N
10611	2236	7	\N	\N	\N	\N	\N	\N
10612	2237	7	\N	\N	\N	\N	\N	\N
10613	2239	7	\N	\N	\N	\N	\N	\N
10614	2240	7	\N	\N	\N	\N	\N	\N
10615	2241	7	\N	\N	\N	\N	\N	\N
10616	2242	7	\N	\N	\N	\N	\N	\N
10617	2243	7	\N	\N	\N	\N	\N	\N
10618	2244	7	\N	\N	\N	\N	\N	\N
10619	2245	7	\N	\N	\N	\N	\N	\N
10620	2246	7	\N	\N	\N	\N	\N	\N
10621	2247	7	\N	\N	\N	\N	\N	\N
10622	2248	7	\N	\N	\N	\N	\N	\N
10623	2249	7	\N	\N	\N	\N	\N	\N
10624	2250	7	\N	\N	\N	\N	\N	\N
10625	2251	7	\N	\N	\N	\N	\N	\N
10626	2253	7	\N	\N	\N	\N	\N	\N
10627	2255	7	\N	\N	\N	\N	\N	\N
10628	2256	7	\N	\N	\N	\N	\N	\N
10629	2257	7	\N	\N	\N	\N	\N	\N
10630	2258	7	\N	\N	\N	\N	\N	\N
10631	2259	7	\N	\N	\N	\N	\N	\N
10632	2260	7	\N	\N	\N	\N	\N	\N
10633	2261	7	\N	\N	\N	\N	\N	\N
10634	2262	7	\N	\N	\N	\N	\N	\N
10635	2263	7	\N	\N	\N	\N	\N	\N
10636	2264	7	\N	\N	\N	\N	\N	\N
10637	2265	7	\N	\N	\N	\N	\N	\N
10638	2266	7	\N	\N	\N	\N	\N	\N
10639	2267	7	\N	\N	\N	\N	\N	\N
10640	2268	7	\N	\N	\N	\N	\N	\N
10641	2269	7	\N	\N	\N	\N	\N	\N
10642	2270	7	\N	\N	\N	\N	\N	\N
10643	2271	7	\N	\N	\N	\N	\N	\N
10644	2272	7	\N	\N	\N	\N	\N	\N
10645	2273	7	\N	\N	\N	\N	\N	\N
10646	2274	7	\N	\N	\N	\N	\N	\N
10647	2275	7	\N	\N	\N	\N	\N	\N
10648	2276	7	\N	\N	\N	\N	\N	\N
10649	2277	7	\N	\N	\N	\N	\N	\N
10650	2278	7	\N	\N	\N	\N	\N	\N
10651	2279	7	\N	\N	\N	\N	\N	\N
10652	2280	7	\N	\N	\N	\N	\N	\N
10653	2281	7	\N	\N	\N	\N	\N	\N
10654	2282	7	\N	\N	\N	\N	\N	\N
10655	2283	7	\N	\N	\N	\N	\N	\N
10656	2284	7	\N	\N	\N	\N	\N	\N
10657	2285	7	\N	\N	\N	\N	\N	\N
10658	2286	7	\N	\N	\N	\N	\N	\N
10659	2287	7	\N	\N	\N	\N	\N	\N
10660	2288	7	\N	\N	\N	\N	\N	\N
10661	2289	7	\N	\N	\N	\N	\N	\N
10662	2290	7	\N	\N	\N	\N	\N	\N
10663	2291	7	\N	\N	\N	\N	\N	\N
10664	2293	7	\N	\N	\N	\N	\N	\N
10665	2295	7	\N	\N	\N	\N	\N	\N
10666	2296	7	\N	\N	\N	\N	\N	\N
10667	2297	7	\N	\N	\N	\N	\N	\N
10668	2298	7	\N	\N	\N	\N	\N	\N
10669	2299	7	\N	\N	\N	\N	\N	\N
10670	2300	7	\N	\N	\N	\N	\N	\N
10671	2303	7	\N	\N	\N	\N	\N	\N
10672	2304	7	\N	\N	\N	\N	\N	\N
10673	2305	7	\N	\N	\N	\N	\N	\N
10674	2306	7	\N	\N	\N	\N	\N	\N
10675	2307	7	\N	\N	\N	\N	\N	\N
10676	2308	7	\N	\N	\N	\N	\N	\N
10677	2309	7	\N	\N	\N	\N	\N	\N
10678	2310	7	\N	\N	\N	\N	\N	\N
10679	2311	7	\N	\N	\N	\N	\N	\N
10680	2312	7	\N	\N	\N	\N	\N	\N
10681	2313	7	\N	\N	\N	\N	\N	\N
10682	2314	7	\N	\N	\N	\N	\N	\N
10683	2315	7	\N	\N	\N	\N	\N	\N
10684	2316	7	\N	\N	\N	\N	\N	\N
10685	2317	7	\N	\N	\N	\N	\N	\N
10686	2318	7	\N	\N	\N	\N	\N	\N
10687	2320	7	\N	\N	\N	\N	\N	\N
10688	2321	7	\N	\N	\N	\N	\N	\N
10689	2323	7	\N	\N	\N	\N	\N	\N
10690	2324	7	\N	\N	\N	\N	\N	\N
10691	2325	7	\N	\N	\N	\N	\N	\N
10692	2327	7	\N	\N	\N	\N	\N	\N
10693	2329	7	\N	\N	\N	\N	\N	\N
10694	2330	7	\N	\N	\N	\N	\N	\N
10695	2331	7	\N	\N	\N	\N	\N	\N
10696	2332	7	\N	\N	\N	\N	\N	\N
10697	2333	7	\N	\N	\N	\N	\N	\N
10698	2334	7	\N	\N	\N	\N	\N	\N
10699	2335	7	\N	\N	\N	\N	\N	\N
10700	2336	7	\N	\N	\N	\N	\N	\N
10701	2337	7	\N	\N	\N	\N	\N	\N
10702	2338	7	\N	\N	\N	\N	\N	\N
10703	2340	7	\N	\N	\N	\N	\N	\N
10704	2341	7	\N	\N	\N	\N	\N	\N
10705	2342	7	\N	\N	\N	\N	\N	\N
10706	2343	7	\N	\N	\N	\N	\N	\N
10707	2344	7	\N	\N	\N	\N	\N	\N
10708	2345	7	\N	\N	\N	\N	\N	\N
10709	2346	7	\N	\N	\N	\N	\N	\N
10710	2347	7	\N	\N	\N	\N	\N	\N
10711	2348	7	\N	\N	\N	\N	\N	\N
10712	2349	7	\N	\N	\N	\N	\N	\N
10713	2350	7	\N	\N	\N	\N	\N	\N
10714	2351	7	\N	\N	\N	\N	\N	\N
10715	2352	7	\N	\N	\N	\N	\N	\N
10716	2353	7	\N	\N	\N	\N	\N	\N
10717	2354	7	\N	\N	\N	\N	\N	\N
10718	2355	7	\N	\N	\N	\N	\N	\N
10719	2356	7	\N	\N	\N	\N	\N	\N
10720	2357	7	\N	\N	\N	\N	\N	\N
10721	2358	7	\N	\N	\N	\N	\N	\N
10722	2359	7	\N	\N	\N	\N	\N	\N
10723	2360	7	\N	\N	\N	\N	\N	\N
10724	2361	7	\N	\N	\N	\N	\N	\N
10725	2362	7	\N	\N	\N	\N	\N	\N
10726	2363	7	\N	\N	\N	\N	\N	\N
10727	2364	7	\N	\N	\N	\N	\N	\N
10728	2366	7	\N	\N	\N	\N	\N	\N
10729	2367	7	\N	\N	\N	\N	\N	\N
10730	2368	7	\N	\N	\N	\N	\N	\N
10731	2369	7	\N	\N	\N	\N	\N	\N
10732	2370	7	\N	\N	\N	\N	\N	\N
10733	2371	7	\N	\N	\N	\N	\N	\N
10734	2372	7	\N	\N	\N	\N	\N	\N
10735	2373	7	\N	\N	\N	\N	\N	\N
10736	2374	7	\N	\N	\N	\N	\N	\N
10737	2375	7	\N	\N	\N	\N	\N	\N
10738	2376	7	\N	\N	\N	\N	\N	\N
10739	2377	7	\N	\N	\N	\N	\N	\N
10740	2378	7	\N	\N	\N	\N	\N	\N
10741	2379	7	\N	\N	\N	\N	\N	\N
10742	2380	7	\N	\N	\N	\N	\N	\N
10743	2381	7	\N	\N	\N	\N	\N	\N
10744	2382	7	\N	\N	\N	\N	\N	\N
10745	2383	7	\N	\N	\N	\N	\N	\N
10746	2384	7	\N	\N	\N	\N	\N	\N
10747	2385	7	\N	\N	\N	\N	\N	\N
10748	2386	7	\N	\N	\N	\N	\N	\N
10749	2387	7	\N	\N	\N	\N	\N	\N
10750	2389	7	\N	\N	\N	\N	\N	\N
10751	2390	7	\N	\N	\N	\N	\N	\N
10752	2391	7	\N	\N	\N	\N	\N	\N
10753	2392	7	\N	\N	\N	\N	\N	\N
10754	2394	7	\N	\N	\N	\N	\N	\N
10755	2395	7	\N	\N	\N	\N	\N	\N
10756	2396	7	\N	\N	\N	\N	\N	\N
10757	2397	7	\N	\N	\N	\N	\N	\N
10758	2398	7	\N	\N	\N	\N	\N	\N
10759	2399	7	\N	\N	\N	\N	\N	\N
10760	2400	7	\N	\N	\N	\N	\N	\N
10761	2402	7	\N	\N	\N	\N	\N	\N
10762	2403	7	\N	\N	\N	\N	\N	\N
10763	2404	7	\N	\N	\N	\N	\N	\N
10764	2405	7	\N	\N	\N	\N	\N	\N
10765	2406	7	\N	\N	\N	\N	\N	\N
10766	2407	7	\N	\N	\N	\N	\N	\N
10767	2408	7	\N	\N	\N	\N	\N	\N
10768	2409	7	\N	\N	\N	\N	\N	\N
10769	2410	7	\N	\N	\N	\N	\N	\N
10770	2411	7	\N	\N	\N	\N	\N	\N
10771	2412	7	\N	\N	\N	\N	\N	\N
10772	2413	7	\N	\N	\N	\N	\N	\N
10773	2414	7	\N	\N	\N	\N	\N	\N
10774	2415	7	\N	\N	\N	\N	\N	\N
10775	2416	7	\N	\N	\N	\N	\N	\N
10776	2418	7	\N	\N	\N	\N	\N	\N
10777	2419	7	\N	\N	\N	\N	\N	\N
10778	2420	7	\N	\N	\N	\N	\N	\N
10779	2421	7	\N	\N	\N	\N	\N	\N
10780	2422	7	\N	\N	\N	\N	\N	\N
10781	2423	7	\N	\N	\N	\N	\N	\N
10782	2424	7	\N	\N	\N	\N	\N	\N
10783	2425	7	\N	\N	\N	\N	\N	\N
10784	2426	7	\N	\N	\N	\N	\N	\N
10785	2427	7	\N	\N	\N	\N	\N	\N
10786	2428	7	\N	\N	\N	\N	\N	\N
10787	2429	7	\N	\N	\N	\N	\N	\N
10788	2430	7	\N	\N	\N	\N	\N	\N
10789	2432	7	\N	\N	\N	\N	\N	\N
10790	2433	7	\N	\N	\N	\N	\N	\N
10791	2434	7	\N	\N	\N	\N	\N	\N
10792	2435	7	\N	\N	\N	\N	\N	\N
10793	2436	7	\N	\N	\N	\N	\N	\N
10794	2437	7	\N	\N	\N	\N	\N	\N
10795	2438	7	\N	\N	\N	\N	\N	\N
10796	2439	7	\N	\N	\N	\N	\N	\N
10797	2440	7	\N	\N	\N	\N	\N	\N
10798	2441	7	\N	\N	\N	\N	\N	\N
10799	2443	7	\N	\N	\N	\N	\N	\N
10800	2444	7	\N	\N	\N	\N	\N	\N
10801	2445	7	\N	\N	\N	\N	\N	\N
10802	2446	7	\N	\N	\N	\N	\N	\N
10803	2447	7	\N	\N	\N	\N	\N	\N
10804	2448	7	\N	\N	\N	\N	\N	\N
10805	2450	7	\N	\N	\N	\N	\N	\N
10806	2452	7	\N	\N	\N	\N	\N	\N
10807	2453	7	\N	\N	\N	\N	\N	\N
10808	2454	7	\N	\N	\N	\N	\N	\N
10809	2455	7	\N	\N	\N	\N	\N	\N
10810	2456	7	\N	\N	\N	\N	\N	\N
10811	2457	7	\N	\N	\N	\N	\N	\N
10812	2458	7	\N	\N	\N	\N	\N	\N
10813	2459	7	\N	\N	\N	\N	\N	\N
10814	2460	7	\N	\N	\N	\N	\N	\N
10815	2461	7	\N	\N	\N	\N	\N	\N
10816	2462	7	\N	\N	\N	\N	\N	\N
10817	2464	7	\N	\N	\N	\N	\N	\N
10818	2465	7	\N	\N	\N	\N	\N	\N
10819	2466	7	\N	\N	\N	\N	\N	\N
10820	2467	7	\N	\N	\N	\N	\N	\N
10821	2468	7	\N	\N	\N	\N	\N	\N
10822	2469	7	\N	\N	\N	\N	\N	\N
10823	2470	7	\N	\N	\N	\N	\N	\N
10824	2471	7	\N	\N	\N	\N	\N	\N
10825	2472	7	\N	\N	\N	\N	\N	\N
10826	2473	7	\N	\N	\N	\N	\N	\N
10827	2474	7	\N	\N	\N	\N	\N	\N
10828	2475	7	\N	\N	\N	\N	\N	\N
10829	2476	7	\N	\N	\N	\N	\N	\N
10830	2477	7	\N	\N	\N	\N	\N	\N
10831	2478	7	\N	\N	\N	\N	\N	\N
10832	2479	7	\N	\N	\N	\N	\N	\N
10833	2480	7	\N	\N	\N	\N	\N	\N
10834	2481	7	\N	\N	\N	\N	\N	\N
10835	2482	7	\N	\N	\N	\N	\N	\N
10836	2483	7	\N	\N	\N	\N	\N	\N
10837	2484	7	\N	\N	\N	\N	\N	\N
10838	2485	7	\N	\N	\N	\N	\N	\N
10839	2486	7	\N	\N	\N	\N	\N	\N
10840	2487	7	\N	\N	\N	\N	\N	\N
10841	2488	7	\N	\N	\N	\N	\N	\N
10842	2489	7	\N	\N	\N	\N	\N	\N
10843	2490	7	\N	\N	\N	\N	\N	\N
10844	2491	7	\N	\N	\N	\N	\N	\N
10845	2492	7	\N	\N	\N	\N	\N	\N
10846	2493	7	\N	\N	\N	\N	\N	\N
10847	2495	7	\N	\N	\N	\N	\N	\N
10848	2496	7	\N	\N	\N	\N	\N	\N
10849	2497	7	\N	\N	\N	\N	\N	\N
10850	2498	7	\N	\N	\N	\N	\N	\N
10851	2499	7	\N	\N	\N	\N	\N	\N
10852	2500	7	\N	\N	\N	\N	\N	\N
10853	2501	7	\N	\N	\N	\N	\N	\N
10854	2502	7	\N	\N	\N	\N	\N	\N
10855	2503	7	\N	\N	\N	\N	\N	\N
10856	2504	7	\N	\N	\N	\N	\N	\N
10857	2505	7	\N	\N	\N	\N	\N	\N
10858	2506	7	\N	\N	\N	\N	\N	\N
10859	2507	7	\N	\N	\N	\N	\N	\N
10860	2508	7	\N	\N	\N	\N	\N	\N
10861	2509	7	\N	\N	\N	\N	\N	\N
10862	2510	7	\N	\N	\N	\N	\N	\N
10863	2511	7	\N	\N	\N	\N	\N	\N
10864	2512	7	\N	\N	\N	\N	\N	\N
10865	2513	7	\N	\N	\N	\N	\N	\N
10866	2514	7	\N	\N	\N	\N	\N	\N
10867	2515	7	\N	\N	\N	\N	\N	\N
10868	2516	7	\N	\N	\N	\N	\N	\N
10869	2517	7	\N	\N	\N	\N	\N	\N
10870	2518	7	\N	\N	\N	\N	\N	\N
10871	2519	7	\N	\N	\N	\N	\N	\N
10872	2520	7	\N	\N	\N	\N	\N	\N
10873	2521	7	\N	\N	\N	\N	\N	\N
10874	2522	7	\N	\N	\N	\N	\N	\N
10875	2523	7	\N	\N	\N	\N	\N	\N
10876	2524	7	\N	\N	\N	\N	\N	\N
10877	2525	7	\N	\N	\N	\N	\N	\N
10878	2526	7	\N	\N	\N	\N	\N	\N
10879	2527	7	\N	\N	\N	\N	\N	\N
10880	2528	7	\N	\N	\N	\N	\N	\N
10881	2529	7	\N	\N	\N	\N	\N	\N
10882	2530	7	\N	\N	\N	\N	\N	\N
10883	2531	7	\N	\N	\N	\N	\N	\N
10884	2532	7	\N	\N	\N	\N	\N	\N
10885	2533	7	\N	\N	\N	\N	\N	\N
10886	2534	7	\N	\N	\N	\N	\N	\N
10887	2535	7	\N	\N	\N	\N	\N	\N
10888	2536	7	\N	\N	\N	\N	\N	\N
10889	2537	7	\N	\N	\N	\N	\N	\N
10890	2538	7	\N	\N	\N	\N	\N	\N
10891	2539	7	\N	\N	\N	\N	\N	\N
10892	2540	7	\N	\N	\N	\N	\N	\N
10893	2541	7	\N	\N	\N	\N	\N	\N
10894	2542	7	\N	\N	\N	\N	\N	\N
10895	2543	7	\N	\N	\N	\N	\N	\N
10896	2544	7	\N	\N	\N	\N	\N	\N
10897	2545	7	\N	\N	\N	\N	\N	\N
10898	2546	7	\N	\N	\N	\N	\N	\N
10899	2547	7	\N	\N	\N	\N	\N	\N
10900	2548	7	\N	\N	\N	\N	\N	\N
10901	2549	7	\N	\N	\N	\N	\N	\N
10902	2550	7	\N	\N	\N	\N	\N	\N
10903	2551	7	\N	\N	\N	\N	\N	\N
10904	2552	7	\N	\N	\N	\N	\N	\N
10905	2553	7	\N	\N	\N	\N	\N	\N
10906	2554	7	\N	\N	\N	\N	\N	\N
10907	2555	7	\N	\N	\N	\N	\N	\N
10908	2556	7	\N	\N	\N	\N	\N	\N
10909	2557	7	\N	\N	\N	\N	\N	\N
10910	2558	7	\N	\N	\N	\N	\N	\N
10911	2559	7	\N	\N	\N	\N	\N	\N
10912	2560	7	\N	\N	\N	\N	\N	\N
10913	2561	7	\N	\N	\N	\N	\N	\N
10914	2562	7	\N	\N	\N	\N	\N	\N
10915	2563	7	\N	\N	\N	\N	\N	\N
10916	2564	7	\N	\N	\N	\N	\N	\N
10917	2565	7	\N	\N	\N	\N	\N	\N
10918	2566	7	\N	\N	\N	\N	\N	\N
10919	2567	7	\N	\N	\N	\N	\N	\N
10920	2568	7	\N	\N	\N	\N	\N	\N
10921	2569	7	\N	\N	\N	\N	\N	\N
10922	2570	7	\N	\N	\N	\N	\N	\N
10923	2571	7	\N	\N	\N	\N	\N	\N
10924	2572	7	\N	\N	\N	\N	\N	\N
10925	2573	7	\N	\N	\N	\N	\N	\N
10926	2575	7	\N	\N	\N	\N	\N	\N
10927	2576	7	\N	\N	\N	\N	\N	\N
10928	2577	7	\N	\N	\N	\N	\N	\N
10929	2578	7	\N	\N	\N	\N	\N	\N
10930	2579	7	\N	\N	\N	\N	\N	\N
10931	2580	7	\N	\N	\N	\N	\N	\N
10932	2581	7	\N	\N	\N	\N	\N	\N
10933	2582	7	\N	\N	\N	\N	\N	\N
10934	2583	7	\N	\N	\N	\N	\N	\N
10935	2584	7	\N	\N	\N	\N	\N	\N
10936	2585	7	\N	\N	\N	\N	\N	\N
10937	2586	7	\N	\N	\N	\N	\N	\N
10938	2587	7	\N	\N	\N	\N	\N	\N
10939	2588	7	\N	\N	\N	\N	\N	\N
10940	2589	7	\N	\N	\N	\N	\N	\N
10941	2590	7	\N	\N	\N	\N	\N	\N
10942	2591	7	\N	\N	\N	\N	\N	\N
10943	2592	7	\N	\N	\N	\N	\N	\N
10944	2593	7	\N	\N	\N	\N	\N	\N
10945	2594	7	\N	\N	\N	\N	\N	\N
10946	2595	7	\N	\N	\N	\N	\N	\N
10947	2596	7	\N	\N	\N	\N	\N	\N
10948	2597	7	\N	\N	\N	\N	\N	\N
10949	2598	7	\N	\N	\N	\N	\N	\N
10950	2599	7	\N	\N	\N	\N	\N	\N
10951	2600	7	\N	\N	\N	\N	\N	\N
10952	2601	7	\N	\N	\N	\N	\N	\N
10953	2602	7	\N	\N	\N	\N	\N	\N
10954	2603	7	\N	\N	\N	\N	\N	\N
10955	2604	7	\N	\N	\N	\N	\N	\N
10956	2605	7	\N	\N	\N	\N	\N	\N
10957	2606	7	\N	\N	\N	\N	\N	\N
10958	2607	7	\N	\N	\N	\N	\N	\N
10959	2608	7	\N	\N	\N	\N	\N	\N
10960	2609	7	\N	\N	\N	\N	\N	\N
10961	2610	7	\N	\N	\N	\N	\N	\N
10962	2611	7	\N	\N	\N	\N	\N	\N
10963	2612	7	\N	\N	\N	\N	\N	\N
10964	2614	7	\N	\N	\N	\N	\N	\N
10965	2615	7	\N	\N	\N	\N	\N	\N
10966	2616	7	\N	\N	\N	\N	\N	\N
10967	2617	7	\N	\N	\N	\N	\N	\N
10968	2618	7	\N	\N	\N	\N	\N	\N
10969	2619	7	\N	\N	\N	\N	\N	\N
10970	2620	7	\N	\N	\N	\N	\N	\N
10971	2621	7	\N	\N	\N	\N	\N	\N
10972	2624	7	\N	\N	\N	\N	\N	\N
10973	2625	7	\N	\N	\N	\N	\N	\N
10974	2626	7	\N	\N	\N	\N	\N	\N
10975	2627	7	\N	\N	\N	\N	\N	\N
10976	2628	7	\N	\N	\N	\N	\N	\N
10977	2629	7	\N	\N	\N	\N	\N	\N
10978	2630	7	\N	\N	\N	\N	\N	\N
10979	2631	7	\N	\N	\N	\N	\N	\N
10980	2632	7	\N	\N	\N	\N	\N	\N
10981	2633	7	\N	\N	\N	\N	\N	\N
10982	2634	7	\N	\N	\N	\N	\N	\N
10983	2635	7	\N	\N	\N	\N	\N	\N
10984	2636	7	\N	\N	\N	\N	\N	\N
10985	2637	7	\N	\N	\N	\N	\N	\N
10986	2638	7	\N	\N	\N	\N	\N	\N
10987	2639	7	\N	\N	\N	\N	\N	\N
10988	2640	7	\N	\N	\N	\N	\N	\N
10989	2641	7	\N	\N	\N	\N	\N	\N
10990	2642	7	\N	\N	\N	\N	\N	\N
10991	2643	7	\N	\N	\N	\N	\N	\N
10992	2644	7	\N	\N	\N	\N	\N	\N
10993	2645	7	\N	\N	\N	\N	\N	\N
10994	2646	7	\N	\N	\N	\N	\N	\N
10995	2647	7	\N	\N	\N	\N	\N	\N
10996	2648	7	\N	\N	\N	\N	\N	\N
10997	2649	7	\N	\N	\N	\N	\N	\N
10998	2650	7	\N	\N	\N	\N	\N	\N
10999	2651	7	\N	\N	\N	\N	\N	\N
11000	2652	7	\N	\N	\N	\N	\N	\N
11001	2653	7	\N	\N	\N	\N	\N	\N
11002	2654	7	\N	\N	\N	\N	\N	\N
11003	2655	7	\N	\N	\N	\N	\N	\N
11004	2656	7	\N	\N	\N	\N	\N	\N
11005	2657	7	\N	\N	\N	\N	\N	\N
11006	2658	7	\N	\N	\N	\N	\N	\N
11007	2659	7	\N	\N	\N	\N	\N	\N
11008	2660	7	\N	\N	\N	\N	\N	\N
11009	2661	7	\N	\N	\N	\N	\N	\N
11010	2662	7	\N	\N	\N	\N	\N	\N
11011	2663	7	\N	\N	\N	\N	\N	\N
11012	2664	7	\N	\N	\N	\N	\N	\N
11013	2665	7	\N	\N	\N	\N	\N	\N
11014	2666	7	\N	\N	\N	\N	\N	\N
11015	2667	7	\N	\N	\N	\N	\N	\N
11016	2668	7	\N	\N	\N	\N	\N	\N
11017	2669	7	\N	\N	\N	\N	\N	\N
11018	2670	7	\N	\N	\N	\N	\N	\N
11019	2671	7	\N	\N	\N	\N	\N	\N
11020	2672	7	\N	\N	\N	\N	\N	\N
11021	2673	7	\N	\N	\N	\N	\N	\N
11022	2674	7	\N	\N	\N	\N	\N	\N
11023	2675	7	\N	\N	\N	\N	\N	\N
11024	2676	7	\N	\N	\N	\N	\N	\N
11025	2677	7	\N	\N	\N	\N	\N	\N
11026	2678	7	\N	\N	\N	\N	\N	\N
11027	2679	7	\N	\N	\N	\N	\N	\N
11028	2680	7	\N	\N	\N	\N	\N	\N
11029	2681	7	\N	\N	\N	\N	\N	\N
11030	2682	7	\N	\N	\N	\N	\N	\N
11031	2683	7	\N	\N	\N	\N	\N	\N
11032	2684	7	\N	\N	\N	\N	\N	\N
11033	2685	7	\N	\N	\N	\N	\N	\N
11034	2686	7	\N	\N	\N	\N	\N	\N
11035	2687	7	\N	\N	\N	\N	\N	\N
11036	2688	7	\N	\N	\N	\N	\N	\N
11037	2689	7	\N	\N	\N	\N	\N	\N
11038	2690	7	\N	\N	\N	\N	\N	\N
11039	2691	7	\N	\N	\N	\N	\N	\N
11040	2692	7	\N	\N	\N	\N	\N	\N
11041	2693	7	\N	\N	\N	\N	\N	\N
11042	2694	7	\N	\N	\N	\N	\N	\N
11043	2695	7	\N	\N	\N	\N	\N	\N
11044	2696	7	\N	\N	\N	\N	\N	\N
11045	2698	7	\N	\N	\N	\N	\N	\N
11046	2699	7	\N	\N	\N	\N	\N	\N
11047	2701	7	\N	\N	\N	\N	\N	\N
11048	2702	7	\N	\N	\N	\N	\N	\N
11049	2703	7	\N	\N	\N	\N	\N	\N
11050	2704	7	\N	\N	\N	\N	\N	\N
11051	2705	7	\N	\N	\N	\N	\N	\N
11052	2706	7	\N	\N	\N	\N	\N	\N
11053	2707	7	\N	\N	\N	\N	\N	\N
11054	2708	7	\N	\N	\N	\N	\N	\N
11055	2709	7	\N	\N	\N	\N	\N	\N
11056	2710	7	\N	\N	\N	\N	\N	\N
11057	2711	7	\N	\N	\N	\N	\N	\N
11058	2712	7	\N	\N	\N	\N	\N	\N
11059	2713	7	\N	\N	\N	\N	\N	\N
11060	2714	7	\N	\N	\N	\N	\N	\N
11061	2715	7	\N	\N	\N	\N	\N	\N
11062	2717	7	\N	\N	\N	\N	\N	\N
11063	2718	7	\N	\N	\N	\N	\N	\N
11064	2719	7	\N	\N	\N	\N	\N	\N
11065	2720	7	\N	\N	\N	\N	\N	\N
11066	2721	7	\N	\N	\N	\N	\N	\N
11067	2722	7	\N	\N	\N	\N	\N	\N
11068	2723	7	\N	\N	\N	\N	\N	\N
11069	2724	7	\N	\N	\N	\N	\N	\N
11070	2725	7	\N	\N	\N	\N	\N	\N
11071	2726	7	\N	\N	\N	\N	\N	\N
11072	2727	7	\N	\N	\N	\N	\N	\N
11073	2729	7	\N	\N	\N	\N	\N	\N
11074	2730	7	\N	\N	\N	\N	\N	\N
11075	2731	7	\N	\N	\N	\N	\N	\N
11076	2732	7	\N	\N	\N	\N	\N	\N
11077	2733	7	\N	\N	\N	\N	\N	\N
11078	2734	7	\N	\N	\N	\N	\N	\N
11079	2735	7	\N	\N	\N	\N	\N	\N
11080	2736	7	\N	\N	\N	\N	\N	\N
11081	2737	7	\N	\N	\N	\N	\N	\N
11082	2738	7	\N	\N	\N	\N	\N	\N
11083	2739	7	\N	\N	\N	\N	\N	\N
11084	2740	7	\N	\N	\N	\N	\N	\N
11085	2741	7	\N	\N	\N	\N	\N	\N
11086	2742	7	\N	\N	\N	\N	\N	\N
11087	2743	7	\N	\N	\N	\N	\N	\N
11088	2744	7	\N	\N	\N	\N	\N	\N
11089	2746	7	\N	\N	\N	\N	\N	\N
11090	2747	7	\N	\N	\N	\N	\N	\N
11091	2748	7	\N	\N	\N	\N	\N	\N
11092	2749	7	\N	\N	\N	\N	\N	\N
11093	2750	7	\N	\N	\N	\N	\N	\N
11094	2751	7	\N	\N	\N	\N	\N	\N
11095	2752	7	\N	\N	\N	\N	\N	\N
11096	2753	7	\N	\N	\N	\N	\N	\N
11097	2754	7	\N	\N	\N	\N	\N	\N
11098	2755	7	\N	\N	\N	\N	\N	\N
11099	2756	7	\N	\N	\N	\N	\N	\N
11100	2757	7	\N	\N	\N	\N	\N	\N
11101	2758	7	\N	\N	\N	\N	\N	\N
11102	2759	7	\N	\N	\N	\N	\N	\N
11103	2760	7	\N	\N	\N	\N	\N	\N
11104	2761	7	\N	\N	\N	\N	\N	\N
11105	2762	7	\N	\N	\N	\N	\N	\N
11106	2763	7	\N	\N	\N	\N	\N	\N
11107	2764	7	\N	\N	\N	\N	\N	\N
11108	2765	7	\N	\N	\N	\N	\N	\N
11109	2766	7	\N	\N	\N	\N	\N	\N
11110	2767	7	\N	\N	\N	\N	\N	\N
11111	2768	7	\N	\N	\N	\N	\N	\N
11112	2769	7	\N	\N	\N	\N	\N	\N
11113	2770	7	\N	\N	\N	\N	\N	\N
11114	2771	7	\N	\N	\N	\N	\N	\N
11115	2772	7	\N	\N	\N	\N	\N	\N
11116	2773	7	\N	\N	\N	\N	\N	\N
11117	2774	7	\N	\N	\N	\N	\N	\N
11118	2775	7	\N	\N	\N	\N	\N	\N
11119	2776	7	\N	\N	\N	\N	\N	\N
11120	2777	7	\N	\N	\N	\N	\N	\N
11121	2778	7	\N	\N	\N	\N	\N	\N
11122	2779	7	\N	\N	\N	\N	\N	\N
11123	2780	7	\N	\N	\N	\N	\N	\N
11124	2825	7	\N	\N	\N	\N	\N	\N
11125	2826	7	\N	\N	\N	\N	\N	\N
11126	2827	7	\N	\N	\N	\N	\N	\N
11127	2828	7	\N	\N	\N	\N	\N	\N
11128	2829	7	\N	\N	\N	\N	\N	\N
11129	2830	7	\N	\N	\N	\N	\N	\N
11130	2831	7	\N	\N	\N	\N	\N	\N
11131	2833	7	\N	\N	\N	\N	\N	\N
11132	2834	7	\N	\N	\N	\N	\N	\N
11133	2835	7	\N	\N	\N	\N	\N	\N
11134	2836	7	\N	\N	\N	\N	\N	\N
11135	2837	7	\N	\N	\N	\N	\N	\N
11136	2838	7	\N	\N	\N	\N	\N	\N
11137	2839	7	\N	\N	\N	\N	\N	\N
11138	2840	7	\N	\N	\N	\N	\N	\N
11139	2841	7	\N	\N	\N	\N	\N	\N
11140	2842	7	\N	\N	\N	\N	\N	\N
11141	2843	7	\N	\N	\N	\N	\N	\N
11142	2844	7	\N	\N	\N	\N	\N	\N
11143	2845	7	\N	\N	\N	\N	\N	\N
11144	2846	7	\N	\N	\N	\N	\N	\N
11145	2847	7	\N	\N	\N	\N	\N	\N
11146	2848	7	\N	\N	\N	\N	\N	\N
11147	2849	7	\N	\N	\N	\N	\N	\N
11148	2850	7	\N	\N	\N	\N	\N	\N
11149	2852	7	\N	\N	\N	\N	\N	\N
11150	2853	7	\N	\N	\N	\N	\N	\N
11151	2854	7	\N	\N	\N	\N	\N	\N
11152	2855	7	\N	\N	\N	\N	\N	\N
11153	2856	7	\N	\N	\N	\N	\N	\N
11154	2857	7	\N	\N	\N	\N	\N	\N
11155	2858	7	\N	\N	\N	\N	\N	\N
11156	2859	7	\N	\N	\N	\N	\N	\N
11157	2861	7	\N	\N	\N	\N	\N	\N
11158	2862	7	\N	\N	\N	\N	\N	\N
11159	2866	7	\N	\N	\N	\N	\N	\N
11160	2867	7	\N	\N	\N	\N	\N	\N
11161	2868	7	\N	\N	\N	\N	\N	\N
11162	2869	7	\N	\N	\N	\N	\N	\N
11163	2870	7	\N	\N	\N	\N	\N	\N
11164	2872	7	\N	\N	\N	\N	\N	\N
11165	2873	7	\N	\N	\N	\N	\N	\N
11166	2874	7	\N	\N	\N	\N	\N	\N
11167	2875	7	\N	\N	\N	\N	\N	\N
11168	2876	7	\N	\N	\N	\N	\N	\N
11169	2877	7	\N	\N	\N	\N	\N	\N
11170	2878	7	\N	\N	\N	\N	\N	\N
11171	2879	7	\N	\N	\N	\N	\N	\N
11172	2880	7	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: price_alert; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price_alert (id, user_id, coinmarketcap_id, currency_id, upper, price_point, active) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, token) FROM stdin;
\.


--
-- Data for Name: source; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.source (id, name, link, feed) FROM stdin;
1	Cointelegraph	https://cointelegraph.com	https://cointelegraph.com/rss
2	NewsBTC	https://www.newsbtc.com	https://www.newsbtc.com/feed/
3	CoinDesk	https://www.coindesk.com	https://feeds.feedburner.com/CoinDesk
4	CCN	https://www.ccn.com	https://www.ccn.com/feed
5	Toshi Times	https://toshitimes.com	https://toshitimes.com/feed/
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, fiat_currency_id, coin_currency_id, email, password, notifications) FROM stdin;
\.


--
-- Name: coin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coin_id_seq', 1596, true);


--
-- Name: coin_news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coin_news_id_seq', 1, false);


--
-- Name: currency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.currency_id_seq', 7, true);


--
-- Name: knex_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.knex_migrations_id_seq', 1, true);


--
-- Name: news_alert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.news_alert_id_seq', 1, false);


--
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.news_id_seq', 1, false);


--
-- Name: price_alert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.price_alert_id_seq', 1, false);


--
-- Name: price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.price_id_seq', 11172, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sessions_id_seq', 1, false);


--
-- Name: source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.source_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: coin coin_coinmarketcap_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin
    ADD CONSTRAINT coin_coinmarketcap_id_unique UNIQUE (coinmarketcap_id);


--
-- Name: coin_news coin_news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin_news
    ADD CONSTRAINT coin_news_pkey PRIMARY KEY (id);


--
-- Name: coin coin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin
    ADD CONSTRAINT coin_pkey PRIMARY KEY (id);


--
-- Name: currency currency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (id);


--
-- Name: knex_migrations knex_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);


--
-- Name: news_alert news_alert_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news_alert
    ADD CONSTRAINT news_alert_pkey PRIMARY KEY (id);


--
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- Name: price_alert price_alert_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_alert
    ADD CONSTRAINT price_alert_pkey PRIMARY KEY (id);


--
-- Name: price price_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price
    ADD CONSTRAINT price_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: source source_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.source
    ADD CONSTRAINT source_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: coin_news coin_news_coin_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin_news
    ADD CONSTRAINT coin_news_coin_id_foreign FOREIGN KEY (coin_id) REFERENCES public.coin(id);


--
-- Name: coin_news coin_news_news_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin_news
    ADD CONSTRAINT coin_news_news_id_foreign FOREIGN KEY (news_id) REFERENCES public.news(id);


--
-- Name: news_alert news_alert_coin_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news_alert
    ADD CONSTRAINT news_alert_coin_id_foreign FOREIGN KEY (coin_id) REFERENCES public.coin(id);


--
-- Name: news_alert news_alert_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news_alert
    ADD CONSTRAINT news_alert_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: news news_source_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_source_id_foreign FOREIGN KEY (source_id) REFERENCES public.source(id);


--
-- Name: price_alert price_alert_coinmarketcap_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_alert
    ADD CONSTRAINT price_alert_coinmarketcap_id_foreign FOREIGN KEY (coinmarketcap_id) REFERENCES public.coin(coinmarketcap_id);


--
-- Name: price_alert price_alert_currency_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_alert
    ADD CONSTRAINT price_alert_currency_id_foreign FOREIGN KEY (currency_id) REFERENCES public.currency(id);


--
-- Name: price_alert price_alert_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_alert
    ADD CONSTRAINT price_alert_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: price price_coinmarketcap_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price
    ADD CONSTRAINT price_coinmarketcap_id_foreign FOREIGN KEY (coinmarketcap_id) REFERENCES public.coin(coinmarketcap_id);


--
-- Name: price price_currency_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price
    ADD CONSTRAINT price_currency_id_foreign FOREIGN KEY (currency_id) REFERENCES public.currency(id);


--
-- Name: sessions sessions_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: users users_coin_currency_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_coin_currency_id_foreign FOREIGN KEY (coin_currency_id) REFERENCES public.currency(id);


--
-- Name: users users_fiat_currency_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_fiat_currency_id_foreign FOREIGN KEY (fiat_currency_id) REFERENCES public.currency(id);


--
-- PostgreSQL database dump complete
--

