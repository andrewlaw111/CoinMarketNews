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
    official_website integer,
    medium integer,
    reddit integer,
    twitter integer,
    telegram integer
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
    subscribe_website boolean,
    subscribe_medium boolean,
    subscribe_reddit boolean,
    subscribe_twitter boolean
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
    price_id integer,
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
    link character varying(255)
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

COPY public.coin (id, name, symbol, rank, circulating_supply, total_supply, max_supply, last_updated, coinmarketcap_id, about, type, algorithm, proof, mineable, premined, official_website, medium, reddit, twitter, telegram) FROM stdin;
2	Terracoin	TRC	\N	\N	\N	\N	\N	4	\N	\N	\N	\N	\N	\N	11	12	13	14	15
3	Feathercoin	FTC	\N	\N	\N	\N	\N	8	\N	\N	\N	\N	\N	\N	31	32	33	34	35
5	Novacoin	NVC	\N	\N	\N	\N	\N	6	\N	\N	\N	\N	\N	\N	26	27	28	29	30
6	Peercoin	PPC	\N	\N	\N	\N	\N	5	\N	\N	\N	\N	\N	\N	16	17	18	19	20
7	Mincoin	MNC	\N	\N	\N	\N	\N	9	\N	\N	\N	\N	\N	\N	36	37	38	39	40
8	Namecoin	NMC	\N	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	21	22	23	24	25
9	Ixcoin	IXC	\N	\N	\N	\N	\N	13	\N	\N	\N	\N	\N	\N	46	47	48	49	50
10	Freicoin	FRC	\N	\N	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	41	42	43	44	45
11	BitBar	BTB	\N	\N	\N	\N	\N	14	\N	\N	\N	\N	\N	\N	51	52	53	54	55
12	WorldCoin	WDC	\N	\N	\N	\N	\N	16	\N	\N	\N	\N	\N	\N	56	57	58	59	60
13	Digitalcoin	DGC	\N	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	\N	61	62	63	64	65
14	GoldCoin	GLD	\N	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	\N	66	67	68	69	70
15	Argentum	ARG	\N	\N	\N	\N	\N	31	\N	\N	\N	\N	\N	\N	71	72	73	74	75
16	Fastcoin	FST	\N	\N	\N	\N	\N	32	\N	\N	\N	\N	\N	\N	76	77	78	79	80
17	Bitgem	BTG	\N	\N	\N	\N	\N	34	\N	\N	\N	\N	\N	\N	81	82	83	84	85
18	Megacoin	MEC	\N	\N	\N	\N	\N	37	\N	\N	\N	\N	\N	\N	91	92	93	94	95
19	Phoenixcoin	PXC	\N	\N	\N	\N	\N	35	\N	\N	\N	\N	\N	\N	86	87	88	89	90
20	Infinitecoin	IFC	\N	\N	\N	\N	\N	41	\N	\N	\N	\N	\N	\N	96	97	98	99	100
21	Primecoin	XPM	\N	\N	\N	\N	\N	42	\N	\N	\N	\N	\N	\N	101	102	103	104	105
22	Anoncoin	ANC	\N	\N	\N	\N	\N	43	\N	\N	\N	\N	\N	\N	106	107	108	109	110
23	CasinoCoin	CSC	\N	\N	\N	\N	\N	45	\N	\N	\N	\N	\N	\N	111	112	113	114	115
24	Bullion	CBX	\N	\N	\N	\N	\N	49	\N	\N	\N	\N	\N	\N	116	117	118	119	120
25	Emerald Crypto	EMD	\N	\N	\N	\N	\N	50	\N	\N	\N	\N	\N	\N	121	122	123	124	125
26	GlobalCoin	GLC	\N	\N	\N	\N	\N	51	\N	\N	\N	\N	\N	\N	126	127	128	129	130
27	Quark	QRK	\N	\N	\N	\N	\N	53	\N	\N	\N	\N	\N	\N	136	137	138	139	140
28	Zetacoin	ZET	\N	\N	\N	\N	\N	56	\N	\N	\N	\N	\N	\N	141	142	143	144	145
30	SecureCoin	SRC	\N	\N	\N	\N	\N	57	\N	\N	\N	\N	\N	\N	146	147	148	149	150
31	Sexcoin	SXC	\N	\N	\N	\N	\N	58	\N	\N	\N	\N	\N	\N	151	152	153	154	155
32	TagCoin	TAG	\N	\N	\N	\N	\N	61	\N	\N	\N	\N	\N	\N	156	157	158	159	160
33	I0Coin	I0C	\N	\N	\N	\N	\N	63	\N	\N	\N	\N	\N	\N	161	162	163	164	165
34	FlorinCoin	FLO	\N	\N	\N	\N	\N	64	\N	\N	\N	\N	\N	\N	166	167	168	169	170
36	Unobtanium	UNO	\N	\N	\N	\N	\N	67	\N	\N	\N	\N	\N	\N	176	177	178	179	180
37	Joulecoin	XJO	\N	\N	\N	\N	\N	68	\N	\N	\N	\N	\N	\N	181	182	183	184	185
38	Datacoin	DTC	\N	\N	\N	\N	\N	69	\N	\N	\N	\N	\N	\N	186	187	188	189	190
39	BetaCoin	BET	\N	\N	\N	\N	\N	70	\N	\N	\N	\N	\N	\N	191	192	193	194	195
40	GrandCoin	GDC	\N	\N	\N	\N	\N	71	\N	\N	\N	\N	\N	\N	196	197	198	199	200
41	Deutsche eMark	DEM	\N	\N	\N	\N	\N	72	\N	\N	\N	\N	\N	\N	201	202	203	204	205
43	NetCoin	NET	\N	\N	\N	\N	\N	75	\N	\N	\N	\N	\N	\N	211	212	213	214	215
44	Philosopher Stones	PHS	\N	\N	\N	\N	\N	76	\N	\N	\N	\N	\N	\N	216	217	218	219	220
45	Diamond	DMD	\N	\N	\N	\N	\N	77	\N	\N	\N	\N	\N	\N	221	222	223	224	225
46	HoboNickels	HBN	\N	\N	\N	\N	\N	78	\N	\N	\N	\N	\N	\N	226	227	228	229	230
47	Tigercoin	TGC	\N	\N	\N	\N	\N	79	\N	\N	\N	\N	\N	\N	231	232	233	234	235
48	Orbitcoin	ORB	\N	\N	\N	\N	\N	80	\N	\N	\N	\N	\N	\N	236	237	238	239	240
49	Omni	OMNI	\N	\N	\N	\N	\N	83	\N	\N	\N	\N	\N	\N	241	242	243	244	245
50	Catcoin	CAT	\N	\N	\N	\N	\N	84	\N	\N	\N	\N	\N	\N	246	247	248	249	250
51	FedoraCoin	TIPS	\N	\N	\N	\N	\N	87	\N	\N	\N	\N	\N	\N	251	252	253	254	255
52	RonPaulCoin	RPC	\N	\N	\N	\N	\N	88	\N	\N	\N	\N	\N	\N	256	257	258	259	260
53	Mooncoin	MOON	\N	\N	\N	\N	\N	89	\N	\N	\N	\N	\N	\N	261	262	263	264	265
54	Dimecoin	DIME	\N	\N	\N	\N	\N	90	\N	\N	\N	\N	\N	\N	266	267	268	269	270
55	42-coin	42	\N	\N	\N	\N	\N	93	\N	\N	\N	\N	\N	\N	271	272	273	274	275
56	Vertcoin	VTC	\N	\N	\N	\N	\N	99	\N	\N	\N	\N	\N	\N	276	277	278	279	280
57	KlondikeCoin	KDC	\N	\N	\N	\N	\N	101	\N	\N	\N	\N	\N	\N	281	282	283	284	285
58	RedCoin	RED	\N	\N	\N	\N	\N	103	\N	\N	\N	\N	\N	\N	286	287	288	289	290
60	SmartCoin	SMC	\N	\N	\N	\N	\N	113	\N	\N	\N	\N	\N	\N	296	297	298	299	300
61	TeslaCoin	TES	\N	\N	\N	\N	\N	114	\N	\N	\N	\N	\N	\N	301	302	303	304	305
62	NobleCoin	NOBL	\N	\N	\N	\N	\N	117	\N	\N	\N	\N	\N	\N	306	307	308	309	310
64	Nyancoin	NYAN	\N	\N	\N	\N	\N	120	\N	\N	\N	\N	\N	\N	316	317	318	319	320
65	UltraCoin	UTC	\N	\N	\N	\N	\N	121	\N	\N	\N	\N	\N	\N	321	322	323	324	325
66	PotCoin	POT	\N	\N	\N	\N	\N	122	\N	\N	\N	\N	\N	\N	326	327	328	329	330
67	Blakecoin	BLC	\N	\N	\N	\N	\N	125	\N	\N	\N	\N	\N	\N	331	332	333	334	335
68	MaxCoin	MAX	\N	\N	\N	\N	\N	128	\N	\N	\N	\N	\N	\N	336	337	338	339	340
69	QubitCoin	Q2C	\N	\N	\N	\N	\N	129	\N	\N	\N	\N	\N	\N	341	342	343	344	345
70	HunterCoin	HUC	\N	\N	\N	\N	\N	130	\N	\N	\N	\N	\N	\N	346	347	348	349	350
72	Counterparty	XCP	\N	\N	\N	\N	\N	132	\N	\N	\N	\N	\N	\N	356	357	358	359	360
73	CacheCoin	CACH	\N	\N	\N	\N	\N	134	\N	\N	\N	\N	\N	\N	361	362	363	364	365
74	TopCoin	TOP	\N	\N	\N	\N	\N	135	\N	\N	\N	\N	\N	\N	366	367	368	369	370
75	iCoin	ICN	\N	\N	\N	\N	\N	138	\N	\N	\N	\N	\N	\N	371	372	373	374	375
76	Mintcoin	MINT	\N	\N	\N	\N	\N	141	\N	\N	\N	\N	\N	\N	376	377	378	379	380
77	Aricoin	ARI	\N	\N	\N	\N	\N	142	\N	\N	\N	\N	\N	\N	381	382	383	384	385
78	DopeCoin	DOPE	\N	\N	\N	\N	\N	145	\N	\N	\N	\N	\N	\N	386	387	388	389	390
79	Auroracoin	AUR	\N	\N	\N	\N	\N	148	\N	\N	\N	\N	\N	\N	391	392	393	394	395
80	Animecoin	ANI	\N	\N	\N	\N	\N	150	\N	\N	\N	\N	\N	\N	396	397	398	399	400
81	Pesetacoin	PTC	\N	\N	\N	\N	\N	151	\N	\N	\N	\N	\N	\N	401	402	403	404	405
82	Marscoin	MARS	\N	\N	\N	\N	\N	154	\N	\N	\N	\N	\N	\N	406	407	408	409	410
83	Cashcoin	CASH	\N	\N	\N	\N	\N	159	\N	\N	\N	\N	\N	\N	411	412	413	414	415
84	Riecoin	RIC	\N	\N	\N	\N	\N	160	\N	\N	\N	\N	\N	\N	416	417	418	419	420
85	Pandacoin	PND	\N	\N	\N	\N	\N	161	\N	\N	\N	\N	\N	\N	421	422	423	424	425
86	MAZA	MAZA	\N	\N	\N	\N	\N	164	\N	\N	\N	\N	\N	\N	426	427	428	429	430
87	Uniform Fiscal Object	UFO	\N	\N	\N	\N	\N	168	\N	\N	\N	\N	\N	\N	431	432	433	434	435
88	BlackCoin	BLK	\N	\N	\N	\N	\N	170	\N	\N	\N	\N	\N	\N	436	437	438	439	440
89	LiteBar	LTB	\N	\N	\N	\N	\N	174	\N	\N	\N	\N	\N	\N	441	442	443	444	445
90	Photon	PHO	\N	\N	\N	\N	\N	175	\N	\N	\N	\N	\N	\N	446	447	448	449	450
91	Zeitcoin	ZEIT	\N	\N	\N	\N	\N	181	\N	\N	\N	\N	\N	\N	451	452	453	454	455
92	Myriad	XMY	\N	\N	\N	\N	\N	182	\N	\N	\N	\N	\N	\N	456	457	458	459	460
93	Coin(O)	CNO	\N	\N	\N	\N	\N	206	\N	\N	\N	\N	\N	\N	476	477	478	479	480
94	Einsteinium	EMC2	\N	\N	\N	\N	\N	201	\N	\N	\N	\N	\N	\N	466	467	468	469	470
96	Bitcoin Scrypt	BTCS	\N	\N	\N	\N	\N	205	\N	\N	\N	\N	\N	\N	471	472	473	474	475
97	Skeincoin	SKC	\N	\N	\N	\N	\N	199	\N	\N	\N	\N	\N	\N	461	462	463	464	465
98	FlutterCoin	FLT	\N	\N	\N	\N	\N	218	\N	\N	\N	\N	\N	\N	501	502	503	504	505
99	Rubycoin	RBY	\N	\N	\N	\N	\N	215	\N	\N	\N	\N	\N	\N	486	487	488	489	490
100	Bela	BELA	\N	\N	\N	\N	\N	217	\N	\N	\N	\N	\N	\N	496	497	498	499	500
42	Dogecoin	DOGE	42	114962637100	114962637100	\N	1529639643	74	\N	\N	\N	\N	\N	\N	206	207	208	209	210
63	ReddCoin	RDD	63	28808713174	28808713174	\N	1529639643	118	\N	\N	\N	\N	\N	\N	311	312	313	314	315
35	Nxt	NXT	90	998999942	998999942	1000000000	1529639642	66	\N	\N	\N	\N	\N	\N	171	172	173	174	175
101	ECC	ECC	\N	\N	\N	\N	\N	212	\N	\N	\N	\N	\N	\N	491	492	493	494	495
102	OctoCoin	888	\N	\N	\N	\N	\N	221	\N	\N	\N	\N	\N	\N	506	507	508	509	510
103	FairCoin	FAIR	\N	\N	\N	\N	\N	224	\N	\N	\N	\N	\N	\N	511	512	513	514	515
104	SolarCoin	SLR	\N	\N	\N	\N	\N	233	\N	\N	\N	\N	\N	\N	516	517	518	519	520
105	e-Gulden	EFL	\N	\N	\N	\N	\N	234	\N	\N	\N	\N	\N	\N	521	522	523	524	525
106	Gulden	NLG	\N	\N	\N	\N	\N	254	\N	\N	\N	\N	\N	\N	526	527	528	529	530
107	Polcoin	PLC	\N	\N	\N	\N	\N	257	\N	\N	\N	\N	\N	\N	531	532	533	534	535
108	Groestlcoin	GRS	\N	\N	\N	\N	\N	258	\N	\N	\N	\N	\N	\N	536	537	538	539	540
109	AsiaCoin	AC	\N	\N	\N	\N	\N	269	\N	\N	\N	\N	\N	\N	556	557	558	559	560
110	PetroDollar	XPD	\N	\N	\N	\N	\N	260	\N	\N	\N	\N	\N	\N	541	542	543	544	545
111	PLNcoin	PLNC	\N	\N	\N	\N	\N	263	\N	\N	\N	\N	\N	\N	546	547	548	549	550
112	WhiteCoin	XWC	\N	\N	\N	\N	\N	268	\N	\N	\N	\N	\N	\N	551	552	553	554	555
113	PopularCoin	POP	\N	\N	\N	\N	\N	275	\N	\N	\N	\N	\N	\N	561	562	563	564	565
114	Bitstar	BITS	\N	\N	\N	\N	\N	276	\N	\N	\N	\N	\N	\N	566	567	568	569	570
115	Slothcoin	SLOTH	\N	\N	\N	\N	\N	287	\N	\N	\N	\N	\N	\N	581	582	583	584	585
116	BlueCoin	BLU	\N	\N	\N	\N	\N	290	\N	\N	\N	\N	\N	\N	586	587	588	589	590
117	Quebecoin	QBC	\N	\N	\N	\N	\N	278	\N	\N	\N	\N	\N	\N	571	572	573	574	575
118	CannaCoin	CCN	\N	\N	\N	\N	\N	279	\N	\N	\N	\N	\N	\N	576	577	578	579	580
120	Bitcoin Plus	XBC	\N	\N	\N	\N	\N	293	\N	\N	\N	\N	\N	\N	596	597	598	599	600
121	BTCtalkcoin	TALK	\N	\N	\N	\N	\N	295	\N	\N	\N	\N	\N	\N	601	602	603	604	605
122	NewYorkCoin	NYC	\N	\N	\N	\N	\N	298	\N	\N	\N	\N	\N	\N	606	607	608	609	610
123	Canada eCoin	CDN	\N	\N	\N	\N	\N	304	\N	\N	\N	\N	\N	\N	611	612	613	614	615
124	Guncoin	GUN	\N	\N	\N	\N	\N	312	\N	\N	\N	\N	\N	\N	616	617	618	619	620
125	PinkCoin	PINK	\N	\N	\N	\N	\N	313	\N	\N	\N	\N	\N	\N	621	622	623	624	625
126	Dreamcoin	DRM	\N	\N	\N	\N	\N	316	\N	\N	\N	\N	\N	\N	626	627	628	629	630
127	CoffeeCoin	CFC	\N	\N	\N	\N	\N	317	\N	\N	\N	\N	\N	\N	631	632	633	634	635
128	Energycoin	ENRG	\N	\N	\N	\N	\N	322	\N	\N	\N	\N	\N	\N	636	637	638	639	640
129	VeriCoin	VRC	\N	\N	\N	\N	\N	323	\N	\N	\N	\N	\N	\N	641	642	643	644	645
130	TEKcoin	TEK	\N	\N	\N	\N	\N	325	\N	\N	\N	\N	\N	\N	646	647	648	649	650
132	Litecoin Plus	LCP	\N	\N	\N	\N	\N	331	\N	\N	\N	\N	\N	\N	656	657	658	659	660
133	Curecoin	CURE	\N	\N	\N	\N	\N	333	\N	\N	\N	\N	\N	\N	661	662	663	664	665
134	UnbreakableCoin	UNB	\N	\N	\N	\N	\N	334	\N	\N	\N	\N	\N	\N	666	667	668	669	670
135	CryptCoin	CRYPT	\N	\N	\N	\N	\N	337	\N	\N	\N	\N	\N	\N	671	672	673	674	675
136	QuazarCoin	QCN	\N	\N	\N	\N	\N	338	\N	\N	\N	\N	\N	\N	676	677	678	679	680
137	SuperCoin	SUPER	\N	\N	\N	\N	\N	341	\N	\N	\N	\N	\N	\N	681	682	683	684	685
138	Qora	QORA	\N	\N	\N	\N	\N	344	\N	\N	\N	\N	\N	\N	686	687	688	689	690
139	BoostCoin	BOST	\N	\N	\N	\N	\N	350	\N	\N	\N	\N	\N	\N	691	692	693	694	695
140	Hyper	HYPER	\N	\N	\N	\N	\N	353	\N	\N	\N	\N	\N	\N	696	697	698	699	700
141	BitQuark	BTQ	\N	\N	\N	\N	\N	356	\N	\N	\N	\N	\N	\N	701	702	703	704	705
142	Motocoin	MOTO	\N	\N	\N	\N	\N	360	\N	\N	\N	\N	\N	\N	706	707	708	709	710
143	CloakCoin	CLOAK	\N	\N	\N	\N	\N	362	\N	\N	\N	\N	\N	\N	711	712	713	714	715
144	BitSend	BSD	\N	\N	\N	\N	\N	366	\N	\N	\N	\N	\N	\N	716	717	718	719	720
145	Coin2.1	C2	\N	\N	\N	\N	\N	367	\N	\N	\N	\N	\N	\N	721	722	723	724	725
146	Fantomcoin	FCN	\N	\N	\N	\N	\N	370	\N	\N	\N	\N	\N	\N	726	727	728	729	730
148	ArtByte	ABY	\N	\N	\N	\N	\N	374	\N	\N	\N	\N	\N	\N	736	737	738	739	740
149	NavCoin	NAV	\N	\N	\N	\N	\N	377	\N	\N	\N	\N	\N	\N	741	742	743	744	745
150	Granite	GRN	\N	\N	\N	\N	\N	382	\N	\N	\N	\N	\N	\N	746	747	748	749	750
151	Donationcoin	DON	\N	\N	\N	\N	\N	385	\N	\N	\N	\N	\N	\N	751	752	753	754	755
152	Piggycoin	PIGGY	\N	\N	\N	\N	\N	386	\N	\N	\N	\N	\N	\N	756	757	758	759	760
153	Startcoin	START	\N	\N	\N	\N	\N	389	\N	\N	\N	\N	\N	\N	761	762	763	764	765
154	Kore	KORE	\N	\N	\N	\N	\N	400	\N	\N	\N	\N	\N	\N	766	767	768	769	770
155	DigitalNote	XDN	\N	\N	\N	\N	\N	405	\N	\N	\N	\N	\N	\N	771	772	773	774	775
156	BlazeCoin	BLZ	\N	\N	\N	\N	\N	415	\N	\N	\N	\N	\N	\N	776	777	778	779	780
157	SHACoin	SHA	\N	\N	\N	\N	\N	411	\N	\N	\N	\N	\N	\N	781	782	783	784	785
158	Boolberry	BBR	\N	\N	\N	\N	\N	406	\N	\N	\N	\N	\N	\N	786	787	788	789	790
159	HempCoin	THC	\N	\N	\N	\N	\N	416	\N	\N	\N	\N	\N	\N	791	792	793	794	795
160	BritCoin	BRIT	\N	\N	\N	\N	\N	426	\N	\N	\N	\N	\N	\N	796	797	798	799	800
161	Stealth	XST	\N	\N	\N	\N	\N	448	\N	\N	\N	\N	\N	\N	801	802	803	804	805
162	Clams	CLAM	\N	\N	\N	\N	\N	460	\N	\N	\N	\N	\N	\N	811	812	813	814	815
163	TrustPlus	TRUST	\N	\N	\N	\N	\N	450	\N	\N	\N	\N	\N	\N	806	807	808	809	810
164	BitcoinDark	BTCD	\N	\N	\N	\N	\N	467	\N	\N	\N	\N	\N	\N	826	827	828	829	830
166	Quatloo	QTL	\N	\N	\N	\N	\N	461	\N	\N	\N	\N	\N	\N	816	817	818	819	820
167	Triangles	TRI	\N	\N	\N	\N	\N	477	\N	\N	\N	\N	\N	\N	831	832	833	834	835
168	Firecoin	FIRE	\N	\N	\N	\N	\N	476	\N	\N	\N	\N	\N	\N	836	837	838	839	840
169	Titcoin	TIT	\N	\N	\N	\N	\N	513	\N	\N	\N	\N	\N	\N	871	872	873	874	875
170	Truckcoin	TRK	\N	\N	\N	\N	\N	468	\N	\N	\N	\N	\N	\N	851	852	853	854	855
171	CannabisCoin	CANN	\N	\N	\N	\N	\N	506	\N	\N	\N	\N	\N	\N	846	847	848	849	850
173	Carboncoin	CARBON	\N	\N	\N	\N	\N	502	\N	\N	\N	\N	\N	\N	841	842	843	844	845
174	Virtacoin	VTA	\N	\N	\N	\N	\N	520	\N	\N	\N	\N	\N	\N	881	882	883	884	885
175	Viacoin	VIA	\N	\N	\N	\N	\N	470	\N	\N	\N	\N	\N	\N	861	862	863	864	865
176	Cryptonite	XCN	\N	\N	\N	\N	\N	501	\N	\N	\N	\N	\N	\N	866	867	868	869	870
177	I/O Coin	IOC	\N	\N	\N	\N	\N	495	\N	\N	\N	\N	\N	\N	876	877	878	879	880
178	HyperStake	HYP	\N	\N	\N	\N	\N	525	\N	\N	\N	\N	\N	\N	886	887	888	889	890
179	Joincoin	J	\N	\N	\N	\N	\N	536	\N	\N	\N	\N	\N	\N	891	892	893	894	895
181	Bitmark	BTM	\N	\N	\N	\N	\N	543	\N	\N	\N	\N	\N	\N	901	902	903	904	905
182	Halcyon	HAL	\N	\N	\N	\N	\N	545	\N	\N	\N	\N	\N	\N	906	907	908	909	910
183	Storjcoin X	SJCX	\N	\N	\N	\N	\N	549	\N	\N	\N	\N	\N	\N	911	912	913	914	915
184	NeosCoin	NEOS	\N	\N	\N	\N	\N	551	\N	\N	\N	\N	\N	\N	916	917	918	919	920
185	GameCredits	GAME	\N	\N	\N	\N	\N	576	\N	\N	\N	\N	\N	\N	936	937	938	939	940
186	RabbitCoin	RBBT	\N	\N	\N	\N	\N	572	\N	\N	\N	\N	\N	\N	926	927	928	929	930
188	Burst	BURST	\N	\N	\N	\N	\N	573	\N	\N	\N	\N	\N	\N	931	932	933	934	935
189	WeAreSatoshi	WSX	\N	\N	\N	\N	\N	584	\N	\N	\N	\N	\N	\N	941	942	943	944	945
190	Ubiq	UBQ	\N	\N	\N	\N	\N	588	\N	\N	\N	\N	\N	\N	946	947	948	949	950
191	BunnyCoin	BUN	\N	\N	\N	\N	\N	594	\N	\N	\N	\N	\N	\N	951	952	953	954	955
192	Opal	OPAL	\N	\N	\N	\N	\N	597	\N	\N	\N	\N	\N	\N	956	957	958	959	960
193	FoldingCoin	FLDC	\N	\N	\N	\N	\N	606	\N	\N	\N	\N	\N	\N	966	967	968	969	970
194	Acoin	ACOIN	\N	\N	\N	\N	\N	601	\N	\N	\N	\N	\N	\N	961	962	963	964	965
195	bitCNY	BITCNY	\N	\N	\N	\N	\N	624	\N	\N	\N	\N	\N	\N	971	972	973	974	975
196	bitBTC	BITBTC	\N	\N	\N	\N	\N	625	\N	\N	\N	\N	\N	\N	976	977	978	979	980
197	bitUSD	BITUSD	\N	\N	\N	\N	\N	623	\N	\N	\N	\N	\N	\N	981	982	983	984	985
198	NuBits	USNBT	\N	\N	\N	\N	\N	626	\N	\N	\N	\N	\N	\N	986	987	988	989	990
199	Sterlingcoin	SLG	\N	\N	\N	\N	\N	627	\N	\N	\N	\N	\N	\N	991	992	993	994	995
200	Magi	XMG	\N	\N	\N	\N	\N	629	\N	\N	\N	\N	\N	\N	996	997	998	999	1000
165	BitShares	BTS	34	2635350000	2635350000	3600570502	1529639645	463	\N	\N	\N	\N	\N	\N	821	822	823	824	825
180	Syscoin	SYS	83	535647927	535647927	888000000	1529639645	541	\N	\N	\N	\N	\N	\N	896	897	898	899	900
201	ExclusiveCoin	EXCL	\N	\N	\N	\N	\N	633	\N	\N	\N	\N	\N	\N	1001	1002	1003	1004	1005
202	Trollcoin	TROLL	\N	\N	\N	\N	\N	638	\N	\N	\N	\N	\N	\N	1006	1007	1008	1009	1010
203	SuperNET	UNITY	\N	\N	\N	\N	\N	643	\N	\N	\N	\N	\N	\N	1011	1012	1013	1014	1015
204	GlobalBoost-Y	BSTY	\N	\N	\N	\N	\N	644	\N	\N	\N	\N	\N	\N	1016	1017	1018	1019	1020
205	DigitalPrice	DP	\N	\N	\N	\N	\N	654	\N	\N	\N	\N	\N	\N	1021	1022	1023	1024	1025
206	Prime-XI	PXI	\N	\N	\N	\N	\N	656	\N	\N	\N	\N	\N	\N	1026	1027	1028	1029	1030
207	Bitswift	SWIFT	\N	\N	\N	\N	\N	659	\N	\N	\N	\N	\N	\N	1031	1032	1033	1034	1035
208	Dashcoin	DSH	\N	\N	\N	\N	\N	660	\N	\N	\N	\N	\N	\N	1036	1037	1038	1039	1040
209	AurumCoin	AU	\N	\N	\N	\N	\N	666	\N	\N	\N	\N	\N	\N	1041	1042	1043	1044	1045
210	Sativacoin	STV	\N	\N	\N	\N	\N	680	\N	\N	\N	\N	\N	\N	1046	1047	1048	1049	1050
212	NuShares	NSR	\N	\N	\N	\N	\N	699	\N	\N	\N	\N	\N	\N	1056	1057	1058	1059	1060
213	SpreadCoin	SPR	\N	\N	\N	\N	\N	702	\N	\N	\N	\N	\N	\N	1061	1062	1063	1064	1065
214	Rimbit	RBT	\N	\N	\N	\N	\N	703	\N	\N	\N	\N	\N	\N	1066	1067	1068	1069	1070
215	MonetaryUnit	MUE	\N	\N	\N	\N	\N	706	\N	\N	\N	\N	\N	\N	1071	1072	1073	1074	1075
216	Blocknet	BLOCK	\N	\N	\N	\N	\N	707	\N	\N	\N	\N	\N	\N	1076	1077	1078	1079	1080
217	Gapcoin	GAP	\N	\N	\N	\N	\N	708	\N	\N	\N	\N	\N	\N	1081	1082	1083	1084	1085
218	TittieCoin	TTC	\N	\N	\N	\N	\N	719	\N	\N	\N	\N	\N	\N	1086	1087	1088	1089	1090
219	Crown	CRW	\N	\N	\N	\N	\N	720	\N	\N	\N	\N	\N	\N	1091	1092	1093	1094	1095
220	BitBay	BAY	\N	\N	\N	\N	\N	723	\N	\N	\N	\N	\N	\N	1096	1097	1098	1099	1100
221	GCN Coin	GCN	\N	\N	\N	\N	\N	730	\N	\N	\N	\N	\N	\N	1101	1102	1103	1104	1105
222	Quotient	XQN	\N	\N	\N	\N	\N	733	\N	\N	\N	\N	\N	\N	1106	1107	1108	1109	1110
223	Bytecent	BYC	\N	\N	\N	\N	\N	734	\N	\N	\N	\N	\N	\N	1111	1112	1113	1114	1115
224	Bitcoin Fast	BCF	\N	\N	\N	\N	\N	747	\N	\N	\N	\N	\N	\N	1116	1117	1118	1119	1120
225	OKCash	OK	\N	\N	\N	\N	\N	760	\N	\N	\N	\N	\N	\N	1121	1122	1123	1124	1125
226	PayCoin	XPY	\N	\N	\N	\N	\N	764	\N	\N	\N	\N	\N	\N	1126	1127	1128	1129	1130
227	vTorrent	VTR	\N	\N	\N	\N	\N	766	\N	\N	\N	\N	\N	\N	1131	1132	1133	1134	1135
228	bitGold	BITGOLD	\N	\N	\N	\N	\N	778	\N	\N	\N	\N	\N	\N	1136	1137	1138	1139	1140
229	Unitus	UIS	\N	\N	\N	\N	\N	781	\N	\N	\N	\N	\N	\N	1141	1142	1143	1144	1145
230	GoldPieces	GP	\N	\N	\N	\N	\N	785	\N	\N	\N	\N	\N	\N	1146	1147	1148	1149	1150
231	Circuits of Value	COVAL	\N	\N	\N	\N	\N	788	\N	\N	\N	\N	\N	\N	1151	1152	1153	1154	1155
232	Nexus	NXS	\N	\N	\N	\N	\N	789	\N	\N	\N	\N	\N	\N	1156	1157	1158	1159	1160
233	SoonCoin	SOON	\N	\N	\N	\N	\N	795	\N	\N	\N	\N	\N	\N	1161	1162	1163	1164	1165
234	MetalCoin	METAL	\N	\N	\N	\N	\N	796	\N	\N	\N	\N	\N	\N	1166	1167	1168	1169	1170
235	IncaKoin	NKA	\N	\N	\N	\N	\N	797	\N	\N	\N	\N	\N	\N	1171	1172	1173	1174	1175
236	SmileyCoin	SMLY	\N	\N	\N	\N	\N	799	\N	\N	\N	\N	\N	\N	1176	1177	1178	1179	1180
237	Machinecoin	MAC	\N	\N	\N	\N	\N	812	\N	\N	\N	\N	\N	\N	1181	1182	1183	1184	1185
238	bitSilver	BITSILVER	\N	\N	\N	\N	\N	813	\N	\N	\N	\N	\N	\N	1186	1187	1188	1189	1190
239	Kobocoin	KOBO	\N	\N	\N	\N	\N	815	\N	\N	\N	\N	\N	\N	1191	1192	1193	1194	1195
240	PayCon	CON	\N	\N	\N	\N	\N	818	\N	\N	\N	\N	\N	\N	1196	1197	1198	1199	1200
241	Bean Cash	BITB	\N	\N	\N	\N	\N	819	\N	\N	\N	\N	\N	\N	1201	1202	1203	1204	1205
242	GeoCoin	GEO	\N	\N	\N	\N	\N	823	\N	\N	\N	\N	\N	\N	1206	1207	1208	1209	1210
244	Dotcoin	DOT	\N	\N	\N	\N	\N	814	\N	\N	\N	\N	\N	\N	1216	1217	1218	1219	1220
245	Wild Beast Block	WBB	\N	\N	\N	\N	\N	831	\N	\N	\N	\N	\N	\N	1221	1222	1223	1224	1225
246	GridCoin	GRC	\N	\N	\N	\N	\N	833	\N	\N	\N	\N	\N	\N	1226	1227	1228	1229	1230
247	Vcash	XVC	\N	\N	\N	\N	\N	836	\N	\N	\N	\N	\N	\N	1231	1232	1233	1234	1235
248	X-Coin	XCO	\N	\N	\N	\N	\N	837	\N	\N	\N	\N	\N	\N	1236	1237	1238	1239	1240
249	Sharkcoin	SAK	\N	\N	\N	\N	\N	841	\N	\N	\N	\N	\N	\N	1241	1242	1243	1244	1245
250	LiteDoge	LDOGE	\N	\N	\N	\N	\N	853	\N	\N	\N	\N	\N	\N	1246	1247	1248	1249	1250
251	UNCoin	UNC	\N	\N	\N	\N	\N	855	\N	\N	\N	\N	\N	\N	1251	1252	1253	1254	1255
252	SongCoin	SONG	\N	\N	\N	\N	\N	857	\N	\N	\N	\N	\N	\N	1256	1257	1258	1259	1260
253	Woodcoin	LOG	\N	\N	\N	\N	\N	859	\N	\N	\N	\N	\N	\N	1261	1262	1263	1264	1265
254	Crave	CRAVE	\N	\N	\N	\N	\N	869	\N	\N	\N	\N	\N	\N	1266	1267	1268	1269	1270
255	Pura	PURA	\N	\N	\N	\N	\N	870	\N	\N	\N	\N	\N	\N	1271	1272	1273	1274	1275
257	8Bit	8BIT	\N	\N	\N	\N	\N	890	\N	\N	\N	\N	\N	\N	1281	1282	1283	1284	1285
258	LeaCoin	LEA	\N	\N	\N	\N	\N	892	\N	\N	\N	\N	\N	\N	1286	1287	1288	1289	1290
259	Neutron	NTRN	\N	\N	\N	\N	\N	894	\N	\N	\N	\N	\N	\N	1291	1292	1293	1294	1295
260	Xaurum	XAUR	\N	\N	\N	\N	\N	895	\N	\N	\N	\N	\N	\N	1296	1297	1298	1299	1300
261	Californium	CF	\N	\N	\N	\N	\N	898	\N	\N	\N	\N	\N	\N	1301	1302	1303	1304	1305
262	Advanced Internet Blocks	AIB	\N	\N	\N	\N	\N	911	\N	\N	\N	\N	\N	\N	1306	1307	1308	1309	1310
263	EggCoin	EGG	\N	\N	\N	\N	\N	912	\N	\N	\N	\N	\N	\N	1311	1312	1313	1314	1315
264	Sphere	SPHR	\N	\N	\N	\N	\N	914	\N	\N	\N	\N	\N	\N	1316	1317	1318	1319	1320
265	MedicCoin	MEDIC	\N	\N	\N	\N	\N	916	\N	\N	\N	\N	\N	\N	1321	1322	1323	1324	1325
266	Bubble	BUB	\N	\N	\N	\N	\N	918	\N	\N	\N	\N	\N	\N	1326	1327	1328	1329	1330
267	MUSE	MUSE	\N	\N	\N	\N	\N	920	\N	\N	\N	\N	\N	\N	1331	1332	1333	1334	1335
268	Universal Currency	UNIT	\N	\N	\N	\N	\N	921	\N	\N	\N	\N	\N	\N	1336	1337	1338	1339	1340
269	ShellCoin	SHELL	\N	\N	\N	\N	\N	924	\N	\N	\N	\N	\N	\N	1341	1342	1343	1344	1345
270	Crypto	CTO	\N	\N	\N	\N	\N	933	\N	\N	\N	\N	\N	\N	1346	1347	1348	1349	1350
271	ParkByte	PKB	\N	\N	\N	\N	\N	934	\N	\N	\N	\N	\N	\N	1351	1352	1353	1354	1355
272	ARbit	ARB	\N	\N	\N	\N	\N	938	\N	\N	\N	\N	\N	\N	1356	1357	1358	1359	1360
273	Gambit	GAM	\N	\N	\N	\N	\N	939	\N	\N	\N	\N	\N	\N	1361	1362	1363	1364	1365
274	Bata	BTA	\N	\N	\N	\N	\N	945	\N	\N	\N	\N	\N	\N	1366	1367	1368	1369	1370
275	AudioCoin	ADC	\N	\N	\N	\N	\N	948	\N	\N	\N	\N	\N	\N	1371	1372	1373	1374	1375
276	Synergy	SNRG	\N	\N	\N	\N	\N	951	\N	\N	\N	\N	\N	\N	1376	1377	1378	1379	1380
277	bitEUR	BITEUR	\N	\N	\N	\N	\N	954	\N	\N	\N	\N	\N	\N	1381	1382	1383	1384	1385
278	UniCoin	UNIC	\N	\N	\N	\N	\N	959	\N	\N	\N	\N	\N	\N	1386	1387	1388	1389	1390
279	FujiCoin	FJC	\N	\N	\N	\N	\N	960	\N	\N	\N	\N	\N	\N	1391	1392	1393	1394	1395
280	EuropeCoin	ERC	\N	\N	\N	\N	\N	964	\N	\N	\N	\N	\N	\N	1396	1397	1398	1399	1400
281	The Cypherfunks	FUNK	\N	\N	\N	\N	\N	965	\N	\N	\N	\N	\N	\N	1401	1402	1403	1404	1405
282	Hexx	HXX	\N	\N	\N	\N	\N	977	\N	\N	\N	\N	\N	\N	1406	1407	1408	1409	1410
283	Ratecoin	XRA	\N	\N	\N	\N	\N	978	\N	\N	\N	\N	\N	\N	1411	1412	1413	1414	1415
284	Metal Music Coin	MTLMC3	\N	\N	\N	\N	\N	983	\N	\N	\N	\N	\N	\N	1416	1417	1418	1419	1420
285	CrevaCoin	CREVA	\N	\N	\N	\N	\N	986	\N	\N	\N	\N	\N	\N	1421	1422	1423	1424	1425
286	IrishCoin	IRL	\N	\N	\N	\N	\N	988	\N	\N	\N	\N	\N	\N	1426	1427	1428	1429	1430
287	Bitzeny	ZNY	\N	\N	\N	\N	\N	990	\N	\N	\N	\N	\N	\N	1431	1432	1433	1434	1435
288	Cycling Coin	CYC	\N	\N	\N	\N	\N	992	\N	\N	\N	\N	\N	\N	1436	1437	1438	1439	1440
289	BowsCoin	BSC	\N	\N	\N	\N	\N	993	\N	\N	\N	\N	\N	\N	1441	1442	1443	1444	1445
290	AnarchistsPrime	ACP	\N	\N	\N	\N	\N	994	\N	\N	\N	\N	\N	\N	1446	1447	1448	1449	1450
291	CompuCoin	CPN	\N	\N	\N	\N	\N	998	\N	\N	\N	\N	\N	\N	1451	1452	1453	1454	1455
292	ChainCoin	CHC	\N	\N	\N	\N	\N	999	\N	\N	\N	\N	\N	\N	1456	1457	1458	1459	1460
293	Sprouts	SPRTS	\N	\N	\N	\N	\N	1002	\N	\N	\N	\N	\N	\N	1461	1462	1463	1464	1465
294	Helleniccoin	HNC	\N	\N	\N	\N	\N	1004	\N	\N	\N	\N	\N	\N	1466	1467	1468	1469	1470
295	Capricoin	CPC	\N	\N	\N	\N	\N	1008	\N	\N	\N	\N	\N	\N	1471	1472	1473	1474	1475
296	Flaxscript	FLAX	\N	\N	\N	\N	\N	1010	\N	\N	\N	\N	\N	\N	1476	1477	1478	1479	1480
297	Manna	MANNA	\N	\N	\N	\N	\N	1019	\N	\N	\N	\N	\N	\N	1481	1482	1483	1484	1485
298	Axiom	AXIOM	\N	\N	\N	\N	\N	1020	\N	\N	\N	\N	\N	\N	1486	1487	1488	1489	1490
299	LEOcoin	LEO	\N	\N	\N	\N	\N	1022	\N	\N	\N	\N	\N	\N	1491	1492	1493	1494	1495
300	Aeon	AEON	\N	\N	\N	\N	\N	1026	\N	\N	\N	\N	\N	\N	1496	1497	1498	1499	1500
302	SJWCoin	SJW	\N	\N	\N	\N	\N	1028	\N	\N	\N	\N	\N	\N	1506	1507	1508	1509	1510
303	TransferCoin	TX	\N	\N	\N	\N	\N	1032	\N	\N	\N	\N	\N	\N	1511	1512	1513	1514	1515
304	GuccioneCoin	GCC	\N	\N	\N	\N	\N	1033	\N	\N	\N	\N	\N	\N	1516	1517	1518	1519	1520
305	AmsterdamCoin	AMS	\N	\N	\N	\N	\N	1035	\N	\N	\N	\N	\N	\N	1521	1522	1523	1524	1525
306	Eurocoin	EUC	\N	\N	\N	\N	\N	1038	\N	\N	\N	\N	\N	\N	1526	1527	1528	1529	1530
308	Global Currency Reserve	GCR	\N	\N	\N	\N	\N	1044	\N	\N	\N	\N	\N	\N	1536	1537	1538	1539	1540
309	Shift	SHIFT	\N	\N	\N	\N	\N	1050	\N	\N	\N	\N	\N	\N	1541	1542	1543	1544	1545
310	VectorAI	VEC2	\N	\N	\N	\N	\N	1052	\N	\N	\N	\N	\N	\N	1546	1547	1548	1549	1550
311	Bolivarcoin	BOLI	\N	\N	\N	\N	\N	1053	\N	\N	\N	\N	\N	\N	1551	1552	1553	1554	1555
312	SpaceCoin	SPACE	\N	\N	\N	\N	\N	1058	\N	\N	\N	\N	\N	\N	1556	1557	1558	1559	1560
313	Bitcrystals	BCY	\N	\N	\N	\N	\N	1063	\N	\N	\N	\N	\N	\N	1561	1562	1563	1564	1565
314	Pakcoin	PAK	\N	\N	\N	\N	\N	1066	\N	\N	\N	\N	\N	\N	1566	1567	1568	1569	1570
315	Influxcoin	INFX	\N	\N	\N	\N	\N	1069	\N	\N	\N	\N	\N	\N	1571	1572	1573	1574	1575
316	Expanse	EXP	\N	\N	\N	\N	\N	1070	\N	\N	\N	\N	\N	\N	1576	1577	1578	1579	1580
317	SIBCoin	SIB	\N	\N	\N	\N	\N	1082	\N	\N	\N	\N	\N	\N	1581	1582	1583	1584	1585
318	IslaCoin	ISL	\N	\N	\N	\N	\N	1084	\N	\N	\N	\N	\N	\N	1586	1587	1588	1589	1590
319	Swing	SWING	\N	\N	\N	\N	\N	1085	\N	\N	\N	\N	\N	\N	1591	1592	1593	1594	1595
321	ParallelCoin	DUO	\N	\N	\N	\N	\N	1089	\N	\N	\N	\N	\N	\N	1601	1602	1603	1604	1605
322	Save and Gain	SANDG	\N	\N	\N	\N	\N	1090	\N	\N	\N	\N	\N	\N	1606	1607	1608	1609	1610
323	Prototanium	PR	\N	\N	\N	\N	\N	1093	\N	\N	\N	\N	\N	\N	1611	1612	1613	1614	1615
324	DigiCube	CUBE	\N	\N	\N	\N	\N	1100	\N	\N	\N	\N	\N	\N	1616	1617	1618	1619	1620
326	StrongHands	SHND	\N	\N	\N	\N	\N	1106	\N	\N	\N	\N	\N	\N	1626	1627	1628	1629	1630
327	PACcoin	$PAC	\N	\N	\N	\N	\N	1107	\N	\N	\N	\N	\N	\N	1631	1632	1633	1634	1635
328	Elite	1337	\N	\N	\N	\N	\N	1109	\N	\N	\N	\N	\N	\N	1636	1637	1638	1639	1640
329	Money	$$$	\N	\N	\N	\N	\N	1110	\N	\N	\N	\N	\N	\N	1641	1642	1643	1644	1645
330	SOILcoin	SOIL	\N	\N	\N	\N	\N	1111	\N	\N	\N	\N	\N	\N	1646	1647	1648	1649	1650
331	SecretCoin	SCRT	\N	\N	\N	\N	\N	1113	\N	\N	\N	\N	\N	\N	1651	1652	1653	1654	1655
332	DraftCoin	DFT	\N	\N	\N	\N	\N	1120	\N	\N	\N	\N	\N	\N	1656	1657	1658	1659	1660
333	OBITS	OBITS	\N	\N	\N	\N	\N	1123	\N	\N	\N	\N	\N	\N	1661	1662	1663	1664	1665
334	Synereo	AMP	\N	\N	\N	\N	\N	1125	\N	\N	\N	\N	\N	\N	1666	1667	1668	1669	1670
335	X2	X2	\N	\N	\N	\N	\N	1131	\N	\N	\N	\N	\N	\N	1671	1672	1673	1674	1675
336	ClubCoin	CLUB	\N	\N	\N	\N	\N	1135	\N	\N	\N	\N	\N	\N	1676	1677	1678	1679	1680
337	Adzcoin	ADZ	\N	\N	\N	\N	\N	1136	\N	\N	\N	\N	\N	\N	1681	1682	1683	1684	1685
338	Moin	MOIN	\N	\N	\N	\N	\N	1141	\N	\N	\N	\N	\N	\N	1686	1687	1688	1689	1690
339	AvatarCoin	AV	\N	\N	\N	\N	\N	1146	\N	\N	\N	\N	\N	\N	1691	1692	1693	1694	1695
340	RussiaCoin	RC	\N	\N	\N	\N	\N	1147	\N	\N	\N	\N	\N	\N	1696	1697	1698	1699	1700
341	EverGreenCoin	EGC	\N	\N	\N	\N	\N	1148	\N	\N	\N	\N	\N	\N	1701	1702	1703	1704	1705
342	Creditbit	CRB	\N	\N	\N	\N	\N	1153	\N	\N	\N	\N	\N	\N	1706	1707	1708	1709	1710
343	Radium	RADS	\N	\N	\N	\N	\N	1154	\N	\N	\N	\N	\N	\N	1711	1712	1713	1714	1715
344	Yocoin	YOC	\N	\N	\N	\N	\N	1156	\N	\N	\N	\N	\N	\N	1716	1717	1718	1719	1720
345	SaluS	SLS	\N	\N	\N	\N	\N	1159	\N	\N	\N	\N	\N	\N	1721	1722	1723	1724	1725
346	Francs	FRN	\N	\N	\N	\N	\N	1164	\N	\N	\N	\N	\N	\N	1726	1728	1730	1732	1734
347	Litecred	LTCR	\N	\N	\N	\N	\N	1155	\N	\N	\N	\N	\N	\N	1727	1729	1731	1733	1735
348	Evil Coin	EVIL	\N	\N	\N	\N	\N	1165	\N	\N	\N	\N	\N	\N	1736	1737	1738	1739	1740
350	Rubies	RBIES	\N	\N	\N	\N	\N	1175	\N	\N	\N	\N	\N	\N	1756	1757	1758	1759	1760
351	Asiadigicoin	ADCN	\N	\N	\N	\N	\N	1176	\N	\N	\N	\N	\N	\N	1761	1762	1763	1764	1765
352	Safe Exchange Coin	SAFEX	\N	\N	\N	\N	\N	1172	\N	\N	\N	\N	\N	\N	1751	1752	1753	1754	1755
354	Destiny	DES	\N	\N	\N	\N	\N	1180	\N	\N	\N	\N	\N	\N	1766	1767	1768	1769	1770
355	C-Bit	XCT	\N	\N	\N	\N	\N	1193	\N	\N	\N	\N	\N	\N	1786	1787	1788	1789	1790
356	Independent Money System	IMS	\N	\N	\N	\N	\N	1194	\N	\N	\N	\N	\N	\N	1791	1792	1793	1794	1795
357	KiloCoin	KLC	\N	\N	\N	\N	\N	1182	\N	\N	\N	\N	\N	\N	1771	1772	1773	1774	1775
358	Memetic / PepeCoin	MEME	\N	\N	\N	\N	\N	1191	\N	\N	\N	\N	\N	\N	1781	1782	1783	1784	1785
359	TrumpCoin	TRUMP	\N	\N	\N	\N	\N	1185	\N	\N	\N	\N	\N	\N	1776	1777	1778	1779	1780
360	HOdlcoin	HODL	\N	\N	\N	\N	\N	1195	\N	\N	\N	\N	\N	\N	1796	1797	1798	1799	1800
361	RevolutionVR	RVR	\N	\N	\N	\N	\N	1208	\N	\N	\N	\N	\N	\N	1816	1817	1818	1819	1820
362	BumbaCoin	BUMBA	\N	\N	\N	\N	\N	1206	\N	\N	\N	\N	\N	\N	1811	1812	1813	1814	1815
363	NevaCoin	NEVA	\N	\N	\N	\N	\N	1200	\N	\N	\N	\N	\N	\N	1806	1807	1808	1809	1810
364	BigUp	BIGUP	\N	\N	\N	\N	\N	1198	\N	\N	\N	\N	\N	\N	1801	1802	1803	1804	1805
365	PosEx	PEX	\N	\N	\N	\N	\N	1209	\N	\N	\N	\N	\N	\N	1821	1822	1823	1824	1825
366	Cabbage	CAB	\N	\N	\N	\N	\N	1210	\N	\N	\N	\N	\N	\N	1826	1827	1828	1829	1830
367	MojoCoin	MOJO	\N	\N	\N	\N	\N	1212	\N	\N	\N	\N	\N	\N	1831	1832	1833	1834	1835
368	GoldMaxCoin	GMX	\N	\N	\N	\N	\N	1213	\N	\N	\N	\N	\N	\N	1836	1837	1838	1839	1840
370	EDRCoin	EDRC	\N	\N	\N	\N	\N	1216	\N	\N	\N	\N	\N	\N	1846	1847	1848	1849	1850
371	PostCoin	POST	\N	\N	\N	\N	\N	1218	\N	\N	\N	\N	\N	\N	1851	1852	1853	1854	1855
372	Qwark	QWARK	\N	\N	\N	\N	\N	1226	\N	\N	\N	\N	\N	\N	1861	1862	1863	1864	1865
374	Fantasy Cash	FANS	\N	\N	\N	\N	\N	1234	\N	\N	\N	\N	\N	\N	1871	1872	1873	1874	1875
375	FuzzBalls	FUZZ	\N	\N	\N	\N	\N	1241	\N	\N	\N	\N	\N	\N	1876	1877	1878	1879	1880
376	BERNcash	BERN	\N	\N	\N	\N	\N	1223	\N	\N	\N	\N	\N	\N	1856	1857	1858	1859	1860
377	Espers	ESP	\N	\N	\N	\N	\N	1238	\N	\N	\N	\N	\N	\N	1886	1887	1888	1889	1890
378	HiCoin	XHI	\N	\N	\N	\N	\N	1244	\N	\N	\N	\N	\N	\N	1881	1882	1883	1884	1885
379	Elcoin	EL	\N	\N	\N	\N	\N	1249	\N	\N	\N	\N	\N	\N	1901	1902	1903	1904	1905
380	Bitcoin 21	XBTC21	\N	\N	\N	\N	\N	1248	\N	\N	\N	\N	\N	\N	1906	1907	1908	1909	1910
381	Zurcoin	ZUR	\N	\N	\N	\N	\N	1250	\N	\N	\N	\N	\N	\N	1911	1912	1913	1914	1915
382	AquariusCoin	ARCO	\N	\N	\N	\N	\N	1247	\N	\N	\N	\N	\N	\N	1896	1897	1898	1899	1900
384	SixEleven	611	\N	\N	\N	\N	\N	1251	\N	\N	\N	\N	\N	\N	1916	1917	1918	1919	1920
385	Alphabit	ABC	\N	\N	\N	\N	\N	1256	\N	\N	\N	\N	\N	\N	1931	1932	1933	1934	1935
386	LanaCoin	LANA	\N	\N	\N	\N	\N	1257	\N	\N	\N	\N	\N	\N	1936	1937	1938	1939	1940
387	2GIVE	2GIVE	\N	\N	\N	\N	\N	1252	\N	\N	\N	\N	\N	\N	1921	1922	1923	1924	1925
388	PlatinumBAR	XPTX	\N	\N	\N	\N	\N	1254	\N	\N	\N	\N	\N	\N	1926	1927	1928	1929	1930
389	PonziCoin	PONZI	\N	\N	\N	\N	\N	1259	\N	\N	\N	\N	\N	\N	1941	1942	1943	1944	1945
390	PrismChain	PRM	\N	\N	\N	\N	\N	1271	\N	\N	\N	\N	\N	\N	1966	1967	1968	1969	1970
391	TeslaCoilCoin	TESLA	\N	\N	\N	\N	\N	1264	\N	\N	\N	\N	\N	\N	1946	1947	1948	1949	1950
392	Nullex	NLX	\N	\N	\N	\N	\N	1268	\N	\N	\N	\N	\N	\N	1956	1957	1958	1959	1960
393	MarteXcoin	MXT	\N	\N	\N	\N	\N	1266	\N	\N	\N	\N	\N	\N	1951	1952	1953	1954	1955
394	RichCoin	RICHX	\N	\N	\N	\N	\N	1269	\N	\N	\N	\N	\N	\N	1961	1962	1963	1964	1965
396	ION	ION	\N	\N	\N	\N	\N	1281	\N	\N	\N	\N	\N	\N	1991	1992	1993	1994	1995
397	Newbium	NEWB	\N	\N	\N	\N	\N	1275	\N	\N	\N	\N	\N	\N	1976	1977	1978	1979	1980
398	ICO OpenLedger	ICOO	\N	\N	\N	\N	\N	1276	\N	\N	\N	\N	\N	\N	1981	1982	1983	1984	1985
399	Powercoin	PWR	\N	\N	\N	\N	\N	1279	\N	\N	\N	\N	\N	\N	1986	1987	1988	1989	1990
400	High Voltage	HVCO	\N	\N	\N	\N	\N	1282	\N	\N	\N	\N	\N	\N	1996	1997	1998	1999	2000
320	Factom	FCT	95	8745102	8745102	\N	1529639650	1087	\N	\N	\N	\N	\N	\N	1596	1597	1598	1599	1600
369	Lisk	LSK	24	107197096	122443544	\N	1529639652	1214	\N	\N	\N	\N	\N	\N	1841	1842	1843	1844	1845
395	Waves	WAVES	39	100000000	100000000	\N	1529639652	1274	\N	\N	\N	\N	\N	\N	1971	1972	1973	1974	1975
373	DigixDAO	DGD	57	2000000	2000000	\N	1529639652	1229	\N	\N	\N	\N	\N	\N	1866	1867	1868	1869	1870
349	PIVX	PIVX	76	56548147	56548147	\N	1529639651	1169	\N	\N	\N	\N	\N	\N	1746	1747	1748	1749	1750
401	Debitcoin	DBTC	\N	\N	\N	\N	\N	1288	\N	\N	\N	\N	\N	\N	2021	2022	2023	2024	2025
402	Mineum	MNM	\N	\N	\N	\N	\N	1283	\N	\N	\N	\N	\N	\N	2001	2002	2003	2004	2005
403	RevolverCoin	XRE	\N	\N	\N	\N	\N	1284	\N	\N	\N	\N	\N	\N	2006	2007	2008	2009	2010
404	GoldBlocks	GB	\N	\N	\N	\N	\N	1285	\N	\N	\N	\N	\N	\N	2011	2012	2013	2014	2015
405	Breakout	BRK	\N	\N	\N	\N	\N	1286	\N	\N	\N	\N	\N	\N	2016	2017	2018	2019	2020
406	Comet	CMT	\N	\N	\N	\N	\N	1291	\N	\N	\N	\N	\N	\N	2026	2027	2028	2029	2030
407	Rise	RISE	\N	\N	\N	\N	\N	1294	\N	\N	\N	\N	\N	\N	2031	2032	2033	2034	2035
408	ChessCoin	CHESS	\N	\N	\N	\N	\N	1297	\N	\N	\N	\N	\N	\N	2036	2037	2038	2039	2040
409	LBRY Credits	LBC	\N	\N	\N	\N	\N	1298	\N	\N	\N	\N	\N	\N	2041	2042	2043	2044	2045
410	PutinCoin	PUT	\N	\N	\N	\N	\N	1299	\N	\N	\N	\N	\N	\N	2046	2047	2048	2049	2050
411	Breakout Stake	BRX	\N	\N	\N	\N	\N	1303	\N	\N	\N	\N	\N	\N	2051	2052	2053	2054	2055
412	Syndicate	SYNX	\N	\N	\N	\N	\N	1304	\N	\N	\N	\N	\N	\N	2056	2057	2058	2059	2060
413	Cryptojacks	CJ	\N	\N	\N	\N	\N	1306	\N	\N	\N	\N	\N	\N	2061	2062	2063	2064	2065
414	HEAT	HEAT	\N	\N	\N	\N	\N	1308	\N	\N	\N	\N	\N	\N	2066	2067	2068	2069	2070
415	LetItRide	LIR	\N	\N	\N	\N	\N	1309	\N	\N	\N	\N	\N	\N	2071	2072	2073	2074	2075
416	Steem Dollars	SBD	\N	\N	\N	\N	\N	1312	\N	\N	\N	\N	\N	\N	2076	2077	2078	2079	2080
417	First Bitcoin	BIT	\N	\N	\N	\N	\N	1323	\N	\N	\N	\N	\N	\N	2096	2097	2098	2099	2100
418	808Coin	808	\N	\N	\N	\N	\N	1322	\N	\N	\N	\N	\N	\N	2091	2092	2093	2094	2095
421	Elementrem	ELE	\N	\N	\N	\N	\N	1334	\N	\N	\N	\N	\N	\N	2101	2102	2103	2104	2105
422	President Trump	PRES	\N	\N	\N	\N	\N	1348	\N	\N	\N	\N	\N	\N	2126	2127	2128	2129	2130
423	Karbo	KRB	\N	\N	\N	\N	\N	1340	\N	\N	\N	\N	\N	\N	2111	2112	2113	2114	2115
424	UGAIN	GAIN	\N	\N	\N	\N	\N	1336	\N	\N	\N	\N	\N	\N	2106	2107	2108	2109	2110
426	VapersCoin	VPRC	\N	\N	\N	\N	\N	1341	\N	\N	\N	\N	\N	\N	2116	2117	2118	2119	2120
427	Aces	ACES	\N	\N	\N	\N	\N	1351	\N	\N	\N	\N	\N	\N	2131	2132	2133	2134	2135
428	E-Dinar Coin	EDR	\N	\N	\N	\N	\N	1358	\N	\N	\N	\N	\N	\N	2151	2152	2153	2154	2155
429	TajCoin	TAJ	\N	\N	\N	\N	\N	1353	\N	\N	\N	\N	\N	\N	2141	2142	2143	2144	2145
430	PX	PX	\N	\N	\N	\N	\N	1357	\N	\N	\N	\N	\N	\N	2146	2147	2148	2149	2150
431	President Johnson	GARY	\N	\N	\N	\N	\N	1352	\N	\N	\N	\N	\N	\N	2136	2137	2138	2139	2140
432	Artex Coin	ATX	\N	\N	\N	\N	\N	1361	\N	\N	\N	\N	\N	\N	2156	2157	2158	2159	2160
433	Experience Points	XP	\N	\N	\N	\N	\N	1367	\N	\N	\N	\N	\N	\N	2161	2162	2163	2164	2165
434	Veltor	VLT	\N	\N	\N	\N	\N	1368	\N	\N	\N	\N	\N	\N	2166	2167	2168	2169	2170
436	Golfcoin	GOLF	\N	\N	\N	\N	\N	1375	\N	\N	\N	\N	\N	\N	2176	2177	2178	2179	2180
437	B3Coin	KB3	\N	\N	\N	\N	\N	1371	\N	\N	\N	\N	\N	\N	2171	2172	2173	2174	2175
438	Jewels	JWL	\N	\N	\N	\N	\N	1379	\N	\N	\N	\N	\N	\N	2186	2187	2188	2189	2190
439	LoMoCoin	LMC	\N	\N	\N	\N	\N	1380	\N	\N	\N	\N	\N	\N	2191	2192	2193	2194	2195
440	Bitcloud	BTDX	\N	\N	\N	\N	\N	1381	\N	\N	\N	\N	\N	\N	2196	2197	2198	2199	2200
441	NoLimitCoin	NLC2	\N	\N	\N	\N	\N	1382	\N	\N	\N	\N	\N	\N	2201	2202	2203	2204	2205
442	VeriumReserve	VRM	\N	\N	\N	\N	\N	1387	\N	\N	\N	\N	\N	\N	2206	2207	2208	2209	2210
443	Tao	XTO	\N	\N	\N	\N	\N	1391	\N	\N	\N	\N	\N	\N	2216	2217	2218	2219	2220
444	Pluton	PLU	\N	\N	\N	\N	\N	1392	\N	\N	\N	\N	\N	\N	2221	2222	2223	2224	2225
445	Zayedcoin	ZYD	\N	\N	\N	\N	\N	1389	\N	\N	\N	\N	\N	\N	2211	2212	2213	2214	2215
446	Dollarcoin	DLC	\N	\N	\N	\N	\N	1395	\N	\N	\N	\N	\N	\N	2226	2227	2228	2229	2230
447	Jin Coin	JIN	\N	\N	\N	\N	\N	1390	\N	\N	\N	\N	\N	\N	2231	2232	2233	2234	2235
448	MustangCoin	MST	\N	\N	\N	\N	\N	1396	\N	\N	\N	\N	\N	\N	2236	2237	2238	2240	2246
449	PROUD Money	PROUD	\N	\N	\N	\N	\N	1398	\N	\N	\N	\N	\N	\N	2242	2251	2252	2253	2254
450	Sequence	SEQ	\N	\N	\N	\N	\N	1399	\N	\N	\N	\N	\N	\N	2256	2257	2258	2259	2260
451	Beatcoin	XBTS	\N	\N	\N	\N	\N	1397	\N	\N	\N	\N	\N	\N	2241	2247	2248	2249	2250
452	Omicron	OMC	\N	\N	\N	\N	\N	1400	\N	\N	\N	\N	\N	\N	2261	2262	2263	2264	2265
453	Pepe Cash	PEPECASH	\N	\N	\N	\N	\N	1405	\N	\N	\N	\N	\N	\N	2271	2272	2273	2274	2275
454	Tellurion	TELL	\N	\N	\N	\N	\N	1393	\N	\N	\N	\N	\N	\N	2239	2243	2244	2245	2255
455	FirstBlood	1ST	\N	\N	\N	\N	\N	1403	\N	\N	\N	\N	\N	\N	2266	2267	2268	2269	2270
456	SingularDTV	SNGLS	\N	\N	\N	\N	\N	1409	\N	\N	\N	\N	\N	\N	2281	2282	2283	2284	2285
458	Iconomi	ICN	\N	\N	\N	\N	\N	1408	\N	\N	\N	\N	\N	\N	2276	2277	2278	2279	2280
459	Rcoin	RCN	\N	\N	\N	\N	\N	1418	\N	\N	\N	\N	\N	\N	2291	2292	2293	2294	2295
460	Atomic Coin	ATOM	\N	\N	\N	\N	\N	1420	\N	\N	\N	\N	\N	\N	2296	2297	2298	2299	2300
461	JobsCoin	JOBS	\N	\N	\N	\N	\N	1421	\N	\N	\N	\N	\N	\N	2301	2302	2303	2304	2305
462	Triggers	TRIG	\N	\N	\N	\N	\N	1423	\N	\N	\N	\N	\N	\N	2306	2307	2308	2309	2310
463	Sakuracoin	SKR	\N	\N	\N	\N	\N	1425	\N	\N	\N	\N	\N	\N	2311	2312	2313	2314	2315
464	Levocoin	LEVO	\N	\N	\N	\N	\N	1429	\N	\N	\N	\N	\N	\N	2316	2317	2318	2319	2320
465	Advanced Technology Coin	ARC	\N	\N	\N	\N	\N	1434	\N	\N	\N	\N	\N	\N	2321	2322	2323	2324	2325
466	Cubits	QBT	\N	\N	\N	\N	\N	1435	\N	\N	\N	\N	\N	\N	2326	2327	2328	2329	2330
467	DynamicCoin	DMC	\N	\N	\N	\N	\N	1436	\N	\N	\N	\N	\N	\N	2331	2332	2333	2334	2335
469	ImpulseCoin	IMPS	\N	\N	\N	\N	\N	1438	\N	\N	\N	\N	\N	\N	2341	2342	2343	2344	2345
470	AllSafe	ASAFE2	\N	\N	\N	\N	\N	1439	\N	\N	\N	\N	\N	\N	2346	2347	2348	2349	2350
471	BipCoin	BIP	\N	\N	\N	\N	\N	1442	\N	\N	\N	\N	\N	\N	2351	2352	2353	2354	2355
472	ZClassic	ZCL	\N	\N	\N	\N	\N	1447	\N	\N	\N	\N	\N	\N	2356	2357	2358	2359	2360
473	Zoin	ZOI	\N	\N	\N	\N	\N	1448	\N	\N	\N	\N	\N	\N	2361	2362	2363	2364	2365
474	WA Space	WA	\N	\N	\N	\N	\N	1449	\N	\N	\N	\N	\N	\N	2366	2367	2368	2369	2370
475	Lykke	LKK	\N	\N	\N	\N	\N	1454	\N	\N	\N	\N	\N	\N	2371	2372	2373	2374	2375
477	ZetaMicron	ZMC	\N	\N	\N	\N	\N	1456	\N	\N	\N	\N	\N	\N	2381	2382	2383	2384	2385
478	Bitcurrency	BTCR	\N	\N	\N	\N	\N	1457	\N	\N	\N	\N	\N	\N	2386	2387	2388	2389	2390
479	Regacoin	REGA	\N	\N	\N	\N	\N	1459	\N	\N	\N	\N	\N	\N	2391	2392	2393	2394	2395
480	LuckChain	BASH	\N	\N	\N	\N	\N	1463	\N	\N	\N	\N	\N	\N	2396	2397	2398	2399	2400
481	Internet of People	IOP	\N	\N	\N	\N	\N	1464	\N	\N	\N	\N	\N	\N	2401	2402	2403	2404	2405
482	Veros	VRS	\N	\N	\N	\N	\N	1465	\N	\N	\N	\N	\N	\N	2406	2407	2408	2409	2410
483	Hush	HUSH	\N	\N	\N	\N	\N	1466	\N	\N	\N	\N	\N	\N	2411	2412	2413	2414	2415
484	Kurrent	KURT	\N	\N	\N	\N	\N	1468	\N	\N	\N	\N	\N	\N	2416	2417	2418	2419	2420
485	Creatio	XCRE	\N	\N	\N	\N	\N	1469	\N	\N	\N	\N	\N	\N	2421	2422	2423	2424	2425
486	Rawcoin	XRC	\N	\N	\N	\N	\N	1472	\N	\N	\N	\N	\N	\N	2426	2427	2428	2429	2430
487	Pascal Coin	PASC	\N	\N	\N	\N	\N	1473	\N	\N	\N	\N	\N	\N	2431	2432	2433	2434	2435
488	Eternity	ENT	\N	\N	\N	\N	\N	1474	\N	\N	\N	\N	\N	\N	2436	2437	2438	2439	2440
489	Incent	INCNT	\N	\N	\N	\N	\N	1475	\N	\N	\N	\N	\N	\N	2441	2442	2443	2444	2445
490	Nexium	NXC	\N	\N	\N	\N	\N	1481	\N	\N	\N	\N	\N	\N	2456	2457	2458	2459	2460
491	vSlice	VSL	\N	\N	\N	\N	\N	1483	\N	\N	\N	\N	\N	\N	2461	2462	2463	2464	2465
492	Dollar Online	DOLLAR	\N	\N	\N	\N	\N	1485	\N	\N	\N	\N	\N	\N	2466	2467	2468	2469	2470
493	DECENT	DCT	\N	\N	\N	\N	\N	1478	\N	\N	\N	\N	\N	\N	2446	2447	2448	2449	2450
494	Golos	GOLOS	\N	\N	\N	\N	\N	1480	\N	\N	\N	\N	\N	\N	2451	2452	2453	2454	2455
495	Vault Coin	VLTC	\N	\N	\N	\N	\N	1486	\N	\N	\N	\N	\N	\N	2471	2472	2473	2474	2475
496	Byteball Bytes	GBYTE	\N	\N	\N	\N	\N	1492	\N	\N	\N	\N	\N	\N	2486	2487	2488	2489	2490
497	PoSW Coin	POSW	\N	\N	\N	\N	\N	1495	\N	\N	\N	\N	\N	\N	2491	2492	2493	2494	2495
498	T-coin	TCOIN	\N	\N	\N	\N	\N	1489	\N	\N	\N	\N	\N	\N	2481	2482	2483	2484	2485
499	Pabyosi Coin (Special)	PCS	\N	\N	\N	\N	\N	1487	\N	\N	\N	\N	\N	\N	2476	2477	2478	2479	2480
476	Golem	GNT	44	839242000	1000000000	\N	1529639655	1455	\N	\N	\N	\N	\N	\N	2376	2377	2378	2379	2380
420	Ardor	ARDR	65	998999495	998999495	998999495	1529639653	1320	\N	\N	\N	\N	\N	\N	2081	2082	2083	2084	2085
457	ZCoin	XZC	100	5020298	5020298	21400000	1529639654	1414	\N	\N	\N	\N	\N	\N	2286	2287	2288	2289	2290
500	Wings	WINGS	\N	\N	\N	\N	\N	1500	\N	\N	\N	\N	\N	\N	2506	2507	2508	2509	2510
501	GameUnits	UNITS	\N	\N	\N	\N	\N	1502	\N	\N	\N	\N	\N	\N	2516	2517	2518	2519	2520
502	Darcrus	DAR	\N	\N	\N	\N	\N	1503	\N	\N	\N	\N	\N	\N	2521	2522	2523	2524	2525
503	Luna Coin	LUNA	\N	\N	\N	\N	\N	1496	\N	\N	\N	\N	\N	\N	2496	2497	2498	2499	2500
504	Dix Asset	DIX	\N	\N	\N	\N	\N	1501	\N	\N	\N	\N	\N	\N	2511	2512	2513	2514	2515
505	Fargocoin	FRGC	\N	\N	\N	\N	\N	1497	\N	\N	\N	\N	\N	\N	2501	2502	2503	2504	2505
506	InflationCoin	IFLT	\N	\N	\N	\N	\N	1504	\N	\N	\N	\N	\N	\N	2526	2527	2528	2529	2530
507	Safe Trade Coin	XSTC	\N	\N	\N	\N	\N	1506	\N	\N	\N	\N	\N	\N	2536	2537	2538	2539	2540
508	Spectrecoin	XSPEC	\N	\N	\N	\N	\N	1505	\N	\N	\N	\N	\N	\N	2531	2532	2533	2534	2535
509	LandCoin	LDCN	\N	\N	\N	\N	\N	1507	\N	\N	\N	\N	\N	\N	2541	2542	2543	2544	2545
510	BenjiRolls	BENJI	\N	\N	\N	\N	\N	1509	\N	\N	\N	\N	\N	\N	2546	2547	2548	2549	2550
511	ICOBID	ICOB	\N	\N	\N	\N	\N	1514	\N	\N	\N	\N	\N	\N	2566	2567	2568	2569	2570
512	iBank	IBANK	\N	\N	\N	\N	\N	1515	\N	\N	\N	\N	\N	\N	2571	2572	2573	2574	2575
514	CryptoCarbon	CCRB	\N	\N	\N	\N	\N	1510	\N	\N	\N	\N	\N	\N	2551	2552	2553	2554	2555
515	BitConnect	BCC	\N	\N	\N	\N	\N	1513	\N	\N	\N	\N	\N	\N	2561	2562	2563	2564	2565
516	PureVidz	VIDZ	\N	\N	\N	\N	\N	1511	\N	\N	\N	\N	\N	\N	2556	2557	2558	2559	2560
517	Digital Rupees	DRS	\N	\N	\N	\N	\N	1520	\N	\N	\N	\N	\N	\N	2581	2582	2583	2584	2585
518	Magnum	MGM	\N	\N	\N	\N	\N	1523	\N	\N	\N	\N	\N	\N	2596	2597	2598	2599	2600
520	FirstCoin	FRST	\N	\N	\N	\N	\N	1522	\N	\N	\N	\N	\N	\N	2591	2592	2593	2594	2595
521	Solarflarecoin	SFC	\N	\N	\N	\N	\N	1525	\N	\N	\N	\N	\N	\N	2606	2607	2608	2609	2610
522	Zilbercoin	ZBC	\N	\N	\N	\N	\N	1526	\N	\N	\N	\N	\N	\N	2611	2612	2613	2614	2615
523	Waves Community Token	WCT	\N	\N	\N	\N	\N	1527	\N	\N	\N	\N	\N	\N	2616	2617	2618	2619	2620
524	Iconic	ICON	\N	\N	\N	\N	\N	1528	\N	\N	\N	\N	\N	\N	2621	2622	2623	2624	2625
525	Tattoocoin (Standard Edition)	TSE	\N	\N	\N	\N	\N	1524	\N	\N	\N	\N	\N	\N	2601	2602	2603	2604	2605
526	KushCoin	KUSH	\N	\N	\N	\N	\N	1529	\N	\N	\N	\N	\N	\N	2626	2627	2628	2629	2630
527	Global Cryptocurrency	GCC	\N	\N	\N	\N	\N	1531	\N	\N	\N	\N	\N	\N	2631	2632	2633	2634	2635
528	Avoncoin	ACN	\N	\N	\N	\N	\N	1533	\N	\N	\N	\N	\N	\N	2636	2637	2638	2639	2640
529	BOAT	BOAT	\N	\N	\N	\N	\N	1534	\N	\N	\N	\N	\N	\N	2641	2642	2643	2644	2645
530	Eryllium	ERY	\N	\N	\N	\N	\N	1535	\N	\N	\N	\N	\N	\N	2646	2647	2648	2649	2650
531	Elysium	ELS	\N	\N	\N	\N	\N	1539	\N	\N	\N	\N	\N	\N	2651	2652	2653	2654	2655
532	Golos Gold	GBG	\N	\N	\N	\N	\N	1542	\N	\N	\N	\N	\N	\N	2656	2657	2658	2659	2660
533	CryptoWorldX Token	CWXT	\N	\N	\N	\N	\N	1544	\N	\N	\N	\N	\N	\N	2661	2662	2663	2664	2665
534	Master Swiscoin	MSCN	\N	\N	\N	\N	\N	1550	\N	\N	\N	\N	\N	\N	2676	2677	2678	2679	2680
535	Marijuanacoin	MAR	\N	\N	\N	\N	\N	1548	\N	\N	\N	\N	\N	\N	2671	2672	2673	2674	2675
536	Centurion	CNT	\N	\N	\N	\N	\N	1546	\N	\N	\N	\N	\N	\N	2666	2667	2668	2669	2670
537	PRCoin	PRC	\N	\N	\N	\N	\N	1555	\N	\N	\N	\N	\N	\N	2691	2692	2693	2694	2695
538	Melon	MLN	\N	\N	\N	\N	\N	1552	\N	\N	\N	\N	\N	\N	2681	2682	2683	2684	2685
539	Argus	ARGUS	\N	\N	\N	\N	\N	1558	\N	\N	\N	\N	\N	\N	2701	2702	2703	2704	2705
540	Chronobank	TIME	\N	\N	\N	\N	\N	1556	\N	\N	\N	\N	\N	\N	2696	2697	2698	2699	2700
541	Allion	ALL	\N	\N	\N	\N	\N	1554	\N	\N	\N	\N	\N	\N	2686	2687	2688	2689	2690
542	Swarm City	SWT	\N	\N	\N	\N	\N	1562	\N	\N	\N	\N	\N	\N	2716	2717	2718	2719	2720
543	PIECoin	PIE	\N	\N	\N	\N	\N	1563	\N	\N	\N	\N	\N	\N	2721	2722	2723	2724	2725
544	UR	UR	\N	\N	\N	\N	\N	1561	\N	\N	\N	\N	\N	\N	2711	2712	2713	2714	2715
545	Renos	RNS	\N	\N	\N	\N	\N	1559	\N	\N	\N	\N	\N	\N	2706	2707	2708	2709	2710
546	Visio	VISIO	\N	\N	\N	\N	\N	1566	\N	\N	\N	\N	\N	\N	2731	2732	2733	2734	2735
548	MarxCoin	MARX	\N	\N	\N	\N	\N	1565	\N	\N	\N	\N	\N	\N	2726	2727	2728	2729	2730
549	LevoPlus	LVPS	\N	\N	\N	\N	\N	1568	\N	\N	\N	\N	\N	\N	2741	2742	2743	2744	2745
550	GeertCoin	GEERT	\N	\N	\N	\N	\N	1570	\N	\N	\N	\N	\N	\N	2746	2747	2748	2749	2750
551	Pascal Lite	PASL	\N	\N	\N	\N	\N	1575	\N	\N	\N	\N	\N	\N	2751	2752	2753	2754	2755
552	MiloCoin	MILO	\N	\N	\N	\N	\N	1576	\N	\N	\N	\N	\N	\N	2756	2757	2758	2759	2760
553	Musicoin	MUSIC	\N	\N	\N	\N	\N	1577	\N	\N	\N	\N	\N	\N	2761	2762	2763	2764	2765
554	Zero	ZER	\N	\N	\N	\N	\N	1578	\N	\N	\N	\N	\N	\N	2766	2767	2768	2769	2770
555	BioBar	BIOB	\N	\N	\N	\N	\N	1579	\N	\N	\N	\N	\N	\N	2771	2772	2773	2774	2775
556	Honey	HONEY	\N	\N	\N	\N	\N	1581	\N	\N	\N	\N	\N	\N	2776	2777	2778	2779	2780
557	Netko	NETKO	\N	\N	\N	\N	\N	1582	\N	\N	\N	\N	\N	\N	2781	2782	2783	2784	2785
559	Dynamic	DYN	\N	\N	\N	\N	\N	1587	\N	\N	\N	\N	\N	\N	2791	2792	2793	2794	2795
560	Tokes	TKS	\N	\N	\N	\N	\N	1588	\N	\N	\N	\N	\N	\N	2796	2797	2798	2799	2800
561	Mercury	MER	\N	\N	\N	\N	\N	1590	\N	\N	\N	\N	\N	\N	2801	2802	2803	2804	2805
562	TaaS	TAAS	\N	\N	\N	\N	\N	1592	\N	\N	\N	\N	\N	\N	2806	2807	2808	2809	2810
563	Edgeless	EDG	\N	\N	\N	\N	\N	1596	\N	\N	\N	\N	\N	\N	2816	2817	2818	2819	2820
564	Bankcoin	B@	\N	\N	\N	\N	\N	1597	\N	\N	\N	\N	\N	\N	2821	2822	2823	2824	2825
565	ZSEcoin	ZSE	\N	\N	\N	\N	\N	1598	\N	\N	\N	\N	\N	\N	2826	2827	2828	2829	2830
566	Soarcoin	SOAR	\N	\N	\N	\N	\N	1595	\N	\N	\N	\N	\N	\N	2811	2812	2813	2814	2815
567	Universe	UNI	\N	\N	\N	\N	\N	1605	\N	\N	\N	\N	\N	\N	2841	2842	2843	2844	2845
568	Solaris	XLR	\N	\N	\N	\N	\N	1606	\N	\N	\N	\N	\N	\N	2846	2847	2848	2849	2850
569	Impact	IMX	\N	\N	\N	\N	\N	1607	\N	\N	\N	\N	\N	\N	2851	2852	2853	2854	2855
570	HealthyWormCoin	WORM	\N	\N	\N	\N	\N	1602	\N	\N	\N	\N	\N	\N	2831	2832	2833	2834	2835
571	Databits	DTB	\N	\N	\N	\N	\N	1603	\N	\N	\N	\N	\N	\N	2836	2837	2838	2839	2840
572	Asch	XAS	\N	\N	\N	\N	\N	1609	\N	\N	\N	\N	\N	\N	2861	2862	2863	2864	2865
573	DubaiCoin	DBIX	\N	\N	\N	\N	\N	1611	\N	\N	\N	\N	\N	\N	2871	2872	2873	2874	2875
574	Darsek	KED	\N	\N	\N	\N	\N	1614	\N	\N	\N	\N	\N	\N	2876	2877	2878	2879	2880
575	Tristar Coin	TSTR	\N	\N	\N	\N	\N	1608	\N	\N	\N	\N	\N	\N	2856	2857	2858	2859	2860
576	Scorecoin	SCORE	\N	\N	\N	\N	\N	1610	\N	\N	\N	\N	\N	\N	2866	2867	2868	2869	2870
577	Matchpool	GUP	\N	\N	\N	\N	\N	1616	\N	\N	\N	\N	\N	\N	2881	2882	2883	2884	2885
578	Atmos	ATMOS	\N	\N	\N	\N	\N	1624	\N	\N	\N	\N	\N	\N	2906	2907	2908	2909	2910
579	Skycoin	SKY	\N	\N	\N	\N	\N	1619	\N	\N	\N	\N	\N	\N	2896	2897	2898	2899	2900
580	BlazerCoin	BLAZR	\N	\N	\N	\N	\N	1623	\N	\N	\N	\N	\N	\N	2901	2902	2903	2904	2905
581	Ultimate Secure Cash	USC	\N	\N	\N	\N	\N	1617	\N	\N	\N	\N	\N	\N	2886	2887	2888	2889	2890
582	E-coin	ECN	\N	\N	\N	\N	\N	1618	\N	\N	\N	\N	\N	\N	2891	2892	2893	2894	2895
583	Ethereum Movie Venture	EMV	\N	\N	\N	\N	\N	1625	\N	\N	\N	\N	\N	\N	2911	2912	2913	2914	2915
584	Zennies	ZENI	\N	\N	\N	\N	\N	1629	\N	\N	\N	\N	\N	\N	2926	2927	2928	2929	2930
585	Coinonat	CXT	\N	\N	\N	\N	\N	1630	\N	\N	\N	\N	\N	\N	2931	2932	2933	2934	2935
586	InPay	INPAY	\N	\N	\N	\N	\N	1626	\N	\N	\N	\N	\N	\N	2916	2917	2918	2919	2920
587	Happycoin	HPC	\N	\N	\N	\N	\N	1628	\N	\N	\N	\N	\N	\N	2921	2922	2923	2924	2925
588	Internet of Things	XOT	\N	\N	\N	\N	\N	1631	\N	\N	\N	\N	\N	\N	2936	2937	2938	2939	2940
589	WeTrust	TRST	\N	\N	\N	\N	\N	1638	\N	\N	\N	\N	\N	\N	2956	2957	2958	2959	2960
590	DeusCoin	DEUS	\N	\N	\N	\N	\N	1640	\N	\N	\N	\N	\N	\N	2961	2962	2963	2964	2965
591	Concoin	CONX	\N	\N	\N	\N	\N	1632	\N	\N	\N	\N	\N	\N	2941	2942	2943	2944	2945
592	XTRABYTES	XBY	\N	\N	\N	\N	\N	1636	\N	\N	\N	\N	\N	\N	2946	2947	2948	2949	2950
593	iExec RLC	RLC	\N	\N	\N	\N	\N	1637	\N	\N	\N	\N	\N	\N	2951	2952	2953	2954	2955
594	Altcoin	ALT	\N	\N	\N	\N	\N	1642	\N	\N	\N	\N	\N	\N	2966	2967	2968	2969	2970
595	ProCurrency	PROC	\N	\N	\N	\N	\N	1650	\N	\N	\N	\N	\N	\N	2986	2987	2988	2989	2990
596	MACRON	MCRN	\N	\N	\N	\N	\N	1644	\N	\N	\N	\N	\N	\N	2976	2977	2978	2979	2980
597	WavesGo	WGO	\N	\N	\N	\N	\N	1643	\N	\N	\N	\N	\N	\N	2971	2972	2973	2974	2975
598	Tattoocoin (Limited Edition)	TLE	\N	\N	\N	\N	\N	1647	\N	\N	\N	\N	\N	\N	2981	2982	2983	2984	2985
513	Maker	MKR	38	618228	1000000	\N	1529639656	1518	\N	\N	\N	\N	\N	\N	2576	2577	2578	2579	2580
519	Komodo	KMD	60	104253976	104253976	\N	1529639656	1521	\N	\N	\N	\N	\N	\N	2586	2587	2588	2589	2590
599	SpeedCash	SCS	\N	\N	\N	\N	\N	1651	\N	\N	\N	\N	\N	\N	2991	2992	2993	2994	2995
600	TokenCard	TKN	\N	\N	\N	\N	\N	1660	\N	\N	\N	\N	\N	\N	3016	3017	3018	3019	3020
601	Bitvolt	VOLT	\N	\N	\N	\N	\N	1657	\N	\N	\N	\N	\N	\N	3001	3002	3003	3004	3005
602	Gnosis	GNO	\N	\N	\N	\N	\N	1659	\N	\N	\N	\N	\N	\N	3011	3012	3013	3014	3015
603	Bitcore	BTX	\N	\N	\N	\N	\N	1654	\N	\N	\N	\N	\N	\N	2996	2997	2998	2999	3000
604	Lunyr	LUN	\N	\N	\N	\N	\N	1658	\N	\N	\N	\N	\N	\N	3006	3007	3008	3009	3010
605	Condensate	RAIN	\N	\N	\N	\N	\N	1662	\N	\N	\N	\N	\N	\N	3021	3022	3023	3024	3025
606	iTicoin	ITI	\N	\N	\N	\N	\N	1671	\N	\N	\N	\N	\N	\N	3041	3042	3043	3044	3045
607	Gold Pressed Latinum	GPL	\N	\N	\N	\N	\N	1665	\N	\N	\N	\N	\N	\N	3026	3027	3028	3029	3030
608	Humaniq	HMQ	\N	\N	\N	\N	\N	1669	\N	\N	\N	\N	\N	\N	3031	3032	3033	3034	3035
609	FUNCoin	FUNC	\N	\N	\N	\N	\N	1670	\N	\N	\N	\N	\N	\N	3036	3037	3038	3039	3040
610	Minereum	MNE	\N	\N	\N	\N	\N	1673	\N	\N	\N	\N	\N	\N	3046	3047	3048	3049	3050
611	InsaneCoin	INSN	\N	\N	\N	\N	\N	1678	\N	\N	\N	\N	\N	\N	3066	3067	3068	3069	3070
612	Halloween Coin	HALLO	\N	\N	\N	\N	\N	1679	\N	\N	\N	\N	\N	\N	3071	3072	3073	3074	3075
613	Cannation	CNNC	\N	\N	\N	\N	\N	1674	\N	\N	\N	\N	\N	\N	3051	3052	3053	3054	3055
614	Etheroll	DICE	\N	\N	\N	\N	\N	1677	\N	\N	\N	\N	\N	\N	3061	3062	3063	3064	3065
615	Creativecoin	CREA	\N	\N	\N	\N	\N	1676	\N	\N	\N	\N	\N	\N	3056	3057	3058	3059	3060
616	Aragon	ANT	\N	\N	\N	\N	\N	1680	\N	\N	\N	\N	\N	\N	3076	3077	3078	3079	3080
617	EcoCoin	ECO	\N	\N	\N	\N	\N	1685	\N	\N	\N	\N	\N	\N	3096	3097	3098	3099	3100
618	PRIZM	PZM	\N	\N	\N	\N	\N	1681	\N	\N	\N	\N	\N	\N	3081	3082	3083	3084	3085
619	RouletteToken	RLT	\N	\N	\N	\N	\N	1683	\N	\N	\N	\N	\N	\N	3086	3087	3088	3089	3090
621	EquiTrader	EQT	\N	\N	\N	\N	\N	1686	\N	\N	\N	\N	\N	\N	3101	3102	3103	3104	3105
622	Theresa May Coin	MAY	\N	\N	\N	\N	\N	1693	\N	\N	\N	\N	\N	\N	3126	3127	3128	3129	3130
623	MCAP	MCAP	\N	\N	\N	\N	\N	1690	\N	\N	\N	\N	\N	\N	3116	3117	3118	3119	3120
624	Digital Money Bits	DMB	\N	\N	\N	\N	\N	1687	\N	\N	\N	\N	\N	\N	3106	3107	3108	3109	3110
625	APX	APX	\N	\N	\N	\N	\N	1688	\N	\N	\N	\N	\N	\N	3111	3112	3113	3114	3115
626	Project-X	NANOX	\N	\N	\N	\N	\N	1691	\N	\N	\N	\N	\N	\N	3121	3122	3123	3124	3125
627	Sumokoin	SUMO	\N	\N	\N	\N	\N	1694	\N	\N	\N	\N	\N	\N	3131	3132	3133	3134	3135
628	Ethbits	ETBS	\N	\N	\N	\N	\N	1699	\N	\N	\N	\N	\N	\N	3151	3152	3153	3154	3155
629	ZenGold	ZENGOLD	\N	\N	\N	\N	\N	1695	\N	\N	\N	\N	\N	\N	3136	3137	3138	3139	3140
631	ZenCash	ZEN	\N	\N	\N	\N	\N	1698	\N	\N	\N	\N	\N	\N	3146	3147	3148	3149	3150
633	Version	V	\N	\N	\N	\N	\N	1702	\N	\N	\N	\N	\N	\N	3161	3162	3163	3164	3165
634	Metaverse ETP	ETP	\N	\N	\N	\N	\N	1703	\N	\N	\N	\N	\N	\N	3166	3167	3168	3169	3170
635	Aidos Kuneen	ADK	\N	\N	\N	\N	\N	1706	\N	\N	\N	\N	\N	\N	3176	3177	3178	3179	3180
636	STEX	STEX	\N	\N	\N	\N	\N	1707	\N	\N	\N	\N	\N	\N	3181	3182	3183	3184	3185
637	Patientory	PTOY	\N	\N	\N	\N	\N	1708	\N	\N	\N	\N	\N	\N	3186	3187	3188	3189	3190
638	Quantum	QAU	\N	\N	\N	\N	\N	1709	\N	\N	\N	\N	\N	\N	3191	3192	3193	3194	3195
640	Electra	ECA	\N	\N	\N	\N	\N	1711	\N	\N	\N	\N	\N	\N	3201	3202	3203	3204	3205
641	eBoost	EBST	\N	\N	\N	\N	\N	1704	\N	\N	\N	\N	\N	\N	3171	3172	3173	3174	3175
642	Quantum Resistant Ledger	QRL	\N	\N	\N	\N	\N	1712	\N	\N	\N	\N	\N	\N	3206	3207	3208	3209	3210
643	Neuro	NRO	\N	\N	\N	\N	\N	1717	\N	\N	\N	\N	\N	\N	3226	3227	3228	3229	3230
644	Ammo Reloaded	AMMO	\N	\N	\N	\N	\N	1716	\N	\N	\N	\N	\N	\N	3221	3222	3223	3224	3225
645	MobileGo	MGO	\N	\N	\N	\N	\N	1715	\N	\N	\N	\N	\N	\N	3216	3217	3218	3219	3220
646	EncryptoTel [WAVES]	ETT	\N	\N	\N	\N	\N	1714	\N	\N	\N	\N	\N	\N	3211	3212	3213	3214	3215
647	Peerplays	PPY	\N	\N	\N	\N	\N	1719	\N	\N	\N	\N	\N	\N	3231	3232	3233	3234	3235
648	Linx	LINX	\N	\N	\N	\N	\N	1724	\N	\N	\N	\N	\N	\N	3256	3257	3258	3259	3260
649	SONM	SNM	\N	\N	\N	\N	\N	1723	\N	\N	\N	\N	\N	\N	3251	3252	3253	3254	3255
651	Mysterium	MYST	\N	\N	\N	\N	\N	1721	\N	\N	\N	\N	\N	\N	3241	3242	3243	3244	3245
652	Legends Room	LGD	\N	\N	\N	\N	\N	1722	\N	\N	\N	\N	\N	\N	3246	3247	3248	3249	3250
653	ZrCoin	ZRC	\N	\N	\N	\N	\N	1726	\N	\N	\N	\N	\N	\N	3261	3262	3263	3264	3265
654	GlobalToken	GLT	\N	\N	\N	\N	\N	1731	\N	\N	\N	\N	\N	\N	3281	3282	3283	3284	3285
655	Cheapcoin	CHEAP	\N	\N	\N	\N	\N	1728	\N	\N	\N	\N	\N	\N	3271	3272	3273	3274	3275
656	Cofound.it	CFI	\N	\N	\N	\N	\N	1729	\N	\N	\N	\N	\N	\N	3276	3277	3278	3279	3280
658	Miners' Reward Token	MRT	\N	\N	\N	\N	\N	1739	\N	\N	\N	\N	\N	\N	3311	3312	3313	3314	3315
659	Numeraire	NMR	\N	\N	\N	\N	\N	1732	\N	\N	\N	\N	\N	\N	3286	3287	3288	3289	3290
660	Octanox	OTX	\N	\N	\N	\N	\N	1733	\N	\N	\N	\N	\N	\N	3291	3292	3293	3294	3295
661	Unify	UNIFY	\N	\N	\N	\N	\N	1736	\N	\N	\N	\N	\N	\N	3296	3297	3298	3299	3300
662	Elastic	XEL	\N	\N	\N	\N	\N	1737	\N	\N	\N	\N	\N	\N	3301	3302	3303	3304	3305
663	Coupecoin	COUPE	\N	\N	\N	\N	\N	1738	\N	\N	\N	\N	\N	\N	3306	3307	3308	3309	3310
664	Dinastycoin	DCY	\N	\N	\N	\N	\N	1745	\N	\N	\N	\N	\N	\N	3331	3332	3333	3334	3335
665	Bitok	BITOK	\N	\N	\N	\N	\N	1741	\N	\N	\N	\N	\N	\N	3316	3317	3318	3319	3320
666	KingN Coin	KNC	\N	\N	\N	\N	\N	1743	\N	\N	\N	\N	\N	\N	3326	3327	3328	3329	3330
667	Huncoin	HNC	\N	\N	\N	\N	\N	1742	\N	\N	\N	\N	\N	\N	3321	3322	3323	3324	3325
668	Leviar	XLC	\N	\N	\N	\N	\N	1746	\N	\N	\N	\N	\N	\N	3336	3337	3338	3339	3340
669	Bitcoin Planet	BTPL	\N	\N	\N	\N	\N	1748	\N	\N	\N	\N	\N	\N	3346	3347	3348	3349	3350
670	Onix	ONX	\N	\N	\N	\N	\N	1747	\N	\N	\N	\N	\N	\N	3341	3342	3343	3344	3345
671	Antimatter	ANTX	\N	\N	\N	\N	\N	1753	\N	\N	\N	\N	\N	\N	3361	3362	3363	3364	3365
673	Goodomy	GOOD	\N	\N	\N	\N	\N	1752	\N	\N	\N	\N	\N	\N	3356	3357	3358	3359	3360
675	Flash	FLASH	\N	\N	\N	\N	\N	1755	\N	\N	\N	\N	\N	\N	3371	3372	3373	3374	3375
676	Pirate Blocks	SKULL	\N	\N	\N	\N	\N	1756	\N	\N	\N	\N	\N	\N	3376	3377	3378	3379	3380
677	Bitradio	BRO	\N	\N	\N	\N	\N	1754	\N	\N	\N	\N	\N	\N	3366	3367	3368	3369	3370
678	TenX	PAY	\N	\N	\N	\N	\N	1758	\N	\N	\N	\N	\N	\N	3386	3387	3388	3389	3390
680	ChanCoin	CHAN	\N	\N	\N	\N	\N	1760	\N	\N	\N	\N	\N	\N	3396	3397	3398	3399	3400
681	Ergo	EFYT	\N	\N	\N	\N	\N	1762	\N	\N	\N	\N	\N	\N	3401	3402	3403	3404	3405
682	BriaCoin	BRIA	\N	\N	\N	\N	\N	1763	\N	\N	\N	\N	\N	\N	3406	3407	3408	3409	3410
684	TurboCoin	TURBO	\N	\N	\N	\N	\N	1767	\N	\N	\N	\N	\N	\N	3416	3417	3418	3419	3420
685	Storj	STORJ	\N	\N	\N	\N	\N	1772	\N	\N	\N	\N	\N	\N	3436	3437	3438	3439	3440
686	BnrtxCoin	BNX	\N	\N	\N	\N	\N	1773	\N	\N	\N	\N	\N	\N	3441	3442	3443	3444	3445
687	Denarius	DNR	\N	\N	\N	\N	\N	1769	\N	\N	\N	\N	\N	\N	3426	3427	3428	3429	3430
688	DAO.Casino	BET	\N	\N	\N	\N	\N	1771	\N	\N	\N	\N	\N	\N	3431	3432	3433	3434	3435
689	AdEx	ADX	\N	\N	\N	\N	\N	1768	\N	\N	\N	\N	\N	\N	3421	3422	3423	3424	3425
690	SocialCoin	SOCC	\N	\N	\N	\N	\N	1774	\N	\N	\N	\N	\N	\N	3446	3447	3448	3449	3450
691	CryptoPing	PING	\N	\N	\N	\N	\N	1777	\N	\N	\N	\N	\N	\N	3461	3462	3463	3464	3465
692	Useless Ethereum Token	UET	\N	\N	\N	\N	\N	1778	\N	\N	\N	\N	\N	\N	3466	3467	3468	3469	3470
693	Monaco	MCO	\N	\N	\N	\N	\N	1776	\N	\N	\N	\N	\N	\N	3456	3457	3458	3459	3460
694	adToken	ADT	\N	\N	\N	\N	\N	1775	\N	\N	\N	\N	\N	\N	3451	3452	3453	3454	3455
695	Wagerr	WGR	\N	\N	\N	\N	\N	1779	\N	\N	\N	\N	\N	\N	3471	3472	3473	3474	3475
697	Slevin	SLEVIN	\N	\N	\N	\N	\N	1781	\N	\N	\N	\N	\N	\N	3476	3477	3478	3479	3480
698	Polybius	PLBT	\N	\N	\N	\N	\N	1784	\N	\N	\N	\N	\N	\N	3491	3492	3493	3494	3495
620	Qtum	QTUM	21	88664516	100664516	\N	1529639660	1684	\N	\N	\N	\N	\N	\N	3091	3092	3093	3094	3095
679	Status	SNT	52	3470483788	6804870174	\N	1529639661	1759	\N	\N	\N	\N	\N	\N	3391	3392	3393	3394	3395
672	GXChain	GXS	61	60000000	100000000	100000000	1529639661	1750	\N	\N	\N	\N	\N	\N	3351	3352	3353	3354	3355
639	Veritaseum	VERI	82	2036645	100000000	\N	1529639660	1710	\N	\N	\N	\N	\N	\N	3196	3197	3198	3199	3200
632	Aeternity	AE	28	233020472	273685830	\N	1529639660	1700	\N	\N	\N	\N	\N	\N	3156	3157	3158	3159	3160
699	Ecobit	ECOB	\N	\N	\N	\N	\N	1782	\N	\N	\N	\N	\N	\N	3481	3482	3483	3484	3485
700	UniversalRoyalCoin	UNRC	\N	\N	\N	\N	\N	1783	\N	\N	\N	\N	\N	\N	3486	3487	3488	3489	3490
701	SunContract	SNC	\N	\N	\N	\N	\N	1786	\N	\N	\N	\N	\N	\N	3501	3502	3503	3504	3505
702	WomenCoin	WOMEN	\N	\N	\N	\N	\N	1790	\N	\N	\N	\N	\N	\N	3521	3522	3523	3524	3525
703	Metal	MTL	\N	\N	\N	\N	\N	1788	\N	\N	\N	\N	\N	\N	3511	3512	3513	3514	3515
704	Jetcoin	JET	\N	\N	\N	\N	\N	1787	\N	\N	\N	\N	\N	\N	3506	3507	3508	3509	3510
706	Virta Unique Coin	VUC	\N	\N	\N	\N	\N	1792	\N	\N	\N	\N	\N	\N	3526	3527	3528	3529	3530
707	Rupee	RUP	\N	\N	\N	\N	\N	1799	\N	\N	\N	\N	\N	\N	3551	3552	3553	3554	3555
708	FuturXe	FXE	\N	\N	\N	\N	\N	1798	\N	\N	\N	\N	\N	\N	3546	3547	3548	3549	3550
709	Bitdeal	BDL	\N	\N	\N	\N	\N	1793	\N	\N	\N	\N	\N	\N	3531	3532	3533	3534	3535
710	DaxxCoin	DAXX	\N	\N	\N	\N	\N	1797	\N	\N	\N	\N	\N	\N	3541	3542	3543	3544	3545
711	Sphre AIR 	XID	\N	\N	\N	\N	\N	1795	\N	\N	\N	\N	\N	\N	3536	3537	3538	3539	3540
712	Global Tour Coin	GTC	\N	\N	\N	\N	\N	1801	\N	\N	\N	\N	\N	\N	3556	3557	3558	3559	3560
713	PeepCoin	PCN	\N	\N	\N	\N	\N	1803	\N	\N	\N	\N	\N	\N	3561	3562	3563	3564	3565
714	Sovereign Hero	HERO	\N	\N	\N	\N	\N	1805	\N	\N	\N	\N	\N	\N	3566	3567	3568	3569	3570
715	Santiment Network Token	SAN	\N	\N	\N	\N	\N	1807	\N	\N	\N	\N	\N	\N	3571	3572	3573	3574	3575
716	Linda	LINDA	\N	\N	\N	\N	\N	1814	\N	\N	\N	\N	\N	\N	3601	3602	3603	3604	3605
717	Embers	MBRS	\N	\N	\N	\N	\N	1815	\N	\N	\N	\N	\N	\N	3606	3607	3608	3609	3610
719	Rialto	XRL	\N	\N	\N	\N	\N	1812	\N	\N	\N	\N	\N	\N	3596	3597	3598	3599	3600
720	CVCoin	CVCOIN	\N	\N	\N	\N	\N	1810	\N	\N	\N	\N	\N	\N	3586	3587	3588	3589	3590
721	Nimiq Exchange Token	NET	\N	\N	\N	\N	\N	1811	\N	\N	\N	\N	\N	\N	3591	3592	3593	3594	3595
722	TerraNova	TER	\N	\N	\N	\N	\N	1809	\N	\N	\N	\N	\N	\N	3581	3582	3583	3584	3585
723	Bit20	BTWTY	\N	\N	\N	\N	\N	1818	\N	\N	\N	\N	\N	\N	3621	3622	3623	3624	3625
724	Civic	CVC	\N	\N	\N	\N	\N	1816	\N	\N	\N	\N	\N	\N	3611	3612	3613	3614	3615
727	Starta	STA	\N	\N	\N	\N	\N	1819	\N	\N	\N	\N	\N	\N	3626	3627	3628	3629	3630
728	SkinCoin	SKIN	\N	\N	\N	\N	\N	1830	\N	\N	\N	\N	\N	\N	3651	3652	3653	3654	3655
729	Particl	PART	\N	\N	\N	\N	\N	1826	\N	\N	\N	\N	\N	\N	3641	3642	3643	3644	3645
730	SmartCash	SMART	\N	\N	\N	\N	\N	1828	\N	\N	\N	\N	\N	\N	3646	3647	3648	3649	3650
731	BitCoal	COAL	\N	\N	\N	\N	\N	1824	\N	\N	\N	\N	\N	\N	3631	3632	3633	3634	3635
732	LiteBitcoin	LBTC	\N	\N	\N	\N	\N	1825	\N	\N	\N	\N	\N	\N	3636	3637	3638	3639	3640
733	Pillar	PLR	\N	\N	\N	\N	\N	1834	\N	\N	\N	\N	\N	\N	3671	3672	3673	3674	3675
734	HarmonyCoin	HMC	\N	\N	\N	\N	\N	1832	\N	\N	\N	\N	\N	\N	3661	3662	3663	3664	3665
735	ToaCoin	TOA	\N	\N	\N	\N	\N	1833	\N	\N	\N	\N	\N	\N	3666	3667	3668	3669	3670
736	Royalties	XRY	\N	\N	\N	\N	\N	1835	\N	\N	\N	\N	\N	\N	3676	3677	3678	3679	3680
738	Signatum	SIGT	\N	\N	\N	\N	\N	1836	\N	\N	\N	\N	\N	\N	3681	3682	3683	3684	3685
739	Coimatic 2.0	CTIC2	\N	\N	\N	\N	\N	1837	\N	\N	\N	\N	\N	\N	3686	3687	3688	3689	3690
740	OracleChain	OCT	\N	\N	\N	\N	\N	1838	\N	\N	\N	\N	\N	\N	3691	3692	3693	3694	3695
741	300 Token	300	\N	\N	\N	\N	\N	1840	\N	\N	\N	\N	\N	\N	3701	3702	3703	3704	3705
742	Primalbase Token	PBT	\N	\N	\N	\N	\N	1841	\N	\N	\N	\N	\N	\N	3706	3707	3708	3709	3710
743	iXledger	IXT	\N	\N	\N	\N	\N	1845	\N	\N	\N	\N	\N	\N	3721	3722	3723	3724	3725
744	CampusCoin	CMPCO	\N	\N	\N	\N	\N	1842	\N	\N	\N	\N	\N	\N	3711	3712	3713	3714	3715
745	EmberCoin	EMB	\N	\N	\N	\N	\N	1843	\N	\N	\N	\N	\N	\N	3716	3717	3718	3719	3720
746	GeyserCoin	GSR	\N	\N	\N	\N	\N	1846	\N	\N	\N	\N	\N	\N	3726	3727	3728	3729	3730
747	Cream	CRM	\N	\N	\N	\N	\N	1850	\N	\N	\N	\N	\N	\N	3746	3747	3748	3749	3750
748	Birds	BIRDS	\N	\N	\N	\N	\N	1849	\N	\N	\N	\N	\N	\N	3741	3742	3743	3744	3745
749	Aseancoin	ASN	\N	\N	\N	\N	\N	1848	\N	\N	\N	\N	\N	\N	3736	3737	3738	3739	3740
750	Mothership	MSP	\N	\N	\N	\N	\N	1847	\N	\N	\N	\N	\N	\N	3731	3732	3733	3734	3735
751	ERA	ERA	\N	\N	\N	\N	\N	1851	\N	\N	\N	\N	\N	\N	3751	3752	3753	3754	3755
752	KekCoin	KEK	\N	\N	\N	\N	\N	1852	\N	\N	\N	\N	\N	\N	3756	3757	3758	3759	3760
753	Stox	STX	\N	\N	\N	\N	\N	1861	\N	\N	\N	\N	\N	\N	3776	3777	3778	3779	3780
754	OAX	OAX	\N	\N	\N	\N	\N	1853	\N	\N	\N	\N	\N	\N	3761	3762	3763	3764	3765
755	district0x	DNT	\N	\N	\N	\N	\N	1856	\N	\N	\N	\N	\N	\N	3766	3767	3768	3769	3770
756	FundYourselfNow	FYN	\N	\N	\N	\N	\N	1857	\N	\N	\N	\N	\N	\N	3771	3772	3773	3774	3775
757	Minex	MINEX	\N	\N	\N	\N	\N	1863	\N	\N	\N	\N	\N	\N	3781	3782	3783	3784	3785
758	Blox	CDT	\N	\N	\N	\N	\N	1864	\N	\N	\N	\N	\N	\N	3786	3787	3788	3789	3790
759	Wink	WINK	\N	\N	\N	\N	\N	1865	\N	\N	\N	\N	\N	\N	3791	3792	3793	3794	3795
761	Mao Zedong	MAO	\N	\N	\N	\N	\N	1869	\N	\N	\N	\N	\N	\N	3801	3802	3803	3804	3805
762	First Bitcoin Capital	BITCF	\N	\N	\N	\N	\N	1871	\N	\N	\N	\N	\N	\N	3806	3807	3808	3809	3810
763	NEVERDIE	NDC	\N	\N	\N	\N	\N	1872	\N	\N	\N	\N	\N	\N	3811	3812	3813	3814	3815
764	Blocktix	TIX	\N	\N	\N	\N	\N	1873	\N	\N	\N	\N	\N	\N	3816	3817	3818	3819	3820
766	Rupaya	RUPX	\N	\N	\N	\N	\N	1877	\N	\N	\N	\N	\N	\N	3826	3827	3828	3829	3830
767	DeepOnion	ONION	\N	\N	\N	\N	\N	1881	\N	\N	\N	\N	\N	\N	3831	3832	3833	3834	3835
768	AdShares	ADST	\N	\N	\N	\N	\N	1883	\N	\N	\N	\N	\N	\N	3846	3847	3848	3849	3850
769	Shadow Token	SHDW	\N	\N	\N	\N	\N	1878	\N	\N	\N	\N	\N	\N	3839	3842	3843	3844	3845
770	BlockCAT	CAT	\N	\N	\N	\N	\N	1882	\N	\N	\N	\N	\N	\N	3836	3837	3838	3840	3841
771	DigitalDevelopersFund	DDF	\N	\N	\N	\N	\N	1884	\N	\N	\N	\N	\N	\N	3851	3852	3853	3854	3855
772	CoinonatX	XCXT	\N	\N	\N	\N	\N	1889	\N	\N	\N	\N	\N	\N	3876	3877	3878	3879	3880
773	BitAsean	BAS	\N	\N	\N	\N	\N	1885	\N	\N	\N	\N	\N	\N	3856	3857	3858	3859	3860
774	Monster Byte	MBI	\N	\N	\N	\N	\N	1887	\N	\N	\N	\N	\N	\N	3866	3867	3868	3869	3870
775	InvestFeed	IFT	\N	\N	\N	\N	\N	1888	\N	\N	\N	\N	\N	\N	3871	3872	3873	3874	3875
776	Dent	DENT	\N	\N	\N	\N	\N	1886	\N	\N	\N	\N	\N	\N	3861	3862	3863	3864	3865
777	Smoke	SMOKE	\N	\N	\N	\N	\N	1898	\N	\N	\N	\N	\N	\N	3901	3902	3903	3904	3905
778	Etheriya	RIYA	\N	\N	\N	\N	\N	1890	\N	\N	\N	\N	\N	\N	3881	3882	3883	3884	3885
779	The ChampCoin	TCC	\N	\N	\N	\N	\N	1894	\N	\N	\N	\N	\N	\N	3886	3887	3888	3889	3890
780	Bolenum	BLN	\N	\N	\N	\N	\N	1897	\N	\N	\N	\N	\N	\N	3896	3897	3898	3899	3900
782	YOYOW	YOYOW	\N	\N	\N	\N	\N	1899	\N	\N	\N	\N	\N	\N	3906	3907	3908	3909	3910
785	MyBit Token	MYB	\N	\N	\N	\N	\N	1902	\N	\N	\N	\N	\N	\N	3916	3917	3918	3919	3920
786	Growers International	GRWI	\N	\N	\N	\N	\N	1900	\N	\N	\N	\N	\N	\N	3911	3912	3913	3914	3915
787	TrueFlip	TFL	\N	\N	\N	\N	\N	1905	\N	\N	\N	\N	\N	\N	3931	3932	3933	3934	3935
788	Protean	PRN	\N	\N	\N	\N	\N	1913	\N	\N	\N	\N	\N	\N	3956	3957	3958	3959	3960
789	ATMCoin	ATMC	\N	\N	\N	\N	\N	1910	\N	\N	\N	\N	\N	\N	3946	3947	3948	3949	3950
790	Dalecoin	DALC	\N	\N	\N	\N	\N	1912	\N	\N	\N	\N	\N	\N	3951	3952	3953	3954	3955
791	XTD Coin	XTD	\N	\N	\N	\N	\N	1907	\N	\N	\N	\N	\N	\N	3936	3937	3938	3939	3940
793	AdCoin	ACC	\N	\N	\N	\N	\N	1915	\N	\N	\N	\N	\N	\N	3961	3962	3963	3964	3965
794	NamoCoin	NAMO	\N	\N	\N	\N	\N	1920	\N	\N	\N	\N	\N	\N	3981	3982	3983	3984	3985
795	bitqy	BQ	\N	\N	\N	\N	\N	1917	\N	\N	\N	\N	\N	\N	3971	3972	3973	3974	3975
796	Achain	ACT	\N	\N	\N	\N	\N	1918	\N	\N	\N	\N	\N	\N	3976	3977	3978	3979	3980
797	BiblePay	BBP	\N	\N	\N	\N	\N	1916	\N	\N	\N	\N	\N	\N	3966	3967	3968	3969	3970
798	SIGMAcoin	SIGMA	\N	\N	\N	\N	\N	1921	\N	\N	\N	\N	\N	\N	3986	3987	3988	3989	3990
783	VeChain	VEN	17	547495525	873378637	\N	1529639664	1904	\N	\N	\N	\N	\N	\N	3926	3927	3928	3929	3930
760	Bytom	BTM	30	1002499275	1407000000	\N	1529639663	1866	\N	\N	\N	\N	\N	\N	3796	3797	3798	3799	3800
705	Populous	PPT	48	37004027	53252246	53252246	1529639662	1789	\N	\N	\N	\N	\N	\N	3516	3517	3518	3519	3520
765	Dentacoin	DCN	72	325226613094	1963173416169	8000000000000	1529639663	1876	\N	\N	\N	\N	\N	\N	3821	3822	3823	3824	3825
725	Ethos	ETHOS	88	76853089	222295208	\N	1529639662	1817	\N	\N	\N	\N	\N	\N	3616	3617	3618	3619	3620
799	Ulatech	ULA	\N	\N	\N	\N	\N	1927	\N	\N	\N	\N	\N	\N	4011	4012	4013	4014	4015
800	BROTHER	BRAT	\N	\N	\N	\N	\N	1926	\N	\N	\N	\N	\N	\N	4006	4007	4008	4009	4010
801	Tierion	TNT	\N	\N	\N	\N	\N	1923	\N	\N	\N	\N	\N	\N	3996	3997	3998	3999	4000
802	Monoeci	XMCC	\N	\N	\N	\N	\N	1922	\N	\N	\N	\N	\N	\N	3991	3992	3993	3994	3995
804	Primas	PST	\N	\N	\N	\N	\N	1930	\N	\N	\N	\N	\N	\N	4016	4017	4018	4019	4020
805	LiteCoin Ultra	LTCU	\N	\N	\N	\N	\N	1935	\N	\N	\N	\N	\N	\N	4036	4037	4038	4039	4040
806	Opus	OPT	\N	\N	\N	\N	\N	1931	\N	\N	\N	\N	\N	\N	4021	4022	4023	4024	4025
808	Suretly	SUR	\N	\N	\N	\N	\N	1933	\N	\N	\N	\N	\N	\N	4026	4027	4028	4029	4030
809	Po.et	POE	\N	\N	\N	\N	\N	1937	\N	\N	\N	\N	\N	\N	4041	4042	4043	4044	4045
810	Fujinto	NTO	\N	\N	\N	\N	\N	1938	\N	\N	\N	\N	\N	\N	4046	4047	4048	4049	4050
811	Kronecoin	KRONE	\N	\N	\N	\N	\N	1943	\N	\N	\N	\N	\N	\N	4056	4057	4058	4059	4060
812	Cyder	CYDER	\N	\N	\N	\N	\N	1945	\N	\N	\N	\N	\N	\N	4061	4062	4063	4064	4065
813	StarCredits	STRC	\N	\N	\N	\N	\N	1942	\N	\N	\N	\N	\N	\N	4051	4052	4053	4054	4055
814	Masternodecoin	MTNC	\N	\N	\N	\N	\N	1946	\N	\N	\N	\N	\N	\N	4066	4067	4068	4069	4070
815	Monetha	MTH	\N	\N	\N	\N	\N	1947	\N	\N	\N	\N	\N	\N	4071	4072	4073	4074	4075
816	Aventus	AVT	\N	\N	\N	\N	\N	1948	\N	\N	\N	\N	\N	\N	4076	4077	4078	4079	4080
817	Agrello	DLT	\N	\N	\N	\N	\N	1949	\N	\N	\N	\N	\N	\N	4081	4082	4083	4084	4085
818	Hive Project	HVN	\N	\N	\N	\N	\N	1950	\N	\N	\N	\N	\N	\N	4086	4087	4088	4089	4090
819	Vsync	VSX	\N	\N	\N	\N	\N	1951	\N	\N	\N	\N	\N	\N	4091	4092	4093	4094	4095
820	Magnetcoin	MAGN	\N	\N	\N	\N	\N	1952	\N	\N	\N	\N	\N	\N	4096	4097	4098	4099	4100
821	Moeda Loyalty Points	MDA	\N	\N	\N	\N	\N	1954	\N	\N	\N	\N	\N	\N	4101	4102	4103	4104	4105
822	Neblio	NEBL	\N	\N	\N	\N	\N	1955	\N	\N	\N	\N	\N	\N	4106	4107	4108	4109	4110
823	VIVO	VIVO	\N	\N	\N	\N	\N	1956	\N	\N	\N	\N	\N	\N	4111	4112	4113	4114	4115
825	DROXNE	DRXNE	\N	\N	\N	\N	\N	1964	\N	\N	\N	\N	\N	\N	4141	4142	4143	4144	4145
826	BuzzCoin	BUZZ	\N	\N	\N	\N	\N	1962	\N	\N	\N	\N	\N	\N	4131	4132	4133	4134	4135
827	Credo	CREDO	\N	\N	\N	\N	\N	1963	\N	\N	\N	\N	\N	\N	4136	4137	4138	4139	4140
828	imbrex	REX	\N	\N	\N	\N	\N	1961	\N	\N	\N	\N	\N	\N	4126	4127	4128	4129	4130
829	Oceanlab	OCL	\N	\N	\N	\N	\N	1959	\N	\N	\N	\N	\N	\N	4121	4122	4123	4124	4125
830	Bowhead	AHT	\N	\N	\N	\N	\N	1965	\N	\N	\N	\N	\N	\N	4146	4147	4148	4149	4150
831	Sociall	SCL	\N	\N	\N	\N	\N	1969	\N	\N	\N	\N	\N	\N	4166	4167	4168	4169	4170
832	XPA	XPA	\N	\N	\N	\N	\N	1968	\N	\N	\N	\N	\N	\N	4161	4162	4163	4164	4165
833	Indorse Token	IND	\N	\N	\N	\N	\N	1967	\N	\N	\N	\N	\N	\N	4156	4157	4158	4159	4160
835	ATBCoin	ATB	\N	\N	\N	\N	\N	1970	\N	\N	\N	\N	\N	\N	4171	4172	4173	4174	4175
836	Blackmoon	BMC	\N	\N	\N	\N	\N	1976	\N	\N	\N	\N	\N	\N	4196	4197	4198	4199	4200
837	Propy	PRO	\N	\N	\N	\N	\N	1974	\N	\N	\N	\N	\N	\N	4186	4187	4188	4189	4190
838	iQuant	IQT	\N	\N	\N	\N	\N	1971	\N	\N	\N	\N	\N	\N	4176	4177	4178	4179	4180
839	ChainLink	LINK	\N	\N	\N	\N	\N	1975	\N	\N	\N	\N	\N	\N	4191	4192	4193	4194	4195
840	Ethereum Dark	ETHD	\N	\N	\N	\N	\N	1973	\N	\N	\N	\N	\N	\N	4181	4182	4183	4184	4185
841	Wi Coin	WIC	\N	\N	\N	\N	\N	1979	\N	\N	\N	\N	\N	\N	4201	4202	4203	4204	4205
842	VIBE	VIBE	\N	\N	\N	\N	\N	1983	\N	\N	\N	\N	\N	\N	4221	4222	4223	4224	4225
844	Billionaire Token	XBL	\N	\N	\N	\N	\N	1981	\N	\N	\N	\N	\N	\N	4211	4212	4213	4214	4215
845	Elixir	ELIX	\N	\N	\N	\N	\N	1980	\N	\N	\N	\N	\N	\N	4206	4207	4208	4209	4210
847	COSS	COSS	\N	\N	\N	\N	\N	1989	\N	\N	\N	\N	\N	\N	4251	4252	4253	4254	4255
848	Chronologic	DAY	\N	\N	\N	\N	\N	1985	\N	\N	\N	\N	\N	\N	4231	4232	4233	4234	4235
849	Lampix	PIX	\N	\N	\N	\N	\N	1988	\N	\N	\N	\N	\N	\N	4246	4247	4248	4249	4250
850	CHIPS	CHIPS	\N	\N	\N	\N	\N	1986	\N	\N	\N	\N	\N	\N	4236	4237	4238	4239	4240
851	CryptoInsight	TKR	\N	\N	\N	\N	\N	1987	\N	\N	\N	\N	\N	\N	4241	4242	4243	4244	4245
852	BitDice	CSNO	\N	\N	\N	\N	\N	1990	\N	\N	\N	\N	\N	\N	4256	4257	4258	4259	4260
853	Target Coin	TGT	\N	\N	\N	\N	\N	1995	\N	\N	\N	\N	\N	\N	4276	4277	4278	4279	4280
854	Interzone	ITZ	\N	\N	\N	\N	\N	1994	\N	\N	\N	\N	\N	\N	4271	4272	4273	4274	4275
855	Rivetz	RVT	\N	\N	\N	\N	\N	1991	\N	\N	\N	\N	\N	\N	4261	4262	4263	4264	4265
857	SALT	SALT	\N	\N	\N	\N	\N	1996	\N	\N	\N	\N	\N	\N	4281	4282	4283	4284	4285
858	TrezarCoin	TZC	\N	\N	\N	\N	\N	2002	\N	\N	\N	\N	\N	\N	4306	4307	4308	4309	4310
859	Musiconomi	MCI	\N	\N	\N	\N	\N	2000	\N	\N	\N	\N	\N	\N	4296	4297	4298	4299	4300
860	Kolion	KLN	\N	\N	\N	\N	\N	1999	\N	\N	\N	\N	\N	\N	4291	4292	4293	4294	4295
861	Ormeus Coin	ORME	\N	\N	\N	\N	\N	1998	\N	\N	\N	\N	\N	\N	4286	4287	4288	4289	4290
862	ColossusXT	COLX	\N	\N	\N	\N	\N	2001	\N	\N	\N	\N	\N	\N	4301	4302	4303	4304	4305
863	HODL Bucks	HDLB	\N	\N	\N	\N	\N	2004	\N	\N	\N	\N	\N	\N	4311	4312	4313	4314	4315
864	MSD	MSD	\N	\N	\N	\N	\N	2008	\N	\N	\N	\N	\N	\N	4331	4332	4333	4334	4335
865	Obsidian	ODN	\N	\N	\N	\N	\N	2005	\N	\N	\N	\N	\N	\N	4316	4317	4318	4319	4320
866	Regalcoin	REC	\N	\N	\N	\N	\N	2007	\N	\N	\N	\N	\N	\N	4326	4327	4328	4329	4330
867	Cobinhood	COB	\N	\N	\N	\N	\N	2006	\N	\N	\N	\N	\N	\N	4321	4322	4323	4324	4325
868	Bismuth	BIS	\N	\N	\N	\N	\N	2009	\N	\N	\N	\N	\N	\N	4336	4337	4338	4339	4340
869	ATMChain	ATM	\N	\N	\N	\N	\N	2015	\N	\N	\N	\N	\N	\N	4361	4362	4363	4364	4365
871	Voise	VOISE	\N	\N	\N	\N	\N	2012	\N	\N	\N	\N	\N	\N	4351	4352	4353	4354	4355
872	Infinity Economics	XIN	\N	\N	\N	\N	\N	2013	\N	\N	\N	\N	\N	\N	4356	4357	4358	4359	4360
873	Tezos (Pre-Launch)	XTZ	\N	\N	\N	\N	\N	2011	\N	\N	\N	\N	\N	\N	4346	4347	4348	4349	4350
874	KickCoin	KICK	\N	\N	\N	\N	\N	2017	\N	\N	\N	\N	\N	\N	4366	4367	4368	4369	4370
875	Internxt	INXT	\N	\N	\N	\N	\N	2022	\N	\N	\N	\N	\N	\N	4386	4387	4388	4389	4390
876	EncryptoTel [ETH]	ETT	\N	\N	\N	\N	\N	2018	\N	\N	\N	\N	\N	\N	4371	4372	4373	4374	4375
877	Viberate	VIB	\N	\N	\N	\N	\N	2019	\N	\N	\N	\N	\N	\N	4376	4377	4378	4379	4380
879	WhaleCoin	WHL	\N	\N	\N	\N	\N	2024	\N	\N	\N	\N	\N	\N	4391	4392	4393	4394	4395
880	REAL	REAL	\N	\N	\N	\N	\N	2030	\N	\N	\N	\N	\N	\N	4416	4417	4418	4419	4420
881	EthBet	EBET	\N	\N	\N	\N	\N	2026	\N	\N	\N	\N	\N	\N	4401	4402	4403	4404	4405
882	FLiK	FLIK	\N	\N	\N	\N	\N	2025	\N	\N	\N	\N	\N	\N	4396	4397	4398	4399	4400
883	Wild Crypto	WILD	\N	\N	\N	\N	\N	2029	\N	\N	\N	\N	\N	\N	4411	4412	4413	4414	4415
885	Hubii Network	HBT	\N	\N	\N	\N	\N	2031	\N	\N	\N	\N	\N	\N	4421	4422	4423	4424	4425
886	PayPie	PPP	\N	\N	\N	\N	\N	2036	\N	\N	\N	\N	\N	\N	4441	4442	4443	4444	4445
887	Crystal Clear 	CCT	\N	\N	\N	\N	\N	2032	\N	\N	\N	\N	\N	\N	4426	4427	4428	4429	4430
888	BridgeCoin	BCO	\N	\N	\N	\N	\N	2033	\N	\N	\N	\N	\N	\N	4431	4432	4433	4434	4435
889	Everex	EVX	\N	\N	\N	\N	\N	2034	\N	\N	\N	\N	\N	\N	4436	4437	4438	4439	4440
890	AirToken	AIR	\N	\N	\N	\N	\N	2037	\N	\N	\N	\N	\N	\N	4446	4447	4448	4449	4450
891	HelloGold	HGT	\N	\N	\N	\N	\N	2042	\N	\N	\N	\N	\N	\N	4471	4472	4473	4474	4475
892	Senderon	SDRN	\N	\N	\N	\N	\N	2039	\N	\N	\N	\N	\N	\N	4456	4457	4458	4459	4460
893	ALIS	ALIS	\N	\N	\N	\N	\N	2040	\N	\N	\N	\N	\N	\N	4461	4462	4463	4464	4465
894	PoSToken	POS	\N	\N	\N	\N	\N	2038	\N	\N	\N	\N	\N	\N	4451	4452	4453	4454	4455
895	BitcoinZ	BTCZ	\N	\N	\N	\N	\N	2041	\N	\N	\N	\N	\N	\N	4466	4467	4468	4469	4470
896	Cindicator	CND	\N	\N	\N	\N	\N	2043	\N	\N	\N	\N	\N	\N	4476	4477	4478	4479	4480
897	Zeusshield	ZSC	\N	\N	\N	\N	\N	2047	\N	\N	\N	\N	\N	\N	4496	4497	4498	4499	4500
899	Bastonet	BSN	\N	\N	\N	\N	\N	2046	\N	\N	\N	\N	\N	\N	4491	4492	4493	4494	4495
878	RChain	RHOC	41	360609817	870663574	1000000000	1529639668	2021	\N	\N	\N	\N	\N	\N	4381	4382	4383	4384	4385
843	Kyber Network	KNC	81	134132697	215625349	\N	1529639666	1982	\N	\N	\N	\N	\N	\N	4216	4217	4218	4219	4220
856	Kin	KIN	91	756097560976	10000000000000	\N	1529639668	1993	\N	\N	\N	\N	\N	\N	4266	4267	4268	4269	4270
834	Decentraland	MANA	98	1050141509	2644403343	\N	1529639666	1966	\N	\N	\N	\N	\N	\N	4151	4152	4153	4154	4155
807	Loopring	LRC	59	572074043	1374956262	\N	1529639664	1934	\N	\N	\N	\N	\N	\N	4031	4032	4033	4034	4035
900	Coimatic 3.0	CTIC3	\N	\N	\N	\N	\N	2045	\N	\N	\N	\N	\N	\N	4486	4487	4488	4489	4490
901	Ethereum Cash	ECASH	\N	\N	\N	\N	\N	2048	\N	\N	\N	\N	\N	\N	4501	4502	4503	4504	4505
902	Akuya Coin	AKY	\N	\N	\N	\N	\N	2054	\N	\N	\N	\N	\N	\N	4526	4527	4528	4529	4530
903	Authorship	ATS	\N	\N	\N	\N	\N	2051	\N	\N	\N	\N	\N	\N	4516	4517	4518	4519	4520
904	CORION	COR	\N	\N	\N	\N	\N	2049	\N	\N	\N	\N	\N	\N	4506	4507	4508	4509	4510
905	Swisscoin	SIC	\N	\N	\N	\N	\N	2050	\N	\N	\N	\N	\N	\N	4511	4512	4513	4514	4515
906	Royal Kingdom Coin	RKC	\N	\N	\N	\N	\N	2053	\N	\N	\N	\N	\N	\N	4521	4522	4523	4524	4525
907	ExchangeN	EXN	\N	\N	\N	\N	\N	2055	\N	\N	\N	\N	\N	\N	4531	4532	4533	4534	4535
908	BitSoar	BSR	\N	\N	\N	\N	\N	2059	\N	\N	\N	\N	\N	\N	4551	4552	4553	4554	4555
909	PiplCoin	PIPL	\N	\N	\N	\N	\N	2056	\N	\N	\N	\N	\N	\N	4536	4537	4538	4539	4540
910	Eidoo	EDO	\N	\N	\N	\N	\N	2057	\N	\N	\N	\N	\N	\N	4541	4542	4543	4544	4545
911	AirSwap	AST	\N	\N	\N	\N	\N	2058	\N	\N	\N	\N	\N	\N	4546	4547	4548	4549	4550
912	Change	CAG	\N	\N	\N	\N	\N	2060	\N	\N	\N	\N	\N	\N	4556	4557	4558	4559	4560
913	XGOX	XGOX	\N	\N	\N	\N	\N	2065	\N	\N	\N	\N	\N	\N	4581	4582	4583	4584	4585
914	BlockMason Credit Protocol	BCPT	\N	\N	\N	\N	\N	2061	\N	\N	\N	\N	\N	\N	4561	4562	4563	4564	4565
916	Tracto	TRCT	\N	\N	\N	\N	\N	2063	\N	\N	\N	\N	\N	\N	4571	4572	4573	4574	4575
917	Maecenas	ART	\N	\N	\N	\N	\N	2064	\N	\N	\N	\N	\N	\N	4576	4577	4578	4579	4580
918	Everus	EVR	\N	\N	\N	\N	\N	2066	\N	\N	\N	\N	\N	\N	4586	4587	4588	4589	4590
919	Request Network	REQ	\N	\N	\N	\N	\N	2071	\N	\N	\N	\N	\N	\N	4606	4607	4608	4609	4610
920	Open Trading Network	OTN	\N	\N	\N	\N	\N	2069	\N	\N	\N	\N	\N	\N	4596	4597	4598	4599	4600
921	Dutch Coin	DUTCH	\N	\N	\N	\N	\N	2067	\N	\N	\N	\N	\N	\N	4591	4592	4593	4594	4595
922	DomRaider	DRT	\N	\N	\N	\N	\N	2070	\N	\N	\N	\N	\N	\N	4601	4602	4603	4604	4605
923	SegWit2x	B2X	\N	\N	\N	\N	\N	2072	\N	\N	\N	\N	\N	\N	4611	4612	4613	4614	4615
924	Hedge	HDG	\N	\N	\N	\N	\N	2079	\N	\N	\N	\N	\N	\N	4636	4637	4638	4639	4640
925	Blue Protocol	BLUE	\N	\N	\N	\N	\N	2076	\N	\N	\N	\N	\N	\N	4621	4622	4623	4624	4625
926	Runners	RUNNERS	\N	\N	\N	\N	\N	2077	\N	\N	\N	\N	\N	\N	4626	4627	4628	4629	4630
927	Ethereum Gold	ETG	\N	\N	\N	\N	\N	2074	\N	\N	\N	\N	\N	\N	4616	4617	4618	4619	4620
928	LIFE	LIFE	\N	\N	\N	\N	\N	2078	\N	\N	\N	\N	\N	\N	4631	4632	4633	4634	4635
929	Modum	MOD	\N	\N	\N	\N	\N	2080	\N	\N	\N	\N	\N	\N	4641	4642	4643	4644	4645
930	ICOS	ICOS	\N	\N	\N	\N	\N	2082	\N	\N	\N	\N	\N	\N	4651	4652	4653	4654	4655
931	Ambrosus	AMB	\N	\N	\N	\N	\N	2081	\N	\N	\N	\N	\N	\N	4646	4647	4648	4649	4650
934	ClearPoll	POLL	\N	\N	\N	\N	\N	2089	\N	\N	\N	\N	\N	\N	4671	4672	4673	4674	4675
935	LATOKEN	LA	\N	\N	\N	\N	\N	2090	\N	\N	\N	\N	\N	\N	4676	4677	4678	4679	4680
936	Exchange Union	XUC	\N	\N	\N	\N	\N	2091	\N	\N	\N	\N	\N	\N	4681	4682	4683	4684	4685
937	EXRNchain	EXRN	\N	\N	\N	\N	\N	2088	\N	\N	\N	\N	\N	\N	4666	4667	4668	4669	4670
939	Bitcoin Red	BTCRED	\N	\N	\N	\N	\N	2093	\N	\N	\N	\N	\N	\N	4691	4692	4693	4694	4695
940	Paragon	PRG	\N	\N	\N	\N	\N	2094	\N	\N	\N	\N	\N	\N	4696	4697	4698	4699	4700
941	Ripio Credit Network	RCN	\N	\N	\N	\N	\N	2096	\N	\N	\N	\N	\N	\N	4706	4707	4708	4709	4710
942	BOScoin	BOS	\N	\N	\N	\N	\N	2095	\N	\N	\N	\N	\N	\N	4701	4702	4703	4704	4705
943	Mercury Protocol	GMT	\N	\N	\N	\N	\N	2098	\N	\N	\N	\N	\N	\N	4711	4712	4713	4714	4715
944	Ethereum Lite	ELITE	\N	\N	\N	\N	\N	2101	\N	\N	\N	\N	\N	\N	4726	4727	4728	4729	4730
946	Intelligent Trading Foundation	ITT	\N	\N	\N	\N	\N	2103	\N	\N	\N	\N	\N	\N	4731	4732	4733	4734	4735
947	JavaScript Token	JS	\N	\N	\N	\N	\N	2100	\N	\N	\N	\N	\N	\N	4721	4722	4723	4724	4725
948	Xenon	XNN	\N	\N	\N	\N	\N	2106	\N	\N	\N	\N	\N	\N	4746	4747	4748	4749	4750
949	iEthereum	IETH	\N	\N	\N	\N	\N	2104	\N	\N	\N	\N	\N	\N	4736	4737	4738	4739	4740
950	Pirl	PIRL	\N	\N	\N	\N	\N	2105	\N	\N	\N	\N	\N	\N	4741	4742	4743	4744	4745
951	Network Token	NTWK	\N	\N	\N	\N	\N	2109	\N	\N	\N	\N	\N	\N	4756	4757	4758	4759	4760
952	Dovu	DOVU	\N	\N	\N	\N	\N	2110	\N	\N	\N	\N	\N	\N	4761	4762	4763	4764	4765
953	LUXCoin	LUX	\N	\N	\N	\N	\N	2107	\N	\N	\N	\N	\N	\N	4751	4752	4753	4754	4755
954	Red Pulse	RPX	\N	\N	\N	\N	\N	2112	\N	\N	\N	\N	\N	\N	4766	4767	4768	4769	4770
955	BT2 [CST]	BT2	\N	\N	\N	\N	\N	2114	\N	\N	\N	\N	\N	\N	4771	4772	4773	4774	4775
956	PlayerCoin	PLACO	\N	\N	\N	\N	\N	2115	\N	\N	\N	\N	\N	\N	4776	4777	4778	4779	4780
957	FAPcoin	FAP	\N	\N	\N	\N	\N	2118	\N	\N	\N	\N	\N	\N	4786	4787	4788	4789	4790
958	BTCMoon	BTCM	\N	\N	\N	\N	\N	2119	\N	\N	\N	\N	\N	\N	4791	4792	4793	4794	4795
959	Etherparty	FUEL	\N	\N	\N	\N	\N	2120	\N	\N	\N	\N	\N	\N	4796	4797	4798	4799	4800
960	Roofs	ROOFS	\N	\N	\N	\N	\N	2117	\N	\N	\N	\N	\N	\N	4781	4782	4783	4784	4785
961	Ellaism	ELLA	\N	\N	\N	\N	\N	2122	\N	\N	\N	\N	\N	\N	4801	4802	4803	4804	4805
962	Vulcano	VULC	\N	\N	\N	\N	\N	2123	\N	\N	\N	\N	\N	\N	4806	4807	4808	4809	4810
963	Qvolta	QVT	\N	\N	\N	\N	\N	2124	\N	\N	\N	\N	\N	\N	4811	4812	4813	4814	4815
964	Russian Miner Coin	RMC	\N	\N	\N	\N	\N	2125	\N	\N	\N	\N	\N	\N	4816	4817	4818	4819	4820
965	FlypMe	FYP	\N	\N	\N	\N	\N	2126	\N	\N	\N	\N	\N	\N	4821	4822	4823	4824	4825
966	eBitcoin	EBTC	\N	\N	\N	\N	\N	2127	\N	\N	\N	\N	\N	\N	4826	4827	4828	4829	4830
967	Bitbase	BTBc	\N	\N	\N	\N	\N	2129	\N	\N	\N	\N	\N	\N	4831	4832	4833	4834	4835
968	Enjin Coin	ENJ	\N	\N	\N	\N	\N	2130	\N	\N	\N	\N	\N	\N	4836	4837	4838	4839	4840
969	Power Ledger	POWR	\N	\N	\N	\N	\N	2132	\N	\N	\N	\N	\N	\N	4841	4842	4843	4844	4845
970	Grid+	GRID	\N	\N	\N	\N	\N	2134	\N	\N	\N	\N	\N	\N	4846	4847	4848	4849	4850
971	Revain	R	\N	\N	\N	\N	\N	2135	\N	\N	\N	\N	\N	\N	4851	4852	4853	4854	4855
972	ATLANT	ATL	\N	\N	\N	\N	\N	2136	\N	\N	\N	\N	\N	\N	4856	4857	4858	4859	4860
973	Electroneum	ETN	\N	\N	\N	\N	\N	2137	\N	\N	\N	\N	\N	\N	4861	4862	4863	4864	4865
974	High Gain	HIGH	\N	\N	\N	\N	\N	2138	\N	\N	\N	\N	\N	\N	4866	4867	4868	4869	4870
975	MinexCoin	MNX	\N	\N	\N	\N	\N	2139	\N	\N	\N	\N	\N	\N	4871	4872	4873	4874	4875
976	SONO	SONO	\N	\N	\N	\N	\N	2140	\N	\N	\N	\N	\N	\N	4876	4877	4878	4879	4880
977	FORCE	FOR	\N	\N	\N	\N	\N	2142	\N	\N	\N	\N	\N	\N	4881	4882	4883	4884	4885
978	Streamr DATAcoin	DATA	\N	\N	\N	\N	\N	2143	\N	\N	\N	\N	\N	\N	4886	4887	4888	4889	4890
979	SHIELD	XSH	\N	\N	\N	\N	\N	2144	\N	\N	\N	\N	\N	\N	4891	4892	4893	4894	4895
980	Pure	PURE	\N	\N	\N	\N	\N	2146	\N	\N	\N	\N	\N	\N	4896	4897	4898	4899	4900
981	ELTCOIN	ELTCOIN	\N	\N	\N	\N	\N	2147	\N	\N	\N	\N	\N	\N	4901	4902	4903	4904	4905
982	Desire	DSR	\N	\N	\N	\N	\N	2148	\N	\N	\N	\N	\N	\N	4906	4907	4908	4909	4910
983	Unikoin Gold	UKG	\N	\N	\N	\N	\N	2149	\N	\N	\N	\N	\N	\N	4911	4912	4913	4914	4915
984	Credence Coin	CRDNC	\N	\N	\N	\N	\N	2150	\N	\N	\N	\N	\N	\N	4916	4917	4918	4919	4920
985	Autonio	NIO	\N	\N	\N	\N	\N	2151	\N	\N	\N	\N	\N	\N	4921	4922	4923	4924	4925
986	CarTaxi Token	CTX	\N	\N	\N	\N	\N	2152	\N	\N	\N	\N	\N	\N	4926	4927	4928	4929	4930
987	Aeron	ARN	\N	\N	\N	\N	\N	2153	\N	\N	\N	\N	\N	\N	4931	4932	4933	4934	4935
988	StarCash Network	STARS	\N	\N	\N	\N	\N	2157	\N	\N	\N	\N	\N	\N	4936	4937	4938	4939	4940
989	Phore	PHR	\N	\N	\N	\N	\N	2158	\N	\N	\N	\N	\N	\N	4941	4942	4943	4944	4945
990	Farad	FRD	\N	\N	\N	\N	\N	2159	\N	\N	\N	\N	\N	\N	4946	4947	4948	4949	4950
991	Innova	INN	\N	\N	\N	\N	\N	2160	\N	\N	\N	\N	\N	\N	4951	4952	4953	4954	4955
992	Raiden Network Token	RDN	\N	\N	\N	\N	\N	2161	\N	\N	\N	\N	\N	\N	4956	4957	4958	4959	4960
993	Delphy	DPY	\N	\N	\N	\N	\N	2162	\N	\N	\N	\N	\N	\N	4961	4962	4963	4964	4965
994	Blockpool	BPL	\N	\N	\N	\N	\N	2167	\N	\N	\N	\N	\N	\N	4981	4982	4983	4984	4985
995	Oxycoin	OXY	\N	\N	\N	\N	\N	2170	\N	\N	\N	\N	\N	\N	4986	4987	4988	4989	4990
996	Abjcoin	ABJ	\N	\N	\N	\N	\N	2171	\N	\N	\N	\N	\N	\N	4991	4992	4993	4994	4995
997	ERC20	ERC20	\N	\N	\N	\N	\N	2165	\N	\N	\N	\N	\N	\N	4971	4972	4973	4974	4975
998	Zephyr	ZEPH	\N	\N	\N	\N	\N	2163	\N	\N	\N	\N	\N	\N	4966	4967	4968	4969	4970
999	Ties.DB	TIE	\N	\N	\N	\N	\N	2166	\N	\N	\N	\N	\N	\N	4976	4977	4978	4979	4980
938	Nuls	NULS	97	40000000	40000000	\N	1529639670	2092	\N	\N	\N	\N	\N	\N	4686	4687	4688	4689	4690
1000	Emphy	EPY	\N	\N	\N	\N	\N	2172	\N	\N	\N	\N	\N	\N	4996	4997	4998	4999	5000
1001	Interstellar Holdings	HOLD	\N	\N	\N	\N	\N	2173	\N	\N	\N	\N	\N	\N	5001	5002	5003	5004	5005
1002	Grimcoin	GRIM	\N	\N	\N	\N	\N	2168	\N	\N	\N	\N	\N	\N	5006	5007	5008	5009	5010
1003	DecentBet	DBET	\N	\N	\N	\N	\N	2175	\N	\N	\N	\N	\N	\N	5011	5012	5013	5014	5015
1004	Hat.Exchange	HAT	\N	\N	\N	\N	\N	2179	\N	\N	\N	\N	\N	\N	5036	5037	5038	5039	5040
1005	bitJob	STU	\N	\N	\N	\N	\N	2180	\N	\N	\N	\N	\N	\N	5041	5042	5043	5044	5045
1006	NEO GOLD	NEOG	\N	\N	\N	\N	\N	2174	\N	\N	\N	\N	\N	\N	5021	5022	5023	5024	5025
1007	Decision Token	HST	\N	\N	\N	\N	\N	2176	\N	\N	\N	\N	\N	\N	5016	5017	5018	5019	5020
1008	Sharechain	SSS	\N	\N	\N	\N	\N	2177	\N	\N	\N	\N	\N	\N	5026	5027	5028	5029	5030
1009	Upfiring	UFR	\N	\N	\N	\N	\N	2178	\N	\N	\N	\N	\N	\N	5031	5032	5033	5034	5035
1010	Genesis Vision	GVT	\N	\N	\N	\N	\N	2181	\N	\N	\N	\N	\N	\N	5046	5047	5048	5049	5050
1011	EagleCoin	EAGLE	\N	\N	\N	\N	\N	2182	\N	\N	\N	\N	\N	\N	5051	5052	5053	5054	5055
1012	EA Coin	EAG	\N	\N	\N	\N	\N	2183	\N	\N	\N	\N	\N	\N	5056	5057	5058	5059	5060
1013	Privatix	PRIX	\N	\N	\N	\N	\N	2184	\N	\N	\N	\N	\N	\N	5061	5062	5063	5064	5065
1014	GOLD Reward Token	GRX	\N	\N	\N	\N	\N	2192	\N	\N	\N	\N	\N	\N	5091	5092	5093	5094	5095
1015	SISA	SISA	\N	\N	\N	\N	\N	2189	\N	\N	\N	\N	\N	\N	5076	5077	5078	5079	5080
1016	Astro	ASTRO	\N	\N	\N	\N	\N	2190	\N	\N	\N	\N	\N	\N	5081	5082	5083	5084	5085
1017	IntenseCoin	ITNS	\N	\N	\N	\N	\N	2185	\N	\N	\N	\N	\N	\N	5066	5067	5068	5069	5070
1018	EBCH	EBCH	\N	\N	\N	\N	\N	2187	\N	\N	\N	\N	\N	\N	5071	5072	5073	5074	5075
1019	Paypex	PAYX	\N	\N	\N	\N	\N	2191	\N	\N	\N	\N	\N	\N	5086	5087	5088	5089	5090
1020	Aerium	AERM	\N	\N	\N	\N	\N	2193	\N	\N	\N	\N	\N	\N	5096	5097	5098	5099	5100
1021	Sugar Exchange	SGR	\N	\N	\N	\N	\N	2196	\N	\N	\N	\N	\N	\N	5106	5107	5108	5109	5110
1022	Viuly	VIU	\N	\N	\N	\N	\N	2198	\N	\N	\N	\N	\N	\N	5111	5112	5113	5114	5115
1023	BitSerial	BTE	\N	\N	\N	\N	\N	2194	\N	\N	\N	\N	\N	\N	5101	5102	5103	5104	5105
1024	ALQO	ALQO	\N	\N	\N	\N	\N	2199	\N	\N	\N	\N	\N	\N	5116	5117	5118	5119	5120
1025	WINCOIN	WC	\N	\N	\N	\N	\N	2201	\N	\N	\N	\N	\N	\N	5126	5127	5128	5129	5130
1026	Oyster	PRL	\N	\N	\N	\N	\N	2202	\N	\N	\N	\N	\N	\N	5131	5132	5133	5134	5135
1027	GoByte	GBX	\N	\N	\N	\N	\N	2200	\N	\N	\N	\N	\N	\N	5121	5122	5123	5124	5125
1028	Phantomx	PNX	\N	\N	\N	\N	\N	2205	\N	\N	\N	\N	\N	\N	5141	5142	5143	5144	5145
1029	B2BX	B2B	\N	\N	\N	\N	\N	2204	\N	\N	\N	\N	\N	\N	5136	5137	5138	5139	5140
1030	DigiPulse	DGPT	\N	\N	\N	\N	\N	2207	\N	\N	\N	\N	\N	\N	5146	5147	5148	5149	5150
1031	Quantstamp	QSP	\N	\N	\N	\N	\N	2212	\N	\N	\N	\N	\N	\N	5166	5167	5168	5169	5170
1032	Ink	INK	\N	\N	\N	\N	\N	2209	\N	\N	\N	\N	\N	\N	5156	5157	5158	5159	5160
1033	EncrypGen	DNA	\N	\N	\N	\N	\N	2208	\N	\N	\N	\N	\N	\N	5151	5152	5153	5154	5155
1034	Bodhi	BOT	\N	\N	\N	\N	\N	2211	\N	\N	\N	\N	\N	\N	5161	5162	5163	5164	5165
1036	SpankChain	SPANK	\N	\N	\N	\N	\N	2219	\N	\N	\N	\N	\N	\N	5196	5197	5198	5199	5200
1037	Publica	PBL	\N	\N	\N	\N	\N	2217	\N	\N	\N	\N	\N	\N	5186	5187	5188	5189	5190
1038	ZoZoCoin	ZZC	\N	\N	\N	\N	\N	2214	\N	\N	\N	\N	\N	\N	5176	5177	5178	5179	5180
1039	Energo	TSL	\N	\N	\N	\N	\N	2215	\N	\N	\N	\N	\N	\N	5181	5182	5183	5184	5185
1040	Magnet	MAG	\N	\N	\N	\N	\N	2218	\N	\N	\N	\N	\N	\N	5191	5192	5193	5194	5195
1041	VoteCoin	VOT	\N	\N	\N	\N	\N	2221	\N	\N	\N	\N	\N	\N	5201	5202	5203	5204	5205
1042	Accelerator Network	ACC	\N	\N	\N	\N	\N	2225	\N	\N	\N	\N	\N	\N	5221	5222	5223	5224	5225
1043	BLOCKv	VEE	\N	\N	\N	\N	\N	2223	\N	\N	\N	\N	\N	\N	5211	5212	5213	5214	5215
1045	POLY AI	AI	\N	\N	\N	\N	\N	2224	\N	\N	\N	\N	\N	\N	5216	5217	5218	5219	5220
1046	PlexCoin	PLX	\N	\N	\N	\N	\N	2228	\N	\N	\N	\N	\N	\N	5226	5227	5228	5229	5230
1047	Time New Bank	TNB	\N	\N	\N	\N	\N	2235	\N	\N	\N	\N	\N	\N	5251	5252	5253	5254	5255
1048	Divi	DIVX	\N	\N	\N	\N	\N	2229	\N	\N	\N	\N	\N	\N	5231	5232	5233	5234	5235
1049	Monkey Project	MONK	\N	\N	\N	\N	\N	2230	\N	\N	\N	\N	\N	\N	5236	5237	5238	5239	5240
1050	Flixxo	FLIXX	\N	\N	\N	\N	\N	2231	\N	\N	\N	\N	\N	\N	5241	5242	5243	5244	5245
1051	GlassCoin	GLS	\N	\N	\N	\N	\N	2232	\N	\N	\N	\N	\N	\N	5246	5247	5248	5249	5250
1052	MyWish	WISH	\N	\N	\N	\N	\N	2236	\N	\N	\N	\N	\N	\N	5256	5257	5258	5259	5260
1053	Ccore	CCO	\N	\N	\N	\N	\N	2241	\N	\N	\N	\N	\N	\N	5276	5277	5278	5279	5280
1054	ETHLend	LEND	\N	\N	\N	\N	\N	2239	\N	\N	\N	\N	\N	\N	5266	5267	5268	5269	5270
1055	onG.social	ONG	\N	\N	\N	\N	\N	2240	\N	\N	\N	\N	\N	\N	5271	5272	5273	5274	5275
1056	EventChain	EVC	\N	\N	\N	\N	\N	2237	\N	\N	\N	\N	\N	\N	5261	5262	5263	5264	5265
1057	Qbao	QBT	\N	\N	\N	\N	\N	2242	\N	\N	\N	\N	\N	\N	5281	5282	5283	5284	5285
1058	BlockCDN	BCDN	\N	\N	\N	\N	\N	2247	\N	\N	\N	\N	\N	\N	5306	5307	5308	5309	5310
1059	Presearch	PRE	\N	\N	\N	\N	\N	2245	\N	\N	\N	\N	\N	\N	5296	5297	5298	5299	5300
1060	Dragonchain	DRGN	\N	\N	\N	\N	\N	2243	\N	\N	\N	\N	\N	\N	5286	5287	5288	5289	5290
1061	Payfair	PFR	\N	\N	\N	\N	\N	2244	\N	\N	\N	\N	\N	\N	5291	5292	5293	5294	5295
1063	Cappasity	CAPP	\N	\N	\N	\N	\N	2248	\N	\N	\N	\N	\N	\N	5311	5312	5313	5314	5315
1064	Jiyo	JIYO	\N	\N	\N	\N	\N	2253	\N	\N	\N	\N	\N	\N	5331	5332	5333	5334	5335
1065	IoT Chain	ITC	\N	\N	\N	\N	\N	2251	\N	\N	\N	\N	\N	\N	5326	5327	5328	5329	5330
1066	Eroscoin	ERO	\N	\N	\N	\N	\N	2249	\N	\N	\N	\N	\N	\N	5316	5317	5318	5319	5320
1067	MagicCoin	MAGE	\N	\N	\N	\N	\N	2250	\N	\N	\N	\N	\N	\N	5321	5322	5323	5324	5325
1068	Social Send	SEND	\N	\N	\N	\N	\N	2255	\N	\N	\N	\N	\N	\N	5336	5337	5338	5339	5340
1069	Bulwark	BWK	\N	\N	\N	\N	\N	2260	\N	\N	\N	\N	\N	\N	5361	5362	5363	5364	5365
1070	Nekonium	NUKO	\N	\N	\N	\N	\N	2257	\N	\N	\N	\N	\N	\N	5346	5347	5348	5349	5350
1071	Bonpay	BON	\N	\N	\N	\N	\N	2256	\N	\N	\N	\N	\N	\N	5341	5342	5343	5344	5345
1072	Snovio	SNOV	\N	\N	\N	\N	\N	2258	\N	\N	\N	\N	\N	\N	5351	5352	5353	5354	5355
1073	StrikeBitClub	SBC	\N	\N	\N	\N	\N	2259	\N	\N	\N	\N	\N	\N	5356	5357	5358	5359	5360
1074	SagaCoin	SAGA	\N	\N	\N	\N	\N	2261	\N	\N	\N	\N	\N	\N	5366	5367	5368	5369	5370
1075	Pioneer Coin	PCOIN	\N	\N	\N	\N	\N	2265	\N	\N	\N	\N	\N	\N	5386	5387	5388	5389	5390
1076	Kubera Coin	KBR	\N	\N	\N	\N	\N	2263	\N	\N	\N	\N	\N	\N	5376	5377	5378	5379	5380
1077	Tokugawa	TOK	\N	\N	\N	\N	\N	2264	\N	\N	\N	\N	\N	\N	5381	5382	5383	5384	5385
1078	COMSA [ETH]	CMS	\N	\N	\N	\N	\N	2262	\N	\N	\N	\N	\N	\N	5371	5372	5373	5374	5375
1079	COMSA [XEM]	CMS	\N	\N	\N	\N	\N	2266	\N	\N	\N	\N	\N	\N	5391	5392	5393	5394	5395
1080	Verify	CRED	\N	\N	\N	\N	\N	2271	\N	\N	\N	\N	\N	\N	5416	5417	5418	5419	5420
1081	CrowdCoin	CRC	\N	\N	\N	\N	\N	2268	\N	\N	\N	\N	\N	\N	5401	5402	5403	5404	5405
1082	WandX	WAND	\N	\N	\N	\N	\N	2269	\N	\N	\N	\N	\N	\N	5406	5407	5408	5409	5410
1083	SportyCo	SPF	\N	\N	\N	\N	\N	2270	\N	\N	\N	\N	\N	\N	5411	5412	5413	5414	5415
1084	WaBi	WABI	\N	\N	\N	\N	\N	2267	\N	\N	\N	\N	\N	\N	5396	5397	5398	5399	5400
1085	Soma	SCT	\N	\N	\N	\N	\N	2272	\N	\N	\N	\N	\N	\N	5421	5422	5423	5424	5425
1086	Ignis	IGNIS	\N	\N	\N	\N	\N	2276	\N	\N	\N	\N	\N	\N	5441	5442	5443	5444	5445
1087	Uquid Coin	UQC	\N	\N	\N	\N	\N	2273	\N	\N	\N	\N	\N	\N	5426	5427	5428	5429	5430
1088	MediShares	MDS	\N	\N	\N	\N	\N	2274	\N	\N	\N	\N	\N	\N	5431	5432	5433	5434	5435
1089	ProChain	PRA	\N	\N	\N	\N	\N	2275	\N	\N	\N	\N	\N	\N	5436	5437	5438	5439	5440
1090	SmartMesh	SMT	\N	\N	\N	\N	\N	2277	\N	\N	\N	\N	\N	\N	5446	5447	5448	5449	5450
1091	Super Bitcoin	SBTC	\N	\N	\N	\N	\N	2282	\N	\N	\N	\N	\N	\N	5471	5472	5473	5474	5475
1092	HollyWoodCoin	HWC	\N	\N	\N	\N	\N	2278	\N	\N	\N	\N	\N	\N	5451	5452	5453	5454	5455
1093	BitcoinX	BCX	\N	\N	\N	\N	\N	2281	\N	\N	\N	\N	\N	\N	5466	5467	5468	5469	5470
1094	Playkey	PKT	\N	\N	\N	\N	\N	2279	\N	\N	\N	\N	\N	\N	5456	5457	5458	5459	5460
1095	Filecoin [Futures]	FIL	\N	\N	\N	\N	\N	2280	\N	\N	\N	\N	\N	\N	5461	5462	5463	5464	5465
1096	Datum	DAT	\N	\N	\N	\N	\N	2283	\N	\N	\N	\N	\N	\N	5476	5477	5478	5479	5480
1097	MicroMoney	AMM	\N	\N	\N	\N	\N	2286	\N	\N	\N	\N	\N	\N	5491	5492	5493	5494	5495
1098	LockTrip	LOC	\N	\N	\N	\N	\N	2287	\N	\N	\N	\N	\N	\N	5496	5497	5498	5499	5500
1099	Trident Group	TRDT	\N	\N	\N	\N	\N	2284	\N	\N	\N	\N	\N	\N	5481	5482	5483	5484	5485
1062	CyberMiles	CMT	77	692459959	1000000000	\N	1529639673	2246	\N	\N	\N	\N	\N	\N	5301	5302	5303	5304	5305
1100	Bitair	BTCA	\N	\N	\N	\N	\N	2285	\N	\N	\N	\N	\N	\N	5486	5487	5488	5489	5490
1101	Worldcore	WRC	\N	\N	\N	\N	\N	2288	\N	\N	\N	\N	\N	\N	5501	5502	5503	5504	5505
1102	Starbase	STAR	\N	\N	\N	\N	\N	2295	\N	\N	\N	\N	\N	\N	5526	5527	5528	5529	5530
1103	Gifto	GTO	\N	\N	\N	\N	\N	2289	\N	\N	\N	\N	\N	\N	5506	5507	5508	5509	5510
1104	Genaro Network	GNX	\N	\N	\N	\N	\N	2291	\N	\N	\N	\N	\N	\N	5516	5517	5518	5519	5520
1105	YENTEN	YTN	\N	\N	\N	\N	\N	2290	\N	\N	\N	\N	\N	\N	5511	5512	5513	5514	5515
1106	United Bitcoin	UBTC	\N	\N	\N	\N	\N	2293	\N	\N	\N	\N	\N	\N	5521	5522	5523	5524	5525
1107	WAX	WAX	\N	\N	\N	\N	\N	2300	\N	\N	\N	\N	\N	\N	5551	5552	5553	5554	5555
1108	Storm	STORM	\N	\N	\N	\N	\N	2297	\N	\N	\N	\N	\N	\N	5531	5532	5533	5534	5535
1109	Dynamic Trading Rights	DTR	\N	\N	\N	\N	\N	2298	\N	\N	\N	\N	\N	\N	5541	5542	5543	5544	5545
1111	OST	OST	\N	\N	\N	\N	\N	2296	\N	\N	\N	\N	\N	\N	5536	5537	5538	5539	5540
1112	DEW	DEW	\N	\N	\N	\N	\N	2304	\N	\N	\N	\N	\N	\N	5556	5557	5558	5559	5560
1113	Bread	BRD	\N	\N	\N	\N	\N	2306	\N	\N	\N	\N	\N	\N	5571	5572	5573	5574	5575
1114	NAGA	NGC	\N	\N	\N	\N	\N	2305	\N	\N	\N	\N	\N	\N	5561	5562	5563	5564	5565
1115	MediBloc	MED	\N	\N	\N	\N	\N	2303	\N	\N	\N	\N	\N	\N	5566	5567	5568	5569	5570
1116	Dai	DAI	\N	\N	\N	\N	\N	2308	\N	\N	\N	\N	\N	\N	5581	5582	5583	5584	5585
1118	DIMCOIN	DIM	\N	\N	\N	\N	\N	2312	\N	\N	\N	\N	\N	\N	5601	5602	5603	5604	5605
1119	Bounty0x	BNTY	\N	\N	\N	\N	\N	2310	\N	\N	\N	\N	\N	\N	5591	5592	5593	5594	5595
1120	Ace	ACE	\N	\N	\N	\N	\N	2311	\N	\N	\N	\N	\N	\N	5596	5597	5598	5599	5600
1121	SophiaTX	SPHTX	\N	\N	\N	\N	\N	2309	\N	\N	\N	\N	\N	\N	5586	5587	5588	5589	5590
1122	SIRIN LABS Token	SRN	\N	\N	\N	\N	\N	2313	\N	\N	\N	\N	\N	\N	5606	5607	5608	5609	5610
1123	HomeBlockCoin	HBC	\N	\N	\N	\N	\N	2317	\N	\N	\N	\N	\N	\N	5626	5627	5628	5629	5630
1124	Neumark	NEU	\N	\N	\N	\N	\N	2318	\N	\N	\N	\N	\N	\N	5631	5632	5633	5634	5635
1125	HTMLCOIN	HTML	\N	\N	\N	\N	\N	2315	\N	\N	\N	\N	\N	\N	5616	5617	5618	5619	5620
1126	DeepBrain Chain	DBC	\N	\N	\N	\N	\N	2316	\N	\N	\N	\N	\N	\N	5621	5622	5623	5624	5625
1127	Cryptopay	CPAY	\N	\N	\N	\N	\N	2314	\N	\N	\N	\N	\N	\N	5611	5612	5613	5614	5615
1128	UTRUST	UTK	\N	\N	\N	\N	\N	2320	\N	\N	\N	\N	\N	\N	5636	5637	5638	5639	5640
1129	Matryx	MTX	\N	\N	\N	\N	\N	2325	\N	\N	\N	\N	\N	\N	5656	5657	5658	5659	5660
1130	BigONE Token	BIG	\N	\N	\N	\N	\N	2324	\N	\N	\N	\N	\N	\N	5651	5652	5653	5654	5655
1131	QLINK	QLC	\N	\N	\N	\N	\N	2321	\N	\N	\N	\N	\N	\N	5641	5642	5643	5644	5645
1132	HEROcoin	PLAY	\N	\N	\N	\N	\N	2323	\N	\N	\N	\N	\N	\N	5646	5647	5648	5649	5650
1133	Madcoin	MDC	\N	\N	\N	\N	\N	2326	\N	\N	\N	\N	\N	\N	5661	5662	5663	5664	5665
1134	Olympus Labs	MOT	\N	\N	\N	\N	\N	2327	\N	\N	\N	\N	\N	\N	5666	5667	5668	5669	5670
1135	STRAKS	STAK	\N	\N	\N	\N	\N	2332	\N	\N	\N	\N	\N	\N	5686	5687	5688	5689	5690
1136	Hyper Pay	HPY	\N	\N	\N	\N	\N	2329	\N	\N	\N	\N	\N	\N	5671	5672	5673	5674	5675
1137	Pylon Network	PYLNT	\N	\N	\N	\N	\N	2330	\N	\N	\N	\N	\N	\N	5676	5677	5678	5679	5680
1138	FidentiaX	FDX	\N	\N	\N	\N	\N	2333	\N	\N	\N	\N	\N	\N	5691	5692	5693	5694	5695
1139	BitClave	CAT	\N	\N	\N	\N	\N	2334	\N	\N	\N	\N	\N	\N	5696	5697	5698	5699	5700
1140	Lightning Bitcoin	LBTC	\N	\N	\N	\N	\N	2335	\N	\N	\N	\N	\N	\N	5701	5702	5703	5704	5705
1141	Lamden	TAU	\N	\N	\N	\N	\N	2337	\N	\N	\N	\N	\N	\N	5706	5707	5708	5709	5710
1142	Escroco	ESC	\N	\N	\N	\N	\N	2338	\N	\N	\N	\N	\N	\N	5711	5713	5714	5715	5716
1143	Game.com	GTC	\N	\N	\N	\N	\N	2336	\N	\N	\N	\N	\N	\N	5712	5717	5718	5719	5720
1144	ENTCash	ENT	\N	\N	\N	\N	\N	2331	\N	\N	\N	\N	\N	\N	5681	5682	5683	5684	5685
1145	Bloom	BLT	\N	\N	\N	\N	\N	2340	\N	\N	\N	\N	\N	\N	5721	5722	5723	5724	5725
1146	CanYaCoin	CAN	\N	\N	\N	\N	\N	2343	\N	\N	\N	\N	\N	\N	5736	5737	5738	5739	5740
1147	AppCoins	APPC	\N	\N	\N	\N	\N	2344	\N	\N	\N	\N	\N	\N	5741	5742	5743	5744	5745
1148	SwftCoin	SWFTC	\N	\N	\N	\N	\N	2341	\N	\N	\N	\N	\N	\N	5726	5727	5728	5729	5730
1149	Covesting	COV	\N	\N	\N	\N	\N	2342	\N	\N	\N	\N	\N	\N	5731	5732	5733	5734	5735
1150	High Performance Blockchain	HPB	\N	\N	\N	\N	\N	2345	\N	\N	\N	\N	\N	\N	5746	5747	5748	5749	5750
1151	GameChain System	GCS	\N	\N	\N	\N	\N	2350	\N	\N	\N	\N	\N	\N	5771	5772	5773	5774	5775
1153	NumusCash	NUMUS	\N	\N	\N	\N	\N	2347	\N	\N	\N	\N	\N	\N	5754	5757	5758	5759	5760
1154	Mixin	XIN	\N	\N	\N	\N	\N	2349	\N	\N	\N	\N	\N	\N	5766	5767	5768	5769	5770
1155	Measurable Data Token	MDT	\N	\N	\N	\N	\N	2348	\N	\N	\N	\N	\N	\N	5761	5762	5763	5764	5765
1156	Numus	NMS	\N	\N	\N	\N	\N	2351	\N	\N	\N	\N	\N	\N	5776	5777	5778	5779	5780
1157	OP Coin	OPC	\N	\N	\N	\N	\N	2355	\N	\N	\N	\N	\N	\N	5796	5797	5798	5799	5800
1158	CryptopiaFeeShares	CEFS	\N	\N	\N	\N	\N	2353	\N	\N	\N	\N	\N	\N	5786	5787	5788	5789	5790
1159	Coinlancer	CL	\N	\N	\N	\N	\N	2352	\N	\N	\N	\N	\N	\N	5781	5782	5783	5784	5785
1160	GET Protocol	GET	\N	\N	\N	\N	\N	2354	\N	\N	\N	\N	\N	\N	5791	5792	5793	5794	5795
1161	CFun	CFUN	\N	\N	\N	\N	\N	2356	\N	\N	\N	\N	\N	\N	5801	5802	5803	5804	5805
1162	Show	SHOW	\N	\N	\N	\N	\N	2361	\N	\N	\N	\N	\N	\N	5826	5827	5828	5829	5830
1163	AI Doctor	AIDOC	\N	\N	\N	\N	\N	2357	\N	\N	\N	\N	\N	\N	5806	5807	5808	5809	5810
1164	Polis	POLIS	\N	\N	\N	\N	\N	2359	\N	\N	\N	\N	\N	\N	5816	5817	5818	5819	5820
1165	Content and AD Network	CAN	\N	\N	\N	\N	\N	2358	\N	\N	\N	\N	\N	\N	5811	5812	5813	5814	5815
1166	Hacken	HKN	\N	\N	\N	\N	\N	2360	\N	\N	\N	\N	\N	\N	5821	5822	5823	5824	5825
1167	Steneum Coin	STN	\N	\N	\N	\N	\N	2362	\N	\N	\N	\N	\N	\N	5831	5832	5833	5834	5835
1168	Aigang	AIX	\N	\N	\N	\N	\N	2367	\N	\N	\N	\N	\N	\N	5851	5852	5853	5854	5855
1169	Zap	ZAP	\N	\N	\N	\N	\N	2363	\N	\N	\N	\N	\N	\N	5836	5837	5838	5839	5840
1170	TokenClub	TCT	\N	\N	\N	\N	\N	2364	\N	\N	\N	\N	\N	\N	5841	5842	5843	5844	5845
1171	FairGame	FAIR	\N	\N	\N	\N	\N	2366	\N	\N	\N	\N	\N	\N	5846	5847	5848	5849	5850
1172	REBL	REBL	\N	\N	\N	\N	\N	2368	\N	\N	\N	\N	\N	\N	5856	5857	5858	5859	5860
1173	Trade Token	TIO	\N	\N	\N	\N	\N	2373	\N	\N	\N	\N	\N	\N	5881	5882	5883	5884	5885
1174	Commodity Ad Network	CDX	\N	\N	\N	\N	\N	2372	\N	\N	\N	\N	\N	\N	5876	5877	5878	5879	5880
1175	United Traders Token	UTT	\N	\N	\N	\N	\N	2371	\N	\N	\N	\N	\N	\N	5871	5872	5873	5874	5875
1176	Bitcoin God	GOD	\N	\N	\N	\N	\N	2370	\N	\N	\N	\N	\N	\N	5866	5867	5868	5869	5870
1177	INS Ecosystem	INS	\N	\N	\N	\N	\N	2369	\N	\N	\N	\N	\N	\N	5861	5862	5863	5864	5865
1178	QunQun	QUN	\N	\N	\N	\N	\N	2375	\N	\N	\N	\N	\N	\N	5891	5892	5893	5894	5895
1179	Karma	KRM	\N	\N	\N	\N	\N	2378	\N	\N	\N	\N	\N	\N	5906	5907	5908	5909	5910
1180	TopChain	TOPC	\N	\N	\N	\N	\N	2376	\N	\N	\N	\N	\N	\N	5896	5897	5898	5899	5900
1181	Leverj	LEV	\N	\N	\N	\N	\N	2377	\N	\N	\N	\N	\N	\N	5901	5902	5903	5904	5905
1182	BitDegree	BDG	\N	\N	\N	\N	\N	2374	\N	\N	\N	\N	\N	\N	5886	5887	5888	5889	5890
1183	Spectre.ai Dividend Token	SXDT	\N	\N	\N	\N	\N	2381	\N	\N	\N	\N	\N	\N	5916	5917	5918	5919	5920
1184	Vezt	VZT	\N	\N	\N	\N	\N	2384	\N	\N	\N	\N	\N	\N	5931	5932	5933	5934	5935
1185	Jingtum Tech	SWTC	\N	\N	\N	\N	\N	2383	\N	\N	\N	\N	\N	\N	5936	5937	5938	5939	5940
1186	Kcash	KCASH	\N	\N	\N	\N	\N	2379	\N	\N	\N	\N	\N	\N	5911	5912	5913	5914	5915
1187	Spectre.ai Utility Token	SXUT	\N	\N	\N	\N	\N	2382	\N	\N	\N	\N	\N	\N	5926	5927	5928	5929	5930
1188	ATN	ATN	\N	\N	\N	\N	\N	2380	\N	\N	\N	\N	\N	\N	5921	5922	5923	5924	5925
1189	Cloud	CLD	\N	\N	\N	\N	\N	2385	\N	\N	\N	\N	\N	\N	5941	5942	5943	5944	5945
1190	Bankex	BKX	\N	\N	\N	\N	\N	2390	\N	\N	\N	\N	\N	\N	5961	5962	5963	5964	5965
1191	United Crypto Community	UCOM	\N	\N	\N	\N	\N	2386	\N	\N	\N	\N	\N	\N	5946	5947	5948	5949	5950
1192	Bitcoin Atom	BCA	\N	\N	\N	\N	\N	2387	\N	\N	\N	\N	\N	\N	5951	5952	5953	5954	5955
1193	ugChain	UGC	\N	\N	\N	\N	\N	2389	\N	\N	\N	\N	\N	\N	5956	5957	5958	5959	5960
1194	EchoLink	EKO	\N	\N	\N	\N	\N	2391	\N	\N	\N	\N	\N	\N	5966	5967	5968	5969	5970
1195	Hackspace Capital	HAC	\N	\N	\N	\N	\N	2397	\N	\N	\N	\N	\N	\N	5991	5992	5993	5994	5995
1196	Telcoin	TEL	\N	\N	\N	\N	\N	2394	\N	\N	\N	\N	\N	\N	5976	5977	5978	5979	5980
1197	Ignition	IC	\N	\N	\N	\N	\N	2395	\N	\N	\N	\N	\N	\N	5981	5982	5983	5984	5985
1198	Bottos	BTO	\N	\N	\N	\N	\N	2392	\N	\N	\N	\N	\N	\N	5971	5972	5973	5974	5975
1152	WaykiChain	WICC	96	175400000	210000000	\N	1529639676	2346	\N	\N	\N	\N	\N	\N	5751	5752	5753	5755	5756
1199	WETH	WETH	\N	\N	\N	\N	\N	2396	\N	\N	\N	\N	\N	\N	5986	5987	5988	5989	5990
1200	Selfkey	KEY	\N	\N	\N	\N	\N	2398	\N	\N	\N	\N	\N	\N	5996	5997	5998	5999	6000
1202	Internet Node Token	INT	\N	\N	\N	\N	\N	2399	\N	\N	\N	\N	\N	\N	6001	6002	6003	6004	6005
1203	OneRoot Network	RNT	\N	\N	\N	\N	\N	2400	\N	\N	\N	\N	\N	\N	6006	6007	6008	6009	6010
1204	Sense	SENSE	\N	\N	\N	\N	\N	2402	\N	\N	\N	\N	\N	\N	6011	6012	6013	6014	6015
1205	TOKYO	TOKC	\N	\N	\N	\N	\N	2404	\N	\N	\N	\N	\N	\N	6021	6022	6023	6024	6025
1206	EtherDelta Token	EDT	\N	\N	\N	\N	\N	2409	\N	\N	\N	\N	\N	\N	6046	6047	6048	6049	6050
1208	InvestDigital	IDT	\N	\N	\N	\N	\N	2406	\N	\N	\N	\N	\N	\N	6031	6032	6033	6034	6035
1209	AICHAIN	AIT	\N	\N	\N	\N	\N	2407	\N	\N	\N	\N	\N	\N	6036	6037	6038	6039	6040
1210	Qube	QUBE	\N	\N	\N	\N	\N	2408	\N	\N	\N	\N	\N	\N	6041	6042	6043	6044	6045
1211	SpaceChain	SPC	\N	\N	\N	\N	\N	2410	\N	\N	\N	\N	\N	\N	6051	6052	6053	6054	6055
1212	RealChain	RCT	\N	\N	\N	\N	\N	2414	\N	\N	\N	\N	\N	\N	6071	6072	6073	6074	6075
1213	Galactrum	ORE	\N	\N	\N	\N	\N	2411	\N	\N	\N	\N	\N	\N	6056	6057	6058	6059	6060
1214	Harvest Masternode Coin	HC	\N	\N	\N	\N	\N	2412	\N	\N	\N	\N	\N	\N	6061	6062	6063	6064	6065
1215	Ethorse	HORSE	\N	\N	\N	\N	\N	2413	\N	\N	\N	\N	\N	\N	6066	6067	6068	6069	6070
1216	ArbitrageCT	ARCT	\N	\N	\N	\N	\N	2415	\N	\N	\N	\N	\N	\N	6076	6077	6078	6079	6080
1217	InsurePal	IPL	\N	\N	\N	\N	\N	2421	\N	\N	\N	\N	\N	\N	6101	6102	6103	6104	6105
1219	Maverick Chain	MVC	\N	\N	\N	\N	\N	2418	\N	\N	\N	\N	\N	\N	6086	6087	6088	6089	6090
1220	Nitro	NOX	\N	\N	\N	\N	\N	2420	\N	\N	\N	\N	\N	\N	6096	6097	6098	6099	6100
1221	Profile Utility Token	PUT	\N	\N	\N	\N	\N	2419	\N	\N	\N	\N	\N	\N	6091	6092	6093	6094	6095
1222	IDEX Membership	IDXM	\N	\N	\N	\N	\N	2422	\N	\N	\N	\N	\N	\N	6106	6107	6108	6109	6110
1223	ShareX	SEXC	\N	\N	\N	\N	\N	2426	\N	\N	\N	\N	\N	\N	6126	6127	6128	6129	6130
1224	SingularityNET	AGI	\N	\N	\N	\N	\N	2424	\N	\N	\N	\N	\N	\N	6116	6117	6118	6119	6120
1225	Aurora DAO	AURA	\N	\N	\N	\N	\N	2423	\N	\N	\N	\N	\N	\N	6111	6112	6113	6114	6115
1226	Gatcoin	GAT	\N	\N	\N	\N	\N	2425	\N	\N	\N	\N	\N	\N	6121	6122	6123	6124	6125
1227	ChatCoin	CHAT	\N	\N	\N	\N	\N	2427	\N	\N	\N	\N	\N	\N	6131	6132	6133	6134	6135
1229	Mobius	MOBI	\N	\N	\N	\N	\N	2429	\N	\N	\N	\N	\N	\N	6141	6142	6143	6144	6145
1230	IPChain	IPC	\N	\N	\N	\N	\N	2433	\N	\N	\N	\N	\N	\N	6156	6157	6158	6159	6160
1231	Hydro Protocol	HOT	\N	\N	\N	\N	\N	2430	\N	\N	\N	\N	\N	\N	6146	6147	6148	6149	6150
1232	StarChain	STC	\N	\N	\N	\N	\N	2432	\N	\N	\N	\N	\N	\N	6151	6152	6153	6154	6155
1233	Maggie	MAG	\N	\N	\N	\N	\N	2434	\N	\N	\N	\N	\N	\N	6161	6162	6163	6164	6165
1234	RefToken	REF	\N	\N	\N	\N	\N	2436	\N	\N	\N	\N	\N	\N	6171	6172	6173	6174	6175
1235	Acute Angle Cloud	AAC	\N	\N	\N	\N	\N	2438	\N	\N	\N	\N	\N	\N	6181	6182	6183	6184	6185
1236	LightChain	LIGHT	\N	\N	\N	\N	\N	2435	\N	\N	\N	\N	\N	\N	6166	6167	6168	6169	6170
1237	YEE	YEE	\N	\N	\N	\N	\N	2437	\N	\N	\N	\N	\N	\N	6176	6177	6178	6179	6180
1238	Molecular Future	MOF	\N	\N	\N	\N	\N	2441	\N	\N	\N	\N	\N	\N	6196	6197	6198	6199	6200
1239	SelfSell	SSC	\N	\N	\N	\N	\N	2439	\N	\N	\N	\N	\N	\N	6186	6187	6188	6189	6190
1240	Read	READ	\N	\N	\N	\N	\N	2440	\N	\N	\N	\N	\N	\N	6191	6192	6193	6194	6195
1241	Block Array	ARY	\N	\N	\N	\N	\N	2445	\N	\N	\N	\N	\N	\N	6211	6212	6213	6214	6215
1242	Trinity Network Credit	TNC	\N	\N	\N	\N	\N	2443	\N	\N	\N	\N	\N	\N	6201	6202	6203	6204	6205
1243	CRYPTO20	C20	\N	\N	\N	\N	\N	2444	\N	\N	\N	\N	\N	\N	6206	6207	6208	6209	6210
1244	Crypterium	CRPT	\N	\N	\N	\N	\N	2447	\N	\N	\N	\N	\N	\N	6221	6222	6223	6224	6225
1245	Sparks	SPK	\N	\N	\N	\N	\N	2448	\N	\N	\N	\N	\N	\N	6226	6227	6228	6229	6230
1246	carVertical	CV	\N	\N	\N	\N	\N	2450	\N	\N	\N	\N	\N	\N	6231	6232	6233	6234	6235
1247	DATA	DTA	\N	\N	\N	\N	\N	2446	\N	\N	\N	\N	\N	\N	6216	6217	6218	6219	6220
1248	Tokenbox	TBX	\N	\N	\N	\N	\N	2452	\N	\N	\N	\N	\N	\N	6236	6237	6238	6239	6240
1249	EDUCare	EKT	\N	\N	\N	\N	\N	2453	\N	\N	\N	\N	\N	\N	6241	6242	6243	6244	6245
1250	UnlimitedIP	UIP	\N	\N	\N	\N	\N	2454	\N	\N	\N	\N	\N	\N	6246	6247	6248	6249	6250
1251	PressOne	PRS	\N	\N	\N	\N	\N	2455	\N	\N	\N	\N	\N	\N	6251	6252	6253	6254	6255
1252	OFCOIN	OF	\N	\N	\N	\N	\N	2456	\N	\N	\N	\N	\N	\N	6256	6257	6258	6259	6260
1253	True Chain	TRUE	\N	\N	\N	\N	\N	2457	\N	\N	\N	\N	\N	\N	6261	6262	6263	6264	6265
1254	Odyssey	OCN	\N	\N	\N	\N	\N	2458	\N	\N	\N	\N	\N	\N	6266	6267	6268	6269	6270
1255	indaHash	IDH	\N	\N	\N	\N	\N	2459	\N	\N	\N	\N	\N	\N	6271	6272	6273	6274	6275
1256	Qbic	QBIC	\N	\N	\N	\N	\N	2460	\N	\N	\N	\N	\N	\N	6276	6277	6278	6279	6280
1257	Peerguess	GUESS	\N	\N	\N	\N	\N	2461	\N	\N	\N	\N	\N	\N	6281	6282	6283	6284	6285
1258	AidCoin	AID	\N	\N	\N	\N	\N	2462	\N	\N	\N	\N	\N	\N	6286	6287	6288	6289	6290
1259	Devery	EVE	\N	\N	\N	\N	\N	2464	\N	\N	\N	\N	\N	\N	6291	6292	6293	6294	6295
1260	Blockport	BPT	\N	\N	\N	\N	\N	2465	\N	\N	\N	\N	\N	\N	6296	6297	6298	6299	6300
1261	aXpire	AXP	\N	\N	\N	\N	\N	2466	\N	\N	\N	\N	\N	\N	6301	6302	6303	6304	6305
1262	OriginTrail	TRAC	\N	\N	\N	\N	\N	2467	\N	\N	\N	\N	\N	\N	6306	6307	6308	6309	6310
1263	LinkEye	LET	\N	\N	\N	\N	\N	2468	\N	\N	\N	\N	\N	\N	6311	6312	6313	6314	6315
1265	All Sports	SOC	\N	\N	\N	\N	\N	2473	\N	\N	\N	\N	\N	\N	6336	6337	6338	6339	6340
1266	CoinMeet	MEET	\N	\N	\N	\N	\N	2470	\N	\N	\N	\N	\N	\N	6321	6322	6323	6324	6325
1267	Fortuna	FOTA	\N	\N	\N	\N	\N	2472	\N	\N	\N	\N	\N	\N	6331	6332	6333	6334	6335
1268	Smartlands	SLT	\N	\N	\N	\N	\N	2471	\N	\N	\N	\N	\N	\N	6326	6327	6328	6329	6330
1269	Ruff	RUFF	\N	\N	\N	\N	\N	2476	\N	\N	\N	\N	\N	\N	6351	6352	6353	6354	6355
1270	Matrix AI Network	MAN	\N	\N	\N	\N	\N	2474	\N	\N	\N	\N	\N	\N	6341	6342	6343	6344	6345
1271	Garlicoin	GRLC	\N	\N	\N	\N	\N	2475	\N	\N	\N	\N	\N	\N	6346	6347	6348	6349	6350
1272	Equal	EQL	\N	\N	\N	\N	\N	2479	\N	\N	\N	\N	\N	\N	6366	6367	6368	6369	6370
1273	Nework	NKC	\N	\N	\N	\N	\N	2477	\N	\N	\N	\N	\N	\N	6356	6357	6358	6359	6360
1274	CoinFi	COFI	\N	\N	\N	\N	\N	2478	\N	\N	\N	\N	\N	\N	6361	6362	6363	6364	6365
1275	HalalChain	HLC	\N	\N	\N	\N	\N	2480	\N	\N	\N	\N	\N	\N	6371	6372	6373	6374	6375
1276	Zeepin	ZPT	\N	\N	\N	\N	\N	2481	\N	\N	\N	\N	\N	\N	6376	6377	6378	6379	6380
1277	CPChain	CPC	\N	\N	\N	\N	\N	2482	\N	\N	\N	\N	\N	\N	6381	6382	6383	6384	6385
1278	OceanChain	OC	\N	\N	\N	\N	\N	2483	\N	\N	\N	\N	\N	\N	6386	6387	6388	6389	6390
1279	Hi Mutual Society	HMC	\N	\N	\N	\N	\N	2484	\N	\N	\N	\N	\N	\N	6391	6392	6393	6394	6395
1280	Candy	CANDY	\N	\N	\N	\N	\N	2485	\N	\N	\N	\N	\N	\N	6396	6397	6398	6399	6400
1281	Speed Mining Service	SMS	\N	\N	\N	\N	\N	2486	\N	\N	\N	\N	\N	\N	6401	6402	6403	6404	6405
1282	Electronic PK Chain	EPC	\N	\N	\N	\N	\N	2487	\N	\N	\N	\N	\N	\N	6406	6407	6408	6409	6410
1283	ValueChain	VLC	\N	\N	\N	\N	\N	2488	\N	\N	\N	\N	\N	\N	6411	6412	6413	6414	6415
1284	BitWhite	BTW	\N	\N	\N	\N	\N	2489	\N	\N	\N	\N	\N	\N	6416	6417	6418	6419	6420
1285	CargoX	CXO	\N	\N	\N	\N	\N	2490	\N	\N	\N	\N	\N	\N	6421	6422	6423	6424	6425
1286	Travelflex	TRF	\N	\N	\N	\N	\N	2491	\N	\N	\N	\N	\N	\N	6426	6427	6428	6429	6430
1288	Pareto Network	PARETO	\N	\N	\N	\N	\N	2495	\N	\N	\N	\N	\N	\N	6441	6442	6443	6444	6445
1290	STK	STK	\N	\N	\N	\N	\N	2493	\N	\N	\N	\N	\N	\N	6436	6437	6438	6439	6440
1291	Jibrel Network	JNT	\N	\N	\N	\N	\N	2498	\N	\N	\N	\N	\N	\N	6456	6457	6458	6459	6460
1292	SwissBorg	CHSB	\N	\N	\N	\N	\N	2499	\N	\N	\N	\N	\N	\N	6461	6462	6463	6464	6465
1293	Zilla	ZLA	\N	\N	\N	\N	\N	2500	\N	\N	\N	\N	\N	\N	6466	6467	6468	6469	6470
1294	Medicalchain	MTN	\N	\N	\N	\N	\N	2497	\N	\N	\N	\N	\N	\N	6451	6452	6453	6454	6455
1295	adbank	ADB	\N	\N	\N	\N	\N	2501	\N	\N	\N	\N	\N	\N	6471	6472	6473	6474	6475
1297	DMarket	DMT	\N	\N	\N	\N	\N	2503	\N	\N	\N	\N	\N	\N	6481	6482	6483	6484	6485
1201	MOAC	MOAC	70	35897055	56483386	\N	1529639678	2403	\N	\N	\N	\N	\N	\N	6016	6017	6018	6019	6020
1287	Elastos	ELA	74	5226102	33653480	\N	1529639680	2492	\N	\N	\N	\N	\N	\N	6431	6432	6433	6434	6435
1207	IOST	IOST	50	8400000000	21000000000	\N	1529639678	2405	\N	\N	\N	\N	\N	\N	6026	6027	6028	6029	6030
1228	Scry.info	DDD	93	300056960	1000000000	\N	1529639680	2428	\N	\N	\N	\N	\N	\N	6136	6137	6138	6139	6140
1298	Iungo	ING	\N	\N	\N	\N	\N	2504	\N	\N	\N	\N	\N	\N	6486	6487	6488	6489	6490
1299	Bluzelle	BLZ	\N	\N	\N	\N	\N	2505	\N	\N	\N	\N	\N	\N	6491	6492	6493	6494	6495
1300	Swarm	SWM	\N	\N	\N	\N	\N	2506	\N	\N	\N	\N	\N	\N	6496	6497	6498	6499	6500
1301	THEKEY	TKY	\N	\N	\N	\N	\N	2507	\N	\N	\N	\N	\N	\N	6501	6502	6503	6504	6505
1302	DCORP Utility	DRPU	\N	\N	\N	\N	\N	2508	\N	\N	\N	\N	\N	\N	6506	6507	6508	6509	6510
1303	EtherSportz	ESZ	\N	\N	\N	\N	\N	2509	\N	\N	\N	\N	\N	\N	6511	6512	6513	6514	6515
1304	Datawallet	DXT	\N	\N	\N	\N	\N	2510	\N	\N	\N	\N	\N	\N	6516	6517	6518	6519	6520
1305	WePower	WPR	\N	\N	\N	\N	\N	2511	\N	\N	\N	\N	\N	\N	6521	6522	6523	6524	6525
1306	U.CASH	UCASH	\N	\N	\N	\N	\N	2512	\N	\N	\N	\N	\N	\N	6526	6527	6528	6529	6530
1307	GoldMint	MNTP	\N	\N	\N	\N	\N	2513	\N	\N	\N	\N	\N	\N	6531	6532	6533	6534	6535
1308	Shekel	JEW	\N	\N	\N	\N	\N	2514	\N	\N	\N	\N	\N	\N	6536	6537	6538	6539	6540
1309	ACChain	ACC	\N	\N	\N	\N	\N	2515	\N	\N	\N	\N	\N	\N	6541	6542	6543	6544	6545
1310	MktCoin	MLM	\N	\N	\N	\N	\N	2516	\N	\N	\N	\N	\N	\N	6546	6547	6548	6549	6550
1311	Animation Vision Cash	AVH	\N	\N	\N	\N	\N	2517	\N	\N	\N	\N	\N	\N	6551	6552	6553	6554	6555
1312	LOCIcoin	LOCI	\N	\N	\N	\N	\N	2518	\N	\N	\N	\N	\N	\N	6556	6557	6558	6559	6560
1313	Indicoin	INDI	\N	\N	\N	\N	\N	2519	\N	\N	\N	\N	\N	\N	6561	6562	6563	6564	6565
1314	Jesus Coin	JC	\N	\N	\N	\N	\N	2520	\N	\N	\N	\N	\N	\N	6566	6567	6568	6569	6570
1315	BioCoin	BIO	\N	\N	\N	\N	\N	2521	\N	\N	\N	\N	\N	\N	6571	6572	6573	6574	6575
1316	Superior Coin	SUP	\N	\N	\N	\N	\N	2522	\N	\N	\N	\N	\N	\N	6576	6577	6578	6579	6580
1317	Tigereum	TIG	\N	\N	\N	\N	\N	2523	\N	\N	\N	\N	\N	\N	6581	6582	6583	6584	6585
1318	Universa	UTNP	\N	\N	\N	\N	\N	2524	\N	\N	\N	\N	\N	\N	6586	6587	6588	6589	6590
1319	Alphacat	ACAT	\N	\N	\N	\N	\N	2525	\N	\N	\N	\N	\N	\N	6591	6592	6593	6594	6595
1320	Envion	EVN	\N	\N	\N	\N	\N	2526	\N	\N	\N	\N	\N	\N	6596	6597	6598	6599	6600
1321	SureRemit	RMT	\N	\N	\N	\N	\N	2527	\N	\N	\N	\N	\N	\N	6601	6602	6603	6604	6605
1322	Dether	DTH	\N	\N	\N	\N	\N	2528	\N	\N	\N	\N	\N	\N	6606	6607	6608	6609	6610
1323	Cashaa	CAS	\N	\N	\N	\N	\N	2529	\N	\N	\N	\N	\N	\N	6611	6612	6613	6614	6615
1325	W3Coin	W3C	\N	\N	\N	\N	\N	2531	\N	\N	\N	\N	\N	\N	6621	6622	6623	6624	6625
1326	Etherecash	ECH	\N	\N	\N	\N	\N	2532	\N	\N	\N	\N	\N	\N	6626	6627	6628	6629	6630
1327	Restart Energy MWAT	MWAT	\N	\N	\N	\N	\N	2533	\N	\N	\N	\N	\N	\N	6631	6632	6633	6634	6635
1328	Gladius Token	GLA	\N	\N	\N	\N	\N	2534	\N	\N	\N	\N	\N	\N	6636	6637	6638	6639	6640
1329	DADI	DADI	\N	\N	\N	\N	\N	2535	\N	\N	\N	\N	\N	\N	6641	6642	6643	6644	6645
1330	Neurotoken	NTK	\N	\N	\N	\N	\N	2536	\N	\N	\N	\N	\N	\N	6646	6647	6648	6649	6650
1331	Gems 	GEM	\N	\N	\N	\N	\N	2537	\N	\N	\N	\N	\N	\N	6651	6652	6653	6654	6655
1332	Nectar	NEC	\N	\N	\N	\N	\N	2538	\N	\N	\N	\N	\N	\N	6656	6657	6658	6659	6660
1333	Republic Protocol	REN	\N	\N	\N	\N	\N	2539	\N	\N	\N	\N	\N	\N	6661	6662	6663	6664	6665
1334	Litecoin Cash	LCC	\N	\N	\N	\N	\N	2540	\N	\N	\N	\N	\N	\N	6666	6667	6668	6669	6670
1335	Storiqa	STQ	\N	\N	\N	\N	\N	2541	\N	\N	\N	\N	\N	\N	6671	6672	6673	6674	6675
1336	Tidex Token	TDX	\N	\N	\N	\N	\N	2542	\N	\N	\N	\N	\N	\N	6676	6677	6678	6679	6680
1337	COPYTRACK	CPY	\N	\N	\N	\N	\N	2543	\N	\N	\N	\N	\N	\N	6681	6682	6683	6684	6685
1338	Nucleus Vision	NCASH	\N	\N	\N	\N	\N	2544	\N	\N	\N	\N	\N	\N	6686	6687	6688	6689	6690
1339	Arcblock	ABT	\N	\N	\N	\N	\N	2545	\N	\N	\N	\N	\N	\N	6691	6692	6693	6694	6695
1340	Remme	REM	\N	\N	\N	\N	\N	2546	\N	\N	\N	\N	\N	\N	6696	6697	6698	6699	6700
1341	Experty	EXY	\N	\N	\N	\N	\N	2547	\N	\N	\N	\N	\N	\N	6701	6702	6703	6704	6705
1342	POA Network	POA	\N	\N	\N	\N	\N	2548	\N	\N	\N	\N	\N	\N	6706	6707	6708	6709	6710
1343	Ink Protocol	XNK	\N	\N	\N	\N	\N	2549	\N	\N	\N	\N	\N	\N	6711	6712	6713	6714	6715
1344	Rock	RKT	\N	\N	\N	\N	\N	2550	\N	\N	\N	\N	\N	\N	6716	6717	6718	6719	6720
1345	Bezop	BEZ	\N	\N	\N	\N	\N	2551	\N	\N	\N	\N	\N	\N	6721	6722	6723	6724	6725
1346	IHT Real Estate Protocol	IHT	\N	\N	\N	\N	\N	2552	\N	\N	\N	\N	\N	\N	6726	6727	6728	6729	6730
1347	Refereum	RFR	\N	\N	\N	\N	\N	2553	\N	\N	\N	\N	\N	\N	6731	6732	6733	6734	6735
1348	Lympo	LYM	\N	\N	\N	\N	\N	2554	\N	\N	\N	\N	\N	\N	6736	6737	6738	6739	6740
1349	Sether	SETH	\N	\N	\N	\N	\N	2555	\N	\N	\N	\N	\N	\N	6741	6742	6743	6744	6745
1350	Credits	CS	\N	\N	\N	\N	\N	2556	\N	\N	\N	\N	\N	\N	6746	6747	6748	6749	6750
1351	Bee Token	BEE	\N	\N	\N	\N	\N	2557	\N	\N	\N	\N	\N	\N	6751	6752	6753	6754	6755
1352	Insights Network	INSTAR	\N	\N	\N	\N	\N	2558	\N	\N	\N	\N	\N	\N	6756	6757	6758	6759	6760
1353	Cube	AUTO	\N	\N	\N	\N	\N	2559	\N	\N	\N	\N	\N	\N	6761	6762	6763	6764	6765
1354	EZToken	EZT	\N	\N	\N	\N	\N	2560	\N	\N	\N	\N	\N	\N	6766	6767	6768	6769	6770
1355	BitTube	TUBE	\N	\N	\N	\N	\N	2561	\N	\N	\N	\N	\N	\N	6771	6772	6773	6774	6775
1356	Education Ecosystem	LEDU	\N	\N	\N	\N	\N	2562	\N	\N	\N	\N	\N	\N	6776	6777	6778	6779	6780
1357	TrueUSD	TUSD	\N	\N	\N	\N	\N	2563	\N	\N	\N	\N	\N	\N	6781	6782	6783	6784	6785
1358	HOQU	HQX	\N	\N	\N	\N	\N	2564	\N	\N	\N	\N	\N	\N	6786	6787	6788	6789	6790
1359	StarterCoin	STAC	\N	\N	\N	\N	\N	2565	\N	\N	\N	\N	\N	\N	6791	6792	6793	6794	6795
1361	DATx	DATX	\N	\N	\N	\N	\N	2567	\N	\N	\N	\N	\N	\N	6801	6802	6803	6804	6805
1362	JET8	J8T	\N	\N	\N	\N	\N	2568	\N	\N	\N	\N	\N	\N	6806	6807	6808	6809	6810
1363	CoinPoker	CHP	\N	\N	\N	\N	\N	2569	\N	\N	\N	\N	\N	\N	6811	6812	6813	6814	6815
1364	TomoChain	TOMO	\N	\N	\N	\N	\N	2570	\N	\N	\N	\N	\N	\N	6816	6817	6818	6819	6820
1365	Graft	GRFT	\N	\N	\N	\N	\N	2571	\N	\N	\N	\N	\N	\N	6821	6822	6823	6824	6825
1366	BABB	BAX	\N	\N	\N	\N	\N	2572	\N	\N	\N	\N	\N	\N	6826	6827	6828	6829	6830
1367	Electrify.Asia	ELEC	\N	\N	\N	\N	\N	2573	\N	\N	\N	\N	\N	\N	6831	6832	6833	6834	6835
1369	Ravencoin	RVN	\N	\N	\N	\N	\N	2577	\N	\N	\N	\N	\N	\N	6841	6842	6843	6844	6845
1370	TE-FOOD	TFD	\N	\N	\N	\N	\N	2578	\N	\N	\N	\N	\N	\N	6846	6847	6848	6849	6850
1371	Sharpe Platform Token	SHP	\N	\N	\N	\N	\N	2581	\N	\N	\N	\N	\N	\N	6856	6857	6858	6859	6860
1372	Tokenomy	TEN	\N	\N	\N	\N	\N	2576	\N	\N	\N	\N	\N	\N	6851	6852	6853	6854	6855
1373	Debitum	DEB	\N	\N	\N	\N	\N	2584	\N	\N	\N	\N	\N	\N	6876	6877	6878	6879	6880
1374	Octoin Coin	OCC	\N	\N	\N	\N	\N	2583	\N	\N	\N	\N	\N	\N	6871	6872	6873	6874	6875
1375	Leadcoin	LDC	\N	\N	\N	\N	\N	2580	\N	\N	\N	\N	\N	\N	6861	6862	6863	6864	6865
1376	ShipChain	SHIP	\N	\N	\N	\N	\N	2579	\N	\N	\N	\N	\N	\N	6866	6867	6868	6869	6870
1378	Havven	HAV	\N	\N	\N	\N	\N	2586	\N	\N	\N	\N	\N	\N	6886	6887	6888	6889	6890
1379	LALA World	LALA	\N	\N	\N	\N	\N	2582	\N	\N	\N	\N	\N	\N	6896	6897	6898	6899	6900
1381	Guaranteed Ethurance Token Extra	GETX	\N	\N	\N	\N	\N	2589	\N	\N	\N	\N	\N	\N	6906	6907	6908	6909	6910
1382	Fluz Fluz	FLUZ	\N	\N	\N	\N	\N	2587	\N	\N	\N	\N	\N	\N	6891	6892	6893	6894	6895
1383	HireMatch	HIRE	\N	\N	\N	\N	\N	2590	\N	\N	\N	\N	\N	\N	6911	6912	6913	6914	6915
1384	LatiumX	LATX	\N	\N	\N	\N	\N	2594	\N	\N	\N	\N	\N	\N	6931	6932	6933	6934	6935
1385	NANJCOIN	NANJ	\N	\N	\N	\N	\N	2595	\N	\N	\N	\N	\N	\N	6936	6937	6938	6939	6940
1386	Banca	BANCA	\N	\N	\N	\N	\N	2592	\N	\N	\N	\N	\N	\N	6921	6922	6923	6924	6925
1387	Dragon Coins	DRG	\N	\N	\N	\N	\N	2593	\N	\N	\N	\N	\N	\N	6926	6927	6928	6929	6930
1389	CK USD	CKUSD	\N	\N	\N	\N	\N	2596	\N	\N	\N	\N	\N	\N	6941	6942	6943	6944	6945
1390	LGO Exchange	LGO	\N	\N	\N	\N	\N	2600	\N	\N	\N	\N	\N	\N	6961	6962	6963	6964	6965
1391	Banyan Network	BBN	\N	\N	\N	\N	\N	2598	\N	\N	\N	\N	\N	\N	6951	6952	6953	6954	6955
1392	Noah Coin	NOAH	\N	\N	\N	\N	\N	2599	\N	\N	\N	\N	\N	\N	6956	6957	6958	6959	6960
1393	UpToken	UP	\N	\N	\N	\N	\N	2597	\N	\N	\N	\N	\N	\N	6946	6947	6948	6949	6950
1394	1World	1WO	\N	\N	\N	\N	\N	2601	\N	\N	\N	\N	\N	\N	6966	6967	6968	6969	6970
1396	BnkToTheFuture	BFT	\N	\N	\N	\N	\N	2605	\N	\N	\N	\N	\N	\N	6986	6987	6988	6989	6990
1377	Centrality	CENNZ	75	788410650	1200000000	\N	1529639683	2585	\N	\N	\N	\N	\N	\N	6881	6882	6883	6884	6885
1380	Loom Network	LOOM	94	603182081	1000000000	\N	1529639683	2588	\N	\N	\N	\N	\N	\N	6901	6902	6903	6904	6905
1395	Wanchain	WAN	43	106152493	210000000	\N	1529639684	2606	\N	\N	\N	\N	\N	\N	6991	6992	6993	6994	6995
1397	Bitcoin Green	BITG	\N	\N	\N	\N	\N	2604	\N	\N	\N	\N	\N	\N	6981	6982	6983	6984	6985
1398	NaPoleonX	NPX	\N	\N	\N	\N	\N	2602	\N	\N	\N	\N	\N	\N	6971	6972	6973	6974	6975
1399	Pundi X	NPXS	\N	\N	\N	\N	\N	2603	\N	\N	\N	\N	\N	\N	6976	6977	6978	6979	6980
1400	AMLT	AMLT	\N	\N	\N	\N	\N	2607	\N	\N	\N	\N	\N	\N	6996	6997	6998	6999	7000
1401	Spectiv	SIG	\N	\N	\N	\N	\N	2611	\N	\N	\N	\N	\N	\N	7016	7017	7018	7019	7020
1403	Lendroid Support Token	LST	\N	\N	\N	\N	\N	2609	\N	\N	\N	\N	\N	\N	7006	7007	7008	7009	7010
1404	Peculium	PCL	\N	\N	\N	\N	\N	2610	\N	\N	\N	\N	\N	\N	7011	7012	7013	7014	7015
1405	BitRent	RNTB	\N	\N	\N	\N	\N	2612	\N	\N	\N	\N	\N	\N	7021	7022	7023	7024	7025
1406	StockChain	SCC	\N	\N	\N	\N	\N	2618	\N	\N	\N	\N	\N	\N	7046	7047	7048	7049	7050
1407	IP Exchange	IPSX	\N	\N	\N	\N	\N	2617	\N	\N	\N	\N	\N	\N	7041	7042	7043	7044	7045
1408	Blocklancer	LNC	\N	\N	\N	\N	\N	2615	\N	\N	\N	\N	\N	\N	7031	7032	7033	7034	7035
1409	BlitzPredict	XBP	\N	\N	\N	\N	\N	2614	\N	\N	\N	\N	\N	\N	7026	7027	7028	7029	7030
1410	Stipend	SPD	\N	\N	\N	\N	\N	2616	\N	\N	\N	\N	\N	\N	7036	7037	7038	7039	7040
1411	BitStation	BSTN	\N	\N	\N	\N	\N	2619	\N	\N	\N	\N	\N	\N	7051	7052	7053	7054	7055
1412	Vice Industry Token	VIT	\N	\N	\N	\N	\N	2625	\N	\N	\N	\N	\N	\N	7071	7072	7073	7074	7075
1413	Switcheo	SWTH	\N	\N	\N	\N	\N	2620	\N	\N	\N	\N	\N	\N	7056	7057	7058	7059	7060
1414	Consensus	SEN	\N	\N	\N	\N	\N	2621	\N	\N	\N	\N	\N	\N	7061	7062	7063	7064	7065
1415	Sentinel Chain	SENC	\N	\N	\N	\N	\N	2624	\N	\N	\N	\N	\N	\N	7066	7067	7068	7069	7070
1416	Friendz	FDZ	\N	\N	\N	\N	\N	2626	\N	\N	\N	\N	\N	\N	7076	7077	7078	7079	7080
1417	ODEM	ODE	\N	\N	\N	\N	\N	2631	\N	\N	\N	\N	\N	\N	7101	7102	7103	7104	7105
1418	Rentberry	BERRY	\N	\N	\N	\N	\N	2628	\N	\N	\N	\N	\N	\N	7086	7087	7088	7089	7090
1419	Stellite	XTL	\N	\N	\N	\N	\N	2629	\N	\N	\N	\N	\N	\N	7091	7092	7093	7094	7095
1420	TokenPay	TPAY	\N	\N	\N	\N	\N	2627	\N	\N	\N	\N	\N	\N	7081	7082	7083	7084	7085
1421	PolySwarm	NCT	\N	\N	\N	\N	\N	2630	\N	\N	\N	\N	\N	\N	7096	7097	7098	7099	7100
1422	Monero Original	XMO	\N	\N	\N	\N	\N	2632	\N	\N	\N	\N	\N	\N	7106	7107	7108	7109	7110
1423	BelugaPay	BBI	\N	\N	\N	\N	\N	2636	\N	\N	\N	\N	\N	\N	7126	7127	7128	7129	7130
1424	TokenDesk	TDS	\N	\N	\N	\N	\N	2635	\N	\N	\N	\N	\N	\N	7121	7122	7123	7124	7125
1425	Stakenet	XSN	\N	\N	\N	\N	\N	2633	\N	\N	\N	\N	\N	\N	7111	7112	7113	7114	7115
1426	XinFin Network	XDCE	\N	\N	\N	\N	\N	2634	\N	\N	\N	\N	\N	\N	7116	7117	7118	7119	7120
1427	Fidelium	FID	\N	\N	\N	\N	\N	2637	\N	\N	\N	\N	\N	\N	7131	7132	7133	7134	7135
1428	CyberVein	CVT	\N	\N	\N	\N	\N	2642	\N	\N	\N	\N	\N	\N	7156	7157	7158	7159	7160
1429	Arbitracoin	ATC	\N	\N	\N	\N	\N	2639	\N	\N	\N	\N	\N	\N	7141	7142	7143	7144	7145
1430	Apex	CPX	\N	\N	\N	\N	\N	2641	\N	\N	\N	\N	\N	\N	7151	7152	7153	7154	7155
1432	WCOIN	WIN	\N	\N	\N	\N	\N	2640	\N	\N	\N	\N	\N	\N	7146	7147	7148	7149	7150
1433	Sentinel	SENT	\N	\N	\N	\N	\N	2643	\N	\N	\N	\N	\N	\N	7161	7162	7163	7164	7165
1434	eosDAC	EOSDAC	\N	\N	\N	\N	\N	2644	\N	\N	\N	\N	\N	\N	7166	7167	7168	7169	7170
1435	U Network	UUU	\N	\N	\N	\N	\N	2645	\N	\N	\N	\N	\N	\N	7171	7172	7173	7174	7175
1436	AdHive	ADH	\N	\N	\N	\N	\N	2646	\N	\N	\N	\N	\N	\N	7176	7177	7178	7179	7180
1437	SnipCoin	SNIP	\N	\N	\N	\N	\N	2647	\N	\N	\N	\N	\N	\N	7181	7182	7183	7184	7185
1438	Bitsum	BSM	\N	\N	\N	\N	\N	2648	\N	\N	\N	\N	\N	\N	7186	7187	7188	7189	7190
1439	DeviantCoin	DEV	\N	\N	\N	\N	\N	2649	\N	\N	\N	\N	\N	\N	7191	7192	7193	7194	7195
1440	CommerceBlock	CBT	\N	\N	\N	\N	\N	2650	\N	\N	\N	\N	\N	\N	7196	7197	7198	7199	7200
1441	GreenMed	GRMD	\N	\N	\N	\N	\N	2651	\N	\N	\N	\N	\N	\N	7201	7202	7203	7204	7205
1442	Curriculum Vitae	CVH	\N	\N	\N	\N	\N	2652	\N	\N	\N	\N	\N	\N	7206	7207	7208	7209	7210
1443	Auctus	AUC	\N	\N	\N	\N	\N	2653	\N	\N	\N	\N	\N	\N	7211	7212	7213	7214	7215
1444	BrahmaOS	BRM	\N	\N	\N	\N	\N	2657	\N	\N	\N	\N	\N	\N	7231	7232	7233	7234	7235
1445	Daneel	DAN	\N	\N	\N	\N	\N	2656	\N	\N	\N	\N	\N	\N	7226	7227	7228	7229	7230
1446	Monero Classic	XMC	\N	\N	\N	\N	\N	2655	\N	\N	\N	\N	\N	\N	7221	7222	7223	7224	7225
1447	Budbo	BUBO	\N	\N	\N	\N	\N	2654	\N	\N	\N	\N	\N	\N	7216	7217	7218	7219	7220
1448	SyncFab	MFG	\N	\N	\N	\N	\N	2658	\N	\N	\N	\N	\N	\N	7236	7237	7238	7239	7240
1449	StarCoin	KST	\N	\N	\N	\N	\N	2663	\N	\N	\N	\N	\N	\N	7261	7262	7263	7264	7265
1450	Tripio	TRIO	\N	\N	\N	\N	\N	2661	\N	\N	\N	\N	\N	\N	7251	7252	7253	7254	7255
1451	Dignity	DIG	\N	\N	\N	\N	\N	2659	\N	\N	\N	\N	\N	\N	7241	7242	7243	7244	7245
1452	Haven Protocol	XHV	\N	\N	\N	\N	\N	2662	\N	\N	\N	\N	\N	\N	7256	7257	7258	7259	7260
1453	Aditus	ADI	\N	\N	\N	\N	\N	2660	\N	\N	\N	\N	\N	\N	7246	7247	7248	7249	7250
1454	CryCash	CRC	\N	\N	\N	\N	\N	2664	\N	\N	\N	\N	\N	\N	7266	7267	7268	7269	7270
1455	Earth Token	EARTH	\N	\N	\N	\N	\N	2668	\N	\N	\N	\N	\N	\N	7286	7287	7288	7289	7290
1456	Dero	DERO	\N	\N	\N	\N	\N	2665	\N	\N	\N	\N	\N	\N	7271	7272	7273	7274	7275
1457	Effect.AI	EFX	\N	\N	\N	\N	\N	2666	\N	\N	\N	\N	\N	\N	7276	7277	7278	7279	7280
1458	FintruX Network	FTX	\N	\N	\N	\N	\N	2667	\N	\N	\N	\N	\N	\N	7281	7282	7283	7284	7285
1459	MARK.SPACE	MRK	\N	\N	\N	\N	\N	2669	\N	\N	\N	\N	\N	\N	7291	7292	7293	7294	7295
1460	Masari	MSR	\N	\N	\N	\N	\N	2674	\N	\N	\N	\N	\N	\N	7316	7317	7318	7319	7320
1461	Cropcoin	CROP	\N	\N	\N	\N	\N	2671	\N	\N	\N	\N	\N	\N	7301	7302	7303	7304	7305
1462	Pixie Coin	PXC	\N	\N	\N	\N	\N	2670	\N	\N	\N	\N	\N	\N	7296	7297	7298	7299	7300
1463	Chainium	CHX	\N	\N	\N	\N	\N	2673	\N	\N	\N	\N	\N	\N	7311	7312	7313	7314	7315
1464	SRCOIN	SRCOIN	\N	\N	\N	\N	\N	2672	\N	\N	\N	\N	\N	\N	7306	7307	7308	7309	7310
1465	Dock	DOCK	\N	\N	\N	\N	\N	2675	\N	\N	\N	\N	\N	\N	7321	7322	7323	7324	7325
1466	TraDove B2BCoin	BBC	\N	\N	\N	\N	\N	2678	\N	\N	\N	\N	\N	\N	7336	7337	7338	7339	7340
1467	Decentralized Machine Learning	DML	\N	\N	\N	\N	\N	2679	\N	\N	\N	\N	\N	\N	7341	7342	7343	7344	7345
1468	Linker Coin	LNC	\N	\N	\N	\N	\N	2677	\N	\N	\N	\N	\N	\N	7331	7332	7333	7334	7335
1469	PHI Token	PHI	\N	\N	\N	\N	\N	2676	\N	\N	\N	\N	\N	\N	7326	7327	7328	7329	7330
1470	Helbiz	HBZ	\N	\N	\N	\N	\N	2680	\N	\N	\N	\N	\N	\N	7346	7347	7348	7349	7350
1471	Zebi	ZCO	\N	\N	\N	\N	\N	2685	\N	\N	\N	\N	\N	\N	7366	7367	7368	7369	7370
1472	Origami	ORI	\N	\N	\N	\N	\N	2681	\N	\N	\N	\N	\N	\N	7351	7352	7353	7354	7355
1473	TrakInvest	TRAK	\N	\N	\N	\N	\N	2683	\N	\N	\N	\N	\N	\N	7361	7362	7363	7364	7365
1474	Holo	HOT	\N	\N	\N	\N	\N	2682	\N	\N	\N	\N	\N	\N	7356	7357	7358	7359	7360
1475	Aphelion	APH	\N	\N	\N	\N	\N	2684	\N	\N	\N	\N	\N	\N	7386	7387	7388	7389	7390
1476	Lendingblock	LND	\N	\N	\N	\N	\N	2686	\N	\N	\N	\N	\N	\N	7391	7392	7393	7394	7395
1477	Biotron	BTRN	\N	\N	\N	\N	\N	2690	\N	\N	\N	\N	\N	\N	7396	7397	7398	7399	7400
1478	Vipstar Coin	VIPS	\N	\N	\N	\N	\N	2688	\N	\N	\N	\N	\N	\N	7381	7382	7383	7384	7385
1479	Rublix	RBLX	\N	\N	\N	\N	\N	2689	\N	\N	\N	\N	\N	\N	7376	7377	7378	7379	7380
1480	Proxeus	XES	\N	\N	\N	\N	\N	2687	\N	\N	\N	\N	\N	\N	7371	7372	7373	7374	7375
1481	Penta	PNT	\N	\N	\N	\N	\N	2691	\N	\N	\N	\N	\N	\N	7401	7402	7403	7404	7405
1482	Nexo	NEXO	\N	\N	\N	\N	\N	2694	\N	\N	\N	\N	\N	\N	7416	7417	7418	7419	7420
1483	Nebula AI	NBAI	\N	\N	\N	\N	\N	2692	\N	\N	\N	\N	\N	\N	7406	7407	7408	7409	7410
1484	Loopring [NEO]	LRN	\N	\N	\N	\N	\N	2693	\N	\N	\N	\N	\N	\N	7411	7412	7413	7414	7415
1485	VeriME	VME	\N	\N	\N	\N	\N	2695	\N	\N	\N	\N	\N	\N	7421	7422	7423	7424	7425
1486	BetterBetting	BETR	\N	\N	\N	\N	\N	2703	\N	\N	\N	\N	\N	\N	7451	7452	7453	7454	7455
1487	TrustNote	TTT	\N	\N	\N	\N	\N	2701	\N	\N	\N	\N	\N	\N	7441	7442	7443	7444	7445
1488	Sharder	SS	\N	\N	\N	\N	\N	2699	\N	\N	\N	\N	\N	\N	7436	7437	7438	7439	7440
1489	Bitcoin Interest	BCI	\N	\N	\N	\N	\N	2702	\N	\N	\N	\N	\N	\N	7446	7447	7448	7449	7450
1490	Hydrogen	HYDRO	\N	\N	\N	\N	\N	2698	\N	\N	\N	\N	\N	\N	7431	7432	7433	7434	7435
1491	DAEX	DAX	\N	\N	\N	\N	\N	2696	\N	\N	\N	\N	\N	\N	7426	7427	7428	7429	7430
1492	Transcodium	TNS	\N	\N	\N	\N	\N	2704	\N	\N	\N	\N	\N	\N	7456	7457	7458	7459	7460
1493	Crowd Machine	CMCT	\N	\N	\N	\N	\N	2708	\N	\N	\N	\N	\N	\N	7471	7472	7473	7474	7475
1494	Amon	AMN	\N	\N	\N	\N	\N	2705	\N	\N	\N	\N	\N	\N	7461	7462	7463	7464	7465
1495	Plancoin	PLAN	\N	\N	\N	\N	\N	2706	\N	\N	\N	\N	\N	\N	7466	7467	7468	7469	7470
1431	Cortex	CTXC	86	149792458	299792458	\N	1529639684	2638	\N	\N	\N	\N	\N	\N	7136	7137	7138	7139	7140
1496	Morpheus Labs	MITX	\N	\N	\N	\N	\N	2709	\N	\N	\N	\N	\N	\N	7476	7477	7478	7479	7480
1497	ConnectJob	CJT	\N	\N	\N	\N	\N	2715	\N	\N	\N	\N	\N	\N	7506	7507	7508	7509	7510
1498	Live Stars	LIVE	\N	\N	\N	\N	\N	2710	\N	\N	\N	\N	\N	\N	7481	7482	7483	7484	7485
1499	MyToken	MT	\N	\N	\N	\N	\N	2712	\N	\N	\N	\N	\N	\N	7491	7492	7493	7494	7495
1500	Docademic	MTC	\N	\N	\N	\N	\N	2711	\N	\N	\N	\N	\N	\N	7486	7487	7488	7489	7490
1501	KEY	KEY	\N	\N	\N	\N	\N	2713	\N	\N	\N	\N	\N	\N	7496	7497	7498	7499	7500
1502	Nexty	NTY	\N	\N	\N	\N	\N	2714	\N	\N	\N	\N	\N	\N	7501	7502	7503	7504	7505
1503	BoutsPro	BOUTS	\N	\N	\N	\N	\N	2717	\N	\N	\N	\N	\N	\N	7511	7512	7513	7514	7515
1504	Cybereits	CRE	\N	\N	\N	\N	\N	2719	\N	\N	\N	\N	\N	\N	7521	7522	7523	7524	7525
1505	Parkgene	GENE	\N	\N	\N	\N	\N	2720	\N	\N	\N	\N	\N	\N	7526	7527	7528	7529	7530
1506	PolicyPal Network	PAL	\N	\N	\N	\N	\N	2718	\N	\N	\N	\N	\N	\N	7516	7517	7518	7519	7520
1507	APR Coin	APR	\N	\N	\N	\N	\N	2721	\N	\N	\N	\N	\N	\N	7531	7532	7533	7534	7535
1508	Bezant	BZNT	\N	\N	\N	\N	\N	2727	\N	\N	\N	\N	\N	\N	7561	7562	7563	7564	7565
1509	AC3	AC3	\N	\N	\N	\N	\N	2722	\N	\N	\N	\N	\N	\N	7536	7537	7538	7539	7540
1510	FuzeX	FXT	\N	\N	\N	\N	\N	2723	\N	\N	\N	\N	\N	\N	7541	7542	7543	7544	7545
1511	Zippie	ZIPT	\N	\N	\N	\N	\N	2724	\N	\N	\N	\N	\N	\N	7546	7547	7548	7549	7550
1512	Skrumble Network	SKM	\N	\N	\N	\N	\N	2725	\N	\N	\N	\N	\N	\N	7551	7552	7553	7554	7555
1513	DAOstack	GEN	\N	\N	\N	\N	\N	2726	\N	\N	\N	\N	\N	\N	7556	7557	7558	7559	7560
1514	TokenStars	TEAM	\N	\N	\N	\N	\N	2729	\N	\N	\N	\N	\N	\N	7566	7567	7568	7569	7570
1515	Aston	ATX	\N	\N	\N	\N	\N	2732	\N	\N	\N	\N	\N	\N	7581	7582	7583	7584	7585
1516	Fitrova	FRV	\N	\N	\N	\N	\N	2730	\N	\N	\N	\N	\N	\N	7571	7572	7573	7574	7575
1517	Utrum	OOT	\N	\N	\N	\N	\N	2731	\N	\N	\N	\N	\N	\N	7576	7577	7578	7579	7580
1518	Freyrchain	FREC	\N	\N	\N	\N	\N	2733	\N	\N	\N	\N	\N	\N	7586	7587	7588	7589	7590
1519	Digix Gold Token	DGX	\N	\N	\N	\N	\N	2739	\N	\N	\N	\N	\N	\N	7616	7617	7618	7619	7620
1520	InsurChain	INSUR	\N	\N	\N	\N	\N	2736	\N	\N	\N	\N	\N	\N	7601	7602	7603	7604	7605
1521	Content Neutrality Network	CNN	\N	\N	\N	\N	\N	2735	\N	\N	\N	\N	\N	\N	7596	7597	7598	7599	7600
1522	Super Game Chain	SGCC	\N	\N	\N	\N	\N	2738	\N	\N	\N	\N	\N	\N	7611	7612	7613	7614	7615
1523	EduCoin	EDU	\N	\N	\N	\N	\N	2734	\N	\N	\N	\N	\N	\N	7591	7592	7593	7594	7595
1524	Global Social Chain	GSC	\N	\N	\N	\N	\N	2737	\N	\N	\N	\N	\N	\N	7606	7607	7608	7609	7610
1525	Influence Chain	INC	\N	\N	\N	\N	\N	2740	\N	\N	\N	\N	\N	\N	7621	7622	7623	7624	7625
1526	Bank Coin	BANK	\N	\N	\N	\N	\N	2743	\N	\N	\N	\N	\N	\N	7636	7637	7638	7639	7640
1527	Intelligent Investment Chain	IIC	\N	\N	\N	\N	\N	2741	\N	\N	\N	\N	\N	\N	7626	7627	7628	7629	7630
1528	Sakura Bloom	SKB	\N	\N	\N	\N	\N	2742	\N	\N	\N	\N	\N	\N	7631	7632	7633	7634	7635
1529	NPER	NPER	\N	\N	\N	\N	\N	2744	\N	\N	\N	\N	\N	\N	7641	7642	7643	7644	7645
1530	Signals Network	SGN	\N	\N	\N	\N	\N	2749	\N	\N	\N	\N	\N	\N	7661	7662	7663	7664	7665
1531	BlockMesh	BMH	\N	\N	\N	\N	\N	2747	\N	\N	\N	\N	\N	\N	7651	7652	7653	7654	7655
1532	Oyster Shell	SHL	\N	\N	\N	\N	\N	2750	\N	\N	\N	\N	\N	\N	7666	7667	7668	7669	7670
1533	Dascoin	DASC	\N	\N	\N	\N	\N	2746	\N	\N	\N	\N	\N	\N	7646	7647	7648	7649	7650
1534	Loki	LOKI	\N	\N	\N	\N	\N	2748	\N	\N	\N	\N	\N	\N	7656	7657	7658	7659	7660
1535	Datarius Credit	DTRC	\N	\N	\N	\N	\N	2752	\N	\N	\N	\N	\N	\N	7676	7677	7678	7679	7680
1536	FundRequest	FND	\N	\N	\N	\N	\N	2751	\N	\N	\N	\N	\N	\N	7671	7672	7673	7674	7675
1537	Hero	HERO	\N	\N	\N	\N	\N	2755	\N	\N	\N	\N	\N	\N	7691	7692	7693	7694	7695
1538	Colu Local Network	CLN	\N	\N	\N	\N	\N	2753	\N	\N	\N	\N	\N	\N	7681	7682	7683	7684	7685
1539	HeroNode	HER	\N	\N	\N	\N	\N	2754	\N	\N	\N	\N	\N	\N	7686	7687	7688	7689	7690
1540	Tokia	TKA	\N	\N	\N	\N	\N	2756	\N	\N	\N	\N	\N	\N	7696	7697	7698	7699	7700
1541	Local World Forwarders	LWF	\N	\N	\N	\N	\N	2761	\N	\N	\N	\N	\N	\N	7721	7722	7723	7724	7725
1542	Open Platform	OPEN	\N	\N	\N	\N	\N	2762	\N	\N	\N	\N	\N	\N	7726	7727	7728	7729	7730
1543	Callisto Network	CLO	\N	\N	\N	\N	\N	2757	\N	\N	\N	\N	\N	\N	7701	7702	7703	7704	7705
1544	Unibright	UBT	\N	\N	\N	\N	\N	2758	\N	\N	\N	\N	\N	\N	7706	7707	7708	7709	7710
1545	Patron	PAT	\N	\N	\N	\N	\N	2759	\N	\N	\N	\N	\N	\N	7711	7712	7713	7714	7715
1546	Libra Credit	LBA	\N	\N	\N	\N	\N	2760	\N	\N	\N	\N	\N	\N	7716	7717	7718	7719	7720
1547	Morpheus Network	MORPH	\N	\N	\N	\N	\N	2763	\N	\N	\N	\N	\N	\N	7731	7732	7733	7734	7735
1548	Cryptaur	CPT	\N	\N	\N	\N	\N	2766	\N	\N	\N	\N	\N	\N	7746	7747	7748	7749	7750
1549	Silent Notary	SNTR	\N	\N	\N	\N	\N	2764	\N	\N	\N	\N	\N	\N	7736	7737	7738	7739	7740
1550	XYO Network	XYO	\N	\N	\N	\N	\N	2765	\N	\N	\N	\N	\N	\N	7741	7742	7743	7744	7745
1551	APIS	APIS	\N	\N	\N	\N	\N	2767	\N	\N	\N	\N	\N	\N	7751	7752	7753	7754	7755
1552	RED	RED	\N	\N	\N	\N	\N	2771	\N	\N	\N	\N	\N	\N	7771	7772	7773	7774	7775
1553	Digitex Futures	DGTX	\N	\N	\N	\N	\N	2772	\N	\N	\N	\N	\N	\N	7776	7777	7778	7779	7780
1554	Fabric Token	FT	\N	\N	\N	\N	\N	2768	\N	\N	\N	\N	\N	\N	7756	7757	7758	7759	7760
1555	Rhenium	XRH	\N	\N	\N	\N	\N	2769	\N	\N	\N	\N	\N	\N	7761	7762	7763	7764	7765
1556	Cazcoin	CAZ	\N	\N	\N	\N	\N	2770	\N	\N	\N	\N	\N	\N	7766	7767	7768	7769	7770
1557	Invacio	INV	\N	\N	\N	\N	\N	2774	\N	\N	\N	\N	\N	\N	7786	7787	7788	7789	7790
1558	GINcoin	GIN	\N	\N	\N	\N	\N	2773	\N	\N	\N	\N	\N	\N	7781	7782	7783	7784	7785
1559	IoTeX	IOTX	\N	\N	\N	\N	\N	2777	\N	\N	\N	\N	\N	\N	7801	7802	7803	7804	7805
1560	Faceter	FACE	\N	\N	\N	\N	\N	2775	\N	\N	\N	\N	\N	\N	7791	7792	7793	7794	7795
1561	Travala	AVA	\N	\N	\N	\N	\N	2776	\N	\N	\N	\N	\N	\N	7796	7797	7798	7799	7800
1562	Eximchain	EXC	\N	\N	\N	\N	\N	2778	\N	\N	\N	\N	\N	\N	7806	7807	7808	7809	7810
1563	Phantasma	SOUL	\N	\N	\N	\N	\N	2827	\N	\N	\N	\N	\N	\N	7831	7832	7833	7834	7835
1564	Naviaddress	NAVI	\N	\N	\N	\N	\N	2825	\N	\N	\N	\N	\N	\N	7821	7822	7823	7824	7825
1565	Level Up Coin	LUC	\N	\N	\N	\N	\N	2779	\N	\N	\N	\N	\N	\N	7811	7812	7813	7814	7815
1566	NKN	NKN	\N	\N	\N	\N	\N	2780	\N	\N	\N	\N	\N	\N	7816	7817	7818	7819	7820
1567	ZIP	ZIP	\N	\N	\N	\N	\N	2826	\N	\N	\N	\N	\N	\N	7826	7827	7828	7829	7830
1568	REPO	REPO	\N	\N	\N	\N	\N	2829	\N	\N	\N	\N	\N	\N	7841	7842	7843	7844	7845
1569	SPINDLE	SPD	\N	\N	\N	\N	\N	2828	\N	\N	\N	\N	\N	\N	7836	7837	7838	7839	7840
1570	Ivy	IVY	\N	\N	\N	\N	\N	2833	\N	\N	\N	\N	\N	\N	7856	7857	7858	7859	7860
1571	EJOY	EJOY	\N	\N	\N	\N	\N	2831	\N	\N	\N	\N	\N	\N	7851	7852	7853	7854	7855
1572	Seele	SEELE	\N	\N	\N	\N	\N	2830	\N	\N	\N	\N	\N	\N	7846	7847	7848	7849	7850
1573	ContractNet	CNET	\N	\N	\N	\N	\N	2834	\N	\N	\N	\N	\N	\N	7861	7862	7863	7864	7865
1574	Shopin	SHOP	\N	\N	\N	\N	\N	2839	\N	\N	\N	\N	\N	\N	7886	7887	7888	7889	7890
1575	Endor Protocol	EDR	\N	\N	\N	\N	\N	2835	\N	\N	\N	\N	\N	\N	7866	7867	7868	7869	7870
1576	Bigbom	BBO	\N	\N	\N	\N	\N	2836	\N	\N	\N	\N	\N	\N	7871	7872	7873	7874	7875
1577	0xBitcoin	0xBTC	\N	\N	\N	\N	\N	2837	\N	\N	\N	\N	\N	\N	7876	7877	7878	7879	7880
1578	PCHAIN	PAI	\N	\N	\N	\N	\N	2838	\N	\N	\N	\N	\N	\N	7881	7882	7883	7884	7885
1579	LoyalCoin	LYL	\N	\N	\N	\N	\N	2841	\N	\N	\N	\N	\N	\N	7896	7897	7898	7899	7900
1580	Bankera	BNK	\N	\N	\N	\N	\N	2842	\N	\N	\N	\N	\N	\N	7901	7902	7903	7904	7905
1581	QuarkChain	QKC	\N	\N	\N	\N	\N	2840	\N	\N	\N	\N	\N	\N	7891	7892	7893	7894	7895
1582	Shivom	OMX	\N	\N	\N	\N	\N	2844	\N	\N	\N	\N	\N	\N	7911	7912	7913	7914	7915
1583	Ether Zero	ETZ	\N	\N	\N	\N	\N	2843	\N	\N	\N	\N	\N	\N	7906	7907	7908	7909	7910
1584	MEDX	MEDX	\N	\N	\N	\N	\N	2845	\N	\N	\N	\N	\N	\N	7916	7917	7918	7919	7920
1585	TRAXIA	TMT	\N	\N	\N	\N	\N	2850	\N	\N	\N	\N	\N	\N	7941	7942	7943	7944	7945
1586	The Abyss	ABYSS	\N	\N	\N	\N	\N	2847	\N	\N	\N	\N	\N	\N	7926	7927	7928	7929	7930
1587	FuturoCoin	FTO	\N	\N	\N	\N	\N	2846	\N	\N	\N	\N	\N	\N	7921	7922	7923	7924	7925
1588	Paymon	PMNT	\N	\N	\N	\N	\N	2848	\N	\N	\N	\N	\N	\N	7931	7932	7933	7934	7935
1589	Hurify	HUR	\N	\N	\N	\N	\N	2849	\N	\N	\N	\N	\N	\N	7936	7937	7938	7939	7940
1590	CGC Token	CGC	\N	\N	\N	\N	\N	2851	\N	\N	\N	\N	\N	\N	7946	7947	7948	7949	7950
1591	Engine	EGCC	\N	\N	\N	\N	\N	2852	\N	\N	\N	\N	\N	\N	7951	7952	7953	7954	7955
1592	CashBet Coin	CBC	\N	\N	\N	\N	\N	2855	\N	\N	\N	\N	\N	\N	7966	7967	7968	7969	7970
1593	MIRQ	MRQ	\N	\N	\N	\N	\N	2853	\N	\N	\N	\N	\N	\N	7956	7957	7958	7959	7960
1594	PikcioChain	PKC	\N	\N	\N	\N	\N	2854	\N	\N	\N	\N	\N	\N	7961	7962	7963	7964	7965
1595	CEEK VR	CEEK	\N	\N	\N	\N	\N	2856	\N	\N	\N	\N	\N	\N	7971	7972	7973	7974	7975
1596	SalPay	SAL	\N	\N	\N	\N	\N	2857	\N	\N	\N	\N	\N	\N	7976	7977	7978	7979	7980
1597	Couchain	COU	\N	\N	\N	\N	\N	2858	\N	\N	\N	\N	\N	\N	7981	7982	7983	7984	7985
1598	XMax	XMX	\N	\N	\N	\N	\N	2859	\N	\N	\N	\N	\N	\N	7986	7987	7988	7989	7990
1599	Smartshare	SSP	\N	\N	\N	\N	\N	2862	\N	\N	\N	\N	\N	\N	7996	7997	7998	7999	8000
1600	Sentinel Protocol	UPP	\N	\N	\N	\N	\N	2866	\N	\N	\N	\N	\N	\N	8001	8002	8003	8004	8005
1601	GoChain	GO	\N	\N	\N	\N	\N	2861	\N	\N	\N	\N	\N	\N	7991	7992	7993	7994	7995
1602	Bittwatt	BWT	\N	\N	\N	\N	\N	2867	\N	\N	\N	\N	\N	\N	8006	8007	8008	8009	8010
1603	Merculet	MVP	\N	\N	\N	\N	\N	2869	\N	\N	\N	\N	\N	\N	8016	8017	8018	8019	8020
1604	Constellation	DAG	\N	\N	\N	\N	\N	2868	\N	\N	\N	\N	\N	\N	8011	8012	8013	8014	8015
1605	FantasyGold	FGC	\N	\N	\N	\N	\N	2870	\N	\N	\N	\N	\N	\N	8021	8022	8023	8024	8025
846	Substratum	SUB	100	383021000	472000000	\N	1529639067	1984	\N	\N	\N	\N	\N	\N	4226	4227	4228	4229	4230
737	Binance Coin	BNB	15	114041290	194972068	\N	1529639664	1839	The Binance Coin is an Ethereum-based token that allows users to receive a discount for any fees on the Binance platform , a pure cryptocurrency exchange that plans to create a decentralised exchange for blockchain assets.\nBNB also gives users access to special features and will be used to power the upcoming decentralised exchange	Token	\N	\N	\N	f	3696	3697	3698	3699	3700
1360	Ontology	ONT	19	151292175	1000000000	\N	1529639683	2566	Ontology is a new high-performance public blockchain project & a distributed trust collaboration platform.\nOntology provides new high-performance public blockchains that include a series of complete distributed ledgers and smart contract systems.\nOntology blockchain framework supports public blockchain systems and is able to customize different public blockchains for different applications. Ontology supports collaboration amongst chain networks with its various protocol groups.\nOntology will constantly provide common modules on the underlying infrastructure for differient kinds of distributed senarios, such as those for the distributed digital identity framework, distributed data exchange protocol, and so on. Based on specific senario requirements, Ontology will continue to develop new common modules.	Token	\N	\N	\N	f	6796	6797	6798	6799	6800
468	Zcash	ZEC	22	4190831	4190831	\N	1529639656	1437	\N	\N	\N	\N	\N	\N	2336	2337	2338	2339	2340
945	ICON	ICX	23	387431340	400228740	\N	1529639670	2099	\N	\N	\N	\N	\N	\N	4716	4717	4718	4719	4720
353	Decred	DCR	25	7145743	7565743	21000000	1529639651	1168	\N	\N	\N	\N	\N	\N	1741	1742	1743	1744	1745
781	0x	ZRX	31	531712585	1000000000	\N	1529639664	1896	\N	\N	\N	\N	\N	\N	3891	3892	3893	3894	3895
1388	Dropil	DROP	84	19489194693	30000000000	\N	1529639682	2591	\N	\N	\N	\N	\N	\N	6916	6917	6918	6919	6920
1289	Polymath	POLY	99	276420107	1000000000	\N	1529639680	2496	\N	\N	\N	\N	\N	\N	6446	6447	6448	6449	6450
211	Verge	XVG	33	15054315539	15054315539	16555000000	1529639646	693	\N	\N	\N	\N	\N	\N	1051	1052	1053	1054	1055
383	Steem	STEEM	35	262629082	279603176	\N	1529639652	1230	\N	\N	\N	\N	\N	\N	1891	1892	1893	1894	1895
547	Nano	NANO	36	133248289	133248289	133248290	1529639658	1567	\N	\N	\N	\N	\N	\N	2736	2737	2738	2739	2740
147	Bytecoin	BCN	26	183890481254	183890481254	184470000000	1529639646	372	\N	\N	\N	\N	\N	\N	731	732	733	734	735
1044	Bitcoin Diamond	BCD	40	153756875	156756875	210000000	1529639672	2222	\N	\N	\N	\N	\N	\N	5206	5207	5208	5209	5210
1368	Bitcoin Private	BTCP	45	20467540	20467540	21000000	1529639683	2575	\N	\N	\N	\N	\N	\N	6836	6837	6838	6839	6840
630	Basic Attention Token	BAT	46	1000000000	1500000000	\N	1529639660	1697	\N	\N	\N	\N	\N	\N	3141	3142	3143	3144	3145
425	Stratis	STRAT	47	98904799	98904799	\N	1529639653	1343	\N	\N	\N	\N	\N	\N	2121	2122	2123	2124	2125
933	KuCoin Shares	KCS	51	90730576	180730576	\N	1529639669	2087	\N	\N	\N	\N	\N	\N	4661	4662	4663	4664	4665
803	Waltonchain	WTC	53	31144099	70000000	100000000	1529639665	1925	\N	\N	\N	\N	\N	\N	4001	4002	4003	4004	4005
792	Nebulas	NAS	54	45500000	100000000	100000000	1529639665	1908	\N	\N	\N	\N	\N	\N	3941	3942	3943	3944	3945
1296	Huobi Token	HT	55	50000200	500000000	\N	1529639680	2502	\N	\N	\N	\N	\N	\N	6476	6477	6478	6479	6480
784	Hshare	HSR	56	43138949	43138949	84000000	1529639666	1903	\N	\N	\N	\N	\N	\N	3921	3922	3923	3924	3925
307	Siacoin	SC	32	35208618170	35208618170	\N	1529639649	1042	\N	\N	\N	\N	\N	\N	1531	1532	1533	1534	1535
884	Cryptonex	CNX	62	45333165	106770791	210000000	1529639668	2027	\N	\N	\N	\N	\N	\N	4406	4407	4408	4409	4410
657	Bancor	BNT	64	50344400	75776901	\N	1529639661	1727	\N	\N	\N	\N	\N	\N	3266	3267	3268	3269	3270
119	MaidSafeCoin	MAID	66	452552412	452552412	\N	1529639656	291	\N	\N	\N	\N	\N	\N	591	592	593	594	595
1110	aelf	ELF	67	250000000	280000000	1000000000	1529639674	2299	\N	\N	\N	\N	\N	\N	5546	5547	5548	5549	5550
558	Ark	ARK	68	103356422	134606422	\N	1529639658	1586	\N	\N	\N	\N	\N	\N	2786	2787	2788	2789	2790
95	MonaCoin	MONA	69	60333275	60333275	\N	1529639643	213	\N	\N	\N	\N	\N	\N	481	482	483	484	485
674	FunFair	FUN	71	5010848189	10999873621	\N	1529639661	1757	\N	\N	\N	\N	\N	\N	3381	3382	3383	3384	3385
1117	Bibox Token	BIX	73	104342466	269944749	\N	1529639675	2307	\N	\N	\N	\N	\N	\N	5576	5577	5578	5579	5580
1402	Mithril	MITH	78	306507021	1000000000	\N	1529639683	2608	\N	\N	\N	\N	\N	\N	7001	7002	7003	7004	7005
696	Gas	GAS	79	10128375	17190378	100000000	1529639662	1785	\N	\N	\N	\N	\N	\N	3496	3497	3498	3499	3500
1035	QASH	QASH	89	350000000	1000000000	\N	1529639673	2213	\N	\N	\N	\N	\N	\N	5171	5172	5173	5174	5175
932	Bitcoin Gold	BTG	29	17080236	17180236	21000000	1529639670	2083	\N	\N	\N	\N	\N	\N	4656	4657	4658	4659	4660
325	Augur	REP	37	11000000	11000000	\N	1529639651	1104	\N	\N	\N	\N	\N	\N	1621	1622	1623	1624	1625
59	DigiByte	DGB	49	10423323682	10423323682	21000000000	1529639647	109	\N	\N	\N	\N	\N	\N	291	292	293	294	295
898	Enigma	ENG	80	74836171	150000000	\N	1529639669	2044	\N	\N	\N	\N	\N	\N	4481	4482	4483	4484	4485
1218	Theta Token	THETA	92	663902689	1000000000	\N	1529639678	2416	\N	\N	\N	\N	\N	\N	6081	6082	6083	6084	6085
1264	Zilliqa	ZIL	27	7575893444	12600000000	\N	1529639680	2469	\N	\N	\N	\N	\N	\N	6316	6317	6318	6319	6320
915	Aion	AION	58	167480575	465934587	\N	1529639668	2062	\N	\N	\N	\N	\N	\N	4566	4567	4568	4569	4570
650	IOTA	MIOTA	9	2779530283	2779530283	2779530283	1529639660	1720	IOTA is a public distributed ledger that stores transactions in a directed acyclic graph (DAG) structure, called a Tangle. The Tangle is used in place of the blockchain structure commonly used by other cryptocurrencies, such as Bitcoin.\nIOTA is a cryptocurrency designed specifically for the Internet of Things (IoT) that can be used for the secure sale and sharing of data streams..	Coin	\N	Tangle	\N	t	3236	3237	3238	3239	3240
172	Stellar	XLM	7	18759420211	104045664101	\N	1529639647	512	Stellar is a platform that connects banks, payments systems, and people. Integrate to move money quickly, reliably, and at almost no cost.\nXLM is a completely decentralized consensus platform. It is designed to support any type of currency. It has a built in decentralized exchange that can be used to trade any type of currency or asset. \nA decentralized network consists of peers that can run independently of each other. \nThis means that the Stellar network does not depend on any single entity. The idea is to have as many independent servers participate in the Stellar network as possible, so that the network will still run successfully even if some servers fail.\nLike a traditional ledger, the Stellar ledger records a list of all the balances and transactions belonging to every single account on the network. A complete copy of the global Stellar ledger is hosted on each server that runs the Stellar software. Any entity can run a Stellar server.\nThese servers form a decentralized Stellar network, allowing the ledger to be distributed as widely as possible. The servers sync and validate the ledger by a mechanism known as consensus.\nThis entire process of coming to consensus on the Stellar network occurs approximately every 2-5 seconds.	Coin	\N	\N	\N	f	856	857	858	859	860
1	Litecoin	LTC	6	57084003	57084003	84000000	1529639642	2	Litecoin (LTC or Ł) is a peer-to-peer cryptocurrency and open source software project released under the MIT/X11 license. Creation and transfer of coins is based on an open source cryptographic protocol and is not managed by any central authority. The coin was inspired by, and in technical details is nearly identical to, Bitcoin (BTC).	Coin	Scrypt	PoW	t	f	6	7	8	9	10
301	Ethereum	ETH	2	100225458	100225458	\N	1529639672	1027	Ethereum is an open-source, public, blockchain-based distributed computing platform and operating system featuring smart contract (scripting) functionality. It supports a modified version of Nakamoto consensus via transaction based state transitions. In popular discourse, the term Ethereum is often used interchangeably with Ether to refer to the cryptocurrency that is generated on the Ethereum platform.\nEther is a cryptocurrency whose blockchain is generated by the Ethereum platform. Ether can be transferred between accounts and used to compensate participant mining nodes for computations performed. Ethereum provides a decentralized Turing-complete virtual machine, the Ethereum Virtual Machine (EVM), which can execute scripts using an international network of public nodes. "Gas", an internal transaction pricing mechanism, is used to mitigate spam and allocate resources on the network.\nEthereum was proposed in late 2013 by Vitalik Buterin, a cryptocurrency researcher and programmer. Development was funded by an online crowdsale that took place between July and August 2014. The system went live on 30 July 2015, with 11.9 million coins "premined" for the crowdsale. This accounts for approximately 13 percent of the total circulating supply.\nIn 2016, as a result of the collapse of The DAO project, Ethereum was split into two separate blockchains – the new separate version became Ethereum (ETH), and the original continued as Ethereum Classic (ETC). The value of the Ethereum currency grew over 13,000 percent in 2017.	Coin	Ethash	PoW	t	f	1501	1502	1503	1504	1505
29	Ripple	XRP	3	39245304677	99991944394	100000000000	1529639642	52	Ripple provides one frictionless experience to send money globally using the power of blockchain. By joining Ripple’s growing, global network, financial institutions can process their customers’ payments anywhere in the world instantly, reliably and cost-effectively. Banks and payment providers can use the digital asset XRP to further reduce their costs and access new markets.\nRipple is the fastest and most scalable digital asset, enabling real-time global payments anywhere in the world. Built for enterprise use, XRP offers banks and payment providers a reliable, on-demand option to source liquidity for cross-border payments.	Coin	RPCA	\N	\N	t	131	132	133	134	135
824	TRON	TRX	10	65748111645	100000000000	\N	1529639666	1958	TRONIX is the Official Token of TRON.\nData liberation of TRON(TRX), with it’s intention of healing the internet .\nTron is a decentralized content entertainment protocol based on blockchain technology.\nTron strives to construct a global free content entertainment system, utilizing blockchain technology. This protocol allows each user to freely publish, store, and own data. The issuance, circulation, and trading of digital assets, through decentralized self governance, lay the foundation for the distribution and subscription of content, thereby empowering content creators as well as forming a decentralized content entertainment ecosystem.\nTron allows users to freely publish, store and own data. With Tron, content is owned by content creators, artists, and scriptwriters rather than the capitalists who consume them.	Token	\N	\N	\N	f	4116	4117	4118	4119	4120
4	Bitcoin	BTC	1	17107850	17107850	21000000	1529639677	1	Bitcoin is a cryptocurrency and worldwide payment system. It is the first decentralized digital currency, as the system works without a central bank or single administrator. The network is peer-to-peer and transactions take place between users directly, without an intermediary. These transactions are verified by network nodes through the use of cryptography and recorded in a public distributed ledger called a blockchain. Bitcoin was invented by an unknown person or group of people under the name Satoshi Nakamoto and released as open-source software in 2009.\nBitcoins are created as a reward for a process known as mining. They can be exchanged for other currencies, products, and services. As of February 2015, over 100,000 merchants and vendors accepted bitcoin as payment. Research produced by the University of Cambridge estimates that in 2017, there are 2.9 to 5.8 million unique users using a cryptocurrency wallet, most of them using bitcoin.	Coin	SHA256	PoW	t	f	1	2	3	4	5
187	Emercoin	EMC	85	41913608	41913608	\N	1529639658	558	\N	\N	\N	\N	\N	\N	921	922	923	924	925
1324	Fusion	FSN	87	29684331	57344000	\N	1529639680	2530	\N	\N	\N	\N	\N	\N	6616	6617	6618	6619	6620
243	Tether	USDT	11	2607140346	2830109502	\N	1529639651	825	Tether is a cryptocurrency token claimed by its creators to be backed by one dollar for each token issued. This claim is widely doubted and Tether Limited has not issued a promised audit backing the claim. Subpoenas from the U.S. Commodity Futures Trading Commission were sent to Tether on December 6, 2017.\nA spokesperson for Bitfinex and Tether has said that the CEO of both firms is Jan Ludovicus van der Velde.\nTether was issued on the Bitcoin blockchain through the Omni Layer Protocol. Tether claims that each unit of Tether is backed by one United States dollar held in reserve by Tether Limited, and may be redeemed through the Tether Platform. The primary objective is to facilitate transactions between cryptocurrency exchanges with a rate fixed to the United States dollar allowing traders to take advantage of high speed arbitrage opportunities without resorting to slow bank wires. As of February 2018, Tether is ranked around the 15th highest market cap cryptocurrency in the world, with a market cap around $2 billions United States dollars as of 5 February 2018.\nTether tokens are issued by Tether Limited.	Token	\N	\N	\N	f	1211	1212	1213	1214	1215
726	Bitcoin Cash	BCH	4	17196663	17196663	21000000	1529639663	1831	Bitcoin Cash is a cryptocurrency. It is a hard fork of the cryptocurrency bitcoin. The bitcoin scalability debate led to the hard fork on August 1, 2017, which resulted in the creation of a new blockchain.	Coin	SHA256	PoW	t	f	3656	3657	3658	3659	3660
256	NEM	XEM	18	8999999999	8999999999	\N	1529639648	873	NEM is a peer-to-peer cryptocurrency and blockchain platform launched on March 31, 2015. Written in Java, with a C++ version in the works, NEM has a stated goal of a wide distribution model and has introduced new features to blockchain technology such as its proof-of-importance (POI) algorithm, multisignature accounts, encrypted messaging, and an Eigentrust++ reputation system. The NEM blockchain software is used in a commercial blockchain called Mijin, which is being tested by financial institutions and private companies in Japan and internationally.	Coin	\N	PoI	\N	f	1276	1277	1278	1279	1280
71	Dash	DASH	13	8146796	8146796	18900000	1529639643	131	Dash (formerly known as Darkcoin and XCoin) is an open source peer-to-peer cryptocurrency. On top of Bitcoin's feature set, it currently offers instant transactions (InstantSend), private transactions (PrivateSend) and operates a self-governing and self-funding model that enables the Dash network to pay individuals and businesses to perform work that adds value to the network. Dash's decentralized governance and budgeting system makes it a decentralized autonomous organization (DAO).	Coin	X11	PoW/PoS	t	f	351	352	353	354	355
131	Monero	XMR	14	16154303	16154303	\N	1529639645	328	Monero (XMR) is an open-source cryptocurrency created in April 2014 that focuses on privacy and decentralization that runs on Windows, macOS, Linux, Android, and FreeBSD. Monero uses a public ledger to record transactions while new units are created through a process called mining. Monero aims to improve on existing cryptocurrency design by obscuring sender, recipient and amount of every transaction made as well as making the mining process more egalitarian.\nThe focus on privacy has attracted illicit use by people interested in evading law enforcement. The egalitarian mining process made it viable to distribute the mining effort opening new funding avenues for both legitimate online publishers and malicious hackers who covertly embed mining code into websites and apps.	Coin	CryptoNight	PoW	t	f	651	652	653	654	655
683	EOS	EOS	5	896149492	900000000	1000000000	1529639663	1765	EOS.IO is software that introduces a blockchain architecture designed to enable vertical and horizontal scaling of decentralized applications (the “EOS.IO Software”). This is achieved through an operating system-like construct upon which applications can be built. The software provides accounts, authentication, databases, asynchronous communication and the scheduling of applications across multiple CPU cores and/or clusters. The resulting technology is a blockchain architecture that has the potential to scale to millions of transactions per second, eliminates user fees and allows for quick and easy deployment of decentralized applications. \nblock.one, a Cayman Islands exempted company, is building the EOS.IO Software. With employees and advisors based around the world, the company focuses on business-grade technology solutions, including blockchain software development.\nEOS tokens are ERC-20 compatible tokens distributed on the Ethereum blockchain pursuant to a related ERC-20 smart contract (the “EOS Tokens”).	Token	\N	DPoS	\N	f	3411	3412	3413	3414	3415
419	Ethereum Classic	ETC	16	102472375	102472375	\N	1529639653	1321	Ethereum Classic is a decentralized platform that runs smart contracts: applications that run exactly as programmed without any possibility of downtime, censorship, fraud or third party interference.\nEthereum Classic is a continuation of the original Ethereum blockchain - the classic version preserving untampered history; free from external interference and subjective tampering of transactions.	Coin	Ethash	PoW	t	f	2086	2087	2088	2089	2090
870	Cardano	ADA	8	25927070538	31112483745	45000000000	1529639667	2010	Cardano is a technology platform that runs the Ada cryptocurrency. Daedalus is the cryptocurrency wallet that holds Ada .\nIt was created by blockchain development firm Input Output Hong Kong (IOHK) and led by Charles Hoskinson, former co-founder of BitShares and Ethereum, and aims to run smart contracts, decentralized applications, side chains, multi-party computation, and metadata. \nCardano develops their currency around a Recursive InterNetwork Architecture (RINA). It uses the Ouroboros proof of stake algorithm to achieve decentralized consensus in its network. In this protocol, slot leaders generate new blocks in the blockchain and verify the transactions. Anyone holding a Cardano ADA coin can become a slot leader. Cardano uses Haskell, a programming language with a high degree of fault tolerance.	Coin	Ouroboros	PoS	\N	f	4341	4342	4343	4344	4345
435	NEO	NEO	12	65000000	100000000	100000000	1529639654	1376	NEO is a blockchain platform and cryptocurrency which enables the development of digital assets and smart contracts. The project is based in China and was originally launched in 2014 as AntShares. NEO uses a delegated Byzantine Fault Tolerance (dBFT) consensus mechanism and can support up to 10,000 transactions per second. NEO tokens can be staked to produce GAS tokens which are used as the fuel of the platform, to pay for computation or deployment of smart contracts within the NEO network. The project was founded by Da Hongfei.	Coin	\N	\N	\N	t	2181	2182	2183	2184	2185
718	OmiseGO	OMG	20	102042552	140245398	\N	1529639663	1808	OmiseGO is a subsidiary of Omise, a leading online payment gateway service provider operating in Southeast Asia. The OmiseGO blockchain team has been involved in the Ethereum community from its very beginning—starting in 2015, Omise Blockchain Lab began research work focusing primarily on scalability. By the end of 2016, research had expanded into proof-of-stake (PoS) consensus design.\nOMG is the answer to a fundamental coordination problem amongst payment processors, gateways and financial institutions. By enabling decentralized exchange at high volume and low cost, OMG provides a next-generation value transfer service operating across currencies and asset types, and across national borders and corporate ledgers.\nThrough the OMG network, anyone will be able to conduct real-time, peer-to-peer financial transactions, including but not limited to, payments, remittances, payroll deposit, B2B commerce, supply-chain finance, loyalty program activity, asset management, and other on-demand services in a completely decentralized and inexpensive way, and including highly performance and fully decentralized trading.\nOMG offers mainstream end-customers an introduction to the many benefits of blockchain technology—the wallet SDK will make it easy to create dapps that let the end user take advantage of Ethereum’s immense potential without having to leave their comfort zone.\nOmise will use the OMG network as the platform for their own payments processing needs, but neither Omise nor OmiseGO will own or control the network.	Token	\N	PoS	\N	f	3576	3577	3578	3579	3580
\.


--
-- Data for Name: coin_news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coin_news (id, coin_id, news_id) FROM stdin;
1	270	1
2	270	3
3	971	2
4	4	5
5	240	4
6	524	4
7	945	4
8	1197	4
9	1	6
10	971	7
11	179	9
12	1197	9
13	243	11
14	270	11
15	971	11
16	270	8
17	898	12
18	683	8
19	270	13
20	971	13
21	971	14
22	270	15
23	759	15
24	270	18
25	971	18
26	270	16
27	1145	16
28	243	17
29	270	17
30	971	17
31	4	22
32	726	22
33	971	22
34	4	20
35	270	23
36	301	23
37	419	23
38	971	23
39	301	21
40	824	19
41	971	19
42	4	24
43	405	24
44	971	24
45	29	25
46	971	25
47	270	26
48	301	27
49	419	27
50	270	28
51	270	29
52	971	29
53	270	30
54	154	32
55	270	32
56	179	33
57	1197	33
58	270	34
59	4	38
60	633	38
61	971	38
62	1045	39
63	270	40
64	971	40
65	1	42
66	270	42
67	270	43
68	971	43
69	991	43
70	270	41
71	971	41
72	179	45
73	971	45
74	154	46
75	633	47
76	270	49
77	1	50
78	4	50
79	29	50
80	172	50
81	179	50
82	301	50
83	650	50
84	683	50
85	726	50
86	870	50
87	971	50
88	971	51
89	1197	51
90	270	52
91	569	52
92	270	53
93	971	53
94	243	54
95	1197	55
96	1	56
97	4	56
98	912	56
99	971	59
100	243	60
101	633	60
102	971	60
103	594	62
104	971	61
105	270	63
106	971	64
107	1197	64
108	179	66
109	270	66
110	971	65
111	971	67
112	971	68
113	489	70
114	4	71
115	971	71
116	1065	73
117	179	72
118	207	72
119	775	72
120	971	72
121	1554	72
122	898	74
123	280	75
124	301	75
125	340	75
126	971	75
127	243	76
128	71	77
129	131	77
130	179	77
131	971	77
132	270	78
133	270	79
134	270	80
135	633	81
136	683	81
137	270	82
138	270	84
139	179	85
140	1197	85
141	971	86
142	1197	86
143	270	87
144	270	88
145	971	88
146	4	89
147	301	89
148	1	90
149	270	90
150	633	91
151	971	91
152	301	92
155	270	96
156	971	97
153	4	94
154	29	95
157	4	98
158	270	92
159	971	92
160	971	98
161	1197	97
162	971	96
163	179	94
164	971	95
165	4	99
166	971	100
167	1207	101
168	1111	101
169	270	102
170	971	102
171	1197	102
172	945	103
173	240	103
174	524	103
175	1197	103
176	270	104
177	4	105
178	633	105
179	270	106
180	971	106
181	1145	106
182	898	108
183	971	108
184	270	107
185	329	107
186	868	107
187	971	107
203	270	118
204	759	118
231	971	131
248	270	143
249	971	143
188	301	109
189	971	109
205	270	119
206	179	120
207	270	120
230	4	130
245	270	140
246	971	140
190	270	110
191	1145	110
221	29	128
222	683	128
223	1	128
224	172	128
225	650	128
226	179	128
227	340	128
228	971	128
229	1592	128
247	1197	141
192	270	111
211	633	124
235	971	135
236	1601	135
257	270	147
258	971	147
193	154	112
210	270	121
214	971	125
238	633	137
239	1169	137
256	270	148
194	270	114
195	971	114
208	1197	122
209	1537	122
218	4	129
219	270	129
220	633	129
242	4	139
243	912	139
244	971	139
196	154	115
197	270	115
198	971	115
212	270	123
213	971	123
237	270	136
254	971	146
255	1197	146
199	270	116
200	971	116
234	1150	134
253	971	145
201	971	117
202	1197	117
232	1	132
233	270	132
250	301	144
251	419	144
252	971	144
215	971	126
216	683	127
217	179	127
240	1197	138
241	1350	138
259	270	150
260	971	150
261	971	151
262	4	152
263	270	152
264	971	152
\.


--
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.currency (id, fiat, symbol) FROM stdin;
1	t	USD
2	t	EUR
3	f	BTC
4	f	ETH
5	f	LTC
\.


--
-- Data for Name: knex_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.knex_migrations (id, name, batch, migration_time) FROM stdin;
1	20180612164544_initial.js	1	2018-06-21 09:31:44.203+00
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
1	Crypto Exchange Bithumb Halts Withdrawals After $31 Million Hack	Bithumb, one of the largest crypto exchanges in the world by trading volume, confirmed a hack of $31 million worth of cryptos on its platform today.	\N	https://www.coindesk.com/crypto-exchange-bithumb-halts-services-amid-31-million-hack/	2018-06-20 02:01:44+00	194
11	Crypto Cries Foul In Wake of Tether's Dollar Token Report	Tether announced its tokens are fully-backed by real cash according to a third-party review but the crypto community doesn't seem convinced.	\N	https://www.coindesk.com/crypto-cries-foul-in-wake-of-tethers-dollar-token-report/	2018-06-20 21:55:20+00	70
14	Speculation Rife as Bithumb Situation Develops, Market Recovers	The Bithumb situation has quickly developed over the past 24 hours, resulting in rampant speculation about what exactly happened.\nBithumb ‘Suspiciously’ Deletes Original Tweet\nNews of yesterday’s hack quickly broke on Bithumb‘s official Twitter account, but oddly enough, Bithumb deleted the original message after only a few hours. The original message stated that all deposits and withdrawals would be locked due to the theft of over $30 million worth of cryptocurrencies from the exchange’s wallets.\nThis seemingly random deletion led to a period of speculation and confusion for cryptocurrency community members. Some began to speculate that the hack was actually an ‘inside’ job, with a few drawing lines between a $28 million tax raise for Bithumb and the most recent hack.\nWhalePanda, popular cryptocurrency personality, fueled the rumors by taking a light-hearted jab at Bithumb on Twitter. \n\nBithumb had to pay $28 million worth of back taxes and now lost $30 million less than 2 weeks later.  https://t.co/spvFpzpb6X pic.twitter.com/DPq9kQG7Nm\n— WhalePanda (@WhalePanda) June 20, 2018\n\nIt is likely that the matching figures are just an untimely coincidence, and that Bithumb had only the best intentions while posting the aforementioned tweet. As a matter of fact, Bithumb left up a post on the ‘Bithumb Cafe’ blog, further showing that the Asian-based exchange only meant well. \nThe aforementioned blog post stated: \nWe sincerely apologize for any inconvenience you may have experienced. However, we will make every effort to reopen the service as soon as possible, with the ultimate goal of protecting your assets. \nDespite the aforementioned post, it has become apparent that Bithumb will need to further address the issue to calm the cryptocurrency community. Firstly, ensuring its customers that all funds are safe, and secondly, notifying users that the funds lost will be fully reimbursed. \nBitcoin Fees Skyrocket: Was it Bithumb’s Fault?\nOnce news of the hack was released, Bitcoin transaction fees took an abnormal turn to the upside, with average fees moving from 58 cents to $2.94. Although this was unexpected, CEO of BitRefill, Sergej Kotaliar, confirmed that this odd uptick in transaction fees was due to Bithumb moving Bitcoin out of their hotwallet. \nHe said: \nCurrently big backlogs and high fees on the Bitcoin network. Just confirmed that it is Bithumb, cleaning out their hotwallet.\nChart courtesy of BitInfo\nBithumb had to issue their transactions with absurd fees to ensure that miners marked the outgoing transactions as a priority. Bithumb reportedly overpaid fees by 100 times, which really goes to show how desperate they were to get the hot wallet Bitcoin into cold storage. It is likely that this fee surge will only be temporary, as high fee transactions leave Bitcoin’s mempool over the upcoming days. \nMarket Stays Strong Even After $30 Million Hack\nDespite taking a 3% tumble minutes after the attack, the market quickly bounced back, as price levels have now re-approached the levels seen prior to the apparent hack. Bitcoin is now stable at $6750, and Ethereum has re-approached $540. Other popular altcoins have followed this trend, with prices moving up slowly towards a collective $300 billion market cap.\nCharlie Lee, founder of Litecoin and well-known cryptocurrency personality went on CNBC’s Fast Money segment to address the hack. \nHe said:\n“Whenever there is an exchange hack, people get scared and the price drops. It happens all the time. But it doesn’t really change the fundamentals of Bitcoin, Litecoin or other cryptocurrencies because it’s like, if a bank gets broken in and gold is stolen, does that affect the price of gold? It shouldn’t.”\n\nWith this statement, Charlie Lee alludes that Bitcoin, along with the rest of the cryptocurrency market, should not tank after the announcement of an exchange hack. Fast Money host, Melissa Lee, also questioned Charlie about the current price action seen with cryptocurrencies, to which Charlie replied: \n“I believe we are kind of in a bear market right now. But I believe that the prices will rebound, and prices will come back up shortly.”\n \nImage from Shutterstock\nThe post Speculation Rife as Bithumb Situation Develops, Market Recovers appeared first on NewsBTC.	\N	https://www.newsbtc.com/2018/06/21/speculation-rages-bithumb-situation-develops-market-recovers/	2018-06-21 01:30:49+00	35
24	Bitcoin (BTC) Price Watch: Imminent Rising Wedge Breakout	Bitcoin Price Key Highlights\n\nBitcoin price has formed higher lows and slightly higher highs to create a rising wedge on its 1-hour chart.\nPrice is bouncing off resistance and might be due for another test of support.\nBitcoin price is also nearing the peak of the formation so a breakout might happen soon.\n\nBitcoin price might be gearing up for a break from its rising wedge pattern, but technical indicators are giving mixed signals.\nTechnical Indicators Signals\nThe 100 SMA is above the longer-term 200 SMA to indicate that the path of least resistance is to the upside. In other words, an upside break might be more likely to happen than a break below support.\nIf so, bitcoin price could be in for a steeper uptrend, possibly one that’s the same height as the wedge formation that spans $6,100 to $6,900. The 100 SMA also lines up with the bottom of the wedge to add to its strength as a floor.\nHowever, RSI looks ready to turn lower as it nears overbought levels. This suggests that bullish momentum could fade soon as buyers start to feel exhausted, likely allowing sellers to take over. Stochastic already seems to be on its way down to signal that bearish pressure is starting to come into play.\nBTCUSD Chart from TradingView\nMarket Factors\nBitcoin price took a hit earlier in the week on news of Bithumb’s hack, but it looks like it’s dealing with the news pretty well. This follows an earlier hack on a smaller South Korean exchange wherein lesser-known altcoins were affected.\nCryptocurrencies still seem to be hopeful that the SEC could avoid regulating these as securities, particularly after a senior official said so last week. The speculation that Tether was used to manipulate bitcoin price also seems to have been debunked, which gives investors fresh hope that the probe being conducted by US regulators would produce more or less the same results. In that case, confidence in the industry’s security could be restored.\nThe post Bitcoin (BTC) Price Watch: Imminent Rising Wedge Breakout appeared first on NewsBTC.	\N	https://www.newsbtc.com/2018/06/21/bitcoin-btc-price-watch-imminent-rising-wedge-breakout/	2018-06-21 04:25:40+00	22
48	Bithumb – Details Still Sketchy After $30 Mln Hack	Bithumb – What we know after $30 million hack	\N	https://cointelegraph.com/news/bithumb-details-still-sketchy-after-30-mln-hack	2018-06-20 18:58:20+00	88
59	Brazil’s Central Bank Develops Blockchain Data Sharing Platform for Financial Regulators	Brasil’s security and exchange commission, pension authority will be able to share data with the central bank’s new blockchain platform	\N	https://cointelegraph.com/news/brazil-s-central-bank-develops-blockchain-data-sharing-platform-for-financial-regulators	2018-06-20 22:28:08+00	122
60	Tether Releases ‘Transparency Update’ Vetted by Former FBI Director’s Law Firm	Controversial cryptocurrency startup Tether has released a “transparency update” indicating that its dollar-pegged USDT token, which had a $2.55 billion market cap as of June 1, is fully backed by physical dollars deposited in two separate banks. Released on Wednesday, the report was a product of Freeh, Sporkin &amp; Sullivan LLP (FSS), a legal firm\nThe post Tether Releases ‘Transparency Update’ Vetted by Former FBI Director’s Law Firm appeared first on CCN	\N	https://www.ccn.com/tether-releases-transparency-update-vetted-by-former-fbi-directors-law-firm/	2018-06-20 16:15:04+00	76
63	Grammy Winner Akon to Launch Cryptocurrency ‘Akoin,’ Build ‘Crypto City’ in Senegal	Akon, a Senegalese-American rapper and solar energy entrepreneur, plans to offer a cryptocurrency in two weeks to help improve conditions in Africa, according to Page Six. Speaking at the Cannes Lions International Festival of Creativity in Cannes, France, the entertainer and entrepreneur told a panel that cryptocurrency and blockchain technology could empower people in Africa\nThe post Grammy Winner Akon to Launch Cryptocurrency ‘Akoin,’ Build ‘Crypto City’ in Senegal appeared first on CCN	\N	https://www.ccn.com/grammy-winner-akon-to-launch-cryptocurrency-akoin-build-crypto-city-in-senegal/	2018-06-20 23:01:04+00	126
79	‘Cryptocurrencies are here to stay’ — The new Chairman of Malta Bankers Association	Malta has been in the spotlight of the blockchain space. The island made itself a reputation of ‘a blockchain island’ for offering tax incentives and jurisdictional certainty to cryptocurrency-based businesses. Marcel Cassar, the newly appointed chair of Malta Bankers Associations has shared his vision of blockchain and cryptocurrencies in an interview to local news outlet ‘The Malta Independent’. Cassar reflects on the implementation of new technologies in the banking sector and foreseen competition with fintech companies and IT giants. The chairman believes that the cryptocurrencies are here to stay and compares the furor they made to the early days of the internet. \nCassar distinguishes between the currency and the payment technology. These terms, according to him, answer different questions about the workings of money. The currency is the what and the payment technology is the how. Reflecting on cryptocurrencies, Cassar makes an analogy to the use case of mobile credit in the countries of the Global South. More specifically, he provides an example of the East Africa, where mobile network companies have won the competition over banks as payment intermediaries. The similarity is that in both cases there is ‘a medium of exchange for those willing to offer and accept it’.\nAs of today, Cassar sees no threat to the fiat currency in the short and medium terms. However, in his view, cryptocurrencies will produce a more significant impact on the current state of the banks. Their functionality as the main intermediary for the financial transactions will be challenged and in the future, might even become obsolete. The chairman still raises questions about the future state of cryptocurrencies. \n“But there are still some fundamental questions. Will they be accepted as a store of value? How will they be regulated? Will they become legal tender?”\nCassar commented on the present policies of the banking institutions towards crypto and the reasons behind them. \n“Many banks have been steering clear of cryptocurrencies because of the novelty they present, not being conventional legal tender nor backed by a central bank. They also present risks of money laundering because of the inherent anonymity of the assets while the volatility in their prices makes the average retail investor nervous, to say the least.”\nDespite the mentioned limitations, he admitted that there are smaller institutions in the EU and Switzerland that enter the cryptocurrency space. These organizations aspire to pioneer the technology and seize the money-grabbing opportunities in the new market. \nThe governments are no exception to this trend and Malta provides the prime example. In March, the prime minister of Malta proclaimed that the local regulators aim to ‘be the global trailblazers in the regulation of blockchain-based businesses and the jurisdiction of quality and choice for world-class fintech companies’. The chairman of Malta Bankers Association shared the perspective of the bankers association on the news about the biggest crypto exchanges, Binance and OKEx, moving to the country. \n“Right now, we are seeing the first exchange platforms seeking to establish banking relationships in Malta and we acknowledge that this is an area of unknown and unprecedented compliance risk for our banks.”\nThe further actions and policies from the banks, according to Cassar, will be done in coordination with central authorities, namely the Malta Financial Services Authority (MFSA). Cassar is concerned about the potential risks associated with the arrival of the crypto exchanges.  \n“So we need to be sure of what enhanced risk management and compliance capabilities the banks are putting in place because there are also other important linkages that need to be protected, among others our correspondent banking networks which still see these technologies as new and susceptible to risk of criminal abuse.”\nThe chairman noted that Malta faces important tests including the first International Monetary Fund (IMF) Financial Sector Assessment Programme for Malta since 2003.\nImage Source: “Flickr”\n \nThe post ‘Cryptocurrencies are here to stay’ — The new Chairman of Malta Bankers Association appeared first on Toshi Times.	\N	https://toshitimes.com/cryptocurrencies-are-here-to-stay-the-new-chairman-of-malta-bankers-association/	2018-06-20 13:43:15+00	2
83	Nasdaq Successfully Trials Blockchain Platform for Efficiently Handling Margin Calls	Nasdaq, a financial giant, best known for being a global stock exchange operator, has reported a successful trial of a new blockchain-based application, which will provide an efficient securities collateral solution.\nAccording to an official press release, the platform was jointly developed by Nasdaq, securities services provider ABN AMRO Clearing and financial services firms EuroCCP and Euroclear. The brand new proof-of-concept (PoC) blockchain platform will address current inefficiencies that have been further exacerbated recently, with the extension of trading hours.\nRight now, Central Counterparties (CCPs) face serious challenges when making margin calls after the stock exchange trading hours are over. \nIn trading, a margin call is made when a brokerage service requires that an investor deposit more funds so that the maintenance margin, a minimum amount of equity, is satisfied. When an investor trades by combining borrowed funds from the broker with their own money (which acts as collateral) the margin call may emerge as well.\nNasdaq Clearing CEO Julia Haglind welcomed the development and claimed that “As both a leading market technology provider and a CCP operator, Nasdaq is uniquely positioned to bring efficiencies to collateral management. We believe that blockchain technology brings with it a huge potential to transform markets everywhere, and this project is an excellent showcase of this.“\nReportedly, Nasdaq was tasked with the PoC development, while the remaining companies created the front-end and integrated the platform into their own environments.\nThe press release claims that the blockchain-based solution has “demonstrated that a shared, resilient network can be built between collateral givers, collateral takers and intermediaries,” enabling parties “to handle the margin call, the securities collateral delivery and the return process within minutes.”\nThe need for such a platform has become evident as the amount of market players on the buying side of things, such as hedge fund managers or institutional firms, clearing their derivative trades, keeps on growing. Therefore, a solution, aimed at fixing current inefficiencies has become essential, especially as such market players need to cover margin calls while operating in different time zones.\nEuroCCP chief executive Diana Chan commented on the matter, saying that, “We are excited to be partnering on a proof of concept that is extremely useful for transactions that are not already well-served by market infrastructures. With a solution like this in place we will be able to efficiently provide counterparty risk protection of equity trades after hours while reducing operational complexities. Today we are limited by European banking hours or arrangements in other time zones.“\nIt seems like the new blockchain solution will greatly improve the efficiency, with Nasdaq continuing to favour the budding technology. In April, Adena Friedman, CEO of the company, claimed that Nasdaq would consider opening a crypto exchange as digital currencies move closer towards mass adoption.\nImage Source: “Flickr”\nThe post Nasdaq Successfully Trials Blockchain Platform for Efficiently Handling Margin Calls appeared first on Toshi Times.	\N	https://toshitimes.com/nasdaq-successfully-trials-blockchain-platform-for-efficiently-handling-margin-calls/	2018-06-20 16:02:48+00	7
84	Goldman Sachs Explores Possibility of More Cryptocurrency Offerings	Goldman Sachs’ COO has hinted that the firm might offer more cryptocurrency trading products and services than its current offering on Bitcoin futures. This is particularly notable seeing as Goldman Sachs’ COO is rumored to replace the current CEO this December.\nThese comments came in an interview with Bloomberg, where Goldman Sachs’ COO, David Solomon, revealed that the Wall Street firm is currently discussing the possibility of offering further cryptocurrency trading services. Solomon argued that these internal discussions are in direct response to client demand. \nThis is hardly surprising, as Goldman Sachs has previously been somewhat of a cryptocurrency pioneer – at least when it comes to Wall Street firms. Goldman Sachs cleared trading of Bitcoin futures for clients this past December but has since then seemed reluctant to offer more cryptocurrency trading services. \nEven though the cryptocurrency market as a whole has declined from its record-breaking high of nearly $20,000 in December, it would seem that it is now warming to the notion of offering further cryptocurrency related offerings to its customers. Solomon’s remarks from the Bloomberg interview, however, would indicate that this interest is the result of customer demand. \n”We are clearing some futures around Bitcoin, talking about doing some other activities there, but it’s going very cautiously. We’re listening to our clients and trying to help our clients as they’re exploring those things too”, Solomon reportedly stated. \nSolomon also said that Goldman Sachs needed to ”evolve its business and adapt to the environment”, in offering virtual currencies. The addition of more cryptocurrency-related services would come just a month following Goldman Sachs announcement that it would launch a dedicated Bitcoin trading desk. \nSuch a Bitcoin trading desk had previously been the subject of rumors and discussions for months, which the firm’s CEO, Lloyd Blankfein, vehemently denied – until the Wall Street firm apparently changed its position on the issue.\nIt is still unclear what services or products Solomon was referring to when he revealed that internal discussions had been taking place at Goldman Sachs. However, if reports from other Wall Street firms are anything to go by, this might very well be some form of a custodial product.\nThis also comes as sourced have Solomon pegged as the potential successor of Goldman Sachs’ CEO Lloyd Blankfein, who is thought to resign this coming December. Although Blankfein has refuted any such rumors, one should keep in mind that he also denied the rumors of Goldman Sachs launching a Bitcoin trading desk.\nImage Source: “Flickr”\nThe post Goldman Sachs Explores Possibility of More Cryptocurrency Offerings appeared first on Toshi Times.	\N	https://toshitimes.com/goldman-sachs-explores-possibility-of-more-cryptocurrency-offerings/	2018-06-21 06:14:47+00	5
85	John McAfee To End His Involvement With ICOs Following “SEC Threats”	The cybersecurity behemoth John McAfee has announced that he intends to end his work relating to so-called ICOs (initial coin offerings). Moreover, McAfee has cited ”SEC threats” as the primary reason as to why he will end his involvement with token sales.\nMcAfee has previously been a major player in the ICO field, as he has been notoriously bullish on cryptocurrencies, and has recommended a wide variety of them to his around 800,000 Twitter followers. \nPreviously, McAfee has also charged $100,000 for every promotional ICO tweet he issued, according to an article by The Verge. Therefore, this change of heart is a noticeable departure from McAfee’s previous stance in relation to cryptocurrencies and ICOs.\nAlthough the SEC has garnered a substantial amount of both criticism and complaints leading up to this, the Securities and Exchange Commission is still a necessary regulatory body to act in concordance when it comes to the matter of cryptocurrencies.\nNonetheless, SEC officials recently stated that some cryptocurrencies could not be regarded as securities, which was greeted by enthusiasm by the cryptocurrency community. What’s more, McAfee had previously stated that he would not accept the SEC’s then official stance that the majority of token sales should be classified as securities offerings.\nMcAfee had also challenged the chairman of the SEC, Jay Clayton, to a public debate in order to presumably discuss cryptocurrency issues. The announcement that McAfee is leaving the ICO field is therefore understandably making waves within the cryptocurrency community. \nNonetheless, McAfee has been clear in communicating his desire to remain within the cryptocurrency field in some capacity. He also stated on Twitter that he is planning an ”equivalent alternative to ICOs”, which he has also said that the SEC will be unable to touch.\n\nDue to SEC threats, I am no longer working with ICOs nor am I recommending them, and those doing ICOs can all look forward to arrest. It is unjust but it is reality. I am writing an article on an equivalent alternative to ICOs which the SEC cannot touch. Please have Patience.\n— John McAfee (@officialmcafee) June 19, 2018\n\nAlthough the Securities and Exchange Commission did not grace his statement with a reply, McAfee concluded his tweet by urging followers to ”please have patience”. McAfee’s recent tweet also included a mention that it was ”unjust but a reality” that he will no longer work with ICOs.\nWhat’s more, McAfee also suggested that ”all” currently conducting ICOs can ”look forward to arrest”. Whilst this sounds unlikely, McAfee would seem to be an informed source in the subject. Nonetheless, an arrest of all of ”those doing ICOs” would be an unprecedented initiative and would likely send global ripples in the cryptocurrency community. \nMcAfee’s statements should therefore likely be taken with a grain of salt, and the cybersecurity icon seems to be set on still participating in the cryptocurrency industry in some capacity through his ”alternative to ICOs”. Although it is unclear what exactly this would be, it seems unlikely that this is the last we hear of John McAfee.\nImage Source: “Flickr”\nThe post John McAfee To End His Involvement With ICOs Following “SEC Threats” appeared first on Toshi Times.	\N	https://toshitimes.com/john-mcafee-to-end-his-involvement-with-icos-following-sec-threats/	2018-06-20 13:20:18+00	1
86	CBOE Global Markets President: ICO Market to Face a ‘Regulatory Reckoning’	The President of CBOE Global Markets claimed that there could be a two-fold “reckoning” for the ICO market depending on the action of the U.S. SEC	\N	https://cointelegraph.com/news/cboe-global-markets-president-ico-market-to-face-a-regulatory-reckoning	2018-06-20 02:41:22+00	372
5	Bitcoin Price Steady Above $6K Despite Bithumb Hack	Bitcoin remains on the hunt for $7,000 despite news that the a South Korean crypto exchange has been hacked.	\N	https://www.coindesk.com/bitcoin-retains-short-term-bull-bias-despite-exchange-hack/	2018-06-20 10:30:27+00	88
19	Tron (TRX) Price Watch: Correction Done, Aiming Higher	Tron Price Key Highlights\n\nTron price bounced off the area of interest marked in an earlier post.\nPrice is now making its way up to the swing high and the Fib extension tool shows the next upside targets.\nTechnical indicators also support the idea of more gains for Tron.\n\nTron price bounced off the resistance-turned-support region at the 0.04500 mark as expected and is aiming for new highs.\nTechnical Indicators Signals\nThe 100 SMA crossed above the longer-term 200 SMA to confirm that the path of least resistance is to the upside. In other words, the climb is more likely to resume than to reverse. After all, Tron price formed and confirmed an inverse head and shoulders pattern to signal that an uptrend is underway.\nApplying the Fibonacci extension tool reveals the next upside targets. Price has already moved past the 38.2% extension and is closing in on the 50% extension at 0.05076. Stronger selling pressure could take it up to the 61.8% extension at 0.05200 or the 78.6% extension near 0.05400. The full extension is located just past the 0.05600 level.\nRSI is on the move up to show that there’s buying pressure left. This might be enough to keep bulls in control until Tron price reaches the next potential resistance levels before buyers book profits. Stochastic is also on the move up so Tron price might follow suit, but this oscillator is dipping into overbought territory.\nTRXUSD Chart from TradingView\nMarket Factors\nCryptocurrencies appear to be in a much better mood lately as they managed to shrug off news of Bithumb’s hack, compared to the price reaction to the hack on a smaller South Korean exchange earlier on.\nSome say that this might be due to reports debunking the study that Tether was used to manipulate bitcoin price back in 2017, spurring hope that the probe by US regulators could yield the same results.\nThe post Tron (TRX) Price Watch: Correction Done, Aiming Higher appeared first on NewsBTC.	\N	https://www.newsbtc.com/2018/06/21/tron-trx-price-watch-correction-done-aiming-higher/	2018-06-21 04:40:46+00	15
29	House Rules Politicians Must Disclose Crypto Investments Above $1K	Members of the House of Representatives, the lower chamber of the U.S. Congress, must begin disclosing cryptocurrency investments that exceed $1,000.	\N	https://www.coindesk.com/crypto-investments-us-house-reps-investments/	2018-06-20 19:42:13+00	53
30	Goldman Sachs CEO: ‘Too Arrogant’ to Think Crypto Won’t Work Out Because It’s ‘Unfamiliar’	Goldman Sachs CEO has reiterated his optimism about Bitcoin adoption, comparing it to the early days of fiat paper money	\N	https://cointelegraph.com/news/goldman-sachs-ceo-too-arrogant-to-think-crypto-won-t-work-out-because-it-s-unfamiliar	2018-06-20 10:15:14+00	444
35	IBM Launches Blockchain-Powered Media Transactions Tracker to Prevent Advertising Fraud	Digital giant IBM introduces a blockchain-based pilot for tracking digital media transactions to provide transparency and cut costs in the advertising industry	\N	https://cointelegraph.com/news/ibm-launches-blockchain-powered-media-transactions-tracker-to-prevent-advertising-fraud	2018-06-19 21:43:37+00	110
40	Rapper Akon Creates ‘Akoin’ Cryptocurrency for Use in Senegal’s ‘Akon Crypto City’	The Akon Crypto City, a “100% crypto-based city,” will use rapper Akon’s cryptocurrency to “cryptonize” its daily life	\N	https://cointelegraph.com/news/rapper-akon-creates-akoin-cryptocurrency-for-use-in-senegal-s-akon-crypto-city	2018-06-20 17:54:49+00	224
53	World Wealth Report 2018: Young Millionaires Interested in Investing in Cryptocurrencies	Only around half of millionaires are in tune with their wealth managers and the very rich are increasingly interested in cryptocurrency investments	\N	https://cointelegraph.com/news/world-wealth-report-2018-young-millionaires-interested-in-investing-in-cryptocurrencies	2018-06-20 21:43:32+00	136
70	Essentia.one Announces $11m Fund to Incentivize Third Party Development of Its Protocol	This is a paid-for submitted press release. CCN does not endorse, nor is responsible for any material included below and isn’t responsible for any damages or losses connected with any products or services mentioned in the press release. CCN urges readers to conduct their own research with due diligence into the company, product or service mentioned\nThe post Essentia.one Announces $11m Fund to Incentivize Third Party Development of Its Protocol appeared first on CCN	\N	https://www.ccn.com/essentia-one-announces-11m-fund-to-incentivize-third-party-development-of-its-protocol/	2018-06-20 17:30:16+00	8
71	Bitcoin Price Rebounds to $6,700, Market Adds $8 Billion in Recovery Bithumb Hack	Yesterday, on June 20, more than $10 billion was erased from the cryptocurrency market after Bithumb, South Korea’s biggest cryptocurrency exchange was hacked. Today, the cryptocurrency market added $8 billion to its valuation following Bitcoin’s slight gain, recovering from the Bithumb hack within 24 hours. What’s Behind the Recovery? On June 20, major cryptocurrencies including\nThe post Bitcoin Price Rebounds to $6,700, Market Adds $8 Billion in Recovery Bithumb Hack appeared first on CCN	\N	https://www.ccn.com/bitcoin-price-rebounds-to-6700-market-adds-8-billion-in-recovery-bithumb-hack/	2018-06-21 06:22:01+00	54
6	A UK Exchange Is Launching Litecoin Futures Trading	A month after listing ethereum-based futures for trading, U.K exchange Crypto Facilities is now launching a derivative product for litecoin.	\N	https://www.coindesk.com/a-british-crypto-exchange-is-launching-litecoin-futures-trading/	2018-06-20 10:00:42+00	172
23	Cryptocurrency Trading Update: Ethereum Classic Leading the Recovery	FOMO Moments\nCurrent performing altcoins are Ethereum Classic, Tron, Nano, and Basic Attention Token.\nThe aftermath of the Bithumb hack did not have a long lasting effect on markets fortunately and they are creeping up today. Total market cap is edging back towards $300 billion but taking its time. Bitcoin has recovered all losses and is up 2.2% on the day to $6,780 and Ethereum is performing even better with a 3.6% rise to $540. It is too early to say whether the previous third big dip of the year was the last. Altcoins are generally in the green at the moment but the only one in double figures at the time of writing is Ethereum Classic.\nCoinmarketcap is reporting a 14% increase in ETC over the past 24 hours making it the leading altcoin in the top 25 during Asian trading. Ethereum Classic is currently trading at $17.09, up from $15 this time yesterday. Over the past seven days ETC has jumped 25% from $13.66 this time last Thursday. During the past 30 days however it has lost 5% falling from just over $18 the same time last month. Against Bitcoin ETC has gained 11.5% on the day to 253000 satoshis from 226700 sats this time yesterday. Weekly gains on BTC have been around 20% from 211000 satoshis this time last week.\n\nMomentum is likely coming from the Coinbase support and announcement that ETC will be the next digital asset that it lists. What is a notable coincidence however is that the announcement was made just three days before the SEC declared that Ethereum was not a security indicating that Coinbase may have already been aware of this. ETC is likely to continue upwards until it gets listed on Coinbase unless the bears grab hold of the markets in force again.\nOKEx is currently the most popular exchange for ETC trade with over 27% of the total volume and Binance is second with around 12%. That daily volume has increased from $285 million to $387 million over the past 24 hours. Ethereum Classic’s market cap has also increased as a result and is currently at $1.75 billion positioning it at 16th in the charts.\nTotal crypto market capitalization has climbed 3% on the day and is currently $291 billion. There is a lot of speculation of a recovery but in general the long term trend is still bearish. Looking back at the six month chart we are still near the bottom of the third dip of 2018. Other altcoins faring well at the moment include Tron up 7.8% as its mainnet approaches, Nano 10% higher on the day, and BAT climbing 12.5% at the time of writing.\nMore on Ethereum Classic can be found here: https://ethereumclassic.org/\nFOMO Moments is a section that takes a daily look at the top 25 altcoins during the Asian trading session and analyses the best performing one, looking for trends and possible fundamentals.\nThe post Cryptocurrency Trading Update: Ethereum Classic Leading the Recovery appeared first on NewsBTC.	\N	https://www.newsbtc.com/2018/06/21/ryptocurrency-trading-update-ethereum-classic-leading-recovery/	2018-06-21 06:11:21+00	20
32	Korean Ministry Launches Probe Into Causes of Bithumb Crypto Exchange Hack	The South Korean Ministry of Science and Technology has launched a probe into the theft of $30 mln from the world’s sixth largest crypto exchange Bithumb	\N	https://cointelegraph.com/news/korean-ministry-launches-probe-into-causes-of-bithumb-crypto-exchange-hack	2018-06-20 10:32:06+00	79
41	Crypto Markets See Red After Hack of World’s Sixth Largest Crypto Exchange	All of the top ten cryptocurrencies by market cap have been hit by losses today, after news broke of the hack of the world’s sixth largest crypto exchange, Bithumb	\N	https://cointelegraph.com/news/crypto-markets-see-red-after-hack-of-world-s-sixth-largest-crypto-exchange	2018-06-20 12:10:31+00	109
76	Tether Fully Backed by USD – Law Firms Unofficial Statement	Tether clears the air about the questions that were asked about its physical backing of U.S Dollars, by giving full online access to its bank accounts to a legal firm.\nTether which is cryptocurrency’s first and most famous stable coin got the approval of the backing from the legal firm, Freeh, Sporkin and Sullivan LLP (FSS) that there is, in fact, $2.55 billion in their bank accounts.\nThe cryptocurrency community classified Tether as phony and controversial given its claim of backing each token to a dollar. However, this report will have to make many bite their tongues.\nThe ‘transparency update’ that was reported by FSS includes a member that’s a former FBI director.\nFSS claimed that the review of the accounts was done on June 1st, with no awareness of when it was conducted by the company so that no prior arrangements would be made. The holdings are in two different banks, both being unnamed. However, reports show that one might be Puerto Rico’s Noble Bank.\n“As part of the Engagement, FSS was able to confirm the U.S. Dollar (“USD”) balances in accounts owned or controlled by Tether at its banks, including selecting the appropriate confirmation dates, and reporting to Tether as to the results of such inquiries. As per the letter of engagement, FSS selected the dates for balance confirmations without prior notice to or consultation with Tether. FSS is confident that Tether’s unencumbered assets exceed the balance of fully-backed USD Tethers in circulation as of June 1st, 2018, ” FSS Said.\nLast week, the University of Texas published a hard-hitting paper reporting USDT which is Tether’s coin to have been used to manipulate Bitcoin’s price in last year’s record-breaking bull run. The University’s paper also stated that USD does not fully back it.\nTether stuck to its word of ensuring that a definite answer will be given soon. \n “To address allegations head-on, we wish to make a few things clear: All Tethers in circulation are fully backed by USD reserves. Full stop. Memoranda, consulting reports, industry leaders, cryptocurrency pioneers, and competitors have all confirmed this. Reserves have always, and will always, match the number of Tethers in circulation,” Tether said after the critical paper.\nThe only drawback to this whole assessment is the fact that it is not a formal audit. \n “The bottom line is an audit cannot be obtained. The big four firms are anathema to that level of risk. We’ve gone for what we think is the next best thing,” Stuart Hoegner, Tether’s general counsel, told Bloomberg.\nWith many accounting firms not ready to perform a formal audit, the critics will have to trust FSS’s report.\nImage Source: “Flickr”\nThe post Tether Fully Backed by USD – Law Firms Unofficial Statement appeared first on Toshi Times.	\N	https://toshitimes.com/tether-fully-backed-by-usd-law-firms-unofficial-statement/	2018-06-21 08:29:04+00	0
7	Brazil's Central Bank Plans Blockchain Data Exchange for Regulators	Banco Central do Brasil is building a blockchain platform to ensure the authenticity of data exchanged between financial authorities.	\N	https://www.coindesk.com/brazils-central-bank-plans-blockchain-data-exchange-for-regulators/	2018-06-20 12:00:33+00	95
22	Bitcoin Cash Price Analysis: BCH/USD Resumes Uptrend	Key Points\n\nBitcoin cash price found support near the $865 level and bounced back against the US Dollar.\nYesterday’s highlighted short-term bullish trend line is intact with support at $880 on the hourly chart of the BCH/USD pair (data feed from Kraken).\nThe pair is moving higher and it may soon make an attempt to break the $908 resistance level.\n\nBitcoin cash price found support above $850 and recovered against the US Dollar. BCH/USD is resuming uptrend and it could break the $900-910 resistance.\nBitcoin Cash Price Trend\nAfter a correction below the $880 level, bitcoin cash price found support against the US Dollar. The price tested the $865 level where buyers appeared and prevented more losses. Moreover, the 61.8% Fib retracement level of the last leg from the $825 low to $925 swing high also acted as a support. A fresh upward wave was initiated and the price bounced back above the $880 resistance level.\nDuring the upside, the price broke the 50% Fib retracement level of the last decline from the $926 high to $865 low. The current price action is positive and suggests more gains above the $900 level. An initial hurdle for buyers is around the $908-910 zone. Moreover, the 76.4% Fib retracement level of the last decline from the $926 high to $865 low at $911 may also stop upsides. Should there be an upside break above $911, the price could kick start more gains above the $920 level. On the downside, yesterday’s highlighted short-term bullish trend line is intact with support at $880 on the hourly chart of the BCH/USD pair.\n\nLooking at the chart, the price is well supported above the $880 level, the trend line, and the 100 hourly simple moving average.\nLooking at the technical indicators:\nHourly MACD – The MACD for BCH/USD is currently in the bullish zone.\nHourly RSI (Relative Strength Index) – The RSI for BCH/USD is now well above the 50 level.\nMajor Support Level – $880\nMajor Resistance Level – $910\nThe post Bitcoin Cash Price Analysis: BCH/USD Resumes Uptrend appeared first on NewsBTC.	\N	https://www.newsbtc.com/2018/06/21/bitcoin-cash-price-analysis-bch-usd-resumes-uptrend/	2018-06-21 04:08:30+00	13
36	Blockchain Platform to Challenge App Stores With ‘Borderless Payments’	A start-up wants to challenge major app stores and their “unfair policies” by reducing commission fees and speeding up payments to merchants #SPONSORED	\N	https://cointelegraph.com/news/blockchain-platform-to-challenge-app-stores-with-borderless-payments	2018-06-19 22:05:06+00	108
39	Samsung Marries Blockchain, AI in Cello 3.0 Logistics Platform	Samsung SDS has presented Cello 3.0, a new logistics platform which utilizes blockchain and artificial intelligence	\N	https://cointelegraph.com/news/samsung-marries-blockchain-ai-in-cello-3-0-logistics-platform	2018-06-20 11:39:12+00	146
52	Analysts Concerned About Crypto Mining Impact on AMD Share Price	Some analysts warn that should crypto mining cool down, or miners witch from AMD’s GPUs, investors could be disappointed in what happens to AMD’s stock prices	\N	https://cointelegraph.com/news/analysts-concerned-about-crypto-mining-impact-on-amd-share-price	2018-06-21 03:30:18+00	67
69	ASKfm: Now with Blockchain and Tokenization	This is a paid-for submitted press release. CCN does not endorse, nor is responsible for any material included below and isn’t responsible for any damages or losses connected with any products or services mentioned in the press release. CCN urges readers to conduct their own research with due diligence into the company, product or service mentioned\nThe post ASKfm: Now with Blockchain and Tokenization appeared first on CCN	\N	https://www.ccn.com/askfm-now-with-blockchain-and-tokenization/	2018-06-20 16:01:56+00	9
8	EOS Locked 7 Accounts and This Has Implications for Everyone in Crypto	Seven EOS accounts were frozen to prevent token theft. But does this seemingly moral decision spell havoc for the broader crypto market?	\N	https://www.coindesk.com/eos-locked-7-accounts-implications-everyone-crypto/	2018-06-20 08:00:14+00	199
15	Winklevoss Brothers Score Another Crypto Investment Patent	Tyler and Cameron Winklevoss, the founders of the Gemini cryptocurrency exchange, just won another crypto-related patent.	\N	https://www.coindesk.com/winklevoss-brothers-score-another-crypto-investment-patent/	2018-06-21 02:00:17+00	84
25	Ripple Price Analysis: XRP/USD Remains in Uptrend	Key Highlights\n\nRipple price stayed above the $0.5250 support and bounced back against the US dollar.\nThere is a crucial ascending channel forming with support at $0.5380 on the hourly chart of the XRP/USD pair (data source from Kraken).\nThe pair is currently in an uptrend and it is likely to accelerate gains above $0.5500 in the near term.\n\nRipple price is moving nicely against the US Dollar and Bitcoin. XRP/USD may perhaps continue to move higher above the $0.5500 resistance.\nRipple Price Trend\nRecently, there was a downside reaction below the $0.5300 level in Ripple price against the US Dollar. The XRP/USD pair traded towards the $0.5250 support area where buyers appeared. Moreover, the 76.4% Fib retracement level of the last wave from the $0.5105 low to $0.5615 high also acted as a support. XRP price bounced back from the $0.5250 support and the 100 hourly simple moving average.\nIt climbed back above the $0.5300 resistance with positive signs. During the upside, the price broke the 50% Fib retracement level of the last decline from the $0.5611 high to $0.5234 low. At the moment, the price is trading just below the $0.5500 resistance, which is preventing an upside break. Additionally, the 61.8% Fib retracement level of the last decline from the $0.5611 high to $0.5234 low is also acting as a hurdle for buyers. Should there be a break above $0.5500, the price may perhaps move past $0.5600. More importantly, there is a crucial ascending channel forming with support at $0.5380 on the hourly chart of the XRP/USD pair.\n\nLooking at the chart, the price remains well supported above $0.5350. Below this, the price might move back towards the last swing low of $0.5250 in the near term.\nLooking at the technical indicators:\nHourly MACD – The MACD for XRP/USD is moving slowly in the bullish zone.\nHourly RSI (Relative Strength Index) – The RSI for XRP/USD is now placed nicely above the 50 level.\nMajor Support Level – $0.5350\nMajor Resistance Level – $0.5500\nThe post Ripple Price Analysis: XRP/USD Remains in Uptrend appeared first on NewsBTC.	\N	https://www.newsbtc.com/2018/06/21/ripple-price-analysis-xrp-usd-remains-uptrend/	2018-06-21 07:00:20+00	11
45	Filipino Bank to Launch Japan Remittances Using IBM and Partners	New blockchain remittance partnership between the two countries’ banks aims to woo Filipino workers in Japan	\N	https://cointelegraph.com/news/filipino-bank-to-launch-japan-remittances-using-ibm-and-partners	2018-06-20 10:52:20+00	202
49	Goldman Sachs Exploring Crypto Derivatives, Says COO	The COO of Goldman Sachs has announced that the company is exploring trading cryptocurrency derivatives	\N	https://cointelegraph.com/news/goldman-sachs-exploring-crypto-derivatives-says-coo	2018-06-20 20:46:01+00	107
77	Japan To Clamp Down On Insider Trading, Monero (XMR), Dash (DASH) And Other Privacy Coins	Subsequent to the notorious $530 million hack on Coincheck, a Tokyo-based exchange, there came the establishment of a body to combat and mitigate possible reoccurrence of the dreadful situation. \nThe association which comprises of sixteen registered cryptocurrency exchanges, grouped under a self-regulatory body, in a bid to perform its responsibility, is set to pass a vote on a proposal to clamp down on insider trading and privacy coins like Monero and Dash.\nThe chairman of Japan Virtual Currency Exchange Association (JVCEA), Taizen Okuyama who is also the CEO of Monex, disclosed that the group is working hard on maintaining standard internal control and restore confidence in the industry.\n“We are working hard to develop security measures and internal control, we will promptly promote the rules of transactions and advertisements and the information we disclose.” \n“We want to eliminate customers’ concerns and work to restore confidence in order to develop healthy markets,” Okuyama stated. \nActualizing its stated plan, the group designed and established self-regulatory rules with different measures that will use to sanitize trading within the country. \nAccording to Nikkei report which was released on Wednesday, in the established rules which were drawn out on 100 pages, the association will be prohibiting the acceptance of privacy coins like Monero and Dash that are new and untraceable to previous sellers. \nWhile one of the aims of the association is to sabotage all illicit activities related to money laundering in the country, Japan’s Financial Services Agency (FSA) who is a member of the group is responsible for asserting force on domestic exchanges to shelf their support for the privacy coins so that trading with such coins will gradually come to end. \nJust because the January 500 million NEM heist which was regarded as the largest crypto hack ever known resulted from the susceptibility of online wallets where tokens were stored, JVCEA compelled all exchanges to issue internal audits report to the body, and protect every user’s asset by storing private keys offline. \nFurthermore, the framework designed by the regulatory body requires every exchange to infix circuit breakers so that trading could be halted when needed, and likewise retain their quoted exchange rates in line with the market rates. \n“We’re being subjected to rules almost as tough as the Financial Instruments and Exchange Act,” displaying concern over the latest development, an official of one of the exchanges I the country noted. \nIn line with the report, the proposed rule will not be initiated until JVCEA pass their vote June 27.\nImage Source: “Flickr”\nThe post Japan To Clamp Down On Insider Trading, Monero (XMR), Dash (DASH) And Other Privacy Coins appeared first on Toshi Times.	\N	https://toshitimes.com/japan-to-clamp-down-on-insider-trading-monero-xmr-dash-dash-and-other-privacy-coins/	2018-06-21 06:48:02+00	0
9	The SEC Just Froze One ICO's Accounts for a Second Time	The SEC is once more taking action against a co-founder of the PlexCoin ICO project, having already sued him over securities violations and fraud.	\N	https://www.coindesk.com/the-sec-is-again-freezing-the-assets-of-a-plexcoin-founder/	2018-06-20 15:31:49+00	65
21	Ethereum Price Analysis: ETH/USD Targets New Highs	Key Highlights\n\nETH price found a strong support around the $525 level and recovered against the US Dollar.\nYesterday’s highlighted important bullish trend line is intact with support at $518 on the hourly chart of ETH/USD (data feed via Kraken).\nThe pair is likely to continue higher and it may perhaps target a new high above the $545 level.\n\nEthereum price is trading with a positive bias against the US Dollar and Bitcoin. ETH/USD could accelerate gains above the $545 and $548 levels in the near term.\nEthereum Price Upside Move\nAfter a downside correction below $530, ETH price found support against the US Dollar. The price tested the $520-525 support zone and recovered nicely. There was a decent base formed near the 50% Fib retracement level of the last leg from the $485 swing low to $548 high. More importantly, there was no break below $520 and the 100 hourly simple moving average.\nA new upward wave was initiated and the price climbed above the $530 resistance. There was a break above the 50% Fib retracement level of the last decline from the $548 high to $517 low. At the moment, the price is trading near a major resistance zone and is testing the $545-548 zone. A break and close above this may perhaps open the doors for more gains above the $555 level in the near term. On the downside, yesterday’s highlighted important bullish trend line is intact with support at $518 on the hourly chart of ETH/USD. Before the trend line, the $525 support and the 100 hourly SMA could stop declines.\n\nLooking at the chart, the price is trading with a positive bias above $530. A break above the $548 high could really put a lot of pressure on sellers and ETH could jump above the $555 level.\nHourly MACD – The MACD has moved back in the bullish zone.\nHourly RSI – The RSI is now back above the 55 level.\nMajor Support Level – $518\nMajor Resistance Level – $548\nThe post Ethereum Price Analysis: ETH/USD Targets New Highs appeared first on NewsBTC.	\N	https://www.newsbtc.com/2018/06/21/ethereum-price-analysis-eth-usd-targets-new-highs/	2018-06-21 05:00:28+00	14
42	UK Crypto Exchange to Launch Litecoin Futures	UK-based crypto futures exchange Crypto Facilities is launching Litecoin	\N	https://cointelegraph.com/news/uk-crypto-exchange-to-launch-litecoin-futures	2018-06-20 11:59:55+00	135
61	Musicians Have Always Been Ripped off – Here’s How to Fix It	This is a submitted sponsored story. CCN urges readers to conduct their own research with due diligence into the company, product or service mentioned in the content below. The music industry’s business model has always been broken. For over 100 years artists have been paid a fraction of the earnings their music makes. Take Enrico Caruso,\nThe post Musicians Have Always Been Ripped off – Here’s How to Fix It appeared first on CCN	\N	https://www.ccn.com/musicians-have-always-been-ripped-off-heres-how-to-fix-it/	2018-06-20 17:11:06+00	10
68	Circle’s Decision-Making Process On New Token Listings Revealed	The criteria exchanges employ in making listing decisions is not entirely an exact science. In an effort to offer clarity, Goldman Sachs-backed fintech startup Circle has released details regarding how it decides what to list on its Poloniex exchange. The five broad categories that Circle examines when analyzing the potential of an asset are market\nThe post Circle’s Decision-Making Process On New Token Listings Revealed appeared first on CCN	\N	https://www.ccn.com/circles-decision-making-process-on-new-token-listings-revealed/	2018-06-20 18:33:39+00	31
73	IoT Chain (ITC) Team Will Attend the Plug and Play (PNP) Supply Chain & Logistics Focus Week	This is a paid-for submitted press release. CCN does not endorse, nor is responsible for any material included below and isn’t responsible for any damages or losses connected with any products or services mentioned in the press release. CCN urges readers to conduct their own research with due diligence into the company, product or service mentioned\nThe post IoT Chain (ITC) Team Will Attend the Plug and Play (PNP) Supply Chain &amp; Logistics Focus Week appeared first on CCN	\N	https://www.ccn.com/iot-chain-itc-team-will-attend-the-plug-and-play-pnp-supply-chain-logistics-focus-week/	2018-06-20 18:07:12+00	11
74	Enigma Price Bounces Following Intel Partnership	The Enigma price jumped today on news that the company will partner with Intel to develop privacy-preserving computing technologies. The price for the privacy-centric altcoin moved from $1.39 to $1.65 today, according to CoinMarketCap, its best performance in more than a week, edging closer to the $2.16 peak it reached two weeks ago. Enigma’s price\nThe post Enigma Price Bounces Following Intel Partnership appeared first on CCN	\N	https://www.ccn.com/enigma-price-bounces-following-intel-partnership/	2018-06-21 00:14:57+00	30
10	National Chinese Science Academy Launches Blockchain Lab	China's federal science institution, the Chinese Academy of Sciences, is eyeing blockchain technology, the school announced this week.	\N	https://www.coindesk.com/national-chinese-science-academy-launches-blockchain-lab/	2018-06-21 07:00:26+00	58
20	Bitcoin Price Watch: BTC/USD Approaching Key Break	Key Points\n\nBitcoin price found support near the $6,620 level and recovered well against the US Dollar.\nThere is a key contracting triangle formed with support at $6,700 and resistance near $6,780 on the hourly chart of the BTC/USD pair (data feed from Kraken).\nThe pair is likely approaching the next break either above $6,800 or below $6,650 in the near term.\n\nBitcoin price is placed nicely above the $6,650 level against the US Dollar. BTC/USD may soon make the next move (likely higher above $6,800).\nBitcoin Price Analysis\nRecently, there was the third rejection from the $6,800-6,820 resistance zone in bitcoin price against the US Dollar. The BTC/USD pair declined and traded below the $6,700 level. However, the decline was prevented by the $6,600 support and the 100 hourly simple moving average. Moreover, the 61.8% Fib retracement level of the last leg from the $6,360 low to $6,850 high also provided support.\nAs a result, the price bounced back and moved above the $6,700 resistance area. However, bitcoin buyers continue to struggle to clear the $6,800-6,820 resistance zone. A break above this is needed for a push towards the $7,000 handle in the near term. At the moment, it seems like there is a key contracting triangle formed with support at $6,700 and resistance near $6,780 on the hourly chart of the BTC/USD pair. The triangle support is close to the 50% Fib retracement level of the last wave from the $6,595 low to $6,812 high.\n\nLooking at the chart, the price is approaching the next break either above $6,800 or below $6,650 in the near term. Above $6,800, the price will most likely visit $7,000. On the flip side, a break below $6,700 and $6,650 may increase bearish pressure in the short term.\nLooking at the technical indicators:\nHourly MACD – The MACD for BTC/USD is slowly moving back in the bearish zone.\nHourly RSI (Relative Strength Index) – The RSI is now well above the 50 level.\nMajor Support Level – $6,650\nMajor Resistance Level – $6,800\nThe post Bitcoin Price Watch: BTC/USD Approaching Key Break appeared first on NewsBTC.	\N	https://www.newsbtc.com/2018/06/21/bitcoin-price-watch-btc-usd-approaching-key-break/	2018-06-21 08:38:20+00	11
34	World’s Sixth Largest Crypto Exchange Bithumb Hacked, Loses $30 Mln	Leading South Korean crypto exchange Bithumb, the world’s sixth largest, has been hacked	\N	https://cointelegraph.com/news/world-s-sixth-largest-crypto-exchange-by-trade-volume-bithumb-hacked	2018-06-20 03:13:38+00	481
38	Robinhood CEO: It's 'Very Foolish' to Rule Out Bitcoin	More than a million people signed up to trade cryptocurrencies after Robinhood first announced the feature, co-CEO Vlad Tenev said Wednesday.	\N	https://www.coindesk.com/robinhood-ceo-cryptocurrencies-have-significant-staying-power/	2018-06-20 16:25:09+00	89
51	Nasdaq CEO: ICOs Pose ‘Serious Risks’ for Retail Investors Due to Lack of Oversight	Nasdaq CEO Adena Friedman claims that ICOs pose “serious risks” for retail investors citing lack of oversight	\N	https://cointelegraph.com/news/nasdaq-ceo-icos-pose-serious-risks-for-retail-investors-due-to-lack-of-oversight	2018-06-21 01:12:26+00	65
66	‘Evolve & Adapt’: Goldman Sachs May Trade Cryptocurrencies, Not Just Futures	Investment banking giant Goldman Sachs is getting more serious about launching a full-scale cryptocurrency trading operation. Speaking with Bloomberg, Goldman Sachs COO David Solomon said that the firm is holding internal discussions about offering more cryptocurrency trading services in response to client demand. “We are clearing some futures around Bitcoin, talking about doing some other\nThe post ‘Evolve &amp; Adapt’: Goldman Sachs May Trade Cryptocurrencies, Not Just Futures appeared first on CCN	\N	https://www.ccn.com/evolve-adapt-goldman-sachs-may-trade-cryptocurrencies-not-just-futures/	2018-06-20 17:24:49+00	91
87	Amsterdam's Airport Lets Travelers Swap Leftover Euros for Cryptos	Amsterdam's Schiphol airport has launched an ATM that allows departing travelers to exchange their remaining euros for bitcoin or ethereum.	\N	https://www.coindesk.com/amsterdams-airport-lets-travelers-swap-leftover-euros-for-cryptos/	2018-06-21 09:00:21+00	17
92	Ethereum Accelerator to Offer Crypto Coders Resources and 'Reality Check'	A blockchain company known as a hub of startups is expanding its reach, launching a new San Francisco-based startup accelerator.	\N	https://www.coindesk.com/consensys-launches-sf-accelerator/	2018-06-21 12:59:46+00	109
102	Ex-FDIC Chair Bair: 'I Welcome' New Rules for Crypto	Former FDIC chair Sheila Bair thinks the U.S. needs to create an entirely new regulatory framework for cryptocurrencies.	\N	https://www.coindesk.com/ex-fdic-chair-bair-welcome-new-rules-crypto/	2018-06-21 19:01:09+00	46
107	The BIS’ Report on Crypto as Money: A Critical Review	The Bank of International Settlements doesn’t think that crypto can substitute money. Is their criticism justified?	\N	https://cointelegraph.com/news/the-bis-report-on-crypto-as-money-a-critical-review	2018-06-21 11:24:00+00	95
118	Winklevoss Brothers Win Patent to Provide Crypto-Based Exchange-Traded Products	U.S. grants Cameron and Tyler Winklevoss yet another patent, this time for a system to provide crypto-based ETPs	\N	https://cointelegraph.com/news/winklevoss-brothers-win-patent-to-provide-crypto-based-exchange-traded-products	2018-06-21 19:27:00+00	118
133	Open Source Blockchain Is the Future	This is a paid-for submitted press release. CCN does not endorse, nor is responsible for any material included below and isn’t responsible for any damages or losses connected with any products or services mentioned in the press release. CCN urges readers to conduct their own research with due diligence into the company, product or service mentioned\nThe post Open Source Blockchain Is the Future appeared first on CCN	\N	https://www.ccn.com/open-source-blockchain-is-the-future/	2018-06-21 18:17:13+00	9
141	SEC Obtains Another Order to Freeze Plexcoin ICO Assets	The US Securities and Exchange Commission has obtained an additional emergency court order from a federal court in Brooklyn, New York freezing assets linked to Dominic Lacroix, the founder of PlexCoin whose assets were frozen when the its ICO was halted amid a fraud investigation in December 2017. Announcing the court order in a communique\nThe post SEC Obtains Another Order to Freeze Plexcoin ICO Assets appeared first on CCN	\N	https://www.ccn.com/sec-obtains-another-order-to-freeze-plexcoin-ico-assets/	2018-06-21 19:50:12+00	25
88	St Louis Fed Now Tracks Crypto Prices on Its Research Database	The St. Louis Federal Reserve Bank is now tracking the prices of four top cryptos in its economic research database, FRED.	\N	https://www.coindesk.com/st-louis-fed-now-tracks-crypto-prices-research-database/	2018-06-21 08:00:48+00	7
93	$3 Billion Blockchain Tron Kicks Off Token Migration Today	Tron, a top ten cryptocurrency, will embark on a token migration from ethereum to its new mainnet on Thursday.	\N	https://www.coindesk.com/3-billion-blockchain-tron-kicks-off-token-migration-today/	2018-06-21 19:35:34+00	62
103	ICON Token Swap Underway With 'No Issues,' Foundation Says	ICON's token migration, from ethereum to its own blockchain, is underway - and off to a smooth start, according to its Foundation.	\N	https://www.coindesk.com/icon-token-swap-underway-no-issues-foundation-says/	2018-06-22 00:00:10+00	36
106	Bloomberg: Crypto, Fiat Trading App Robinhood ‘in Talks’ to Obtain US Banking Licence	Sources report that trading app Robinhood could become the next crypto-related company to offer banking services in the U.S.	\N	https://cointelegraph.com/news/bloomberg-crypto-fiat-trading-app-robinhood-in-talks-to-obtain-us-banking-licence	2018-06-21 12:54:00+00	126
116	Under New Rules Quebec Crypto Miners Will Be Required to Bid for Electricity	Under new rules, Quebec crypto miners are required to bid for power and quantify the jobs and investment per megawatt that they will generate	\N	https://cointelegraph.com/news/under-new-rules-quebec-crypto-miners-will-be-required-to-bid-for-electricity	2018-06-21 22:34:00+00	93
120	Cointelegraph Launches Job Listings Platform for the Blockchain, Crypto Industries	Cointelegraph has launched a listings platform for jobs in the crypto and Blockchain industries at https://jobs.cointelegraph.com/	\N	https://cointelegraph.com/news/cointelegraph-launches-job-listings-platform-for-the-blockchain-crypto-industries	2018-06-21 17:21:00+00	64
131	Renowned Geopolitical Analyst Says Blockchains Will Be Decrypted [Eventually]	George Friedman has recently shared some very negative thoughts on the blockchain and its future. Regardless, he recognizes its current value. In a recent interview with CNBC, George Friedman, a worldwide known geopolitical analyst, has allegedly said the blockchain will become obsolete. During the UBS CIO Global Forum in New York, he shared, “I’ve never\nThe post Renowned Geopolitical Analyst Says Blockchains Will Be Decrypted [Eventually] appeared first on CCN	\N	https://www.ccn.com/renowned-geopolitical-analyst-says-blockchains-will-be-decrypted-eventually/	2018-06-21 18:43:36+00	29
139	Bithumb Hack ‘Doesn’t Really Change the Fundamentals of Bitcoin’: Charlie Lee	Charlie Lee, the founder of Litecoin, went on CNBC’s Fast Money program on Wednesday to discuss the recent hacking of South Korea’s cryptocurrency exchange Bithumb, among other developments in the crypto sphere. Speaking via telephone, the founder of the world’s fifth-largest cryptocurrency by market cap pointed out that while it is normal for cryptocurrency investors to\nThe post Bithumb Hack ‘Doesn’t Really Change the Fundamentals of Bitcoin’: Charlie Lee appeared first on CCN	\N	https://www.ccn.com/bithumb-hack-doesnt-really-change-the-fundamentals-of-bitcoin-charlie-lee/	2018-06-22 01:03:49+00	30
3	Bithumb $31 Million Crypto Exchange Hack: What We Know (And Don't)	Hours after an exchange breach that saw $31 million stolen from Bithumb, more details have surfaced, but some questions still remain unanswered.	\N	https://www.coindesk.com/bithumb-exchanges-31-million-hack-know-dont-know/	2018-06-20 09:10:20+00	123
12	Enigma Protocol to Integrate Smart Contracts Tech With Intel Systems	Smart contracts project Enigma will use Intel tech to help secure one of the first public blockchains utilizing privacy-preserving &quot;secret contracts.&quot;	\N	https://www.coindesk.com/intel-test-enigma-protocols-privacy-preserving-smart-contracts/	2018-06-20 16:00:33+00	60
18	Singer Akon Announces Cryptocurrency and Plans for Real-Life 'Wakanda'	Add Akon to the list of celebrities who are launching their own cryptocurrencies.	\N	https://www.coindesk.com/singer-akon-announces-cryptocurrency-plans-real-life-wakanda/	2018-06-20 14:45:47+00	157
26	Amid Crypto Bear Market, Attention Turns to Small-Time Investors	When it came to crypto, the focus was on retail investors – not only on protecting them but also on giving them a chance – during CB Insights' event.	\N	https://www.coindesk.com/amid-crypto-bear-market-attention-turns-small-time-investors/	2018-06-21 04:00:55+00	54
44	US Fourth Largest Mobile Provider Partners on Automotive Blockchain Platform	US No.4 mobile provider Sprint has partnered to develop a blockchain powered platform for the automotive industry	\N	https://cointelegraph.com/news/us-fourth-largest-mobile-provider-partners-on-automotive-blockchain-platform	2018-06-20 13:27:32+00	96
47	CEO of BBVA Bank: Blockchain ‘Is Immature and Has Major Challenges’	CEO of Spanish bank BBVA said that in its current stage of development, blockchain is an immature technology	\N	https://cointelegraph.com/news/ceo-of-bbva-bank-blockchain-is-immature-and-has-major-challenges	2018-06-20 00:26:37+00	73
54	Tether Has Enough USD to Back Tokens, Says Law Firm in Unofficial Statement	Two of Tether’s bank accounts have enough USD to back its token issuance, says a law firm founded by a former FBI director	\N	https://cointelegraph.com/news/tether-has-enough-usd-to-back-tokens-says-law-firm-in-unofficial-statement	2018-06-20 15:55:06+00	157
58	Toronto Stock Exchange to Trade New Blockchain ETF	The Toronto Stock Exchange will trade a new blockchain ETF, which will focus on blockchain infrastructure companies like Hive Blockchain Technologies Ltd. and Nvidia Corp.	\N	https://cointelegraph.com/news/toronto-stock-exchange-to-trade-new-blockchain-etf	2018-06-21 02:47:51+00	66
62	mBitCasino Adds Altcoin Support for Live Table Game Enthusiasts	This is a paid-for submitted press release. CCN does not endorse, nor is responsible for any material included below and isn’t responsible for any damages or losses connected with any products or services mentioned in the press release. CCN urges readers to conduct their own research with due diligence into the company, product or service mentioned\nThe post mBitCasino Adds Altcoin Support for Live Table Game Enthusiasts appeared first on CCN	\N	https://www.ccn.com/mbitcasino-adds-altcoin-support-for-live-table-game-enthusiasts/	2018-06-20 17:33:15+00	8
67	Reality Shares Launches World’s First China Blockchain ETF	In an effort to take advantage of China’s innovation in the cryptocurrency sphere, asset management firm Reality Shares launched the first ever blockchain ETF for the country. The company says their goal is to “democratize the world’s best investing ideas.” According to a news release on June 20th, the Reality Shares Nasdaq NexGen Economy China\nThe post Reality Shares Launches World’s First China Blockchain ETF appeared first on CCN	\N	https://www.ccn.com/reality-shares-launches-worlds-first-china-blockchain-etf/	2018-06-20 22:02:20+00	40
72	‘SWIFT is Expensive’: Major Philippine Bank Taps IBM for Japan Blockchain Remittance	The Rizal Commercial Banking Corporation (RCBC), one of the Philippines’ top 10 banks by assets, has announced an upcoming remittance payments service from Japan using blockchain technology. Speaking to reporters on Thursday, RCBC first senior vice president Manny T. Narcisco revealed that the banking giant is developing the blockchain platform to enable cheaper and faster\nThe post ‘SWIFT is Expensive’: Major Philippine Bank Taps IBM for Japan Blockchain Remittance appeared first on CCN	\N	https://www.ccn.com/swift-is-expensive-major-philippine-bank-taps-ibm-for-blockchain-remittance-to-japan/	2018-06-21 08:32:45+00	46
75	Why Coinbase’s Support for Ethereum Testnets & ERC-20 Tokens Matters	Toshi, the Ethereum-based decentralized application browser and wallet operated by Coinbase, the world’s largest cryptocurrency exchange, brokerage, and wallet platform, has added support for Ethereum testnets and custom ERC-20 tokens. Coinbase Roadmap Lsat week, upon the integration of Ethereum Classic (ETC), the Coinbase team told its users and investors that the mid-term strategy of the\nThe post Why Coinbase’s Support for Ethereum Testnets &amp; ERC-20 Tokens Matters appeared first on CCN	\N	https://www.ccn.com/why-coinbases-support-for-ethereum-testnets-erc-20-tokens-matters/	2018-06-21 01:00:48+00	33
89	Amsterdam’s Airport Helps Travelers Swap Leftover Euros for Bitcoin, Ethereum	Amsterdam’s international airport, Schipol, has installed a cryptocurrency ATM that lets passengers convert their euros into bitcoin or ethereum. In an announcement on Wednesday, the airport revealed it is assessing demand for the two most prominent cryptocurrencies among passengers over a six-month trial in an initiative that is the first of its kind in any\nThe post Amsterdam’s Airport Helps Travelers Swap Leftover Euros for Bitcoin, Ethereum appeared first on CCN	\N	https://www.ccn.com/amsterdams-airport-helps-travelers-swap-leftover-euros-for-bitcoin-ethereum/	2018-06-21 09:48:32+00	0
95	Ripple CEO Defends XRP's Utility at Fintech Conference	&quot;Let's be clear: Ripple is different than XRP,&quot; said Ripple head Brad Garlinghouse during day two of CB Insights' Future of Fintech conference.	\N	https://www.coindesk.com/brad-garlinghouse-defends-xrp-at-fintech-conference/	2018-06-21 17:00:02+00	62
112	South Korean Gov’t to Invest Over $200 Mln in Public, Private Blockchain Initiatives	South Korea’s Ministry of Science and ICT has launched a major Blockchain Technology Development Strategy that aims to raise 230 bln won (~$207 mln) by 2022	\N	https://cointelegraph.com/news/south-korean-gov-t-to-invest-over-200-mln-in-public-private-blockchain-initiatives	2018-06-21 15:34:00+00	136
123	Abundant Renewable Energy Makes Iceland a Crypto Mining Powerhouse	Few countries around the world lend themselves to cryptocurrency mining. Iceland has always been a key region in this regard. Although it was never designed to become a hub for cryptocurrency mining, this new business model has introduced a few changes in the country over the years. It is expected the number of Icelandic cryptocurrency mining operations will increase in the future. \nIceland Becomes an Unexpected Mining Hub\nCryptocurrency mining requires various key factors to be both successful and profitable. A cold climate will certainly help to cool the necessary hardware. However, it is more important to have access to cheap and abundant electricity. Iceland checks all of these boxes and more. It also explains why this European country has become of the biggest Bitcoin mining hotbeds in the world today. \nWith the Bitcoin network hashrate growing steadily over the years, it is evident the concept of mining is still popular. That is a good sign, even though setting up such operations isn’t cheap. Thanks to Iceland’s cheap renewable energy, however, recovering the initial investment can occur relatively quickly. Additionally, most existing mining operations continue to expand to accommodate more ASIC mining hardware. Generating Bitcoins becomes more competitive and difficult as time progresses. \nIceland has all of the accommodations Bitcoin mining firms need. There’s a reliable power grid,  a strong focus on renewable energy, and plenty of locations to set up shop. As long as there are both internet and electricity, setting up a mining operation can be considered worthwhile. This doesn’t just apply to mining Bitcoin either, as a fair few firms are actively mining altcoins such as Ethereum and ZCash. \nA Growing Industry Raises Concerns\nAs has been well-documented in the past, cryptocurrency mining requires a lot of electricity. That situation is no different in Iceland. In fact, some experts claim the domestic mining firms will use more electricity compared to all homes in Iceland by late 2018. It is not a positive development on paper, although it is not such a big problem in this country. \nUnlike other regions, Iceland seemingly has a limitless supply of renewable energy. There will be a time at which converting natural resources to power will no longer suffice. Until then, however, the impact on cryptocurrency mining operations will be minimal. That doesn’t mean these firms can double or triple their energy usage overnight either. \nAll of this shows cryptocurrency mining firms can transform local economies. For Iceland, it has led to the creation of a few new jobs. In other countries, it can cause additional load for a power grid which may not be capable of handling it. It is a very interesting business, but one that also comes with a few caveats. Mining will remain rather profitable in Iceland for some time to come. However, other options will need to be explored prior to depleting this European country’s energy production altogether.\n \nImage from Shutterstock\nThe post Abundant Renewable Energy Makes Iceland a Crypto Mining Powerhouse appeared first on NewsBTC.	\N	https://www.newsbtc.com/2018/06/21/iceland-quietly-became-a-cryptocurrency-mining-powerhouse-thanks-to-renewable-energy/	2018-06-21 13:00:30+00	71
127	EOS Ledger Future Support A Plus But Will Code Be Open Source?: EOS Technical Analysis (June 22, 2018)	Regardless of our EOS bullish proposals, bears are keen on driving prices lower. In the last 24 hours, EOS slid one percent and perfectly aligning itself with the general sell trend. This comes even in the back drop of Ledger Support and several EOS coin deposit and withdrawal support at BitFinex and Kraken.  If anything, we are still neutral because none of our trades-sell or buy, are live as laid out in previous trade plans.\nFrom the News\nIt’s next to perfect, news of Ledger hardware wallet support is a big plus. If you have been keeping yourself updated on the crypto verse for a while then by now you know that the only safe haven for these digital coins are offline hard wallets.\nThe logic goes that hackers cannot infiltrate a gadget that is cold, those that aren’t plugged to the internet. Ledger has tailor made solutions to meet this demand and besides, they schedule a desktop app mid next month though it wont be that open source.\n\nPlease @EOS_io community, vote for @LedgerHQ on official roadmap. https://t.co/r1JQZQIjNz#EOS\n— Kevin.P (@Shakur0o) June 21, 2018\n\nEven though Ledger mobile version will see light anytime in Q4, hawk eyed critics has it that their Desktop App won’t be open source after all. And indeed, skimming through the sentences you notice that some extracts explicitly say that some “elements of the code won’t be published” but then “that’s not because our security relies on keeping it private”. They insist that it’s the contractual elements of the companies they work with makes the whole case “legal” and “contractual”.\nEOS Technical Analysis\nWeekly Chart\nEOS Weekly Chart by Trading View\nBesides Tron, EOS remains robust in the top 10 of all the coins under our radar. Fact is, in the last week alone, it’s up three percent and this is despite all the negative media that has been under their case since after launching. However, that’s not the whole point. The thing is: will we see a recovery? Well, not likely.\nIn the weekly chart for example, it’s likely that last week’s bears will spill over and continue to push prices towards EOS minor support at $9. There are hints of that happening. See this long upper wick? That signal bear pressure and as long as market participation and bull volumes wane, the consequent on price is always negative. After all, like we have mentioned several, events of May and June because of these consistently low volumes overwhelmed by April ultra high volumes averaging 100 million means we are witnessing a long covering. It’s an effort versus result scenario panning out in my view.\nThen again, if we past a Fibonacci tool between April high lows then we notice that possible region of support is around $7 at the 78.6 percent level. So, odds of further depreciation if we compare recent trends and resistance to upsides mean there is more room for down side. Anyway, $7 is our bear support as per our previous trade plans.\nDaily Chart\nEOS Daily Chart by Trading View\nHere, our trade range can’t be clearer. As it is, prices are moving within June 14 high lows and as long as our buy and sell triggers at $13 and $9 are not tested, we remain neutral. However, take note that the longer the consolidation, the stronger the break out will be. As such, rather than guessing, taking a neutral stand even with bullish proposals is safer.\nDisclaimer: This is an opinion piece and views/opinions expressed are those of the Author. Do your Due Diligence before making an investment decision.\n \nThe post EOS Ledger Future Support A Plus But Will Code Be Open Source?: EOS Technical Analysis (June 22, 2018) appeared first on NewsBTC.	\N	https://www.newsbtc.com/2018/06/22/eos-technical-analysis-june-22-2018/	2018-06-22 00:04:13+00	17
145	Arbitao is Bringing the New Trading Revolution	This is a sponsored story. CCN urges readers to conduct their own research with due diligence into the company, product or service mentioned in the content below. Ever since Bitcoin started the cryptocurrency wave, many people have wondered about this mystical goldmine. We’ve all heard stories about people who became millionaires — or even billionaires,\nThe post Arbitao is Bringing the New Trading Revolution appeared first on CCN	\N	https://www.ccn.com/arbitao-is-bringing-the-new-trading-revolution/	2018-06-21 20:31:49+00	8
90	Litecoin Futures are a Go on UK Crypto Exchange	Litecoin (LTC) derivatives are a go in the UK. Trading platform Crypto Facilities announced that as of Friday, June 22, their new dollar-denominated service will allow investors to trade in futures contracts which have Litecoin as the underpinning collateral, with weekly, monthly and quarterly maturities.\nLitecoin Futures Ready to Go in the UK\nThe announcement comes only a month after the UK based platform launched Ethereum based contracts, increasing the number of crypto-based products already on offer for investors to long or go short including Bitcoin and the Ripple token XRP.\nLitecoin creator Charlie Lee commented on the move, saying,\n“Litecoin futures will open up LTC trading to more institutional investors. This will add to the liquidity of Litecoin and make it easier for people to get in and out of Litecoin.”\nTimo Schlaefer, CEO of Crypto Facilities, said:\n“We are excited to be launching futures on Litecoin, one of the most widely traded cryptocurrencies. There has been strong client demand for this product and we believe our LTC-Dollar futures contracts will increase price transparency, liquidity, and efficiency in the cryptocurrency markets. As digital assets continue to mature, we expect to see a greater number of institutional investors entering the marketplace.”\nCrypto Facilities reported to an unnamed source that the firm is expecting the trading volume of its Ethereum futures contracts to reach around $150 million in this quarter, accounting for around 10 percent of the platform’s total. The move may have been responsible for a small spike in the price of Litecoin pushing it up near $100 earlier this morning but it quickly dropped off and settled on $97.80 at the time of writing according to livecoinwatch.com.\nSEC Clarity may Include Litecoin\nThe announcement from Crypto Facilities comes only a week after the US Securities Exchange Commission head William Hinman made the public statement that neither Bitcoin nor Ethereum would be considered as a security according to the federal regulatory body.  President Concannon of CBoE global markets said the announcement “clears a key stumbling block for Ether futures”. The CBoE and CME have been trading Bitcoin futures since 2017 and have been eager to do the same with Ether.\nThis may be good news for Litecoin as well, as it operates under the same business model as Bitcoin. The news was not as good for Ripple (XRP), as the same statement that exonerated Bitcoin and Ethereum seemed to indicate Ripple’s token may end up being classified as a security. Ripple spokesman Tom Channick made a solid effort to put a positive spin on the announcement with an emailed statement that read in part. “We are pleased that the SEC has announced that it does not view Ether as a security. We believe that XRP likewise should not be classified as a security and look forward to confirmation from the SEC.”\nImage from Shutterstock\nThe post Litecoin Futures are a Go on UK Crypto Exchange appeared first on NewsBTC.	\N	https://www.newsbtc.com/2018/06/21/litecoin-futures-go-uk-crypto-exchange/	2018-06-21 10:00:47+00	0
91	Spain: BBVA Bank and Energy Co. Repsol Partner to Develop Blockchain Financial Solutions	Spanish banking giant BBVA and energy company Repsol partner to develop blockchain-based financial solutions for corporate banking	\N	https://cointelegraph.com/news/spain-bbva-bank-and-energy-co-repsol-partner-to-develop-blockchain-financial-solutions	2018-06-21 09:00:07+00	0
96	Bithumb Working With Other Crypto Exchanges to Recover Hacked Funds	South Korea's Bithumb cryptocurrency exchange said Thursday that it may be able to reduce the losses arising from a major hack earlier this week.	\N	https://www.coindesk.com/bithumb-working-with-other-crypto-exchanges-to-recover-hacked-funds/	2018-06-21 13:46:17+00	51
111	US: Members of Congress Must Disclose Crypto Holdings Above $1,000	The Ethics Committee of the U.S. House of Representatives has issued a memo requiring all House Members to disclose crypto holdings worth over $1,000	\N	https://cointelegraph.com/news/us-members-of-congress-must-disclose-crypto-holdings-above-1-000	2018-06-21 16:17:00+00	101
129	Here’s How Bitcoin is the Least Volatile Crypto Asset	Bitcoin is less volatile than its cryptocurrency cousins, according to research that looked at five crypto assets from 2013.\nBitcoin Trumps the Rest\nIn February, the American Institute for Economic Research (AIER) compared the volatility of Bitcoin to traditional fiat currencies. It found that the average daily price change of Bitcoin with the U.S. dollar exchange rate against the pound, the euro, the yen, and gold was six times higher than the aforementioned fiat currencies and gold between 2016-2017.\nAt the time, the authors of the research wrote:\n“A medium of exchange that is stable in value and highly liquid, so someone can trade it in a pinch without taking a hit, allows us to better deal with uncertainty and helps us plan and coordinate into the future. Assets that are too volatile are therefore undesirable as currencies.”\nNow, over four months later, the AIER has said that Bitcoin is less volatile compared to Ethereum, Ripple, Bitcoin Cash, and Litecoin. The independent voice for sound economics looked at data from CoinMarketCap from 28th April 2013 until 4th June, 2018.\n“While all five cryptocurrencies we study are still quite new, measures of volatility, and changes in those measures over time, are important in assessing their potential future viability as money,” said Max Gulker, PhD, who penned the AIER article.\nAccording to the research, Bitcoin reached its lowest average daily price movement in 2016, at two percent. It then rose to levels not seen since 2013 when it increased to the four percent mark. Compared to Bitcoin, though, the other cryptocurrencies show a much more volatile start when trading began.\nFor instance, Ethereum’s average daily price movement was roughly four percent higher than Bitcoin’s in 2015. In 2017, this had dropped to around one percent, partly due to an uptick in Bitcoin’s average daily price movement. Notably, though, it wasn’t until the first part of 2018 when the five cryptocurrencies were close together.\nIs Bitcoin a Stable Cryptocurrency?\nThe research also looked at the number of days per year each crypto asset saw a price change of 10 percent.\nOf the five, Bitcoin Cash averaged more than one day per week with a change greater than 10 percent. This is compared to Bitcoin, which recorded less than 20 days since 2013. Granted Bitcoin Cash has only been around for less than a year, which could be a factor playing against it.\nHowever, compared to the others, Bitcoin is seen as more of a stable currency with less wild price swings. But, as Gulker notes, this could change over time. Notably, though, not even hacks such as the recent Bithumb crypto exchange theft could keep Bitcoin’s price down for long.\nFeatured image from Shutterstock.\nThe post Here’s How Bitcoin is the Least Volatile Crypto Asset appeared first on NewsBTC.	\N	https://www.newsbtc.com/2018/06/21/experts-show-how-bitcoin-is-the-least-volatile-crypto-asset/	2018-06-21 18:00:24+00	21
149	Top 5 Blockchain Use Cases You Need to Know	Blockchain Technology is not only impacting the financial world but several other industries too. It has become the solution to several real issues that the world is facing. \nThe Blockchain Use Cases have shown that a system can be trusted and transparent without being interfered.\nIf you run a company with issues of legality or supply chain, Blockchain has an answer.\nHere are 5 Financial and Non-Financial Blockchain Use Cases which will prep you for what solutions Blockchain is capable of-\nInsurance Industry\nA smart contract is defined as a digital legal binding document which helps secure relationships between buyers and sellers or any two parties. \nSometimes the legalities can get very confusing leading to mistrust, high costs and delays in processing between the two parties. \nOne example of where Smart contracts are beneficial is in the Insurance industry. \nInsurance policies tend to take weeks and months for full payment to the insurance holder. The reasons are mostly due to the manual processing and comprehensive documentation involved. Costs too tend to become high due to the substantial administrative costs.\nHowever thanks to smart contracts, insurance policies have become automated. Conditions and terms are input into the smart contract, and whenever they are triggered the claims are processed immediately.\nAll the conditions, for example, the weather in case of a natural disaster are tracked using Blockchain. The payments are almost immediate with much lower administrative costs which can be the saving grace of a person’s life during natural calamities.\nInternational Trade\nGlobalization has helped the world we live in by buying products which we usually don’t grow or manufacture in our home country. However, globalization has increased tremendously over the years leading to frauds, human errors in the documentation, delays and unnecessary costs.\nBlockchain’s technology which is based on an open distributed ledger that records transactions between two parties managed by a peer to peer network can facilitate document handling in International Trade. \nIn this scenario, too smart contracts are actively involved in helping draft contract between the buyer (exporter) and seller (importer) whereby both the buyers and sellers fulfill specifically agreed clauses. This trust is built upon even if the two parties don’t know each other well. \nThe need for mediators cuts down drastically, and hence costs fall.  Blockchain helps the whole communication make more sense and be in real time leading to an efficient international trading process. \nThe single Blockchain has the necessary information in one document which updates and verified by all members of the transaction. Hence no unnecessary blocking of funds as capital is transferred quickly.\nThe first commercial trade finance transaction was done between HSBC and Dutch lender ING. A bulk shipment of soybeans was shipped from Argentina to Malaysia and using Blockchain made the process of the letter of credit much faster and efficient. The exchange was said to be done within 24 hours compared to the usual 5 to 10 days.\nPayments\nBlockchain’s most popular by-product is cryptocurrencies. Legal in some countries, not legal in a few and still pending on a proper decision by many, cryptocurrencies has become the talk of all the towns. \nWhat cannot be denied is the speed of transacting cryptocurrencies between two different people’s wallet. It is as quick as lightning. \nIt is no wonder that Ripple’s technology is being implemented in several banks to send money across the border in matters of seconds.\nIf payment had to be made to another country, it would take a minimum of 3 to 5 days when using the SWIFT method while Paypal usually takes 2 working days. Cryptocurrencies have the advantage of moving in a matter of seconds, to the most popular which is Bitcoin transferring in a few hours. Lightning network technology is bound to scale up Bitcoin to the speed it once was.\nThe transaction costs are also far cheaper when using cryptocurrencies to move funds, with SWIFT and other banking methods taking quite a percentage for transferring.\nLogistics and Supply Chain\nWith an ever-increasing population, tracking goods has become difficult for most of the individuals and companies. As a result Blockchain supply chain innovations deliver in bringing a transparent system with several advantages.\nWith a transparent system, tracking of the item can be done in real time which helps buyers know where the items are currently and the supplier has ensured that the good is on the way safely. It helps build a better trust system, without the need for continuous customer care responses which may take time to provide feedback or answer.\nThe credibility of the supplier is improved drastically along with better confidence from the buyer. Blockchain even lets high valued goods such as diamonds be tracked to ensure safety and no fraud takes place. \nThe number of intermediaries in a supply chain is beyond countable and hence with a more transparent and decentralized system middlemen are cut. Thus loads of costs are reduced which impacts in creating a higher demand from the buyers.\nKerala, a beautiful Indian state is exploring Blockchain technology for the supply of fast spoiling items such as Milk, Fish, and Vegetables. With the help of Blockchain, they can be monitored carefully when being transported from the beginning stage of procuring to the final stage of selling in retail shops.\nHealthcare\nBlockchain is rapidly changing the way the incompetent healthcare industry operates. A clinic or hospital has many records which are not being stored using Blockchain. Thus security is maintained in keeping these private medical files safe for the future. One example is MedRec, which helps maintain medical records throughout all healthcare providers. Patients keep moving from one healthcare provider to another, and thus data is saved through Blockchain to be accessed by any of the healthcare providers.\nBlockchain integrated with Artificial Intelligence has also helped ensure that people who don’t have medical access can speak to a doctor and gain some insights on their health concerns. Docadamic, for example, helps connect patients to doctors. There is even a token called MTC which powers Docadamic’s payment process for prepayments in case of emergencies. \nAnother great idea was proposed by Linnia’s founder Diego Espinosa who is developing a Blockchain centered system where health data is collected and shared with authorized people. Individual health records will be allowed to be viewed only by a select few, depending on what documents they are.\nThe 5 use cases above showcase the variety of industries Blockchain is improving. Blockchain technology is proving to be one of the most useful innovations.\nImage Source: “Flickr”\nThe post Top 5 Blockchain Use Cases You Need to Know appeared first on Toshi Times.	\N	https://toshitimes.com/top-5-blockchain-use-cases-you-need-to-know/	2018-06-21 11:09:14+00	21
94	Bitcoin Just Got a Shoutout in a New US Supreme Court Opinion	That's not something you see every day: an opinion from the U.S. Supreme Court that makes a reference to cryptocurrencies.	\N	https://www.coindesk.com/bitcoin-gets-shoutout-us-supreme-court-opinion/	2018-06-21 15:13:22+00	154
104	Cheetah's New App Lets Crypto Investors Track Portfolios on the Go	Beijing-based app developer Cheetah Mobile is releasing an app that lets investors monitor cryptocurrency portfolios over multiple platforms.	\N	https://www.coindesk.com/cheetahs-new-app-lets-crypto-investors-track-portfolios-on-the-go/	2018-06-21 12:00:20+00	110
105	Bobby Lee, ‘BTC Maximalist’: Bitcoin’s Value Is in the Eye of the Beholder	Co-founder of now-closed Chinese crypto exchange BTCC, Bobby Lee, speaks to Cointelegraph about what he plans to do on his “gap year”	\N	https://cointelegraph.com/news/bobby-lee-btc-maximalist-bitcoin-s-value-is-in-the-eye-of-the-beholder	2018-06-21 13:42:00+00	113
114	Federal Reserve Bank of St. Louis Adds Crypto Price Tracking to Research Database	The St. Louis Fed has added price tracking of four cryptocurrencies to their research database	\N	https://cointelegraph.com/news/federal-reserve-bank-of-st-louis-adds-crypto-price-tracking-to-research-database	2018-06-21 19:09:00+00	100
121	Crypto Mining Mogul Hits the Big-time with Portable Mining Containers	Serial crypto entrepreneur Valery Vavilov of Bitfury has struck gold again with his latest venture by solving two of the main hurdles in mining cryptocurrency with some big black boxes.\nBitfury Founder makes Crypto Mining Operations Portable\nThe BlackBoxes which are sea containers that have been converted into giant, portable mining rigs hold one hundred thousand of Bitfury’s signature microchips and are able to mine an average of fifteen tokens per month. Even at a million USD per unit 100 have sold in the last year and a half, beefing up the companies revenue for the previous 12 month period to $450 million in cash and crypto.\nVavilov along with co-founder Valery Nebesny, who started by designing an energy saving chip in the kitchen of their rented Amsterdam flat, examined the two most serious problems affecting crypto mining operations, electricity cost and government indecision on how to treat the nascent industry and came up with an obvious solution. Make the mining centers portable.\nVavilov spoke to Bloomberg about his BlackBoxes from Ukraine, one of the 16 countries in which his 500 employees are spread out, saying: “We realized our data centers needed to be mobile, to be both somewhere and anywhere,”\nThe company which says it expects it’s BlackBox sales to double this year also sells millions of its BitFury chips to third-party customers. Vavilov estimates that their microchips chips, which are made in Taiwan, account for as much as 15% of all Bitcoins mined, with 25% of that coming from the company’s own operations in Iceland, Norway, Canada, and Georgia.\nBlockchain will be Worth Trillions\nBitcoin makes up only about 50% of the major cryptocurrency market, including Ethereum and Ripple. Following the dominant force in cryptocurrency mining, China’s Bitmain, Vavilov has plans to roll out hardware capable of mining these and other altcoins in the near future.\nBitfury is involved in mining, sales, and manufacturing but for Vavilov, the real motivation is the potential of blockchain technology. He considers the technology as important as the development of the internet itself and says its future is worth trillions. He was quoted in Bloomberg saying:\n“Imagine—some $300 billion of crypto wealth has already made its way into the hands of totally different, non-establishment people,” he said. “Most of these people, like me, aren’t interested in private jets or yachts, they truly want to change the world. Given how much wealth is in their hands now, I expect to see a lot of good new things in the next few years—in finance, health care, education—everywhere.”\nVavilov and BitFury have won over investors including Silicon Valley legend Bill Tai, Google Maps co-founder Lars Rasmussen, and Moscow-based iTech Capital’s Gleb Davidyuk. The company’s software includes products such as Exonum, which “anchors” databases in Bitcoin’s blockchain and Crystal, which “de-anonymizes” suspicious transactions. Bitfury also co-owns Hut 8, a mining venture based in Canada, and Emercoin, another kind of virtual money.\n \nImage from Shutterstock\nThe post Crypto Mining Mogul Hits the Big-time with Portable Mining Containers appeared first on NewsBTC.	\N	https://www.newsbtc.com/2018/06/21/portable-mining-operations-bring-another-fortune-bitfury-founders/	2018-06-21 12:00:59+00	18
126	Fundstrat Analyst Believes Rebound off $6,000 Is An “Oversold Bounce”	The cryptocurrency market is in a weird place, with Bitcoin finding stability at approximately $6,600 over the past few days. However, many crypto analysts and personalities, like Tom Lee, managing partner at Fundstrat Global Advisors, believe that this could change on a dime.\n‘Dead Cat Bounce’ Or Something More?\nEarlier this month, Bitcoin revisited the $6,000 price level seen in early February, finding price support. It was important that Bitcoin held the bottom at $6,000, as it has become a key psychological and technical support level for the world’s most popular cryptocurrency.\nRobert Sluymer, technical analyst head at Fundstrat, wrote to MarketWatch and indicated his sentiment on the cryptocurrency market, drawing out key price points for Bitcoin and Ethereum.  \nHe said:\n“BTC and ETH are again at important technical inflection points and need to push above their downtrends near BTC 7,000 and ETH 550 to signal the recent bounce is anything more than an oversold bounce back to resistance within a downtrend that began in early May.”\n$7,000 has long been held as a key price level for Bitcoin, with some believing that a push beyond this point will signal the next bull market. \nHowever, with this comment, Robert made an interesting point, stating that Bitcoin needs to break through $7,000 to show that the recent bounce off $6,000 is more than just a ‘dead cat bounce.’\nFor those who are unaware, a ‘dead cat bounce’ is when a publicly traded asset rapidly recovers and drops further after a sharp decline in price. If Bitcoin manages to break and hold over the aforementioned price level, Sluymer believes that there could be bullish times ahead for the cryptocurrency market. \nSluymer’s Co-Worker, Tom Lee Holds Bullish Opinion\nEarlier in June, Sluymer went on CNBC’s ‘Futures Now’ segment to state that Bitcoin was beginning to bottom at the ‘key support around $7,000.’ He also noted that short sellers should be ‘reducing their short exposure,’ while ‘adding long exposure.’\nSince then, Bitcoin has continued downwards, potentially causing a slight sentiment shift for Sluymer. The Fundstrat analyst also further recognized that a short-term pullback is likely as the 4-hour RSI (relative strength index) reaches overbought levels. \nFor once, Sluymer’s sentiment is beginning to slightly diverge with Lee’s, head of research and strategy at Fundstrat Global Advisors. If you ask community members about Bitcoin’s biggest bull, many will say it is Lee. \nThe managing partner has become well-known for his timely appearances on the CNBC segments, which cover cryptocurrencies, continually underscoring his $25,000 price prediction for Bitcoin. Despite continual price action to the downside, Lee’s imperishable sentiment remains. \nTom Lee continually stated that Bitcoin will find price support around the cost-to-mine levels, with Lee estimating that these levels average out at approximately $6,500. Other than the three days of levels below $6,500, Bitcoin has done well to find support at the levels which Lee has highlighted.\nFeatured image from Shutterstock.\nThe post Fundstrat Analyst Believes Rebound off $6,000 Is An “Oversold Bounce” appeared first on NewsBTC.	\N	https://www.newsbtc.com/2018/06/21/fundstrat-analyst-believes-rebound-off-6000-is-an-oversold-bounce/	2018-06-21 20:00:07+00	13
136	Trade Crypto to Win a Tesla? BitMart Announces Their New Lucky Draw Trading Event	This is a paid-for submitted press release. CCN does not endorse, nor is responsible for any material included below and isn’t responsible for any damages or losses connected with any products or services mentioned in the press release. CCN urges readers to conduct their own research with due diligence into the company, product or service mentioned\nThe post Trade Crypto to Win a Tesla? BitMart Announces Their New Lucky Draw Trading Event appeared first on CCN	\N	https://www.ccn.com/trade-crypto-to-win-a-tesla-bitmart-announces-their-new-lucky-draw-trading-event/	2018-06-21 18:13:32+00	13
144	Ethereum Classic Price Defies Bear Market in Single-Day Rally	The ethereum classic price continued its inexorable rise on Thursday afternoon as it reached $17.71 on cryptocurrency exchange Binance — a single-day increase of 7%. There could be several factors which are affecting this price movement. The principal one is the listing on Coinbase, which was something of a surprise when it beat other contenders\nThe post Ethereum Classic Price Defies Bear Market in Single-Day Rally appeared first on CCN	\N	https://www.ccn.com/ethereum-classic-price-defies-bear-market-in-single-day-rally/	2018-06-21 23:59:10+00	20
146	ICOs Are Taking Advantage of Retail Investors, Claims Nasdaq CEO	Investment into the budding cryptocurrency industry through ICOs has already brought in around $5.5 billion this year and has almost surpassed the ICO investment throughout the whole of 2017. Retail investors have been responsible for the majority of it, as an ever-increasing number of them are scouting the ICO lists and trying to discover the next big thing on the crypto sphere.\nHowever, Adena Friedman, the CEO of global stock exchange operator Nasdaq, warned potential investors that crypto entrepreneurs are taking advantage of them. Speaking at the Future on Fintech conference held in New York, Friedman said the reasons behind this are lack of accessible information as well as absence of universal regulation and transparency.\nMs. Friedman criticized ICO aficionados, saying that, “To make it no rules at all, when companies can just willy-nilly take people’s money and offer no information at all, with no governance, that sounds to me like you’re taking advantage of people.“\nAccording to the Nasdaq chief, inexperienced investors are usually the ones falling prey to the hype surrounding crypto projects. While IPOs (initial public offerings, the equivalent of ICOs in traditional investing) are subject to lengthy disclosure requirements by the Securities and Exchange Commission (SEC), the ICO process is still barely regulated, which is a big concern for Ms. Friedman.\nShe went on to claim that, “In ICO space none of that is available, and it’s all being bought by retail. I have real concern on lack of transparency, oversight, and accountability that these companies have as they’re going out to raise capital through an ICO.“\nWhile being critical on ICOs, Friedman remains positive on virtual currencies, as she has recently claimed cryptocurrencies are the “right next step” in the development of currency. She has also previously claimed that Nasdaq would be open to launching a crypto exchange at some point in the future, although the crypto market would have to be far more mature than it is now.\nThe crypto world has been at odds over the last few weeks, as the debate whether digital assets should be considered as securities have been widely publicized. While the two biggest cryptocurrencies, bitcoin and ethereum, have been officially declared not to be securities, the jury is still out for the rest of virtual currencies and ICOs.\nFriedman concluded by agreeing with the SEC, saying that, “I sympathize with SEC saying these are really securities offerings. I support the SEC on that.“\nImage Source: “Flickr”\nThe post ICOs Are Taking Advantage of Retail Investors, Claims Nasdaq CEO appeared first on Toshi Times.	\N	https://toshitimes.com/icos-are-taking-advantage-of-retail-investors-claims-nasdaq-ceo/	2018-06-21 12:50:22+00	0
97	This $575 Million ICO With Royal Backing Is So Crazy, It Might Be Real	A video-on-demand service that shares ad revenues with viewers and creators has raised more than half a billion bucks in a private token sale.	\N	https://www.coindesk.com/575-million-ico-royal-backing-crazy-might-real/	2018-06-21 11:00:34+00	308
113	Swiss Federal Councillor: Blockchain Will ‘Penetrate Our Entire Economy’	A member of the Swiss collective head of state thinks that blockchain will entirely penetrate the Swiss economy, but regulation is also needed	\N	https://cointelegraph.com/news/swiss-federal-councillor-blockchain-will-penetrate-our-entire-economy	2018-06-21 18:55:00+00	134
124	HIVE Blockchain Aims to Become the Backbone of a Decentralized World	Cryptocurrency mining is an integral part of the ecosystem. Without mining, most currencies would not be able to have network transactions confirmed in a secure manner. HIVE Blockchain is one of the companies keeping fingers in many different pies. There’s a lot more to cryptocurrency than just Bitcoin.\nThe Story of HIVE Blockchain\nMost people in the world of cloud mining have come across a company called Genesis Mining. The company has over 1 million customers and primarily focuses on mining some of the top cryptocurrencies. Being one of the market leaders is only part of the company’s plan in this regard. Their partnership with Foire Group to launch HIVE Blockchain a year ago has shaken things up considerably.\nUnlike what one might expect, HIVE Blockchain isn’t just about cloud mining. This relatively new venture is a blockchain infrastructure company. More importantly, it is also a publicly traded entity on the TSX Venture Exchange. It’s a good example of how cryptocurrency and all of its aspects are slowly being embraced by the mainstream. \nAmong the currencies being mined by this company are ZCash, Ethereum, Bitcoin, and a few others. Expanding the reach of this somewhat niche market to more traditional investors has been quite challenging. Investors can gain exposure to cryptocurrencies by directly contributing to the mining process of specific currencies. It is also one of the only ways of directly investing in proven blockchain technology. \nShaping the Future of Blockchain\nWhile everything has seemingly fallen into place the company, there’s no time to stand still. Mounting comments regarding crypto mining’s electricity usage can also affect HIVE Blockchain. For the company, no immediate concerns are raised, although the team confirms not all mining operations are equal. HIVE CEO Harry Pokrandt commented in a recent interview:\n“There are certainly a lot of reports highlighting energy consumption. But, we believe it’s extremely important to understand that not all mining is created equal. China, for example, is the largest country for cryptocurrency mining. However, they are also the largest consumer of coal-powered energy in the world. We believe there needs to be a distinct line drawn between mining companies operating their facilities on clean energy and those who are not. At HIVE, we are proudly powered by 100% clean energy at both of our locations.”\nFor the foreseeable future, HIVE is confident blockchain will continue to make inroads. Whether it is in finance or a completely different sector, numerous opportunities are abound. HIVE Blockchain wants to become the backbone of this decentralized world, but hey will face competition in doing so. At the same time, fair competition can only mean accelerated innovation and a better ecosystem for consumers all over the world.\n \nImage from Shutterstock\nThe post HIVE Blockchain Aims to Become the Backbone of a Decentralized World appeared first on NewsBTC.	\N	https://www.newsbtc.com/2018/06/21/hive-blockchain-remains-confident-crypto-technology-will-disrupt-many-industries/	2018-06-21 11:00:55+00	14
125	UK Regulators Question Exchanges as Bithumb News Spreads	The recent $30 Million hack of Bithumb has caused U.K. regulators to question the security of cryptocurrency exchanges, with exchanges operating in the U.K. coming under fire.\n2018: The Year of Exchange Hacks?\nAs the cryptocurrency market swells, the amount of exchange hacks has grown, in a direct correlation with the growth of active exchanges. The fears of an exchange hack have become increasingly likely, with exchanges like CoinCheck and Bithumb announcing lost funds earlier this year.\nBrian Kelly, the foremost cryptocurrency analyst on CNBC, mentioned exchange fears on-air, stating:\n“We’ve had quite a few hacks this year. This highlights the fact that exchanges are kinda the weak point here.”\nFurther mentioning that ‘cold storage is always best,’ Kelly’s opinion about cold storage is in line with others in the industry, as experts continually tell consumers to keep their holdings in cold storage.\nThe hack of Coincheck, in early 2018, clearly attests to the power of cold storage security methods.\nCoinCheck, a large Japanese exchange, revealed that over $550 million of NEM (XEM) was stolen from the exchange’s hot wallet. As the situation unraveled, users noted that the hack could have easily been avoided if CoinCheck diligently put funds into cold storage.\nAlthough CoinCheck eventually reimbursed customers, it did not reverse the fears which were implanted in the mind of regulators worldwide.\nA representative of CryptoUK, a group of exchanges operating in the U.K., addressed these fears while making a statement to members of the British parliament, reports The Telegraph.\nCryptoUK was founded in February, with the goal of bolstering standards for cryptocurrency-related companies. As cryptocurrencies began to reach the mainstream, onlookers on the industry thought that tough regulation is a must.\nHowever, CryptoUK took a different approach, creating a collective group of like-minded companies and individuals willing to self-regulate.\nCryptocurrency Exchange Security Debate Rages On\nCryptoUK noted that exchanges part of the association had at a minimum of 90% of all consumer cryptocurrencies held in cold storage. For the uninitiated, cryptocurrency cold storage is nearly impenetrable to traditional methods of hacking, as private keys are stored offline.\nTheoretically, the only way for a user to hack an exchange’s cold storage wallet would be to physically steal the keys from an exchange’s office. This added layer of security mitigates almost all risk of lost funds. Some have joked that there is a higher chance for a user to misplace cold storage keys than for hackers to get their hands on a private key.\nIqbal Gandham, chairman of CryptoUK, said that security for cryptocurrency exchanges ‘are improving,’ noting how secure cold storage has become. However, Gandham noted that regulatory uncertainty may have led for U.K-based banks to turn away cryptocurrency clients. With this lack of acceptance generating a higher-risk environment for U.K. consumers willing to get their hands on cryptocurrencies, Iqbal said:\n“99.9pc [of exchanges] have bank accounts in far-flung jurisdictions, and U.K. consumers are sending their money to high-risk jurisdictions.”\nIf regulation fears subside, banks may begin to re-accept exchanges as clients, providing a ‘healthly’ level of regulation for these exchanges.\nFeatured image from Shutterstock.\nThe post UK Regulators Question Exchanges as Bithumb News Spreads appeared first on NewsBTC.	\N	https://www.newsbtc.com/2018/06/21/u-k-regulators-question-exchanges-as-bithumb-news-spreads/	2018-06-21 21:30:42+00	23
135	NGO Blockchain Pluto Coin to Help Refugees and Hungry Children	This is a paid-for submitted press release. CCN does not endorse, nor is responsible for any material included below and isn’t responsible for any damages or losses connected with any products or services mentioned in the press release. CCN urges readers to conduct their own research with due diligence into the company, product or service mentioned\nThe post NGO Blockchain Pluto Coin to Help Refugees and Hungry Children appeared first on CCN	\N	https://www.ccn.com/ngo-blockchain-pluto-coin-to-help-refugees-and-hungry-children/	2018-06-21 18:27:29+00	8
143	Exclusive: Researchers Allege Tron Plagiarized Code from other Crypto Projects	Researchers from Digital Asset Research (DAR) have discovered multiple instances of code copied from other projects in the Tron codebase. It seems that Tron developers plagiarised code from Ethereum among other projects and changed filenames to make it difficult to identify the source of the code. DAR published an article on Medium about the plagiarism\nThe post Exclusive: Researchers Allege Tron Plagiarized Code from other Crypto Projects appeared first on CCN	\N	https://www.ccn.com/exclusive-blockchain-researchers-allege-tron-copied-code-without-attribution/	2018-06-21 23:12:00+00	34
148	Charles Hoskinson Says Crypto Nay-Sayers Overlook Impending Multi-Trillion Dollar Wall Street Entry	The CEO of IOHK, Charles Hoskinson, has made some waves with a recent tweet. In it, Hoskinson argues that observers of the cryptocurrency industry seem to disregard the possibility of institutional investors entering the sector following the ”next wave of regulation”.\n\nWhat's often missed by the cryptocurrency is going to die broken record media is that after the next wave of regulation, wall street is showing up to the party with all their locked up capital. That's tens of trillions of dollars entering the space eventually. Future is bright\n— Charles Hoskinson (@IOHK_Charles) June 21, 2018\n\nIn a tweet published today, June 21, Hoskinson wrote how the ”broken record” media’s claims that ”cryptocurrency is going to die” often ignore the looming possibility of a Wall Street entry into the cryptocurrency sector, following more extensive regulation.\nMoreover, Hoskinson pointed out that this would entail trillions of dollars entering the cryptocurrency sector. It is true that such an entry could very well involve massive sums of money, and Hoskinson also made a valid point in that proper regulation would be a prerequisite for large-scale institutional investors to enter the cryptocurrency industry properly.\nWhat’s more, it is also true that Wall Street would seem to be gearing up towards an entry into the cryptocurrency market. A mere month ago, the Consensus 2018 conference was held in New York, and it was reported that ”every Wall Street bank was in attendance”.\nFurthermore, it has been widely reported that Morgan Stanley is accelerating its efforts to become the first major Wall Street firm to trade cryptocurrency. Goldman Sachs has also recently opened a Bitcoin trading desk, in the light of which Hoskinson’s tweet seems like a foregone conclusion.\nHowever, one should also note that Hoskinson is a notorious cryptocurrency bull, which makes it possible that he is being overly optimistic. Nonetheless, Hoskinson also wields a substantial amount of influence in the cryptocurrency community, and his prediction should therefore arguably carry more weight than any run-of-the-mill cryptocurrency enthusiast.\nHoskinson is a seasoned cryptocurrency executive and is perhaps most well-known as being one of the founding members of Ethereum. Nevertheless, Hoskinson left Ethereum in 2014, following creative differences between himself and Vitalik Buterin. \nThe key reason for Hoskinson’s departure was that he wanted to restructure the Ethereum project, create a for-profit entity with a more traditional governing structure, and accept an influx of venture capital. Buterin, on the other hand, was adamant that Ethereum should remain a non-profit with a decentralized governance structure. \nFollowing his exit from Ethereum, Hoskinson was eventually approached by one of his former colleagues with a proposal to create a new initiative dubbed Input Output Hong Kong – IOHK – that would develop blockchains for corporations, academic institutions, and government entities. \nFast forward to today, and IOHK is now a household name in the cryptocurrency industry. The Cardano blockchain and the ADA cryptocurrency, both IOHK projects, have garnered significant attention, and ADA is currently the eight largest cryptocurrency in the world. \nIt would, therefore, seem as if Hoskinson has some understanding as to how the market works and what businesses are looking for in relation to cryptocurrency. Although it is impossible to predict the future, it does seem as if Hoskinson’s tweet does line up with some of the recent developments in the industry.\nImage SourcE: “Flickr”\nThe post Charles Hoskinson Says Crypto Nay-Sayers Overlook Impending Multi-Trillion Dollar Wall Street Entry appeared first on Toshi Times.	\N	https://toshitimes.com/charles-hoskinson-says-crypto-nay-sayers-overlook-impending-multi-trillion-dollar-wall-street-entry/	2018-06-21 17:31:12+00	5
98	New Resistance Could Cap Bitcoin's Upside Price Potential	Bitcoin's bulls are struggling to force a rally, despite a still-favorable short-term set-up on the technical charts.	\N	https://www.coindesk.com/6800-ceiling-new-resistance-capping-bitcoins-corrective-rally/	2018-06-21 10:01:00+00	98
110	Bloomberg Terminal Lists Crypto Market Index From World’s Third Largest Exchange Huobi	Financial monitoring service Bloomberg Terminal will now be listing the Huobi 10 Cryptocurrency Index, as well as 9 crypto trading pairs	\N	https://cointelegraph.com/news/bloomberg-terminal-lists-crypto-market-index-from-world-s-third-largest-exchange-huobi	2018-06-21 17:09:00+00	109
130	Bitcoin Makes Historic First Appearance in US Supreme Court Opinion	Thursday marked a historic day for bitcoin, as the flagship cryptocurrency made its first appearance in an opinion published by the US Supreme Court. The case, Wisconsin Central Ltd. v. United States, did not involve bitcoin’s regulatory or legal status. Rather, it examined whether employee stock options represent taxable compensation under the Railroad Retirement Tax\nThe post Bitcoin Makes Historic First Appearance in US Supreme Court Opinion appeared first on CCN	\N	https://www.ccn.com/bitcoin-makes-historic-first-appearance-in-us-supreme-court-opinion/	2018-06-21 16:39:03+00	93
138	Giving Users a Chance to Earn What They Deserve: Introducing ICST, a Blockchain Based Ecosystem for Personal Contents and Skill Sharing	This is a paid-for submitted press release. CCN does not endorse, nor is responsible for any material included below and isn’t responsible for any damages or losses connected with any products or services mentioned in the press release. CCN urges readers to conduct their own research with due diligence into the company, product or service mentioned\nThe post Giving Users a Chance to Earn What They Deserve: Introducing ICST, a Blockchain Based Ecosystem for Personal Contents and Skill Sharing appeared first on CCN	\N	https://www.ccn.com/giving-users-a-chance-to-earn-what-they-deserve-introducing-icst-a-blockchain-based-ecosystem-for-personal-contents-and-skill-sharing/	2018-06-21 18:41:50+00	8
99	21e800: Bitcoin, Satoshi and the Mystery Twitter Is Obsessing Over	The hash value of bitcoin block 528249 unlocked on Tuesday has the crypto community in wonder about the potential hidden meaning behind &quot;21e800&quot;.	\N	https://www.coindesk.com/21e800-bitcoin-satoshi-mystery-twitter-obsessing/	2018-06-21 21:00:03+00	95
109	Stanford Univ. Launches Blockchain Research Center, Supported by Ethereum Foundation	Stanford University launches blockchain research center to explore use cases and develop new courses, supported in part by the Ethereum Foundation	\N	https://cointelegraph.com/news/stanford-univ-launches-blockchain-research-center-supported-by-ethereum-foundation	2018-06-21 13:24:00+00	203
119	Swiss Central Bank Exec: Crypto ‘Too Primitive’ to Issue State Digital Currency	Board director of the Swiss National Bank Thomas Moser said that crypto and blockchain are too primitive in their present form to consider issuing a national digital currency	\N	https://cointelegraph.com/news/swiss-central-bank-exec-crypto-too-primitive-to-issue-state-digital-currency	2018-06-22 00:28:00+00	62
134	Unveiling the HPB Node Plan – Adopting a Hybrid Election & Invitation Node Mechanism	This is a paid-for submitted press release. CCN does not endorse, nor is responsible for any material included below and isn’t responsible for any damages or losses connected with any products or services mentioned in the press release. CCN urges readers to conduct their own research with due diligence into the company, product or service mentioned\nThe post Unveiling the HPB Node Plan – Adopting a Hybrid Election &amp; Invitation Node Mechanism appeared first on CCN	\N	https://www.ccn.com/unveiling-the-hpb-node-plan-adopting-a-hybrid-election-invitation-node-mechanism/	2018-06-21 18:20:40+00	8
142	Toronto Stock Exchange Adds a New Blockchain ETF	Starting today, The Toronto Stock Exchange will list a new blockchain based ETF on their platform. ETF, which stands for ‘Exchange traded fund’ is “a marketable security that tracks an index, a commodity, bonds, or a basket of assets”. Unlike mutual funds, an ETF trades like a common stock on a stock exchange, and experience\nThe post Toronto Stock Exchange Adds a New Blockchain ETF appeared first on CCN	\N	https://www.ccn.com/toronto-stock-exchange-adds-a-new-blockchain-etf/	2018-06-21 20:55:44+00	39
4	$800 Million: ICON's Token Swap to Take Place Within 24 Hours	ICON is gearing up for its token swap which will see its ERC20 tokens exchanged for mainnet ICX coins.	\N	https://www.coindesk.com/800-million-icons-token-swap-launching-within-24-hours/	2018-06-20 00:05:17+00	153
17	Tether Review Claims Crypto Asset Fully Backed – But There's a Catch	Tether has finally produced a third-party report proclaiming that its cryptocurrency, USDT, is fully backed by U.S. dollars – with some big caveats.	\N	https://www.coindesk.com/tether-review-claims-crypto-asset-fully-backed-theres-catch/	2018-06-20 13:00:02+00	246
28	US Congressional Members Ordered to Disclose Crypto Holdings	The House Ethics Committee has informed all US Congress members that they must disclose any investment worth more than $1,000 as of June, 18. All lawmakers on Capitol Hill make an annual financial disclosure but a new memo has informed them that any cryptocurrency purchase or sale that exceeds $1,000 must be reported within 45 days.\nCongress Must Disclose Digital Holdings\nCryptocurrency, and it’s most well known token Bitcoin, came to be as a means to disrupt the global banking system. Many of those who initially embraced it were distrustful of the government and saw using the fiat alternative as a way to keep control of their own finances without federal interference. As its popularity rose and then exploded in late 2017 people from all walks of life were pulled into the investment craze.\nThis new memo from the Ethics Committee means that the public will know if their member of Congress is trading in digital assets, even as regulatory rulings over their status are still being debated. Some see the decision as a way to protect against future conflicts of interest, as when voting occurs on any bill that may affect the way cryptocurrency is officially seen by federal regulatory bodies.\nRepresentatives elected to Congress, and their staff have been required to disclose personal assets for decades, including real estate and investments. In 2012 that was tightened further to include a full disclosure of any holdings in stocks, bonds or derivatives by members of Congress or their family members. Now as investments in digital assets such as Bitcoin become more popular questions of how they should be reported have arisen since, in many cases, they remain unregulated and undefined by the federal government.\nThe recent memo from the House Ethics committee also included guidelines on crypto related side jobs. Members of Congress are limited to earning $28,050 from employment apart from their work in the house. The memo has informed them that this cap includes crypto mining.\nAustralia was First\nThis memo from the US House of Congress follows a similar demand for disclosure in the Australian Parliament. The register of members’ interests is a required listing of all properties, trusts, gifts as well as union and party affiliations by members of parliament. Recently members were told that this included any crypto holdings or monies they may have earned through investment in digital assets.\nThen newly elected Katter’s Australian Party Member Nick Damatto may have been the first MP ever to list Bitcoin among his assets. In an interview with Fairfax media, he talked about how he bought his first Bitcoin in October of 2017 for 5,000 Australian dollars, watched it climb and peak at 60,000 and then drop after Christmas. He said, “I think it’s worth about $20,000 Australian at the moment, which I think is a good investment, but it’s not at the heights it was at before.”\n \nImage from Shutterstock\nThe post US Congressional Members Ordered to Disclose Crypto Holdings appeared first on NewsBTC.	\N	https://www.newsbtc.com/2018/06/21/us-congressional-members-ordered-disclose-crypto-holdings/	2018-06-21 09:00:54+00	9
31	Nasdaq Blockchain Pilot Handles Margin Calls and Collateral Delivery 'Within Minutes'	Stock exchange operator Nasdaq has successfully tested a blockchain-based Proof-of-Concept that resolves “significant” difficulties in clearing securities collateral	\N	https://cointelegraph.com/news/nasdaq-blockchain-pilot-handles-margin-calls-and-collateral-delivery-within-minutes	2018-06-20 09:34:50+00	117
33	John McAfee Will No Longer Promote ICOs, Cites ‘SEC Threats’	John McAfee, founder of the eponymous antivirus software, said he will no longer work with ICOs or promote them due to “SEC threats”	\N	https://cointelegraph.com/news/john-mcafee-will-no-longer-promote-icos-cites-sec-threats	2018-06-19 22:44:24+00	286
37	Driving Blockchain Forward: Automotive Advances With Blockchain Technology	From self driving cars to car sharing application, how blockchain change automotive industry	\N	https://cointelegraph.com/news/driving-blockchain-forward-automotive-advances-with-blockchain-technology	2018-06-19 19:36:35+00	143
46	Chairman of Korean Gaming Giant Predicts Use of Blockchain in ‘All Industries’ in Future	Blockchain tech, similar to the widespread nature of the Internet, will soon be used across all industries, says the chairman of South Korean gaming giant	\N	https://cointelegraph.com/news/chairman-of-korean-gaming-giant-predicts-use-of-blockchain-in-all-industries-in-future	2018-06-20 16:37:05+00	108
56	Bithumb Hack Does Not Change Bitcoin Fundamentals, Says Litecoin Founder Charlie Lee	Charlie Lee says that recent Bithumb hack cannot affect Bitcoin’s fundamentals the same way a bank robbery should not affect the price of gold	\N	https://cointelegraph.com/news/bithumb-hack-does-not-change-bitcoin-fundamentals-says-litecoin-founder-charlie-lee	2018-06-21 03:01:55+00	155
65	Brazil’s Central Bank Unveils Blockchain Data Exchange Platform for Regulators	Brazil’s central bank has unveiled details of a newly-developed blockchain platform that will be used to facilitate information exchange between the country’s financial regulators. Dubbed ‘Pier’, the blockchain was developed by the Banco Central do Brasil (BCB)’s own IT department and will be used to share data securely between the central bank and other domestic\nThe post Brazil’s Central Bank Unveils Blockchain Data Exchange Platform for Regulators appeared first on CCN	\N	https://www.ccn.com/brazils-central-bank-unveils-blockchain-data-exchange-platform-for-regulators/	2018-06-20 19:41:36+00	32
80	Goldman Sachs CEO: Crypto-doubters Who Dismiss Crypto Because it is Unfamiliar are too Arrogant	CEO of Goldman Sachs Lloyd Blankfein espoused his shrewd views of cryptocurrencies yesterday, whilst speaking at the Economic Club of New York, insisting that it was impossible to tell where the technology would be twenty years from now.\nBlankfein, who has been CEO of Goldman Sachs since 2006, does not own any bitcoin. However, he has also admitted he has been wrong about things in the past and that it was impossible to tell what kind of value cryptocurrencies might hold in future.\nElaborating on this, Blankfein explained how commodity currencies in the past – i.e. gold and silver – were slowly phased out and replaced by commodity-backed fiat; non-precious paper and coins, which served as a representation of the gold and silver governments had in their vaults. Later, after the end of the gold standard in the 1970s, fiat was floated – value became based entirely on trust in the system.\nRelating this to crypto, Blankfein said,\n“If you could go through that fiat currency where they say this is worth what it’s worth because I, the government, says it is, why couldn’t you have a consensus currency?” \nBlankfein presents a measured view which hasn’t been always seen in his field; Wall Street’s large firms have generally been slow to warm up to cryptocurrencies. Jamie Dimon, CEO of JP Morgan has become infamous for his dismissal of bitcoin as a fraud, and “worse than tulips.” But Blankfein sees this outright rejection of crypto as far too arrogant.\n“I’m not in this school of saying… because it’s uncomfortable with me, because it’s unfamiliar, this can’t happen, that’s too arrogant,” \nBlankfein said nevertheless, crypto at this time was not for him, but that if it proved to endure into the future it would be possible to trace why.\n“So it’s not for me, I don’t do it, I own no bitcoin. Goldman Sachs as far as I know… has no bitcoin, but if it does work out, I could give you the historical path why that could have happened.”\nGoldman Sachs has been on the fence about cryptocurrencies until recently when the firm announced it had plans to open a crypto-trading desk. Many have speculated that until regulation surrounding crypto is settled, larger firms will wait before they enter the space. However, as firms compete with one another, more may start to enter the space in a bid to bring crypto customers on board.\nImage Source: “Flickr”\nThe post Goldman Sachs CEO: Crypto-doubters Who Dismiss Crypto Because it is Unfamiliar are too Arrogant appeared first on Toshi Times.	\N	https://toshitimes.com/goldman-sachs-ceo-crypto-doubters-who-dismiss-crypto-because-it-is-unfamiliar-are-too-arrogant/	2018-06-20 16:29:18+00	0
81	EOS Freezes User Funds to Prevent Potential Theft, Violating Its Own Constitution	According to a Steemit post, EOS has frozen seven accounts that were subject to a phishing scam. The move, initiated by the 21 block producers (BPs) might seem like a logical decision, as it will stop fraudsters from relieving several users from more than $20,000 worth of the digital currency.\nHowever, the freeze also raises serious questions about the scale of decentralization on the fifth-largest virtual currency by market cap. In order to understand the motives behind the halt, we must quickly review the latest developments within the EOS network.\nThe last couple of weeks have been quite hectic for EOS as it underwent a huge transition, moving from ethereum blockchain to EOS own distributed ledger. Due to the migration, EOS token owners had to obtain new wallet addresses and understandably some of them have fallen prey to fraudsters, revealing their private keys.\nUnfortunately, the launch was further hindered, as the BPs were forced to freeze the blockchain, following some technical difficulties. Nonetheless, the problem was solved in a couple of hours and did not seem like anything more than a brief hiccup.\nHowever, the details of a new “freeze” have now surfaced as reportedly the BPs have unanimously decided to freeze the seven compromised accounts in order protect the holders who purchased EOS tokens during a year-long ICO, which raised over $4 billion, by far a record amount for any ICO.\nThe impetus for the freeze came from the EOS911 initiative that has been adopted to help protect users with compromised private keys against phishing scams. However, the way freeze was implemented caused severe criticism as the BPs discussed the decision over a two-hour-long Telegram conference call and then simply disabled the nodes and backed up the data.\nHowever, the EOS constitution clearly states that only arbitrary bodies of the EOS blockchain can authorize such a move, while BPs are merely an executive cog in the system, only able to execute their decisions. Apparently, the BPs decided that the constitution has not been ratified, thus can be ignored.\nBPs explained their actions in a Steemit post, claiming that, “EOS New York chose to enact this freeze because we believed that we were following the spirit of the governance system we as a community seek to create, despite it being formally absent. EOS is a platform meant to enable solutions which protect life, liberty, and property and that’s what we believed we were doing through this emergency action.“\nUnderstandably, the news were met with significant backlash from the crypto community as the BPs violated one of the core principles of all cryptocurrencies – decentralization.\n\nSome randomly elected 3rd party arbitrator is now making “orders” to #EOS block producers. In this case, regarding locking user accounts.\nCan’t even make up comedy this good. pic.twitter.com/Dfs7UH0f5T\n— Eric (@econoar) June 19, 2018\n\n\n“Protecting” “punishing”. No. No one gets to decide those things. You are hair swapping 1 nation state for another one, albeit a digital one. This is the point of crypto, no one should have that power. If you do, then we should just stop wasting everyone’s time. https://t.co/yCh6IIPGqp\n— Charlie Shrem (@CharlieShrem) June 18, 2018\n\n\nIn EOS a few complete strangers can freeze what users thought was their money. Under the EOS protocol you must trust a &quot;constitutional&quot; organization comprised of people you will likely never get to know. The EOS &quot;constitution&quot; is socially unscalable and a security hole. https://t.co/WusEqBMGBp\n— Nick Szabo (@NickSzabo4) June 19, 2018\n\nEOS went on to explain that any compromised account can be unlocked and that EOS Core Arbitration Forum (ECAF) filed a submission, while the BPs await ruling on the frozen account status.\nEOS has been troubled by security issues recently, with a Cornell University blockchain researcher Emin Gün Sirer claiming the cryptocurrency will cause a “massive exchange hack” due to its vulnerabilities. Similar claims were echoed by a Chinese digital security company Qihoo 360, which detected several “high-risk vulnerabilities” within the EOS code, which have since been patched.\nImage Source: “Flickr”\nThe post EOS Freezes User Funds to Prevent Potential Theft, Violating Its Own Constitution appeared first on Toshi Times.	\N	https://toshitimes.com/eos-freezes-user-funds-to-prevent-potential-theft-violating-its-own-constitution/	2018-06-20 12:32:12+00	49
100	Stanford University Launches New Blockchain Research Center	Stanford University launches the Center for Blockchain Research and Vitalik Buterin, the creator of Ethereum, is one of the sponsors.	\N	https://www.coindesk.com/stanford-university-launches-new-blockchain-research-center/	2018-06-21 16:05:38+00	71
115	Hacked S. Korean Crypto Exchange Bithumb Confirms It Will Reimburse Affected Users	South Korean crypto exchange Bithumb stated it will reimburse users affected by the $30 mln hack that took place two days ago	\N	https://cointelegraph.com/news/hacked-s-korean-crypto-exchange-bithumb-confirms-it-will-reimburse-affected-users	2018-06-21 18:36:00+00	79
122	PlayChip ICO Takes out the ‘Draper Hero’s Choice Award’ at San Francisco Blockchain Economic Forum	The Blockchain Economic Forum that recently took place in the technological heart of the world, San Francisco (USA), saw huge attendance this year with thousands of participants. Attendees ranged from multi-billion dollar investors, influential media, highest-ranked politicians, outstanding scientists and leaders from the world of technology, along with a plethora of blockchain enthusiasts. \nThe event featured many major speakers from the industry, including Canada’s former Minister of Finance and Minister of Natural Resources, Joe Oliver, and Poland’s Minister of Finance (2013–2015) and current Lead Regional Economist for Central Europe, Mateusz Szczurek. They were joined by co-founder and founding CTO of LinkedIn, Eric Ly, Vice Chairman of the Bitcoin Foundation, Bobby Lee, and Tim Draper – one of the pioneers of venture capitalism and founder of the $5billion DFJ Fund – among others.\nThe event hosted a competitive ICO pitch competition for the ‘Draper Hero’s Choice Award’, which was awarded to PlayChip. Their goal is to be the Universal Gaming Token of choice and to create the worlds biggest incentivized, blockchain-enabled sports community and gaming ecosystem.\nLuke Lombe from the PlayChip ICO team collecting the San Francisco Blockchain Economic Forum ICO Pitch ‘Draper Hero’s Choice Award’.\nThe award’s namesake Tim Draper is one of the earliest advocates for cryptocurrencies and blockchain technology. Draper is a venture capital investor, famous for his role as co-founder of Draper Fisher Jervetson, the asset management company he started in 1985 that is currently responsible for managing over USD$5billion in assets. Tim Draper found fame in the blockchain world after he was revealed as the Silk Road Bitcoin Auction Winner in 2014, where he purchased approximately 30,000 seized bitcoins. \nThe PlayChip ICO has a very compelling service offering due to the fact that it is part of an established company: PlayUp. PlayUp has over 500,000 existing users, and 6 active fantasy sports and sports betting platforms all ready to integrate the PlayChip token. They are on track to deliver $430 Million in turnover throughout 2018, which has made them the real standout in the competition – it is rare for an ICO to already be part of a preexisting multimillion-dollar business. In addition to this, it is one of the few ICOs available to US citizens.\nThe winning of the Draper Hero’s Choice Award is just another arrow in the quiver of PlayChip’s success to date, with their private seed round selling out in just 2 days. The meteoric rise of this token is certainly one to keep an eye on in the cryptocurrency space.\nThe post PlayChip ICO Takes out the ‘Draper Hero’s Choice Award’ at San Francisco Blockchain Economic Forum appeared first on NewsBTC.	\N	https://www.newsbtc.com/2018/06/21/playchip-ico-takes-draper-heros-choice-award-san-francisco-blockchain-economic-forum/	2018-06-21 12:55:04+00	13
128	A Leading Philippines Bank RCBC Opts For Stellar, Shuns Ripple: Litecoin, EOS, Tron, Stellar Lumens and IOTA Technical Analysis (June 22, 2018)	The crypto verse is never short of drama and while hacking vibes dominate, Charlie Lee of Litecoin is advocating rationalism. Obviously, after recent hacks, it’s easy to see sentiment almost always flips and drag BTC prices with it. The resulting coupling drags other coins with it resulting in a general crypto slide which he thinks is totally unnecessary. While this is happening, TRX coin migration begins today.\nLet’s have a look at the charts:\nEOS Technical Analysis\nEOS Daily Chart by Trading View\nSo guys, the verdict is out. According to China’s CCID, EOS is the most interesting blockchain technology out in this space. There are certain distinct criteria which they used. And in their Global Public Chain Assessment Index, EOS though the fifth largest cryptocurrency, is superior in technology, applicability and innovation.\n\n2nd crypto/#blockchain ratings  #China Electronic Information Industry Development (#CCID) \n1. Top 5 tech: $EOS, $Steem, $ETH, $BTS, $XLM2. Top 5 application: $NEO, ETH, $Qtum, XLM, $NAS3. Top 5 innovation: EOS, $BTC, $ADA, ETH, $LTC$XRP 9th $SC 25th $BCH 28th@cnLedger pic.twitter.com/EbswkPQwoh\n— chengdoo (@chengdoo) June 20, 2018\n\nThough restrictive to ICOs which made EOS possible and cryptocurrency exchange, Chinese regulators found EOS to be efficient with high network throughput and supportive transaction costs unlike any other project under their evaluation.\nFrom the charts, EOS is still moving horizontally and at current valuation it’s literally flat 24 hours later. While we remain bullish and banking on our anchor candlestick to trigger a new wave of bull pressure, it is going to be vanity should there be a break below $9. That’s why, even though bears are trying to unwind those gains, patience is a precious asset going forward and as such, we remain neutral until either when we see price breaking above $13 or below $9 in subsequent sessions.\nLitecoin (LTC) Technical Analysis\nLitecoin Daily Chart by Trading View\nIt’s been a bad month for exchange and we can point out to two different hacks-at Coinrail and BitHumb, both South Korea’s crypto facilitators bearing the cost of lax network security. In both breaches, the exchange had to contend with losing $80 million worth of cryptos and while we don’t know specific coins that were taken, there was a slight reaction in the market.\n\n#Litecoin founder Charlie Lee (@SatoshiLite) explains what will drive #Bitcoin and other #cryptos higher $LTC pic.twitter.com/3hLdKWpEyU\n— CNBC's Fast Money (@CNBCFastMoney) June 20, 2018\n\nBitcoin went down pulling with it Litecoin and a host of other coins relying on BTC valuation to strive. It’s in this vein that Charlie Lee thinks there should be some sort of stratification and trading without emotions. Fear through hacks affects crypto prices negatively and to him, this shouldn’t be the case.\nSame as before, Litecoin price movements are moving within a tight trading range. At the moment, Litecoin (LTC) is down one percent and with every bear candlestick that prints, LTC sellers are driving prices towards $90. That’s our minor support and a sell trigger aligning in the direction set by June 10 bear engulfing candlestick breaking below the mains support at $110. Because of this, sellers should find shorting opportunities and trade small sizes with targets at $70 and stops at $100 until after we see clear break outs in either direction.\nStellar Lumens (XLM) Technical Analysis\nStellar Lumens Daily Chart by Trading View\nLike Ripple, Stellar have a common founder-at least the idea of both blockchain came from the one person-Jed McCaleb. At the core, they want to provide an alternative solution to the current cumbersome and expensive international remittance service which we all know is taxing. At the moment, Stellar works with IBM.\nIn the Philippines, one of their largest banks Rizal Commercial Banking Corporation (RCBC) wants to change tact and tap remittance from Japan which hit a record $137 million in April 2018 alone. According to reports, they plan to work with IBM and considering the Stellar-IBM ties in place, it’s likely that their platform would be in use and Lumens is there to tap those capital gains due to demand.\nFundamentals are perfect but price isn’t resonating with it. In fact going by recent movements, like most coins Stellar Lumens is moving horizontally and is narrow. Yes, it’s down two percent but should there be a break below 20 cents, our bullish projections would no longer hold. In my view, it’s better to wait and see how bears react at our triggers-at 20 cents and 30 cents rather than diving in without strong trade signals.\nTron (TRX) Technical Analysis\nTron Daily Chart by Trading View\nThe Tron Foundation shall kick-start their ERC-20 TRX migration today and as Justin Sun keep saying, this is just but an intermediary step towards independence. You should also remember that on this day, Tron Foundation plans to burn $50 million worth of TRX equivalent to 1 billion TRX coins just to jump start and commemorate this independence.\n\nLetter to the community: #TRON Independence Day. Celebrate on June 25th as we become a free, autonomous, and self-governed decentralized internet. Join us in celebrating with a 1 billion #TRX coin burn! @Tronfoundation https://t.co/NZrpDq6V9V pic.twitter.com/NFmIjRAF6u\n— Justin Sun (@justinsuntron) June 21, 2018\n\nIt sound crazy but this would likely spur demand as supply would be lowered. That’s not all though, because of their detachment from Ethereum and their previous appeal from Ledger Support, plans are underway for TRX coin support on Ledger Nano S hardware wallet.\nIt’s solely because of these events that it’s likely that TRX prices would get a boost. Already, we can see buyers jumping in and rejecting lower lows as yesterday’s lower candlestick shows. Besides, coin trackers show that TRX is the only coin to register gains. TRX is up eight percent –in the last week alone. We can see hints of that courtesy of those bullish candlesticks before June 20 BitHumb hack. Anyway, I recommend buys with stops at 4 cents and targets of 6.5 cents, 8.5 cents and later 10 cents.\nIOTA (IOT) Technical Analysis\nIOTA Daily Chart by Trading View\nWhile we are positive that IOTA is a long term buy all thanks to their strategic partnership with tech heavy weights, IOT is grappling with sell pressure. Initially, it appeared as if buyers were in charge. However, with recent lower lows and lack of follow through after June 18 bull pin bar, sell pressure seems to be high. In my view, being neutral until we see strong movements in either direction would be superior. Otherwise, should bears step up and break below $1, bear target stands at 90 cents.\nDisclaimer: This is an opinion piece and views/opinions expressed are those of the Author. Do your Due Diligence before making an investment decision.\nThe post A Leading Philippines Bank RCBC Opts For Stellar, Shuns Ripple: Litecoin, EOS, Tron, Stellar Lumens and IOTA Technical Analysis (June 22, 2018) appeared first on NewsBTC.	\N	https://www.newsbtc.com/2018/06/22/litecoin-eos-tron-stellar-iota-technical-analysis/	2018-06-22 00:02:59+00	16
137	Zap.org is the Latest P. Diddy Approved Venture	This is a sponsored story. CCN urges readers to conduct their own research with due diligence into the company, product or service mentioned in the content below. With the launch of the Ethereum network and its ability to execute smart contracts, the world has been provided a new way to conduct business and peer-to-peer interactions.\nThe post Zap.org is the Latest P. Diddy Approved Venture appeared first on CCN	\N	https://www.ccn.com/zap-org-is-the-latest-p-diddy-approved-venture/	2018-06-21 16:21:11+00	14
101	IOST Blockchain Incubator Launches With $50 Million Fund	Bluehill, a startup incubator for global blockchain projects, launched on Thursday after raising $50 million to support the IOST ecosystem.	\N	https://www.coindesk.com/iost-blockchain-incubator-launches-50-million-fund/	2018-06-21 14:00:31+00	47
108	Tech Giant Intel Partners With DApp Platform Enigma on Privacy Research	DApp platform Enigma reveals partnership with Intel prior to testnet debut	\N	https://cointelegraph.com/news/tech-giant-intel-partners-with-dapp-platform-enigma-on-privacy-research	2018-06-21 11:53:00+00	70
117	US Congressman Says ICO Market Needs ‘Light Touch’ Regulation to Provide Certainty	Republican U.S. Congressman Warren Davidson says the ICO market needs “light touch” regulation to provide certainty	\N	https://cointelegraph.com/news/us-congressman-says-ico-market-needs-light-touch-regulation-to-provide-certainty	2018-06-22 02:04:00+00	53
132	Interview: UK Exchange Crypto Facilities Launches Litecoin Futures Trading	A cryptocurrency futures trading platform based in the UK called Crypto Facilities is launching a new futures product allowing traders to take positions on Litecoin futures. Crypto Facilities CEO Timo Schlaefer spoke to CCN about the project. “We have seen extremely strong growth in futures trading volumes, up 84% in Q1 2018 on Q4 2017,\nThe post Interview: UK Exchange Crypto Facilities Launches Litecoin Futures Trading appeared first on CCN	\N	https://www.ccn.com/interview-uk-exchange-crypto-facilities-launches-litecoin-futures-trading/	2018-06-21 17:36:56+00	33
140	Crypto-Friendly Robinhood Wants to Offer Bank Accounts	Stock trading app Robinhood, which recently began rolling out cryptocurrency trading to many of its US customers, wants to offer its customers savings accounts and other traditional banking services. Bloomberg reports that the $5.6 billion firm, based out of Menlo Park, CA, has already approached regulators at the Office of the Comptroller of the Currency\nThe post Crypto-Friendly Robinhood Wants to Offer Bank Accounts appeared first on CCN	\N	https://www.ccn.com/crypto-friendly-robinhood-wants-to-offer-bank-accounts/	2018-06-21 22:00:59+00	36
147	Rapper Akon Launches his own Cryptocurrency, to be Used in ‘Akon Crypto City’	While the glory days of African-born rapper Akon might be in the past, he produced no less than 12 Billboard Top Ten Hits nonetheless, cementing his name into the pages of music history. It seems that Akon has turned the page on his music career and moved into the crypto waters, as he announced the creation of his own digital currency ‘Akoin’, which will be used in his new “Akon Crypto City” in Senegal, the country of his descent.\nAkon, whose real name is Aliaume Thiam, hopes that virtual currency and blockchain technology could be “the savior for Africa in many ways”, especially due to its high level of security and decentralization that empowers the people instead of governments.\nWhile the Akoin project might sound ambitious, it is only the first part of Akon‘s master plan, as the cryptocurrency will be used to power a “100% crypto-based city.” The Akoin website claims the Akon Crypto City will be “a real-life Wakanda”, referring to the futuristic high-tech nation from Marvel’s Black Panther movie and comics.\nThe website also sheds some additional light on the crypto city, detailing that, “This futuristic city, already in development, beginning with 2,000 acres of land gifted to Akon from the President of Senegal, is within 5 minutes of the new international airport, close to the coast and a short drive from Dakar, the capital city of Senegal (Akon’s homeland). Akon Crypto City blends leading Smart City planning designs with a blank canvas for cryptonizing our daily human and business exchanges, towards inventing a radical new way of existence.“\nWhilst inventing a new way of existence surely sounds enticing, the project sounds a bit too ambitious to put it mildly. The overuse of a term “blockchain” as a way to solve all currency problems is also alarming as it is a common feature of numerous failed or fraudulent ICOs. Akon admitted to not having the technical knowledge on the technology, saying that, “I come up with the concepts and let the geeks figure it out.“\nNonetheless, the rapper has already helped millions in the Dark Continent via his Lighting Africa charity. The project helps arrange financing for solar panels in 25 countries and has won numerous awards, United Nations recognition as well as $1 billion credit line from China.\nHowever, the dubious nature of the rapper remains a potential issue, as after finishing his speech on the crypto city, he hinted at running for the US president office in 2020, alongside Kanye West and Donald Trump. We will leave you with a curious quote that illustrates the point pretty well.\n“It’s gonna be entertaining, it’s gonna be something worth watching. I’m going to go after Trump, and Kanye will get offended because he likes Trump, and he’s going to go after me. Then I’m going to go after Kanye, and then Trump’s going to get offended because he likes Kanye, and he’s going to go after me. And the debate stage will be set where it’s all about me. It’s perfect, a master plan.”\nImage source: “Flickr”\nThe post Rapper Akon Launches his own Cryptocurrency, to be Used in ‘Akon Crypto City’ appeared first on Toshi Times.	\N	https://toshitimes.com/rapper-akon-launches-his-own-cryptocurrency-to-be-used-in-akon-crypto-city/	2018-06-21 16:19:07+00	8
150	Ukraine: Four Arrested for Running Fake Crypto Exchanges	Four citizens of Ukraine have been arrested by local authorities for running six fake cryptocurrency exchanges	\N	https://cointelegraph.com/news/ukraine-four-arrested-for-running-fake-crypto-exchanges	2018-06-22 03:18:00+00	4
151	Tencent, Chinese Officials Partner on Fighting Blockchain Security Risks	Technology giant Tencent said it was teaming up with the Chinese government to fight blockchain-related security problems and crimes.	\N	https://www.coindesk.com/tencent-chinese-officials-partner-on-fighting-blockchain-security-risks/	2018-06-22 02:00:26+00	9
152	Irish Bitcoin Broker Claims Country’s Banks Are Closing Crypto-Related Accounts	The owner of a leading Irish Bitcoin broker has accused the country’s banking institutions of discriminating against crypto-related businesses	\N	https://cointelegraph.com/news/irish-bitcoin-broker-claims-country-s-banks-are-closing-crypto-related-accounts	2018-06-22 03:40:00+00	0
2	Nasdaq Blockchain Trial Resolves Margin Calls 'in Minutes'	A group of industry stakeholders is trialing a blockchain system designed to more efficiently cover margin calls in securities trading.	\N	https://www.coindesk.com/nasdaq-blockchain-trial-resolves-margin-calls-in-minutes/	2018-06-20 06:00:27+00	91
13	Trump Official Argues for 'Sweet Spot' in Crypto Regulation	The U.S. government needs to develop reasonable regulations around the nascent cryptocurrency space, said OMB director Mick Mulvaney.	\N	https://www.coindesk.com/trump-official-argues-for-sweet-spot-in-crypto-regulation/	2018-06-20 20:15:27+00	61
16	Bloomberg Terminal Adds Huobi's Cryptocurrency Market Index	The Huobi Pro exchange has announced that Bloomberg now provides the HUOBI10 crypto market index on its terminal service.	\N	https://www.coindesk.com/bloomberg-terminal-adds-huobis-cryptocurrency-market-index/	2018-06-21 06:00:34+00	57
27	Ethereum Classic Price Analysis: ETC/USD Surging Higher	Key Highlights\n\nEthereum classic price gained heavy bids and surged above the $17.00 resistance against the US dollar.\nThere is a crucial bullish trend line formed with support at $16.20 on the hourly chart of the ETC/USD pair (Data feed via Kraken).\nThe pair is placed nicely in an uptrend and it could accelerate gains above $17.50 in the near term.\n\nEthereum classic price is moving with a positive bias against the US Dollar and Bitcoin. ETC/USD is placed well above $16.20 for more gains above $17.50.\nEthereum Classic Price Support\nThere was a major support base formed near $14.00 in ETC price against the US dollar. The ETC/USD pair started a solid upside move and broke many resistances, including $15.00 and $16.00. There was even a break and close above the $16.50 pivot level and the 100 hourly simple moving average. The upside move was such that the price even climbed above the $17.00 level and traded as high as $17.45.\nAt the moment, the price is correcting lower and it may test the 23.6% Fib retracement level of the last wave from the $14.83 low to $17.45 high. More importantly, there is a crucial bullish trend line formed with support at $16.20 on the hourly chart of the ETC/USD pair. The same trend line support is near the 50% Fib retracement level of the last wave from the $14.83 low to $17.45 high. Moreover, the $16.20-50 zone was a resistance earlier and it may now provide support if the price moves down. On the upside, an initial resistance is near $17.45-50.\n\nThe chart suggests that the price is placed nicely in an uptrend above $16.20. A break above the $17.50 resistance may open the doors for more gains above $18.00.\nHourly MACD – The MACD for ETC/USD is placed in the bullish zone.\nHourly RSI – The RSI for ETC/USD is currently well into the overbought zone with a bullish bias.\nMajor Support Level – $16.20\nMajor Resistance Level – $17.50\nThe post Ethereum Classic Price Analysis: ETC/USD Surging Higher appeared first on NewsBTC.	\N	https://www.newsbtc.com/2018/06/21/ethereum-classic-price-analysis-etc-usd-surging-higher/	2018-06-21 08:00:24+00	13
43	Uruguay to Develop Crypto Regulations, Focusing on Innovation	The Uruguayan chamber of fintech is forming a committee that will develop the country’s crypto regulation framework	\N	https://cointelegraph.com/news/uruguay-to-develop-crypto-regulations-focusing-on-innovation	2018-06-20 11:15:47+00	91
50	Bitcoin, Ethereum, Ripple, Bitcoin Cash, EOS, Litecoin, Cardano, Stellar, IOTA: Price Analysis, June 20	Going long! What cryptocurrencies? Check our price analysis to find out	\N	https://cointelegraph.com/news/bitcoin-ethereum-ripple-bitcoin-cash-eos-litecoin-cardano-stellar-iota-price-analysis-june-20	2018-06-20 17:18:23+00	161
55	US: SEC Obtains Emergency Court Order to Freeze Assets of Fraudulent ICO	The U.S. SEC has received an emergency court order to freeze the assets of Dominic Lacroix, who was previously accused of violating securities law in regards to PlexCoin ICO	\N	https://cointelegraph.com/news/us-sec-obtains-emergency-court-order-to-freeze-assets-of-fraudulent-ico	2018-06-21 00:48:26+00	94
57	Stablecoin Project Secures Backing From Peter Thiel, Coinbase, 40 Others	A new project for a stabilized cryptocurrency that works ‘like normal money,’ has received backing from Peter Thiel, Coinbase, Distributed Global, GSR.IO and 40 others	\N	https://cointelegraph.com/news/stablecoin-project-secures-backing-from-peter-thiel-coinbase-40-others	2018-06-20 17:59:49+00	104
64	ICOs ‘Taking Advantage’ of Retail Investors: Nasdaq CEO	Initial coin offerings (ICOs) may provide early-stage startups with an effective way to raise capital and build a dedicated base of followers, but the head of one of the world’s largest stock exchanges believes that they’re harmful to retail investors. Nasdaq CEO Adena Friedman levied this criticism on Wednesday at the Future of Fintech conference\nThe post ICOs ‘Taking Advantage’ of Retail Investors: Nasdaq CEO appeared first on CCN	\N	https://www.ccn.com/icos-taking-advantage-of-retail-investors-nasdaq-ceo/	2018-06-20 21:01:47+00	39
78	Government Officials Must Disclose Crypto Holdings Following New Guidance by the US Ethics Office	The US Office of Government Ethics (OGE) has released a new guidance for those working in the executive branch of the United States Government. The document orders federal employees to report their digital asset holdings.\nOGE stated that digital currency qualifies as “property held … for investment or the production of income” under the Ethics in Government Act as opposed to “real” currency. Therefore, government employees will now have to report their crypto holdings because they “may create a conflict of interest for employees who own it.”\nOGE has joined a growing list of institutional bodies that do not consider digital tokens to be a mean of payment but treat them rather as a property. The Internal Revenue Service has adopted such stance back in 2014 for tax purposes, while the SEC and CFTC have their own well-documented issues with the status of digital assets. Having finally admitted that ethereum and bitcoin are not securities, the agencies are now looking into XRP.\nThe notice states that, “Filers report their holdings in a virtual currency if the value of the virtual currency holding exceeded $1,000 at the end of the reporting period or if the income produced by the virtual currency holding exceeded $200 during the reporting period. Filers are required to identify the name of the virtual currency and, if held through an exchange or platform, the exchange or platform on which it is held.“\nThe disclosure requirement is a major move as it will affect over 2 million employees working for the White House or the myriad of federal agencies. The document also discerns ICOs claiming that, “Further, the reporting and conflict of interest principles set forth herein apply equally to other digital assets, such as ‘coins’ or ‘tokens’ received in connection with initial coin offerings or issued or distributed using distributed ledger or blockchain technology.”\nIn addition to avoiding conflicts of interest, OGE claims the guidance was written due to the fact that numerous government employees have been “increasingly seeking guidance from their ethics officials concerning their financial disclosure reporting obligations.”\nOGE has admitted that the guidance might need some updates and improvements further down the road as digital currency is a “relatively new and still evolving financial instrument whose final form and function may yet change.”\nSome officials have already disclosed their crypto holdings following the guidance. Brent McIntosh, general counsel to the US Treasury Department, disclosed he owned bitcoin, valued between $1001 and $15,000, while Jessie Liu, US attorney for the District of Columbia, likewise disclosed BTC at between $1001 and $15,000.\nImage Source: “Flickr”\nThe post Government Officials Must Disclose Crypto Holdings Following New Guidance by the US Ethics Office appeared first on Toshi Times.	\N	https://toshitimes.com/government-officials-must-disclose-crypto-holdings-following-new-guidance-by-the-us-ethics-office/	2018-06-19 17:59:38+00	6
82	6th Largest Crypto Exchange in the World Hacked – $30 Million Stolen	Cryptocurrency hacks are becoming so popular that it has become a daily occurrence. The latest is on one of the world’s largest cryptocurrency exchanges, Bithumb. The apparent hack has cost Bithumb a reported loss of $30 million.\nBithumb is a cryptocurrency exchange headquartered in Seoul, South Korea and is a leader in the cryptocurrency market regarding daily transactions. At the end of 2017, the average daily liquidity turnover at Bithumb was equivalent to $ 1.3 billion. It controls most of South Korean’s cryptocurrency trading.\nBithumb has been active on social media Twitter since the hack today morning, posting updates about the precautions to take. \n\nBithumb urgently ask our valuable customers not to deposit any fund into Bithumb wallet addresses for the time being.\n https://t.co/rnMGmKMBUf\n— Bithumb (@BithumbOfficial) June 20, 2018\n\nBithumb suspended the acceptance of deposits at around 00:53 UTC and started transferring the assets to cold wallets to ensure no further damage was caused.\nConfirmations about how the hack took place have still not been revealed, but the nature of it was hinted by a professor at Korea University’s Blockchain Research Institute. He believed that that the hacker gained access to an internet connected  ‘hot wallet’ of an insecure smaller asset listed on the platform.\n “Since coins in the cold wallets are not at all wired to the internet, it would have been impossible for hackers to steal those in cold wallets unless they physically broke in,” the blockchain expert at the research institute said.\nBithumb is the world’s sixth largest cryptocurrency exchange, and thus such a hack sends a message of caution to several traders of the digital coins in using popular cryptocurrency exchanges.\nCharlie Lee, the founder of Litecoin, advised fellow crypto traders in a tweet after the hack on Bithumb. The Tweet Read-\n\nAnother day, another hack. Hopefully BitThumb is able to cover this amount, though $30MM is not a small amount.\nAs I've said many times, be smart and only keep on exchange coins that you are actively trading. It's best to withdraw right after trading. https://t.co/8YpVcHx8tK\n— Charlie Lee [LTC] (@SatoshiLite) June 20, 2018\n\nBitcoin was enjoying a bull run the last few days; however, after the hack of Bithumb, it fell by nearly $200. The current price of Bitcoin at the time of writing is $6630.\nAnother South Korean Exchange called Coinrail was hacked earlier in the month, which led to a loss of $37.2 million worth of coins.\nImage Source: “Flickr”\nThe post 6th Largest Crypto Exchange in the World Hacked – $30 Million Stolen appeared first on Toshi Times.	\N	https://toshitimes.com/6th-largest-crypto-exchange-in-the-world-hacked-30-million-stolen/	2018-06-20 13:00:20+00	0
\.


--
-- Data for Name: news_alert; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.news_alert (id, user_id, coin_id, favourite, subscribe_website, subscribe_medium, subscribe_reddit, subscribe_twitter) FROM stdin;
\.


--
-- Data for Name: price; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price (id, coinmarketcap_id, currency_id, price, volume_24h, market_cap, percent_change_1h, percent_change_24h, percent_change_7d) FROM stdin;
2	4	1	\N	\N	\N	\N	\N	\N
3	8	1	\N	\N	\N	\N	\N	\N
5	6	1	\N	\N	\N	\N	\N	\N
6	5	1	\N	\N	\N	\N	\N	\N
7	9	1	\N	\N	\N	\N	\N	\N
8	3	1	\N	\N	\N	\N	\N	\N
9	13	1	\N	\N	\N	\N	\N	\N
10	10	1	\N	\N	\N	\N	\N	\N
11	14	1	\N	\N	\N	\N	\N	\N
12	16	1	\N	\N	\N	\N	\N	\N
13	18	1	\N	\N	\N	\N	\N	\N
14	25	1	\N	\N	\N	\N	\N	\N
15	31	1	\N	\N	\N	\N	\N	\N
16	32	1	\N	\N	\N	\N	\N	\N
17	34	1	\N	\N	\N	\N	\N	\N
18	37	1	\N	\N	\N	\N	\N	\N
19	35	1	\N	\N	\N	\N	\N	\N
20	41	1	\N	\N	\N	\N	\N	\N
21	42	1	\N	\N	\N	\N	\N	\N
22	43	1	\N	\N	\N	\N	\N	\N
23	45	1	\N	\N	\N	\N	\N	\N
24	49	1	\N	\N	\N	\N	\N	\N
25	50	1	\N	\N	\N	\N	\N	\N
26	51	1	\N	\N	\N	\N	\N	\N
27	53	1	\N	\N	\N	\N	\N	\N
28	56	1	\N	\N	\N	\N	\N	\N
30	57	1	\N	\N	\N	\N	\N	\N
31	58	1	\N	\N	\N	\N	\N	\N
32	61	1	\N	\N	\N	\N	\N	\N
33	63	1	\N	\N	\N	\N	\N	\N
34	64	1	\N	\N	\N	\N	\N	\N
36	67	1	\N	\N	\N	\N	\N	\N
37	68	1	\N	\N	\N	\N	\N	\N
38	69	1	\N	\N	\N	\N	\N	\N
39	70	1	\N	\N	\N	\N	\N	\N
40	71	1	\N	\N	\N	\N	\N	\N
41	72	1	\N	\N	\N	\N	\N	\N
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
60	113	1	\N	\N	\N	\N	\N	\N
61	114	1	\N	\N	\N	\N	\N	\N
62	117	1	\N	\N	\N	\N	\N	\N
64	120	1	\N	\N	\N	\N	\N	\N
65	121	1	\N	\N	\N	\N	\N	\N
66	122	1	\N	\N	\N	\N	\N	\N
67	125	1	\N	\N	\N	\N	\N	\N
68	128	1	\N	\N	\N	\N	\N	\N
69	129	1	\N	\N	\N	\N	\N	\N
70	130	1	\N	\N	\N	\N	\N	\N
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
93	206	1	\N	\N	\N	\N	\N	\N
94	201	1	\N	\N	\N	\N	\N	\N
96	205	1	\N	\N	\N	\N	\N	\N
97	199	1	\N	\N	\N	\N	\N	\N
98	218	1	\N	\N	\N	\N	\N	\N
99	215	1	\N	\N	\N	\N	\N	\N
100	217	1	\N	\N	\N	\N	\N	\N
101	212	1	\N	\N	\N	\N	\N	\N
102	221	1	\N	\N	\N	\N	\N	\N
103	224	1	\N	\N	\N	\N	\N	\N
104	233	1	\N	\N	\N	\N	\N	\N
105	234	1	\N	\N	\N	\N	\N	\N
106	254	1	\N	\N	\N	\N	\N	\N
107	257	1	\N	\N	\N	\N	\N	\N
108	258	1	\N	\N	\N	\N	\N	\N
109	269	1	\N	\N	\N	\N	\N	\N
110	260	1	\N	\N	\N	\N	\N	\N
111	263	1	\N	\N	\N	\N	\N	\N
112	268	1	\N	\N	\N	\N	\N	\N
113	275	1	\N	\N	\N	\N	\N	\N
114	276	1	\N	\N	\N	\N	\N	\N
115	287	1	\N	\N	\N	\N	\N	\N
116	290	1	\N	\N	\N	\N	\N	\N
117	278	1	\N	\N	\N	\N	\N	\N
118	279	1	\N	\N	\N	\N	\N	\N
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
132	331	1	\N	\N	\N	\N	\N	\N
133	333	1	\N	\N	\N	\N	\N	\N
134	334	1	\N	\N	\N	\N	\N	\N
135	337	1	\N	\N	\N	\N	\N	\N
136	338	1	\N	\N	\N	\N	\N	\N
137	341	1	\N	\N	\N	\N	\N	\N
138	344	1	\N	\N	\N	\N	\N	\N
139	350	1	\N	\N	\N	\N	\N	\N
140	353	1	\N	\N	\N	\N	\N	\N
141	356	1	\N	\N	\N	\N	\N	\N
142	360	1	\N	\N	\N	\N	\N	\N
143	362	1	\N	\N	\N	\N	\N	\N
144	366	1	\N	\N	\N	\N	\N	\N
145	367	1	\N	\N	\N	\N	\N	\N
146	370	1	\N	\N	\N	\N	\N	\N
148	374	1	\N	\N	\N	\N	\N	\N
149	377	1	\N	\N	\N	\N	\N	\N
150	382	1	\N	\N	\N	\N	\N	\N
151	385	1	\N	\N	\N	\N	\N	\N
152	386	1	\N	\N	\N	\N	\N	\N
153	389	1	\N	\N	\N	\N	\N	\N
154	400	1	\N	\N	\N	\N	\N	\N
155	405	1	\N	\N	\N	\N	\N	\N
156	415	1	\N	\N	\N	\N	\N	\N
157	411	1	\N	\N	\N	\N	\N	\N
147	372	1	0.0035160800	14856100.0000000000	646573643.0000000000	1.91	-5.88	-21.80
42	74	1	0.0029520100	4452080.0000000000	339370854.0000000000	-0.12	-1.83	0.30
119	291	1	0.3660840000	2097090.0000000000	165672197.0000000000	0.28	-2.35	8.77
35	66	1	0.1106840000	3139210.0000000000	110573310.0000000000	0.35	-2.38	-6.18
158	406	1	\N	\N	\N	\N	\N	\N
159	416	1	\N	\N	\N	\N	\N	\N
160	426	1	\N	\N	\N	\N	\N	\N
161	448	1	\N	\N	\N	\N	\N	\N
162	460	1	\N	\N	\N	\N	\N	\N
163	450	1	\N	\N	\N	\N	\N	\N
164	467	1	\N	\N	\N	\N	\N	\N
166	461	1	\N	\N	\N	\N	\N	\N
167	477	1	\N	\N	\N	\N	\N	\N
168	476	1	\N	\N	\N	\N	\N	\N
169	513	1	\N	\N	\N	\N	\N	\N
170	468	1	\N	\N	\N	\N	\N	\N
171	506	1	\N	\N	\N	\N	\N	\N
173	502	1	\N	\N	\N	\N	\N	\N
174	520	1	\N	\N	\N	\N	\N	\N
175	470	1	\N	\N	\N	\N	\N	\N
176	501	1	\N	\N	\N	\N	\N	\N
177	495	1	\N	\N	\N	\N	\N	\N
178	525	1	\N	\N	\N	\N	\N	\N
179	536	1	\N	\N	\N	\N	\N	\N
181	543	1	\N	\N	\N	\N	\N	\N
182	545	1	\N	\N	\N	\N	\N	\N
183	549	1	\N	\N	\N	\N	\N	\N
184	551	1	\N	\N	\N	\N	\N	\N
185	576	1	\N	\N	\N	\N	\N	\N
186	572	1	\N	\N	\N	\N	\N	\N
188	573	1	\N	\N	\N	\N	\N	\N
189	584	1	\N	\N	\N	\N	\N	\N
190	588	1	\N	\N	\N	\N	\N	\N
191	594	1	\N	\N	\N	\N	\N	\N
192	597	1	\N	\N	\N	\N	\N	\N
193	606	1	\N	\N	\N	\N	\N	\N
194	601	1	\N	\N	\N	\N	\N	\N
195	624	1	\N	\N	\N	\N	\N	\N
196	625	1	\N	\N	\N	\N	\N	\N
197	623	1	\N	\N	\N	\N	\N	\N
198	626	1	\N	\N	\N	\N	\N	\N
199	627	1	\N	\N	\N	\N	\N	\N
200	629	1	\N	\N	\N	\N	\N	\N
201	633	1	\N	\N	\N	\N	\N	\N
202	638	1	\N	\N	\N	\N	\N	\N
203	643	1	\N	\N	\N	\N	\N	\N
204	644	1	\N	\N	\N	\N	\N	\N
205	654	1	\N	\N	\N	\N	\N	\N
206	656	1	\N	\N	\N	\N	\N	\N
207	659	1	\N	\N	\N	\N	\N	\N
208	660	1	\N	\N	\N	\N	\N	\N
209	666	1	\N	\N	\N	\N	\N	\N
210	680	1	\N	\N	\N	\N	\N	\N
212	699	1	\N	\N	\N	\N	\N	\N
213	702	1	\N	\N	\N	\N	\N	\N
214	703	1	\N	\N	\N	\N	\N	\N
215	706	1	\N	\N	\N	\N	\N	\N
216	707	1	\N	\N	\N	\N	\N	\N
217	708	1	\N	\N	\N	\N	\N	\N
218	719	1	\N	\N	\N	\N	\N	\N
219	720	1	\N	\N	\N	\N	\N	\N
220	723	1	\N	\N	\N	\N	\N	\N
221	730	1	\N	\N	\N	\N	\N	\N
222	733	1	\N	\N	\N	\N	\N	\N
223	734	1	\N	\N	\N	\N	\N	\N
224	747	1	\N	\N	\N	\N	\N	\N
225	760	1	\N	\N	\N	\N	\N	\N
226	764	1	\N	\N	\N	\N	\N	\N
227	766	1	\N	\N	\N	\N	\N	\N
228	778	1	\N	\N	\N	\N	\N	\N
229	781	1	\N	\N	\N	\N	\N	\N
230	785	1	\N	\N	\N	\N	\N	\N
231	788	1	\N	\N	\N	\N	\N	\N
232	789	1	\N	\N	\N	\N	\N	\N
233	795	1	\N	\N	\N	\N	\N	\N
234	796	1	\N	\N	\N	\N	\N	\N
235	797	1	\N	\N	\N	\N	\N	\N
236	799	1	\N	\N	\N	\N	\N	\N
237	812	1	\N	\N	\N	\N	\N	\N
238	813	1	\N	\N	\N	\N	\N	\N
239	815	1	\N	\N	\N	\N	\N	\N
240	818	1	\N	\N	\N	\N	\N	\N
241	819	1	\N	\N	\N	\N	\N	\N
242	823	1	\N	\N	\N	\N	\N	\N
244	814	1	\N	\N	\N	\N	\N	\N
245	831	1	\N	\N	\N	\N	\N	\N
246	833	1	\N	\N	\N	\N	\N	\N
247	836	1	\N	\N	\N	\N	\N	\N
248	837	1	\N	\N	\N	\N	\N	\N
249	841	1	\N	\N	\N	\N	\N	\N
250	853	1	\N	\N	\N	\N	\N	\N
251	855	1	\N	\N	\N	\N	\N	\N
252	857	1	\N	\N	\N	\N	\N	\N
253	859	1	\N	\N	\N	\N	\N	\N
254	869	1	\N	\N	\N	\N	\N	\N
255	870	1	\N	\N	\N	\N	\N	\N
257	890	1	\N	\N	\N	\N	\N	\N
258	892	1	\N	\N	\N	\N	\N	\N
259	894	1	\N	\N	\N	\N	\N	\N
260	895	1	\N	\N	\N	\N	\N	\N
261	898	1	\N	\N	\N	\N	\N	\N
262	911	1	\N	\N	\N	\N	\N	\N
263	912	1	\N	\N	\N	\N	\N	\N
264	914	1	\N	\N	\N	\N	\N	\N
265	916	1	\N	\N	\N	\N	\N	\N
266	918	1	\N	\N	\N	\N	\N	\N
267	920	1	\N	\N	\N	\N	\N	\N
268	921	1	\N	\N	\N	\N	\N	\N
269	924	1	\N	\N	\N	\N	\N	\N
270	933	1	\N	\N	\N	\N	\N	\N
271	934	1	\N	\N	\N	\N	\N	\N
272	938	1	\N	\N	\N	\N	\N	\N
273	939	1	\N	\N	\N	\N	\N	\N
274	945	1	\N	\N	\N	\N	\N	\N
275	948	1	\N	\N	\N	\N	\N	\N
276	951	1	\N	\N	\N	\N	\N	\N
277	954	1	\N	\N	\N	\N	\N	\N
278	959	1	\N	\N	\N	\N	\N	\N
279	960	1	\N	\N	\N	\N	\N	\N
280	964	1	\N	\N	\N	\N	\N	\N
281	965	1	\N	\N	\N	\N	\N	\N
282	977	1	\N	\N	\N	\N	\N	\N
283	978	1	\N	\N	\N	\N	\N	\N
284	983	1	\N	\N	\N	\N	\N	\N
285	986	1	\N	\N	\N	\N	\N	\N
286	988	1	\N	\N	\N	\N	\N	\N
287	990	1	\N	\N	\N	\N	\N	\N
288	992	1	\N	\N	\N	\N	\N	\N
289	993	1	\N	\N	\N	\N	\N	\N
290	994	1	\N	\N	\N	\N	\N	\N
291	998	1	\N	\N	\N	\N	\N	\N
292	999	1	\N	\N	\N	\N	\N	\N
293	1002	1	\N	\N	\N	\N	\N	\N
294	1004	1	\N	\N	\N	\N	\N	\N
295	1008	1	\N	\N	\N	\N	\N	\N
296	1010	1	\N	\N	\N	\N	\N	\N
297	1019	1	\N	\N	\N	\N	\N	\N
298	1020	1	\N	\N	\N	\N	\N	\N
299	1022	1	\N	\N	\N	\N	\N	\N
300	1026	1	\N	\N	\N	\N	\N	\N
302	1028	1	\N	\N	\N	\N	\N	\N
303	1032	1	\N	\N	\N	\N	\N	\N
304	1033	1	\N	\N	\N	\N	\N	\N
305	1035	1	\N	\N	\N	\N	\N	\N
306	1038	1	\N	\N	\N	\N	\N	\N
308	1044	1	\N	\N	\N	\N	\N	\N
309	1050	1	\N	\N	\N	\N	\N	\N
310	1052	1	\N	\N	\N	\N	\N	\N
311	1053	1	\N	\N	\N	\N	\N	\N
312	1058	1	\N	\N	\N	\N	\N	\N
313	1063	1	\N	\N	\N	\N	\N	\N
314	1066	1	\N	\N	\N	\N	\N	\N
307	1042	1	0.0123935000	9801030.0000000000	436358009.0000000000	-0.57	-3.36	-10.81
180	541	1	0.2151940000	716736.0000000000	115268220.0000000000	0.01	-5.12	-10.09
243	825	1	1.0017300000	2193950000.0000000000	2611650698.0000000000	0.01	0.07	-0.25
315	1069	1	\N	\N	\N	\N	\N	\N
316	1070	1	\N	\N	\N	\N	\N	\N
317	1082	1	\N	\N	\N	\N	\N	\N
318	1084	1	\N	\N	\N	\N	\N	\N
319	1085	1	\N	\N	\N	\N	\N	\N
321	1089	1	\N	\N	\N	\N	\N	\N
322	1090	1	\N	\N	\N	\N	\N	\N
323	1093	1	\N	\N	\N	\N	\N	\N
324	1100	1	\N	\N	\N	\N	\N	\N
326	1106	1	\N	\N	\N	\N	\N	\N
327	1107	1	\N	\N	\N	\N	\N	\N
328	1109	1	\N	\N	\N	\N	\N	\N
329	1110	1	\N	\N	\N	\N	\N	\N
330	1111	1	\N	\N	\N	\N	\N	\N
331	1113	1	\N	\N	\N	\N	\N	\N
332	1120	1	\N	\N	\N	\N	\N	\N
333	1123	1	\N	\N	\N	\N	\N	\N
334	1125	1	\N	\N	\N	\N	\N	\N
335	1131	1	\N	\N	\N	\N	\N	\N
336	1135	1	\N	\N	\N	\N	\N	\N
337	1136	1	\N	\N	\N	\N	\N	\N
338	1141	1	\N	\N	\N	\N	\N	\N
339	1146	1	\N	\N	\N	\N	\N	\N
340	1147	1	\N	\N	\N	\N	\N	\N
341	1148	1	\N	\N	\N	\N	\N	\N
342	1153	1	\N	\N	\N	\N	\N	\N
343	1154	1	\N	\N	\N	\N	\N	\N
344	1156	1	\N	\N	\N	\N	\N	\N
345	1159	1	\N	\N	\N	\N	\N	\N
346	1164	1	\N	\N	\N	\N	\N	\N
347	1155	1	\N	\N	\N	\N	\N	\N
348	1165	1	\N	\N	\N	\N	\N	\N
350	1175	1	\N	\N	\N	\N	\N	\N
351	1176	1	\N	\N	\N	\N	\N	\N
352	1172	1	\N	\N	\N	\N	\N	\N
354	1180	1	\N	\N	\N	\N	\N	\N
355	1193	1	\N	\N	\N	\N	\N	\N
356	1194	1	\N	\N	\N	\N	\N	\N
357	1182	1	\N	\N	\N	\N	\N	\N
358	1191	1	\N	\N	\N	\N	\N	\N
359	1185	1	\N	\N	\N	\N	\N	\N
360	1195	1	\N	\N	\N	\N	\N	\N
361	1208	1	\N	\N	\N	\N	\N	\N
362	1206	1	\N	\N	\N	\N	\N	\N
363	1200	1	\N	\N	\N	\N	\N	\N
364	1198	1	\N	\N	\N	\N	\N	\N
365	1209	1	\N	\N	\N	\N	\N	\N
366	1210	1	\N	\N	\N	\N	\N	\N
367	1212	1	\N	\N	\N	\N	\N	\N
368	1213	1	\N	\N	\N	\N	\N	\N
370	1216	1	\N	\N	\N	\N	\N	\N
371	1218	1	\N	\N	\N	\N	\N	\N
372	1226	1	\N	\N	\N	\N	\N	\N
374	1234	1	\N	\N	\N	\N	\N	\N
375	1241	1	\N	\N	\N	\N	\N	\N
376	1223	1	\N	\N	\N	\N	\N	\N
377	1238	1	\N	\N	\N	\N	\N	\N
378	1244	1	\N	\N	\N	\N	\N	\N
379	1249	1	\N	\N	\N	\N	\N	\N
380	1248	1	\N	\N	\N	\N	\N	\N
381	1250	1	\N	\N	\N	\N	\N	\N
382	1247	1	\N	\N	\N	\N	\N	\N
384	1251	1	\N	\N	\N	\N	\N	\N
385	1256	1	\N	\N	\N	\N	\N	\N
386	1257	1	\N	\N	\N	\N	\N	\N
387	1252	1	\N	\N	\N	\N	\N	\N
388	1254	1	\N	\N	\N	\N	\N	\N
389	1259	1	\N	\N	\N	\N	\N	\N
390	1271	1	\N	\N	\N	\N	\N	\N
391	1264	1	\N	\N	\N	\N	\N	\N
392	1268	1	\N	\N	\N	\N	\N	\N
393	1266	1	\N	\N	\N	\N	\N	\N
394	1269	1	\N	\N	\N	\N	\N	\N
396	1281	1	\N	\N	\N	\N	\N	\N
397	1275	1	\N	\N	\N	\N	\N	\N
398	1276	1	\N	\N	\N	\N	\N	\N
399	1279	1	\N	\N	\N	\N	\N	\N
400	1282	1	\N	\N	\N	\N	\N	\N
401	1288	1	\N	\N	\N	\N	\N	\N
402	1283	1	\N	\N	\N	\N	\N	\N
403	1284	1	\N	\N	\N	\N	\N	\N
404	1285	1	\N	\N	\N	\N	\N	\N
405	1286	1	\N	\N	\N	\N	\N	\N
406	1291	1	\N	\N	\N	\N	\N	\N
407	1294	1	\N	\N	\N	\N	\N	\N
408	1297	1	\N	\N	\N	\N	\N	\N
409	1298	1	\N	\N	\N	\N	\N	\N
410	1299	1	\N	\N	\N	\N	\N	\N
411	1303	1	\N	\N	\N	\N	\N	\N
412	1304	1	\N	\N	\N	\N	\N	\N
413	1306	1	\N	\N	\N	\N	\N	\N
414	1308	1	\N	\N	\N	\N	\N	\N
415	1309	1	\N	\N	\N	\N	\N	\N
416	1312	1	\N	\N	\N	\N	\N	\N
417	1323	1	\N	\N	\N	\N	\N	\N
418	1322	1	\N	\N	\N	\N	\N	\N
421	1334	1	\N	\N	\N	\N	\N	\N
422	1348	1	\N	\N	\N	\N	\N	\N
423	1340	1	\N	\N	\N	\N	\N	\N
424	1336	1	\N	\N	\N	\N	\N	\N
426	1341	1	\N	\N	\N	\N	\N	\N
427	1351	1	\N	\N	\N	\N	\N	\N
428	1358	1	\N	\N	\N	\N	\N	\N
429	1353	1	\N	\N	\N	\N	\N	\N
430	1357	1	\N	\N	\N	\N	\N	\N
431	1352	1	\N	\N	\N	\N	\N	\N
432	1361	1	\N	\N	\N	\N	\N	\N
433	1367	1	\N	\N	\N	\N	\N	\N
434	1368	1	\N	\N	\N	\N	\N	\N
436	1375	1	\N	\N	\N	\N	\N	\N
437	1371	1	\N	\N	\N	\N	\N	\N
438	1379	1	\N	\N	\N	\N	\N	\N
439	1380	1	\N	\N	\N	\N	\N	\N
440	1381	1	\N	\N	\N	\N	\N	\N
441	1382	1	\N	\N	\N	\N	\N	\N
442	1387	1	\N	\N	\N	\N	\N	\N
443	1391	1	\N	\N	\N	\N	\N	\N
444	1392	1	\N	\N	\N	\N	\N	\N
445	1389	1	\N	\N	\N	\N	\N	\N
446	1395	1	\N	\N	\N	\N	\N	\N
447	1390	1	\N	\N	\N	\N	\N	\N
448	1396	1	\N	\N	\N	\N	\N	\N
449	1398	1	\N	\N	\N	\N	\N	\N
450	1399	1	\N	\N	\N	\N	\N	\N
451	1397	1	\N	\N	\N	\N	\N	\N
452	1400	1	\N	\N	\N	\N	\N	\N
453	1405	1	\N	\N	\N	\N	\N	\N
454	1393	1	\N	\N	\N	\N	\N	\N
455	1403	1	\N	\N	\N	\N	\N	\N
456	1409	1	\N	\N	\N	\N	\N	\N
458	1408	1	\N	\N	\N	\N	\N	\N
459	1418	1	\N	\N	\N	\N	\N	\N
460	1420	1	\N	\N	\N	\N	\N	\N
461	1421	1	\N	\N	\N	\N	\N	\N
462	1423	1	\N	\N	\N	\N	\N	\N
463	1425	1	\N	\N	\N	\N	\N	\N
464	1429	1	\N	\N	\N	\N	\N	\N
465	1434	1	\N	\N	\N	\N	\N	\N
466	1435	1	\N	\N	\N	\N	\N	\N
467	1436	1	\N	\N	\N	\N	\N	\N
469	1438	1	\N	\N	\N	\N	\N	\N
470	1439	1	\N	\N	\N	\N	\N	\N
471	1442	1	\N	\N	\N	\N	\N	\N
457	1414	1	19.7240000000	400139.0000000000	99020361.0000000000	1.78	-1.82	-8.29
383	1230	1	1.5459300000	1779890.0000000000	406006177.0000000000	0.45	-3.22	-11.29
420	1320	1	0.1726390000	1223340.0000000000	172466274.0000000000	0.72	-3.59	-10.86
349	1169	1	2.3471100000	976439.0000000000	132724721.0000000000	-0.64	-5.39	-13.96
373	1229	1	111.7220000000	504129.0000000000	223444000.0000000000	0.04	-3.96	-4.87
472	1447	1	\N	\N	\N	\N	\N	\N
473	1448	1	\N	\N	\N	\N	\N	\N
474	1449	1	\N	\N	\N	\N	\N	\N
475	1454	1	\N	\N	\N	\N	\N	\N
477	1456	1	\N	\N	\N	\N	\N	\N
478	1457	1	\N	\N	\N	\N	\N	\N
479	1459	1	\N	\N	\N	\N	\N	\N
480	1463	1	\N	\N	\N	\N	\N	\N
481	1464	1	\N	\N	\N	\N	\N	\N
482	1465	1	\N	\N	\N	\N	\N	\N
483	1466	1	\N	\N	\N	\N	\N	\N
484	1468	1	\N	\N	\N	\N	\N	\N
485	1469	1	\N	\N	\N	\N	\N	\N
486	1472	1	\N	\N	\N	\N	\N	\N
487	1473	1	\N	\N	\N	\N	\N	\N
488	1474	1	\N	\N	\N	\N	\N	\N
489	1475	1	\N	\N	\N	\N	\N	\N
490	1481	1	\N	\N	\N	\N	\N	\N
491	1483	1	\N	\N	\N	\N	\N	\N
492	1485	1	\N	\N	\N	\N	\N	\N
493	1478	1	\N	\N	\N	\N	\N	\N
494	1480	1	\N	\N	\N	\N	\N	\N
495	1486	1	\N	\N	\N	\N	\N	\N
496	1492	1	\N	\N	\N	\N	\N	\N
497	1495	1	\N	\N	\N	\N	\N	\N
498	1489	1	\N	\N	\N	\N	\N	\N
499	1487	1	\N	\N	\N	\N	\N	\N
500	1500	1	\N	\N	\N	\N	\N	\N
501	1502	1	\N	\N	\N	\N	\N	\N
502	1503	1	\N	\N	\N	\N	\N	\N
503	1496	1	\N	\N	\N	\N	\N	\N
504	1501	1	\N	\N	\N	\N	\N	\N
505	1497	1	\N	\N	\N	\N	\N	\N
506	1504	1	\N	\N	\N	\N	\N	\N
507	1506	1	\N	\N	\N	\N	\N	\N
508	1505	1	\N	\N	\N	\N	\N	\N
509	1507	1	\N	\N	\N	\N	\N	\N
510	1509	1	\N	\N	\N	\N	\N	\N
511	1514	1	\N	\N	\N	\N	\N	\N
512	1515	1	\N	\N	\N	\N	\N	\N
514	1510	1	\N	\N	\N	\N	\N	\N
515	1513	1	\N	\N	\N	\N	\N	\N
516	1511	1	\N	\N	\N	\N	\N	\N
517	1520	1	\N	\N	\N	\N	\N	\N
518	1523	1	\N	\N	\N	\N	\N	\N
520	1522	1	\N	\N	\N	\N	\N	\N
521	1525	1	\N	\N	\N	\N	\N	\N
522	1526	1	\N	\N	\N	\N	\N	\N
523	1527	1	\N	\N	\N	\N	\N	\N
524	1528	1	\N	\N	\N	\N	\N	\N
525	1524	1	\N	\N	\N	\N	\N	\N
526	1529	1	\N	\N	\N	\N	\N	\N
527	1531	1	\N	\N	\N	\N	\N	\N
528	1533	1	\N	\N	\N	\N	\N	\N
529	1534	1	\N	\N	\N	\N	\N	\N
530	1535	1	\N	\N	\N	\N	\N	\N
531	1539	1	\N	\N	\N	\N	\N	\N
532	1542	1	\N	\N	\N	\N	\N	\N
533	1544	1	\N	\N	\N	\N	\N	\N
534	1550	1	\N	\N	\N	\N	\N	\N
535	1548	1	\N	\N	\N	\N	\N	\N
536	1546	1	\N	\N	\N	\N	\N	\N
537	1555	1	\N	\N	\N	\N	\N	\N
538	1552	1	\N	\N	\N	\N	\N	\N
539	1558	1	\N	\N	\N	\N	\N	\N
540	1556	1	\N	\N	\N	\N	\N	\N
541	1554	1	\N	\N	\N	\N	\N	\N
542	1562	1	\N	\N	\N	\N	\N	\N
543	1563	1	\N	\N	\N	\N	\N	\N
544	1561	1	\N	\N	\N	\N	\N	\N
545	1559	1	\N	\N	\N	\N	\N	\N
546	1566	1	\N	\N	\N	\N	\N	\N
548	1565	1	\N	\N	\N	\N	\N	\N
549	1568	1	\N	\N	\N	\N	\N	\N
550	1570	1	\N	\N	\N	\N	\N	\N
551	1575	1	\N	\N	\N	\N	\N	\N
552	1576	1	\N	\N	\N	\N	\N	\N
553	1577	1	\N	\N	\N	\N	\N	\N
554	1578	1	\N	\N	\N	\N	\N	\N
555	1579	1	\N	\N	\N	\N	\N	\N
556	1581	1	\N	\N	\N	\N	\N	\N
557	1582	1	\N	\N	\N	\N	\N	\N
559	1587	1	\N	\N	\N	\N	\N	\N
560	1588	1	\N	\N	\N	\N	\N	\N
561	1590	1	\N	\N	\N	\N	\N	\N
562	1592	1	\N	\N	\N	\N	\N	\N
563	1596	1	\N	\N	\N	\N	\N	\N
564	1597	1	\N	\N	\N	\N	\N	\N
565	1598	1	\N	\N	\N	\N	\N	\N
566	1595	1	\N	\N	\N	\N	\N	\N
567	1605	1	\N	\N	\N	\N	\N	\N
568	1606	1	\N	\N	\N	\N	\N	\N
569	1607	1	\N	\N	\N	\N	\N	\N
570	1602	1	\N	\N	\N	\N	\N	\N
571	1603	1	\N	\N	\N	\N	\N	\N
572	1609	1	\N	\N	\N	\N	\N	\N
573	1611	1	\N	\N	\N	\N	\N	\N
574	1614	1	\N	\N	\N	\N	\N	\N
575	1608	1	\N	\N	\N	\N	\N	\N
576	1610	1	\N	\N	\N	\N	\N	\N
577	1616	1	\N	\N	\N	\N	\N	\N
578	1624	1	\N	\N	\N	\N	\N	\N
579	1619	1	\N	\N	\N	\N	\N	\N
580	1623	1	\N	\N	\N	\N	\N	\N
581	1617	1	\N	\N	\N	\N	\N	\N
582	1618	1	\N	\N	\N	\N	\N	\N
583	1625	1	\N	\N	\N	\N	\N	\N
584	1629	1	\N	\N	\N	\N	\N	\N
585	1630	1	\N	\N	\N	\N	\N	\N
586	1626	1	\N	\N	\N	\N	\N	\N
587	1628	1	\N	\N	\N	\N	\N	\N
588	1631	1	\N	\N	\N	\N	\N	\N
589	1638	1	\N	\N	\N	\N	\N	\N
590	1640	1	\N	\N	\N	\N	\N	\N
591	1632	1	\N	\N	\N	\N	\N	\N
592	1636	1	\N	\N	\N	\N	\N	\N
593	1637	1	\N	\N	\N	\N	\N	\N
594	1642	1	\N	\N	\N	\N	\N	\N
595	1650	1	\N	\N	\N	\N	\N	\N
596	1644	1	\N	\N	\N	\N	\N	\N
597	1643	1	\N	\N	\N	\N	\N	\N
598	1647	1	\N	\N	\N	\N	\N	\N
599	1651	1	\N	\N	\N	\N	\N	\N
600	1660	1	\N	\N	\N	\N	\N	\N
601	1657	1	\N	\N	\N	\N	\N	\N
602	1659	1	\N	\N	\N	\N	\N	\N
603	1654	1	\N	\N	\N	\N	\N	\N
604	1658	1	\N	\N	\N	\N	\N	\N
605	1662	1	\N	\N	\N	\N	\N	\N
606	1671	1	\N	\N	\N	\N	\N	\N
607	1665	1	\N	\N	\N	\N	\N	\N
608	1669	1	\N	\N	\N	\N	\N	\N
609	1670	1	\N	\N	\N	\N	\N	\N
610	1673	1	\N	\N	\N	\N	\N	\N
611	1678	1	\N	\N	\N	\N	\N	\N
612	1679	1	\N	\N	\N	\N	\N	\N
613	1674	1	\N	\N	\N	\N	\N	\N
614	1677	1	\N	\N	\N	\N	\N	\N
615	1676	1	\N	\N	\N	\N	\N	\N
616	1680	1	\N	\N	\N	\N	\N	\N
617	1685	1	\N	\N	\N	\N	\N	\N
618	1681	1	\N	\N	\N	\N	\N	\N
619	1683	1	\N	\N	\N	\N	\N	\N
621	1686	1	\N	\N	\N	\N	\N	\N
622	1693	1	\N	\N	\N	\N	\N	\N
623	1690	1	\N	\N	\N	\N	\N	\N
624	1687	1	\N	\N	\N	\N	\N	\N
625	1688	1	\N	\N	\N	\N	\N	\N
626	1691	1	\N	\N	\N	\N	\N	\N
627	1694	1	\N	\N	\N	\N	\N	\N
628	1699	1	\N	\N	\N	\N	\N	\N
513	1518	1	566.8090000000	35769.6000000000	350417064.0000000000	0.08	-1.91	-7.70
519	1521	1	1.7604700000	391453.0000000000	183535996.0000000000	-0.70	-6.30	-12.71
629	1695	1	\N	\N	\N	\N	\N	\N
631	1698	1	\N	\N	\N	\N	\N	\N
633	1702	1	\N	\N	\N	\N	\N	\N
634	1703	1	\N	\N	\N	\N	\N	\N
635	1706	1	\N	\N	\N	\N	\N	\N
636	1707	1	\N	\N	\N	\N	\N	\N
637	1708	1	\N	\N	\N	\N	\N	\N
638	1709	1	\N	\N	\N	\N	\N	\N
640	1711	1	\N	\N	\N	\N	\N	\N
641	1704	1	\N	\N	\N	\N	\N	\N
642	1712	1	\N	\N	\N	\N	\N	\N
643	1717	1	\N	\N	\N	\N	\N	\N
644	1716	1	\N	\N	\N	\N	\N	\N
645	1715	1	\N	\N	\N	\N	\N	\N
646	1714	1	\N	\N	\N	\N	\N	\N
647	1719	1	\N	\N	\N	\N	\N	\N
648	1724	1	\N	\N	\N	\N	\N	\N
649	1723	1	\N	\N	\N	\N	\N	\N
651	1721	1	\N	\N	\N	\N	\N	\N
652	1722	1	\N	\N	\N	\N	\N	\N
653	1726	1	\N	\N	\N	\N	\N	\N
654	1731	1	\N	\N	\N	\N	\N	\N
655	1728	1	\N	\N	\N	\N	\N	\N
656	1729	1	\N	\N	\N	\N	\N	\N
658	1739	1	\N	\N	\N	\N	\N	\N
659	1732	1	\N	\N	\N	\N	\N	\N
660	1733	1	\N	\N	\N	\N	\N	\N
661	1736	1	\N	\N	\N	\N	\N	\N
662	1737	1	\N	\N	\N	\N	\N	\N
663	1738	1	\N	\N	\N	\N	\N	\N
664	1745	1	\N	\N	\N	\N	\N	\N
665	1741	1	\N	\N	\N	\N	\N	\N
666	1743	1	\N	\N	\N	\N	\N	\N
667	1742	1	\N	\N	\N	\N	\N	\N
668	1746	1	\N	\N	\N	\N	\N	\N
669	1748	1	\N	\N	\N	\N	\N	\N
670	1747	1	\N	\N	\N	\N	\N	\N
671	1753	1	\N	\N	\N	\N	\N	\N
673	1752	1	\N	\N	\N	\N	\N	\N
675	1755	1	\N	\N	\N	\N	\N	\N
676	1756	1	\N	\N	\N	\N	\N	\N
677	1754	1	\N	\N	\N	\N	\N	\N
678	1758	1	\N	\N	\N	\N	\N	\N
680	1760	1	\N	\N	\N	\N	\N	\N
681	1762	1	\N	\N	\N	\N	\N	\N
682	1763	1	\N	\N	\N	\N	\N	\N
684	1767	1	\N	\N	\N	\N	\N	\N
685	1772	1	\N	\N	\N	\N	\N	\N
686	1773	1	\N	\N	\N	\N	\N	\N
687	1769	1	\N	\N	\N	\N	\N	\N
688	1771	1	\N	\N	\N	\N	\N	\N
689	1768	1	\N	\N	\N	\N	\N	\N
690	1774	1	\N	\N	\N	\N	\N	\N
691	1777	1	\N	\N	\N	\N	\N	\N
692	1778	1	\N	\N	\N	\N	\N	\N
693	1776	1	\N	\N	\N	\N	\N	\N
694	1775	1	\N	\N	\N	\N	\N	\N
695	1779	1	\N	\N	\N	\N	\N	\N
697	1781	1	\N	\N	\N	\N	\N	\N
698	1784	1	\N	\N	\N	\N	\N	\N
699	1782	1	\N	\N	\N	\N	\N	\N
700	1783	1	\N	\N	\N	\N	\N	\N
701	1786	1	\N	\N	\N	\N	\N	\N
702	1790	1	\N	\N	\N	\N	\N	\N
703	1788	1	\N	\N	\N	\N	\N	\N
704	1787	1	\N	\N	\N	\N	\N	\N
706	1792	1	\N	\N	\N	\N	\N	\N
707	1799	1	\N	\N	\N	\N	\N	\N
708	1798	1	\N	\N	\N	\N	\N	\N
709	1793	1	\N	\N	\N	\N	\N	\N
710	1797	1	\N	\N	\N	\N	\N	\N
711	1795	1	\N	\N	\N	\N	\N	\N
712	1801	1	\N	\N	\N	\N	\N	\N
713	1803	1	\N	\N	\N	\N	\N	\N
714	1805	1	\N	\N	\N	\N	\N	\N
715	1807	1	\N	\N	\N	\N	\N	\N
716	1814	1	\N	\N	\N	\N	\N	\N
717	1815	1	\N	\N	\N	\N	\N	\N
719	1812	1	\N	\N	\N	\N	\N	\N
720	1810	1	\N	\N	\N	\N	\N	\N
721	1811	1	\N	\N	\N	\N	\N	\N
722	1809	1	\N	\N	\N	\N	\N	\N
723	1818	1	\N	\N	\N	\N	\N	\N
724	1816	1	\N	\N	\N	\N	\N	\N
727	1819	1	\N	\N	\N	\N	\N	\N
728	1830	1	\N	\N	\N	\N	\N	\N
729	1826	1	\N	\N	\N	\N	\N	\N
730	1828	1	\N	\N	\N	\N	\N	\N
731	1824	1	\N	\N	\N	\N	\N	\N
732	1825	1	\N	\N	\N	\N	\N	\N
733	1834	1	\N	\N	\N	\N	\N	\N
734	1832	1	\N	\N	\N	\N	\N	\N
735	1833	1	\N	\N	\N	\N	\N	\N
736	1835	1	\N	\N	\N	\N	\N	\N
738	1836	1	\N	\N	\N	\N	\N	\N
739	1837	1	\N	\N	\N	\N	\N	\N
740	1838	1	\N	\N	\N	\N	\N	\N
741	1840	1	\N	\N	\N	\N	\N	\N
742	1841	1	\N	\N	\N	\N	\N	\N
743	1845	1	\N	\N	\N	\N	\N	\N
744	1842	1	\N	\N	\N	\N	\N	\N
745	1843	1	\N	\N	\N	\N	\N	\N
746	1846	1	\N	\N	\N	\N	\N	\N
747	1850	1	\N	\N	\N	\N	\N	\N
748	1849	1	\N	\N	\N	\N	\N	\N
749	1848	1	\N	\N	\N	\N	\N	\N
750	1847	1	\N	\N	\N	\N	\N	\N
751	1851	1	\N	\N	\N	\N	\N	\N
752	1852	1	\N	\N	\N	\N	\N	\N
753	1861	1	\N	\N	\N	\N	\N	\N
754	1853	1	\N	\N	\N	\N	\N	\N
755	1856	1	\N	\N	\N	\N	\N	\N
756	1857	1	\N	\N	\N	\N	\N	\N
757	1863	1	\N	\N	\N	\N	\N	\N
758	1864	1	\N	\N	\N	\N	\N	\N
759	1865	1	\N	\N	\N	\N	\N	\N
761	1869	1	\N	\N	\N	\N	\N	\N
762	1871	1	\N	\N	\N	\N	\N	\N
763	1872	1	\N	\N	\N	\N	\N	\N
764	1873	1	\N	\N	\N	\N	\N	\N
766	1877	1	\N	\N	\N	\N	\N	\N
767	1881	1	\N	\N	\N	\N	\N	\N
768	1883	1	\N	\N	\N	\N	\N	\N
769	1878	1	\N	\N	\N	\N	\N	\N
770	1882	1	\N	\N	\N	\N	\N	\N
771	1884	1	\N	\N	\N	\N	\N	\N
772	1889	1	\N	\N	\N	\N	\N	\N
773	1885	1	\N	\N	\N	\N	\N	\N
774	1887	1	\N	\N	\N	\N	\N	\N
775	1888	1	\N	\N	\N	\N	\N	\N
776	1886	1	\N	\N	\N	\N	\N	\N
777	1898	1	\N	\N	\N	\N	\N	\N
778	1890	1	\N	\N	\N	\N	\N	\N
779	1894	1	\N	\N	\N	\N	\N	\N
780	1897	1	\N	\N	\N	\N	\N	\N
782	1899	1	\N	\N	\N	\N	\N	\N
785	1902	1	\N	\N	\N	\N	\N	\N
650	1720	1	1.1333500000	47599100.0000000000	3150180646.0000000000	-0.03	-3.32	-10.63
705	1789	1	7.2456000000	5018840.0000000000	268116377.0000000000	-0.30	-6.73	-17.59
784	1903	1	5.4162900000	21201000.0000000000	233653058.0000000000	0.27	-6.21	-6.51
672	1750	1	2.9124400000	22205100.0000000000	174746400.0000000000	-0.38	-5.96	-14.22
696	1785	1	12.8268000000	3519840.0000000000	129914642.0000000000	-0.25	-5.40	-8.48
725	1817	1	1.4886700000	2029680.0000000000	114408888.0000000000	1.34	-5.96	-20.88
632	1700	1	2.4451800000	6708200.0000000000	569776998.0000000000	-0.35	-5.16	-8.07
765	1876	1	0.0004321850	52409.5000000000	140558064.0000000000	1.09	-2.07	-5.34
718	1808	1	8.9402100000	16092600.0000000000	912281842.0000000000	0.22	-2.69	-4.62
786	1900	1	\N	\N	\N	\N	\N	\N
787	1905	1	\N	\N	\N	\N	\N	\N
788	1913	1	\N	\N	\N	\N	\N	\N
789	1910	1	\N	\N	\N	\N	\N	\N
790	1912	1	\N	\N	\N	\N	\N	\N
791	1907	1	\N	\N	\N	\N	\N	\N
793	1915	1	\N	\N	\N	\N	\N	\N
794	1920	1	\N	\N	\N	\N	\N	\N
795	1917	1	\N	\N	\N	\N	\N	\N
796	1918	1	\N	\N	\N	\N	\N	\N
797	1916	1	\N	\N	\N	\N	\N	\N
798	1921	1	\N	\N	\N	\N	\N	\N
799	1927	1	\N	\N	\N	\N	\N	\N
800	1926	1	\N	\N	\N	\N	\N	\N
801	1923	1	\N	\N	\N	\N	\N	\N
802	1922	1	\N	\N	\N	\N	\N	\N
804	1930	1	\N	\N	\N	\N	\N	\N
805	1935	1	\N	\N	\N	\N	\N	\N
806	1931	1	\N	\N	\N	\N	\N	\N
808	1933	1	\N	\N	\N	\N	\N	\N
809	1937	1	\N	\N	\N	\N	\N	\N
810	1938	1	\N	\N	\N	\N	\N	\N
811	1943	1	\N	\N	\N	\N	\N	\N
812	1945	1	\N	\N	\N	\N	\N	\N
813	1942	1	\N	\N	\N	\N	\N	\N
814	1946	1	\N	\N	\N	\N	\N	\N
815	1947	1	\N	\N	\N	\N	\N	\N
816	1948	1	\N	\N	\N	\N	\N	\N
817	1949	1	\N	\N	\N	\N	\N	\N
818	1950	1	\N	\N	\N	\N	\N	\N
819	1951	1	\N	\N	\N	\N	\N	\N
820	1952	1	\N	\N	\N	\N	\N	\N
821	1954	1	\N	\N	\N	\N	\N	\N
822	1955	1	\N	\N	\N	\N	\N	\N
823	1956	1	\N	\N	\N	\N	\N	\N
825	1964	1	\N	\N	\N	\N	\N	\N
826	1962	1	\N	\N	\N	\N	\N	\N
827	1963	1	\N	\N	\N	\N	\N	\N
828	1961	1	\N	\N	\N	\N	\N	\N
829	1959	1	\N	\N	\N	\N	\N	\N
830	1965	1	\N	\N	\N	\N	\N	\N
831	1969	1	\N	\N	\N	\N	\N	\N
832	1968	1	\N	\N	\N	\N	\N	\N
833	1967	1	\N	\N	\N	\N	\N	\N
835	1970	1	\N	\N	\N	\N	\N	\N
836	1976	1	\N	\N	\N	\N	\N	\N
837	1974	1	\N	\N	\N	\N	\N	\N
838	1971	1	\N	\N	\N	\N	\N	\N
839	1975	1	\N	\N	\N	\N	\N	\N
840	1973	1	\N	\N	\N	\N	\N	\N
841	1979	1	\N	\N	\N	\N	\N	\N
842	1983	1	\N	\N	\N	\N	\N	\N
844	1981	1	\N	\N	\N	\N	\N	\N
845	1980	1	\N	\N	\N	\N	\N	\N
847	1989	1	\N	\N	\N	\N	\N	\N
848	1985	1	\N	\N	\N	\N	\N	\N
849	1988	1	\N	\N	\N	\N	\N	\N
850	1986	1	\N	\N	\N	\N	\N	\N
851	1987	1	\N	\N	\N	\N	\N	\N
852	1990	1	\N	\N	\N	\N	\N	\N
853	1995	1	\N	\N	\N	\N	\N	\N
854	1994	1	\N	\N	\N	\N	\N	\N
855	1991	1	\N	\N	\N	\N	\N	\N
857	1996	1	\N	\N	\N	\N	\N	\N
858	2002	1	\N	\N	\N	\N	\N	\N
859	2000	1	\N	\N	\N	\N	\N	\N
860	1999	1	\N	\N	\N	\N	\N	\N
861	1998	1	\N	\N	\N	\N	\N	\N
862	2001	1	\N	\N	\N	\N	\N	\N
863	2004	1	\N	\N	\N	\N	\N	\N
864	2008	1	\N	\N	\N	\N	\N	\N
865	2005	1	\N	\N	\N	\N	\N	\N
866	2007	1	\N	\N	\N	\N	\N	\N
867	2006	1	\N	\N	\N	\N	\N	\N
868	2009	1	\N	\N	\N	\N	\N	\N
869	2015	1	\N	\N	\N	\N	\N	\N
871	2012	1	\N	\N	\N	\N	\N	\N
872	2013	1	\N	\N	\N	\N	\N	\N
873	2011	1	\N	\N	\N	\N	\N	\N
874	2017	1	\N	\N	\N	\N	\N	\N
875	2022	1	\N	\N	\N	\N	\N	\N
876	2018	1	\N	\N	\N	\N	\N	\N
877	2019	1	\N	\N	\N	\N	\N	\N
879	2024	1	\N	\N	\N	\N	\N	\N
880	2030	1	\N	\N	\N	\N	\N	\N
881	2026	1	\N	\N	\N	\N	\N	\N
882	2025	1	\N	\N	\N	\N	\N	\N
883	2029	1	\N	\N	\N	\N	\N	\N
885	2031	1	\N	\N	\N	\N	\N	\N
886	2036	1	\N	\N	\N	\N	\N	\N
887	2032	1	\N	\N	\N	\N	\N	\N
888	2033	1	\N	\N	\N	\N	\N	\N
889	2034	1	\N	\N	\N	\N	\N	\N
890	2037	1	\N	\N	\N	\N	\N	\N
891	2042	1	\N	\N	\N	\N	\N	\N
892	2039	1	\N	\N	\N	\N	\N	\N
893	2040	1	\N	\N	\N	\N	\N	\N
894	2038	1	\N	\N	\N	\N	\N	\N
895	2041	1	\N	\N	\N	\N	\N	\N
896	2043	1	\N	\N	\N	\N	\N	\N
897	2047	1	\N	\N	\N	\N	\N	\N
899	2046	1	\N	\N	\N	\N	\N	\N
900	2045	1	\N	\N	\N	\N	\N	\N
901	2048	1	\N	\N	\N	\N	\N	\N
902	2054	1	\N	\N	\N	\N	\N	\N
903	2051	1	\N	\N	\N	\N	\N	\N
904	2049	1	\N	\N	\N	\N	\N	\N
905	2050	1	\N	\N	\N	\N	\N	\N
906	2053	1	\N	\N	\N	\N	\N	\N
907	2055	1	\N	\N	\N	\N	\N	\N
908	2059	1	\N	\N	\N	\N	\N	\N
909	2056	1	\N	\N	\N	\N	\N	\N
910	2057	1	\N	\N	\N	\N	\N	\N
911	2058	1	\N	\N	\N	\N	\N	\N
912	2060	1	\N	\N	\N	\N	\N	\N
913	2065	1	\N	\N	\N	\N	\N	\N
914	2061	1	\N	\N	\N	\N	\N	\N
916	2063	1	\N	\N	\N	\N	\N	\N
917	2064	1	\N	\N	\N	\N	\N	\N
918	2066	1	\N	\N	\N	\N	\N	\N
919	2071	1	\N	\N	\N	\N	\N	\N
920	2069	1	\N	\N	\N	\N	\N	\N
921	2067	1	\N	\N	\N	\N	\N	\N
922	2070	1	\N	\N	\N	\N	\N	\N
923	2072	1	\N	\N	\N	\N	\N	\N
924	2079	1	\N	\N	\N	\N	\N	\N
925	2076	1	\N	\N	\N	\N	\N	\N
926	2077	1	\N	\N	\N	\N	\N	\N
927	2074	1	\N	\N	\N	\N	\N	\N
928	2078	1	\N	\N	\N	\N	\N	\N
929	2080	1	\N	\N	\N	\N	\N	\N
930	2082	1	\N	\N	\N	\N	\N	\N
931	2081	1	\N	\N	\N	\N	\N	\N
934	2089	1	\N	\N	\N	\N	\N	\N
935	2090	1	\N	\N	\N	\N	\N	\N
936	2091	1	\N	\N	\N	\N	\N	\N
937	2088	1	\N	\N	\N	\N	\N	\N
939	2093	1	\N	\N	\N	\N	\N	\N
940	2094	1	\N	\N	\N	\N	\N	\N
941	2096	1	\N	\N	\N	\N	\N	\N
942	2095	1	\N	\N	\N	\N	\N	\N
932	2083	1	31.1640000000	10737800.0000000000	532288477.0000000000	-0.39	-4.06	-8.51
792	1908	1	5.2939100000	33416600.0000000000	240872905.0000000000	-0.35	-3.03	-4.39
884	2027	1	3.8251300000	1359580.0000000000	173405249.0000000000	-0.15	-2.25	0.82
843	1982	1	0.9540840000	4961050.0000000000	127973860.0000000000	0.81	-3.83	-7.45
856	1993	1	0.0001433980	324628.0000000000	108422878.0000000000	-0.76	-3.74	-8.03
915	2062	1	1.2958300000	2254030.0000000000	217026354.0000000000	-0.43	-5.27	-17.12
943	2098	1	\N	\N	\N	\N	\N	\N
944	2101	1	\N	\N	\N	\N	\N	\N
946	2103	1	\N	\N	\N	\N	\N	\N
947	2100	1	\N	\N	\N	\N	\N	\N
948	2106	1	\N	\N	\N	\N	\N	\N
949	2104	1	\N	\N	\N	\N	\N	\N
950	2105	1	\N	\N	\N	\N	\N	\N
951	2109	1	\N	\N	\N	\N	\N	\N
952	2110	1	\N	\N	\N	\N	\N	\N
953	2107	1	\N	\N	\N	\N	\N	\N
954	2112	1	\N	\N	\N	\N	\N	\N
955	2114	1	\N	\N	\N	\N	\N	\N
956	2115	1	\N	\N	\N	\N	\N	\N
957	2118	1	\N	\N	\N	\N	\N	\N
958	2119	1	\N	\N	\N	\N	\N	\N
959	2120	1	\N	\N	\N	\N	\N	\N
960	2117	1	\N	\N	\N	\N	\N	\N
961	2122	1	\N	\N	\N	\N	\N	\N
962	2123	1	\N	\N	\N	\N	\N	\N
963	2124	1	\N	\N	\N	\N	\N	\N
964	2125	1	\N	\N	\N	\N	\N	\N
965	2126	1	\N	\N	\N	\N	\N	\N
966	2127	1	\N	\N	\N	\N	\N	\N
967	2129	1	\N	\N	\N	\N	\N	\N
968	2130	1	\N	\N	\N	\N	\N	\N
969	2132	1	\N	\N	\N	\N	\N	\N
970	2134	1	\N	\N	\N	\N	\N	\N
971	2135	1	\N	\N	\N	\N	\N	\N
972	2136	1	\N	\N	\N	\N	\N	\N
973	2137	1	\N	\N	\N	\N	\N	\N
974	2138	1	\N	\N	\N	\N	\N	\N
975	2139	1	\N	\N	\N	\N	\N	\N
976	2140	1	\N	\N	\N	\N	\N	\N
977	2142	1	\N	\N	\N	\N	\N	\N
978	2143	1	\N	\N	\N	\N	\N	\N
979	2144	1	\N	\N	\N	\N	\N	\N
980	2146	1	\N	\N	\N	\N	\N	\N
981	2147	1	\N	\N	\N	\N	\N	\N
982	2148	1	\N	\N	\N	\N	\N	\N
983	2149	1	\N	\N	\N	\N	\N	\N
984	2150	1	\N	\N	\N	\N	\N	\N
985	2151	1	\N	\N	\N	\N	\N	\N
986	2152	1	\N	\N	\N	\N	\N	\N
987	2153	1	\N	\N	\N	\N	\N	\N
988	2157	1	\N	\N	\N	\N	\N	\N
989	2158	1	\N	\N	\N	\N	\N	\N
990	2159	1	\N	\N	\N	\N	\N	\N
991	2160	1	\N	\N	\N	\N	\N	\N
992	2161	1	\N	\N	\N	\N	\N	\N
993	2162	1	\N	\N	\N	\N	\N	\N
994	2167	1	\N	\N	\N	\N	\N	\N
995	2170	1	\N	\N	\N	\N	\N	\N
996	2171	1	\N	\N	\N	\N	\N	\N
997	2165	1	\N	\N	\N	\N	\N	\N
998	2163	1	\N	\N	\N	\N	\N	\N
999	2166	1	\N	\N	\N	\N	\N	\N
1000	2172	1	\N	\N	\N	\N	\N	\N
1001	2173	1	\N	\N	\N	\N	\N	\N
1002	2168	1	\N	\N	\N	\N	\N	\N
1003	2175	1	\N	\N	\N	\N	\N	\N
1004	2179	1	\N	\N	\N	\N	\N	\N
1005	2180	1	\N	\N	\N	\N	\N	\N
1006	2174	1	\N	\N	\N	\N	\N	\N
1007	2176	1	\N	\N	\N	\N	\N	\N
1008	2177	1	\N	\N	\N	\N	\N	\N
1009	2178	1	\N	\N	\N	\N	\N	\N
1010	2181	1	\N	\N	\N	\N	\N	\N
1011	2182	1	\N	\N	\N	\N	\N	\N
1012	2183	1	\N	\N	\N	\N	\N	\N
1013	2184	1	\N	\N	\N	\N	\N	\N
1014	2192	1	\N	\N	\N	\N	\N	\N
1015	2189	1	\N	\N	\N	\N	\N	\N
1016	2190	1	\N	\N	\N	\N	\N	\N
1017	2185	1	\N	\N	\N	\N	\N	\N
1018	2187	1	\N	\N	\N	\N	\N	\N
1019	2191	1	\N	\N	\N	\N	\N	\N
1020	2193	1	\N	\N	\N	\N	\N	\N
1021	2196	1	\N	\N	\N	\N	\N	\N
1022	2198	1	\N	\N	\N	\N	\N	\N
1023	2194	1	\N	\N	\N	\N	\N	\N
1024	2199	1	\N	\N	\N	\N	\N	\N
1025	2201	1	\N	\N	\N	\N	\N	\N
1026	2202	1	\N	\N	\N	\N	\N	\N
1027	2200	1	\N	\N	\N	\N	\N	\N
1028	2205	1	\N	\N	\N	\N	\N	\N
1029	2204	1	\N	\N	\N	\N	\N	\N
1030	2207	1	\N	\N	\N	\N	\N	\N
1031	2212	1	\N	\N	\N	\N	\N	\N
1032	2209	1	\N	\N	\N	\N	\N	\N
1033	2208	1	\N	\N	\N	\N	\N	\N
1034	2211	1	\N	\N	\N	\N	\N	\N
1036	2219	1	\N	\N	\N	\N	\N	\N
1037	2217	1	\N	\N	\N	\N	\N	\N
1038	2214	1	\N	\N	\N	\N	\N	\N
1039	2215	1	\N	\N	\N	\N	\N	\N
1040	2218	1	\N	\N	\N	\N	\N	\N
1041	2221	1	\N	\N	\N	\N	\N	\N
1042	2225	1	\N	\N	\N	\N	\N	\N
1043	2223	1	\N	\N	\N	\N	\N	\N
1045	2224	1	\N	\N	\N	\N	\N	\N
1046	2228	1	\N	\N	\N	\N	\N	\N
1047	2235	1	\N	\N	\N	\N	\N	\N
1048	2229	1	\N	\N	\N	\N	\N	\N
1049	2230	1	\N	\N	\N	\N	\N	\N
1050	2231	1	\N	\N	\N	\N	\N	\N
1051	2232	1	\N	\N	\N	\N	\N	\N
1052	2236	1	\N	\N	\N	\N	\N	\N
1053	2241	1	\N	\N	\N	\N	\N	\N
1054	2239	1	\N	\N	\N	\N	\N	\N
1055	2240	1	\N	\N	\N	\N	\N	\N
1056	2237	1	\N	\N	\N	\N	\N	\N
1057	2242	1	\N	\N	\N	\N	\N	\N
1058	2247	1	\N	\N	\N	\N	\N	\N
1059	2245	1	\N	\N	\N	\N	\N	\N
1061	2244	1	\N	\N	\N	\N	\N	\N
1063	2248	1	\N	\N	\N	\N	\N	\N
1064	2253	1	\N	\N	\N	\N	\N	\N
1065	2251	1	\N	\N	\N	\N	\N	\N
1066	2249	1	\N	\N	\N	\N	\N	\N
1067	2250	1	\N	\N	\N	\N	\N	\N
1068	2255	1	\N	\N	\N	\N	\N	\N
1069	2260	1	\N	\N	\N	\N	\N	\N
1070	2257	1	\N	\N	\N	\N	\N	\N
1071	2256	1	\N	\N	\N	\N	\N	\N
1072	2258	1	\N	\N	\N	\N	\N	\N
1073	2259	1	\N	\N	\N	\N	\N	\N
1074	2261	1	\N	\N	\N	\N	\N	\N
1075	2265	1	\N	\N	\N	\N	\N	\N
1076	2263	1	\N	\N	\N	\N	\N	\N
1077	2264	1	\N	\N	\N	\N	\N	\N
1078	2262	1	\N	\N	\N	\N	\N	\N
1079	2266	1	\N	\N	\N	\N	\N	\N
1080	2271	1	\N	\N	\N	\N	\N	\N
1081	2268	1	\N	\N	\N	\N	\N	\N
1082	2269	1	\N	\N	\N	\N	\N	\N
1083	2270	1	\N	\N	\N	\N	\N	\N
1084	2267	1	\N	\N	\N	\N	\N	\N
1085	2272	1	\N	\N	\N	\N	\N	\N
1086	2276	1	\N	\N	\N	\N	\N	\N
1087	2273	1	\N	\N	\N	\N	\N	\N
1088	2274	1	\N	\N	\N	\N	\N	\N
1089	2275	1	\N	\N	\N	\N	\N	\N
1090	2277	1	\N	\N	\N	\N	\N	\N
1091	2282	1	\N	\N	\N	\N	\N	\N
1092	2278	1	\N	\N	\N	\N	\N	\N
1093	2281	1	\N	\N	\N	\N	\N	\N
1094	2279	1	\N	\N	\N	\N	\N	\N
1095	2280	1	\N	\N	\N	\N	\N	\N
1096	2283	1	\N	\N	\N	\N	\N	\N
1097	2286	1	\N	\N	\N	\N	\N	\N
1098	2287	1	\N	\N	\N	\N	\N	\N
1099	2284	1	\N	\N	\N	\N	\N	\N
1060	2243	1	0.4173720000	774296.0000000000	99510642.0000000000	0.51	2.40	8.13
1100	2285	1	\N	\N	\N	\N	\N	\N
1101	2288	1	\N	\N	\N	\N	\N	\N
1102	2295	1	\N	\N	\N	\N	\N	\N
1103	2289	1	\N	\N	\N	\N	\N	\N
1104	2291	1	\N	\N	\N	\N	\N	\N
1105	2290	1	\N	\N	\N	\N	\N	\N
1106	2293	1	\N	\N	\N	\N	\N	\N
1107	2300	1	\N	\N	\N	\N	\N	\N
1108	2297	1	\N	\N	\N	\N	\N	\N
1109	2298	1	\N	\N	\N	\N	\N	\N
1111	2296	1	\N	\N	\N	\N	\N	\N
1112	2304	1	\N	\N	\N	\N	\N	\N
1113	2306	1	\N	\N	\N	\N	\N	\N
1114	2305	1	\N	\N	\N	\N	\N	\N
1115	2303	1	\N	\N	\N	\N	\N	\N
1116	2308	1	\N	\N	\N	\N	\N	\N
1118	2312	1	\N	\N	\N	\N	\N	\N
1119	2310	1	\N	\N	\N	\N	\N	\N
1120	2311	1	\N	\N	\N	\N	\N	\N
1121	2309	1	\N	\N	\N	\N	\N	\N
1122	2313	1	\N	\N	\N	\N	\N	\N
1123	2317	1	\N	\N	\N	\N	\N	\N
1124	2318	1	\N	\N	\N	\N	\N	\N
1125	2315	1	\N	\N	\N	\N	\N	\N
1126	2316	1	\N	\N	\N	\N	\N	\N
1127	2314	1	\N	\N	\N	\N	\N	\N
1128	2320	1	\N	\N	\N	\N	\N	\N
1129	2325	1	\N	\N	\N	\N	\N	\N
1130	2324	1	\N	\N	\N	\N	\N	\N
1131	2321	1	\N	\N	\N	\N	\N	\N
1132	2323	1	\N	\N	\N	\N	\N	\N
1133	2326	1	\N	\N	\N	\N	\N	\N
1134	2327	1	\N	\N	\N	\N	\N	\N
1135	2332	1	\N	\N	\N	\N	\N	\N
1136	2329	1	\N	\N	\N	\N	\N	\N
1137	2330	1	\N	\N	\N	\N	\N	\N
1138	2333	1	\N	\N	\N	\N	\N	\N
1139	2334	1	\N	\N	\N	\N	\N	\N
1140	2335	1	\N	\N	\N	\N	\N	\N
1141	2337	1	\N	\N	\N	\N	\N	\N
1142	2338	1	\N	\N	\N	\N	\N	\N
1143	2336	1	\N	\N	\N	\N	\N	\N
1144	2331	1	\N	\N	\N	\N	\N	\N
1145	2340	1	\N	\N	\N	\N	\N	\N
1146	2343	1	\N	\N	\N	\N	\N	\N
1147	2344	1	\N	\N	\N	\N	\N	\N
1148	2341	1	\N	\N	\N	\N	\N	\N
1149	2342	1	\N	\N	\N	\N	\N	\N
1150	2345	1	\N	\N	\N	\N	\N	\N
1151	2350	1	\N	\N	\N	\N	\N	\N
1153	2347	1	\N	\N	\N	\N	\N	\N
1154	2349	1	\N	\N	\N	\N	\N	\N
1155	2348	1	\N	\N	\N	\N	\N	\N
1156	2351	1	\N	\N	\N	\N	\N	\N
1157	2355	1	\N	\N	\N	\N	\N	\N
1158	2353	1	\N	\N	\N	\N	\N	\N
1159	2352	1	\N	\N	\N	\N	\N	\N
1160	2354	1	\N	\N	\N	\N	\N	\N
1161	2356	1	\N	\N	\N	\N	\N	\N
1162	2361	1	\N	\N	\N	\N	\N	\N
1163	2357	1	\N	\N	\N	\N	\N	\N
1164	2359	1	\N	\N	\N	\N	\N	\N
1165	2358	1	\N	\N	\N	\N	\N	\N
1166	2360	1	\N	\N	\N	\N	\N	\N
1167	2362	1	\N	\N	\N	\N	\N	\N
1168	2367	1	\N	\N	\N	\N	\N	\N
1169	2363	1	\N	\N	\N	\N	\N	\N
1170	2364	1	\N	\N	\N	\N	\N	\N
1171	2366	1	\N	\N	\N	\N	\N	\N
1172	2368	1	\N	\N	\N	\N	\N	\N
1173	2373	1	\N	\N	\N	\N	\N	\N
1174	2372	1	\N	\N	\N	\N	\N	\N
1175	2371	1	\N	\N	\N	\N	\N	\N
1176	2370	1	\N	\N	\N	\N	\N	\N
1177	2369	1	\N	\N	\N	\N	\N	\N
1178	2375	1	\N	\N	\N	\N	\N	\N
1179	2378	1	\N	\N	\N	\N	\N	\N
1180	2376	1	\N	\N	\N	\N	\N	\N
1181	2377	1	\N	\N	\N	\N	\N	\N
1182	2374	1	\N	\N	\N	\N	\N	\N
1183	2381	1	\N	\N	\N	\N	\N	\N
1184	2384	1	\N	\N	\N	\N	\N	\N
1185	2383	1	\N	\N	\N	\N	\N	\N
1186	2379	1	\N	\N	\N	\N	\N	\N
1187	2382	1	\N	\N	\N	\N	\N	\N
1188	2380	1	\N	\N	\N	\N	\N	\N
1189	2385	1	\N	\N	\N	\N	\N	\N
1190	2390	1	\N	\N	\N	\N	\N	\N
1191	2386	1	\N	\N	\N	\N	\N	\N
1192	2387	1	\N	\N	\N	\N	\N	\N
1193	2389	1	\N	\N	\N	\N	\N	\N
1194	2391	1	\N	\N	\N	\N	\N	\N
1195	2397	1	\N	\N	\N	\N	\N	\N
1196	2394	1	\N	\N	\N	\N	\N	\N
1197	2395	1	\N	\N	\N	\N	\N	\N
1198	2392	1	\N	\N	\N	\N	\N	\N
1199	2396	1	\N	\N	\N	\N	\N	\N
1200	2398	1	\N	\N	\N	\N	\N	\N
1202	2399	1	\N	\N	\N	\N	\N	\N
1203	2400	1	\N	\N	\N	\N	\N	\N
1204	2402	1	\N	\N	\N	\N	\N	\N
1205	2404	1	\N	\N	\N	\N	\N	\N
1206	2409	1	\N	\N	\N	\N	\N	\N
1208	2406	1	\N	\N	\N	\N	\N	\N
1209	2407	1	\N	\N	\N	\N	\N	\N
1210	2408	1	\N	\N	\N	\N	\N	\N
1211	2410	1	\N	\N	\N	\N	\N	\N
1212	2414	1	\N	\N	\N	\N	\N	\N
1213	2411	1	\N	\N	\N	\N	\N	\N
1214	2412	1	\N	\N	\N	\N	\N	\N
1215	2413	1	\N	\N	\N	\N	\N	\N
1216	2415	1	\N	\N	\N	\N	\N	\N
1217	2421	1	\N	\N	\N	\N	\N	\N
1219	2418	1	\N	\N	\N	\N	\N	\N
1220	2420	1	\N	\N	\N	\N	\N	\N
1221	2419	1	\N	\N	\N	\N	\N	\N
1222	2422	1	\N	\N	\N	\N	\N	\N
1223	2426	1	\N	\N	\N	\N	\N	\N
1224	2424	1	\N	\N	\N	\N	\N	\N
1225	2423	1	\N	\N	\N	\N	\N	\N
1226	2425	1	\N	\N	\N	\N	\N	\N
1227	2427	1	\N	\N	\N	\N	\N	\N
1229	2429	1	\N	\N	\N	\N	\N	\N
1230	2433	1	\N	\N	\N	\N	\N	\N
1231	2430	1	\N	\N	\N	\N	\N	\N
1232	2432	1	\N	\N	\N	\N	\N	\N
1233	2434	1	\N	\N	\N	\N	\N	\N
1234	2436	1	\N	\N	\N	\N	\N	\N
1235	2438	1	\N	\N	\N	\N	\N	\N
1236	2435	1	\N	\N	\N	\N	\N	\N
1237	2437	1	\N	\N	\N	\N	\N	\N
1238	2441	1	\N	\N	\N	\N	\N	\N
1239	2439	1	\N	\N	\N	\N	\N	\N
1240	2440	1	\N	\N	\N	\N	\N	\N
1241	2445	1	\N	\N	\N	\N	\N	\N
1242	2443	1	\N	\N	\N	\N	\N	\N
1243	2444	1	\N	\N	\N	\N	\N	\N
1244	2447	1	\N	\N	\N	\N	\N	\N
1245	2448	1	\N	\N	\N	\N	\N	\N
1246	2450	1	\N	\N	\N	\N	\N	\N
1247	2446	1	\N	\N	\N	\N	\N	\N
1248	2452	1	\N	\N	\N	\N	\N	\N
1249	2453	1	\N	\N	\N	\N	\N	\N
1250	2454	1	\N	\N	\N	\N	\N	\N
1251	2455	1	\N	\N	\N	\N	\N	\N
1252	2456	1	\N	\N	\N	\N	\N	\N
1253	2457	1	\N	\N	\N	\N	\N	\N
1254	2458	1	\N	\N	\N	\N	\N	\N
1255	2459	1	\N	\N	\N	\N	\N	\N
1256	2460	1	\N	\N	\N	\N	\N	\N
1117	2307	1	1.3203200000	43651500.0000000000	137765445.0000000000	0.76	-5.00	-9.54
1228	2428	1	0.3517910000	1510460.0000000000	105557338.0000000000	1.96	-9.55	-2.32
1257	2461	1	\N	\N	\N	\N	\N	\N
1258	2462	1	\N	\N	\N	\N	\N	\N
1259	2464	1	\N	\N	\N	\N	\N	\N
1260	2465	1	\N	\N	\N	\N	\N	\N
1261	2466	1	\N	\N	\N	\N	\N	\N
1262	2467	1	\N	\N	\N	\N	\N	\N
1263	2468	1	\N	\N	\N	\N	\N	\N
1265	2473	1	\N	\N	\N	\N	\N	\N
1266	2470	1	\N	\N	\N	\N	\N	\N
1267	2472	1	\N	\N	\N	\N	\N	\N
1268	2471	1	\N	\N	\N	\N	\N	\N
1269	2476	1	\N	\N	\N	\N	\N	\N
1270	2474	1	\N	\N	\N	\N	\N	\N
1271	2475	1	\N	\N	\N	\N	\N	\N
1272	2479	1	\N	\N	\N	\N	\N	\N
1273	2477	1	\N	\N	\N	\N	\N	\N
1274	2478	1	\N	\N	\N	\N	\N	\N
1275	2480	1	\N	\N	\N	\N	\N	\N
1276	2481	1	\N	\N	\N	\N	\N	\N
1277	2482	1	\N	\N	\N	\N	\N	\N
1278	2483	1	\N	\N	\N	\N	\N	\N
1279	2484	1	\N	\N	\N	\N	\N	\N
1280	2485	1	\N	\N	\N	\N	\N	\N
1281	2486	1	\N	\N	\N	\N	\N	\N
1282	2487	1	\N	\N	\N	\N	\N	\N
1283	2488	1	\N	\N	\N	\N	\N	\N
1284	2489	1	\N	\N	\N	\N	\N	\N
1285	2490	1	\N	\N	\N	\N	\N	\N
1286	2491	1	\N	\N	\N	\N	\N	\N
1288	2495	1	\N	\N	\N	\N	\N	\N
1290	2493	1	\N	\N	\N	\N	\N	\N
1291	2498	1	\N	\N	\N	\N	\N	\N
1292	2499	1	\N	\N	\N	\N	\N	\N
1293	2500	1	\N	\N	\N	\N	\N	\N
1294	2497	1	\N	\N	\N	\N	\N	\N
1295	2501	1	\N	\N	\N	\N	\N	\N
1297	2503	1	\N	\N	\N	\N	\N	\N
1298	2504	1	\N	\N	\N	\N	\N	\N
1299	2505	1	\N	\N	\N	\N	\N	\N
1300	2506	1	\N	\N	\N	\N	\N	\N
1301	2507	1	\N	\N	\N	\N	\N	\N
1302	2508	1	\N	\N	\N	\N	\N	\N
1303	2509	1	\N	\N	\N	\N	\N	\N
1304	2510	1	\N	\N	\N	\N	\N	\N
1305	2511	1	\N	\N	\N	\N	\N	\N
1306	2512	1	\N	\N	\N	\N	\N	\N
1307	2513	1	\N	\N	\N	\N	\N	\N
1308	2514	1	\N	\N	\N	\N	\N	\N
1309	2515	1	\N	\N	\N	\N	\N	\N
1310	2516	1	\N	\N	\N	\N	\N	\N
1311	2517	1	\N	\N	\N	\N	\N	\N
1312	2518	1	\N	\N	\N	\N	\N	\N
1313	2519	1	\N	\N	\N	\N	\N	\N
1314	2520	1	\N	\N	\N	\N	\N	\N
1315	2521	1	\N	\N	\N	\N	\N	\N
1316	2522	1	\N	\N	\N	\N	\N	\N
1317	2523	1	\N	\N	\N	\N	\N	\N
1318	2524	1	\N	\N	\N	\N	\N	\N
1319	2525	1	\N	\N	\N	\N	\N	\N
1320	2526	1	\N	\N	\N	\N	\N	\N
1321	2527	1	\N	\N	\N	\N	\N	\N
1322	2528	1	\N	\N	\N	\N	\N	\N
1323	2529	1	\N	\N	\N	\N	\N	\N
1325	2531	1	\N	\N	\N	\N	\N	\N
1326	2532	1	\N	\N	\N	\N	\N	\N
1327	2533	1	\N	\N	\N	\N	\N	\N
1328	2534	1	\N	\N	\N	\N	\N	\N
1329	2535	1	\N	\N	\N	\N	\N	\N
1330	2536	1	\N	\N	\N	\N	\N	\N
1331	2537	1	\N	\N	\N	\N	\N	\N
1332	2538	1	\N	\N	\N	\N	\N	\N
1333	2539	1	\N	\N	\N	\N	\N	\N
1334	2540	1	\N	\N	\N	\N	\N	\N
1335	2541	1	\N	\N	\N	\N	\N	\N
1336	2542	1	\N	\N	\N	\N	\N	\N
1337	2543	1	\N	\N	\N	\N	\N	\N
1338	2544	1	\N	\N	\N	\N	\N	\N
1339	2545	1	\N	\N	\N	\N	\N	\N
1340	2546	1	\N	\N	\N	\N	\N	\N
1341	2547	1	\N	\N	\N	\N	\N	\N
1342	2548	1	\N	\N	\N	\N	\N	\N
1343	2549	1	\N	\N	\N	\N	\N	\N
1344	2550	1	\N	\N	\N	\N	\N	\N
1345	2551	1	\N	\N	\N	\N	\N	\N
1346	2552	1	\N	\N	\N	\N	\N	\N
1347	2553	1	\N	\N	\N	\N	\N	\N
1348	2554	1	\N	\N	\N	\N	\N	\N
1349	2555	1	\N	\N	\N	\N	\N	\N
1350	2556	1	\N	\N	\N	\N	\N	\N
1351	2557	1	\N	\N	\N	\N	\N	\N
1352	2558	1	\N	\N	\N	\N	\N	\N
1353	2559	1	\N	\N	\N	\N	\N	\N
1354	2560	1	\N	\N	\N	\N	\N	\N
1355	2561	1	\N	\N	\N	\N	\N	\N
1356	2562	1	\N	\N	\N	\N	\N	\N
1357	2563	1	\N	\N	\N	\N	\N	\N
1358	2564	1	\N	\N	\N	\N	\N	\N
1359	2565	1	\N	\N	\N	\N	\N	\N
1361	2567	1	\N	\N	\N	\N	\N	\N
1362	2568	1	\N	\N	\N	\N	\N	\N
1363	2569	1	\N	\N	\N	\N	\N	\N
1364	2570	1	\N	\N	\N	\N	\N	\N
1365	2571	1	\N	\N	\N	\N	\N	\N
1366	2572	1	\N	\N	\N	\N	\N	\N
1367	2573	1	\N	\N	\N	\N	\N	\N
1369	2577	1	\N	\N	\N	\N	\N	\N
1370	2578	1	\N	\N	\N	\N	\N	\N
1371	2581	1	\N	\N	\N	\N	\N	\N
1372	2576	1	\N	\N	\N	\N	\N	\N
1373	2584	1	\N	\N	\N	\N	\N	\N
1374	2583	1	\N	\N	\N	\N	\N	\N
1375	2580	1	\N	\N	\N	\N	\N	\N
1376	2579	1	\N	\N	\N	\N	\N	\N
1378	2586	1	\N	\N	\N	\N	\N	\N
1379	2582	1	\N	\N	\N	\N	\N	\N
1381	2589	1	\N	\N	\N	\N	\N	\N
1382	2587	1	\N	\N	\N	\N	\N	\N
1383	2590	1	\N	\N	\N	\N	\N	\N
1384	2594	1	\N	\N	\N	\N	\N	\N
1385	2595	1	\N	\N	\N	\N	\N	\N
1386	2592	1	\N	\N	\N	\N	\N	\N
1387	2593	1	\N	\N	\N	\N	\N	\N
1389	2596	1	\N	\N	\N	\N	\N	\N
1390	2600	1	\N	\N	\N	\N	\N	\N
1391	2598	1	\N	\N	\N	\N	\N	\N
1392	2599	1	\N	\N	\N	\N	\N	\N
1393	2597	1	\N	\N	\N	\N	\N	\N
1394	2601	1	\N	\N	\N	\N	\N	\N
1396	2605	1	\N	\N	\N	\N	\N	\N
1397	2604	1	\N	\N	\N	\N	\N	\N
1398	2602	1	\N	\N	\N	\N	\N	\N
1399	2603	1	\N	\N	\N	\N	\N	\N
1400	2607	1	\N	\N	\N	\N	\N	\N
1401	2611	1	\N	\N	\N	\N	\N	\N
1403	2609	1	\N	\N	\N	\N	\N	\N
1404	2610	1	\N	\N	\N	\N	\N	\N
1405	2612	1	\N	\N	\N	\N	\N	\N
1406	2618	1	\N	\N	\N	\N	\N	\N
1407	2617	1	\N	\N	\N	\N	\N	\N
1408	2615	1	\N	\N	\N	\N	\N	\N
1409	2614	1	\N	\N	\N	\N	\N	\N
1410	2616	1	\N	\N	\N	\N	\N	\N
1411	2619	1	\N	\N	\N	\N	\N	\N
1412	2625	1	\N	\N	\N	\N	\N	\N
1413	2620	1	\N	\N	\N	\N	\N	\N
1296	2502	1	4.7390300000	75612800.0000000000	236952448.0000000000	-0.12	-5.21	6.47
1377	2585	1	0.1674780000	505270.0000000000	132041439.0000000000	4.16	62.89	40.73
1324	2530	1	3.7912500000	4236500.0000000000	112540721.0000000000	0.91	-7.79	-16.09
1395	2606	1	2.9133200000	5188220.0000000000	309256180.0000000000	1.01	-8.15	-6.96
1414	2621	1	\N	\N	\N	\N	\N	\N
1415	2624	1	\N	\N	\N	\N	\N	\N
1416	2626	1	\N	\N	\N	\N	\N	\N
1417	2631	1	\N	\N	\N	\N	\N	\N
1418	2628	1	\N	\N	\N	\N	\N	\N
1419	2629	1	\N	\N	\N	\N	\N	\N
1420	2627	1	\N	\N	\N	\N	\N	\N
1421	2630	1	\N	\N	\N	\N	\N	\N
1422	2632	1	\N	\N	\N	\N	\N	\N
1423	2636	1	\N	\N	\N	\N	\N	\N
1424	2635	1	\N	\N	\N	\N	\N	\N
1425	2633	1	\N	\N	\N	\N	\N	\N
1426	2634	1	\N	\N	\N	\N	\N	\N
1427	2637	1	\N	\N	\N	\N	\N	\N
1428	2642	1	\N	\N	\N	\N	\N	\N
1429	2639	1	\N	\N	\N	\N	\N	\N
1430	2641	1	\N	\N	\N	\N	\N	\N
1432	2640	1	\N	\N	\N	\N	\N	\N
1433	2643	1	\N	\N	\N	\N	\N	\N
1434	2644	1	\N	\N	\N	\N	\N	\N
1435	2645	1	\N	\N	\N	\N	\N	\N
1436	2646	1	\N	\N	\N	\N	\N	\N
1437	2647	1	\N	\N	\N	\N	\N	\N
1438	2648	1	\N	\N	\N	\N	\N	\N
1439	2649	1	\N	\N	\N	\N	\N	\N
1440	2650	1	\N	\N	\N	\N	\N	\N
1441	2651	1	\N	\N	\N	\N	\N	\N
1442	2652	1	\N	\N	\N	\N	\N	\N
1443	2653	1	\N	\N	\N	\N	\N	\N
1444	2657	1	\N	\N	\N	\N	\N	\N
1445	2656	1	\N	\N	\N	\N	\N	\N
1446	2655	1	\N	\N	\N	\N	\N	\N
1447	2654	1	\N	\N	\N	\N	\N	\N
1448	2658	1	\N	\N	\N	\N	\N	\N
1449	2663	1	\N	\N	\N	\N	\N	\N
1450	2661	1	\N	\N	\N	\N	\N	\N
1451	2659	1	\N	\N	\N	\N	\N	\N
1452	2662	1	\N	\N	\N	\N	\N	\N
1453	2660	1	\N	\N	\N	\N	\N	\N
1454	2664	1	\N	\N	\N	\N	\N	\N
1455	2668	1	\N	\N	\N	\N	\N	\N
1456	2665	1	\N	\N	\N	\N	\N	\N
1457	2666	1	\N	\N	\N	\N	\N	\N
1458	2667	1	\N	\N	\N	\N	\N	\N
1459	2669	1	\N	\N	\N	\N	\N	\N
1460	2674	1	\N	\N	\N	\N	\N	\N
1461	2671	1	\N	\N	\N	\N	\N	\N
1462	2670	1	\N	\N	\N	\N	\N	\N
1463	2673	1	\N	\N	\N	\N	\N	\N
1464	2672	1	\N	\N	\N	\N	\N	\N
1465	2675	1	\N	\N	\N	\N	\N	\N
1466	2678	1	\N	\N	\N	\N	\N	\N
1467	2679	1	\N	\N	\N	\N	\N	\N
1468	2677	1	\N	\N	\N	\N	\N	\N
1469	2676	1	\N	\N	\N	\N	\N	\N
1470	2680	1	\N	\N	\N	\N	\N	\N
1471	2685	1	\N	\N	\N	\N	\N	\N
1472	2681	1	\N	\N	\N	\N	\N	\N
1473	2683	1	\N	\N	\N	\N	\N	\N
1474	2682	1	\N	\N	\N	\N	\N	\N
1475	2684	1	\N	\N	\N	\N	\N	\N
1476	2686	1	\N	\N	\N	\N	\N	\N
1477	2690	1	\N	\N	\N	\N	\N	\N
1478	2688	1	\N	\N	\N	\N	\N	\N
1479	2689	1	\N	\N	\N	\N	\N	\N
1480	2687	1	\N	\N	\N	\N	\N	\N
1481	2691	1	\N	\N	\N	\N	\N	\N
1482	2694	1	\N	\N	\N	\N	\N	\N
1483	2692	1	\N	\N	\N	\N	\N	\N
1484	2693	1	\N	\N	\N	\N	\N	\N
1485	2695	1	\N	\N	\N	\N	\N	\N
1486	2703	1	\N	\N	\N	\N	\N	\N
1487	2701	1	\N	\N	\N	\N	\N	\N
1488	2699	1	\N	\N	\N	\N	\N	\N
1489	2702	1	\N	\N	\N	\N	\N	\N
1490	2698	1	\N	\N	\N	\N	\N	\N
1491	2696	1	\N	\N	\N	\N	\N	\N
1492	2704	1	\N	\N	\N	\N	\N	\N
1493	2708	1	\N	\N	\N	\N	\N	\N
1494	2705	1	\N	\N	\N	\N	\N	\N
1495	2706	1	\N	\N	\N	\N	\N	\N
1496	2709	1	\N	\N	\N	\N	\N	\N
1497	2715	1	\N	\N	\N	\N	\N	\N
1498	2710	1	\N	\N	\N	\N	\N	\N
1499	2712	1	\N	\N	\N	\N	\N	\N
1500	2711	1	\N	\N	\N	\N	\N	\N
1501	2713	1	\N	\N	\N	\N	\N	\N
1502	2714	1	\N	\N	\N	\N	\N	\N
1503	2717	1	\N	\N	\N	\N	\N	\N
1504	2719	1	\N	\N	\N	\N	\N	\N
1505	2720	1	\N	\N	\N	\N	\N	\N
1506	2718	1	\N	\N	\N	\N	\N	\N
1507	2721	1	\N	\N	\N	\N	\N	\N
1508	2727	1	\N	\N	\N	\N	\N	\N
1509	2722	1	\N	\N	\N	\N	\N	\N
1510	2723	1	\N	\N	\N	\N	\N	\N
1511	2724	1	\N	\N	\N	\N	\N	\N
1512	2725	1	\N	\N	\N	\N	\N	\N
1513	2726	1	\N	\N	\N	\N	\N	\N
1514	2729	1	\N	\N	\N	\N	\N	\N
1515	2732	1	\N	\N	\N	\N	\N	\N
1516	2730	1	\N	\N	\N	\N	\N	\N
1517	2731	1	\N	\N	\N	\N	\N	\N
1518	2733	1	\N	\N	\N	\N	\N	\N
1519	2739	1	\N	\N	\N	\N	\N	\N
1520	2736	1	\N	\N	\N	\N	\N	\N
1521	2735	1	\N	\N	\N	\N	\N	\N
1522	2738	1	\N	\N	\N	\N	\N	\N
1523	2734	1	\N	\N	\N	\N	\N	\N
1524	2737	1	\N	\N	\N	\N	\N	\N
1525	2740	1	\N	\N	\N	\N	\N	\N
1526	2743	1	\N	\N	\N	\N	\N	\N
1527	2741	1	\N	\N	\N	\N	\N	\N
1528	2742	1	\N	\N	\N	\N	\N	\N
1529	2744	1	\N	\N	\N	\N	\N	\N
1530	2749	1	\N	\N	\N	\N	\N	\N
1531	2747	1	\N	\N	\N	\N	\N	\N
1532	2750	1	\N	\N	\N	\N	\N	\N
1533	2746	1	\N	\N	\N	\N	\N	\N
1534	2748	1	\N	\N	\N	\N	\N	\N
1535	2752	1	\N	\N	\N	\N	\N	\N
1536	2751	1	\N	\N	\N	\N	\N	\N
1537	2755	1	\N	\N	\N	\N	\N	\N
1538	2753	1	\N	\N	\N	\N	\N	\N
1539	2754	1	\N	\N	\N	\N	\N	\N
1540	2756	1	\N	\N	\N	\N	\N	\N
1541	2761	1	\N	\N	\N	\N	\N	\N
1542	2762	1	\N	\N	\N	\N	\N	\N
1543	2757	1	\N	\N	\N	\N	\N	\N
1544	2758	1	\N	\N	\N	\N	\N	\N
1545	2759	1	\N	\N	\N	\N	\N	\N
1546	2760	1	\N	\N	\N	\N	\N	\N
1547	2763	1	\N	\N	\N	\N	\N	\N
1548	2766	1	\N	\N	\N	\N	\N	\N
1549	2764	1	\N	\N	\N	\N	\N	\N
1550	2765	1	\N	\N	\N	\N	\N	\N
1551	2767	1	\N	\N	\N	\N	\N	\N
1552	2771	1	\N	\N	\N	\N	\N	\N
1553	2772	1	\N	\N	\N	\N	\N	\N
1554	2768	1	\N	\N	\N	\N	\N	\N
1555	2769	1	\N	\N	\N	\N	\N	\N
1556	2770	1	\N	\N	\N	\N	\N	\N
1557	2774	1	\N	\N	\N	\N	\N	\N
1558	2773	1	\N	\N	\N	\N	\N	\N
1559	2777	1	\N	\N	\N	\N	\N	\N
1560	2775	1	\N	\N	\N	\N	\N	\N
1561	2776	1	\N	\N	\N	\N	\N	\N
1562	2778	1	\N	\N	\N	\N	\N	\N
1563	2827	1	\N	\N	\N	\N	\N	\N
1564	2825	1	\N	\N	\N	\N	\N	\N
1565	2779	1	\N	\N	\N	\N	\N	\N
1566	2780	1	\N	\N	\N	\N	\N	\N
1567	2826	1	\N	\N	\N	\N	\N	\N
1568	2829	1	\N	\N	\N	\N	\N	\N
1569	2828	1	\N	\N	\N	\N	\N	\N
1570	2833	1	\N	\N	\N	\N	\N	\N
1571	2831	1	\N	\N	\N	\N	\N	\N
1572	2830	1	\N	\N	\N	\N	\N	\N
1573	2834	1	\N	\N	\N	\N	\N	\N
1574	2839	1	\N	\N	\N	\N	\N	\N
1575	2835	1	\N	\N	\N	\N	\N	\N
1576	2836	1	\N	\N	\N	\N	\N	\N
1577	2837	1	\N	\N	\N	\N	\N	\N
1578	2838	1	\N	\N	\N	\N	\N	\N
1579	2841	1	\N	\N	\N	\N	\N	\N
1580	2842	1	\N	\N	\N	\N	\N	\N
1581	2840	1	\N	\N	\N	\N	\N	\N
1582	2844	1	\N	\N	\N	\N	\N	\N
1583	2843	1	\N	\N	\N	\N	\N	\N
1584	2845	1	\N	\N	\N	\N	\N	\N
1585	2850	1	\N	\N	\N	\N	\N	\N
1586	2847	1	\N	\N	\N	\N	\N	\N
1587	2846	1	\N	\N	\N	\N	\N	\N
1588	2848	1	\N	\N	\N	\N	\N	\N
1589	2849	1	\N	\N	\N	\N	\N	\N
1590	2851	1	\N	\N	\N	\N	\N	\N
1591	2852	1	\N	\N	\N	\N	\N	\N
1592	2855	1	\N	\N	\N	\N	\N	\N
1593	2853	1	\N	\N	\N	\N	\N	\N
1594	2854	1	\N	\N	\N	\N	\N	\N
1595	2856	1	\N	\N	\N	\N	\N	\N
1596	2857	1	\N	\N	\N	\N	\N	\N
1597	2858	1	\N	\N	\N	\N	\N	\N
1598	2859	1	\N	\N	\N	\N	\N	\N
1599	2862	1	\N	\N	\N	\N	\N	\N
1600	2866	1	\N	\N	\N	\N	\N	\N
1601	2861	1	\N	\N	\N	\N	\N	\N
1602	2867	1	\N	\N	\N	\N	\N	\N
1603	2869	1	\N	\N	\N	\N	\N	\N
1604	2868	1	\N	\N	\N	\N	\N	\N
1605	2870	1	\N	\N	\N	\N	\N	\N
1607	4	2	\N	\N	\N	\N	\N	\N
1608	8	2	\N	\N	\N	\N	\N	\N
1610	6	2	\N	\N	\N	\N	\N	\N
1611	5	2	\N	\N	\N	\N	\N	\N
1612	9	2	\N	\N	\N	\N	\N	\N
1613	3	2	\N	\N	\N	\N	\N	\N
1614	13	2	\N	\N	\N	\N	\N	\N
1615	10	2	\N	\N	\N	\N	\N	\N
1616	14	2	\N	\N	\N	\N	\N	\N
1617	16	2	\N	\N	\N	\N	\N	\N
1618	18	2	\N	\N	\N	\N	\N	\N
1619	25	2	\N	\N	\N	\N	\N	\N
1620	31	2	\N	\N	\N	\N	\N	\N
1621	32	2	\N	\N	\N	\N	\N	\N
1622	34	2	\N	\N	\N	\N	\N	\N
1623	37	2	\N	\N	\N	\N	\N	\N
1624	35	2	\N	\N	\N	\N	\N	\N
1625	41	2	\N	\N	\N	\N	\N	\N
1626	42	2	\N	\N	\N	\N	\N	\N
1627	43	2	\N	\N	\N	\N	\N	\N
1628	45	2	\N	\N	\N	\N	\N	\N
1629	49	2	\N	\N	\N	\N	\N	\N
1630	50	2	\N	\N	\N	\N	\N	\N
1631	51	2	\N	\N	\N	\N	\N	\N
1632	53	2	\N	\N	\N	\N	\N	\N
1633	56	2	\N	\N	\N	\N	\N	\N
1635	57	2	\N	\N	\N	\N	\N	\N
1636	58	2	\N	\N	\N	\N	\N	\N
1637	61	2	\N	\N	\N	\N	\N	\N
1638	63	2	\N	\N	\N	\N	\N	\N
1639	64	2	\N	\N	\N	\N	\N	\N
1641	67	2	\N	\N	\N	\N	\N	\N
1642	68	2	\N	\N	\N	\N	\N	\N
1643	69	2	\N	\N	\N	\N	\N	\N
1644	70	2	\N	\N	\N	\N	\N	\N
1645	71	2	\N	\N	\N	\N	\N	\N
1646	72	2	\N	\N	\N	\N	\N	\N
1648	75	2	\N	\N	\N	\N	\N	\N
1649	76	2	\N	\N	\N	\N	\N	\N
1650	77	2	\N	\N	\N	\N	\N	\N
1651	78	2	\N	\N	\N	\N	\N	\N
1652	79	2	\N	\N	\N	\N	\N	\N
1653	80	2	\N	\N	\N	\N	\N	\N
1654	83	2	\N	\N	\N	\N	\N	\N
1655	84	2	\N	\N	\N	\N	\N	\N
1656	87	2	\N	\N	\N	\N	\N	\N
1657	88	2	\N	\N	\N	\N	\N	\N
1658	89	2	\N	\N	\N	\N	\N	\N
1659	90	2	\N	\N	\N	\N	\N	\N
1660	93	2	\N	\N	\N	\N	\N	\N
1661	99	2	\N	\N	\N	\N	\N	\N
1662	101	2	\N	\N	\N	\N	\N	\N
1663	103	2	\N	\N	\N	\N	\N	\N
1665	113	2	\N	\N	\N	\N	\N	\N
1666	114	2	\N	\N	\N	\N	\N	\N
1667	117	2	\N	\N	\N	\N	\N	\N
1669	120	2	\N	\N	\N	\N	\N	\N
1670	121	2	\N	\N	\N	\N	\N	\N
1671	122	2	\N	\N	\N	\N	\N	\N
1672	125	2	\N	\N	\N	\N	\N	\N
1673	128	2	\N	\N	\N	\N	\N	\N
1674	129	2	\N	\N	\N	\N	\N	\N
1675	130	2	\N	\N	\N	\N	\N	\N
1677	132	2	\N	\N	\N	\N	\N	\N
1678	134	2	\N	\N	\N	\N	\N	\N
1679	135	2	\N	\N	\N	\N	\N	\N
1680	138	2	\N	\N	\N	\N	\N	\N
1681	141	2	\N	\N	\N	\N	\N	\N
1682	142	2	\N	\N	\N	\N	\N	\N
1683	145	2	\N	\N	\N	\N	\N	\N
1684	148	2	\N	\N	\N	\N	\N	\N
1685	150	2	\N	\N	\N	\N	\N	\N
1686	151	2	\N	\N	\N	\N	\N	\N
1687	154	2	\N	\N	\N	\N	\N	\N
1688	159	2	\N	\N	\N	\N	\N	\N
1689	160	2	\N	\N	\N	\N	\N	\N
1690	161	2	\N	\N	\N	\N	\N	\N
1691	164	2	\N	\N	\N	\N	\N	\N
1692	168	2	\N	\N	\N	\N	\N	\N
1693	170	2	\N	\N	\N	\N	\N	\N
1694	174	2	\N	\N	\N	\N	\N	\N
1695	175	2	\N	\N	\N	\N	\N	\N
1696	181	2	\N	\N	\N	\N	\N	\N
1697	182	2	\N	\N	\N	\N	\N	\N
1698	206	2	\N	\N	\N	\N	\N	\N
1699	201	2	\N	\N	\N	\N	\N	\N
1701	205	2	\N	\N	\N	\N	\N	\N
1702	199	2	\N	\N	\N	\N	\N	\N
1703	218	2	\N	\N	\N	\N	\N	\N
1704	215	2	\N	\N	\N	\N	\N	\N
1705	217	2	\N	\N	\N	\N	\N	\N
1706	212	2	\N	\N	\N	\N	\N	\N
1707	221	2	\N	\N	\N	\N	\N	\N
1708	224	2	\N	\N	\N	\N	\N	\N
1709	233	2	\N	\N	\N	\N	\N	\N
1710	234	2	\N	\N	\N	\N	\N	\N
1711	254	2	\N	\N	\N	\N	\N	\N
1712	257	2	\N	\N	\N	\N	\N	\N
1713	258	2	\N	\N	\N	\N	\N	\N
1714	269	2	\N	\N	\N	\N	\N	\N
1715	260	2	\N	\N	\N	\N	\N	\N
1716	263	2	\N	\N	\N	\N	\N	\N
1717	268	2	\N	\N	\N	\N	\N	\N
1718	275	2	\N	\N	\N	\N	\N	\N
1719	276	2	\N	\N	\N	\N	\N	\N
1720	287	2	\N	\N	\N	\N	\N	\N
1721	290	2	\N	\N	\N	\N	\N	\N
1722	278	2	\N	\N	\N	\N	\N	\N
1723	279	2	\N	\N	\N	\N	\N	\N
1725	293	2	\N	\N	\N	\N	\N	\N
1726	295	2	\N	\N	\N	\N	\N	\N
1727	298	2	\N	\N	\N	\N	\N	\N
1668	118	2	0.0051177519	2774487.5107665802	147435848.0000000000	0.01	-7.39	13.44
1640	66	2	0.0953350560	2703884.5822566750	95239715.0000000000	0.35	-2.38	-6.18
1676	131	2	221.8380706288	43029715.7622739000	1807269434.0000000000	0.20	-3.22	-3.20
1647	74	2	0.0025426443	3834694.2291128333	292309091.0000000000	-0.12	-1.83	0.30
1728	304	2	\N	\N	\N	\N	\N	\N
1729	312	2	\N	\N	\N	\N	\N	\N
1730	313	2	\N	\N	\N	\N	\N	\N
1731	316	2	\N	\N	\N	\N	\N	\N
1732	317	2	\N	\N	\N	\N	\N	\N
1733	322	2	\N	\N	\N	\N	\N	\N
1734	323	2	\N	\N	\N	\N	\N	\N
1735	325	2	\N	\N	\N	\N	\N	\N
1737	331	2	\N	\N	\N	\N	\N	\N
1738	333	2	\N	\N	\N	\N	\N	\N
1739	334	2	\N	\N	\N	\N	\N	\N
1740	337	2	\N	\N	\N	\N	\N	\N
1741	338	2	\N	\N	\N	\N	\N	\N
1742	341	2	\N	\N	\N	\N	\N	\N
1743	344	2	\N	\N	\N	\N	\N	\N
1744	350	2	\N	\N	\N	\N	\N	\N
1745	353	2	\N	\N	\N	\N	\N	\N
1746	356	2	\N	\N	\N	\N	\N	\N
1747	360	2	\N	\N	\N	\N	\N	\N
1748	362	2	\N	\N	\N	\N	\N	\N
1749	366	2	\N	\N	\N	\N	\N	\N
1750	367	2	\N	\N	\N	\N	\N	\N
1751	370	2	\N	\N	\N	\N	\N	\N
1753	374	2	\N	\N	\N	\N	\N	\N
1754	377	2	\N	\N	\N	\N	\N	\N
1755	382	2	\N	\N	\N	\N	\N	\N
1756	385	2	\N	\N	\N	\N	\N	\N
1757	386	2	\N	\N	\N	\N	\N	\N
1758	389	2	\N	\N	\N	\N	\N	\N
1759	400	2	\N	\N	\N	\N	\N	\N
1760	405	2	\N	\N	\N	\N	\N	\N
1761	415	2	\N	\N	\N	\N	\N	\N
1762	411	2	\N	\N	\N	\N	\N	\N
1763	406	2	\N	\N	\N	\N	\N	\N
1764	416	2	\N	\N	\N	\N	\N	\N
1765	426	2	\N	\N	\N	\N	\N	\N
1766	448	2	\N	\N	\N	\N	\N	\N
1767	460	2	\N	\N	\N	\N	\N	\N
1768	450	2	\N	\N	\N	\N	\N	\N
1769	467	2	\N	\N	\N	\N	\N	\N
1771	461	2	\N	\N	\N	\N	\N	\N
1772	477	2	\N	\N	\N	\N	\N	\N
1773	476	2	\N	\N	\N	\N	\N	\N
1774	513	2	\N	\N	\N	\N	\N	\N
1775	468	2	\N	\N	\N	\N	\N	\N
1776	506	2	\N	\N	\N	\N	\N	\N
1778	502	2	\N	\N	\N	\N	\N	\N
1779	520	2	\N	\N	\N	\N	\N	\N
1780	470	2	\N	\N	\N	\N	\N	\N
1781	501	2	\N	\N	\N	\N	\N	\N
1782	495	2	\N	\N	\N	\N	\N	\N
1783	525	2	\N	\N	\N	\N	\N	\N
1784	536	2	\N	\N	\N	\N	\N	\N
1786	543	2	\N	\N	\N	\N	\N	\N
1787	545	2	\N	\N	\N	\N	\N	\N
1788	549	2	\N	\N	\N	\N	\N	\N
1789	551	2	\N	\N	\N	\N	\N	\N
1790	576	2	\N	\N	\N	\N	\N	\N
1791	572	2	\N	\N	\N	\N	\N	\N
1793	573	2	\N	\N	\N	\N	\N	\N
1794	584	2	\N	\N	\N	\N	\N	\N
1795	588	2	\N	\N	\N	\N	\N	\N
1796	594	2	\N	\N	\N	\N	\N	\N
1797	597	2	\N	\N	\N	\N	\N	\N
1798	606	2	\N	\N	\N	\N	\N	\N
1799	601	2	\N	\N	\N	\N	\N	\N
1800	624	2	\N	\N	\N	\N	\N	\N
1801	625	2	\N	\N	\N	\N	\N	\N
1802	623	2	\N	\N	\N	\N	\N	\N
1803	626	2	\N	\N	\N	\N	\N	\N
1804	627	2	\N	\N	\N	\N	\N	\N
1805	629	2	\N	\N	\N	\N	\N	\N
1806	633	2	\N	\N	\N	\N	\N	\N
1807	638	2	\N	\N	\N	\N	\N	\N
1808	643	2	\N	\N	\N	\N	\N	\N
1809	644	2	\N	\N	\N	\N	\N	\N
1810	654	2	\N	\N	\N	\N	\N	\N
1811	656	2	\N	\N	\N	\N	\N	\N
1812	659	2	\N	\N	\N	\N	\N	\N
1813	660	2	\N	\N	\N	\N	\N	\N
1814	666	2	\N	\N	\N	\N	\N	\N
1815	680	2	\N	\N	\N	\N	\N	\N
1817	699	2	\N	\N	\N	\N	\N	\N
1818	702	2	\N	\N	\N	\N	\N	\N
1819	703	2	\N	\N	\N	\N	\N	\N
1820	706	2	\N	\N	\N	\N	\N	\N
1821	707	2	\N	\N	\N	\N	\N	\N
1822	708	2	\N	\N	\N	\N	\N	\N
1823	719	2	\N	\N	\N	\N	\N	\N
1824	720	2	\N	\N	\N	\N	\N	\N
1825	723	2	\N	\N	\N	\N	\N	\N
1826	730	2	\N	\N	\N	\N	\N	\N
1827	733	2	\N	\N	\N	\N	\N	\N
1828	734	2	\N	\N	\N	\N	\N	\N
1829	747	2	\N	\N	\N	\N	\N	\N
1830	760	2	\N	\N	\N	\N	\N	\N
1831	764	2	\N	\N	\N	\N	\N	\N
1832	766	2	\N	\N	\N	\N	\N	\N
1833	778	2	\N	\N	\N	\N	\N	\N
1834	781	2	\N	\N	\N	\N	\N	\N
1835	785	2	\N	\N	\N	\N	\N	\N
1836	788	2	\N	\N	\N	\N	\N	\N
1837	789	2	\N	\N	\N	\N	\N	\N
1838	795	2	\N	\N	\N	\N	\N	\N
1839	796	2	\N	\N	\N	\N	\N	\N
1840	797	2	\N	\N	\N	\N	\N	\N
1841	799	2	\N	\N	\N	\N	\N	\N
1842	812	2	\N	\N	\N	\N	\N	\N
1843	813	2	\N	\N	\N	\N	\N	\N
1844	815	2	\N	\N	\N	\N	\N	\N
1845	818	2	\N	\N	\N	\N	\N	\N
1846	819	2	\N	\N	\N	\N	\N	\N
1847	823	2	\N	\N	\N	\N	\N	\N
1849	814	2	\N	\N	\N	\N	\N	\N
1850	831	2	\N	\N	\N	\N	\N	\N
1851	833	2	\N	\N	\N	\N	\N	\N
1852	836	2	\N	\N	\N	\N	\N	\N
1853	837	2	\N	\N	\N	\N	\N	\N
1854	841	2	\N	\N	\N	\N	\N	\N
1855	853	2	\N	\N	\N	\N	\N	\N
1856	855	2	\N	\N	\N	\N	\N	\N
1857	857	2	\N	\N	\N	\N	\N	\N
1858	859	2	\N	\N	\N	\N	\N	\N
1859	869	2	\N	\N	\N	\N	\N	\N
1860	870	2	\N	\N	\N	\N	\N	\N
1862	890	2	\N	\N	\N	\N	\N	\N
1863	892	2	\N	\N	\N	\N	\N	\N
1864	894	2	\N	\N	\N	\N	\N	\N
1865	895	2	\N	\N	\N	\N	\N	\N
1866	898	2	\N	\N	\N	\N	\N	\N
1867	911	2	\N	\N	\N	\N	\N	\N
1868	912	2	\N	\N	\N	\N	\N	\N
1869	914	2	\N	\N	\N	\N	\N	\N
1870	916	2	\N	\N	\N	\N	\N	\N
1871	918	2	\N	\N	\N	\N	\N	\N
1872	920	2	\N	\N	\N	\N	\N	\N
1873	921	2	\N	\N	\N	\N	\N	\N
1874	924	2	\N	\N	\N	\N	\N	\N
1875	933	2	\N	\N	\N	\N	\N	\N
1876	934	2	\N	\N	\N	\N	\N	\N
1877	938	2	\N	\N	\N	\N	\N	\N
1878	939	2	\N	\N	\N	\N	\N	\N
1879	945	2	\N	\N	\N	\N	\N	\N
1880	948	2	\N	\N	\N	\N	\N	\N
1881	951	2	\N	\N	\N	\N	\N	\N
1882	954	2	\N	\N	\N	\N	\N	\N
1883	959	2	\N	\N	\N	\N	\N	\N
1884	960	2	\N	\N	\N	\N	\N	\N
1785	541	2	0.1853522825	617343.6692506459	99283566.0000000000	0.01	-5.12	-10.09
1752	372	2	0.0030284927	12795951.7657192070	556910976.0000000000	1.91	-5.88	-21.80
1885	964	2	\N	\N	\N	\N	\N	\N
1886	965	2	\N	\N	\N	\N	\N	\N
1887	977	2	\N	\N	\N	\N	\N	\N
1888	978	2	\N	\N	\N	\N	\N	\N
1889	983	2	\N	\N	\N	\N	\N	\N
1890	986	2	\N	\N	\N	\N	\N	\N
1891	988	2	\N	\N	\N	\N	\N	\N
1892	990	2	\N	\N	\N	\N	\N	\N
1893	992	2	\N	\N	\N	\N	\N	\N
1894	993	2	\N	\N	\N	\N	\N	\N
1895	994	2	\N	\N	\N	\N	\N	\N
1896	998	2	\N	\N	\N	\N	\N	\N
1897	999	2	\N	\N	\N	\N	\N	\N
1898	1002	2	\N	\N	\N	\N	\N	\N
1899	1004	2	\N	\N	\N	\N	\N	\N
1900	1008	2	\N	\N	\N	\N	\N	\N
1901	1010	2	\N	\N	\N	\N	\N	\N
1902	1019	2	\N	\N	\N	\N	\N	\N
1903	1020	2	\N	\N	\N	\N	\N	\N
1904	1022	2	\N	\N	\N	\N	\N	\N
1905	1026	2	\N	\N	\N	\N	\N	\N
1907	1028	2	\N	\N	\N	\N	\N	\N
1908	1032	2	\N	\N	\N	\N	\N	\N
1909	1033	2	\N	\N	\N	\N	\N	\N
1910	1035	2	\N	\N	\N	\N	\N	\N
1911	1038	2	\N	\N	\N	\N	\N	\N
1913	1044	2	\N	\N	\N	\N	\N	\N
1914	1050	2	\N	\N	\N	\N	\N	\N
1915	1052	2	\N	\N	\N	\N	\N	\N
1916	1053	2	\N	\N	\N	\N	\N	\N
1917	1058	2	\N	\N	\N	\N	\N	\N
1918	1063	2	\N	\N	\N	\N	\N	\N
1919	1066	2	\N	\N	\N	\N	\N	\N
1920	1069	2	\N	\N	\N	\N	\N	\N
1921	1070	2	\N	\N	\N	\N	\N	\N
1922	1082	2	\N	\N	\N	\N	\N	\N
1923	1084	2	\N	\N	\N	\N	\N	\N
1924	1085	2	\N	\N	\N	\N	\N	\N
1926	1089	2	\N	\N	\N	\N	\N	\N
1927	1090	2	\N	\N	\N	\N	\N	\N
1928	1093	2	\N	\N	\N	\N	\N	\N
1929	1100	2	\N	\N	\N	\N	\N	\N
1931	1106	2	\N	\N	\N	\N	\N	\N
1932	1107	2	\N	\N	\N	\N	\N	\N
1933	1109	2	\N	\N	\N	\N	\N	\N
1934	1110	2	\N	\N	\N	\N	\N	\N
1935	1111	2	\N	\N	\N	\N	\N	\N
1936	1113	2	\N	\N	\N	\N	\N	\N
1937	1120	2	\N	\N	\N	\N	\N	\N
1938	1123	2	\N	\N	\N	\N	\N	\N
1939	1125	2	\N	\N	\N	\N	\N	\N
1940	1131	2	\N	\N	\N	\N	\N	\N
1941	1135	2	\N	\N	\N	\N	\N	\N
1942	1136	2	\N	\N	\N	\N	\N	\N
1943	1141	2	\N	\N	\N	\N	\N	\N
1944	1146	2	\N	\N	\N	\N	\N	\N
1945	1147	2	\N	\N	\N	\N	\N	\N
1946	1148	2	\N	\N	\N	\N	\N	\N
1947	1153	2	\N	\N	\N	\N	\N	\N
1948	1154	2	\N	\N	\N	\N	\N	\N
1949	1156	2	\N	\N	\N	\N	\N	\N
1950	1159	2	\N	\N	\N	\N	\N	\N
1951	1164	2	\N	\N	\N	\N	\N	\N
1952	1155	2	\N	\N	\N	\N	\N	\N
1953	1165	2	\N	\N	\N	\N	\N	\N
1955	1175	2	\N	\N	\N	\N	\N	\N
1956	1176	2	\N	\N	\N	\N	\N	\N
1957	1172	2	\N	\N	\N	\N	\N	\N
1959	1180	2	\N	\N	\N	\N	\N	\N
1960	1193	2	\N	\N	\N	\N	\N	\N
1961	1194	2	\N	\N	\N	\N	\N	\N
1962	1182	2	\N	\N	\N	\N	\N	\N
1963	1191	2	\N	\N	\N	\N	\N	\N
1964	1185	2	\N	\N	\N	\N	\N	\N
1965	1195	2	\N	\N	\N	\N	\N	\N
1966	1208	2	\N	\N	\N	\N	\N	\N
1967	1206	2	\N	\N	\N	\N	\N	\N
1968	1200	2	\N	\N	\N	\N	\N	\N
1969	1198	2	\N	\N	\N	\N	\N	\N
1970	1209	2	\N	\N	\N	\N	\N	\N
1971	1210	2	\N	\N	\N	\N	\N	\N
1972	1212	2	\N	\N	\N	\N	\N	\N
1973	1213	2	\N	\N	\N	\N	\N	\N
1975	1216	2	\N	\N	\N	\N	\N	\N
1976	1218	2	\N	\N	\N	\N	\N	\N
1977	1226	2	\N	\N	\N	\N	\N	\N
1979	1234	2	\N	\N	\N	\N	\N	\N
1980	1241	2	\N	\N	\N	\N	\N	\N
1981	1223	2	\N	\N	\N	\N	\N	\N
1982	1238	2	\N	\N	\N	\N	\N	\N
1983	1244	2	\N	\N	\N	\N	\N	\N
1984	1249	2	\N	\N	\N	\N	\N	\N
1985	1248	2	\N	\N	\N	\N	\N	\N
1986	1250	2	\N	\N	\N	\N	\N	\N
1987	1247	2	\N	\N	\N	\N	\N	\N
1989	1251	2	\N	\N	\N	\N	\N	\N
1990	1256	2	\N	\N	\N	\N	\N	\N
1991	1257	2	\N	\N	\N	\N	\N	\N
1992	1252	2	\N	\N	\N	\N	\N	\N
1993	1254	2	\N	\N	\N	\N	\N	\N
1994	1259	2	\N	\N	\N	\N	\N	\N
1995	1271	2	\N	\N	\N	\N	\N	\N
1996	1264	2	\N	\N	\N	\N	\N	\N
1997	1268	2	\N	\N	\N	\N	\N	\N
1998	1266	2	\N	\N	\N	\N	\N	\N
1999	1269	2	\N	\N	\N	\N	\N	\N
2001	1281	2	\N	\N	\N	\N	\N	\N
2002	1275	2	\N	\N	\N	\N	\N	\N
2003	1276	2	\N	\N	\N	\N	\N	\N
2004	1279	2	\N	\N	\N	\N	\N	\N
2005	1282	2	\N	\N	\N	\N	\N	\N
2006	1288	2	\N	\N	\N	\N	\N	\N
2007	1283	2	\N	\N	\N	\N	\N	\N
2008	1284	2	\N	\N	\N	\N	\N	\N
2009	1285	2	\N	\N	\N	\N	\N	\N
2010	1286	2	\N	\N	\N	\N	\N	\N
2011	1291	2	\N	\N	\N	\N	\N	\N
2012	1294	2	\N	\N	\N	\N	\N	\N
2013	1297	2	\N	\N	\N	\N	\N	\N
2014	1298	2	\N	\N	\N	\N	\N	\N
2015	1299	2	\N	\N	\N	\N	\N	\N
2016	1303	2	\N	\N	\N	\N	\N	\N
2017	1304	2	\N	\N	\N	\N	\N	\N
2018	1306	2	\N	\N	\N	\N	\N	\N
2019	1308	2	\N	\N	\N	\N	\N	\N
2020	1309	2	\N	\N	\N	\N	\N	\N
2021	1312	2	\N	\N	\N	\N	\N	\N
2022	1323	2	\N	\N	\N	\N	\N	\N
2023	1322	2	\N	\N	\N	\N	\N	\N
2026	1334	2	\N	\N	\N	\N	\N	\N
2027	1348	2	\N	\N	\N	\N	\N	\N
2028	1340	2	\N	\N	\N	\N	\N	\N
2029	1336	2	\N	\N	\N	\N	\N	\N
2031	1341	2	\N	\N	\N	\N	\N	\N
2032	1351	2	\N	\N	\N	\N	\N	\N
2033	1358	2	\N	\N	\N	\N	\N	\N
2034	1353	2	\N	\N	\N	\N	\N	\N
2035	1357	2	\N	\N	\N	\N	\N	\N
2036	1352	2	\N	\N	\N	\N	\N	\N
2037	1361	2	\N	\N	\N	\N	\N	\N
2038	1367	2	\N	\N	\N	\N	\N	\N
2039	1368	2	\N	\N	\N	\N	\N	\N
2041	1375	2	\N	\N	\N	\N	\N	\N
1974	1214	2	5.2437295435	6773867.3557278210	562112580.0000000000	0.36	-4.37	-10.67
2030	1343	2	2.5375796727	2345193.7984496120	250978808.0000000000	0.10	-2.36	-9.46
1978	1229	2	96.2291128338	434219.6382428940	192458226.0000000000	0.04	-3.96	-4.87
1954	1169	2	2.0216279070	841032.7304048233	114319312.0000000000	-0.64	-5.39	-13.96
1912	1042	2	0.0106748493	8441886.3049095600	375846692.0000000000	-0.57	-3.36	-10.81
2042	1371	2	\N	\N	\N	\N	\N	\N
2043	1379	2	\N	\N	\N	\N	\N	\N
2044	1380	2	\N	\N	\N	\N	\N	\N
2045	1381	2	\N	\N	\N	\N	\N	\N
2046	1382	2	\N	\N	\N	\N	\N	\N
2047	1387	2	\N	\N	\N	\N	\N	\N
2048	1391	2	\N	\N	\N	\N	\N	\N
2049	1392	2	\N	\N	\N	\N	\N	\N
2050	1389	2	\N	\N	\N	\N	\N	\N
2051	1395	2	\N	\N	\N	\N	\N	\N
2052	1390	2	\N	\N	\N	\N	\N	\N
2053	1396	2	\N	\N	\N	\N	\N	\N
2054	1398	2	\N	\N	\N	\N	\N	\N
2055	1399	2	\N	\N	\N	\N	\N	\N
2056	1397	2	\N	\N	\N	\N	\N	\N
2057	1400	2	\N	\N	\N	\N	\N	\N
2058	1405	2	\N	\N	\N	\N	\N	\N
2059	1393	2	\N	\N	\N	\N	\N	\N
2060	1403	2	\N	\N	\N	\N	\N	\N
2061	1409	2	\N	\N	\N	\N	\N	\N
2063	1408	2	\N	\N	\N	\N	\N	\N
2064	1418	2	\N	\N	\N	\N	\N	\N
2065	1420	2	\N	\N	\N	\N	\N	\N
2066	1421	2	\N	\N	\N	\N	\N	\N
2067	1423	2	\N	\N	\N	\N	\N	\N
2068	1425	2	\N	\N	\N	\N	\N	\N
2069	1429	2	\N	\N	\N	\N	\N	\N
2070	1434	2	\N	\N	\N	\N	\N	\N
2071	1435	2	\N	\N	\N	\N	\N	\N
2072	1436	2	\N	\N	\N	\N	\N	\N
2074	1438	2	\N	\N	\N	\N	\N	\N
2075	1439	2	\N	\N	\N	\N	\N	\N
2076	1442	2	\N	\N	\N	\N	\N	\N
2077	1447	2	\N	\N	\N	\N	\N	\N
2078	1448	2	\N	\N	\N	\N	\N	\N
2079	1449	2	\N	\N	\N	\N	\N	\N
2080	1454	2	\N	\N	\N	\N	\N	\N
2082	1456	2	\N	\N	\N	\N	\N	\N
2083	1457	2	\N	\N	\N	\N	\N	\N
2084	1459	2	\N	\N	\N	\N	\N	\N
2085	1463	2	\N	\N	\N	\N	\N	\N
2086	1464	2	\N	\N	\N	\N	\N	\N
2087	1465	2	\N	\N	\N	\N	\N	\N
2088	1466	2	\N	\N	\N	\N	\N	\N
2089	1468	2	\N	\N	\N	\N	\N	\N
2090	1469	2	\N	\N	\N	\N	\N	\N
2091	1472	2	\N	\N	\N	\N	\N	\N
2092	1473	2	\N	\N	\N	\N	\N	\N
2093	1474	2	\N	\N	\N	\N	\N	\N
2094	1475	2	\N	\N	\N	\N	\N	\N
2095	1481	2	\N	\N	\N	\N	\N	\N
2096	1483	2	\N	\N	\N	\N	\N	\N
2097	1485	2	\N	\N	\N	\N	\N	\N
2098	1478	2	\N	\N	\N	\N	\N	\N
2099	1480	2	\N	\N	\N	\N	\N	\N
2100	1486	2	\N	\N	\N	\N	\N	\N
2101	1492	2	\N	\N	\N	\N	\N	\N
2102	1495	2	\N	\N	\N	\N	\N	\N
2103	1489	2	\N	\N	\N	\N	\N	\N
2104	1487	2	\N	\N	\N	\N	\N	\N
2105	1500	2	\N	\N	\N	\N	\N	\N
2106	1502	2	\N	\N	\N	\N	\N	\N
2107	1503	2	\N	\N	\N	\N	\N	\N
2108	1496	2	\N	\N	\N	\N	\N	\N
2109	1501	2	\N	\N	\N	\N	\N	\N
2110	1497	2	\N	\N	\N	\N	\N	\N
2111	1504	2	\N	\N	\N	\N	\N	\N
2112	1506	2	\N	\N	\N	\N	\N	\N
2113	1505	2	\N	\N	\N	\N	\N	\N
2114	1507	2	\N	\N	\N	\N	\N	\N
2115	1509	2	\N	\N	\N	\N	\N	\N
2116	1514	2	\N	\N	\N	\N	\N	\N
2117	1515	2	\N	\N	\N	\N	\N	\N
2119	1510	2	\N	\N	\N	\N	\N	\N
2120	1513	2	\N	\N	\N	\N	\N	\N
2121	1511	2	\N	\N	\N	\N	\N	\N
2122	1520	2	\N	\N	\N	\N	\N	\N
2123	1523	2	\N	\N	\N	\N	\N	\N
2125	1522	2	\N	\N	\N	\N	\N	\N
2126	1525	2	\N	\N	\N	\N	\N	\N
2127	1526	2	\N	\N	\N	\N	\N	\N
2128	1527	2	\N	\N	\N	\N	\N	\N
2129	1528	2	\N	\N	\N	\N	\N	\N
2130	1524	2	\N	\N	\N	\N	\N	\N
2131	1529	2	\N	\N	\N	\N	\N	\N
2132	1531	2	\N	\N	\N	\N	\N	\N
2133	1533	2	\N	\N	\N	\N	\N	\N
2134	1534	2	\N	\N	\N	\N	\N	\N
2135	1535	2	\N	\N	\N	\N	\N	\N
2136	1539	2	\N	\N	\N	\N	\N	\N
2137	1542	2	\N	\N	\N	\N	\N	\N
2138	1544	2	\N	\N	\N	\N	\N	\N
2139	1550	2	\N	\N	\N	\N	\N	\N
2140	1548	2	\N	\N	\N	\N	\N	\N
2141	1546	2	\N	\N	\N	\N	\N	\N
2142	1555	2	\N	\N	\N	\N	\N	\N
2143	1552	2	\N	\N	\N	\N	\N	\N
2144	1558	2	\N	\N	\N	\N	\N	\N
2145	1556	2	\N	\N	\N	\N	\N	\N
2146	1554	2	\N	\N	\N	\N	\N	\N
2147	1562	2	\N	\N	\N	\N	\N	\N
2148	1563	2	\N	\N	\N	\N	\N	\N
2149	1561	2	\N	\N	\N	\N	\N	\N
2150	1559	2	\N	\N	\N	\N	\N	\N
2151	1566	2	\N	\N	\N	\N	\N	\N
2153	1565	2	\N	\N	\N	\N	\N	\N
2154	1568	2	\N	\N	\N	\N	\N	\N
2155	1570	2	\N	\N	\N	\N	\N	\N
2156	1575	2	\N	\N	\N	\N	\N	\N
2157	1576	2	\N	\N	\N	\N	\N	\N
2158	1577	2	\N	\N	\N	\N	\N	\N
2159	1578	2	\N	\N	\N	\N	\N	\N
2160	1579	2	\N	\N	\N	\N	\N	\N
2161	1581	2	\N	\N	\N	\N	\N	\N
2162	1582	2	\N	\N	\N	\N	\N	\N
2164	1587	2	\N	\N	\N	\N	\N	\N
2165	1588	2	\N	\N	\N	\N	\N	\N
2166	1590	2	\N	\N	\N	\N	\N	\N
2167	1592	2	\N	\N	\N	\N	\N	\N
2168	1596	2	\N	\N	\N	\N	\N	\N
2169	1597	2	\N	\N	\N	\N	\N	\N
2170	1598	2	\N	\N	\N	\N	\N	\N
2171	1595	2	\N	\N	\N	\N	\N	\N
2172	1605	2	\N	\N	\N	\N	\N	\N
2173	1606	2	\N	\N	\N	\N	\N	\N
2174	1607	2	\N	\N	\N	\N	\N	\N
2175	1602	2	\N	\N	\N	\N	\N	\N
2176	1603	2	\N	\N	\N	\N	\N	\N
2177	1609	2	\N	\N	\N	\N	\N	\N
2178	1611	2	\N	\N	\N	\N	\N	\N
2179	1614	2	\N	\N	\N	\N	\N	\N
2180	1608	2	\N	\N	\N	\N	\N	\N
2181	1610	2	\N	\N	\N	\N	\N	\N
2182	1616	2	\N	\N	\N	\N	\N	\N
2183	1624	2	\N	\N	\N	\N	\N	\N
2184	1619	2	\N	\N	\N	\N	\N	\N
2185	1623	2	\N	\N	\N	\N	\N	\N
2186	1617	2	\N	\N	\N	\N	\N	\N
2187	1618	2	\N	\N	\N	\N	\N	\N
2188	1625	2	\N	\N	\N	\N	\N	\N
2189	1629	2	\N	\N	\N	\N	\N	\N
2190	1630	2	\N	\N	\N	\N	\N	\N
2191	1626	2	\N	\N	\N	\N	\N	\N
2192	1628	2	\N	\N	\N	\N	\N	\N
2193	1631	2	\N	\N	\N	\N	\N	\N
2194	1638	2	\N	\N	\N	\N	\N	\N
2195	1640	2	\N	\N	\N	\N	\N	\N
2196	1632	2	\N	\N	\N	\N	\N	\N
2197	1636	2	\N	\N	\N	\N	\N	\N
2198	1637	2	\N	\N	\N	\N	\N	\N
2124	1521	2	1.5163393626	337168.8199827734	158084407.0000000000	-0.70	-6.30	-12.71
2062	1414	2	16.9888027562	344650.3014642549	85288855.0000000000	1.78	-1.82	-8.29
2199	1642	2	\N	\N	\N	\N	\N	\N
2200	1650	2	\N	\N	\N	\N	\N	\N
2201	1644	2	\N	\N	\N	\N	\N	\N
2202	1643	2	\N	\N	\N	\N	\N	\N
2203	1647	2	\N	\N	\N	\N	\N	\N
2204	1651	2	\N	\N	\N	\N	\N	\N
2205	1660	2	\N	\N	\N	\N	\N	\N
2206	1657	2	\N	\N	\N	\N	\N	\N
2207	1659	2	\N	\N	\N	\N	\N	\N
2208	1654	2	\N	\N	\N	\N	\N	\N
2209	1658	2	\N	\N	\N	\N	\N	\N
2210	1662	2	\N	\N	\N	\N	\N	\N
2211	1671	2	\N	\N	\N	\N	\N	\N
2212	1665	2	\N	\N	\N	\N	\N	\N
2213	1669	2	\N	\N	\N	\N	\N	\N
2214	1670	2	\N	\N	\N	\N	\N	\N
2215	1673	2	\N	\N	\N	\N	\N	\N
2216	1678	2	\N	\N	\N	\N	\N	\N
2217	1679	2	\N	\N	\N	\N	\N	\N
2218	1674	2	\N	\N	\N	\N	\N	\N
2219	1677	2	\N	\N	\N	\N	\N	\N
2220	1676	2	\N	\N	\N	\N	\N	\N
2221	1680	2	\N	\N	\N	\N	\N	\N
2222	1685	2	\N	\N	\N	\N	\N	\N
2223	1681	2	\N	\N	\N	\N	\N	\N
2224	1683	2	\N	\N	\N	\N	\N	\N
2226	1686	2	\N	\N	\N	\N	\N	\N
2227	1693	2	\N	\N	\N	\N	\N	\N
2228	1690	2	\N	\N	\N	\N	\N	\N
2229	1687	2	\N	\N	\N	\N	\N	\N
2230	1688	2	\N	\N	\N	\N	\N	\N
2231	1691	2	\N	\N	\N	\N	\N	\N
2232	1694	2	\N	\N	\N	\N	\N	\N
2233	1699	2	\N	\N	\N	\N	\N	\N
2234	1695	2	\N	\N	\N	\N	\N	\N
2236	1698	2	\N	\N	\N	\N	\N	\N
2238	1702	2	\N	\N	\N	\N	\N	\N
2239	1703	2	\N	\N	\N	\N	\N	\N
2240	1706	2	\N	\N	\N	\N	\N	\N
2241	1707	2	\N	\N	\N	\N	\N	\N
2242	1708	2	\N	\N	\N	\N	\N	\N
2243	1709	2	\N	\N	\N	\N	\N	\N
2245	1711	2	\N	\N	\N	\N	\N	\N
2246	1704	2	\N	\N	\N	\N	\N	\N
2247	1712	2	\N	\N	\N	\N	\N	\N
2248	1717	2	\N	\N	\N	\N	\N	\N
2249	1716	2	\N	\N	\N	\N	\N	\N
2250	1715	2	\N	\N	\N	\N	\N	\N
2251	1714	2	\N	\N	\N	\N	\N	\N
2252	1719	2	\N	\N	\N	\N	\N	\N
2253	1724	2	\N	\N	\N	\N	\N	\N
2254	1723	2	\N	\N	\N	\N	\N	\N
2256	1721	2	\N	\N	\N	\N	\N	\N
2257	1722	2	\N	\N	\N	\N	\N	\N
2258	1726	2	\N	\N	\N	\N	\N	\N
2259	1731	2	\N	\N	\N	\N	\N	\N
2260	1728	2	\N	\N	\N	\N	\N	\N
2261	1729	2	\N	\N	\N	\N	\N	\N
2263	1739	2	\N	\N	\N	\N	\N	\N
2264	1732	2	\N	\N	\N	\N	\N	\N
2265	1733	2	\N	\N	\N	\N	\N	\N
2266	1736	2	\N	\N	\N	\N	\N	\N
2267	1737	2	\N	\N	\N	\N	\N	\N
2268	1738	2	\N	\N	\N	\N	\N	\N
2269	1745	2	\N	\N	\N	\N	\N	\N
2270	1741	2	\N	\N	\N	\N	\N	\N
2271	1743	2	\N	\N	\N	\N	\N	\N
2272	1742	2	\N	\N	\N	\N	\N	\N
2273	1746	2	\N	\N	\N	\N	\N	\N
2274	1748	2	\N	\N	\N	\N	\N	\N
2275	1747	2	\N	\N	\N	\N	\N	\N
2276	1753	2	\N	\N	\N	\N	\N	\N
2278	1752	2	\N	\N	\N	\N	\N	\N
2280	1755	2	\N	\N	\N	\N	\N	\N
2281	1756	2	\N	\N	\N	\N	\N	\N
2282	1754	2	\N	\N	\N	\N	\N	\N
2283	1758	2	\N	\N	\N	\N	\N	\N
2285	1760	2	\N	\N	\N	\N	\N	\N
2286	1762	2	\N	\N	\N	\N	\N	\N
2287	1763	2	\N	\N	\N	\N	\N	\N
2289	1767	2	\N	\N	\N	\N	\N	\N
2290	1772	2	\N	\N	\N	\N	\N	\N
2291	1773	2	\N	\N	\N	\N	\N	\N
2292	1769	2	\N	\N	\N	\N	\N	\N
2293	1771	2	\N	\N	\N	\N	\N	\N
2294	1768	2	\N	\N	\N	\N	\N	\N
2295	1774	2	\N	\N	\N	\N	\N	\N
2296	1777	2	\N	\N	\N	\N	\N	\N
2297	1778	2	\N	\N	\N	\N	\N	\N
2298	1776	2	\N	\N	\N	\N	\N	\N
2299	1775	2	\N	\N	\N	\N	\N	\N
2300	1779	2	\N	\N	\N	\N	\N	\N
2302	1781	2	\N	\N	\N	\N	\N	\N
2303	1784	2	\N	\N	\N	\N	\N	\N
2304	1782	2	\N	\N	\N	\N	\N	\N
2305	1783	2	\N	\N	\N	\N	\N	\N
2306	1786	2	\N	\N	\N	\N	\N	\N
2307	1790	2	\N	\N	\N	\N	\N	\N
2308	1788	2	\N	\N	\N	\N	\N	\N
2309	1787	2	\N	\N	\N	\N	\N	\N
2311	1792	2	\N	\N	\N	\N	\N	\N
2312	1799	2	\N	\N	\N	\N	\N	\N
2313	1798	2	\N	\N	\N	\N	\N	\N
2314	1793	2	\N	\N	\N	\N	\N	\N
2315	1797	2	\N	\N	\N	\N	\N	\N
2316	1795	2	\N	\N	\N	\N	\N	\N
2317	1801	2	\N	\N	\N	\N	\N	\N
2318	1803	2	\N	\N	\N	\N	\N	\N
2319	1805	2	\N	\N	\N	\N	\N	\N
2320	1807	2	\N	\N	\N	\N	\N	\N
2321	1814	2	\N	\N	\N	\N	\N	\N
2322	1815	2	\N	\N	\N	\N	\N	\N
2324	1812	2	\N	\N	\N	\N	\N	\N
2325	1810	2	\N	\N	\N	\N	\N	\N
2326	1811	2	\N	\N	\N	\N	\N	\N
2327	1809	2	\N	\N	\N	\N	\N	\N
2328	1818	2	\N	\N	\N	\N	\N	\N
2329	1816	2	\N	\N	\N	\N	\N	\N
2332	1819	2	\N	\N	\N	\N	\N	\N
2333	1830	2	\N	\N	\N	\N	\N	\N
2334	1826	2	\N	\N	\N	\N	\N	\N
2335	1828	2	\N	\N	\N	\N	\N	\N
2336	1824	2	\N	\N	\N	\N	\N	\N
2337	1825	2	\N	\N	\N	\N	\N	\N
2338	1834	2	\N	\N	\N	\N	\N	\N
2339	1832	2	\N	\N	\N	\N	\N	\N
2340	1833	2	\N	\N	\N	\N	\N	\N
2341	1835	2	\N	\N	\N	\N	\N	\N
2343	1836	2	\N	\N	\N	\N	\N	\N
2344	1837	2	\N	\N	\N	\N	\N	\N
2345	1838	2	\N	\N	\N	\N	\N	\N
2346	1840	2	\N	\N	\N	\N	\N	\N
2347	1841	2	\N	\N	\N	\N	\N	\N
2348	1845	2	\N	\N	\N	\N	\N	\N
2349	1842	2	\N	\N	\N	\N	\N	\N
2350	1843	2	\N	\N	\N	\N	\N	\N
2351	1846	2	\N	\N	\N	\N	\N	\N
2352	1850	2	\N	\N	\N	\N	\N	\N
2353	1849	2	\N	\N	\N	\N	\N	\N
2354	1848	2	\N	\N	\N	\N	\N	\N
2355	1847	2	\N	\N	\N	\N	\N	\N
2244	1710	2	52.6884582257	860842.3772609818	107307708.0000000000	1.74	-10.67	-14.76
2330	1817	2	1.2822308355	1748217.0542635657	98543401.0000000000	1.34	-5.96	-20.88
2255	1720	2	0.9761843239	40998363.4797588200	2713333890.0000000000	-0.03	-3.32	-10.63
2323	1808	2	7.7004392765	13860981.9121447020	785772473.0000000000	0.22	-2.69	-4.62
2237	1700	2	2.1060981912	5777950.0430663220	490763995.0000000000	-0.35	-5.16	-8.07
2277	1750	2	2.5085615848	19125839.7932816520	150513695.0000000000	-0.38	-5.96	-14.22
2356	1851	2	\N	\N	\N	\N	\N	\N
2357	1852	2	\N	\N	\N	\N	\N	\N
2358	1861	2	\N	\N	\N	\N	\N	\N
2359	1853	2	\N	\N	\N	\N	\N	\N
2360	1856	2	\N	\N	\N	\N	\N	\N
2361	1857	2	\N	\N	\N	\N	\N	\N
2362	1863	2	\N	\N	\N	\N	\N	\N
2363	1864	2	\N	\N	\N	\N	\N	\N
2364	1865	2	\N	\N	\N	\N	\N	\N
2366	1869	2	\N	\N	\N	\N	\N	\N
2367	1871	2	\N	\N	\N	\N	\N	\N
2368	1872	2	\N	\N	\N	\N	\N	\N
2369	1873	2	\N	\N	\N	\N	\N	\N
2371	1877	2	\N	\N	\N	\N	\N	\N
2372	1881	2	\N	\N	\N	\N	\N	\N
2373	1883	2	\N	\N	\N	\N	\N	\N
2374	1878	2	\N	\N	\N	\N	\N	\N
2375	1882	2	\N	\N	\N	\N	\N	\N
2376	1884	2	\N	\N	\N	\N	\N	\N
2377	1889	2	\N	\N	\N	\N	\N	\N
2378	1885	2	\N	\N	\N	\N	\N	\N
2379	1887	2	\N	\N	\N	\N	\N	\N
2380	1888	2	\N	\N	\N	\N	\N	\N
2381	1886	2	\N	\N	\N	\N	\N	\N
2382	1898	2	\N	\N	\N	\N	\N	\N
2383	1890	2	\N	\N	\N	\N	\N	\N
2384	1894	2	\N	\N	\N	\N	\N	\N
2385	1897	2	\N	\N	\N	\N	\N	\N
2387	1899	2	\N	\N	\N	\N	\N	\N
2390	1902	2	\N	\N	\N	\N	\N	\N
2391	1900	2	\N	\N	\N	\N	\N	\N
2392	1905	2	\N	\N	\N	\N	\N	\N
2393	1913	2	\N	\N	\N	\N	\N	\N
2394	1910	2	\N	\N	\N	\N	\N	\N
2395	1912	2	\N	\N	\N	\N	\N	\N
2396	1907	2	\N	\N	\N	\N	\N	\N
2398	1915	2	\N	\N	\N	\N	\N	\N
2399	1920	2	\N	\N	\N	\N	\N	\N
2400	1917	2	\N	\N	\N	\N	\N	\N
2401	1918	2	\N	\N	\N	\N	\N	\N
2402	1916	2	\N	\N	\N	\N	\N	\N
2403	1921	2	\N	\N	\N	\N	\N	\N
2404	1927	2	\N	\N	\N	\N	\N	\N
2405	1926	2	\N	\N	\N	\N	\N	\N
2406	1923	2	\N	\N	\N	\N	\N	\N
2407	1922	2	\N	\N	\N	\N	\N	\N
2409	1930	2	\N	\N	\N	\N	\N	\N
2410	1935	2	\N	\N	\N	\N	\N	\N
2411	1931	2	\N	\N	\N	\N	\N	\N
2413	1933	2	\N	\N	\N	\N	\N	\N
2414	1937	2	\N	\N	\N	\N	\N	\N
2415	1938	2	\N	\N	\N	\N	\N	\N
2416	1943	2	\N	\N	\N	\N	\N	\N
2417	1945	2	\N	\N	\N	\N	\N	\N
2418	1942	2	\N	\N	\N	\N	\N	\N
2419	1946	2	\N	\N	\N	\N	\N	\N
2420	1947	2	\N	\N	\N	\N	\N	\N
2421	1948	2	\N	\N	\N	\N	\N	\N
2422	1949	2	\N	\N	\N	\N	\N	\N
2423	1950	2	\N	\N	\N	\N	\N	\N
2424	1951	2	\N	\N	\N	\N	\N	\N
2425	1952	2	\N	\N	\N	\N	\N	\N
2426	1954	2	\N	\N	\N	\N	\N	\N
2427	1955	2	\N	\N	\N	\N	\N	\N
2428	1956	2	\N	\N	\N	\N	\N	\N
2430	1964	2	\N	\N	\N	\N	\N	\N
2431	1962	2	\N	\N	\N	\N	\N	\N
2432	1963	2	\N	\N	\N	\N	\N	\N
2433	1961	2	\N	\N	\N	\N	\N	\N
2434	1959	2	\N	\N	\N	\N	\N	\N
2435	1965	2	\N	\N	\N	\N	\N	\N
2436	1969	2	\N	\N	\N	\N	\N	\N
2437	1968	2	\N	\N	\N	\N	\N	\N
2438	1967	2	\N	\N	\N	\N	\N	\N
2440	1970	2	\N	\N	\N	\N	\N	\N
2441	1976	2	\N	\N	\N	\N	\N	\N
2442	1974	2	\N	\N	\N	\N	\N	\N
2443	1971	2	\N	\N	\N	\N	\N	\N
2444	1975	2	\N	\N	\N	\N	\N	\N
2445	1973	2	\N	\N	\N	\N	\N	\N
2446	1979	2	\N	\N	\N	\N	\N	\N
2447	1983	2	\N	\N	\N	\N	\N	\N
2449	1981	2	\N	\N	\N	\N	\N	\N
2450	1980	2	\N	\N	\N	\N	\N	\N
2452	1989	2	\N	\N	\N	\N	\N	\N
2453	1985	2	\N	\N	\N	\N	\N	\N
2454	1988	2	\N	\N	\N	\N	\N	\N
2455	1986	2	\N	\N	\N	\N	\N	\N
2456	1987	2	\N	\N	\N	\N	\N	\N
2457	1990	2	\N	\N	\N	\N	\N	\N
2458	1995	2	\N	\N	\N	\N	\N	\N
2459	1994	2	\N	\N	\N	\N	\N	\N
2460	1991	2	\N	\N	\N	\N	\N	\N
2462	1996	2	\N	\N	\N	\N	\N	\N
2463	2002	2	\N	\N	\N	\N	\N	\N
2464	2000	2	\N	\N	\N	\N	\N	\N
2465	1999	2	\N	\N	\N	\N	\N	\N
2466	1998	2	\N	\N	\N	\N	\N	\N
2467	2001	2	\N	\N	\N	\N	\N	\N
2468	2004	2	\N	\N	\N	\N	\N	\N
2469	2008	2	\N	\N	\N	\N	\N	\N
2470	2005	2	\N	\N	\N	\N	\N	\N
2471	2007	2	\N	\N	\N	\N	\N	\N
2472	2006	2	\N	\N	\N	\N	\N	\N
2473	2009	2	\N	\N	\N	\N	\N	\N
2474	2015	2	\N	\N	\N	\N	\N	\N
2476	2012	2	\N	\N	\N	\N	\N	\N
2477	2013	2	\N	\N	\N	\N	\N	\N
2478	2011	2	\N	\N	\N	\N	\N	\N
2479	2017	2	\N	\N	\N	\N	\N	\N
2480	2022	2	\N	\N	\N	\N	\N	\N
2481	2018	2	\N	\N	\N	\N	\N	\N
2482	2019	2	\N	\N	\N	\N	\N	\N
2484	2024	2	\N	\N	\N	\N	\N	\N
2485	2030	2	\N	\N	\N	\N	\N	\N
2486	2026	2	\N	\N	\N	\N	\N	\N
2487	2025	2	\N	\N	\N	\N	\N	\N
2488	2029	2	\N	\N	\N	\N	\N	\N
2490	2031	2	\N	\N	\N	\N	\N	\N
2491	2036	2	\N	\N	\N	\N	\N	\N
2492	2032	2	\N	\N	\N	\N	\N	\N
2493	2033	2	\N	\N	\N	\N	\N	\N
2494	2034	2	\N	\N	\N	\N	\N	\N
2495	2037	2	\N	\N	\N	\N	\N	\N
2496	2042	2	\N	\N	\N	\N	\N	\N
2497	2039	2	\N	\N	\N	\N	\N	\N
2498	2040	2	\N	\N	\N	\N	\N	\N
2499	2038	2	\N	\N	\N	\N	\N	\N
2500	2041	2	\N	\N	\N	\N	\N	\N
2501	2043	2	\N	\N	\N	\N	\N	\N
2502	2047	2	\N	\N	\N	\N	\N	\N
2504	2046	2	\N	\N	\N	\N	\N	\N
2505	2045	2	\N	\N	\N	\N	\N	\N
2506	2048	2	\N	\N	\N	\N	\N	\N
2507	2054	2	\N	\N	\N	\N	\N	\N
2508	2051	2	\N	\N	\N	\N	\N	\N
2509	2049	2	\N	\N	\N	\N	\N	\N
2510	2050	2	\N	\N	\N	\N	\N	\N
2511	2053	2	\N	\N	\N	\N	\N	\N
2512	2055	2	\N	\N	\N	\N	\N	\N
2370	1876	2	0.0003722524	45141.6881998277	121066377.0000000000	1.09	-2.07	-5.34
2503	2044	2	1.4795176572	4874435.8311800165	110721437.0000000000	2.74	-0.86	19.51
2461	1993	2	0.0001235125	279610.6804478897	93387492.0000000000	-0.76	-3.74	-8.03
2388	1904	2	2.6901033592	50111627.9069767400	1472819552.0000000000	0.21	-2.53	5.17
2483	2021	2	0.8071343669	670173.1266149870	291060576.0000000000	0.70	-7.25	-10.49
2408	1925	2	6.7600172265	4529328.1653746770	210534649.0000000000	-0.21	-5.93	-12.08
2513	2059	2	\N	\N	\N	\N	\N	\N
2514	2056	2	\N	\N	\N	\N	\N	\N
2515	2057	2	\N	\N	\N	\N	\N	\N
2516	2058	2	\N	\N	\N	\N	\N	\N
2517	2060	2	\N	\N	\N	\N	\N	\N
2518	2065	2	\N	\N	\N	\N	\N	\N
2519	2061	2	\N	\N	\N	\N	\N	\N
2521	2063	2	\N	\N	\N	\N	\N	\N
2522	2064	2	\N	\N	\N	\N	\N	\N
2523	2066	2	\N	\N	\N	\N	\N	\N
2524	2071	2	\N	\N	\N	\N	\N	\N
2525	2069	2	\N	\N	\N	\N	\N	\N
2526	2067	2	\N	\N	\N	\N	\N	\N
2527	2070	2	\N	\N	\N	\N	\N	\N
2528	2072	2	\N	\N	\N	\N	\N	\N
2529	2079	2	\N	\N	\N	\N	\N	\N
2530	2076	2	\N	\N	\N	\N	\N	\N
2531	2077	2	\N	\N	\N	\N	\N	\N
2532	2074	2	\N	\N	\N	\N	\N	\N
2533	2078	2	\N	\N	\N	\N	\N	\N
2534	2080	2	\N	\N	\N	\N	\N	\N
2535	2082	2	\N	\N	\N	\N	\N	\N
2536	2081	2	\N	\N	\N	\N	\N	\N
2539	2089	2	\N	\N	\N	\N	\N	\N
2540	2090	2	\N	\N	\N	\N	\N	\N
2541	2091	2	\N	\N	\N	\N	\N	\N
2542	2088	2	\N	\N	\N	\N	\N	\N
2544	2093	2	\N	\N	\N	\N	\N	\N
2545	2094	2	\N	\N	\N	\N	\N	\N
2546	2096	2	\N	\N	\N	\N	\N	\N
2547	2095	2	\N	\N	\N	\N	\N	\N
2548	2098	2	\N	\N	\N	\N	\N	\N
2549	2101	2	\N	\N	\N	\N	\N	\N
2551	2103	2	\N	\N	\N	\N	\N	\N
2552	2100	2	\N	\N	\N	\N	\N	\N
2553	2106	2	\N	\N	\N	\N	\N	\N
2554	2104	2	\N	\N	\N	\N	\N	\N
2555	2105	2	\N	\N	\N	\N	\N	\N
2556	2109	2	\N	\N	\N	\N	\N	\N
2557	2110	2	\N	\N	\N	\N	\N	\N
2558	2107	2	\N	\N	\N	\N	\N	\N
2559	2112	2	\N	\N	\N	\N	\N	\N
2560	2114	2	\N	\N	\N	\N	\N	\N
2561	2115	2	\N	\N	\N	\N	\N	\N
2562	2118	2	\N	\N	\N	\N	\N	\N
2563	2119	2	\N	\N	\N	\N	\N	\N
2564	2120	2	\N	\N	\N	\N	\N	\N
2565	2117	2	\N	\N	\N	\N	\N	\N
2566	2122	2	\N	\N	\N	\N	\N	\N
2567	2123	2	\N	\N	\N	\N	\N	\N
2568	2124	2	\N	\N	\N	\N	\N	\N
2569	2125	2	\N	\N	\N	\N	\N	\N
2570	2126	2	\N	\N	\N	\N	\N	\N
2571	2127	2	\N	\N	\N	\N	\N	\N
2572	2129	2	\N	\N	\N	\N	\N	\N
2573	2130	2	\N	\N	\N	\N	\N	\N
2574	2132	2	\N	\N	\N	\N	\N	\N
2575	2134	2	\N	\N	\N	\N	\N	\N
2576	2135	2	\N	\N	\N	\N	\N	\N
2577	2136	2	\N	\N	\N	\N	\N	\N
2578	2137	2	\N	\N	\N	\N	\N	\N
2579	2138	2	\N	\N	\N	\N	\N	\N
2580	2139	2	\N	\N	\N	\N	\N	\N
2581	2140	2	\N	\N	\N	\N	\N	\N
2582	2142	2	\N	\N	\N	\N	\N	\N
2583	2143	2	\N	\N	\N	\N	\N	\N
2584	2144	2	\N	\N	\N	\N	\N	\N
2585	2146	2	\N	\N	\N	\N	\N	\N
2586	2147	2	\N	\N	\N	\N	\N	\N
2587	2148	2	\N	\N	\N	\N	\N	\N
2588	2149	2	\N	\N	\N	\N	\N	\N
2589	2150	2	\N	\N	\N	\N	\N	\N
2590	2151	2	\N	\N	\N	\N	\N	\N
2591	2152	2	\N	\N	\N	\N	\N	\N
2592	2153	2	\N	\N	\N	\N	\N	\N
2593	2157	2	\N	\N	\N	\N	\N	\N
2594	2158	2	\N	\N	\N	\N	\N	\N
2595	2159	2	\N	\N	\N	\N	\N	\N
2596	2160	2	\N	\N	\N	\N	\N	\N
2597	2161	2	\N	\N	\N	\N	\N	\N
2598	2162	2	\N	\N	\N	\N	\N	\N
2599	2167	2	\N	\N	\N	\N	\N	\N
2600	2170	2	\N	\N	\N	\N	\N	\N
2601	2171	2	\N	\N	\N	\N	\N	\N
2602	2165	2	\N	\N	\N	\N	\N	\N
2603	2163	2	\N	\N	\N	\N	\N	\N
2604	2166	2	\N	\N	\N	\N	\N	\N
2605	2172	2	\N	\N	\N	\N	\N	\N
2606	2173	2	\N	\N	\N	\N	\N	\N
2607	2168	2	\N	\N	\N	\N	\N	\N
2608	2175	2	\N	\N	\N	\N	\N	\N
2609	2179	2	\N	\N	\N	\N	\N	\N
2610	2180	2	\N	\N	\N	\N	\N	\N
2611	2174	2	\N	\N	\N	\N	\N	\N
2612	2176	2	\N	\N	\N	\N	\N	\N
2613	2177	2	\N	\N	\N	\N	\N	\N
2614	2178	2	\N	\N	\N	\N	\N	\N
2615	2181	2	\N	\N	\N	\N	\N	\N
2616	2182	2	\N	\N	\N	\N	\N	\N
2617	2183	2	\N	\N	\N	\N	\N	\N
2618	2184	2	\N	\N	\N	\N	\N	\N
2619	2192	2	\N	\N	\N	\N	\N	\N
2620	2189	2	\N	\N	\N	\N	\N	\N
2621	2190	2	\N	\N	\N	\N	\N	\N
2622	2185	2	\N	\N	\N	\N	\N	\N
2623	2187	2	\N	\N	\N	\N	\N	\N
2624	2191	2	\N	\N	\N	\N	\N	\N
2625	2193	2	\N	\N	\N	\N	\N	\N
2626	2196	2	\N	\N	\N	\N	\N	\N
2627	2198	2	\N	\N	\N	\N	\N	\N
2628	2194	2	\N	\N	\N	\N	\N	\N
2629	2199	2	\N	\N	\N	\N	\N	\N
2630	2201	2	\N	\N	\N	\N	\N	\N
2631	2202	2	\N	\N	\N	\N	\N	\N
2632	2200	2	\N	\N	\N	\N	\N	\N
2633	2205	2	\N	\N	\N	\N	\N	\N
2634	2204	2	\N	\N	\N	\N	\N	\N
2635	2207	2	\N	\N	\N	\N	\N	\N
2636	2212	2	\N	\N	\N	\N	\N	\N
2637	2209	2	\N	\N	\N	\N	\N	\N
2638	2208	2	\N	\N	\N	\N	\N	\N
2639	2211	2	\N	\N	\N	\N	\N	\N
2641	2219	2	\N	\N	\N	\N	\N	\N
2642	2217	2	\N	\N	\N	\N	\N	\N
2643	2214	2	\N	\N	\N	\N	\N	\N
2644	2215	2	\N	\N	\N	\N	\N	\N
2645	2218	2	\N	\N	\N	\N	\N	\N
2646	2221	2	\N	\N	\N	\N	\N	\N
2647	2225	2	\N	\N	\N	\N	\N	\N
2648	2223	2	\N	\N	\N	\N	\N	\N
2650	2224	2	\N	\N	\N	\N	\N	\N
2651	2228	2	\N	\N	\N	\N	\N	\N
2652	2235	2	\N	\N	\N	\N	\N	\N
2653	2229	2	\N	\N	\N	\N	\N	\N
2654	2230	2	\N	\N	\N	\N	\N	\N
2655	2231	2	\N	\N	\N	\N	\N	\N
2656	2232	2	\N	\N	\N	\N	\N	\N
2657	2236	2	\N	\N	\N	\N	\N	\N
2658	2241	2	\N	\N	\N	\N	\N	\N
2659	2239	2	\N	\N	\N	\N	\N	\N
2660	2240	2	\N	\N	\N	\N	\N	\N
2661	2237	2	\N	\N	\N	\N	\N	\N
2662	2242	2	\N	\N	\N	\N	\N	\N
2663	2247	2	\N	\N	\N	\N	\N	\N
2664	2245	2	\N	\N	\N	\N	\N	\N
2666	2244	2	\N	\N	\N	\N	\N	\N
2668	2248	2	\N	\N	\N	\N	\N	\N
2669	2253	2	\N	\N	\N	\N	\N	\N
2667	2246	2	0.1652558140	15971403.9621016350	114433034.0000000000	-0.30	-8.62	-12.73
2665	2243	2	0.3609797443	669678.7808548546	86065491.0000000000	0.51	2.40	8.13
2640	2213	2	0.2731912145	1233936.2618432385	95616925.0000000000	0.22	-6.85	-9.85
2670	2251	2	\N	\N	\N	\N	\N	\N
2671	2249	2	\N	\N	\N	\N	\N	\N
2672	2250	2	\N	\N	\N	\N	\N	\N
2673	2255	2	\N	\N	\N	\N	\N	\N
2674	2260	2	\N	\N	\N	\N	\N	\N
2675	2257	2	\N	\N	\N	\N	\N	\N
2676	2256	2	\N	\N	\N	\N	\N	\N
2677	2258	2	\N	\N	\N	\N	\N	\N
2678	2259	2	\N	\N	\N	\N	\N	\N
2679	2261	2	\N	\N	\N	\N	\N	\N
2680	2265	2	\N	\N	\N	\N	\N	\N
2681	2263	2	\N	\N	\N	\N	\N	\N
2682	2264	2	\N	\N	\N	\N	\N	\N
2683	2262	2	\N	\N	\N	\N	\N	\N
2684	2266	2	\N	\N	\N	\N	\N	\N
2685	2271	2	\N	\N	\N	\N	\N	\N
2686	2268	2	\N	\N	\N	\N	\N	\N
2687	2269	2	\N	\N	\N	\N	\N	\N
2688	2270	2	\N	\N	\N	\N	\N	\N
2689	2267	2	\N	\N	\N	\N	\N	\N
2690	2272	2	\N	\N	\N	\N	\N	\N
2691	2276	2	\N	\N	\N	\N	\N	\N
2692	2273	2	\N	\N	\N	\N	\N	\N
2693	2274	2	\N	\N	\N	\N	\N	\N
2694	2275	2	\N	\N	\N	\N	\N	\N
2695	2277	2	\N	\N	\N	\N	\N	\N
2696	2282	2	\N	\N	\N	\N	\N	\N
2697	2278	2	\N	\N	\N	\N	\N	\N
2698	2281	2	\N	\N	\N	\N	\N	\N
2699	2279	2	\N	\N	\N	\N	\N	\N
2700	2280	2	\N	\N	\N	\N	\N	\N
2701	2283	2	\N	\N	\N	\N	\N	\N
2702	2286	2	\N	\N	\N	\N	\N	\N
2703	2287	2	\N	\N	\N	\N	\N	\N
2704	2284	2	\N	\N	\N	\N	\N	\N
2705	2285	2	\N	\N	\N	\N	\N	\N
2706	2288	2	\N	\N	\N	\N	\N	\N
2707	2295	2	\N	\N	\N	\N	\N	\N
2708	2289	2	\N	\N	\N	\N	\N	\N
2709	2291	2	\N	\N	\N	\N	\N	\N
2710	2290	2	\N	\N	\N	\N	\N	\N
2711	2293	2	\N	\N	\N	\N	\N	\N
2712	2300	2	\N	\N	\N	\N	\N	\N
2713	2297	2	\N	\N	\N	\N	\N	\N
2714	2298	2	\N	\N	\N	\N	\N	\N
2716	2296	2	\N	\N	\N	\N	\N	\N
2717	2304	2	\N	\N	\N	\N	\N	\N
2718	2306	2	\N	\N	\N	\N	\N	\N
2719	2305	2	\N	\N	\N	\N	\N	\N
2720	2303	2	\N	\N	\N	\N	\N	\N
2721	2308	2	\N	\N	\N	\N	\N	\N
2723	2312	2	\N	\N	\N	\N	\N	\N
2724	2310	2	\N	\N	\N	\N	\N	\N
2725	2311	2	\N	\N	\N	\N	\N	\N
2726	2309	2	\N	\N	\N	\N	\N	\N
2727	2313	2	\N	\N	\N	\N	\N	\N
2728	2317	2	\N	\N	\N	\N	\N	\N
2729	2318	2	\N	\N	\N	\N	\N	\N
2730	2315	2	\N	\N	\N	\N	\N	\N
2731	2316	2	\N	\N	\N	\N	\N	\N
2732	2314	2	\N	\N	\N	\N	\N	\N
2733	2320	2	\N	\N	\N	\N	\N	\N
2734	2325	2	\N	\N	\N	\N	\N	\N
2735	2324	2	\N	\N	\N	\N	\N	\N
2736	2321	2	\N	\N	\N	\N	\N	\N
2737	2323	2	\N	\N	\N	\N	\N	\N
2738	2326	2	\N	\N	\N	\N	\N	\N
2739	2327	2	\N	\N	\N	\N	\N	\N
2740	2332	2	\N	\N	\N	\N	\N	\N
2741	2329	2	\N	\N	\N	\N	\N	\N
2742	2330	2	\N	\N	\N	\N	\N	\N
2743	2333	2	\N	\N	\N	\N	\N	\N
2744	2334	2	\N	\N	\N	\N	\N	\N
2745	2335	2	\N	\N	\N	\N	\N	\N
2746	2337	2	\N	\N	\N	\N	\N	\N
2747	2338	2	\N	\N	\N	\N	\N	\N
2748	2336	2	\N	\N	\N	\N	\N	\N
2749	2331	2	\N	\N	\N	\N	\N	\N
2750	2340	2	\N	\N	\N	\N	\N	\N
2751	2343	2	\N	\N	\N	\N	\N	\N
2752	2344	2	\N	\N	\N	\N	\N	\N
2753	2341	2	\N	\N	\N	\N	\N	\N
2754	2342	2	\N	\N	\N	\N	\N	\N
2755	2345	2	\N	\N	\N	\N	\N	\N
2756	2350	2	\N	\N	\N	\N	\N	\N
2758	2347	2	\N	\N	\N	\N	\N	\N
2759	2349	2	\N	\N	\N	\N	\N	\N
2760	2348	2	\N	\N	\N	\N	\N	\N
2761	2351	2	\N	\N	\N	\N	\N	\N
2762	2355	2	\N	\N	\N	\N	\N	\N
2763	2353	2	\N	\N	\N	\N	\N	\N
2764	2352	2	\N	\N	\N	\N	\N	\N
2765	2354	2	\N	\N	\N	\N	\N	\N
2766	2356	2	\N	\N	\N	\N	\N	\N
2767	2361	2	\N	\N	\N	\N	\N	\N
2768	2357	2	\N	\N	\N	\N	\N	\N
2769	2359	2	\N	\N	\N	\N	\N	\N
2770	2358	2	\N	\N	\N	\N	\N	\N
2771	2360	2	\N	\N	\N	\N	\N	\N
2772	2362	2	\N	\N	\N	\N	\N	\N
2773	2367	2	\N	\N	\N	\N	\N	\N
2774	2363	2	\N	\N	\N	\N	\N	\N
2775	2364	2	\N	\N	\N	\N	\N	\N
2776	2366	2	\N	\N	\N	\N	\N	\N
2777	2368	2	\N	\N	\N	\N	\N	\N
2778	2373	2	\N	\N	\N	\N	\N	\N
2779	2372	2	\N	\N	\N	\N	\N	\N
2780	2371	2	\N	\N	\N	\N	\N	\N
2781	2370	2	\N	\N	\N	\N	\N	\N
2782	2369	2	\N	\N	\N	\N	\N	\N
2783	2375	2	\N	\N	\N	\N	\N	\N
2784	2378	2	\N	\N	\N	\N	\N	\N
2785	2376	2	\N	\N	\N	\N	\N	\N
2786	2377	2	\N	\N	\N	\N	\N	\N
2787	2374	2	\N	\N	\N	\N	\N	\N
2788	2381	2	\N	\N	\N	\N	\N	\N
2789	2384	2	\N	\N	\N	\N	\N	\N
2790	2383	2	\N	\N	\N	\N	\N	\N
2791	2379	2	\N	\N	\N	\N	\N	\N
2792	2382	2	\N	\N	\N	\N	\N	\N
2793	2380	2	\N	\N	\N	\N	\N	\N
2794	2385	2	\N	\N	\N	\N	\N	\N
2795	2390	2	\N	\N	\N	\N	\N	\N
2796	2386	2	\N	\N	\N	\N	\N	\N
2797	2387	2	\N	\N	\N	\N	\N	\N
2798	2389	2	\N	\N	\N	\N	\N	\N
2799	2391	2	\N	\N	\N	\N	\N	\N
2800	2397	2	\N	\N	\N	\N	\N	\N
2801	2394	2	\N	\N	\N	\N	\N	\N
2802	2395	2	\N	\N	\N	\N	\N	\N
2803	2392	2	\N	\N	\N	\N	\N	\N
2804	2396	2	\N	\N	\N	\N	\N	\N
2805	2398	2	\N	\N	\N	\N	\N	\N
2807	2399	2	\N	\N	\N	\N	\N	\N
2808	2400	2	\N	\N	\N	\N	\N	\N
2809	2402	2	\N	\N	\N	\N	\N	\N
2810	2404	2	\N	\N	\N	\N	\N	\N
2811	2409	2	\N	\N	\N	\N	\N	\N
2813	2406	2	\N	\N	\N	\N	\N	\N
2814	2407	2	\N	\N	\N	\N	\N	\N
2815	2408	2	\N	\N	\N	\N	\N	\N
2816	2410	2	\N	\N	\N	\N	\N	\N
2817	2414	2	\N	\N	\N	\N	\N	\N
2818	2411	2	\N	\N	\N	\N	\N	\N
2819	2412	2	\N	\N	\N	\N	\N	\N
2820	2413	2	\N	\N	\N	\N	\N	\N
2821	2415	2	\N	\N	\N	\N	\N	\N
2822	2421	2	\N	\N	\N	\N	\N	\N
2824	2418	2	\N	\N	\N	\N	\N	\N
2825	2420	2	\N	\N	\N	\N	\N	\N
2826	2419	2	\N	\N	\N	\N	\N	\N
2722	2307	2	1.1372265289	37598191.2144702800	118661020.0000000000	0.76	-5.00	-9.54
2823	2416	2	0.1371774332	12528165.3746770020	91072467.0000000000	5.68	1.97	-6.07
2827	2422	2	\N	\N	\N	\N	\N	\N
2828	2426	2	\N	\N	\N	\N	\N	\N
2829	2424	2	\N	\N	\N	\N	\N	\N
2830	2423	2	\N	\N	\N	\N	\N	\N
2831	2425	2	\N	\N	\N	\N	\N	\N
2832	2427	2	\N	\N	\N	\N	\N	\N
2834	2429	2	\N	\N	\N	\N	\N	\N
2835	2433	2	\N	\N	\N	\N	\N	\N
2836	2430	2	\N	\N	\N	\N	\N	\N
2837	2432	2	\N	\N	\N	\N	\N	\N
2838	2434	2	\N	\N	\N	\N	\N	\N
2839	2436	2	\N	\N	\N	\N	\N	\N
2840	2438	2	\N	\N	\N	\N	\N	\N
2841	2435	2	\N	\N	\N	\N	\N	\N
2842	2437	2	\N	\N	\N	\N	\N	\N
2843	2441	2	\N	\N	\N	\N	\N	\N
2844	2439	2	\N	\N	\N	\N	\N	\N
2845	2440	2	\N	\N	\N	\N	\N	\N
2846	2445	2	\N	\N	\N	\N	\N	\N
2847	2443	2	\N	\N	\N	\N	\N	\N
2848	2444	2	\N	\N	\N	\N	\N	\N
2849	2447	2	\N	\N	\N	\N	\N	\N
2850	2448	2	\N	\N	\N	\N	\N	\N
2851	2450	2	\N	\N	\N	\N	\N	\N
2852	2446	2	\N	\N	\N	\N	\N	\N
2853	2452	2	\N	\N	\N	\N	\N	\N
2854	2453	2	\N	\N	\N	\N	\N	\N
2855	2454	2	\N	\N	\N	\N	\N	\N
2856	2455	2	\N	\N	\N	\N	\N	\N
2857	2456	2	\N	\N	\N	\N	\N	\N
2858	2457	2	\N	\N	\N	\N	\N	\N
2859	2458	2	\N	\N	\N	\N	\N	\N
2860	2459	2	\N	\N	\N	\N	\N	\N
2861	2460	2	\N	\N	\N	\N	\N	\N
2862	2461	2	\N	\N	\N	\N	\N	\N
2863	2462	2	\N	\N	\N	\N	\N	\N
2864	2464	2	\N	\N	\N	\N	\N	\N
2865	2465	2	\N	\N	\N	\N	\N	\N
2866	2466	2	\N	\N	\N	\N	\N	\N
2867	2467	2	\N	\N	\N	\N	\N	\N
2868	2468	2	\N	\N	\N	\N	\N	\N
2870	2473	2	\N	\N	\N	\N	\N	\N
2871	2470	2	\N	\N	\N	\N	\N	\N
2872	2472	2	\N	\N	\N	\N	\N	\N
2873	2471	2	\N	\N	\N	\N	\N	\N
2874	2476	2	\N	\N	\N	\N	\N	\N
2875	2474	2	\N	\N	\N	\N	\N	\N
2876	2475	2	\N	\N	\N	\N	\N	\N
2877	2479	2	\N	\N	\N	\N	\N	\N
2878	2477	2	\N	\N	\N	\N	\N	\N
2879	2478	2	\N	\N	\N	\N	\N	\N
2880	2480	2	\N	\N	\N	\N	\N	\N
2881	2481	2	\N	\N	\N	\N	\N	\N
2882	2482	2	\N	\N	\N	\N	\N	\N
2883	2483	2	\N	\N	\N	\N	\N	\N
2884	2484	2	\N	\N	\N	\N	\N	\N
2885	2485	2	\N	\N	\N	\N	\N	\N
2886	2486	2	\N	\N	\N	\N	\N	\N
2887	2487	2	\N	\N	\N	\N	\N	\N
2888	2488	2	\N	\N	\N	\N	\N	\N
2889	2489	2	\N	\N	\N	\N	\N	\N
2890	2490	2	\N	\N	\N	\N	\N	\N
2891	2491	2	\N	\N	\N	\N	\N	\N
2893	2495	2	\N	\N	\N	\N	\N	\N
2895	2493	2	\N	\N	\N	\N	\N	\N
2896	2498	2	\N	\N	\N	\N	\N	\N
2897	2499	2	\N	\N	\N	\N	\N	\N
2898	2500	2	\N	\N	\N	\N	\N	\N
2899	2497	2	\N	\N	\N	\N	\N	\N
2900	2501	2	\N	\N	\N	\N	\N	\N
2902	2503	2	\N	\N	\N	\N	\N	\N
2903	2504	2	\N	\N	\N	\N	\N	\N
2904	2505	2	\N	\N	\N	\N	\N	\N
2905	2506	2	\N	\N	\N	\N	\N	\N
2906	2507	2	\N	\N	\N	\N	\N	\N
2907	2508	2	\N	\N	\N	\N	\N	\N
2908	2509	2	\N	\N	\N	\N	\N	\N
2909	2510	2	\N	\N	\N	\N	\N	\N
2910	2511	2	\N	\N	\N	\N	\N	\N
2911	2512	2	\N	\N	\N	\N	\N	\N
2912	2513	2	\N	\N	\N	\N	\N	\N
2913	2514	2	\N	\N	\N	\N	\N	\N
2914	2515	2	\N	\N	\N	\N	\N	\N
2915	2516	2	\N	\N	\N	\N	\N	\N
2916	2517	2	\N	\N	\N	\N	\N	\N
2917	2518	2	\N	\N	\N	\N	\N	\N
2918	2519	2	\N	\N	\N	\N	\N	\N
2919	2520	2	\N	\N	\N	\N	\N	\N
2920	2521	2	\N	\N	\N	\N	\N	\N
2921	2522	2	\N	\N	\N	\N	\N	\N
2922	2523	2	\N	\N	\N	\N	\N	\N
2923	2524	2	\N	\N	\N	\N	\N	\N
2924	2525	2	\N	\N	\N	\N	\N	\N
2925	2526	2	\N	\N	\N	\N	\N	\N
2926	2527	2	\N	\N	\N	\N	\N	\N
2927	2528	2	\N	\N	\N	\N	\N	\N
2928	2529	2	\N	\N	\N	\N	\N	\N
2930	2531	2	\N	\N	\N	\N	\N	\N
2931	2532	2	\N	\N	\N	\N	\N	\N
2932	2533	2	\N	\N	\N	\N	\N	\N
2933	2534	2	\N	\N	\N	\N	\N	\N
2934	2535	2	\N	\N	\N	\N	\N	\N
2935	2536	2	\N	\N	\N	\N	\N	\N
2936	2537	2	\N	\N	\N	\N	\N	\N
2937	2538	2	\N	\N	\N	\N	\N	\N
2938	2539	2	\N	\N	\N	\N	\N	\N
2939	2540	2	\N	\N	\N	\N	\N	\N
2940	2541	2	\N	\N	\N	\N	\N	\N
2941	2542	2	\N	\N	\N	\N	\N	\N
2942	2543	2	\N	\N	\N	\N	\N	\N
2943	2544	2	\N	\N	\N	\N	\N	\N
2944	2545	2	\N	\N	\N	\N	\N	\N
2945	2546	2	\N	\N	\N	\N	\N	\N
2946	2547	2	\N	\N	\N	\N	\N	\N
2947	2548	2	\N	\N	\N	\N	\N	\N
2948	2549	2	\N	\N	\N	\N	\N	\N
2949	2550	2	\N	\N	\N	\N	\N	\N
2950	2551	2	\N	\N	\N	\N	\N	\N
2951	2552	2	\N	\N	\N	\N	\N	\N
2952	2553	2	\N	\N	\N	\N	\N	\N
2953	2554	2	\N	\N	\N	\N	\N	\N
2954	2555	2	\N	\N	\N	\N	\N	\N
2955	2556	2	\N	\N	\N	\N	\N	\N
2956	2557	2	\N	\N	\N	\N	\N	\N
2957	2558	2	\N	\N	\N	\N	\N	\N
2958	2559	2	\N	\N	\N	\N	\N	\N
2959	2560	2	\N	\N	\N	\N	\N	\N
2960	2561	2	\N	\N	\N	\N	\N	\N
2961	2562	2	\N	\N	\N	\N	\N	\N
2962	2563	2	\N	\N	\N	\N	\N	\N
2963	2564	2	\N	\N	\N	\N	\N	\N
2964	2565	2	\N	\N	\N	\N	\N	\N
2966	2567	2	\N	\N	\N	\N	\N	\N
2967	2568	2	\N	\N	\N	\N	\N	\N
2968	2569	2	\N	\N	\N	\N	\N	\N
2969	2570	2	\N	\N	\N	\N	\N	\N
2970	2571	2	\N	\N	\N	\N	\N	\N
2971	2572	2	\N	\N	\N	\N	\N	\N
2972	2573	2	\N	\N	\N	\N	\N	\N
2974	2577	2	\N	\N	\N	\N	\N	\N
2975	2578	2	\N	\N	\N	\N	\N	\N
2976	2581	2	\N	\N	\N	\N	\N	\N
2977	2576	2	\N	\N	\N	\N	\N	\N
2978	2584	2	\N	\N	\N	\N	\N	\N
2979	2583	2	\N	\N	\N	\N	\N	\N
2980	2580	2	\N	\N	\N	\N	\N	\N
2981	2579	2	\N	\N	\N	\N	\N	\N
2983	2586	2	\N	\N	\N	\N	\N	\N
2973	2575	2	12.3701981051	226210.1636520241	253187527.0000000000	0.68	-6.15	-8.75
2892	2492	2	22.6203273040	6267743.3247200690	118216148.0000000000	0.37	-5.90	-12.72
2984	2582	2	\N	\N	\N	\N	\N	\N
2986	2589	2	\N	\N	\N	\N	\N	\N
2987	2587	2	\N	\N	\N	\N	\N	\N
2988	2590	2	\N	\N	\N	\N	\N	\N
2989	2594	2	\N	\N	\N	\N	\N	\N
2990	2595	2	\N	\N	\N	\N	\N	\N
2991	2592	2	\N	\N	\N	\N	\N	\N
2992	2593	2	\N	\N	\N	\N	\N	\N
2994	2596	2	\N	\N	\N	\N	\N	\N
2995	2600	2	\N	\N	\N	\N	\N	\N
2996	2598	2	\N	\N	\N	\N	\N	\N
2997	2599	2	\N	\N	\N	\N	\N	\N
2998	2597	2	\N	\N	\N	\N	\N	\N
2999	2601	2	\N	\N	\N	\N	\N	\N
3001	2605	2	\N	\N	\N	\N	\N	\N
3002	2604	2	\N	\N	\N	\N	\N	\N
3003	2602	2	\N	\N	\N	\N	\N	\N
3004	2603	2	\N	\N	\N	\N	\N	\N
3005	2607	2	\N	\N	\N	\N	\N	\N
3006	2611	2	\N	\N	\N	\N	\N	\N
3008	2609	2	\N	\N	\N	\N	\N	\N
3009	2610	2	\N	\N	\N	\N	\N	\N
3010	2612	2	\N	\N	\N	\N	\N	\N
3011	2618	2	\N	\N	\N	\N	\N	\N
3012	2617	2	\N	\N	\N	\N	\N	\N
3013	2615	2	\N	\N	\N	\N	\N	\N
3014	2614	2	\N	\N	\N	\N	\N	\N
3015	2616	2	\N	\N	\N	\N	\N	\N
3016	2619	2	\N	\N	\N	\N	\N	\N
3017	2625	2	\N	\N	\N	\N	\N	\N
3018	2620	2	\N	\N	\N	\N	\N	\N
3019	2621	2	\N	\N	\N	\N	\N	\N
3020	2624	2	\N	\N	\N	\N	\N	\N
3021	2626	2	\N	\N	\N	\N	\N	\N
3022	2631	2	\N	\N	\N	\N	\N	\N
3023	2628	2	\N	\N	\N	\N	\N	\N
3024	2629	2	\N	\N	\N	\N	\N	\N
3025	2627	2	\N	\N	\N	\N	\N	\N
3026	2630	2	\N	\N	\N	\N	\N	\N
3027	2632	2	\N	\N	\N	\N	\N	\N
3028	2636	2	\N	\N	\N	\N	\N	\N
3029	2635	2	\N	\N	\N	\N	\N	\N
3030	2633	2	\N	\N	\N	\N	\N	\N
3031	2634	2	\N	\N	\N	\N	\N	\N
3032	2637	2	\N	\N	\N	\N	\N	\N
3033	2642	2	\N	\N	\N	\N	\N	\N
3034	2639	2	\N	\N	\N	\N	\N	\N
3035	2641	2	\N	\N	\N	\N	\N	\N
3037	2640	2	\N	\N	\N	\N	\N	\N
3038	2643	2	\N	\N	\N	\N	\N	\N
3039	2644	2	\N	\N	\N	\N	\N	\N
3040	2645	2	\N	\N	\N	\N	\N	\N
3041	2646	2	\N	\N	\N	\N	\N	\N
3042	2647	2	\N	\N	\N	\N	\N	\N
3043	2648	2	\N	\N	\N	\N	\N	\N
3044	2649	2	\N	\N	\N	\N	\N	\N
3045	2650	2	\N	\N	\N	\N	\N	\N
3046	2651	2	\N	\N	\N	\N	\N	\N
3047	2652	2	\N	\N	\N	\N	\N	\N
3048	2653	2	\N	\N	\N	\N	\N	\N
3049	2657	2	\N	\N	\N	\N	\N	\N
3050	2656	2	\N	\N	\N	\N	\N	\N
3051	2655	2	\N	\N	\N	\N	\N	\N
3052	2654	2	\N	\N	\N	\N	\N	\N
3053	2658	2	\N	\N	\N	\N	\N	\N
3054	2663	2	\N	\N	\N	\N	\N	\N
3055	2661	2	\N	\N	\N	\N	\N	\N
3056	2659	2	\N	\N	\N	\N	\N	\N
3057	2662	2	\N	\N	\N	\N	\N	\N
3058	2660	2	\N	\N	\N	\N	\N	\N
3059	2664	2	\N	\N	\N	\N	\N	\N
3060	2668	2	\N	\N	\N	\N	\N	\N
3061	2665	2	\N	\N	\N	\N	\N	\N
3062	2666	2	\N	\N	\N	\N	\N	\N
3063	2667	2	\N	\N	\N	\N	\N	\N
3064	2669	2	\N	\N	\N	\N	\N	\N
3065	2674	2	\N	\N	\N	\N	\N	\N
3066	2671	2	\N	\N	\N	\N	\N	\N
3067	2670	2	\N	\N	\N	\N	\N	\N
3068	2673	2	\N	\N	\N	\N	\N	\N
3069	2672	2	\N	\N	\N	\N	\N	\N
3070	2675	2	\N	\N	\N	\N	\N	\N
3071	2678	2	\N	\N	\N	\N	\N	\N
3072	2679	2	\N	\N	\N	\N	\N	\N
3073	2677	2	\N	\N	\N	\N	\N	\N
3074	2676	2	\N	\N	\N	\N	\N	\N
3075	2680	2	\N	\N	\N	\N	\N	\N
3076	2685	2	\N	\N	\N	\N	\N	\N
3077	2681	2	\N	\N	\N	\N	\N	\N
3078	2683	2	\N	\N	\N	\N	\N	\N
3079	2682	2	\N	\N	\N	\N	\N	\N
3080	2684	2	\N	\N	\N	\N	\N	\N
3081	2686	2	\N	\N	\N	\N	\N	\N
3082	2690	2	\N	\N	\N	\N	\N	\N
3083	2688	2	\N	\N	\N	\N	\N	\N
3084	2689	2	\N	\N	\N	\N	\N	\N
3085	2687	2	\N	\N	\N	\N	\N	\N
3086	2691	2	\N	\N	\N	\N	\N	\N
3087	2694	2	\N	\N	\N	\N	\N	\N
3088	2692	2	\N	\N	\N	\N	\N	\N
3089	2693	2	\N	\N	\N	\N	\N	\N
3090	2695	2	\N	\N	\N	\N	\N	\N
3091	2703	2	\N	\N	\N	\N	\N	\N
3092	2701	2	\N	\N	\N	\N	\N	\N
3093	2699	2	\N	\N	\N	\N	\N	\N
3094	2702	2	\N	\N	\N	\N	\N	\N
3095	2698	2	\N	\N	\N	\N	\N	\N
3096	2696	2	\N	\N	\N	\N	\N	\N
3097	2704	2	\N	\N	\N	\N	\N	\N
3098	2708	2	\N	\N	\N	\N	\N	\N
3099	2705	2	\N	\N	\N	\N	\N	\N
3100	2706	2	\N	\N	\N	\N	\N	\N
3101	2709	2	\N	\N	\N	\N	\N	\N
3102	2715	2	\N	\N	\N	\N	\N	\N
3103	2710	2	\N	\N	\N	\N	\N	\N
3104	2712	2	\N	\N	\N	\N	\N	\N
3105	2711	2	\N	\N	\N	\N	\N	\N
3106	2713	2	\N	\N	\N	\N	\N	\N
3107	2714	2	\N	\N	\N	\N	\N	\N
3108	2717	2	\N	\N	\N	\N	\N	\N
3109	2719	2	\N	\N	\N	\N	\N	\N
3110	2720	2	\N	\N	\N	\N	\N	\N
3111	2718	2	\N	\N	\N	\N	\N	\N
3112	2721	2	\N	\N	\N	\N	\N	\N
3113	2727	2	\N	\N	\N	\N	\N	\N
3114	2722	2	\N	\N	\N	\N	\N	\N
3115	2723	2	\N	\N	\N	\N	\N	\N
3116	2724	2	\N	\N	\N	\N	\N	\N
3117	2725	2	\N	\N	\N	\N	\N	\N
3118	2726	2	\N	\N	\N	\N	\N	\N
3119	2729	2	\N	\N	\N	\N	\N	\N
3120	2732	2	\N	\N	\N	\N	\N	\N
3121	2730	2	\N	\N	\N	\N	\N	\N
3122	2731	2	\N	\N	\N	\N	\N	\N
3123	2733	2	\N	\N	\N	\N	\N	\N
3124	2739	2	\N	\N	\N	\N	\N	\N
3125	2736	2	\N	\N	\N	\N	\N	\N
3126	2735	2	\N	\N	\N	\N	\N	\N
3127	2738	2	\N	\N	\N	\N	\N	\N
3128	2734	2	\N	\N	\N	\N	\N	\N
3129	2737	2	\N	\N	\N	\N	\N	\N
3130	2740	2	\N	\N	\N	\N	\N	\N
3131	2743	2	\N	\N	\N	\N	\N	\N
3132	2741	2	\N	\N	\N	\N	\N	\N
3133	2742	2	\N	\N	\N	\N	\N	\N
3134	2744	2	\N	\N	\N	\N	\N	\N
3135	2749	2	\N	\N	\N	\N	\N	\N
3136	2747	2	\N	\N	\N	\N	\N	\N
3137	2750	2	\N	\N	\N	\N	\N	\N
3138	2746	2	\N	\N	\N	\N	\N	\N
3139	2748	2	\N	\N	\N	\N	\N	\N
3140	2752	2	\N	\N	\N	\N	\N	\N
2985	2588	2	0.1477950043	1974702.8423772608	89147298.0000000000	0.22	-8.22	-28.37
3141	2751	2	\N	\N	\N	\N	\N	\N
3142	2755	2	\N	\N	\N	\N	\N	\N
3143	2753	2	\N	\N	\N	\N	\N	\N
3144	2754	2	\N	\N	\N	\N	\N	\N
3145	2756	2	\N	\N	\N	\N	\N	\N
3146	2761	2	\N	\N	\N	\N	\N	\N
3147	2762	2	\N	\N	\N	\N	\N	\N
3148	2757	2	\N	\N	\N	\N	\N	\N
3149	2758	2	\N	\N	\N	\N	\N	\N
3150	2759	2	\N	\N	\N	\N	\N	\N
3151	2760	2	\N	\N	\N	\N	\N	\N
3152	2763	2	\N	\N	\N	\N	\N	\N
3153	2766	2	\N	\N	\N	\N	\N	\N
3154	2764	2	\N	\N	\N	\N	\N	\N
3155	2765	2	\N	\N	\N	\N	\N	\N
3156	2767	2	\N	\N	\N	\N	\N	\N
3157	2771	2	\N	\N	\N	\N	\N	\N
3158	2772	2	\N	\N	\N	\N	\N	\N
3159	2768	2	\N	\N	\N	\N	\N	\N
3160	2769	2	\N	\N	\N	\N	\N	\N
3161	2770	2	\N	\N	\N	\N	\N	\N
3162	2774	2	\N	\N	\N	\N	\N	\N
3163	2773	2	\N	\N	\N	\N	\N	\N
3164	2777	2	\N	\N	\N	\N	\N	\N
3165	2775	2	\N	\N	\N	\N	\N	\N
3166	2776	2	\N	\N	\N	\N	\N	\N
3167	2778	2	\N	\N	\N	\N	\N	\N
3168	2827	2	\N	\N	\N	\N	\N	\N
3169	2825	2	\N	\N	\N	\N	\N	\N
3170	2779	2	\N	\N	\N	\N	\N	\N
3171	2780	2	\N	\N	\N	\N	\N	\N
3172	2826	2	\N	\N	\N	\N	\N	\N
3173	2829	2	\N	\N	\N	\N	\N	\N
3174	2828	2	\N	\N	\N	\N	\N	\N
3175	2833	2	\N	\N	\N	\N	\N	\N
3176	2831	2	\N	\N	\N	\N	\N	\N
3177	2830	2	\N	\N	\N	\N	\N	\N
3178	2834	2	\N	\N	\N	\N	\N	\N
3179	2839	2	\N	\N	\N	\N	\N	\N
3180	2835	2	\N	\N	\N	\N	\N	\N
3181	2836	2	\N	\N	\N	\N	\N	\N
3182	2837	2	\N	\N	\N	\N	\N	\N
3183	2838	2	\N	\N	\N	\N	\N	\N
3184	2841	2	\N	\N	\N	\N	\N	\N
3185	2842	2	\N	\N	\N	\N	\N	\N
3186	2840	2	\N	\N	\N	\N	\N	\N
3187	2844	2	\N	\N	\N	\N	\N	\N
3188	2843	2	\N	\N	\N	\N	\N	\N
3189	2845	2	\N	\N	\N	\N	\N	\N
3190	2850	2	\N	\N	\N	\N	\N	\N
3191	2847	2	\N	\N	\N	\N	\N	\N
3192	2846	2	\N	\N	\N	\N	\N	\N
3193	2848	2	\N	\N	\N	\N	\N	\N
3194	2849	2	\N	\N	\N	\N	\N	\N
3195	2851	2	\N	\N	\N	\N	\N	\N
3196	2852	2	\N	\N	\N	\N	\N	\N
3197	2855	2	\N	\N	\N	\N	\N	\N
3198	2853	2	\N	\N	\N	\N	\N	\N
3199	2854	2	\N	\N	\N	\N	\N	\N
3200	2856	2	\N	\N	\N	\N	\N	\N
3201	2857	2	\N	\N	\N	\N	\N	\N
3202	2858	2	\N	\N	\N	\N	\N	\N
3203	2859	2	\N	\N	\N	\N	\N	\N
3204	2862	2	\N	\N	\N	\N	\N	\N
3205	2866	2	\N	\N	\N	\N	\N	\N
3206	2861	2	\N	\N	\N	\N	\N	\N
3207	2867	2	\N	\N	\N	\N	\N	\N
3208	2869	2	\N	\N	\N	\N	\N	\N
3209	2868	2	\N	\N	\N	\N	\N	\N
3210	2870	2	\N	\N	\N	\N	\N	\N
3212	4	3	\N	\N	\N	\N	\N	\N
3213	8	3	\N	\N	\N	\N	\N	\N
3215	6	3	\N	\N	\N	\N	\N	\N
3216	5	3	\N	\N	\N	\N	\N	\N
3217	9	3	\N	\N	\N	\N	\N	\N
3218	3	3	\N	\N	\N	\N	\N	\N
3219	13	3	\N	\N	\N	\N	\N	\N
3220	10	3	\N	\N	\N	\N	\N	\N
3221	14	3	\N	\N	\N	\N	\N	\N
3222	16	3	\N	\N	\N	\N	\N	\N
3223	18	3	\N	\N	\N	\N	\N	\N
3224	25	3	\N	\N	\N	\N	\N	\N
3225	31	3	\N	\N	\N	\N	\N	\N
3226	32	3	\N	\N	\N	\N	\N	\N
3227	34	3	\N	\N	\N	\N	\N	\N
3228	37	3	\N	\N	\N	\N	\N	\N
3229	35	3	\N	\N	\N	\N	\N	\N
3230	41	3	\N	\N	\N	\N	\N	\N
3231	42	3	\N	\N	\N	\N	\N	\N
3232	43	3	\N	\N	\N	\N	\N	\N
3233	45	3	\N	\N	\N	\N	\N	\N
3234	49	3	\N	\N	\N	\N	\N	\N
3235	50	3	\N	\N	\N	\N	\N	\N
3236	51	3	\N	\N	\N	\N	\N	\N
3237	53	3	\N	\N	\N	\N	\N	\N
3238	56	3	\N	\N	\N	\N	\N	\N
3240	57	3	\N	\N	\N	\N	\N	\N
3241	58	3	\N	\N	\N	\N	\N	\N
3242	61	3	\N	\N	\N	\N	\N	\N
3243	63	3	\N	\N	\N	\N	\N	\N
3244	64	3	\N	\N	\N	\N	\N	\N
3246	67	3	\N	\N	\N	\N	\N	\N
3247	68	3	\N	\N	\N	\N	\N	\N
3248	69	3	\N	\N	\N	\N	\N	\N
3249	70	3	\N	\N	\N	\N	\N	\N
3250	71	3	\N	\N	\N	\N	\N	\N
3251	72	3	\N	\N	\N	\N	\N	\N
3253	75	3	\N	\N	\N	\N	\N	\N
3254	76	3	\N	\N	\N	\N	\N	\N
3255	77	3	\N	\N	\N	\N	\N	\N
3256	78	3	\N	\N	\N	\N	\N	\N
3257	79	3	\N	\N	\N	\N	\N	\N
3258	80	3	\N	\N	\N	\N	\N	\N
3259	83	3	\N	\N	\N	\N	\N	\N
3260	84	3	\N	\N	\N	\N	\N	\N
3261	87	3	\N	\N	\N	\N	\N	\N
3262	88	3	\N	\N	\N	\N	\N	\N
3263	89	3	\N	\N	\N	\N	\N	\N
3264	90	3	\N	\N	\N	\N	\N	\N
3265	93	3	\N	\N	\N	\N	\N	\N
3266	99	3	\N	\N	\N	\N	\N	\N
3267	101	3	\N	\N	\N	\N	\N	\N
3268	103	3	\N	\N	\N	\N	\N	\N
3270	113	3	\N	\N	\N	\N	\N	\N
3271	114	3	\N	\N	\N	\N	\N	\N
3272	117	3	\N	\N	\N	\N	\N	\N
3274	120	3	\N	\N	\N	\N	\N	\N
3275	121	3	\N	\N	\N	\N	\N	\N
3276	122	3	\N	\N	\N	\N	\N	\N
3277	125	3	\N	\N	\N	\N	\N	\N
3278	128	3	\N	\N	\N	\N	\N	\N
3279	129	3	\N	\N	\N	\N	\N	\N
3280	130	3	\N	\N	\N	\N	\N	\N
3282	132	3	\N	\N	\N	\N	\N	\N
3283	134	3	\N	\N	\N	\N	\N	\N
3284	135	3	\N	\N	\N	\N	\N	\N
3285	138	3	\N	\N	\N	\N	\N	\N
3286	141	3	\N	\N	\N	\N	\N	\N
3287	142	3	\N	\N	\N	\N	\N	\N
3288	145	3	\N	\N	\N	\N	\N	\N
3289	148	3	\N	\N	\N	\N	\N	\N
3290	150	3	\N	\N	\N	\N	\N	\N
3291	151	3	\N	\N	\N	\N	\N	\N
3292	154	3	\N	\N	\N	\N	\N	\N
3293	159	3	\N	\N	\N	\N	\N	\N
3294	160	3	\N	\N	\N	\N	\N	\N
3295	161	3	\N	\N	\N	\N	\N	\N
3296	164	3	\N	\N	\N	\N	\N	\N
3297	168	3	\N	\N	\N	\N	\N	\N
3252	74	3	0.0000004418	666.3723026401	50796.0000000000	-0.32	-0.17	-0.44
3273	118	3	0.0000008893	482.1353465837	25621.0000000000	-0.20	-5.83	12.60
3245	66	3	0.0000165668	469.8663537427	16550.0000000000	0.14	-0.73	-6.87
3298	170	3	\N	\N	\N	\N	\N	\N
3299	174	3	\N	\N	\N	\N	\N	\N
3300	175	3	\N	\N	\N	\N	\N	\N
3301	181	3	\N	\N	\N	\N	\N	\N
3302	182	3	\N	\N	\N	\N	\N	\N
3303	206	3	\N	\N	\N	\N	\N	\N
3304	201	3	\N	\N	\N	\N	\N	\N
3306	205	3	\N	\N	\N	\N	\N	\N
3307	199	3	\N	\N	\N	\N	\N	\N
3308	218	3	\N	\N	\N	\N	\N	\N
3309	215	3	\N	\N	\N	\N	\N	\N
3310	217	3	\N	\N	\N	\N	\N	\N
3311	212	3	\N	\N	\N	\N	\N	\N
3312	221	3	\N	\N	\N	\N	\N	\N
3313	224	3	\N	\N	\N	\N	\N	\N
3314	233	3	\N	\N	\N	\N	\N	\N
3315	234	3	\N	\N	\N	\N	\N	\N
3316	254	3	\N	\N	\N	\N	\N	\N
3317	257	3	\N	\N	\N	\N	\N	\N
3318	258	3	\N	\N	\N	\N	\N	\N
3319	269	3	\N	\N	\N	\N	\N	\N
3320	260	3	\N	\N	\N	\N	\N	\N
3321	263	3	\N	\N	\N	\N	\N	\N
3322	268	3	\N	\N	\N	\N	\N	\N
3323	275	3	\N	\N	\N	\N	\N	\N
3324	276	3	\N	\N	\N	\N	\N	\N
3325	287	3	\N	\N	\N	\N	\N	\N
3326	290	3	\N	\N	\N	\N	\N	\N
3327	278	3	\N	\N	\N	\N	\N	\N
3328	279	3	\N	\N	\N	\N	\N	\N
3330	293	3	\N	\N	\N	\N	\N	\N
3331	295	3	\N	\N	\N	\N	\N	\N
3332	298	3	\N	\N	\N	\N	\N	\N
3333	304	3	\N	\N	\N	\N	\N	\N
3334	312	3	\N	\N	\N	\N	\N	\N
3335	313	3	\N	\N	\N	\N	\N	\N
3336	316	3	\N	\N	\N	\N	\N	\N
3337	317	3	\N	\N	\N	\N	\N	\N
3338	322	3	\N	\N	\N	\N	\N	\N
3339	323	3	\N	\N	\N	\N	\N	\N
3340	325	3	\N	\N	\N	\N	\N	\N
3342	331	3	\N	\N	\N	\N	\N	\N
3343	333	3	\N	\N	\N	\N	\N	\N
3344	334	3	\N	\N	\N	\N	\N	\N
3345	337	3	\N	\N	\N	\N	\N	\N
3346	338	3	\N	\N	\N	\N	\N	\N
3347	341	3	\N	\N	\N	\N	\N	\N
3348	344	3	\N	\N	\N	\N	\N	\N
3349	350	3	\N	\N	\N	\N	\N	\N
3350	353	3	\N	\N	\N	\N	\N	\N
3351	356	3	\N	\N	\N	\N	\N	\N
3352	360	3	\N	\N	\N	\N	\N	\N
3353	362	3	\N	\N	\N	\N	\N	\N
3354	366	3	\N	\N	\N	\N	\N	\N
3355	367	3	\N	\N	\N	\N	\N	\N
3356	370	3	\N	\N	\N	\N	\N	\N
3358	374	3	\N	\N	\N	\N	\N	\N
3359	377	3	\N	\N	\N	\N	\N	\N
3360	382	3	\N	\N	\N	\N	\N	\N
3361	385	3	\N	\N	\N	\N	\N	\N
3362	386	3	\N	\N	\N	\N	\N	\N
3363	389	3	\N	\N	\N	\N	\N	\N
3364	400	3	\N	\N	\N	\N	\N	\N
3365	405	3	\N	\N	\N	\N	\N	\N
3366	415	3	\N	\N	\N	\N	\N	\N
3367	411	3	\N	\N	\N	\N	\N	\N
3368	406	3	\N	\N	\N	\N	\N	\N
3369	416	3	\N	\N	\N	\N	\N	\N
3370	426	3	\N	\N	\N	\N	\N	\N
3371	448	3	\N	\N	\N	\N	\N	\N
3372	460	3	\N	\N	\N	\N	\N	\N
3373	450	3	\N	\N	\N	\N	\N	\N
3374	467	3	\N	\N	\N	\N	\N	\N
3376	461	3	\N	\N	\N	\N	\N	\N
3377	477	3	\N	\N	\N	\N	\N	\N
3378	476	3	\N	\N	\N	\N	\N	\N
3379	513	3	\N	\N	\N	\N	\N	\N
3380	468	3	\N	\N	\N	\N	\N	\N
3381	506	3	\N	\N	\N	\N	\N	\N
3383	502	3	\N	\N	\N	\N	\N	\N
3384	520	3	\N	\N	\N	\N	\N	\N
3385	470	3	\N	\N	\N	\N	\N	\N
3386	501	3	\N	\N	\N	\N	\N	\N
3387	495	3	\N	\N	\N	\N	\N	\N
3388	525	3	\N	\N	\N	\N	\N	\N
3389	536	3	\N	\N	\N	\N	\N	\N
3391	543	3	\N	\N	\N	\N	\N	\N
3392	545	3	\N	\N	\N	\N	\N	\N
3393	549	3	\N	\N	\N	\N	\N	\N
3394	551	3	\N	\N	\N	\N	\N	\N
3395	576	3	\N	\N	\N	\N	\N	\N
3396	572	3	\N	\N	\N	\N	\N	\N
3398	573	3	\N	\N	\N	\N	\N	\N
3399	584	3	\N	\N	\N	\N	\N	\N
3400	588	3	\N	\N	\N	\N	\N	\N
3401	594	3	\N	\N	\N	\N	\N	\N
3402	597	3	\N	\N	\N	\N	\N	\N
3403	606	3	\N	\N	\N	\N	\N	\N
3404	601	3	\N	\N	\N	\N	\N	\N
3405	624	3	\N	\N	\N	\N	\N	\N
3406	625	3	\N	\N	\N	\N	\N	\N
3407	623	3	\N	\N	\N	\N	\N	\N
3408	626	3	\N	\N	\N	\N	\N	\N
3409	627	3	\N	\N	\N	\N	\N	\N
3410	629	3	\N	\N	\N	\N	\N	\N
3411	633	3	\N	\N	\N	\N	\N	\N
3412	638	3	\N	\N	\N	\N	\N	\N
3413	643	3	\N	\N	\N	\N	\N	\N
3414	644	3	\N	\N	\N	\N	\N	\N
3415	654	3	\N	\N	\N	\N	\N	\N
3416	656	3	\N	\N	\N	\N	\N	\N
3417	659	3	\N	\N	\N	\N	\N	\N
3418	660	3	\N	\N	\N	\N	\N	\N
3419	666	3	\N	\N	\N	\N	\N	\N
3420	680	3	\N	\N	\N	\N	\N	\N
3422	699	3	\N	\N	\N	\N	\N	\N
3423	702	3	\N	\N	\N	\N	\N	\N
3424	703	3	\N	\N	\N	\N	\N	\N
3425	706	3	\N	\N	\N	\N	\N	\N
3426	707	3	\N	\N	\N	\N	\N	\N
3427	708	3	\N	\N	\N	\N	\N	\N
3428	719	3	\N	\N	\N	\N	\N	\N
3429	720	3	\N	\N	\N	\N	\N	\N
3430	723	3	\N	\N	\N	\N	\N	\N
3431	730	3	\N	\N	\N	\N	\N	\N
3432	733	3	\N	\N	\N	\N	\N	\N
3433	734	3	\N	\N	\N	\N	\N	\N
3434	747	3	\N	\N	\N	\N	\N	\N
3435	760	3	\N	\N	\N	\N	\N	\N
3436	764	3	\N	\N	\N	\N	\N	\N
3437	766	3	\N	\N	\N	\N	\N	\N
3438	778	3	\N	\N	\N	\N	\N	\N
3439	781	3	\N	\N	\N	\N	\N	\N
3440	785	3	\N	\N	\N	\N	\N	\N
3441	788	3	\N	\N	\N	\N	\N	\N
3442	789	3	\N	\N	\N	\N	\N	\N
3443	795	3	\N	\N	\N	\N	\N	\N
3444	796	3	\N	\N	\N	\N	\N	\N
3445	797	3	\N	\N	\N	\N	\N	\N
3446	799	3	\N	\N	\N	\N	\N	\N
3447	812	3	\N	\N	\N	\N	\N	\N
3448	813	3	\N	\N	\N	\N	\N	\N
3449	815	3	\N	\N	\N	\N	\N	\N
3450	818	3	\N	\N	\N	\N	\N	\N
3451	819	3	\N	\N	\N	\N	\N	\N
3452	823	3	\N	\N	\N	\N	\N	\N
3454	814	3	\N	\N	\N	\N	\N	\N
3421	693	3	0.0000041830	980.2232277165	62973.0000000000	1.41	-3.68	-7.26
3305	213	3	0.0003925793	71.7259361150	23686.0000000000	0.11	0.11	-5.89
3390	541	3	0.0000322095	107.2786245317	17253.0000000000	-0.20	-3.52	-10.75
3455	831	3	\N	\N	\N	\N	\N	\N
3456	833	3	\N	\N	\N	\N	\N	\N
3457	836	3	\N	\N	\N	\N	\N	\N
3458	837	3	\N	\N	\N	\N	\N	\N
3459	841	3	\N	\N	\N	\N	\N	\N
3460	853	3	\N	\N	\N	\N	\N	\N
3461	855	3	\N	\N	\N	\N	\N	\N
3462	857	3	\N	\N	\N	\N	\N	\N
3463	859	3	\N	\N	\N	\N	\N	\N
3464	869	3	\N	\N	\N	\N	\N	\N
3465	870	3	\N	\N	\N	\N	\N	\N
3467	890	3	\N	\N	\N	\N	\N	\N
3468	892	3	\N	\N	\N	\N	\N	\N
3469	894	3	\N	\N	\N	\N	\N	\N
3470	895	3	\N	\N	\N	\N	\N	\N
3471	898	3	\N	\N	\N	\N	\N	\N
3472	911	3	\N	\N	\N	\N	\N	\N
3473	912	3	\N	\N	\N	\N	\N	\N
3474	914	3	\N	\N	\N	\N	\N	\N
3475	916	3	\N	\N	\N	\N	\N	\N
3476	918	3	\N	\N	\N	\N	\N	\N
3477	920	3	\N	\N	\N	\N	\N	\N
3478	921	3	\N	\N	\N	\N	\N	\N
3479	924	3	\N	\N	\N	\N	\N	\N
3480	933	3	\N	\N	\N	\N	\N	\N
3481	934	3	\N	\N	\N	\N	\N	\N
3482	938	3	\N	\N	\N	\N	\N	\N
3483	939	3	\N	\N	\N	\N	\N	\N
3484	945	3	\N	\N	\N	\N	\N	\N
3485	948	3	\N	\N	\N	\N	\N	\N
3486	951	3	\N	\N	\N	\N	\N	\N
3487	954	3	\N	\N	\N	\N	\N	\N
3488	959	3	\N	\N	\N	\N	\N	\N
3489	960	3	\N	\N	\N	\N	\N	\N
3490	964	3	\N	\N	\N	\N	\N	\N
3491	965	3	\N	\N	\N	\N	\N	\N
3492	977	3	\N	\N	\N	\N	\N	\N
3493	978	3	\N	\N	\N	\N	\N	\N
3494	983	3	\N	\N	\N	\N	\N	\N
3495	986	3	\N	\N	\N	\N	\N	\N
3496	988	3	\N	\N	\N	\N	\N	\N
3497	990	3	\N	\N	\N	\N	\N	\N
3498	992	3	\N	\N	\N	\N	\N	\N
3499	993	3	\N	\N	\N	\N	\N	\N
3500	994	3	\N	\N	\N	\N	\N	\N
3501	998	3	\N	\N	\N	\N	\N	\N
3502	999	3	\N	\N	\N	\N	\N	\N
3503	1002	3	\N	\N	\N	\N	\N	\N
3504	1004	3	\N	\N	\N	\N	\N	\N
3505	1008	3	\N	\N	\N	\N	\N	\N
3506	1010	3	\N	\N	\N	\N	\N	\N
3507	1019	3	\N	\N	\N	\N	\N	\N
3508	1020	3	\N	\N	\N	\N	\N	\N
3509	1022	3	\N	\N	\N	\N	\N	\N
3510	1026	3	\N	\N	\N	\N	\N	\N
3512	1028	3	\N	\N	\N	\N	\N	\N
3513	1032	3	\N	\N	\N	\N	\N	\N
3514	1033	3	\N	\N	\N	\N	\N	\N
3515	1035	3	\N	\N	\N	\N	\N	\N
3516	1038	3	\N	\N	\N	\N	\N	\N
3518	1044	3	\N	\N	\N	\N	\N	\N
3519	1050	3	\N	\N	\N	\N	\N	\N
3520	1052	3	\N	\N	\N	\N	\N	\N
3521	1053	3	\N	\N	\N	\N	\N	\N
3522	1058	3	\N	\N	\N	\N	\N	\N
3523	1063	3	\N	\N	\N	\N	\N	\N
3524	1066	3	\N	\N	\N	\N	\N	\N
3525	1069	3	\N	\N	\N	\N	\N	\N
3526	1070	3	\N	\N	\N	\N	\N	\N
3527	1082	3	\N	\N	\N	\N	\N	\N
3528	1084	3	\N	\N	\N	\N	\N	\N
3529	1085	3	\N	\N	\N	\N	\N	\N
3531	1089	3	\N	\N	\N	\N	\N	\N
3532	1090	3	\N	\N	\N	\N	\N	\N
3533	1093	3	\N	\N	\N	\N	\N	\N
3534	1100	3	\N	\N	\N	\N	\N	\N
3536	1106	3	\N	\N	\N	\N	\N	\N
3537	1107	3	\N	\N	\N	\N	\N	\N
3538	1109	3	\N	\N	\N	\N	\N	\N
3539	1110	3	\N	\N	\N	\N	\N	\N
3540	1111	3	\N	\N	\N	\N	\N	\N
3541	1113	3	\N	\N	\N	\N	\N	\N
3542	1120	3	\N	\N	\N	\N	\N	\N
3543	1123	3	\N	\N	\N	\N	\N	\N
3544	1125	3	\N	\N	\N	\N	\N	\N
3545	1131	3	\N	\N	\N	\N	\N	\N
3546	1135	3	\N	\N	\N	\N	\N	\N
3547	1136	3	\N	\N	\N	\N	\N	\N
3548	1141	3	\N	\N	\N	\N	\N	\N
3549	1146	3	\N	\N	\N	\N	\N	\N
3550	1147	3	\N	\N	\N	\N	\N	\N
3551	1148	3	\N	\N	\N	\N	\N	\N
3552	1153	3	\N	\N	\N	\N	\N	\N
3553	1154	3	\N	\N	\N	\N	\N	\N
3554	1156	3	\N	\N	\N	\N	\N	\N
3555	1159	3	\N	\N	\N	\N	\N	\N
3556	1164	3	\N	\N	\N	\N	\N	\N
3557	1155	3	\N	\N	\N	\N	\N	\N
3558	1165	3	\N	\N	\N	\N	\N	\N
3560	1175	3	\N	\N	\N	\N	\N	\N
3561	1176	3	\N	\N	\N	\N	\N	\N
3562	1172	3	\N	\N	\N	\N	\N	\N
3564	1180	3	\N	\N	\N	\N	\N	\N
3565	1193	3	\N	\N	\N	\N	\N	\N
3566	1194	3	\N	\N	\N	\N	\N	\N
3567	1182	3	\N	\N	\N	\N	\N	\N
3568	1191	3	\N	\N	\N	\N	\N	\N
3569	1185	3	\N	\N	\N	\N	\N	\N
3570	1195	3	\N	\N	\N	\N	\N	\N
3571	1208	3	\N	\N	\N	\N	\N	\N
3572	1206	3	\N	\N	\N	\N	\N	\N
3573	1200	3	\N	\N	\N	\N	\N	\N
3574	1198	3	\N	\N	\N	\N	\N	\N
3575	1209	3	\N	\N	\N	\N	\N	\N
3576	1210	3	\N	\N	\N	\N	\N	\N
3577	1212	3	\N	\N	\N	\N	\N	\N
3578	1213	3	\N	\N	\N	\N	\N	\N
3580	1216	3	\N	\N	\N	\N	\N	\N
3581	1218	3	\N	\N	\N	\N	\N	\N
3582	1226	3	\N	\N	\N	\N	\N	\N
3584	1234	3	\N	\N	\N	\N	\N	\N
3585	1241	3	\N	\N	\N	\N	\N	\N
3586	1223	3	\N	\N	\N	\N	\N	\N
3587	1238	3	\N	\N	\N	\N	\N	\N
3588	1244	3	\N	\N	\N	\N	\N	\N
3589	1249	3	\N	\N	\N	\N	\N	\N
3590	1248	3	\N	\N	\N	\N	\N	\N
3591	1250	3	\N	\N	\N	\N	\N	\N
3592	1247	3	\N	\N	\N	\N	\N	\N
3594	1251	3	\N	\N	\N	\N	\N	\N
3595	1256	3	\N	\N	\N	\N	\N	\N
3596	1257	3	\N	\N	\N	\N	\N	\N
3597	1252	3	\N	\N	\N	\N	\N	\N
3598	1254	3	\N	\N	\N	\N	\N	\N
3599	1259	3	\N	\N	\N	\N	\N	\N
3600	1271	3	\N	\N	\N	\N	\N	\N
3601	1264	3	\N	\N	\N	\N	\N	\N
3602	1268	3	\N	\N	\N	\N	\N	\N
3603	1266	3	\N	\N	\N	\N	\N	\N
3604	1269	3	\N	\N	\N	\N	\N	\N
3606	1281	3	\N	\N	\N	\N	\N	\N
3607	1275	3	\N	\N	\N	\N	\N	\N
3608	1276	3	\N	\N	\N	\N	\N	\N
3609	1279	3	\N	\N	\N	\N	\N	\N
3610	1282	3	\N	\N	\N	\N	\N	\N
3611	1288	3	\N	\N	\N	\N	\N	\N
3583	1229	3	0.0167221717	75.4563266064	33444.0000000000	-0.17	-2.34	-5.57
3559	1169	3	0.0003513075	146.1500927247	19866.0000000000	-0.84	-3.79	-14.59
3530	1087	3	0.0017632505	40.8347764654	15420.0000000000	0.48	-0.47	8.55
3579	1214	3	0.0009112268	1177.1258196666	97681.0000000000	0.15	-2.75	-11.33
3612	1283	3	\N	\N	\N	\N	\N	\N
3613	1284	3	\N	\N	\N	\N	\N	\N
3614	1285	3	\N	\N	\N	\N	\N	\N
3615	1286	3	\N	\N	\N	\N	\N	\N
3616	1291	3	\N	\N	\N	\N	\N	\N
3617	1294	3	\N	\N	\N	\N	\N	\N
3618	1297	3	\N	\N	\N	\N	\N	\N
3619	1298	3	\N	\N	\N	\N	\N	\N
3620	1299	3	\N	\N	\N	\N	\N	\N
3621	1303	3	\N	\N	\N	\N	\N	\N
3622	1304	3	\N	\N	\N	\N	\N	\N
3623	1306	3	\N	\N	\N	\N	\N	\N
3624	1308	3	\N	\N	\N	\N	\N	\N
3625	1309	3	\N	\N	\N	\N	\N	\N
3626	1312	3	\N	\N	\N	\N	\N	\N
3627	1323	3	\N	\N	\N	\N	\N	\N
3628	1322	3	\N	\N	\N	\N	\N	\N
3631	1334	3	\N	\N	\N	\N	\N	\N
3632	1348	3	\N	\N	\N	\N	\N	\N
3633	1340	3	\N	\N	\N	\N	\N	\N
3634	1336	3	\N	\N	\N	\N	\N	\N
3636	1341	3	\N	\N	\N	\N	\N	\N
3637	1351	3	\N	\N	\N	\N	\N	\N
3638	1358	3	\N	\N	\N	\N	\N	\N
3639	1353	3	\N	\N	\N	\N	\N	\N
3640	1357	3	\N	\N	\N	\N	\N	\N
3641	1352	3	\N	\N	\N	\N	\N	\N
3642	1361	3	\N	\N	\N	\N	\N	\N
3643	1367	3	\N	\N	\N	\N	\N	\N
3644	1368	3	\N	\N	\N	\N	\N	\N
3646	1375	3	\N	\N	\N	\N	\N	\N
3647	1371	3	\N	\N	\N	\N	\N	\N
3648	1379	3	\N	\N	\N	\N	\N	\N
3649	1380	3	\N	\N	\N	\N	\N	\N
3650	1381	3	\N	\N	\N	\N	\N	\N
3651	1382	3	\N	\N	\N	\N	\N	\N
3652	1387	3	\N	\N	\N	\N	\N	\N
3653	1391	3	\N	\N	\N	\N	\N	\N
3654	1392	3	\N	\N	\N	\N	\N	\N
3655	1389	3	\N	\N	\N	\N	\N	\N
3656	1395	3	\N	\N	\N	\N	\N	\N
3657	1390	3	\N	\N	\N	\N	\N	\N
3658	1396	3	\N	\N	\N	\N	\N	\N
3659	1398	3	\N	\N	\N	\N	\N	\N
3660	1399	3	\N	\N	\N	\N	\N	\N
3661	1397	3	\N	\N	\N	\N	\N	\N
3662	1400	3	\N	\N	\N	\N	\N	\N
3663	1405	3	\N	\N	\N	\N	\N	\N
3664	1393	3	\N	\N	\N	\N	\N	\N
3665	1403	3	\N	\N	\N	\N	\N	\N
3666	1409	3	\N	\N	\N	\N	\N	\N
3668	1408	3	\N	\N	\N	\N	\N	\N
3669	1418	3	\N	\N	\N	\N	\N	\N
3670	1420	3	\N	\N	\N	\N	\N	\N
3671	1421	3	\N	\N	\N	\N	\N	\N
3672	1423	3	\N	\N	\N	\N	\N	\N
3673	1425	3	\N	\N	\N	\N	\N	\N
3674	1429	3	\N	\N	\N	\N	\N	\N
3675	1434	3	\N	\N	\N	\N	\N	\N
3676	1435	3	\N	\N	\N	\N	\N	\N
3677	1436	3	\N	\N	\N	\N	\N	\N
3679	1438	3	\N	\N	\N	\N	\N	\N
3680	1439	3	\N	\N	\N	\N	\N	\N
3681	1442	3	\N	\N	\N	\N	\N	\N
3682	1447	3	\N	\N	\N	\N	\N	\N
3683	1448	3	\N	\N	\N	\N	\N	\N
3684	1449	3	\N	\N	\N	\N	\N	\N
3685	1454	3	\N	\N	\N	\N	\N	\N
3687	1456	3	\N	\N	\N	\N	\N	\N
3688	1457	3	\N	\N	\N	\N	\N	\N
3689	1459	3	\N	\N	\N	\N	\N	\N
3690	1463	3	\N	\N	\N	\N	\N	\N
3691	1464	3	\N	\N	\N	\N	\N	\N
3692	1465	3	\N	\N	\N	\N	\N	\N
3693	1466	3	\N	\N	\N	\N	\N	\N
3694	1468	3	\N	\N	\N	\N	\N	\N
3695	1469	3	\N	\N	\N	\N	\N	\N
3696	1472	3	\N	\N	\N	\N	\N	\N
3697	1473	3	\N	\N	\N	\N	\N	\N
3698	1474	3	\N	\N	\N	\N	\N	\N
3699	1475	3	\N	\N	\N	\N	\N	\N
3700	1481	3	\N	\N	\N	\N	\N	\N
3701	1483	3	\N	\N	\N	\N	\N	\N
3702	1485	3	\N	\N	\N	\N	\N	\N
3703	1478	3	\N	\N	\N	\N	\N	\N
3704	1480	3	\N	\N	\N	\N	\N	\N
3705	1486	3	\N	\N	\N	\N	\N	\N
3706	1492	3	\N	\N	\N	\N	\N	\N
3707	1495	3	\N	\N	\N	\N	\N	\N
3708	1489	3	\N	\N	\N	\N	\N	\N
3709	1487	3	\N	\N	\N	\N	\N	\N
3710	1500	3	\N	\N	\N	\N	\N	\N
3711	1502	3	\N	\N	\N	\N	\N	\N
3712	1503	3	\N	\N	\N	\N	\N	\N
3713	1496	3	\N	\N	\N	\N	\N	\N
3714	1501	3	\N	\N	\N	\N	\N	\N
3715	1497	3	\N	\N	\N	\N	\N	\N
3716	1504	3	\N	\N	\N	\N	\N	\N
3717	1506	3	\N	\N	\N	\N	\N	\N
3718	1505	3	\N	\N	\N	\N	\N	\N
3719	1507	3	\N	\N	\N	\N	\N	\N
3720	1509	3	\N	\N	\N	\N	\N	\N
3721	1514	3	\N	\N	\N	\N	\N	\N
3722	1515	3	\N	\N	\N	\N	\N	\N
3724	1510	3	\N	\N	\N	\N	\N	\N
3725	1513	3	\N	\N	\N	\N	\N	\N
3726	1511	3	\N	\N	\N	\N	\N	\N
3727	1520	3	\N	\N	\N	\N	\N	\N
3728	1523	3	\N	\N	\N	\N	\N	\N
3730	1522	3	\N	\N	\N	\N	\N	\N
3731	1525	3	\N	\N	\N	\N	\N	\N
3732	1526	3	\N	\N	\N	\N	\N	\N
3733	1527	3	\N	\N	\N	\N	\N	\N
3734	1528	3	\N	\N	\N	\N	\N	\N
3735	1524	3	\N	\N	\N	\N	\N	\N
3736	1529	3	\N	\N	\N	\N	\N	\N
3737	1531	3	\N	\N	\N	\N	\N	\N
3738	1533	3	\N	\N	\N	\N	\N	\N
3739	1534	3	\N	\N	\N	\N	\N	\N
3740	1535	3	\N	\N	\N	\N	\N	\N
3741	1539	3	\N	\N	\N	\N	\N	\N
3742	1542	3	\N	\N	\N	\N	\N	\N
3743	1544	3	\N	\N	\N	\N	\N	\N
3744	1550	3	\N	\N	\N	\N	\N	\N
3745	1548	3	\N	\N	\N	\N	\N	\N
3746	1546	3	\N	\N	\N	\N	\N	\N
3747	1555	3	\N	\N	\N	\N	\N	\N
3748	1552	3	\N	\N	\N	\N	\N	\N
3749	1558	3	\N	\N	\N	\N	\N	\N
3750	1556	3	\N	\N	\N	\N	\N	\N
3751	1554	3	\N	\N	\N	\N	\N	\N
3752	1562	3	\N	\N	\N	\N	\N	\N
3753	1563	3	\N	\N	\N	\N	\N	\N
3754	1561	3	\N	\N	\N	\N	\N	\N
3755	1559	3	\N	\N	\N	\N	\N	\N
3756	1566	3	\N	\N	\N	\N	\N	\N
3758	1565	3	\N	\N	\N	\N	\N	\N
3759	1568	3	\N	\N	\N	\N	\N	\N
3760	1570	3	\N	\N	\N	\N	\N	\N
3761	1575	3	\N	\N	\N	\N	\N	\N
3762	1576	3	\N	\N	\N	\N	\N	\N
3763	1577	3	\N	\N	\N	\N	\N	\N
3764	1578	3	\N	\N	\N	\N	\N	\N
3765	1579	3	\N	\N	\N	\N	\N	\N
3766	1581	3	\N	\N	\N	\N	\N	\N
3767	1582	3	\N	\N	\N	\N	\N	\N
3678	1437	3	0.0283084895	6621.0352533352	118636.0000000000	0.23	-1.97	-4.48
3686	1455	3	0.0000534715	606.8548900101	44876.0000000000	0.23	-3.01	-8.76
3729	1521	3	0.0002635012	58.5913633595	27471.0000000000	-0.90	-4.72	-13.35
3667	1414	3	0.0029522217	59.8914545125	14821.0000000000	1.57	-0.16	-8.97
3769	1587	3	\N	\N	\N	\N	\N	\N
3770	1588	3	\N	\N	\N	\N	\N	\N
3771	1590	3	\N	\N	\N	\N	\N	\N
3772	1592	3	\N	\N	\N	\N	\N	\N
3773	1596	3	\N	\N	\N	\N	\N	\N
3774	1597	3	\N	\N	\N	\N	\N	\N
3775	1598	3	\N	\N	\N	\N	\N	\N
3776	1595	3	\N	\N	\N	\N	\N	\N
3777	1605	3	\N	\N	\N	\N	\N	\N
3778	1606	3	\N	\N	\N	\N	\N	\N
3779	1607	3	\N	\N	\N	\N	\N	\N
3780	1602	3	\N	\N	\N	\N	\N	\N
3781	1603	3	\N	\N	\N	\N	\N	\N
3782	1609	3	\N	\N	\N	\N	\N	\N
3783	1611	3	\N	\N	\N	\N	\N	\N
3784	1614	3	\N	\N	\N	\N	\N	\N
3785	1608	3	\N	\N	\N	\N	\N	\N
3786	1610	3	\N	\N	\N	\N	\N	\N
3787	1616	3	\N	\N	\N	\N	\N	\N
3788	1624	3	\N	\N	\N	\N	\N	\N
3789	1619	3	\N	\N	\N	\N	\N	\N
3790	1623	3	\N	\N	\N	\N	\N	\N
3791	1617	3	\N	\N	\N	\N	\N	\N
3792	1618	3	\N	\N	\N	\N	\N	\N
3793	1625	3	\N	\N	\N	\N	\N	\N
3794	1629	3	\N	\N	\N	\N	\N	\N
3795	1630	3	\N	\N	\N	\N	\N	\N
3796	1626	3	\N	\N	\N	\N	\N	\N
3797	1628	3	\N	\N	\N	\N	\N	\N
3798	1631	3	\N	\N	\N	\N	\N	\N
3799	1638	3	\N	\N	\N	\N	\N	\N
3800	1640	3	\N	\N	\N	\N	\N	\N
3801	1632	3	\N	\N	\N	\N	\N	\N
3802	1636	3	\N	\N	\N	\N	\N	\N
3803	1637	3	\N	\N	\N	\N	\N	\N
3804	1642	3	\N	\N	\N	\N	\N	\N
3805	1650	3	\N	\N	\N	\N	\N	\N
3806	1644	3	\N	\N	\N	\N	\N	\N
3807	1643	3	\N	\N	\N	\N	\N	\N
3808	1647	3	\N	\N	\N	\N	\N	\N
3809	1651	3	\N	\N	\N	\N	\N	\N
3810	1660	3	\N	\N	\N	\N	\N	\N
3811	1657	3	\N	\N	\N	\N	\N	\N
3812	1659	3	\N	\N	\N	\N	\N	\N
3813	1654	3	\N	\N	\N	\N	\N	\N
3814	1658	3	\N	\N	\N	\N	\N	\N
3815	1662	3	\N	\N	\N	\N	\N	\N
3816	1671	3	\N	\N	\N	\N	\N	\N
3817	1665	3	\N	\N	\N	\N	\N	\N
3818	1669	3	\N	\N	\N	\N	\N	\N
3819	1670	3	\N	\N	\N	\N	\N	\N
3820	1673	3	\N	\N	\N	\N	\N	\N
3821	1678	3	\N	\N	\N	\N	\N	\N
3822	1679	3	\N	\N	\N	\N	\N	\N
3823	1674	3	\N	\N	\N	\N	\N	\N
3824	1677	3	\N	\N	\N	\N	\N	\N
3825	1676	3	\N	\N	\N	\N	\N	\N
3826	1680	3	\N	\N	\N	\N	\N	\N
3827	1685	3	\N	\N	\N	\N	\N	\N
3828	1681	3	\N	\N	\N	\N	\N	\N
3829	1683	3	\N	\N	\N	\N	\N	\N
3831	1686	3	\N	\N	\N	\N	\N	\N
3832	1693	3	\N	\N	\N	\N	\N	\N
3833	1690	3	\N	\N	\N	\N	\N	\N
3834	1687	3	\N	\N	\N	\N	\N	\N
3835	1688	3	\N	\N	\N	\N	\N	\N
3836	1691	3	\N	\N	\N	\N	\N	\N
3837	1694	3	\N	\N	\N	\N	\N	\N
3838	1699	3	\N	\N	\N	\N	\N	\N
3839	1695	3	\N	\N	\N	\N	\N	\N
3841	1698	3	\N	\N	\N	\N	\N	\N
3843	1702	3	\N	\N	\N	\N	\N	\N
3844	1703	3	\N	\N	\N	\N	\N	\N
3845	1706	3	\N	\N	\N	\N	\N	\N
3846	1707	3	\N	\N	\N	\N	\N	\N
3847	1708	3	\N	\N	\N	\N	\N	\N
3848	1709	3	\N	\N	\N	\N	\N	\N
3850	1711	3	\N	\N	\N	\N	\N	\N
3851	1704	3	\N	\N	\N	\N	\N	\N
3852	1712	3	\N	\N	\N	\N	\N	\N
3853	1717	3	\N	\N	\N	\N	\N	\N
3854	1716	3	\N	\N	\N	\N	\N	\N
3855	1715	3	\N	\N	\N	\N	\N	\N
3856	1714	3	\N	\N	\N	\N	\N	\N
3857	1719	3	\N	\N	\N	\N	\N	\N
3858	1724	3	\N	\N	\N	\N	\N	\N
3859	1723	3	\N	\N	\N	\N	\N	\N
3861	1721	3	\N	\N	\N	\N	\N	\N
3862	1722	3	\N	\N	\N	\N	\N	\N
3863	1726	3	\N	\N	\N	\N	\N	\N
3864	1731	3	\N	\N	\N	\N	\N	\N
3865	1728	3	\N	\N	\N	\N	\N	\N
3866	1729	3	\N	\N	\N	\N	\N	\N
3868	1739	3	\N	\N	\N	\N	\N	\N
3869	1732	3	\N	\N	\N	\N	\N	\N
3870	1733	3	\N	\N	\N	\N	\N	\N
3871	1736	3	\N	\N	\N	\N	\N	\N
3872	1737	3	\N	\N	\N	\N	\N	\N
3873	1738	3	\N	\N	\N	\N	\N	\N
3874	1745	3	\N	\N	\N	\N	\N	\N
3875	1741	3	\N	\N	\N	\N	\N	\N
3876	1743	3	\N	\N	\N	\N	\N	\N
3877	1742	3	\N	\N	\N	\N	\N	\N
3878	1746	3	\N	\N	\N	\N	\N	\N
3879	1748	3	\N	\N	\N	\N	\N	\N
3880	1747	3	\N	\N	\N	\N	\N	\N
3881	1753	3	\N	\N	\N	\N	\N	\N
3883	1752	3	\N	\N	\N	\N	\N	\N
3885	1755	3	\N	\N	\N	\N	\N	\N
3886	1756	3	\N	\N	\N	\N	\N	\N
3887	1754	3	\N	\N	\N	\N	\N	\N
3888	1758	3	\N	\N	\N	\N	\N	\N
3890	1760	3	\N	\N	\N	\N	\N	\N
3891	1762	3	\N	\N	\N	\N	\N	\N
3892	1763	3	\N	\N	\N	\N	\N	\N
3894	1767	3	\N	\N	\N	\N	\N	\N
3895	1772	3	\N	\N	\N	\N	\N	\N
3896	1773	3	\N	\N	\N	\N	\N	\N
3897	1769	3	\N	\N	\N	\N	\N	\N
3898	1771	3	\N	\N	\N	\N	\N	\N
3899	1768	3	\N	\N	\N	\N	\N	\N
3900	1774	3	\N	\N	\N	\N	\N	\N
3901	1777	3	\N	\N	\N	\N	\N	\N
3902	1778	3	\N	\N	\N	\N	\N	\N
3903	1776	3	\N	\N	\N	\N	\N	\N
3904	1775	3	\N	\N	\N	\N	\N	\N
3905	1779	3	\N	\N	\N	\N	\N	\N
3907	1781	3	\N	\N	\N	\N	\N	\N
3908	1784	3	\N	\N	\N	\N	\N	\N
3909	1782	3	\N	\N	\N	\N	\N	\N
3910	1783	3	\N	\N	\N	\N	\N	\N
3911	1786	3	\N	\N	\N	\N	\N	\N
3912	1790	3	\N	\N	\N	\N	\N	\N
3913	1788	3	\N	\N	\N	\N	\N	\N
3914	1787	3	\N	\N	\N	\N	\N	\N
3916	1792	3	\N	\N	\N	\N	\N	\N
3917	1799	3	\N	\N	\N	\N	\N	\N
3918	1798	3	\N	\N	\N	\N	\N	\N
3919	1793	3	\N	\N	\N	\N	\N	\N
3920	1797	3	\N	\N	\N	\N	\N	\N
3921	1795	3	\N	\N	\N	\N	\N	\N
3922	1801	3	\N	\N	\N	\N	\N	\N
3923	1803	3	\N	\N	\N	\N	\N	\N
3924	1805	3	\N	\N	\N	\N	\N	\N
3925	1807	3	\N	\N	\N	\N	\N	\N
3882	1750	3	0.0004359242	3323.5843959126	26155.0000000000	-0.58	-4.37	-14.85
3830	1684	3	0.0015293059	12374.2604103834	135595.0000000000	0.09	-1.92	-8.15
3915	1789	3	0.0010844969	751.2030258626	40131.0000000000	-0.50	-5.15	-18.20
3906	1785	3	0.0019198721	526.8377670044	19445.0000000000	-0.45	-3.80	-9.15
3926	1814	3	\N	\N	\N	\N	\N	\N
3927	1815	3	\N	\N	\N	\N	\N	\N
3929	1812	3	\N	\N	\N	\N	\N	\N
3930	1810	3	\N	\N	\N	\N	\N	\N
3931	1811	3	\N	\N	\N	\N	\N	\N
3932	1809	3	\N	\N	\N	\N	\N	\N
3933	1818	3	\N	\N	\N	\N	\N	\N
3934	1816	3	\N	\N	\N	\N	\N	\N
3937	1819	3	\N	\N	\N	\N	\N	\N
3938	1830	3	\N	\N	\N	\N	\N	\N
3939	1826	3	\N	\N	\N	\N	\N	\N
3940	1828	3	\N	\N	\N	\N	\N	\N
3941	1824	3	\N	\N	\N	\N	\N	\N
3942	1825	3	\N	\N	\N	\N	\N	\N
3943	1834	3	\N	\N	\N	\N	\N	\N
3944	1832	3	\N	\N	\N	\N	\N	\N
3945	1833	3	\N	\N	\N	\N	\N	\N
3946	1835	3	\N	\N	\N	\N	\N	\N
3948	1836	3	\N	\N	\N	\N	\N	\N
3949	1837	3	\N	\N	\N	\N	\N	\N
3950	1838	3	\N	\N	\N	\N	\N	\N
3951	1840	3	\N	\N	\N	\N	\N	\N
3952	1841	3	\N	\N	\N	\N	\N	\N
3953	1845	3	\N	\N	\N	\N	\N	\N
3954	1842	3	\N	\N	\N	\N	\N	\N
3955	1843	3	\N	\N	\N	\N	\N	\N
3956	1846	3	\N	\N	\N	\N	\N	\N
3957	1850	3	\N	\N	\N	\N	\N	\N
3958	1849	3	\N	\N	\N	\N	\N	\N
3959	1848	3	\N	\N	\N	\N	\N	\N
3960	1847	3	\N	\N	\N	\N	\N	\N
3961	1851	3	\N	\N	\N	\N	\N	\N
3962	1852	3	\N	\N	\N	\N	\N	\N
3963	1861	3	\N	\N	\N	\N	\N	\N
3964	1853	3	\N	\N	\N	\N	\N	\N
3965	1856	3	\N	\N	\N	\N	\N	\N
3966	1857	3	\N	\N	\N	\N	\N	\N
3967	1863	3	\N	\N	\N	\N	\N	\N
3968	1864	3	\N	\N	\N	\N	\N	\N
3969	1865	3	\N	\N	\N	\N	\N	\N
3971	1869	3	\N	\N	\N	\N	\N	\N
3972	1871	3	\N	\N	\N	\N	\N	\N
3973	1872	3	\N	\N	\N	\N	\N	\N
3974	1873	3	\N	\N	\N	\N	\N	\N
3976	1877	3	\N	\N	\N	\N	\N	\N
3977	1881	3	\N	\N	\N	\N	\N	\N
3978	1883	3	\N	\N	\N	\N	\N	\N
3979	1878	3	\N	\N	\N	\N	\N	\N
3980	1882	3	\N	\N	\N	\N	\N	\N
3981	1884	3	\N	\N	\N	\N	\N	\N
3982	1889	3	\N	\N	\N	\N	\N	\N
3983	1885	3	\N	\N	\N	\N	\N	\N
3984	1887	3	\N	\N	\N	\N	\N	\N
3985	1888	3	\N	\N	\N	\N	\N	\N
3986	1886	3	\N	\N	\N	\N	\N	\N
3987	1898	3	\N	\N	\N	\N	\N	\N
3988	1890	3	\N	\N	\N	\N	\N	\N
3989	1894	3	\N	\N	\N	\N	\N	\N
3990	1897	3	\N	\N	\N	\N	\N	\N
3992	1899	3	\N	\N	\N	\N	\N	\N
3995	1902	3	\N	\N	\N	\N	\N	\N
3996	1900	3	\N	\N	\N	\N	\N	\N
3997	1905	3	\N	\N	\N	\N	\N	\N
3998	1913	3	\N	\N	\N	\N	\N	\N
3999	1910	3	\N	\N	\N	\N	\N	\N
4000	1912	3	\N	\N	\N	\N	\N	\N
4001	1907	3	\N	\N	\N	\N	\N	\N
4003	1915	3	\N	\N	\N	\N	\N	\N
4004	1920	3	\N	\N	\N	\N	\N	\N
4005	1917	3	\N	\N	\N	\N	\N	\N
4006	1918	3	\N	\N	\N	\N	\N	\N
4007	1916	3	\N	\N	\N	\N	\N	\N
4008	1921	3	\N	\N	\N	\N	\N	\N
4009	1927	3	\N	\N	\N	\N	\N	\N
4010	1926	3	\N	\N	\N	\N	\N	\N
4011	1923	3	\N	\N	\N	\N	\N	\N
4012	1922	3	\N	\N	\N	\N	\N	\N
4014	1930	3	\N	\N	\N	\N	\N	\N
4015	1935	3	\N	\N	\N	\N	\N	\N
4016	1931	3	\N	\N	\N	\N	\N	\N
4018	1933	3	\N	\N	\N	\N	\N	\N
4019	1937	3	\N	\N	\N	\N	\N	\N
4020	1938	3	\N	\N	\N	\N	\N	\N
4021	1943	3	\N	\N	\N	\N	\N	\N
4022	1945	3	\N	\N	\N	\N	\N	\N
4023	1942	3	\N	\N	\N	\N	\N	\N
4024	1946	3	\N	\N	\N	\N	\N	\N
4025	1947	3	\N	\N	\N	\N	\N	\N
4026	1948	3	\N	\N	\N	\N	\N	\N
4027	1949	3	\N	\N	\N	\N	\N	\N
4028	1950	3	\N	\N	\N	\N	\N	\N
4029	1951	3	\N	\N	\N	\N	\N	\N
4030	1952	3	\N	\N	\N	\N	\N	\N
4031	1954	3	\N	\N	\N	\N	\N	\N
4032	1955	3	\N	\N	\N	\N	\N	\N
4033	1956	3	\N	\N	\N	\N	\N	\N
4035	1964	3	\N	\N	\N	\N	\N	\N
4036	1962	3	\N	\N	\N	\N	\N	\N
4037	1963	3	\N	\N	\N	\N	\N	\N
4038	1961	3	\N	\N	\N	\N	\N	\N
4039	1959	3	\N	\N	\N	\N	\N	\N
4040	1965	3	\N	\N	\N	\N	\N	\N
4041	1969	3	\N	\N	\N	\N	\N	\N
4042	1968	3	\N	\N	\N	\N	\N	\N
4043	1967	3	\N	\N	\N	\N	\N	\N
4045	1970	3	\N	\N	\N	\N	\N	\N
4046	1976	3	\N	\N	\N	\N	\N	\N
4047	1974	3	\N	\N	\N	\N	\N	\N
4048	1971	3	\N	\N	\N	\N	\N	\N
4049	1975	3	\N	\N	\N	\N	\N	\N
4050	1973	3	\N	\N	\N	\N	\N	\N
4051	1979	3	\N	\N	\N	\N	\N	\N
4052	1983	3	\N	\N	\N	\N	\N	\N
4054	1981	3	\N	\N	\N	\N	\N	\N
4055	1980	3	\N	\N	\N	\N	\N	\N
4057	1989	3	\N	\N	\N	\N	\N	\N
4058	1985	3	\N	\N	\N	\N	\N	\N
4059	1988	3	\N	\N	\N	\N	\N	\N
4060	1986	3	\N	\N	\N	\N	\N	\N
4061	1987	3	\N	\N	\N	\N	\N	\N
4062	1990	3	\N	\N	\N	\N	\N	\N
4063	1995	3	\N	\N	\N	\N	\N	\N
4064	1994	3	\N	\N	\N	\N	\N	\N
4065	1991	3	\N	\N	\N	\N	\N	\N
4067	1996	3	\N	\N	\N	\N	\N	\N
4068	2002	3	\N	\N	\N	\N	\N	\N
4069	2000	3	\N	\N	\N	\N	\N	\N
4070	1999	3	\N	\N	\N	\N	\N	\N
4071	1998	3	\N	\N	\N	\N	\N	\N
4072	2001	3	\N	\N	\N	\N	\N	\N
4073	2004	3	\N	\N	\N	\N	\N	\N
4074	2008	3	\N	\N	\N	\N	\N	\N
4075	2005	3	\N	\N	\N	\N	\N	\N
4076	2007	3	\N	\N	\N	\N	\N	\N
4077	2006	3	\N	\N	\N	\N	\N	\N
4078	2009	3	\N	\N	\N	\N	\N	\N
4079	2015	3	\N	\N	\N	\N	\N	\N
4081	2012	3	\N	\N	\N	\N	\N	\N
4082	2013	3	\N	\N	\N	\N	\N	\N
4013	1925	3	0.0011747190	787.0820093189	36586.0000000000	-0.41	-4.34	-12.73
4053	1982	3	0.0001428041	742.5532137816	19155.0000000000	0.60	-2.21	-8.13
4066	1993	3	0.0000000215	48.5892229837	16228.0000000000	-0.96	-2.11	-8.71
3947	1839	3	0.0025028177	19177.9161122395	285425.0000000000	-0.34	3.93	11.63
3970	1866	3	0.0000736340	9269.6080118903	73818.0000000000	-0.48	-3.74	-6.73
3975	1876	3	0.0000000647	7.8444770074	21038.0000000000	0.88	-0.42	-6.04
3993	1904	3	0.0004674715	8708.1260935748	255939.0000000000	0.00	-0.88	4.40
4083	2011	3	\N	\N	\N	\N	\N	\N
4084	2017	3	\N	\N	\N	\N	\N	\N
4085	2022	3	\N	\N	\N	\N	\N	\N
4086	2018	3	\N	\N	\N	\N	\N	\N
4087	2019	3	\N	\N	\N	\N	\N	\N
4089	2024	3	\N	\N	\N	\N	\N	\N
4090	2030	3	\N	\N	\N	\N	\N	\N
4091	2026	3	\N	\N	\N	\N	\N	\N
4092	2025	3	\N	\N	\N	\N	\N	\N
4093	2029	3	\N	\N	\N	\N	\N	\N
4095	2031	3	\N	\N	\N	\N	\N	\N
4096	2036	3	\N	\N	\N	\N	\N	\N
4097	2032	3	\N	\N	\N	\N	\N	\N
4098	2033	3	\N	\N	\N	\N	\N	\N
4099	2034	3	\N	\N	\N	\N	\N	\N
4100	2037	3	\N	\N	\N	\N	\N	\N
4101	2042	3	\N	\N	\N	\N	\N	\N
4102	2039	3	\N	\N	\N	\N	\N	\N
4103	2040	3	\N	\N	\N	\N	\N	\N
4104	2038	3	\N	\N	\N	\N	\N	\N
4105	2041	3	\N	\N	\N	\N	\N	\N
4106	2043	3	\N	\N	\N	\N	\N	\N
4107	2047	3	\N	\N	\N	\N	\N	\N
4109	2046	3	\N	\N	\N	\N	\N	\N
4110	2045	3	\N	\N	\N	\N	\N	\N
4111	2048	3	\N	\N	\N	\N	\N	\N
4112	2054	3	\N	\N	\N	\N	\N	\N
4113	2051	3	\N	\N	\N	\N	\N	\N
4114	2049	3	\N	\N	\N	\N	\N	\N
4115	2050	3	\N	\N	\N	\N	\N	\N
4116	2053	3	\N	\N	\N	\N	\N	\N
4117	2055	3	\N	\N	\N	\N	\N	\N
4118	2059	3	\N	\N	\N	\N	\N	\N
4119	2056	3	\N	\N	\N	\N	\N	\N
4120	2057	3	\N	\N	\N	\N	\N	\N
4121	2058	3	\N	\N	\N	\N	\N	\N
4122	2060	3	\N	\N	\N	\N	\N	\N
4123	2065	3	\N	\N	\N	\N	\N	\N
4124	2061	3	\N	\N	\N	\N	\N	\N
4126	2063	3	\N	\N	\N	\N	\N	\N
4127	2064	3	\N	\N	\N	\N	\N	\N
4128	2066	3	\N	\N	\N	\N	\N	\N
4129	2071	3	\N	\N	\N	\N	\N	\N
4130	2069	3	\N	\N	\N	\N	\N	\N
4131	2067	3	\N	\N	\N	\N	\N	\N
4132	2070	3	\N	\N	\N	\N	\N	\N
4133	2072	3	\N	\N	\N	\N	\N	\N
4134	2079	3	\N	\N	\N	\N	\N	\N
4135	2076	3	\N	\N	\N	\N	\N	\N
4136	2077	3	\N	\N	\N	\N	\N	\N
4137	2074	3	\N	\N	\N	\N	\N	\N
4138	2078	3	\N	\N	\N	\N	\N	\N
4139	2080	3	\N	\N	\N	\N	\N	\N
4140	2082	3	\N	\N	\N	\N	\N	\N
4141	2081	3	\N	\N	\N	\N	\N	\N
4144	2089	3	\N	\N	\N	\N	\N	\N
4145	2090	3	\N	\N	\N	\N	\N	\N
4146	2091	3	\N	\N	\N	\N	\N	\N
4147	2088	3	\N	\N	\N	\N	\N	\N
4149	2093	3	\N	\N	\N	\N	\N	\N
4150	2094	3	\N	\N	\N	\N	\N	\N
4151	2096	3	\N	\N	\N	\N	\N	\N
4152	2095	3	\N	\N	\N	\N	\N	\N
4153	2098	3	\N	\N	\N	\N	\N	\N
4154	2101	3	\N	\N	\N	\N	\N	\N
4156	2103	3	\N	\N	\N	\N	\N	\N
4157	2100	3	\N	\N	\N	\N	\N	\N
4158	2106	3	\N	\N	\N	\N	\N	\N
4159	2104	3	\N	\N	\N	\N	\N	\N
4160	2105	3	\N	\N	\N	\N	\N	\N
4161	2109	3	\N	\N	\N	\N	\N	\N
4162	2110	3	\N	\N	\N	\N	\N	\N
4163	2107	3	\N	\N	\N	\N	\N	\N
4164	2112	3	\N	\N	\N	\N	\N	\N
4165	2114	3	\N	\N	\N	\N	\N	\N
4166	2115	3	\N	\N	\N	\N	\N	\N
4167	2118	3	\N	\N	\N	\N	\N	\N
4168	2119	3	\N	\N	\N	\N	\N	\N
4169	2120	3	\N	\N	\N	\N	\N	\N
4170	2117	3	\N	\N	\N	\N	\N	\N
4171	2122	3	\N	\N	\N	\N	\N	\N
4172	2123	3	\N	\N	\N	\N	\N	\N
4173	2124	3	\N	\N	\N	\N	\N	\N
4174	2125	3	\N	\N	\N	\N	\N	\N
4175	2126	3	\N	\N	\N	\N	\N	\N
4176	2127	3	\N	\N	\N	\N	\N	\N
4177	2129	3	\N	\N	\N	\N	\N	\N
4178	2130	3	\N	\N	\N	\N	\N	\N
4179	2132	3	\N	\N	\N	\N	\N	\N
4180	2134	3	\N	\N	\N	\N	\N	\N
4181	2135	3	\N	\N	\N	\N	\N	\N
4182	2136	3	\N	\N	\N	\N	\N	\N
4183	2137	3	\N	\N	\N	\N	\N	\N
4184	2138	3	\N	\N	\N	\N	\N	\N
4185	2139	3	\N	\N	\N	\N	\N	\N
4186	2140	3	\N	\N	\N	\N	\N	\N
4187	2142	3	\N	\N	\N	\N	\N	\N
4188	2143	3	\N	\N	\N	\N	\N	\N
4189	2144	3	\N	\N	\N	\N	\N	\N
4190	2146	3	\N	\N	\N	\N	\N	\N
4191	2147	3	\N	\N	\N	\N	\N	\N
4192	2148	3	\N	\N	\N	\N	\N	\N
4193	2149	3	\N	\N	\N	\N	\N	\N
4194	2150	3	\N	\N	\N	\N	\N	\N
4195	2151	3	\N	\N	\N	\N	\N	\N
4196	2152	3	\N	\N	\N	\N	\N	\N
4197	2153	3	\N	\N	\N	\N	\N	\N
4198	2157	3	\N	\N	\N	\N	\N	\N
4199	2158	3	\N	\N	\N	\N	\N	\N
4200	2159	3	\N	\N	\N	\N	\N	\N
4201	2160	3	\N	\N	\N	\N	\N	\N
4202	2161	3	\N	\N	\N	\N	\N	\N
4203	2162	3	\N	\N	\N	\N	\N	\N
4204	2167	3	\N	\N	\N	\N	\N	\N
4205	2170	3	\N	\N	\N	\N	\N	\N
4206	2171	3	\N	\N	\N	\N	\N	\N
4207	2165	3	\N	\N	\N	\N	\N	\N
4208	2163	3	\N	\N	\N	\N	\N	\N
4209	2166	3	\N	\N	\N	\N	\N	\N
4210	2172	3	\N	\N	\N	\N	\N	\N
4211	2173	3	\N	\N	\N	\N	\N	\N
4212	2168	3	\N	\N	\N	\N	\N	\N
4213	2175	3	\N	\N	\N	\N	\N	\N
4214	2179	3	\N	\N	\N	\N	\N	\N
4215	2180	3	\N	\N	\N	\N	\N	\N
4216	2174	3	\N	\N	\N	\N	\N	\N
4217	2176	3	\N	\N	\N	\N	\N	\N
4218	2177	3	\N	\N	\N	\N	\N	\N
4219	2178	3	\N	\N	\N	\N	\N	\N
4220	2181	3	\N	\N	\N	\N	\N	\N
4221	2182	3	\N	\N	\N	\N	\N	\N
4222	2183	3	\N	\N	\N	\N	\N	\N
4223	2184	3	\N	\N	\N	\N	\N	\N
4224	2192	3	\N	\N	\N	\N	\N	\N
4225	2189	3	\N	\N	\N	\N	\N	\N
4226	2190	3	\N	\N	\N	\N	\N	\N
4227	2185	3	\N	\N	\N	\N	\N	\N
4228	2187	3	\N	\N	\N	\N	\N	\N
4229	2191	3	\N	\N	\N	\N	\N	\N
4230	2193	3	\N	\N	\N	\N	\N	\N
4231	2196	3	\N	\N	\N	\N	\N	\N
4232	2198	3	\N	\N	\N	\N	\N	\N
4233	2194	3	\N	\N	\N	\N	\N	\N
4234	2199	3	\N	\N	\N	\N	\N	\N
4235	2201	3	\N	\N	\N	\N	\N	\N
4236	2202	3	\N	\N	\N	\N	\N	\N
4237	2200	3	\N	\N	\N	\N	\N	\N
4238	2205	3	\N	\N	\N	\N	\N	\N
4239	2204	3	\N	\N	\N	\N	\N	\N
4094	2027	3	0.0005725325	203.4973439883	25955.0000000000	-0.35	-0.60	0.08
4108	2044	3	0.0002571025	847.0529421186	19241.0000000000	2.53	0.81	18.63
4088	2021	3	0.0001402594	116.4590402436	50579.0000000000	0.49	-5.68	-11.15
4240	2207	3	\N	\N	\N	\N	\N	\N
4241	2212	3	\N	\N	\N	\N	\N	\N
4242	2209	3	\N	\N	\N	\N	\N	\N
4243	2208	3	\N	\N	\N	\N	\N	\N
4244	2211	3	\N	\N	\N	\N	\N	\N
4246	2219	3	\N	\N	\N	\N	\N	\N
4247	2217	3	\N	\N	\N	\N	\N	\N
4248	2214	3	\N	\N	\N	\N	\N	\N
4249	2215	3	\N	\N	\N	\N	\N	\N
4250	2218	3	\N	\N	\N	\N	\N	\N
4251	2221	3	\N	\N	\N	\N	\N	\N
4252	2225	3	\N	\N	\N	\N	\N	\N
4253	2223	3	\N	\N	\N	\N	\N	\N
4255	2224	3	\N	\N	\N	\N	\N	\N
4256	2228	3	\N	\N	\N	\N	\N	\N
4257	2235	3	\N	\N	\N	\N	\N	\N
4258	2229	3	\N	\N	\N	\N	\N	\N
4259	2230	3	\N	\N	\N	\N	\N	\N
4260	2231	3	\N	\N	\N	\N	\N	\N
4261	2232	3	\N	\N	\N	\N	\N	\N
4262	2236	3	\N	\N	\N	\N	\N	\N
4263	2241	3	\N	\N	\N	\N	\N	\N
4264	2239	3	\N	\N	\N	\N	\N	\N
4265	2240	3	\N	\N	\N	\N	\N	\N
4266	2237	3	\N	\N	\N	\N	\N	\N
4267	2242	3	\N	\N	\N	\N	\N	\N
4268	2247	3	\N	\N	\N	\N	\N	\N
4269	2245	3	\N	\N	\N	\N	\N	\N
4271	2244	3	\N	\N	\N	\N	\N	\N
4273	2248	3	\N	\N	\N	\N	\N	\N
4274	2253	3	\N	\N	\N	\N	\N	\N
4275	2251	3	\N	\N	\N	\N	\N	\N
4276	2249	3	\N	\N	\N	\N	\N	\N
4277	2250	3	\N	\N	\N	\N	\N	\N
4278	2255	3	\N	\N	\N	\N	\N	\N
4279	2260	3	\N	\N	\N	\N	\N	\N
4280	2257	3	\N	\N	\N	\N	\N	\N
4281	2256	3	\N	\N	\N	\N	\N	\N
4282	2258	3	\N	\N	\N	\N	\N	\N
4283	2259	3	\N	\N	\N	\N	\N	\N
4284	2261	3	\N	\N	\N	\N	\N	\N
4285	2265	3	\N	\N	\N	\N	\N	\N
4286	2263	3	\N	\N	\N	\N	\N	\N
4287	2264	3	\N	\N	\N	\N	\N	\N
4288	2262	3	\N	\N	\N	\N	\N	\N
4289	2266	3	\N	\N	\N	\N	\N	\N
4290	2271	3	\N	\N	\N	\N	\N	\N
4291	2268	3	\N	\N	\N	\N	\N	\N
4292	2269	3	\N	\N	\N	\N	\N	\N
4293	2270	3	\N	\N	\N	\N	\N	\N
4294	2267	3	\N	\N	\N	\N	\N	\N
4295	2272	3	\N	\N	\N	\N	\N	\N
4296	2276	3	\N	\N	\N	\N	\N	\N
4297	2273	3	\N	\N	\N	\N	\N	\N
4298	2274	3	\N	\N	\N	\N	\N	\N
4299	2275	3	\N	\N	\N	\N	\N	\N
4300	2277	3	\N	\N	\N	\N	\N	\N
4301	2282	3	\N	\N	\N	\N	\N	\N
4302	2278	3	\N	\N	\N	\N	\N	\N
4303	2281	3	\N	\N	\N	\N	\N	\N
4304	2279	3	\N	\N	\N	\N	\N	\N
4305	2280	3	\N	\N	\N	\N	\N	\N
4306	2283	3	\N	\N	\N	\N	\N	\N
4307	2286	3	\N	\N	\N	\N	\N	\N
4308	2287	3	\N	\N	\N	\N	\N	\N
4309	2284	3	\N	\N	\N	\N	\N	\N
4310	2285	3	\N	\N	\N	\N	\N	\N
4311	2288	3	\N	\N	\N	\N	\N	\N
4312	2295	3	\N	\N	\N	\N	\N	\N
4313	2289	3	\N	\N	\N	\N	\N	\N
4314	2291	3	\N	\N	\N	\N	\N	\N
4315	2290	3	\N	\N	\N	\N	\N	\N
4316	2293	3	\N	\N	\N	\N	\N	\N
4317	2300	3	\N	\N	\N	\N	\N	\N
4318	2297	3	\N	\N	\N	\N	\N	\N
4319	2298	3	\N	\N	\N	\N	\N	\N
4321	2296	3	\N	\N	\N	\N	\N	\N
4322	2304	3	\N	\N	\N	\N	\N	\N
4323	2306	3	\N	\N	\N	\N	\N	\N
4324	2305	3	\N	\N	\N	\N	\N	\N
4325	2303	3	\N	\N	\N	\N	\N	\N
4326	2308	3	\N	\N	\N	\N	\N	\N
4328	2312	3	\N	\N	\N	\N	\N	\N
4329	2310	3	\N	\N	\N	\N	\N	\N
4330	2311	3	\N	\N	\N	\N	\N	\N
4331	2309	3	\N	\N	\N	\N	\N	\N
4332	2313	3	\N	\N	\N	\N	\N	\N
4333	2317	3	\N	\N	\N	\N	\N	\N
4334	2318	3	\N	\N	\N	\N	\N	\N
4335	2315	3	\N	\N	\N	\N	\N	\N
4336	2316	3	\N	\N	\N	\N	\N	\N
4337	2314	3	\N	\N	\N	\N	\N	\N
4338	2320	3	\N	\N	\N	\N	\N	\N
4339	2325	3	\N	\N	\N	\N	\N	\N
4340	2324	3	\N	\N	\N	\N	\N	\N
4341	2321	3	\N	\N	\N	\N	\N	\N
4342	2323	3	\N	\N	\N	\N	\N	\N
4343	2326	3	\N	\N	\N	\N	\N	\N
4344	2327	3	\N	\N	\N	\N	\N	\N
4345	2332	3	\N	\N	\N	\N	\N	\N
4346	2329	3	\N	\N	\N	\N	\N	\N
4347	2330	3	\N	\N	\N	\N	\N	\N
4348	2333	3	\N	\N	\N	\N	\N	\N
4349	2334	3	\N	\N	\N	\N	\N	\N
4350	2335	3	\N	\N	\N	\N	\N	\N
4351	2337	3	\N	\N	\N	\N	\N	\N
4352	2338	3	\N	\N	\N	\N	\N	\N
4353	2336	3	\N	\N	\N	\N	\N	\N
4354	2331	3	\N	\N	\N	\N	\N	\N
4355	2340	3	\N	\N	\N	\N	\N	\N
4356	2343	3	\N	\N	\N	\N	\N	\N
4357	2344	3	\N	\N	\N	\N	\N	\N
4358	2341	3	\N	\N	\N	\N	\N	\N
4359	2342	3	\N	\N	\N	\N	\N	\N
4360	2345	3	\N	\N	\N	\N	\N	\N
4361	2350	3	\N	\N	\N	\N	\N	\N
4363	2347	3	\N	\N	\N	\N	\N	\N
4364	2349	3	\N	\N	\N	\N	\N	\N
4365	2348	3	\N	\N	\N	\N	\N	\N
4366	2351	3	\N	\N	\N	\N	\N	\N
4367	2355	3	\N	\N	\N	\N	\N	\N
4368	2353	3	\N	\N	\N	\N	\N	\N
4369	2352	3	\N	\N	\N	\N	\N	\N
4370	2354	3	\N	\N	\N	\N	\N	\N
4371	2356	3	\N	\N	\N	\N	\N	\N
4372	2361	3	\N	\N	\N	\N	\N	\N
4373	2357	3	\N	\N	\N	\N	\N	\N
4374	2359	3	\N	\N	\N	\N	\N	\N
4375	2358	3	\N	\N	\N	\N	\N	\N
4376	2360	3	\N	\N	\N	\N	\N	\N
4377	2362	3	\N	\N	\N	\N	\N	\N
4378	2367	3	\N	\N	\N	\N	\N	\N
4379	2363	3	\N	\N	\N	\N	\N	\N
4380	2364	3	\N	\N	\N	\N	\N	\N
4381	2366	3	\N	\N	\N	\N	\N	\N
4382	2368	3	\N	\N	\N	\N	\N	\N
4383	2373	3	\N	\N	\N	\N	\N	\N
4384	2372	3	\N	\N	\N	\N	\N	\N
4385	2371	3	\N	\N	\N	\N	\N	\N
4386	2370	3	\N	\N	\N	\N	\N	\N
4387	2369	3	\N	\N	\N	\N	\N	\N
4388	2375	3	\N	\N	\N	\N	\N	\N
4389	2378	3	\N	\N	\N	\N	\N	\N
4390	2376	3	\N	\N	\N	\N	\N	\N
4391	2377	3	\N	\N	\N	\N	\N	\N
4392	2374	3	\N	\N	\N	\N	\N	\N
4393	2381	3	\N	\N	\N	\N	\N	\N
4394	2384	3	\N	\N	\N	\N	\N	\N
4395	2383	3	\N	\N	\N	\N	\N	\N
4396	2379	3	\N	\N	\N	\N	\N	\N
4245	2213	3	0.0000474737	214.4267310476	16616.0000000000	0.01	-5.28	-10.51
4270	2243	3	0.0000618165	114.6801070531	14738.0000000000	0.27	1.04	4.12
4397	2382	3	\N	\N	\N	\N	\N	\N
4398	2380	3	\N	\N	\N	\N	\N	\N
4399	2385	3	\N	\N	\N	\N	\N	\N
4400	2390	3	\N	\N	\N	\N	\N	\N
4401	2386	3	\N	\N	\N	\N	\N	\N
4402	2387	3	\N	\N	\N	\N	\N	\N
4403	2389	3	\N	\N	\N	\N	\N	\N
4404	2391	3	\N	\N	\N	\N	\N	\N
4405	2397	3	\N	\N	\N	\N	\N	\N
4406	2394	3	\N	\N	\N	\N	\N	\N
4407	2395	3	\N	\N	\N	\N	\N	\N
4408	2392	3	\N	\N	\N	\N	\N	\N
4409	2396	3	\N	\N	\N	\N	\N	\N
4410	2398	3	\N	\N	\N	\N	\N	\N
4412	2399	3	\N	\N	\N	\N	\N	\N
4413	2400	3	\N	\N	\N	\N	\N	\N
4414	2402	3	\N	\N	\N	\N	\N	\N
4415	2404	3	\N	\N	\N	\N	\N	\N
4416	2409	3	\N	\N	\N	\N	\N	\N
4418	2406	3	\N	\N	\N	\N	\N	\N
4419	2407	3	\N	\N	\N	\N	\N	\N
4420	2408	3	\N	\N	\N	\N	\N	\N
4421	2410	3	\N	\N	\N	\N	\N	\N
4422	2414	3	\N	\N	\N	\N	\N	\N
4423	2411	3	\N	\N	\N	\N	\N	\N
4424	2412	3	\N	\N	\N	\N	\N	\N
4425	2413	3	\N	\N	\N	\N	\N	\N
4426	2415	3	\N	\N	\N	\N	\N	\N
4427	2421	3	\N	\N	\N	\N	\N	\N
4429	2418	3	\N	\N	\N	\N	\N	\N
4430	2420	3	\N	\N	\N	\N	\N	\N
4431	2419	3	\N	\N	\N	\N	\N	\N
4432	2422	3	\N	\N	\N	\N	\N	\N
4433	2426	3	\N	\N	\N	\N	\N	\N
4434	2424	3	\N	\N	\N	\N	\N	\N
4435	2423	3	\N	\N	\N	\N	\N	\N
4436	2425	3	\N	\N	\N	\N	\N	\N
4437	2427	3	\N	\N	\N	\N	\N	\N
4439	2429	3	\N	\N	\N	\N	\N	\N
4440	2433	3	\N	\N	\N	\N	\N	\N
4441	2430	3	\N	\N	\N	\N	\N	\N
4442	2432	3	\N	\N	\N	\N	\N	\N
4443	2434	3	\N	\N	\N	\N	\N	\N
4444	2436	3	\N	\N	\N	\N	\N	\N
4445	2438	3	\N	\N	\N	\N	\N	\N
4446	2435	3	\N	\N	\N	\N	\N	\N
4447	2437	3	\N	\N	\N	\N	\N	\N
4448	2441	3	\N	\N	\N	\N	\N	\N
4449	2439	3	\N	\N	\N	\N	\N	\N
4450	2440	3	\N	\N	\N	\N	\N	\N
4451	2445	3	\N	\N	\N	\N	\N	\N
4452	2443	3	\N	\N	\N	\N	\N	\N
4453	2444	3	\N	\N	\N	\N	\N	\N
4454	2447	3	\N	\N	\N	\N	\N	\N
4455	2448	3	\N	\N	\N	\N	\N	\N
4456	2450	3	\N	\N	\N	\N	\N	\N
4457	2446	3	\N	\N	\N	\N	\N	\N
4458	2452	3	\N	\N	\N	\N	\N	\N
4459	2453	3	\N	\N	\N	\N	\N	\N
4460	2454	3	\N	\N	\N	\N	\N	\N
4461	2455	3	\N	\N	\N	\N	\N	\N
4462	2456	3	\N	\N	\N	\N	\N	\N
4463	2457	3	\N	\N	\N	\N	\N	\N
4464	2458	3	\N	\N	\N	\N	\N	\N
4465	2459	3	\N	\N	\N	\N	\N	\N
4466	2460	3	\N	\N	\N	\N	\N	\N
4467	2461	3	\N	\N	\N	\N	\N	\N
4468	2462	3	\N	\N	\N	\N	\N	\N
4469	2464	3	\N	\N	\N	\N	\N	\N
4470	2465	3	\N	\N	\N	\N	\N	\N
4471	2466	3	\N	\N	\N	\N	\N	\N
4472	2467	3	\N	\N	\N	\N	\N	\N
4473	2468	3	\N	\N	\N	\N	\N	\N
4475	2473	3	\N	\N	\N	\N	\N	\N
4476	2470	3	\N	\N	\N	\N	\N	\N
4477	2472	3	\N	\N	\N	\N	\N	\N
4478	2471	3	\N	\N	\N	\N	\N	\N
4479	2476	3	\N	\N	\N	\N	\N	\N
4480	2474	3	\N	\N	\N	\N	\N	\N
4481	2475	3	\N	\N	\N	\N	\N	\N
4482	2479	3	\N	\N	\N	\N	\N	\N
4483	2477	3	\N	\N	\N	\N	\N	\N
4484	2478	3	\N	\N	\N	\N	\N	\N
4485	2480	3	\N	\N	\N	\N	\N	\N
4486	2481	3	\N	\N	\N	\N	\N	\N
4487	2482	3	\N	\N	\N	\N	\N	\N
4488	2483	3	\N	\N	\N	\N	\N	\N
4489	2484	3	\N	\N	\N	\N	\N	\N
4490	2485	3	\N	\N	\N	\N	\N	\N
4491	2486	3	\N	\N	\N	\N	\N	\N
4492	2487	3	\N	\N	\N	\N	\N	\N
4493	2488	3	\N	\N	\N	\N	\N	\N
4494	2489	3	\N	\N	\N	\N	\N	\N
4495	2490	3	\N	\N	\N	\N	\N	\N
4496	2491	3	\N	\N	\N	\N	\N	\N
4498	2495	3	\N	\N	\N	\N	\N	\N
4500	2493	3	\N	\N	\N	\N	\N	\N
4501	2498	3	\N	\N	\N	\N	\N	\N
4502	2499	3	\N	\N	\N	\N	\N	\N
4503	2500	3	\N	\N	\N	\N	\N	\N
4504	2497	3	\N	\N	\N	\N	\N	\N
4505	2501	3	\N	\N	\N	\N	\N	\N
4507	2503	3	\N	\N	\N	\N	\N	\N
4508	2504	3	\N	\N	\N	\N	\N	\N
4509	2505	3	\N	\N	\N	\N	\N	\N
4510	2506	3	\N	\N	\N	\N	\N	\N
4511	2507	3	\N	\N	\N	\N	\N	\N
4512	2508	3	\N	\N	\N	\N	\N	\N
4513	2509	3	\N	\N	\N	\N	\N	\N
4514	2510	3	\N	\N	\N	\N	\N	\N
4515	2511	3	\N	\N	\N	\N	\N	\N
4516	2512	3	\N	\N	\N	\N	\N	\N
4517	2513	3	\N	\N	\N	\N	\N	\N
4518	2514	3	\N	\N	\N	\N	\N	\N
4519	2515	3	\N	\N	\N	\N	\N	\N
4520	2516	3	\N	\N	\N	\N	\N	\N
4521	2517	3	\N	\N	\N	\N	\N	\N
4522	2518	3	\N	\N	\N	\N	\N	\N
4523	2519	3	\N	\N	\N	\N	\N	\N
4524	2520	3	\N	\N	\N	\N	\N	\N
4525	2521	3	\N	\N	\N	\N	\N	\N
4526	2522	3	\N	\N	\N	\N	\N	\N
4527	2523	3	\N	\N	\N	\N	\N	\N
4528	2524	3	\N	\N	\N	\N	\N	\N
4529	2525	3	\N	\N	\N	\N	\N	\N
4530	2526	3	\N	\N	\N	\N	\N	\N
4531	2527	3	\N	\N	\N	\N	\N	\N
4532	2528	3	\N	\N	\N	\N	\N	\N
4533	2529	3	\N	\N	\N	\N	\N	\N
4535	2531	3	\N	\N	\N	\N	\N	\N
4536	2532	3	\N	\N	\N	\N	\N	\N
4537	2533	3	\N	\N	\N	\N	\N	\N
4538	2534	3	\N	\N	\N	\N	\N	\N
4539	2535	3	\N	\N	\N	\N	\N	\N
4540	2536	3	\N	\N	\N	\N	\N	\N
4541	2537	3	\N	\N	\N	\N	\N	\N
4542	2538	3	\N	\N	\N	\N	\N	\N
4543	2539	3	\N	\N	\N	\N	\N	\N
4544	2540	3	\N	\N	\N	\N	\N	\N
4545	2541	3	\N	\N	\N	\N	\N	\N
4546	2542	3	\N	\N	\N	\N	\N	\N
4547	2543	3	\N	\N	\N	\N	\N	\N
4548	2544	3	\N	\N	\N	\N	\N	\N
4549	2545	3	\N	\N	\N	\N	\N	\N
4550	2546	3	\N	\N	\N	\N	\N	\N
4551	2547	3	\N	\N	\N	\N	\N	\N
4552	2548	3	\N	\N	\N	\N	\N	\N
4553	2549	3	\N	\N	\N	\N	\N	\N
4497	2492	3	0.0039308374	1089.1743388409	20543.0000000000	0.16	-4.31	-13.36
4438	2428	3	0.0000526549	226.0805529653	15799.0000000000	1.75	-8.02	-3.04
4506	2502	3	0.0007093220	11317.4686090701	35466.0000000000	-0.32	-3.61	5.69
4554	2550	3	\N	\N	\N	\N	\N	\N
4555	2551	3	\N	\N	\N	\N	\N	\N
4556	2552	3	\N	\N	\N	\N	\N	\N
4557	2553	3	\N	\N	\N	\N	\N	\N
4558	2554	3	\N	\N	\N	\N	\N	\N
4559	2555	3	\N	\N	\N	\N	\N	\N
4560	2556	3	\N	\N	\N	\N	\N	\N
4561	2557	3	\N	\N	\N	\N	\N	\N
4562	2558	3	\N	\N	\N	\N	\N	\N
4563	2559	3	\N	\N	\N	\N	\N	\N
4564	2560	3	\N	\N	\N	\N	\N	\N
4565	2561	3	\N	\N	\N	\N	\N	\N
4566	2562	3	\N	\N	\N	\N	\N	\N
4567	2563	3	\N	\N	\N	\N	\N	\N
4568	2564	3	\N	\N	\N	\N	\N	\N
4569	2565	3	\N	\N	\N	\N	\N	\N
4571	2567	3	\N	\N	\N	\N	\N	\N
4572	2568	3	\N	\N	\N	\N	\N	\N
4573	2569	3	\N	\N	\N	\N	\N	\N
4574	2570	3	\N	\N	\N	\N	\N	\N
4575	2571	3	\N	\N	\N	\N	\N	\N
4576	2572	3	\N	\N	\N	\N	\N	\N
4577	2573	3	\N	\N	\N	\N	\N	\N
4579	2577	3	\N	\N	\N	\N	\N	\N
4580	2578	3	\N	\N	\N	\N	\N	\N
4581	2581	3	\N	\N	\N	\N	\N	\N
4582	2576	3	\N	\N	\N	\N	\N	\N
4583	2584	3	\N	\N	\N	\N	\N	\N
4584	2583	3	\N	\N	\N	\N	\N	\N
4585	2580	3	\N	\N	\N	\N	\N	\N
4586	2579	3	\N	\N	\N	\N	\N	\N
4588	2586	3	\N	\N	\N	\N	\N	\N
4589	2582	3	\N	\N	\N	\N	\N	\N
4591	2589	3	\N	\N	\N	\N	\N	\N
4592	2587	3	\N	\N	\N	\N	\N	\N
4593	2590	3	\N	\N	\N	\N	\N	\N
4594	2594	3	\N	\N	\N	\N	\N	\N
4595	2595	3	\N	\N	\N	\N	\N	\N
4596	2592	3	\N	\N	\N	\N	\N	\N
4597	2593	3	\N	\N	\N	\N	\N	\N
4599	2596	3	\N	\N	\N	\N	\N	\N
4600	2600	3	\N	\N	\N	\N	\N	\N
4601	2598	3	\N	\N	\N	\N	\N	\N
4602	2599	3	\N	\N	\N	\N	\N	\N
4603	2597	3	\N	\N	\N	\N	\N	\N
4604	2601	3	\N	\N	\N	\N	\N	\N
4606	2605	3	\N	\N	\N	\N	\N	\N
4607	2604	3	\N	\N	\N	\N	\N	\N
4608	2602	3	\N	\N	\N	\N	\N	\N
4609	2603	3	\N	\N	\N	\N	\N	\N
4610	2607	3	\N	\N	\N	\N	\N	\N
4611	2611	3	\N	\N	\N	\N	\N	\N
4613	2609	3	\N	\N	\N	\N	\N	\N
4614	2610	3	\N	\N	\N	\N	\N	\N
4615	2612	3	\N	\N	\N	\N	\N	\N
4616	2618	3	\N	\N	\N	\N	\N	\N
4617	2617	3	\N	\N	\N	\N	\N	\N
4618	2615	3	\N	\N	\N	\N	\N	\N
4619	2614	3	\N	\N	\N	\N	\N	\N
4620	2616	3	\N	\N	\N	\N	\N	\N
4621	2619	3	\N	\N	\N	\N	\N	\N
4622	2625	3	\N	\N	\N	\N	\N	\N
4623	2620	3	\N	\N	\N	\N	\N	\N
4624	2621	3	\N	\N	\N	\N	\N	\N
4625	2624	3	\N	\N	\N	\N	\N	\N
4626	2626	3	\N	\N	\N	\N	\N	\N
4627	2631	3	\N	\N	\N	\N	\N	\N
4628	2628	3	\N	\N	\N	\N	\N	\N
4629	2629	3	\N	\N	\N	\N	\N	\N
4630	2627	3	\N	\N	\N	\N	\N	\N
4631	2630	3	\N	\N	\N	\N	\N	\N
4632	2632	3	\N	\N	\N	\N	\N	\N
4633	2636	3	\N	\N	\N	\N	\N	\N
4634	2635	3	\N	\N	\N	\N	\N	\N
4635	2633	3	\N	\N	\N	\N	\N	\N
4636	2634	3	\N	\N	\N	\N	\N	\N
4637	2637	3	\N	\N	\N	\N	\N	\N
4638	2642	3	\N	\N	\N	\N	\N	\N
4639	2639	3	\N	\N	\N	\N	\N	\N
4640	2641	3	\N	\N	\N	\N	\N	\N
4642	2640	3	\N	\N	\N	\N	\N	\N
4643	2643	3	\N	\N	\N	\N	\N	\N
4644	2644	3	\N	\N	\N	\N	\N	\N
4645	2645	3	\N	\N	\N	\N	\N	\N
4646	2646	3	\N	\N	\N	\N	\N	\N
4647	2647	3	\N	\N	\N	\N	\N	\N
4648	2648	3	\N	\N	\N	\N	\N	\N
4649	2649	3	\N	\N	\N	\N	\N	\N
4650	2650	3	\N	\N	\N	\N	\N	\N
4651	2651	3	\N	\N	\N	\N	\N	\N
4652	2652	3	\N	\N	\N	\N	\N	\N
4653	2653	3	\N	\N	\N	\N	\N	\N
4654	2657	3	\N	\N	\N	\N	\N	\N
4655	2656	3	\N	\N	\N	\N	\N	\N
4656	2655	3	\N	\N	\N	\N	\N	\N
4657	2654	3	\N	\N	\N	\N	\N	\N
4658	2658	3	\N	\N	\N	\N	\N	\N
4659	2663	3	\N	\N	\N	\N	\N	\N
4660	2661	3	\N	\N	\N	\N	\N	\N
4661	2659	3	\N	\N	\N	\N	\N	\N
4662	2662	3	\N	\N	\N	\N	\N	\N
4663	2660	3	\N	\N	\N	\N	\N	\N
4664	2664	3	\N	\N	\N	\N	\N	\N
4665	2668	3	\N	\N	\N	\N	\N	\N
4666	2665	3	\N	\N	\N	\N	\N	\N
4667	2666	3	\N	\N	\N	\N	\N	\N
4668	2667	3	\N	\N	\N	\N	\N	\N
4669	2669	3	\N	\N	\N	\N	\N	\N
4670	2674	3	\N	\N	\N	\N	\N	\N
4671	2671	3	\N	\N	\N	\N	\N	\N
4672	2670	3	\N	\N	\N	\N	\N	\N
4673	2673	3	\N	\N	\N	\N	\N	\N
4674	2672	3	\N	\N	\N	\N	\N	\N
4675	2675	3	\N	\N	\N	\N	\N	\N
4676	2678	3	\N	\N	\N	\N	\N	\N
4677	2679	3	\N	\N	\N	\N	\N	\N
4678	2677	3	\N	\N	\N	\N	\N	\N
4679	2676	3	\N	\N	\N	\N	\N	\N
4680	2680	3	\N	\N	\N	\N	\N	\N
4681	2685	3	\N	\N	\N	\N	\N	\N
4682	2681	3	\N	\N	\N	\N	\N	\N
4683	2683	3	\N	\N	\N	\N	\N	\N
4684	2682	3	\N	\N	\N	\N	\N	\N
4685	2684	3	\N	\N	\N	\N	\N	\N
4686	2686	3	\N	\N	\N	\N	\N	\N
4687	2690	3	\N	\N	\N	\N	\N	\N
4688	2688	3	\N	\N	\N	\N	\N	\N
4689	2689	3	\N	\N	\N	\N	\N	\N
4690	2687	3	\N	\N	\N	\N	\N	\N
4691	2691	3	\N	\N	\N	\N	\N	\N
4692	2694	3	\N	\N	\N	\N	\N	\N
4693	2692	3	\N	\N	\N	\N	\N	\N
4694	2693	3	\N	\N	\N	\N	\N	\N
4695	2695	3	\N	\N	\N	\N	\N	\N
4696	2703	3	\N	\N	\N	\N	\N	\N
4697	2701	3	\N	\N	\N	\N	\N	\N
4698	2699	3	\N	\N	\N	\N	\N	\N
4699	2702	3	\N	\N	\N	\N	\N	\N
4700	2698	3	\N	\N	\N	\N	\N	\N
4701	2696	3	\N	\N	\N	\N	\N	\N
4702	2704	3	\N	\N	\N	\N	\N	\N
4703	2708	3	\N	\N	\N	\N	\N	\N
4704	2705	3	\N	\N	\N	\N	\N	\N
4705	2706	3	\N	\N	\N	\N	\N	\N
4706	2709	3	\N	\N	\N	\N	\N	\N
4707	2715	3	\N	\N	\N	\N	\N	\N
4708	2710	3	\N	\N	\N	\N	\N	\N
4709	2712	3	\N	\N	\N	\N	\N	\N
4710	2711	3	\N	\N	\N	\N	\N	\N
4587	2585	3	0.0000250675	75.6271076340	19764.0000000000	3.95	65.64	39.69
4612	2608	3	0.0000645195	5328.4279314541	19776.0000000000	-0.01	-3.33	14.50
4711	2713	3	\N	\N	\N	\N	\N	\N
4712	2714	3	\N	\N	\N	\N	\N	\N
4713	2717	3	\N	\N	\N	\N	\N	\N
4714	2719	3	\N	\N	\N	\N	\N	\N
4715	2720	3	\N	\N	\N	\N	\N	\N
4716	2718	3	\N	\N	\N	\N	\N	\N
4717	2721	3	\N	\N	\N	\N	\N	\N
4718	2727	3	\N	\N	\N	\N	\N	\N
4719	2722	3	\N	\N	\N	\N	\N	\N
4720	2723	3	\N	\N	\N	\N	\N	\N
4721	2724	3	\N	\N	\N	\N	\N	\N
4722	2725	3	\N	\N	\N	\N	\N	\N
4723	2726	3	\N	\N	\N	\N	\N	\N
4724	2729	3	\N	\N	\N	\N	\N	\N
4725	2732	3	\N	\N	\N	\N	\N	\N
4726	2730	3	\N	\N	\N	\N	\N	\N
4727	2731	3	\N	\N	\N	\N	\N	\N
4728	2733	3	\N	\N	\N	\N	\N	\N
4729	2739	3	\N	\N	\N	\N	\N	\N
4730	2736	3	\N	\N	\N	\N	\N	\N
4731	2735	3	\N	\N	\N	\N	\N	\N
4732	2738	3	\N	\N	\N	\N	\N	\N
4733	2734	3	\N	\N	\N	\N	\N	\N
4734	2737	3	\N	\N	\N	\N	\N	\N
4735	2740	3	\N	\N	\N	\N	\N	\N
4736	2743	3	\N	\N	\N	\N	\N	\N
4737	2741	3	\N	\N	\N	\N	\N	\N
4738	2742	3	\N	\N	\N	\N	\N	\N
4739	2744	3	\N	\N	\N	\N	\N	\N
4740	2749	3	\N	\N	\N	\N	\N	\N
4741	2747	3	\N	\N	\N	\N	\N	\N
4742	2750	3	\N	\N	\N	\N	\N	\N
4743	2746	3	\N	\N	\N	\N	\N	\N
4744	2748	3	\N	\N	\N	\N	\N	\N
4745	2752	3	\N	\N	\N	\N	\N	\N
4746	2751	3	\N	\N	\N	\N	\N	\N
4747	2755	3	\N	\N	\N	\N	\N	\N
4748	2753	3	\N	\N	\N	\N	\N	\N
4749	2754	3	\N	\N	\N	\N	\N	\N
4750	2756	3	\N	\N	\N	\N	\N	\N
4751	2761	3	\N	\N	\N	\N	\N	\N
4752	2762	3	\N	\N	\N	\N	\N	\N
4753	2757	3	\N	\N	\N	\N	\N	\N
4754	2758	3	\N	\N	\N	\N	\N	\N
4755	2759	3	\N	\N	\N	\N	\N	\N
4756	2760	3	\N	\N	\N	\N	\N	\N
4757	2763	3	\N	\N	\N	\N	\N	\N
4758	2766	3	\N	\N	\N	\N	\N	\N
4759	2764	3	\N	\N	\N	\N	\N	\N
4760	2765	3	\N	\N	\N	\N	\N	\N
4761	2767	3	\N	\N	\N	\N	\N	\N
4762	2771	3	\N	\N	\N	\N	\N	\N
4763	2772	3	\N	\N	\N	\N	\N	\N
4764	2768	3	\N	\N	\N	\N	\N	\N
4765	2769	3	\N	\N	\N	\N	\N	\N
4766	2770	3	\N	\N	\N	\N	\N	\N
4767	2774	3	\N	\N	\N	\N	\N	\N
4768	2773	3	\N	\N	\N	\N	\N	\N
4769	2777	3	\N	\N	\N	\N	\N	\N
4770	2775	3	\N	\N	\N	\N	\N	\N
4771	2776	3	\N	\N	\N	\N	\N	\N
4772	2778	3	\N	\N	\N	\N	\N	\N
4773	2827	3	\N	\N	\N	\N	\N	\N
4774	2825	3	\N	\N	\N	\N	\N	\N
4775	2779	3	\N	\N	\N	\N	\N	\N
4776	2780	3	\N	\N	\N	\N	\N	\N
4777	2826	3	\N	\N	\N	\N	\N	\N
4778	2829	3	\N	\N	\N	\N	\N	\N
4779	2828	3	\N	\N	\N	\N	\N	\N
4780	2833	3	\N	\N	\N	\N	\N	\N
4781	2831	3	\N	\N	\N	\N	\N	\N
4782	2830	3	\N	\N	\N	\N	\N	\N
4783	2834	3	\N	\N	\N	\N	\N	\N
4784	2839	3	\N	\N	\N	\N	\N	\N
4785	2835	3	\N	\N	\N	\N	\N	\N
4786	2836	3	\N	\N	\N	\N	\N	\N
4787	2837	3	\N	\N	\N	\N	\N	\N
4788	2838	3	\N	\N	\N	\N	\N	\N
4789	2841	3	\N	\N	\N	\N	\N	\N
4790	2842	3	\N	\N	\N	\N	\N	\N
4791	2840	3	\N	\N	\N	\N	\N	\N
4792	2844	3	\N	\N	\N	\N	\N	\N
4793	2843	3	\N	\N	\N	\N	\N	\N
4794	2845	3	\N	\N	\N	\N	\N	\N
4795	2850	3	\N	\N	\N	\N	\N	\N
4796	2847	3	\N	\N	\N	\N	\N	\N
4797	2846	3	\N	\N	\N	\N	\N	\N
4798	2848	3	\N	\N	\N	\N	\N	\N
4799	2849	3	\N	\N	\N	\N	\N	\N
4800	2851	3	\N	\N	\N	\N	\N	\N
4801	2852	3	\N	\N	\N	\N	\N	\N
4802	2855	3	\N	\N	\N	\N	\N	\N
4803	2853	3	\N	\N	\N	\N	\N	\N
4804	2854	3	\N	\N	\N	\N	\N	\N
4805	2856	3	\N	\N	\N	\N	\N	\N
4806	2857	3	\N	\N	\N	\N	\N	\N
4807	2858	3	\N	\N	\N	\N	\N	\N
4808	2859	3	\N	\N	\N	\N	\N	\N
4809	2862	3	\N	\N	\N	\N	\N	\N
4810	2866	3	\N	\N	\N	\N	\N	\N
4811	2861	3	\N	\N	\N	\N	\N	\N
4812	2867	3	\N	\N	\N	\N	\N	\N
4813	2869	3	\N	\N	\N	\N	\N	\N
4814	2868	3	\N	\N	\N	\N	\N	\N
4815	2870	3	\N	\N	\N	\N	\N	\N
4816	2	4	\N	\N	\N	\N	\N	\N
4817	4	4	\N	\N	\N	\N	\N	\N
4818	8	4	\N	\N	\N	\N	\N	\N
4819	1	4	\N	\N	\N	\N	\N	\N
4820	6	4	\N	\N	\N	\N	\N	\N
4821	5	4	\N	\N	\N	\N	\N	\N
4822	9	4	\N	\N	\N	\N	\N	\N
4823	3	4	\N	\N	\N	\N	\N	\N
4824	13	4	\N	\N	\N	\N	\N	\N
4825	10	4	\N	\N	\N	\N	\N	\N
4826	14	4	\N	\N	\N	\N	\N	\N
4827	16	4	\N	\N	\N	\N	\N	\N
4828	18	4	\N	\N	\N	\N	\N	\N
4829	25	4	\N	\N	\N	\N	\N	\N
4830	31	4	\N	\N	\N	\N	\N	\N
4831	32	4	\N	\N	\N	\N	\N	\N
4832	34	4	\N	\N	\N	\N	\N	\N
4833	37	4	\N	\N	\N	\N	\N	\N
4834	35	4	\N	\N	\N	\N	\N	\N
4835	41	4	\N	\N	\N	\N	\N	\N
4836	42	4	\N	\N	\N	\N	\N	\N
4837	43	4	\N	\N	\N	\N	\N	\N
4838	45	4	\N	\N	\N	\N	\N	\N
4839	49	4	\N	\N	\N	\N	\N	\N
4840	50	4	\N	\N	\N	\N	\N	\N
4841	51	4	\N	\N	\N	\N	\N	\N
4842	53	4	\N	\N	\N	\N	\N	\N
4843	56	4	\N	\N	\N	\N	\N	\N
4844	52	4	\N	\N	\N	\N	\N	\N
4845	57	4	\N	\N	\N	\N	\N	\N
4846	58	4	\N	\N	\N	\N	\N	\N
4847	61	4	\N	\N	\N	\N	\N	\N
4848	63	4	\N	\N	\N	\N	\N	\N
4849	64	4	\N	\N	\N	\N	\N	\N
4850	66	4	\N	\N	\N	\N	\N	\N
4851	67	4	\N	\N	\N	\N	\N	\N
4852	68	4	\N	\N	\N	\N	\N	\N
4853	69	4	\N	\N	\N	\N	\N	\N
4854	70	4	\N	\N	\N	\N	\N	\N
4855	71	4	\N	\N	\N	\N	\N	\N
4856	72	4	\N	\N	\N	\N	\N	\N
4857	74	4	\N	\N	\N	\N	\N	\N
4858	75	4	\N	\N	\N	\N	\N	\N
4859	76	4	\N	\N	\N	\N	\N	\N
4860	77	4	\N	\N	\N	\N	\N	\N
4861	78	4	\N	\N	\N	\N	\N	\N
4862	79	4	\N	\N	\N	\N	\N	\N
4863	80	4	\N	\N	\N	\N	\N	\N
4864	83	4	\N	\N	\N	\N	\N	\N
4865	84	4	\N	\N	\N	\N	\N	\N
4866	87	4	\N	\N	\N	\N	\N	\N
4867	88	4	\N	\N	\N	\N	\N	\N
4868	89	4	\N	\N	\N	\N	\N	\N
4869	90	4	\N	\N	\N	\N	\N	\N
4870	93	4	\N	\N	\N	\N	\N	\N
4871	99	4	\N	\N	\N	\N	\N	\N
4872	101	4	\N	\N	\N	\N	\N	\N
4873	103	4	\N	\N	\N	\N	\N	\N
4874	109	4	\N	\N	\N	\N	\N	\N
4875	113	4	\N	\N	\N	\N	\N	\N
4876	114	4	\N	\N	\N	\N	\N	\N
4877	117	4	\N	\N	\N	\N	\N	\N
4878	118	4	\N	\N	\N	\N	\N	\N
4879	120	4	\N	\N	\N	\N	\N	\N
4880	121	4	\N	\N	\N	\N	\N	\N
4881	122	4	\N	\N	\N	\N	\N	\N
4882	125	4	\N	\N	\N	\N	\N	\N
4883	128	4	\N	\N	\N	\N	\N	\N
4884	129	4	\N	\N	\N	\N	\N	\N
4885	130	4	\N	\N	\N	\N	\N	\N
4886	131	4	\N	\N	\N	\N	\N	\N
4887	132	4	\N	\N	\N	\N	\N	\N
4888	134	4	\N	\N	\N	\N	\N	\N
4889	135	4	\N	\N	\N	\N	\N	\N
4890	138	4	\N	\N	\N	\N	\N	\N
4891	141	4	\N	\N	\N	\N	\N	\N
4892	142	4	\N	\N	\N	\N	\N	\N
4893	145	4	\N	\N	\N	\N	\N	\N
4894	148	4	\N	\N	\N	\N	\N	\N
4895	150	4	\N	\N	\N	\N	\N	\N
4896	151	4	\N	\N	\N	\N	\N	\N
4897	154	4	\N	\N	\N	\N	\N	\N
4898	159	4	\N	\N	\N	\N	\N	\N
4899	160	4	\N	\N	\N	\N	\N	\N
4900	161	4	\N	\N	\N	\N	\N	\N
4901	164	4	\N	\N	\N	\N	\N	\N
4902	168	4	\N	\N	\N	\N	\N	\N
4903	170	4	\N	\N	\N	\N	\N	\N
4904	174	4	\N	\N	\N	\N	\N	\N
4905	175	4	\N	\N	\N	\N	\N	\N
4906	181	4	\N	\N	\N	\N	\N	\N
4907	182	4	\N	\N	\N	\N	\N	\N
4908	206	4	\N	\N	\N	\N	\N	\N
4909	201	4	\N	\N	\N	\N	\N	\N
4910	213	4	\N	\N	\N	\N	\N	\N
4911	205	4	\N	\N	\N	\N	\N	\N
4912	199	4	\N	\N	\N	\N	\N	\N
4913	218	4	\N	\N	\N	\N	\N	\N
4914	215	4	\N	\N	\N	\N	\N	\N
4915	217	4	\N	\N	\N	\N	\N	\N
4916	212	4	\N	\N	\N	\N	\N	\N
4917	221	4	\N	\N	\N	\N	\N	\N
4918	224	4	\N	\N	\N	\N	\N	\N
4919	233	4	\N	\N	\N	\N	\N	\N
4920	234	4	\N	\N	\N	\N	\N	\N
4921	254	4	\N	\N	\N	\N	\N	\N
4922	257	4	\N	\N	\N	\N	\N	\N
4923	258	4	\N	\N	\N	\N	\N	\N
4924	269	4	\N	\N	\N	\N	\N	\N
4925	260	4	\N	\N	\N	\N	\N	\N
4926	263	4	\N	\N	\N	\N	\N	\N
4927	268	4	\N	\N	\N	\N	\N	\N
4928	275	4	\N	\N	\N	\N	\N	\N
4929	276	4	\N	\N	\N	\N	\N	\N
4930	287	4	\N	\N	\N	\N	\N	\N
4931	290	4	\N	\N	\N	\N	\N	\N
4932	278	4	\N	\N	\N	\N	\N	\N
4933	279	4	\N	\N	\N	\N	\N	\N
4934	291	4	\N	\N	\N	\N	\N	\N
4935	293	4	\N	\N	\N	\N	\N	\N
4936	295	4	\N	\N	\N	\N	\N	\N
4937	298	4	\N	\N	\N	\N	\N	\N
4938	304	4	\N	\N	\N	\N	\N	\N
4939	312	4	\N	\N	\N	\N	\N	\N
4940	313	4	\N	\N	\N	\N	\N	\N
4941	316	4	\N	\N	\N	\N	\N	\N
4942	317	4	\N	\N	\N	\N	\N	\N
4943	322	4	\N	\N	\N	\N	\N	\N
4944	323	4	\N	\N	\N	\N	\N	\N
4945	325	4	\N	\N	\N	\N	\N	\N
4946	328	4	\N	\N	\N	\N	\N	\N
4947	331	4	\N	\N	\N	\N	\N	\N
4948	333	4	\N	\N	\N	\N	\N	\N
4949	334	4	\N	\N	\N	\N	\N	\N
4950	337	4	\N	\N	\N	\N	\N	\N
4951	338	4	\N	\N	\N	\N	\N	\N
4952	341	4	\N	\N	\N	\N	\N	\N
4953	344	4	\N	\N	\N	\N	\N	\N
4954	350	4	\N	\N	\N	\N	\N	\N
4955	353	4	\N	\N	\N	\N	\N	\N
4956	356	4	\N	\N	\N	\N	\N	\N
4957	360	4	\N	\N	\N	\N	\N	\N
4958	362	4	\N	\N	\N	\N	\N	\N
4959	366	4	\N	\N	\N	\N	\N	\N
4960	367	4	\N	\N	\N	\N	\N	\N
4961	370	4	\N	\N	\N	\N	\N	\N
4962	372	4	\N	\N	\N	\N	\N	\N
4963	374	4	\N	\N	\N	\N	\N	\N
4964	377	4	\N	\N	\N	\N	\N	\N
4965	382	4	\N	\N	\N	\N	\N	\N
4966	385	4	\N	\N	\N	\N	\N	\N
4967	386	4	\N	\N	\N	\N	\N	\N
4968	389	4	\N	\N	\N	\N	\N	\N
4969	400	4	\N	\N	\N	\N	\N	\N
4970	405	4	\N	\N	\N	\N	\N	\N
4971	415	4	\N	\N	\N	\N	\N	\N
4972	411	4	\N	\N	\N	\N	\N	\N
4973	406	4	\N	\N	\N	\N	\N	\N
4974	416	4	\N	\N	\N	\N	\N	\N
4975	426	4	\N	\N	\N	\N	\N	\N
4976	448	4	\N	\N	\N	\N	\N	\N
4977	460	4	\N	\N	\N	\N	\N	\N
4978	450	4	\N	\N	\N	\N	\N	\N
4979	467	4	\N	\N	\N	\N	\N	\N
4980	463	4	\N	\N	\N	\N	\N	\N
4981	461	4	\N	\N	\N	\N	\N	\N
4982	477	4	\N	\N	\N	\N	\N	\N
4983	476	4	\N	\N	\N	\N	\N	\N
4984	513	4	\N	\N	\N	\N	\N	\N
4985	468	4	\N	\N	\N	\N	\N	\N
4986	506	4	\N	\N	\N	\N	\N	\N
4987	512	4	\N	\N	\N	\N	\N	\N
4988	502	4	\N	\N	\N	\N	\N	\N
4989	520	4	\N	\N	\N	\N	\N	\N
4990	470	4	\N	\N	\N	\N	\N	\N
4991	501	4	\N	\N	\N	\N	\N	\N
4992	495	4	\N	\N	\N	\N	\N	\N
4993	525	4	\N	\N	\N	\N	\N	\N
4994	536	4	\N	\N	\N	\N	\N	\N
4995	541	4	\N	\N	\N	\N	\N	\N
4996	543	4	\N	\N	\N	\N	\N	\N
4997	545	4	\N	\N	\N	\N	\N	\N
4998	549	4	\N	\N	\N	\N	\N	\N
4999	551	4	\N	\N	\N	\N	\N	\N
5000	576	4	\N	\N	\N	\N	\N	\N
5001	572	4	\N	\N	\N	\N	\N	\N
5002	558	4	\N	\N	\N	\N	\N	\N
5003	573	4	\N	\N	\N	\N	\N	\N
5004	584	4	\N	\N	\N	\N	\N	\N
5005	588	4	\N	\N	\N	\N	\N	\N
5006	594	4	\N	\N	\N	\N	\N	\N
5007	597	4	\N	\N	\N	\N	\N	\N
5008	606	4	\N	\N	\N	\N	\N	\N
5009	601	4	\N	\N	\N	\N	\N	\N
5010	624	4	\N	\N	\N	\N	\N	\N
5011	625	4	\N	\N	\N	\N	\N	\N
5012	623	4	\N	\N	\N	\N	\N	\N
5013	626	4	\N	\N	\N	\N	\N	\N
5014	627	4	\N	\N	\N	\N	\N	\N
5015	629	4	\N	\N	\N	\N	\N	\N
5016	633	4	\N	\N	\N	\N	\N	\N
5017	638	4	\N	\N	\N	\N	\N	\N
5018	643	4	\N	\N	\N	\N	\N	\N
5019	644	4	\N	\N	\N	\N	\N	\N
5020	654	4	\N	\N	\N	\N	\N	\N
5021	656	4	\N	\N	\N	\N	\N	\N
5022	659	4	\N	\N	\N	\N	\N	\N
5023	660	4	\N	\N	\N	\N	\N	\N
5024	666	4	\N	\N	\N	\N	\N	\N
5025	680	4	\N	\N	\N	\N	\N	\N
5026	693	4	\N	\N	\N	\N	\N	\N
5027	699	4	\N	\N	\N	\N	\N	\N
5028	702	4	\N	\N	\N	\N	\N	\N
5029	703	4	\N	\N	\N	\N	\N	\N
5030	706	4	\N	\N	\N	\N	\N	\N
5031	707	4	\N	\N	\N	\N	\N	\N
5032	708	4	\N	\N	\N	\N	\N	\N
5033	719	4	\N	\N	\N	\N	\N	\N
5034	720	4	\N	\N	\N	\N	\N	\N
5035	723	4	\N	\N	\N	\N	\N	\N
5036	730	4	\N	\N	\N	\N	\N	\N
5037	733	4	\N	\N	\N	\N	\N	\N
5038	734	4	\N	\N	\N	\N	\N	\N
5039	747	4	\N	\N	\N	\N	\N	\N
5040	760	4	\N	\N	\N	\N	\N	\N
5041	764	4	\N	\N	\N	\N	\N	\N
5042	766	4	\N	\N	\N	\N	\N	\N
5043	778	4	\N	\N	\N	\N	\N	\N
5044	781	4	\N	\N	\N	\N	\N	\N
5045	785	4	\N	\N	\N	\N	\N	\N
5046	788	4	\N	\N	\N	\N	\N	\N
5047	789	4	\N	\N	\N	\N	\N	\N
5048	795	4	\N	\N	\N	\N	\N	\N
5049	796	4	\N	\N	\N	\N	\N	\N
5050	797	4	\N	\N	\N	\N	\N	\N
5051	799	4	\N	\N	\N	\N	\N	\N
5052	812	4	\N	\N	\N	\N	\N	\N
5053	813	4	\N	\N	\N	\N	\N	\N
5054	815	4	\N	\N	\N	\N	\N	\N
5055	818	4	\N	\N	\N	\N	\N	\N
5056	819	4	\N	\N	\N	\N	\N	\N
5057	823	4	\N	\N	\N	\N	\N	\N
5058	825	4	\N	\N	\N	\N	\N	\N
5059	814	4	\N	\N	\N	\N	\N	\N
5060	831	4	\N	\N	\N	\N	\N	\N
5061	833	4	\N	\N	\N	\N	\N	\N
5062	836	4	\N	\N	\N	\N	\N	\N
5063	837	4	\N	\N	\N	\N	\N	\N
5064	841	4	\N	\N	\N	\N	\N	\N
5065	853	4	\N	\N	\N	\N	\N	\N
5066	855	4	\N	\N	\N	\N	\N	\N
5067	857	4	\N	\N	\N	\N	\N	\N
5068	859	4	\N	\N	\N	\N	\N	\N
5069	869	4	\N	\N	\N	\N	\N	\N
5070	870	4	\N	\N	\N	\N	\N	\N
5071	873	4	\N	\N	\N	\N	\N	\N
5072	890	4	\N	\N	\N	\N	\N	\N
5073	892	4	\N	\N	\N	\N	\N	\N
5074	894	4	\N	\N	\N	\N	\N	\N
5075	895	4	\N	\N	\N	\N	\N	\N
5076	898	4	\N	\N	\N	\N	\N	\N
5077	911	4	\N	\N	\N	\N	\N	\N
5078	912	4	\N	\N	\N	\N	\N	\N
5079	914	4	\N	\N	\N	\N	\N	\N
5080	916	4	\N	\N	\N	\N	\N	\N
5081	918	4	\N	\N	\N	\N	\N	\N
5082	920	4	\N	\N	\N	\N	\N	\N
5083	921	4	\N	\N	\N	\N	\N	\N
5084	924	4	\N	\N	\N	\N	\N	\N
5085	933	4	\N	\N	\N	\N	\N	\N
5086	934	4	\N	\N	\N	\N	\N	\N
5087	938	4	\N	\N	\N	\N	\N	\N
5088	939	4	\N	\N	\N	\N	\N	\N
5089	945	4	\N	\N	\N	\N	\N	\N
5090	948	4	\N	\N	\N	\N	\N	\N
5091	951	4	\N	\N	\N	\N	\N	\N
5092	954	4	\N	\N	\N	\N	\N	\N
5093	959	4	\N	\N	\N	\N	\N	\N
5094	960	4	\N	\N	\N	\N	\N	\N
5095	964	4	\N	\N	\N	\N	\N	\N
5096	965	4	\N	\N	\N	\N	\N	\N
5097	977	4	\N	\N	\N	\N	\N	\N
5098	978	4	\N	\N	\N	\N	\N	\N
5099	983	4	\N	\N	\N	\N	\N	\N
5100	986	4	\N	\N	\N	\N	\N	\N
5101	988	4	\N	\N	\N	\N	\N	\N
5102	990	4	\N	\N	\N	\N	\N	\N
5103	992	4	\N	\N	\N	\N	\N	\N
5104	993	4	\N	\N	\N	\N	\N	\N
5105	994	4	\N	\N	\N	\N	\N	\N
5106	998	4	\N	\N	\N	\N	\N	\N
5107	999	4	\N	\N	\N	\N	\N	\N
5108	1002	4	\N	\N	\N	\N	\N	\N
5109	1004	4	\N	\N	\N	\N	\N	\N
5110	1008	4	\N	\N	\N	\N	\N	\N
5111	1010	4	\N	\N	\N	\N	\N	\N
5112	1019	4	\N	\N	\N	\N	\N	\N
5113	1020	4	\N	\N	\N	\N	\N	\N
5114	1022	4	\N	\N	\N	\N	\N	\N
5115	1026	4	\N	\N	\N	\N	\N	\N
5116	1027	4	\N	\N	\N	\N	\N	\N
5117	1028	4	\N	\N	\N	\N	\N	\N
5118	1032	4	\N	\N	\N	\N	\N	\N
5119	1033	4	\N	\N	\N	\N	\N	\N
5120	1035	4	\N	\N	\N	\N	\N	\N
5121	1038	4	\N	\N	\N	\N	\N	\N
5122	1042	4	\N	\N	\N	\N	\N	\N
5123	1044	4	\N	\N	\N	\N	\N	\N
5124	1050	4	\N	\N	\N	\N	\N	\N
5125	1052	4	\N	\N	\N	\N	\N	\N
5126	1053	4	\N	\N	\N	\N	\N	\N
5127	1058	4	\N	\N	\N	\N	\N	\N
5128	1063	4	\N	\N	\N	\N	\N	\N
5129	1066	4	\N	\N	\N	\N	\N	\N
5130	1069	4	\N	\N	\N	\N	\N	\N
5131	1070	4	\N	\N	\N	\N	\N	\N
5132	1082	4	\N	\N	\N	\N	\N	\N
5133	1084	4	\N	\N	\N	\N	\N	\N
5134	1085	4	\N	\N	\N	\N	\N	\N
5135	1087	4	\N	\N	\N	\N	\N	\N
5136	1089	4	\N	\N	\N	\N	\N	\N
5137	1090	4	\N	\N	\N	\N	\N	\N
5138	1093	4	\N	\N	\N	\N	\N	\N
5139	1100	4	\N	\N	\N	\N	\N	\N
5140	1104	4	\N	\N	\N	\N	\N	\N
5141	1106	4	\N	\N	\N	\N	\N	\N
5142	1107	4	\N	\N	\N	\N	\N	\N
5143	1109	4	\N	\N	\N	\N	\N	\N
5144	1110	4	\N	\N	\N	\N	\N	\N
5145	1111	4	\N	\N	\N	\N	\N	\N
5146	1113	4	\N	\N	\N	\N	\N	\N
5147	1120	4	\N	\N	\N	\N	\N	\N
5148	1123	4	\N	\N	\N	\N	\N	\N
5149	1125	4	\N	\N	\N	\N	\N	\N
5150	1131	4	\N	\N	\N	\N	\N	\N
5151	1135	4	\N	\N	\N	\N	\N	\N
5152	1136	4	\N	\N	\N	\N	\N	\N
5153	1141	4	\N	\N	\N	\N	\N	\N
5154	1146	4	\N	\N	\N	\N	\N	\N
5155	1147	4	\N	\N	\N	\N	\N	\N
5156	1148	4	\N	\N	\N	\N	\N	\N
5157	1153	4	\N	\N	\N	\N	\N	\N
5158	1154	4	\N	\N	\N	\N	\N	\N
5159	1156	4	\N	\N	\N	\N	\N	\N
5160	1159	4	\N	\N	\N	\N	\N	\N
5161	1164	4	\N	\N	\N	\N	\N	\N
5162	1155	4	\N	\N	\N	\N	\N	\N
5163	1165	4	\N	\N	\N	\N	\N	\N
5164	1169	4	\N	\N	\N	\N	\N	\N
5165	1175	4	\N	\N	\N	\N	\N	\N
5166	1176	4	\N	\N	\N	\N	\N	\N
5167	1172	4	\N	\N	\N	\N	\N	\N
5168	1168	4	\N	\N	\N	\N	\N	\N
5169	1180	4	\N	\N	\N	\N	\N	\N
5170	1193	4	\N	\N	\N	\N	\N	\N
5171	1194	4	\N	\N	\N	\N	\N	\N
5172	1182	4	\N	\N	\N	\N	\N	\N
5173	1191	4	\N	\N	\N	\N	\N	\N
5174	1185	4	\N	\N	\N	\N	\N	\N
5175	1195	4	\N	\N	\N	\N	\N	\N
5176	1208	4	\N	\N	\N	\N	\N	\N
5177	1206	4	\N	\N	\N	\N	\N	\N
5178	1200	4	\N	\N	\N	\N	\N	\N
5179	1198	4	\N	\N	\N	\N	\N	\N
5180	1209	4	\N	\N	\N	\N	\N	\N
5181	1210	4	\N	\N	\N	\N	\N	\N
5182	1212	4	\N	\N	\N	\N	\N	\N
5183	1213	4	\N	\N	\N	\N	\N	\N
5184	1214	4	\N	\N	\N	\N	\N	\N
5185	1216	4	\N	\N	\N	\N	\N	\N
5186	1218	4	\N	\N	\N	\N	\N	\N
5187	1226	4	\N	\N	\N	\N	\N	\N
5188	1229	4	\N	\N	\N	\N	\N	\N
5189	1234	4	\N	\N	\N	\N	\N	\N
5190	1241	4	\N	\N	\N	\N	\N	\N
5191	1223	4	\N	\N	\N	\N	\N	\N
5192	1238	4	\N	\N	\N	\N	\N	\N
5193	1244	4	\N	\N	\N	\N	\N	\N
5194	1249	4	\N	\N	\N	\N	\N	\N
5195	1248	4	\N	\N	\N	\N	\N	\N
5196	1250	4	\N	\N	\N	\N	\N	\N
5197	1247	4	\N	\N	\N	\N	\N	\N
5198	1230	4	\N	\N	\N	\N	\N	\N
5199	1251	4	\N	\N	\N	\N	\N	\N
5200	1256	4	\N	\N	\N	\N	\N	\N
5201	1257	4	\N	\N	\N	\N	\N	\N
5202	1252	4	\N	\N	\N	\N	\N	\N
5203	1254	4	\N	\N	\N	\N	\N	\N
5204	1259	4	\N	\N	\N	\N	\N	\N
5205	1271	4	\N	\N	\N	\N	\N	\N
5206	1264	4	\N	\N	\N	\N	\N	\N
5207	1268	4	\N	\N	\N	\N	\N	\N
5208	1266	4	\N	\N	\N	\N	\N	\N
5209	1269	4	\N	\N	\N	\N	\N	\N
5210	1274	4	\N	\N	\N	\N	\N	\N
5211	1281	4	\N	\N	\N	\N	\N	\N
5212	1275	4	\N	\N	\N	\N	\N	\N
5213	1276	4	\N	\N	\N	\N	\N	\N
5214	1279	4	\N	\N	\N	\N	\N	\N
5215	1282	4	\N	\N	\N	\N	\N	\N
5216	1288	4	\N	\N	\N	\N	\N	\N
5217	1283	4	\N	\N	\N	\N	\N	\N
5218	1284	4	\N	\N	\N	\N	\N	\N
5219	1285	4	\N	\N	\N	\N	\N	\N
5220	1286	4	\N	\N	\N	\N	\N	\N
5221	1291	4	\N	\N	\N	\N	\N	\N
5222	1294	4	\N	\N	\N	\N	\N	\N
5223	1297	4	\N	\N	\N	\N	\N	\N
5224	1298	4	\N	\N	\N	\N	\N	\N
5225	1299	4	\N	\N	\N	\N	\N	\N
5226	1303	4	\N	\N	\N	\N	\N	\N
5227	1304	4	\N	\N	\N	\N	\N	\N
5228	1306	4	\N	\N	\N	\N	\N	\N
5229	1308	4	\N	\N	\N	\N	\N	\N
5230	1309	4	\N	\N	\N	\N	\N	\N
5231	1312	4	\N	\N	\N	\N	\N	\N
5232	1323	4	\N	\N	\N	\N	\N	\N
5233	1322	4	\N	\N	\N	\N	\N	\N
5234	1321	4	\N	\N	\N	\N	\N	\N
5235	1320	4	\N	\N	\N	\N	\N	\N
5236	1334	4	\N	\N	\N	\N	\N	\N
5237	1348	4	\N	\N	\N	\N	\N	\N
5238	1340	4	\N	\N	\N	\N	\N	\N
5239	1336	4	\N	\N	\N	\N	\N	\N
5240	1343	4	\N	\N	\N	\N	\N	\N
5241	1341	4	\N	\N	\N	\N	\N	\N
5242	1351	4	\N	\N	\N	\N	\N	\N
5243	1358	4	\N	\N	\N	\N	\N	\N
5244	1353	4	\N	\N	\N	\N	\N	\N
5245	1357	4	\N	\N	\N	\N	\N	\N
5246	1352	4	\N	\N	\N	\N	\N	\N
5247	1361	4	\N	\N	\N	\N	\N	\N
5248	1367	4	\N	\N	\N	\N	\N	\N
5249	1368	4	\N	\N	\N	\N	\N	\N
5250	1376	4	\N	\N	\N	\N	\N	\N
5251	1375	4	\N	\N	\N	\N	\N	\N
5252	1371	4	\N	\N	\N	\N	\N	\N
5253	1379	4	\N	\N	\N	\N	\N	\N
5254	1380	4	\N	\N	\N	\N	\N	\N
5255	1381	4	\N	\N	\N	\N	\N	\N
5256	1382	4	\N	\N	\N	\N	\N	\N
5257	1387	4	\N	\N	\N	\N	\N	\N
5258	1391	4	\N	\N	\N	\N	\N	\N
5259	1392	4	\N	\N	\N	\N	\N	\N
5260	1389	4	\N	\N	\N	\N	\N	\N
5261	1395	4	\N	\N	\N	\N	\N	\N
5262	1390	4	\N	\N	\N	\N	\N	\N
5263	1396	4	\N	\N	\N	\N	\N	\N
5264	1398	4	\N	\N	\N	\N	\N	\N
5265	1399	4	\N	\N	\N	\N	\N	\N
5266	1397	4	\N	\N	\N	\N	\N	\N
5267	1400	4	\N	\N	\N	\N	\N	\N
5268	1405	4	\N	\N	\N	\N	\N	\N
5269	1393	4	\N	\N	\N	\N	\N	\N
5270	1403	4	\N	\N	\N	\N	\N	\N
5271	1409	4	\N	\N	\N	\N	\N	\N
5272	1414	4	\N	\N	\N	\N	\N	\N
5273	1408	4	\N	\N	\N	\N	\N	\N
5274	1418	4	\N	\N	\N	\N	\N	\N
5275	1420	4	\N	\N	\N	\N	\N	\N
5276	1421	4	\N	\N	\N	\N	\N	\N
5277	1423	4	\N	\N	\N	\N	\N	\N
5278	1425	4	\N	\N	\N	\N	\N	\N
5279	1429	4	\N	\N	\N	\N	\N	\N
5280	1434	4	\N	\N	\N	\N	\N	\N
5281	1435	4	\N	\N	\N	\N	\N	\N
5282	1436	4	\N	\N	\N	\N	\N	\N
5283	1437	4	\N	\N	\N	\N	\N	\N
5284	1438	4	\N	\N	\N	\N	\N	\N
5285	1439	4	\N	\N	\N	\N	\N	\N
5286	1442	4	\N	\N	\N	\N	\N	\N
5287	1447	4	\N	\N	\N	\N	\N	\N
5288	1448	4	\N	\N	\N	\N	\N	\N
5289	1449	4	\N	\N	\N	\N	\N	\N
5290	1454	4	\N	\N	\N	\N	\N	\N
5291	1455	4	\N	\N	\N	\N	\N	\N
5292	1456	4	\N	\N	\N	\N	\N	\N
5293	1457	4	\N	\N	\N	\N	\N	\N
5294	1459	4	\N	\N	\N	\N	\N	\N
5295	1463	4	\N	\N	\N	\N	\N	\N
5296	1464	4	\N	\N	\N	\N	\N	\N
5297	1465	4	\N	\N	\N	\N	\N	\N
5298	1466	4	\N	\N	\N	\N	\N	\N
5299	1468	4	\N	\N	\N	\N	\N	\N
5300	1469	4	\N	\N	\N	\N	\N	\N
5301	1472	4	\N	\N	\N	\N	\N	\N
5302	1473	4	\N	\N	\N	\N	\N	\N
5303	1474	4	\N	\N	\N	\N	\N	\N
5304	1475	4	\N	\N	\N	\N	\N	\N
5305	1481	4	\N	\N	\N	\N	\N	\N
5306	1483	4	\N	\N	\N	\N	\N	\N
5307	1485	4	\N	\N	\N	\N	\N	\N
5308	1478	4	\N	\N	\N	\N	\N	\N
5309	1480	4	\N	\N	\N	\N	\N	\N
5310	1486	4	\N	\N	\N	\N	\N	\N
5311	1492	4	\N	\N	\N	\N	\N	\N
5312	1495	4	\N	\N	\N	\N	\N	\N
5313	1489	4	\N	\N	\N	\N	\N	\N
5314	1487	4	\N	\N	\N	\N	\N	\N
5315	1500	4	\N	\N	\N	\N	\N	\N
5316	1502	4	\N	\N	\N	\N	\N	\N
5317	1503	4	\N	\N	\N	\N	\N	\N
5318	1496	4	\N	\N	\N	\N	\N	\N
5319	1501	4	\N	\N	\N	\N	\N	\N
5320	1497	4	\N	\N	\N	\N	\N	\N
5321	1504	4	\N	\N	\N	\N	\N	\N
5322	1506	4	\N	\N	\N	\N	\N	\N
5323	1505	4	\N	\N	\N	\N	\N	\N
5324	1507	4	\N	\N	\N	\N	\N	\N
5325	1509	4	\N	\N	\N	\N	\N	\N
5326	1514	4	\N	\N	\N	\N	\N	\N
5327	1515	4	\N	\N	\N	\N	\N	\N
5328	1518	4	\N	\N	\N	\N	\N	\N
5329	1510	4	\N	\N	\N	\N	\N	\N
5330	1513	4	\N	\N	\N	\N	\N	\N
5331	1511	4	\N	\N	\N	\N	\N	\N
5332	1520	4	\N	\N	\N	\N	\N	\N
5333	1523	4	\N	\N	\N	\N	\N	\N
5334	1521	4	\N	\N	\N	\N	\N	\N
5335	1522	4	\N	\N	\N	\N	\N	\N
5336	1525	4	\N	\N	\N	\N	\N	\N
5337	1526	4	\N	\N	\N	\N	\N	\N
5338	1527	4	\N	\N	\N	\N	\N	\N
5339	1528	4	\N	\N	\N	\N	\N	\N
5340	1524	4	\N	\N	\N	\N	\N	\N
5341	1529	4	\N	\N	\N	\N	\N	\N
5342	1531	4	\N	\N	\N	\N	\N	\N
5343	1533	4	\N	\N	\N	\N	\N	\N
5344	1534	4	\N	\N	\N	\N	\N	\N
5345	1535	4	\N	\N	\N	\N	\N	\N
5346	1539	4	\N	\N	\N	\N	\N	\N
5347	1542	4	\N	\N	\N	\N	\N	\N
5348	1544	4	\N	\N	\N	\N	\N	\N
5349	1550	4	\N	\N	\N	\N	\N	\N
5350	1548	4	\N	\N	\N	\N	\N	\N
5351	1546	4	\N	\N	\N	\N	\N	\N
5352	1555	4	\N	\N	\N	\N	\N	\N
5353	1552	4	\N	\N	\N	\N	\N	\N
5354	1558	4	\N	\N	\N	\N	\N	\N
5355	1556	4	\N	\N	\N	\N	\N	\N
5356	1554	4	\N	\N	\N	\N	\N	\N
5357	1562	4	\N	\N	\N	\N	\N	\N
5358	1563	4	\N	\N	\N	\N	\N	\N
5359	1561	4	\N	\N	\N	\N	\N	\N
5360	1559	4	\N	\N	\N	\N	\N	\N
5361	1566	4	\N	\N	\N	\N	\N	\N
5362	1567	4	\N	\N	\N	\N	\N	\N
5363	1565	4	\N	\N	\N	\N	\N	\N
5364	1568	4	\N	\N	\N	\N	\N	\N
5365	1570	4	\N	\N	\N	\N	\N	\N
5366	1575	4	\N	\N	\N	\N	\N	\N
5367	1576	4	\N	\N	\N	\N	\N	\N
5368	1577	4	\N	\N	\N	\N	\N	\N
5369	1578	4	\N	\N	\N	\N	\N	\N
5370	1579	4	\N	\N	\N	\N	\N	\N
5371	1581	4	\N	\N	\N	\N	\N	\N
5372	1582	4	\N	\N	\N	\N	\N	\N
5373	1586	4	\N	\N	\N	\N	\N	\N
5374	1587	4	\N	\N	\N	\N	\N	\N
5375	1588	4	\N	\N	\N	\N	\N	\N
5376	1590	4	\N	\N	\N	\N	\N	\N
5377	1592	4	\N	\N	\N	\N	\N	\N
5378	1596	4	\N	\N	\N	\N	\N	\N
5379	1597	4	\N	\N	\N	\N	\N	\N
5380	1598	4	\N	\N	\N	\N	\N	\N
5381	1595	4	\N	\N	\N	\N	\N	\N
5382	1605	4	\N	\N	\N	\N	\N	\N
5383	1606	4	\N	\N	\N	\N	\N	\N
5384	1607	4	\N	\N	\N	\N	\N	\N
5385	1602	4	\N	\N	\N	\N	\N	\N
5386	1603	4	\N	\N	\N	\N	\N	\N
5387	1609	4	\N	\N	\N	\N	\N	\N
5388	1611	4	\N	\N	\N	\N	\N	\N
5389	1614	4	\N	\N	\N	\N	\N	\N
5390	1608	4	\N	\N	\N	\N	\N	\N
5391	1610	4	\N	\N	\N	\N	\N	\N
5392	1616	4	\N	\N	\N	\N	\N	\N
5393	1624	4	\N	\N	\N	\N	\N	\N
5394	1619	4	\N	\N	\N	\N	\N	\N
5395	1623	4	\N	\N	\N	\N	\N	\N
5396	1617	4	\N	\N	\N	\N	\N	\N
5397	1618	4	\N	\N	\N	\N	\N	\N
5398	1625	4	\N	\N	\N	\N	\N	\N
5399	1629	4	\N	\N	\N	\N	\N	\N
5400	1630	4	\N	\N	\N	\N	\N	\N
5401	1626	4	\N	\N	\N	\N	\N	\N
5402	1628	4	\N	\N	\N	\N	\N	\N
5403	1631	4	\N	\N	\N	\N	\N	\N
5404	1638	4	\N	\N	\N	\N	\N	\N
5405	1640	4	\N	\N	\N	\N	\N	\N
5406	1632	4	\N	\N	\N	\N	\N	\N
5407	1636	4	\N	\N	\N	\N	\N	\N
5408	1637	4	\N	\N	\N	\N	\N	\N
5409	1642	4	\N	\N	\N	\N	\N	\N
5410	1650	4	\N	\N	\N	\N	\N	\N
5411	1644	4	\N	\N	\N	\N	\N	\N
5412	1643	4	\N	\N	\N	\N	\N	\N
5413	1647	4	\N	\N	\N	\N	\N	\N
5414	1651	4	\N	\N	\N	\N	\N	\N
5415	1660	4	\N	\N	\N	\N	\N	\N
5416	1657	4	\N	\N	\N	\N	\N	\N
5417	1659	4	\N	\N	\N	\N	\N	\N
5418	1654	4	\N	\N	\N	\N	\N	\N
5419	1658	4	\N	\N	\N	\N	\N	\N
5420	1662	4	\N	\N	\N	\N	\N	\N
5421	1671	4	\N	\N	\N	\N	\N	\N
5422	1665	4	\N	\N	\N	\N	\N	\N
5423	1669	4	\N	\N	\N	\N	\N	\N
5424	1670	4	\N	\N	\N	\N	\N	\N
5425	1673	4	\N	\N	\N	\N	\N	\N
5426	1678	4	\N	\N	\N	\N	\N	\N
5427	1679	4	\N	\N	\N	\N	\N	\N
5428	1674	4	\N	\N	\N	\N	\N	\N
5429	1677	4	\N	\N	\N	\N	\N	\N
5430	1676	4	\N	\N	\N	\N	\N	\N
5431	1680	4	\N	\N	\N	\N	\N	\N
5432	1685	4	\N	\N	\N	\N	\N	\N
5433	1681	4	\N	\N	\N	\N	\N	\N
5434	1683	4	\N	\N	\N	\N	\N	\N
5435	1684	4	\N	\N	\N	\N	\N	\N
5436	1686	4	\N	\N	\N	\N	\N	\N
5437	1693	4	\N	\N	\N	\N	\N	\N
5438	1690	4	\N	\N	\N	\N	\N	\N
5439	1687	4	\N	\N	\N	\N	\N	\N
5440	1688	4	\N	\N	\N	\N	\N	\N
5441	1691	4	\N	\N	\N	\N	\N	\N
5442	1694	4	\N	\N	\N	\N	\N	\N
5443	1699	4	\N	\N	\N	\N	\N	\N
5444	1695	4	\N	\N	\N	\N	\N	\N
5445	1697	4	\N	\N	\N	\N	\N	\N
5446	1698	4	\N	\N	\N	\N	\N	\N
5447	1700	4	\N	\N	\N	\N	\N	\N
5448	1702	4	\N	\N	\N	\N	\N	\N
5449	1703	4	\N	\N	\N	\N	\N	\N
5450	1706	4	\N	\N	\N	\N	\N	\N
5451	1707	4	\N	\N	\N	\N	\N	\N
5452	1708	4	\N	\N	\N	\N	\N	\N
5453	1709	4	\N	\N	\N	\N	\N	\N
5454	1710	4	\N	\N	\N	\N	\N	\N
5455	1711	4	\N	\N	\N	\N	\N	\N
5456	1704	4	\N	\N	\N	\N	\N	\N
5457	1712	4	\N	\N	\N	\N	\N	\N
5458	1717	4	\N	\N	\N	\N	\N	\N
5459	1716	4	\N	\N	\N	\N	\N	\N
5460	1715	4	\N	\N	\N	\N	\N	\N
5461	1714	4	\N	\N	\N	\N	\N	\N
5462	1719	4	\N	\N	\N	\N	\N	\N
5463	1724	4	\N	\N	\N	\N	\N	\N
5464	1723	4	\N	\N	\N	\N	\N	\N
5465	1720	4	\N	\N	\N	\N	\N	\N
5466	1721	4	\N	\N	\N	\N	\N	\N
5467	1722	4	\N	\N	\N	\N	\N	\N
5468	1726	4	\N	\N	\N	\N	\N	\N
5469	1731	4	\N	\N	\N	\N	\N	\N
5470	1728	4	\N	\N	\N	\N	\N	\N
5471	1729	4	\N	\N	\N	\N	\N	\N
5472	1727	4	\N	\N	\N	\N	\N	\N
5473	1739	4	\N	\N	\N	\N	\N	\N
5474	1732	4	\N	\N	\N	\N	\N	\N
5475	1733	4	\N	\N	\N	\N	\N	\N
5476	1736	4	\N	\N	\N	\N	\N	\N
5477	1737	4	\N	\N	\N	\N	\N	\N
5478	1738	4	\N	\N	\N	\N	\N	\N
5479	1745	4	\N	\N	\N	\N	\N	\N
5480	1741	4	\N	\N	\N	\N	\N	\N
5481	1743	4	\N	\N	\N	\N	\N	\N
5482	1742	4	\N	\N	\N	\N	\N	\N
5483	1746	4	\N	\N	\N	\N	\N	\N
5484	1748	4	\N	\N	\N	\N	\N	\N
5485	1747	4	\N	\N	\N	\N	\N	\N
5486	1753	4	\N	\N	\N	\N	\N	\N
5487	1750	4	\N	\N	\N	\N	\N	\N
5488	1752	4	\N	\N	\N	\N	\N	\N
5489	1757	4	\N	\N	\N	\N	\N	\N
5490	1755	4	\N	\N	\N	\N	\N	\N
5491	1756	4	\N	\N	\N	\N	\N	\N
5492	1754	4	\N	\N	\N	\N	\N	\N
5493	1758	4	\N	\N	\N	\N	\N	\N
5494	1759	4	\N	\N	\N	\N	\N	\N
5495	1760	4	\N	\N	\N	\N	\N	\N
5496	1762	4	\N	\N	\N	\N	\N	\N
5497	1763	4	\N	\N	\N	\N	\N	\N
5498	1765	4	\N	\N	\N	\N	\N	\N
5499	1767	4	\N	\N	\N	\N	\N	\N
5500	1772	4	\N	\N	\N	\N	\N	\N
5501	1773	4	\N	\N	\N	\N	\N	\N
5502	1769	4	\N	\N	\N	\N	\N	\N
5503	1771	4	\N	\N	\N	\N	\N	\N
5504	1768	4	\N	\N	\N	\N	\N	\N
5505	1774	4	\N	\N	\N	\N	\N	\N
5506	1777	4	\N	\N	\N	\N	\N	\N
5507	1778	4	\N	\N	\N	\N	\N	\N
5508	1776	4	\N	\N	\N	\N	\N	\N
5509	1775	4	\N	\N	\N	\N	\N	\N
5510	1779	4	\N	\N	\N	\N	\N	\N
5511	1785	4	\N	\N	\N	\N	\N	\N
5512	1781	4	\N	\N	\N	\N	\N	\N
5513	1784	4	\N	\N	\N	\N	\N	\N
5514	1782	4	\N	\N	\N	\N	\N	\N
5515	1783	4	\N	\N	\N	\N	\N	\N
5516	1786	4	\N	\N	\N	\N	\N	\N
5517	1790	4	\N	\N	\N	\N	\N	\N
5518	1788	4	\N	\N	\N	\N	\N	\N
5519	1787	4	\N	\N	\N	\N	\N	\N
5520	1789	4	\N	\N	\N	\N	\N	\N
5521	1792	4	\N	\N	\N	\N	\N	\N
5522	1799	4	\N	\N	\N	\N	\N	\N
5523	1798	4	\N	\N	\N	\N	\N	\N
5524	1793	4	\N	\N	\N	\N	\N	\N
5525	1797	4	\N	\N	\N	\N	\N	\N
5526	1795	4	\N	\N	\N	\N	\N	\N
5527	1801	4	\N	\N	\N	\N	\N	\N
5528	1803	4	\N	\N	\N	\N	\N	\N
5529	1805	4	\N	\N	\N	\N	\N	\N
5530	1807	4	\N	\N	\N	\N	\N	\N
5531	1814	4	\N	\N	\N	\N	\N	\N
5532	1815	4	\N	\N	\N	\N	\N	\N
5533	1808	4	\N	\N	\N	\N	\N	\N
5534	1812	4	\N	\N	\N	\N	\N	\N
5535	1810	4	\N	\N	\N	\N	\N	\N
5536	1811	4	\N	\N	\N	\N	\N	\N
5537	1809	4	\N	\N	\N	\N	\N	\N
5538	1818	4	\N	\N	\N	\N	\N	\N
5539	1816	4	\N	\N	\N	\N	\N	\N
5540	1817	4	\N	\N	\N	\N	\N	\N
5541	1831	4	\N	\N	\N	\N	\N	\N
5542	1819	4	\N	\N	\N	\N	\N	\N
5543	1830	4	\N	\N	\N	\N	\N	\N
5544	1826	4	\N	\N	\N	\N	\N	\N
5545	1828	4	\N	\N	\N	\N	\N	\N
5546	1824	4	\N	\N	\N	\N	\N	\N
5547	1825	4	\N	\N	\N	\N	\N	\N
5548	1834	4	\N	\N	\N	\N	\N	\N
5549	1832	4	\N	\N	\N	\N	\N	\N
5550	1833	4	\N	\N	\N	\N	\N	\N
5551	1835	4	\N	\N	\N	\N	\N	\N
5552	1839	4	\N	\N	\N	\N	\N	\N
5553	1836	4	\N	\N	\N	\N	\N	\N
5554	1837	4	\N	\N	\N	\N	\N	\N
5555	1838	4	\N	\N	\N	\N	\N	\N
5556	1840	4	\N	\N	\N	\N	\N	\N
5557	1841	4	\N	\N	\N	\N	\N	\N
5558	1845	4	\N	\N	\N	\N	\N	\N
5559	1842	4	\N	\N	\N	\N	\N	\N
5560	1843	4	\N	\N	\N	\N	\N	\N
5561	1846	4	\N	\N	\N	\N	\N	\N
5562	1850	4	\N	\N	\N	\N	\N	\N
5563	1849	4	\N	\N	\N	\N	\N	\N
5564	1848	4	\N	\N	\N	\N	\N	\N
5565	1847	4	\N	\N	\N	\N	\N	\N
5566	1851	4	\N	\N	\N	\N	\N	\N
5567	1852	4	\N	\N	\N	\N	\N	\N
5568	1861	4	\N	\N	\N	\N	\N	\N
5569	1853	4	\N	\N	\N	\N	\N	\N
5570	1856	4	\N	\N	\N	\N	\N	\N
5571	1857	4	\N	\N	\N	\N	\N	\N
5572	1863	4	\N	\N	\N	\N	\N	\N
5573	1864	4	\N	\N	\N	\N	\N	\N
5574	1865	4	\N	\N	\N	\N	\N	\N
5575	1866	4	\N	\N	\N	\N	\N	\N
5576	1869	4	\N	\N	\N	\N	\N	\N
5577	1871	4	\N	\N	\N	\N	\N	\N
5578	1872	4	\N	\N	\N	\N	\N	\N
5579	1873	4	\N	\N	\N	\N	\N	\N
5580	1876	4	\N	\N	\N	\N	\N	\N
5581	1877	4	\N	\N	\N	\N	\N	\N
5582	1881	4	\N	\N	\N	\N	\N	\N
5583	1883	4	\N	\N	\N	\N	\N	\N
5584	1878	4	\N	\N	\N	\N	\N	\N
5585	1882	4	\N	\N	\N	\N	\N	\N
5586	1884	4	\N	\N	\N	\N	\N	\N
5587	1889	4	\N	\N	\N	\N	\N	\N
5588	1885	4	\N	\N	\N	\N	\N	\N
5589	1887	4	\N	\N	\N	\N	\N	\N
5590	1888	4	\N	\N	\N	\N	\N	\N
5591	1886	4	\N	\N	\N	\N	\N	\N
5592	1898	4	\N	\N	\N	\N	\N	\N
5593	1890	4	\N	\N	\N	\N	\N	\N
5594	1894	4	\N	\N	\N	\N	\N	\N
5595	1897	4	\N	\N	\N	\N	\N	\N
5596	1896	4	\N	\N	\N	\N	\N	\N
5597	1899	4	\N	\N	\N	\N	\N	\N
5598	1904	4	\N	\N	\N	\N	\N	\N
5599	1903	4	\N	\N	\N	\N	\N	\N
5600	1902	4	\N	\N	\N	\N	\N	\N
5601	1900	4	\N	\N	\N	\N	\N	\N
5602	1905	4	\N	\N	\N	\N	\N	\N
5603	1913	4	\N	\N	\N	\N	\N	\N
5604	1910	4	\N	\N	\N	\N	\N	\N
5605	1912	4	\N	\N	\N	\N	\N	\N
5606	1907	4	\N	\N	\N	\N	\N	\N
5607	1908	4	\N	\N	\N	\N	\N	\N
5608	1915	4	\N	\N	\N	\N	\N	\N
5609	1920	4	\N	\N	\N	\N	\N	\N
5610	1917	4	\N	\N	\N	\N	\N	\N
5611	1918	4	\N	\N	\N	\N	\N	\N
5612	1916	4	\N	\N	\N	\N	\N	\N
5613	1921	4	\N	\N	\N	\N	\N	\N
5614	1927	4	\N	\N	\N	\N	\N	\N
5615	1926	4	\N	\N	\N	\N	\N	\N
5616	1923	4	\N	\N	\N	\N	\N	\N
5617	1922	4	\N	\N	\N	\N	\N	\N
5618	1925	4	\N	\N	\N	\N	\N	\N
5619	1930	4	\N	\N	\N	\N	\N	\N
5620	1935	4	\N	\N	\N	\N	\N	\N
5621	1931	4	\N	\N	\N	\N	\N	\N
5622	1934	4	\N	\N	\N	\N	\N	\N
5623	1933	4	\N	\N	\N	\N	\N	\N
5624	1937	4	\N	\N	\N	\N	\N	\N
5625	1938	4	\N	\N	\N	\N	\N	\N
5626	1943	4	\N	\N	\N	\N	\N	\N
5627	1945	4	\N	\N	\N	\N	\N	\N
5628	1942	4	\N	\N	\N	\N	\N	\N
5629	1946	4	\N	\N	\N	\N	\N	\N
5630	1947	4	\N	\N	\N	\N	\N	\N
5631	1948	4	\N	\N	\N	\N	\N	\N
5632	1949	4	\N	\N	\N	\N	\N	\N
5633	1950	4	\N	\N	\N	\N	\N	\N
5634	1951	4	\N	\N	\N	\N	\N	\N
5635	1952	4	\N	\N	\N	\N	\N	\N
5636	1954	4	\N	\N	\N	\N	\N	\N
5637	1955	4	\N	\N	\N	\N	\N	\N
5638	1956	4	\N	\N	\N	\N	\N	\N
5639	1958	4	\N	\N	\N	\N	\N	\N
5640	1964	4	\N	\N	\N	\N	\N	\N
5641	1962	4	\N	\N	\N	\N	\N	\N
5642	1963	4	\N	\N	\N	\N	\N	\N
5643	1961	4	\N	\N	\N	\N	\N	\N
5644	1959	4	\N	\N	\N	\N	\N	\N
5645	1965	4	\N	\N	\N	\N	\N	\N
5646	1969	4	\N	\N	\N	\N	\N	\N
5647	1968	4	\N	\N	\N	\N	\N	\N
5648	1967	4	\N	\N	\N	\N	\N	\N
5649	1966	4	\N	\N	\N	\N	\N	\N
5650	1970	4	\N	\N	\N	\N	\N	\N
5651	1976	4	\N	\N	\N	\N	\N	\N
5652	1974	4	\N	\N	\N	\N	\N	\N
5653	1971	4	\N	\N	\N	\N	\N	\N
5654	1975	4	\N	\N	\N	\N	\N	\N
5655	1973	4	\N	\N	\N	\N	\N	\N
5656	1979	4	\N	\N	\N	\N	\N	\N
5657	1983	4	\N	\N	\N	\N	\N	\N
5658	1982	4	\N	\N	\N	\N	\N	\N
5659	1981	4	\N	\N	\N	\N	\N	\N
5660	1980	4	\N	\N	\N	\N	\N	\N
5661	1984	4	\N	\N	\N	\N	\N	\N
5662	1989	4	\N	\N	\N	\N	\N	\N
5663	1985	4	\N	\N	\N	\N	\N	\N
5664	1988	4	\N	\N	\N	\N	\N	\N
5665	1986	4	\N	\N	\N	\N	\N	\N
5666	1987	4	\N	\N	\N	\N	\N	\N
5667	1990	4	\N	\N	\N	\N	\N	\N
5668	1995	4	\N	\N	\N	\N	\N	\N
5669	1994	4	\N	\N	\N	\N	\N	\N
5670	1991	4	\N	\N	\N	\N	\N	\N
5671	1993	4	\N	\N	\N	\N	\N	\N
5672	1996	4	\N	\N	\N	\N	\N	\N
5673	2002	4	\N	\N	\N	\N	\N	\N
5674	2000	4	\N	\N	\N	\N	\N	\N
5675	1999	4	\N	\N	\N	\N	\N	\N
5676	1998	4	\N	\N	\N	\N	\N	\N
5677	2001	4	\N	\N	\N	\N	\N	\N
5678	2004	4	\N	\N	\N	\N	\N	\N
5679	2008	4	\N	\N	\N	\N	\N	\N
5680	2005	4	\N	\N	\N	\N	\N	\N
5681	2007	4	\N	\N	\N	\N	\N	\N
5682	2006	4	\N	\N	\N	\N	\N	\N
5683	2009	4	\N	\N	\N	\N	\N	\N
5684	2015	4	\N	\N	\N	\N	\N	\N
5685	2010	4	\N	\N	\N	\N	\N	\N
5686	2012	4	\N	\N	\N	\N	\N	\N
5687	2013	4	\N	\N	\N	\N	\N	\N
5688	2011	4	\N	\N	\N	\N	\N	\N
5689	2017	4	\N	\N	\N	\N	\N	\N
5690	2022	4	\N	\N	\N	\N	\N	\N
5691	2018	4	\N	\N	\N	\N	\N	\N
5692	2019	4	\N	\N	\N	\N	\N	\N
5693	2021	4	\N	\N	\N	\N	\N	\N
5694	2024	4	\N	\N	\N	\N	\N	\N
5695	2030	4	\N	\N	\N	\N	\N	\N
5696	2026	4	\N	\N	\N	\N	\N	\N
5697	2025	4	\N	\N	\N	\N	\N	\N
5698	2029	4	\N	\N	\N	\N	\N	\N
5699	2027	4	\N	\N	\N	\N	\N	\N
5700	2031	4	\N	\N	\N	\N	\N	\N
5701	2036	4	\N	\N	\N	\N	\N	\N
5702	2032	4	\N	\N	\N	\N	\N	\N
5703	2033	4	\N	\N	\N	\N	\N	\N
5704	2034	4	\N	\N	\N	\N	\N	\N
5705	2037	4	\N	\N	\N	\N	\N	\N
5706	2042	4	\N	\N	\N	\N	\N	\N
5707	2039	4	\N	\N	\N	\N	\N	\N
5708	2040	4	\N	\N	\N	\N	\N	\N
5709	2038	4	\N	\N	\N	\N	\N	\N
5710	2041	4	\N	\N	\N	\N	\N	\N
5711	2043	4	\N	\N	\N	\N	\N	\N
5712	2047	4	\N	\N	\N	\N	\N	\N
5713	2044	4	\N	\N	\N	\N	\N	\N
5714	2046	4	\N	\N	\N	\N	\N	\N
5715	2045	4	\N	\N	\N	\N	\N	\N
5716	2048	4	\N	\N	\N	\N	\N	\N
5717	2054	4	\N	\N	\N	\N	\N	\N
5718	2051	4	\N	\N	\N	\N	\N	\N
5719	2049	4	\N	\N	\N	\N	\N	\N
5720	2050	4	\N	\N	\N	\N	\N	\N
5721	2053	4	\N	\N	\N	\N	\N	\N
5722	2055	4	\N	\N	\N	\N	\N	\N
5723	2059	4	\N	\N	\N	\N	\N	\N
5724	2056	4	\N	\N	\N	\N	\N	\N
5725	2057	4	\N	\N	\N	\N	\N	\N
5726	2058	4	\N	\N	\N	\N	\N	\N
5727	2060	4	\N	\N	\N	\N	\N	\N
5728	2065	4	\N	\N	\N	\N	\N	\N
5729	2061	4	\N	\N	\N	\N	\N	\N
5730	2062	4	\N	\N	\N	\N	\N	\N
5731	2063	4	\N	\N	\N	\N	\N	\N
5732	2064	4	\N	\N	\N	\N	\N	\N
5733	2066	4	\N	\N	\N	\N	\N	\N
5734	2071	4	\N	\N	\N	\N	\N	\N
5735	2069	4	\N	\N	\N	\N	\N	\N
5736	2067	4	\N	\N	\N	\N	\N	\N
5737	2070	4	\N	\N	\N	\N	\N	\N
5738	2072	4	\N	\N	\N	\N	\N	\N
5739	2079	4	\N	\N	\N	\N	\N	\N
5740	2076	4	\N	\N	\N	\N	\N	\N
5741	2077	4	\N	\N	\N	\N	\N	\N
5742	2074	4	\N	\N	\N	\N	\N	\N
5743	2078	4	\N	\N	\N	\N	\N	\N
5744	2080	4	\N	\N	\N	\N	\N	\N
5745	2082	4	\N	\N	\N	\N	\N	\N
5746	2081	4	\N	\N	\N	\N	\N	\N
5747	2083	4	\N	\N	\N	\N	\N	\N
5748	2087	4	\N	\N	\N	\N	\N	\N
5749	2089	4	\N	\N	\N	\N	\N	\N
5750	2090	4	\N	\N	\N	\N	\N	\N
5751	2091	4	\N	\N	\N	\N	\N	\N
5752	2088	4	\N	\N	\N	\N	\N	\N
5753	2092	4	\N	\N	\N	\N	\N	\N
5754	2093	4	\N	\N	\N	\N	\N	\N
5755	2094	4	\N	\N	\N	\N	\N	\N
5756	2096	4	\N	\N	\N	\N	\N	\N
5757	2095	4	\N	\N	\N	\N	\N	\N
5758	2098	4	\N	\N	\N	\N	\N	\N
5759	2101	4	\N	\N	\N	\N	\N	\N
5760	2099	4	\N	\N	\N	\N	\N	\N
5761	2103	4	\N	\N	\N	\N	\N	\N
5762	2100	4	\N	\N	\N	\N	\N	\N
5763	2106	4	\N	\N	\N	\N	\N	\N
5764	2104	4	\N	\N	\N	\N	\N	\N
5765	2105	4	\N	\N	\N	\N	\N	\N
5766	2109	4	\N	\N	\N	\N	\N	\N
5767	2110	4	\N	\N	\N	\N	\N	\N
5768	2107	4	\N	\N	\N	\N	\N	\N
5769	2112	4	\N	\N	\N	\N	\N	\N
5770	2114	4	\N	\N	\N	\N	\N	\N
5771	2115	4	\N	\N	\N	\N	\N	\N
5772	2118	4	\N	\N	\N	\N	\N	\N
5773	2119	4	\N	\N	\N	\N	\N	\N
5774	2120	4	\N	\N	\N	\N	\N	\N
5775	2117	4	\N	\N	\N	\N	\N	\N
5776	2122	4	\N	\N	\N	\N	\N	\N
5777	2123	4	\N	\N	\N	\N	\N	\N
5778	2124	4	\N	\N	\N	\N	\N	\N
5779	2125	4	\N	\N	\N	\N	\N	\N
5780	2126	4	\N	\N	\N	\N	\N	\N
5781	2127	4	\N	\N	\N	\N	\N	\N
5782	2129	4	\N	\N	\N	\N	\N	\N
5783	2130	4	\N	\N	\N	\N	\N	\N
5784	2132	4	\N	\N	\N	\N	\N	\N
5785	2134	4	\N	\N	\N	\N	\N	\N
5786	2135	4	\N	\N	\N	\N	\N	\N
5787	2136	4	\N	\N	\N	\N	\N	\N
5788	2137	4	\N	\N	\N	\N	\N	\N
5789	2138	4	\N	\N	\N	\N	\N	\N
5790	2139	4	\N	\N	\N	\N	\N	\N
5791	2140	4	\N	\N	\N	\N	\N	\N
5792	2142	4	\N	\N	\N	\N	\N	\N
5793	2143	4	\N	\N	\N	\N	\N	\N
5794	2144	4	\N	\N	\N	\N	\N	\N
5795	2146	4	\N	\N	\N	\N	\N	\N
5796	2147	4	\N	\N	\N	\N	\N	\N
5797	2148	4	\N	\N	\N	\N	\N	\N
5798	2149	4	\N	\N	\N	\N	\N	\N
5799	2150	4	\N	\N	\N	\N	\N	\N
5800	2151	4	\N	\N	\N	\N	\N	\N
5801	2152	4	\N	\N	\N	\N	\N	\N
5802	2153	4	\N	\N	\N	\N	\N	\N
5803	2157	4	\N	\N	\N	\N	\N	\N
5804	2158	4	\N	\N	\N	\N	\N	\N
5805	2159	4	\N	\N	\N	\N	\N	\N
5806	2160	4	\N	\N	\N	\N	\N	\N
5807	2161	4	\N	\N	\N	\N	\N	\N
5808	2162	4	\N	\N	\N	\N	\N	\N
5809	2167	4	\N	\N	\N	\N	\N	\N
5810	2170	4	\N	\N	\N	\N	\N	\N
5811	2171	4	\N	\N	\N	\N	\N	\N
5812	2165	4	\N	\N	\N	\N	\N	\N
5813	2163	4	\N	\N	\N	\N	\N	\N
5814	2166	4	\N	\N	\N	\N	\N	\N
5815	2172	4	\N	\N	\N	\N	\N	\N
5816	2173	4	\N	\N	\N	\N	\N	\N
5817	2168	4	\N	\N	\N	\N	\N	\N
5818	2175	4	\N	\N	\N	\N	\N	\N
5819	2179	4	\N	\N	\N	\N	\N	\N
5820	2180	4	\N	\N	\N	\N	\N	\N
5821	2174	4	\N	\N	\N	\N	\N	\N
5822	2176	4	\N	\N	\N	\N	\N	\N
5823	2177	4	\N	\N	\N	\N	\N	\N
5824	2178	4	\N	\N	\N	\N	\N	\N
5825	2181	4	\N	\N	\N	\N	\N	\N
5826	2182	4	\N	\N	\N	\N	\N	\N
5827	2183	4	\N	\N	\N	\N	\N	\N
5828	2184	4	\N	\N	\N	\N	\N	\N
5829	2192	4	\N	\N	\N	\N	\N	\N
5830	2189	4	\N	\N	\N	\N	\N	\N
5831	2190	4	\N	\N	\N	\N	\N	\N
5832	2185	4	\N	\N	\N	\N	\N	\N
5833	2187	4	\N	\N	\N	\N	\N	\N
5834	2191	4	\N	\N	\N	\N	\N	\N
5835	2193	4	\N	\N	\N	\N	\N	\N
5836	2196	4	\N	\N	\N	\N	\N	\N
5837	2198	4	\N	\N	\N	\N	\N	\N
5838	2194	4	\N	\N	\N	\N	\N	\N
5839	2199	4	\N	\N	\N	\N	\N	\N
5840	2201	4	\N	\N	\N	\N	\N	\N
5841	2202	4	\N	\N	\N	\N	\N	\N
5842	2200	4	\N	\N	\N	\N	\N	\N
5843	2205	4	\N	\N	\N	\N	\N	\N
5844	2204	4	\N	\N	\N	\N	\N	\N
5845	2207	4	\N	\N	\N	\N	\N	\N
5846	2212	4	\N	\N	\N	\N	\N	\N
5847	2209	4	\N	\N	\N	\N	\N	\N
5848	2208	4	\N	\N	\N	\N	\N	\N
5849	2211	4	\N	\N	\N	\N	\N	\N
5850	2213	4	\N	\N	\N	\N	\N	\N
5851	2219	4	\N	\N	\N	\N	\N	\N
5852	2217	4	\N	\N	\N	\N	\N	\N
5853	2214	4	\N	\N	\N	\N	\N	\N
5854	2215	4	\N	\N	\N	\N	\N	\N
5855	2218	4	\N	\N	\N	\N	\N	\N
5856	2221	4	\N	\N	\N	\N	\N	\N
5857	2225	4	\N	\N	\N	\N	\N	\N
5858	2223	4	\N	\N	\N	\N	\N	\N
5859	2222	4	\N	\N	\N	\N	\N	\N
5860	2224	4	\N	\N	\N	\N	\N	\N
5861	2228	4	\N	\N	\N	\N	\N	\N
5862	2235	4	\N	\N	\N	\N	\N	\N
5863	2229	4	\N	\N	\N	\N	\N	\N
5864	2230	4	\N	\N	\N	\N	\N	\N
5865	2231	4	\N	\N	\N	\N	\N	\N
5866	2232	4	\N	\N	\N	\N	\N	\N
5867	2236	4	\N	\N	\N	\N	\N	\N
5868	2241	4	\N	\N	\N	\N	\N	\N
5869	2239	4	\N	\N	\N	\N	\N	\N
5870	2240	4	\N	\N	\N	\N	\N	\N
5871	2237	4	\N	\N	\N	\N	\N	\N
5872	2242	4	\N	\N	\N	\N	\N	\N
5873	2247	4	\N	\N	\N	\N	\N	\N
5874	2245	4	\N	\N	\N	\N	\N	\N
5875	2243	4	\N	\N	\N	\N	\N	\N
5876	2244	4	\N	\N	\N	\N	\N	\N
5877	2246	4	\N	\N	\N	\N	\N	\N
5878	2248	4	\N	\N	\N	\N	\N	\N
5879	2253	4	\N	\N	\N	\N	\N	\N
5880	2251	4	\N	\N	\N	\N	\N	\N
5881	2249	4	\N	\N	\N	\N	\N	\N
5882	2250	4	\N	\N	\N	\N	\N	\N
5883	2255	4	\N	\N	\N	\N	\N	\N
5884	2260	4	\N	\N	\N	\N	\N	\N
5885	2257	4	\N	\N	\N	\N	\N	\N
5886	2256	4	\N	\N	\N	\N	\N	\N
5887	2258	4	\N	\N	\N	\N	\N	\N
5888	2259	4	\N	\N	\N	\N	\N	\N
5889	2261	4	\N	\N	\N	\N	\N	\N
5890	2265	4	\N	\N	\N	\N	\N	\N
5891	2263	4	\N	\N	\N	\N	\N	\N
5892	2264	4	\N	\N	\N	\N	\N	\N
5893	2262	4	\N	\N	\N	\N	\N	\N
5894	2266	4	\N	\N	\N	\N	\N	\N
5895	2271	4	\N	\N	\N	\N	\N	\N
5896	2268	4	\N	\N	\N	\N	\N	\N
5897	2269	4	\N	\N	\N	\N	\N	\N
5898	2270	4	\N	\N	\N	\N	\N	\N
5899	2267	4	\N	\N	\N	\N	\N	\N
5900	2272	4	\N	\N	\N	\N	\N	\N
5901	2276	4	\N	\N	\N	\N	\N	\N
5902	2273	4	\N	\N	\N	\N	\N	\N
5903	2274	4	\N	\N	\N	\N	\N	\N
5904	2275	4	\N	\N	\N	\N	\N	\N
5905	2277	4	\N	\N	\N	\N	\N	\N
5906	2282	4	\N	\N	\N	\N	\N	\N
5907	2278	4	\N	\N	\N	\N	\N	\N
5908	2281	4	\N	\N	\N	\N	\N	\N
5909	2279	4	\N	\N	\N	\N	\N	\N
5910	2280	4	\N	\N	\N	\N	\N	\N
5911	2283	4	\N	\N	\N	\N	\N	\N
5912	2286	4	\N	\N	\N	\N	\N	\N
5913	2287	4	\N	\N	\N	\N	\N	\N
5914	2284	4	\N	\N	\N	\N	\N	\N
5915	2285	4	\N	\N	\N	\N	\N	\N
5916	2288	4	\N	\N	\N	\N	\N	\N
5917	2295	4	\N	\N	\N	\N	\N	\N
5918	2289	4	\N	\N	\N	\N	\N	\N
5919	2291	4	\N	\N	\N	\N	\N	\N
5920	2290	4	\N	\N	\N	\N	\N	\N
5921	2293	4	\N	\N	\N	\N	\N	\N
5922	2300	4	\N	\N	\N	\N	\N	\N
5923	2297	4	\N	\N	\N	\N	\N	\N
5924	2298	4	\N	\N	\N	\N	\N	\N
5925	2299	4	\N	\N	\N	\N	\N	\N
5926	2296	4	\N	\N	\N	\N	\N	\N
5927	2304	4	\N	\N	\N	\N	\N	\N
5928	2306	4	\N	\N	\N	\N	\N	\N
5929	2305	4	\N	\N	\N	\N	\N	\N
5930	2303	4	\N	\N	\N	\N	\N	\N
5931	2308	4	\N	\N	\N	\N	\N	\N
5932	2307	4	\N	\N	\N	\N	\N	\N
5933	2312	4	\N	\N	\N	\N	\N	\N
5934	2310	4	\N	\N	\N	\N	\N	\N
5935	2311	4	\N	\N	\N	\N	\N	\N
5936	2309	4	\N	\N	\N	\N	\N	\N
5937	2313	4	\N	\N	\N	\N	\N	\N
5938	2317	4	\N	\N	\N	\N	\N	\N
5939	2318	4	\N	\N	\N	\N	\N	\N
5940	2315	4	\N	\N	\N	\N	\N	\N
5941	2316	4	\N	\N	\N	\N	\N	\N
5942	2314	4	\N	\N	\N	\N	\N	\N
5943	2320	4	\N	\N	\N	\N	\N	\N
5944	2325	4	\N	\N	\N	\N	\N	\N
5945	2324	4	\N	\N	\N	\N	\N	\N
5946	2321	4	\N	\N	\N	\N	\N	\N
5947	2323	4	\N	\N	\N	\N	\N	\N
5948	2326	4	\N	\N	\N	\N	\N	\N
5949	2327	4	\N	\N	\N	\N	\N	\N
5950	2332	4	\N	\N	\N	\N	\N	\N
5951	2329	4	\N	\N	\N	\N	\N	\N
5952	2330	4	\N	\N	\N	\N	\N	\N
5953	2333	4	\N	\N	\N	\N	\N	\N
5954	2334	4	\N	\N	\N	\N	\N	\N
5955	2335	4	\N	\N	\N	\N	\N	\N
5956	2337	4	\N	\N	\N	\N	\N	\N
5957	2338	4	\N	\N	\N	\N	\N	\N
5958	2336	4	\N	\N	\N	\N	\N	\N
5959	2331	4	\N	\N	\N	\N	\N	\N
5960	2340	4	\N	\N	\N	\N	\N	\N
5961	2343	4	\N	\N	\N	\N	\N	\N
5962	2344	4	\N	\N	\N	\N	\N	\N
5963	2341	4	\N	\N	\N	\N	\N	\N
5964	2342	4	\N	\N	\N	\N	\N	\N
5965	2345	4	\N	\N	\N	\N	\N	\N
5966	2350	4	\N	\N	\N	\N	\N	\N
5967	2346	4	\N	\N	\N	\N	\N	\N
5968	2347	4	\N	\N	\N	\N	\N	\N
5969	2349	4	\N	\N	\N	\N	\N	\N
5970	2348	4	\N	\N	\N	\N	\N	\N
5971	2351	4	\N	\N	\N	\N	\N	\N
5972	2355	4	\N	\N	\N	\N	\N	\N
5973	2353	4	\N	\N	\N	\N	\N	\N
5974	2352	4	\N	\N	\N	\N	\N	\N
5975	2354	4	\N	\N	\N	\N	\N	\N
5976	2356	4	\N	\N	\N	\N	\N	\N
5977	2361	4	\N	\N	\N	\N	\N	\N
5978	2357	4	\N	\N	\N	\N	\N	\N
5979	2359	4	\N	\N	\N	\N	\N	\N
5980	2358	4	\N	\N	\N	\N	\N	\N
5981	2360	4	\N	\N	\N	\N	\N	\N
5982	2362	4	\N	\N	\N	\N	\N	\N
5983	2367	4	\N	\N	\N	\N	\N	\N
5984	2363	4	\N	\N	\N	\N	\N	\N
5985	2364	4	\N	\N	\N	\N	\N	\N
5986	2366	4	\N	\N	\N	\N	\N	\N
5987	2368	4	\N	\N	\N	\N	\N	\N
5988	2373	4	\N	\N	\N	\N	\N	\N
5989	2372	4	\N	\N	\N	\N	\N	\N
5990	2371	4	\N	\N	\N	\N	\N	\N
5991	2370	4	\N	\N	\N	\N	\N	\N
5992	2369	4	\N	\N	\N	\N	\N	\N
5993	2375	4	\N	\N	\N	\N	\N	\N
5994	2378	4	\N	\N	\N	\N	\N	\N
5995	2376	4	\N	\N	\N	\N	\N	\N
5996	2377	4	\N	\N	\N	\N	\N	\N
5997	2374	4	\N	\N	\N	\N	\N	\N
5998	2381	4	\N	\N	\N	\N	\N	\N
5999	2384	4	\N	\N	\N	\N	\N	\N
6000	2383	4	\N	\N	\N	\N	\N	\N
6001	2379	4	\N	\N	\N	\N	\N	\N
6002	2382	4	\N	\N	\N	\N	\N	\N
6003	2380	4	\N	\N	\N	\N	\N	\N
6004	2385	4	\N	\N	\N	\N	\N	\N
6005	2390	4	\N	\N	\N	\N	\N	\N
6006	2386	4	\N	\N	\N	\N	\N	\N
6007	2387	4	\N	\N	\N	\N	\N	\N
6008	2389	4	\N	\N	\N	\N	\N	\N
6009	2391	4	\N	\N	\N	\N	\N	\N
6010	2397	4	\N	\N	\N	\N	\N	\N
6011	2394	4	\N	\N	\N	\N	\N	\N
6012	2395	4	\N	\N	\N	\N	\N	\N
6013	2392	4	\N	\N	\N	\N	\N	\N
6014	2396	4	\N	\N	\N	\N	\N	\N
6015	2398	4	\N	\N	\N	\N	\N	\N
6016	2403	4	\N	\N	\N	\N	\N	\N
6017	2399	4	\N	\N	\N	\N	\N	\N
6018	2400	4	\N	\N	\N	\N	\N	\N
6019	2402	4	\N	\N	\N	\N	\N	\N
6020	2404	4	\N	\N	\N	\N	\N	\N
6021	2409	4	\N	\N	\N	\N	\N	\N
6022	2405	4	\N	\N	\N	\N	\N	\N
6023	2406	4	\N	\N	\N	\N	\N	\N
6024	2407	4	\N	\N	\N	\N	\N	\N
6025	2408	4	\N	\N	\N	\N	\N	\N
6026	2410	4	\N	\N	\N	\N	\N	\N
6027	2414	4	\N	\N	\N	\N	\N	\N
6028	2411	4	\N	\N	\N	\N	\N	\N
6029	2412	4	\N	\N	\N	\N	\N	\N
6030	2413	4	\N	\N	\N	\N	\N	\N
6031	2415	4	\N	\N	\N	\N	\N	\N
6032	2421	4	\N	\N	\N	\N	\N	\N
6033	2416	4	\N	\N	\N	\N	\N	\N
6034	2418	4	\N	\N	\N	\N	\N	\N
6035	2420	4	\N	\N	\N	\N	\N	\N
6036	2419	4	\N	\N	\N	\N	\N	\N
6037	2422	4	\N	\N	\N	\N	\N	\N
6038	2426	4	\N	\N	\N	\N	\N	\N
6039	2424	4	\N	\N	\N	\N	\N	\N
6040	2423	4	\N	\N	\N	\N	\N	\N
6041	2425	4	\N	\N	\N	\N	\N	\N
6042	2427	4	\N	\N	\N	\N	\N	\N
6043	2428	4	\N	\N	\N	\N	\N	\N
6044	2429	4	\N	\N	\N	\N	\N	\N
6045	2433	4	\N	\N	\N	\N	\N	\N
6046	2430	4	\N	\N	\N	\N	\N	\N
6047	2432	4	\N	\N	\N	\N	\N	\N
6048	2434	4	\N	\N	\N	\N	\N	\N
6049	2436	4	\N	\N	\N	\N	\N	\N
6050	2438	4	\N	\N	\N	\N	\N	\N
6051	2435	4	\N	\N	\N	\N	\N	\N
6052	2437	4	\N	\N	\N	\N	\N	\N
6053	2441	4	\N	\N	\N	\N	\N	\N
6054	2439	4	\N	\N	\N	\N	\N	\N
6055	2440	4	\N	\N	\N	\N	\N	\N
6056	2445	4	\N	\N	\N	\N	\N	\N
6057	2443	4	\N	\N	\N	\N	\N	\N
6058	2444	4	\N	\N	\N	\N	\N	\N
6059	2447	4	\N	\N	\N	\N	\N	\N
6060	2448	4	\N	\N	\N	\N	\N	\N
6061	2450	4	\N	\N	\N	\N	\N	\N
6062	2446	4	\N	\N	\N	\N	\N	\N
6063	2452	4	\N	\N	\N	\N	\N	\N
6064	2453	4	\N	\N	\N	\N	\N	\N
6065	2454	4	\N	\N	\N	\N	\N	\N
6066	2455	4	\N	\N	\N	\N	\N	\N
6067	2456	4	\N	\N	\N	\N	\N	\N
6068	2457	4	\N	\N	\N	\N	\N	\N
6069	2458	4	\N	\N	\N	\N	\N	\N
6070	2459	4	\N	\N	\N	\N	\N	\N
6071	2460	4	\N	\N	\N	\N	\N	\N
6072	2461	4	\N	\N	\N	\N	\N	\N
6073	2462	4	\N	\N	\N	\N	\N	\N
6074	2464	4	\N	\N	\N	\N	\N	\N
6075	2465	4	\N	\N	\N	\N	\N	\N
6076	2466	4	\N	\N	\N	\N	\N	\N
6077	2467	4	\N	\N	\N	\N	\N	\N
6078	2468	4	\N	\N	\N	\N	\N	\N
6079	2469	4	\N	\N	\N	\N	\N	\N
6080	2473	4	\N	\N	\N	\N	\N	\N
6081	2470	4	\N	\N	\N	\N	\N	\N
6082	2472	4	\N	\N	\N	\N	\N	\N
6083	2471	4	\N	\N	\N	\N	\N	\N
6084	2476	4	\N	\N	\N	\N	\N	\N
6085	2474	4	\N	\N	\N	\N	\N	\N
6086	2475	4	\N	\N	\N	\N	\N	\N
6087	2479	4	\N	\N	\N	\N	\N	\N
6088	2477	4	\N	\N	\N	\N	\N	\N
6089	2478	4	\N	\N	\N	\N	\N	\N
6090	2480	4	\N	\N	\N	\N	\N	\N
6091	2481	4	\N	\N	\N	\N	\N	\N
6092	2482	4	\N	\N	\N	\N	\N	\N
6093	2483	4	\N	\N	\N	\N	\N	\N
6094	2484	4	\N	\N	\N	\N	\N	\N
6095	2485	4	\N	\N	\N	\N	\N	\N
6096	2486	4	\N	\N	\N	\N	\N	\N
6097	2487	4	\N	\N	\N	\N	\N	\N
6098	2488	4	\N	\N	\N	\N	\N	\N
6099	2489	4	\N	\N	\N	\N	\N	\N
6100	2490	4	\N	\N	\N	\N	\N	\N
6101	2491	4	\N	\N	\N	\N	\N	\N
6102	2492	4	\N	\N	\N	\N	\N	\N
6103	2495	4	\N	\N	\N	\N	\N	\N
6104	2496	4	\N	\N	\N	\N	\N	\N
6105	2493	4	\N	\N	\N	\N	\N	\N
6106	2498	4	\N	\N	\N	\N	\N	\N
6107	2499	4	\N	\N	\N	\N	\N	\N
6108	2500	4	\N	\N	\N	\N	\N	\N
6109	2497	4	\N	\N	\N	\N	\N	\N
6110	2501	4	\N	\N	\N	\N	\N	\N
6111	2502	4	\N	\N	\N	\N	\N	\N
6112	2503	4	\N	\N	\N	\N	\N	\N
6113	2504	4	\N	\N	\N	\N	\N	\N
6114	2505	4	\N	\N	\N	\N	\N	\N
6115	2506	4	\N	\N	\N	\N	\N	\N
6116	2507	4	\N	\N	\N	\N	\N	\N
6117	2508	4	\N	\N	\N	\N	\N	\N
6118	2509	4	\N	\N	\N	\N	\N	\N
6119	2510	4	\N	\N	\N	\N	\N	\N
6120	2511	4	\N	\N	\N	\N	\N	\N
6121	2512	4	\N	\N	\N	\N	\N	\N
6122	2513	4	\N	\N	\N	\N	\N	\N
6123	2514	4	\N	\N	\N	\N	\N	\N
6124	2515	4	\N	\N	\N	\N	\N	\N
6125	2516	4	\N	\N	\N	\N	\N	\N
6126	2517	4	\N	\N	\N	\N	\N	\N
6127	2518	4	\N	\N	\N	\N	\N	\N
6128	2519	4	\N	\N	\N	\N	\N	\N
6129	2520	4	\N	\N	\N	\N	\N	\N
6130	2521	4	\N	\N	\N	\N	\N	\N
6131	2522	4	\N	\N	\N	\N	\N	\N
6132	2523	4	\N	\N	\N	\N	\N	\N
6133	2524	4	\N	\N	\N	\N	\N	\N
6134	2525	4	\N	\N	\N	\N	\N	\N
6135	2526	4	\N	\N	\N	\N	\N	\N
6136	2527	4	\N	\N	\N	\N	\N	\N
6137	2528	4	\N	\N	\N	\N	\N	\N
6138	2529	4	\N	\N	\N	\N	\N	\N
6139	2530	4	\N	\N	\N	\N	\N	\N
6140	2531	4	\N	\N	\N	\N	\N	\N
6141	2532	4	\N	\N	\N	\N	\N	\N
6142	2533	4	\N	\N	\N	\N	\N	\N
6143	2534	4	\N	\N	\N	\N	\N	\N
6144	2535	4	\N	\N	\N	\N	\N	\N
6145	2536	4	\N	\N	\N	\N	\N	\N
6146	2537	4	\N	\N	\N	\N	\N	\N
6147	2538	4	\N	\N	\N	\N	\N	\N
6148	2539	4	\N	\N	\N	\N	\N	\N
6149	2540	4	\N	\N	\N	\N	\N	\N
6150	2541	4	\N	\N	\N	\N	\N	\N
6151	2542	4	\N	\N	\N	\N	\N	\N
6152	2543	4	\N	\N	\N	\N	\N	\N
6153	2544	4	\N	\N	\N	\N	\N	\N
6154	2545	4	\N	\N	\N	\N	\N	\N
6155	2546	4	\N	\N	\N	\N	\N	\N
6156	2547	4	\N	\N	\N	\N	\N	\N
6157	2548	4	\N	\N	\N	\N	\N	\N
6158	2549	4	\N	\N	\N	\N	\N	\N
6159	2550	4	\N	\N	\N	\N	\N	\N
6160	2551	4	\N	\N	\N	\N	\N	\N
6161	2552	4	\N	\N	\N	\N	\N	\N
6162	2553	4	\N	\N	\N	\N	\N	\N
6163	2554	4	\N	\N	\N	\N	\N	\N
6164	2555	4	\N	\N	\N	\N	\N	\N
6165	2556	4	\N	\N	\N	\N	\N	\N
6166	2557	4	\N	\N	\N	\N	\N	\N
6167	2558	4	\N	\N	\N	\N	\N	\N
6168	2559	4	\N	\N	\N	\N	\N	\N
6169	2560	4	\N	\N	\N	\N	\N	\N
6170	2561	4	\N	\N	\N	\N	\N	\N
6171	2562	4	\N	\N	\N	\N	\N	\N
6172	2563	4	\N	\N	\N	\N	\N	\N
6173	2564	4	\N	\N	\N	\N	\N	\N
6174	2565	4	\N	\N	\N	\N	\N	\N
6175	2566	4	\N	\N	\N	\N	\N	\N
6176	2567	4	\N	\N	\N	\N	\N	\N
6177	2568	4	\N	\N	\N	\N	\N	\N
6178	2569	4	\N	\N	\N	\N	\N	\N
6179	2570	4	\N	\N	\N	\N	\N	\N
6180	2571	4	\N	\N	\N	\N	\N	\N
6181	2572	4	\N	\N	\N	\N	\N	\N
6182	2573	4	\N	\N	\N	\N	\N	\N
6183	2575	4	\N	\N	\N	\N	\N	\N
6184	2577	4	\N	\N	\N	\N	\N	\N
6185	2578	4	\N	\N	\N	\N	\N	\N
6186	2581	4	\N	\N	\N	\N	\N	\N
6187	2576	4	\N	\N	\N	\N	\N	\N
6188	2584	4	\N	\N	\N	\N	\N	\N
6189	2583	4	\N	\N	\N	\N	\N	\N
6190	2580	4	\N	\N	\N	\N	\N	\N
6191	2579	4	\N	\N	\N	\N	\N	\N
6192	2585	4	\N	\N	\N	\N	\N	\N
6193	2586	4	\N	\N	\N	\N	\N	\N
6194	2582	4	\N	\N	\N	\N	\N	\N
6195	2588	4	\N	\N	\N	\N	\N	\N
6196	2589	4	\N	\N	\N	\N	\N	\N
6197	2587	4	\N	\N	\N	\N	\N	\N
6198	2590	4	\N	\N	\N	\N	\N	\N
6199	2594	4	\N	\N	\N	\N	\N	\N
6200	2595	4	\N	\N	\N	\N	\N	\N
6201	2592	4	\N	\N	\N	\N	\N	\N
6202	2593	4	\N	\N	\N	\N	\N	\N
6203	2591	4	\N	\N	\N	\N	\N	\N
6204	2596	4	\N	\N	\N	\N	\N	\N
6205	2600	4	\N	\N	\N	\N	\N	\N
6206	2598	4	\N	\N	\N	\N	\N	\N
6207	2599	4	\N	\N	\N	\N	\N	\N
6208	2597	4	\N	\N	\N	\N	\N	\N
6209	2601	4	\N	\N	\N	\N	\N	\N
6210	2606	4	\N	\N	\N	\N	\N	\N
6211	2605	4	\N	\N	\N	\N	\N	\N
6212	2604	4	\N	\N	\N	\N	\N	\N
6213	2602	4	\N	\N	\N	\N	\N	\N
6214	2603	4	\N	\N	\N	\N	\N	\N
6215	2607	4	\N	\N	\N	\N	\N	\N
6216	2611	4	\N	\N	\N	\N	\N	\N
6217	2608	4	\N	\N	\N	\N	\N	\N
6218	2609	4	\N	\N	\N	\N	\N	\N
6219	2610	4	\N	\N	\N	\N	\N	\N
6220	2612	4	\N	\N	\N	\N	\N	\N
6221	2618	4	\N	\N	\N	\N	\N	\N
6222	2617	4	\N	\N	\N	\N	\N	\N
6223	2615	4	\N	\N	\N	\N	\N	\N
6224	2614	4	\N	\N	\N	\N	\N	\N
6225	2616	4	\N	\N	\N	\N	\N	\N
6226	2619	4	\N	\N	\N	\N	\N	\N
6227	2625	4	\N	\N	\N	\N	\N	\N
6228	2620	4	\N	\N	\N	\N	\N	\N
6229	2621	4	\N	\N	\N	\N	\N	\N
6230	2624	4	\N	\N	\N	\N	\N	\N
6231	2626	4	\N	\N	\N	\N	\N	\N
6232	2631	4	\N	\N	\N	\N	\N	\N
6233	2628	4	\N	\N	\N	\N	\N	\N
6234	2629	4	\N	\N	\N	\N	\N	\N
6235	2627	4	\N	\N	\N	\N	\N	\N
6236	2630	4	\N	\N	\N	\N	\N	\N
6237	2632	4	\N	\N	\N	\N	\N	\N
6238	2636	4	\N	\N	\N	\N	\N	\N
6239	2635	4	\N	\N	\N	\N	\N	\N
6240	2633	4	\N	\N	\N	\N	\N	\N
6241	2634	4	\N	\N	\N	\N	\N	\N
6242	2637	4	\N	\N	\N	\N	\N	\N
6243	2642	4	\N	\N	\N	\N	\N	\N
6244	2639	4	\N	\N	\N	\N	\N	\N
6245	2641	4	\N	\N	\N	\N	\N	\N
6246	2638	4	\N	\N	\N	\N	\N	\N
6247	2640	4	\N	\N	\N	\N	\N	\N
6248	2643	4	\N	\N	\N	\N	\N	\N
6249	2644	4	\N	\N	\N	\N	\N	\N
6250	2645	4	\N	\N	\N	\N	\N	\N
6251	2646	4	\N	\N	\N	\N	\N	\N
6252	2647	4	\N	\N	\N	\N	\N	\N
6253	2648	4	\N	\N	\N	\N	\N	\N
6254	2649	4	\N	\N	\N	\N	\N	\N
6255	2650	4	\N	\N	\N	\N	\N	\N
6256	2651	4	\N	\N	\N	\N	\N	\N
6257	2652	4	\N	\N	\N	\N	\N	\N
6258	2653	4	\N	\N	\N	\N	\N	\N
6259	2657	4	\N	\N	\N	\N	\N	\N
6260	2656	4	\N	\N	\N	\N	\N	\N
6261	2655	4	\N	\N	\N	\N	\N	\N
6262	2654	4	\N	\N	\N	\N	\N	\N
6263	2658	4	\N	\N	\N	\N	\N	\N
6264	2663	4	\N	\N	\N	\N	\N	\N
6265	2661	4	\N	\N	\N	\N	\N	\N
6266	2659	4	\N	\N	\N	\N	\N	\N
6267	2662	4	\N	\N	\N	\N	\N	\N
6268	2660	4	\N	\N	\N	\N	\N	\N
6269	2664	4	\N	\N	\N	\N	\N	\N
6270	2668	4	\N	\N	\N	\N	\N	\N
6271	2665	4	\N	\N	\N	\N	\N	\N
6272	2666	4	\N	\N	\N	\N	\N	\N
6273	2667	4	\N	\N	\N	\N	\N	\N
6274	2669	4	\N	\N	\N	\N	\N	\N
6275	2674	4	\N	\N	\N	\N	\N	\N
6276	2671	4	\N	\N	\N	\N	\N	\N
6277	2670	4	\N	\N	\N	\N	\N	\N
6278	2673	4	\N	\N	\N	\N	\N	\N
6279	2672	4	\N	\N	\N	\N	\N	\N
6280	2675	4	\N	\N	\N	\N	\N	\N
6281	2678	4	\N	\N	\N	\N	\N	\N
6282	2679	4	\N	\N	\N	\N	\N	\N
6283	2677	4	\N	\N	\N	\N	\N	\N
6284	2676	4	\N	\N	\N	\N	\N	\N
6285	2680	4	\N	\N	\N	\N	\N	\N
6286	2685	4	\N	\N	\N	\N	\N	\N
6287	2681	4	\N	\N	\N	\N	\N	\N
6288	2683	4	\N	\N	\N	\N	\N	\N
6289	2682	4	\N	\N	\N	\N	\N	\N
6290	2684	4	\N	\N	\N	\N	\N	\N
6291	2686	4	\N	\N	\N	\N	\N	\N
6292	2690	4	\N	\N	\N	\N	\N	\N
6293	2688	4	\N	\N	\N	\N	\N	\N
6294	2689	4	\N	\N	\N	\N	\N	\N
6295	2687	4	\N	\N	\N	\N	\N	\N
6296	2691	4	\N	\N	\N	\N	\N	\N
6297	2694	4	\N	\N	\N	\N	\N	\N
6298	2692	4	\N	\N	\N	\N	\N	\N
6299	2693	4	\N	\N	\N	\N	\N	\N
6300	2695	4	\N	\N	\N	\N	\N	\N
6301	2703	4	\N	\N	\N	\N	\N	\N
6302	2701	4	\N	\N	\N	\N	\N	\N
6303	2699	4	\N	\N	\N	\N	\N	\N
6304	2702	4	\N	\N	\N	\N	\N	\N
6305	2698	4	\N	\N	\N	\N	\N	\N
6306	2696	4	\N	\N	\N	\N	\N	\N
6307	2704	4	\N	\N	\N	\N	\N	\N
6308	2708	4	\N	\N	\N	\N	\N	\N
6309	2705	4	\N	\N	\N	\N	\N	\N
6310	2706	4	\N	\N	\N	\N	\N	\N
6311	2709	4	\N	\N	\N	\N	\N	\N
6312	2715	4	\N	\N	\N	\N	\N	\N
6313	2710	4	\N	\N	\N	\N	\N	\N
6314	2712	4	\N	\N	\N	\N	\N	\N
6315	2711	4	\N	\N	\N	\N	\N	\N
6316	2713	4	\N	\N	\N	\N	\N	\N
6317	2714	4	\N	\N	\N	\N	\N	\N
6318	2717	4	\N	\N	\N	\N	\N	\N
6319	2719	4	\N	\N	\N	\N	\N	\N
6320	2720	4	\N	\N	\N	\N	\N	\N
6321	2718	4	\N	\N	\N	\N	\N	\N
6322	2721	4	\N	\N	\N	\N	\N	\N
6323	2727	4	\N	\N	\N	\N	\N	\N
6324	2722	4	\N	\N	\N	\N	\N	\N
6325	2723	4	\N	\N	\N	\N	\N	\N
6326	2724	4	\N	\N	\N	\N	\N	\N
6327	2725	4	\N	\N	\N	\N	\N	\N
6328	2726	4	\N	\N	\N	\N	\N	\N
6329	2729	4	\N	\N	\N	\N	\N	\N
6330	2732	4	\N	\N	\N	\N	\N	\N
6331	2730	4	\N	\N	\N	\N	\N	\N
6332	2731	4	\N	\N	\N	\N	\N	\N
6333	2733	4	\N	\N	\N	\N	\N	\N
6334	2739	4	\N	\N	\N	\N	\N	\N
6335	2736	4	\N	\N	\N	\N	\N	\N
6336	2735	4	\N	\N	\N	\N	\N	\N
6337	2738	4	\N	\N	\N	\N	\N	\N
6338	2734	4	\N	\N	\N	\N	\N	\N
6339	2737	4	\N	\N	\N	\N	\N	\N
6340	2740	4	\N	\N	\N	\N	\N	\N
6341	2743	4	\N	\N	\N	\N	\N	\N
6342	2741	4	\N	\N	\N	\N	\N	\N
6343	2742	4	\N	\N	\N	\N	\N	\N
6344	2744	4	\N	\N	\N	\N	\N	\N
6345	2749	4	\N	\N	\N	\N	\N	\N
6346	2747	4	\N	\N	\N	\N	\N	\N
6347	2750	4	\N	\N	\N	\N	\N	\N
6348	2746	4	\N	\N	\N	\N	\N	\N
6349	2748	4	\N	\N	\N	\N	\N	\N
6350	2752	4	\N	\N	\N	\N	\N	\N
6351	2751	4	\N	\N	\N	\N	\N	\N
6352	2755	4	\N	\N	\N	\N	\N	\N
6353	2753	4	\N	\N	\N	\N	\N	\N
6354	2754	4	\N	\N	\N	\N	\N	\N
6355	2756	4	\N	\N	\N	\N	\N	\N
6356	2761	4	\N	\N	\N	\N	\N	\N
6357	2762	4	\N	\N	\N	\N	\N	\N
6358	2757	4	\N	\N	\N	\N	\N	\N
6359	2758	4	\N	\N	\N	\N	\N	\N
6360	2759	4	\N	\N	\N	\N	\N	\N
6361	2760	4	\N	\N	\N	\N	\N	\N
6362	2763	4	\N	\N	\N	\N	\N	\N
6363	2766	4	\N	\N	\N	\N	\N	\N
6364	2764	4	\N	\N	\N	\N	\N	\N
6365	2765	4	\N	\N	\N	\N	\N	\N
6366	2767	4	\N	\N	\N	\N	\N	\N
6367	2771	4	\N	\N	\N	\N	\N	\N
6368	2772	4	\N	\N	\N	\N	\N	\N
6369	2768	4	\N	\N	\N	\N	\N	\N
6370	2769	4	\N	\N	\N	\N	\N	\N
6371	2770	4	\N	\N	\N	\N	\N	\N
6372	2774	4	\N	\N	\N	\N	\N	\N
6373	2773	4	\N	\N	\N	\N	\N	\N
6374	2777	4	\N	\N	\N	\N	\N	\N
6375	2775	4	\N	\N	\N	\N	\N	\N
6376	2776	4	\N	\N	\N	\N	\N	\N
6377	2778	4	\N	\N	\N	\N	\N	\N
6378	2827	4	\N	\N	\N	\N	\N	\N
6379	2825	4	\N	\N	\N	\N	\N	\N
6380	2779	4	\N	\N	\N	\N	\N	\N
6381	2780	4	\N	\N	\N	\N	\N	\N
6382	2826	4	\N	\N	\N	\N	\N	\N
6383	2829	4	\N	\N	\N	\N	\N	\N
6384	2828	4	\N	\N	\N	\N	\N	\N
6385	2833	4	\N	\N	\N	\N	\N	\N
6386	2831	4	\N	\N	\N	\N	\N	\N
6387	2830	4	\N	\N	\N	\N	\N	\N
6388	2834	4	\N	\N	\N	\N	\N	\N
6389	2839	4	\N	\N	\N	\N	\N	\N
6390	2835	4	\N	\N	\N	\N	\N	\N
6391	2836	4	\N	\N	\N	\N	\N	\N
6392	2837	4	\N	\N	\N	\N	\N	\N
6393	2838	4	\N	\N	\N	\N	\N	\N
6394	2841	4	\N	\N	\N	\N	\N	\N
6395	2842	4	\N	\N	\N	\N	\N	\N
6396	2840	4	\N	\N	\N	\N	\N	\N
6397	2844	4	\N	\N	\N	\N	\N	\N
6398	2843	4	\N	\N	\N	\N	\N	\N
6399	2845	4	\N	\N	\N	\N	\N	\N
6400	2850	4	\N	\N	\N	\N	\N	\N
6401	2847	4	\N	\N	\N	\N	\N	\N
6402	2846	4	\N	\N	\N	\N	\N	\N
6403	2848	4	\N	\N	\N	\N	\N	\N
6404	2849	4	\N	\N	\N	\N	\N	\N
6405	2851	4	\N	\N	\N	\N	\N	\N
6406	2852	4	\N	\N	\N	\N	\N	\N
6407	2855	4	\N	\N	\N	\N	\N	\N
6408	2853	4	\N	\N	\N	\N	\N	\N
6409	2854	4	\N	\N	\N	\N	\N	\N
6410	2856	4	\N	\N	\N	\N	\N	\N
6411	2857	4	\N	\N	\N	\N	\N	\N
6412	2858	4	\N	\N	\N	\N	\N	\N
6413	2859	4	\N	\N	\N	\N	\N	\N
6414	2862	4	\N	\N	\N	\N	\N	\N
6415	2866	4	\N	\N	\N	\N	\N	\N
6416	2861	4	\N	\N	\N	\N	\N	\N
6417	2867	4	\N	\N	\N	\N	\N	\N
6418	2869	4	\N	\N	\N	\N	\N	\N
6419	2868	4	\N	\N	\N	\N	\N	\N
6420	2870	4	\N	\N	\N	\N	\N	\N
6421	2	5	\N	\N	\N	\N	\N	\N
6422	4	5	\N	\N	\N	\N	\N	\N
6423	8	5	\N	\N	\N	\N	\N	\N
6424	1	5	\N	\N	\N	\N	\N	\N
6425	6	5	\N	\N	\N	\N	\N	\N
6426	5	5	\N	\N	\N	\N	\N	\N
6427	9	5	\N	\N	\N	\N	\N	\N
6428	3	5	\N	\N	\N	\N	\N	\N
6429	13	5	\N	\N	\N	\N	\N	\N
6430	10	5	\N	\N	\N	\N	\N	\N
6431	14	5	\N	\N	\N	\N	\N	\N
6432	16	5	\N	\N	\N	\N	\N	\N
6433	18	5	\N	\N	\N	\N	\N	\N
6434	25	5	\N	\N	\N	\N	\N	\N
6435	31	5	\N	\N	\N	\N	\N	\N
6436	32	5	\N	\N	\N	\N	\N	\N
6437	34	5	\N	\N	\N	\N	\N	\N
6438	37	5	\N	\N	\N	\N	\N	\N
6439	35	5	\N	\N	\N	\N	\N	\N
6440	41	5	\N	\N	\N	\N	\N	\N
6441	42	5	\N	\N	\N	\N	\N	\N
6442	43	5	\N	\N	\N	\N	\N	\N
6443	45	5	\N	\N	\N	\N	\N	\N
6444	49	5	\N	\N	\N	\N	\N	\N
6445	50	5	\N	\N	\N	\N	\N	\N
6446	51	5	\N	\N	\N	\N	\N	\N
6447	53	5	\N	\N	\N	\N	\N	\N
6448	56	5	\N	\N	\N	\N	\N	\N
6449	52	5	\N	\N	\N	\N	\N	\N
6450	57	5	\N	\N	\N	\N	\N	\N
6451	58	5	\N	\N	\N	\N	\N	\N
6452	61	5	\N	\N	\N	\N	\N	\N
6453	63	5	\N	\N	\N	\N	\N	\N
6454	64	5	\N	\N	\N	\N	\N	\N
6455	66	5	\N	\N	\N	\N	\N	\N
6456	67	5	\N	\N	\N	\N	\N	\N
6457	68	5	\N	\N	\N	\N	\N	\N
6458	69	5	\N	\N	\N	\N	\N	\N
6459	70	5	\N	\N	\N	\N	\N	\N
6460	71	5	\N	\N	\N	\N	\N	\N
6461	72	5	\N	\N	\N	\N	\N	\N
6462	74	5	\N	\N	\N	\N	\N	\N
6463	75	5	\N	\N	\N	\N	\N	\N
6464	76	5	\N	\N	\N	\N	\N	\N
6465	77	5	\N	\N	\N	\N	\N	\N
6466	78	5	\N	\N	\N	\N	\N	\N
6467	79	5	\N	\N	\N	\N	\N	\N
6468	80	5	\N	\N	\N	\N	\N	\N
6469	83	5	\N	\N	\N	\N	\N	\N
6470	84	5	\N	\N	\N	\N	\N	\N
6471	87	5	\N	\N	\N	\N	\N	\N
6472	88	5	\N	\N	\N	\N	\N	\N
6473	89	5	\N	\N	\N	\N	\N	\N
6474	90	5	\N	\N	\N	\N	\N	\N
6475	93	5	\N	\N	\N	\N	\N	\N
6476	99	5	\N	\N	\N	\N	\N	\N
6477	101	5	\N	\N	\N	\N	\N	\N
6478	103	5	\N	\N	\N	\N	\N	\N
6479	109	5	\N	\N	\N	\N	\N	\N
6480	113	5	\N	\N	\N	\N	\N	\N
6481	114	5	\N	\N	\N	\N	\N	\N
6482	117	5	\N	\N	\N	\N	\N	\N
6483	118	5	\N	\N	\N	\N	\N	\N
6484	120	5	\N	\N	\N	\N	\N	\N
6485	121	5	\N	\N	\N	\N	\N	\N
6486	122	5	\N	\N	\N	\N	\N	\N
6487	125	5	\N	\N	\N	\N	\N	\N
6488	128	5	\N	\N	\N	\N	\N	\N
6489	129	5	\N	\N	\N	\N	\N	\N
6490	130	5	\N	\N	\N	\N	\N	\N
6491	131	5	\N	\N	\N	\N	\N	\N
6492	132	5	\N	\N	\N	\N	\N	\N
6493	134	5	\N	\N	\N	\N	\N	\N
6494	135	5	\N	\N	\N	\N	\N	\N
6495	138	5	\N	\N	\N	\N	\N	\N
6496	141	5	\N	\N	\N	\N	\N	\N
6497	142	5	\N	\N	\N	\N	\N	\N
6498	145	5	\N	\N	\N	\N	\N	\N
6499	148	5	\N	\N	\N	\N	\N	\N
6500	150	5	\N	\N	\N	\N	\N	\N
6501	151	5	\N	\N	\N	\N	\N	\N
6502	154	5	\N	\N	\N	\N	\N	\N
6503	159	5	\N	\N	\N	\N	\N	\N
6504	160	5	\N	\N	\N	\N	\N	\N
6505	161	5	\N	\N	\N	\N	\N	\N
6506	164	5	\N	\N	\N	\N	\N	\N
6507	168	5	\N	\N	\N	\N	\N	\N
6508	170	5	\N	\N	\N	\N	\N	\N
6509	174	5	\N	\N	\N	\N	\N	\N
6510	175	5	\N	\N	\N	\N	\N	\N
6511	181	5	\N	\N	\N	\N	\N	\N
6512	182	5	\N	\N	\N	\N	\N	\N
6513	206	5	\N	\N	\N	\N	\N	\N
6514	201	5	\N	\N	\N	\N	\N	\N
6515	213	5	\N	\N	\N	\N	\N	\N
6516	205	5	\N	\N	\N	\N	\N	\N
6517	199	5	\N	\N	\N	\N	\N	\N
6518	218	5	\N	\N	\N	\N	\N	\N
6519	215	5	\N	\N	\N	\N	\N	\N
6520	217	5	\N	\N	\N	\N	\N	\N
6521	212	5	\N	\N	\N	\N	\N	\N
6522	221	5	\N	\N	\N	\N	\N	\N
6523	224	5	\N	\N	\N	\N	\N	\N
6524	233	5	\N	\N	\N	\N	\N	\N
6525	234	5	\N	\N	\N	\N	\N	\N
6526	254	5	\N	\N	\N	\N	\N	\N
6527	257	5	\N	\N	\N	\N	\N	\N
6528	258	5	\N	\N	\N	\N	\N	\N
6529	269	5	\N	\N	\N	\N	\N	\N
6530	260	5	\N	\N	\N	\N	\N	\N
6531	263	5	\N	\N	\N	\N	\N	\N
6532	268	5	\N	\N	\N	\N	\N	\N
6533	275	5	\N	\N	\N	\N	\N	\N
6534	276	5	\N	\N	\N	\N	\N	\N
6535	287	5	\N	\N	\N	\N	\N	\N
6536	290	5	\N	\N	\N	\N	\N	\N
6537	278	5	\N	\N	\N	\N	\N	\N
6538	279	5	\N	\N	\N	\N	\N	\N
6539	291	5	\N	\N	\N	\N	\N	\N
6540	293	5	\N	\N	\N	\N	\N	\N
6541	295	5	\N	\N	\N	\N	\N	\N
6542	298	5	\N	\N	\N	\N	\N	\N
6543	304	5	\N	\N	\N	\N	\N	\N
6544	312	5	\N	\N	\N	\N	\N	\N
6545	313	5	\N	\N	\N	\N	\N	\N
6546	316	5	\N	\N	\N	\N	\N	\N
6547	317	5	\N	\N	\N	\N	\N	\N
6548	322	5	\N	\N	\N	\N	\N	\N
6549	323	5	\N	\N	\N	\N	\N	\N
6550	325	5	\N	\N	\N	\N	\N	\N
6551	328	5	\N	\N	\N	\N	\N	\N
6552	331	5	\N	\N	\N	\N	\N	\N
6553	333	5	\N	\N	\N	\N	\N	\N
6554	334	5	\N	\N	\N	\N	\N	\N
6555	337	5	\N	\N	\N	\N	\N	\N
6556	338	5	\N	\N	\N	\N	\N	\N
6557	341	5	\N	\N	\N	\N	\N	\N
6558	344	5	\N	\N	\N	\N	\N	\N
6559	350	5	\N	\N	\N	\N	\N	\N
6560	353	5	\N	\N	\N	\N	\N	\N
6561	356	5	\N	\N	\N	\N	\N	\N
6562	360	5	\N	\N	\N	\N	\N	\N
6563	362	5	\N	\N	\N	\N	\N	\N
6564	366	5	\N	\N	\N	\N	\N	\N
6565	367	5	\N	\N	\N	\N	\N	\N
6566	370	5	\N	\N	\N	\N	\N	\N
6567	372	5	\N	\N	\N	\N	\N	\N
6568	374	5	\N	\N	\N	\N	\N	\N
6569	377	5	\N	\N	\N	\N	\N	\N
6570	382	5	\N	\N	\N	\N	\N	\N
6571	385	5	\N	\N	\N	\N	\N	\N
6572	386	5	\N	\N	\N	\N	\N	\N
6573	389	5	\N	\N	\N	\N	\N	\N
6574	400	5	\N	\N	\N	\N	\N	\N
6575	405	5	\N	\N	\N	\N	\N	\N
6576	415	5	\N	\N	\N	\N	\N	\N
6577	411	5	\N	\N	\N	\N	\N	\N
6578	406	5	\N	\N	\N	\N	\N	\N
6579	416	5	\N	\N	\N	\N	\N	\N
6580	426	5	\N	\N	\N	\N	\N	\N
6581	448	5	\N	\N	\N	\N	\N	\N
6582	460	5	\N	\N	\N	\N	\N	\N
6583	450	5	\N	\N	\N	\N	\N	\N
6584	467	5	\N	\N	\N	\N	\N	\N
6585	463	5	\N	\N	\N	\N	\N	\N
6586	461	5	\N	\N	\N	\N	\N	\N
6587	477	5	\N	\N	\N	\N	\N	\N
6588	476	5	\N	\N	\N	\N	\N	\N
6589	513	5	\N	\N	\N	\N	\N	\N
6590	468	5	\N	\N	\N	\N	\N	\N
6591	506	5	\N	\N	\N	\N	\N	\N
6592	512	5	\N	\N	\N	\N	\N	\N
6593	502	5	\N	\N	\N	\N	\N	\N
6594	520	5	\N	\N	\N	\N	\N	\N
6595	470	5	\N	\N	\N	\N	\N	\N
6596	501	5	\N	\N	\N	\N	\N	\N
6597	495	5	\N	\N	\N	\N	\N	\N
6598	525	5	\N	\N	\N	\N	\N	\N
6599	536	5	\N	\N	\N	\N	\N	\N
6600	541	5	\N	\N	\N	\N	\N	\N
6601	543	5	\N	\N	\N	\N	\N	\N
6602	545	5	\N	\N	\N	\N	\N	\N
6603	549	5	\N	\N	\N	\N	\N	\N
6604	551	5	\N	\N	\N	\N	\N	\N
6605	576	5	\N	\N	\N	\N	\N	\N
6606	572	5	\N	\N	\N	\N	\N	\N
6607	558	5	\N	\N	\N	\N	\N	\N
6608	573	5	\N	\N	\N	\N	\N	\N
6609	584	5	\N	\N	\N	\N	\N	\N
6610	588	5	\N	\N	\N	\N	\N	\N
6611	594	5	\N	\N	\N	\N	\N	\N
6612	597	5	\N	\N	\N	\N	\N	\N
6613	606	5	\N	\N	\N	\N	\N	\N
6614	601	5	\N	\N	\N	\N	\N	\N
6615	624	5	\N	\N	\N	\N	\N	\N
6616	625	5	\N	\N	\N	\N	\N	\N
6617	623	5	\N	\N	\N	\N	\N	\N
6618	626	5	\N	\N	\N	\N	\N	\N
6619	627	5	\N	\N	\N	\N	\N	\N
6620	629	5	\N	\N	\N	\N	\N	\N
6621	633	5	\N	\N	\N	\N	\N	\N
6622	638	5	\N	\N	\N	\N	\N	\N
6623	643	5	\N	\N	\N	\N	\N	\N
6624	644	5	\N	\N	\N	\N	\N	\N
6625	654	5	\N	\N	\N	\N	\N	\N
6626	656	5	\N	\N	\N	\N	\N	\N
6627	659	5	\N	\N	\N	\N	\N	\N
6628	660	5	\N	\N	\N	\N	\N	\N
6629	666	5	\N	\N	\N	\N	\N	\N
6630	680	5	\N	\N	\N	\N	\N	\N
6631	693	5	\N	\N	\N	\N	\N	\N
6632	699	5	\N	\N	\N	\N	\N	\N
6633	702	5	\N	\N	\N	\N	\N	\N
6634	703	5	\N	\N	\N	\N	\N	\N
6635	706	5	\N	\N	\N	\N	\N	\N
6636	707	5	\N	\N	\N	\N	\N	\N
6637	708	5	\N	\N	\N	\N	\N	\N
6638	719	5	\N	\N	\N	\N	\N	\N
6639	720	5	\N	\N	\N	\N	\N	\N
6640	723	5	\N	\N	\N	\N	\N	\N
6641	730	5	\N	\N	\N	\N	\N	\N
6642	733	5	\N	\N	\N	\N	\N	\N
6643	734	5	\N	\N	\N	\N	\N	\N
6644	747	5	\N	\N	\N	\N	\N	\N
6645	760	5	\N	\N	\N	\N	\N	\N
6646	764	5	\N	\N	\N	\N	\N	\N
6647	766	5	\N	\N	\N	\N	\N	\N
6648	778	5	\N	\N	\N	\N	\N	\N
6649	781	5	\N	\N	\N	\N	\N	\N
6650	785	5	\N	\N	\N	\N	\N	\N
6651	788	5	\N	\N	\N	\N	\N	\N
6652	789	5	\N	\N	\N	\N	\N	\N
6653	795	5	\N	\N	\N	\N	\N	\N
6654	796	5	\N	\N	\N	\N	\N	\N
6655	797	5	\N	\N	\N	\N	\N	\N
6656	799	5	\N	\N	\N	\N	\N	\N
6657	812	5	\N	\N	\N	\N	\N	\N
6658	813	5	\N	\N	\N	\N	\N	\N
6659	815	5	\N	\N	\N	\N	\N	\N
6660	818	5	\N	\N	\N	\N	\N	\N
6661	819	5	\N	\N	\N	\N	\N	\N
6662	823	5	\N	\N	\N	\N	\N	\N
6663	825	5	\N	\N	\N	\N	\N	\N
6664	814	5	\N	\N	\N	\N	\N	\N
6665	831	5	\N	\N	\N	\N	\N	\N
6666	833	5	\N	\N	\N	\N	\N	\N
6667	836	5	\N	\N	\N	\N	\N	\N
6668	837	5	\N	\N	\N	\N	\N	\N
6669	841	5	\N	\N	\N	\N	\N	\N
6670	853	5	\N	\N	\N	\N	\N	\N
6671	855	5	\N	\N	\N	\N	\N	\N
6672	857	5	\N	\N	\N	\N	\N	\N
6673	859	5	\N	\N	\N	\N	\N	\N
6674	869	5	\N	\N	\N	\N	\N	\N
6675	870	5	\N	\N	\N	\N	\N	\N
6676	873	5	\N	\N	\N	\N	\N	\N
6677	890	5	\N	\N	\N	\N	\N	\N
6678	892	5	\N	\N	\N	\N	\N	\N
6679	894	5	\N	\N	\N	\N	\N	\N
6680	895	5	\N	\N	\N	\N	\N	\N
6681	898	5	\N	\N	\N	\N	\N	\N
6682	911	5	\N	\N	\N	\N	\N	\N
6683	912	5	\N	\N	\N	\N	\N	\N
6684	914	5	\N	\N	\N	\N	\N	\N
6685	916	5	\N	\N	\N	\N	\N	\N
6686	918	5	\N	\N	\N	\N	\N	\N
6687	920	5	\N	\N	\N	\N	\N	\N
6688	921	5	\N	\N	\N	\N	\N	\N
6689	924	5	\N	\N	\N	\N	\N	\N
6690	933	5	\N	\N	\N	\N	\N	\N
6691	934	5	\N	\N	\N	\N	\N	\N
6692	938	5	\N	\N	\N	\N	\N	\N
6693	939	5	\N	\N	\N	\N	\N	\N
6694	945	5	\N	\N	\N	\N	\N	\N
6695	948	5	\N	\N	\N	\N	\N	\N
6696	951	5	\N	\N	\N	\N	\N	\N
6697	954	5	\N	\N	\N	\N	\N	\N
6698	959	5	\N	\N	\N	\N	\N	\N
6699	960	5	\N	\N	\N	\N	\N	\N
6700	964	5	\N	\N	\N	\N	\N	\N
6701	965	5	\N	\N	\N	\N	\N	\N
6702	977	5	\N	\N	\N	\N	\N	\N
6703	978	5	\N	\N	\N	\N	\N	\N
6704	983	5	\N	\N	\N	\N	\N	\N
6705	986	5	\N	\N	\N	\N	\N	\N
6706	988	5	\N	\N	\N	\N	\N	\N
6707	990	5	\N	\N	\N	\N	\N	\N
6708	992	5	\N	\N	\N	\N	\N	\N
6709	993	5	\N	\N	\N	\N	\N	\N
6710	994	5	\N	\N	\N	\N	\N	\N
6711	998	5	\N	\N	\N	\N	\N	\N
6712	999	5	\N	\N	\N	\N	\N	\N
6713	1002	5	\N	\N	\N	\N	\N	\N
6714	1004	5	\N	\N	\N	\N	\N	\N
6715	1008	5	\N	\N	\N	\N	\N	\N
6716	1010	5	\N	\N	\N	\N	\N	\N
6717	1019	5	\N	\N	\N	\N	\N	\N
6718	1020	5	\N	\N	\N	\N	\N	\N
6719	1022	5	\N	\N	\N	\N	\N	\N
6720	1026	5	\N	\N	\N	\N	\N	\N
6721	1027	5	\N	\N	\N	\N	\N	\N
6722	1028	5	\N	\N	\N	\N	\N	\N
6723	1032	5	\N	\N	\N	\N	\N	\N
6724	1033	5	\N	\N	\N	\N	\N	\N
6725	1035	5	\N	\N	\N	\N	\N	\N
6726	1038	5	\N	\N	\N	\N	\N	\N
6727	1042	5	\N	\N	\N	\N	\N	\N
6728	1044	5	\N	\N	\N	\N	\N	\N
6729	1050	5	\N	\N	\N	\N	\N	\N
6730	1052	5	\N	\N	\N	\N	\N	\N
6731	1053	5	\N	\N	\N	\N	\N	\N
6732	1058	5	\N	\N	\N	\N	\N	\N
6733	1063	5	\N	\N	\N	\N	\N	\N
6734	1066	5	\N	\N	\N	\N	\N	\N
6735	1069	5	\N	\N	\N	\N	\N	\N
6736	1070	5	\N	\N	\N	\N	\N	\N
6737	1082	5	\N	\N	\N	\N	\N	\N
6738	1084	5	\N	\N	\N	\N	\N	\N
6739	1085	5	\N	\N	\N	\N	\N	\N
6740	1087	5	\N	\N	\N	\N	\N	\N
6741	1089	5	\N	\N	\N	\N	\N	\N
6742	1090	5	\N	\N	\N	\N	\N	\N
6743	1093	5	\N	\N	\N	\N	\N	\N
6744	1100	5	\N	\N	\N	\N	\N	\N
6745	1104	5	\N	\N	\N	\N	\N	\N
6746	1106	5	\N	\N	\N	\N	\N	\N
6747	1107	5	\N	\N	\N	\N	\N	\N
6748	1109	5	\N	\N	\N	\N	\N	\N
6749	1110	5	\N	\N	\N	\N	\N	\N
6750	1111	5	\N	\N	\N	\N	\N	\N
6751	1113	5	\N	\N	\N	\N	\N	\N
6752	1120	5	\N	\N	\N	\N	\N	\N
6753	1123	5	\N	\N	\N	\N	\N	\N
6754	1125	5	\N	\N	\N	\N	\N	\N
6755	1131	5	\N	\N	\N	\N	\N	\N
6756	1135	5	\N	\N	\N	\N	\N	\N
6757	1136	5	\N	\N	\N	\N	\N	\N
6758	1141	5	\N	\N	\N	\N	\N	\N
6759	1146	5	\N	\N	\N	\N	\N	\N
6760	1147	5	\N	\N	\N	\N	\N	\N
6761	1148	5	\N	\N	\N	\N	\N	\N
6762	1153	5	\N	\N	\N	\N	\N	\N
6763	1154	5	\N	\N	\N	\N	\N	\N
6764	1156	5	\N	\N	\N	\N	\N	\N
6765	1159	5	\N	\N	\N	\N	\N	\N
6766	1164	5	\N	\N	\N	\N	\N	\N
6767	1155	5	\N	\N	\N	\N	\N	\N
6768	1165	5	\N	\N	\N	\N	\N	\N
6769	1169	5	\N	\N	\N	\N	\N	\N
6770	1175	5	\N	\N	\N	\N	\N	\N
6771	1176	5	\N	\N	\N	\N	\N	\N
6772	1172	5	\N	\N	\N	\N	\N	\N
6773	1168	5	\N	\N	\N	\N	\N	\N
6774	1180	5	\N	\N	\N	\N	\N	\N
6775	1193	5	\N	\N	\N	\N	\N	\N
6776	1194	5	\N	\N	\N	\N	\N	\N
6777	1182	5	\N	\N	\N	\N	\N	\N
6778	1191	5	\N	\N	\N	\N	\N	\N
6779	1185	5	\N	\N	\N	\N	\N	\N
6780	1195	5	\N	\N	\N	\N	\N	\N
6781	1208	5	\N	\N	\N	\N	\N	\N
6782	1206	5	\N	\N	\N	\N	\N	\N
6783	1200	5	\N	\N	\N	\N	\N	\N
6784	1198	5	\N	\N	\N	\N	\N	\N
6785	1209	5	\N	\N	\N	\N	\N	\N
6786	1210	5	\N	\N	\N	\N	\N	\N
6787	1212	5	\N	\N	\N	\N	\N	\N
6788	1213	5	\N	\N	\N	\N	\N	\N
6789	1214	5	\N	\N	\N	\N	\N	\N
6790	1216	5	\N	\N	\N	\N	\N	\N
6791	1218	5	\N	\N	\N	\N	\N	\N
6792	1226	5	\N	\N	\N	\N	\N	\N
6793	1229	5	\N	\N	\N	\N	\N	\N
6794	1234	5	\N	\N	\N	\N	\N	\N
6795	1241	5	\N	\N	\N	\N	\N	\N
6796	1223	5	\N	\N	\N	\N	\N	\N
6797	1238	5	\N	\N	\N	\N	\N	\N
6798	1244	5	\N	\N	\N	\N	\N	\N
6799	1249	5	\N	\N	\N	\N	\N	\N
6800	1248	5	\N	\N	\N	\N	\N	\N
6801	1250	5	\N	\N	\N	\N	\N	\N
6802	1247	5	\N	\N	\N	\N	\N	\N
6803	1230	5	\N	\N	\N	\N	\N	\N
6804	1251	5	\N	\N	\N	\N	\N	\N
6805	1256	5	\N	\N	\N	\N	\N	\N
6806	1257	5	\N	\N	\N	\N	\N	\N
6807	1252	5	\N	\N	\N	\N	\N	\N
6808	1254	5	\N	\N	\N	\N	\N	\N
6809	1259	5	\N	\N	\N	\N	\N	\N
6810	1271	5	\N	\N	\N	\N	\N	\N
6811	1264	5	\N	\N	\N	\N	\N	\N
6812	1268	5	\N	\N	\N	\N	\N	\N
6813	1266	5	\N	\N	\N	\N	\N	\N
6814	1269	5	\N	\N	\N	\N	\N	\N
6815	1274	5	\N	\N	\N	\N	\N	\N
6816	1281	5	\N	\N	\N	\N	\N	\N
6817	1275	5	\N	\N	\N	\N	\N	\N
6818	1276	5	\N	\N	\N	\N	\N	\N
6819	1279	5	\N	\N	\N	\N	\N	\N
6820	1282	5	\N	\N	\N	\N	\N	\N
6821	1288	5	\N	\N	\N	\N	\N	\N
6822	1283	5	\N	\N	\N	\N	\N	\N
6823	1284	5	\N	\N	\N	\N	\N	\N
6824	1285	5	\N	\N	\N	\N	\N	\N
6825	1286	5	\N	\N	\N	\N	\N	\N
6826	1291	5	\N	\N	\N	\N	\N	\N
6827	1294	5	\N	\N	\N	\N	\N	\N
6828	1297	5	\N	\N	\N	\N	\N	\N
6829	1298	5	\N	\N	\N	\N	\N	\N
6830	1299	5	\N	\N	\N	\N	\N	\N
6831	1303	5	\N	\N	\N	\N	\N	\N
6832	1304	5	\N	\N	\N	\N	\N	\N
6833	1306	5	\N	\N	\N	\N	\N	\N
6834	1308	5	\N	\N	\N	\N	\N	\N
6835	1309	5	\N	\N	\N	\N	\N	\N
6836	1312	5	\N	\N	\N	\N	\N	\N
6837	1323	5	\N	\N	\N	\N	\N	\N
6838	1322	5	\N	\N	\N	\N	\N	\N
6839	1321	5	\N	\N	\N	\N	\N	\N
6840	1320	5	\N	\N	\N	\N	\N	\N
6841	1334	5	\N	\N	\N	\N	\N	\N
6842	1348	5	\N	\N	\N	\N	\N	\N
6843	1340	5	\N	\N	\N	\N	\N	\N
6844	1336	5	\N	\N	\N	\N	\N	\N
6845	1343	5	\N	\N	\N	\N	\N	\N
6846	1341	5	\N	\N	\N	\N	\N	\N
6847	1351	5	\N	\N	\N	\N	\N	\N
6848	1358	5	\N	\N	\N	\N	\N	\N
6849	1353	5	\N	\N	\N	\N	\N	\N
6850	1357	5	\N	\N	\N	\N	\N	\N
6851	1352	5	\N	\N	\N	\N	\N	\N
6852	1361	5	\N	\N	\N	\N	\N	\N
6853	1367	5	\N	\N	\N	\N	\N	\N
6854	1368	5	\N	\N	\N	\N	\N	\N
6855	1376	5	\N	\N	\N	\N	\N	\N
6856	1375	5	\N	\N	\N	\N	\N	\N
6857	1371	5	\N	\N	\N	\N	\N	\N
6858	1379	5	\N	\N	\N	\N	\N	\N
6859	1380	5	\N	\N	\N	\N	\N	\N
6860	1381	5	\N	\N	\N	\N	\N	\N
6861	1382	5	\N	\N	\N	\N	\N	\N
6862	1387	5	\N	\N	\N	\N	\N	\N
6863	1391	5	\N	\N	\N	\N	\N	\N
6864	1392	5	\N	\N	\N	\N	\N	\N
6865	1389	5	\N	\N	\N	\N	\N	\N
6866	1395	5	\N	\N	\N	\N	\N	\N
6867	1390	5	\N	\N	\N	\N	\N	\N
6868	1396	5	\N	\N	\N	\N	\N	\N
6869	1398	5	\N	\N	\N	\N	\N	\N
6870	1399	5	\N	\N	\N	\N	\N	\N
6871	1397	5	\N	\N	\N	\N	\N	\N
6872	1400	5	\N	\N	\N	\N	\N	\N
6873	1405	5	\N	\N	\N	\N	\N	\N
6874	1393	5	\N	\N	\N	\N	\N	\N
6875	1403	5	\N	\N	\N	\N	\N	\N
6876	1409	5	\N	\N	\N	\N	\N	\N
6877	1414	5	\N	\N	\N	\N	\N	\N
6878	1408	5	\N	\N	\N	\N	\N	\N
6879	1418	5	\N	\N	\N	\N	\N	\N
6880	1420	5	\N	\N	\N	\N	\N	\N
6881	1421	5	\N	\N	\N	\N	\N	\N
6882	1423	5	\N	\N	\N	\N	\N	\N
6883	1425	5	\N	\N	\N	\N	\N	\N
6884	1429	5	\N	\N	\N	\N	\N	\N
6885	1434	5	\N	\N	\N	\N	\N	\N
6886	1435	5	\N	\N	\N	\N	\N	\N
6887	1436	5	\N	\N	\N	\N	\N	\N
6888	1437	5	\N	\N	\N	\N	\N	\N
6889	1438	5	\N	\N	\N	\N	\N	\N
6890	1439	5	\N	\N	\N	\N	\N	\N
6891	1442	5	\N	\N	\N	\N	\N	\N
6892	1447	5	\N	\N	\N	\N	\N	\N
6893	1448	5	\N	\N	\N	\N	\N	\N
6894	1449	5	\N	\N	\N	\N	\N	\N
6895	1454	5	\N	\N	\N	\N	\N	\N
6896	1455	5	\N	\N	\N	\N	\N	\N
6897	1456	5	\N	\N	\N	\N	\N	\N
6898	1457	5	\N	\N	\N	\N	\N	\N
6899	1459	5	\N	\N	\N	\N	\N	\N
6900	1463	5	\N	\N	\N	\N	\N	\N
6901	1464	5	\N	\N	\N	\N	\N	\N
6902	1465	5	\N	\N	\N	\N	\N	\N
6903	1466	5	\N	\N	\N	\N	\N	\N
6904	1468	5	\N	\N	\N	\N	\N	\N
6905	1469	5	\N	\N	\N	\N	\N	\N
6906	1472	5	\N	\N	\N	\N	\N	\N
6907	1473	5	\N	\N	\N	\N	\N	\N
6908	1474	5	\N	\N	\N	\N	\N	\N
6909	1475	5	\N	\N	\N	\N	\N	\N
6910	1481	5	\N	\N	\N	\N	\N	\N
6911	1483	5	\N	\N	\N	\N	\N	\N
6912	1485	5	\N	\N	\N	\N	\N	\N
6913	1478	5	\N	\N	\N	\N	\N	\N
6914	1480	5	\N	\N	\N	\N	\N	\N
6915	1486	5	\N	\N	\N	\N	\N	\N
6916	1492	5	\N	\N	\N	\N	\N	\N
6917	1495	5	\N	\N	\N	\N	\N	\N
6918	1489	5	\N	\N	\N	\N	\N	\N
6919	1487	5	\N	\N	\N	\N	\N	\N
6920	1500	5	\N	\N	\N	\N	\N	\N
6921	1502	5	\N	\N	\N	\N	\N	\N
6922	1503	5	\N	\N	\N	\N	\N	\N
6923	1496	5	\N	\N	\N	\N	\N	\N
6924	1501	5	\N	\N	\N	\N	\N	\N
6925	1497	5	\N	\N	\N	\N	\N	\N
6926	1504	5	\N	\N	\N	\N	\N	\N
6927	1506	5	\N	\N	\N	\N	\N	\N
6928	1505	5	\N	\N	\N	\N	\N	\N
6929	1507	5	\N	\N	\N	\N	\N	\N
6930	1509	5	\N	\N	\N	\N	\N	\N
6931	1514	5	\N	\N	\N	\N	\N	\N
6932	1515	5	\N	\N	\N	\N	\N	\N
6933	1518	5	\N	\N	\N	\N	\N	\N
6934	1510	5	\N	\N	\N	\N	\N	\N
6935	1513	5	\N	\N	\N	\N	\N	\N
6936	1511	5	\N	\N	\N	\N	\N	\N
6937	1520	5	\N	\N	\N	\N	\N	\N
6938	1523	5	\N	\N	\N	\N	\N	\N
6939	1521	5	\N	\N	\N	\N	\N	\N
6940	1522	5	\N	\N	\N	\N	\N	\N
6941	1525	5	\N	\N	\N	\N	\N	\N
6942	1526	5	\N	\N	\N	\N	\N	\N
6943	1527	5	\N	\N	\N	\N	\N	\N
6944	1528	5	\N	\N	\N	\N	\N	\N
6945	1524	5	\N	\N	\N	\N	\N	\N
6946	1529	5	\N	\N	\N	\N	\N	\N
6947	1531	5	\N	\N	\N	\N	\N	\N
6948	1533	5	\N	\N	\N	\N	\N	\N
6949	1534	5	\N	\N	\N	\N	\N	\N
6950	1535	5	\N	\N	\N	\N	\N	\N
6951	1539	5	\N	\N	\N	\N	\N	\N
6952	1542	5	\N	\N	\N	\N	\N	\N
6953	1544	5	\N	\N	\N	\N	\N	\N
6954	1550	5	\N	\N	\N	\N	\N	\N
6955	1548	5	\N	\N	\N	\N	\N	\N
6956	1546	5	\N	\N	\N	\N	\N	\N
6957	1555	5	\N	\N	\N	\N	\N	\N
6958	1552	5	\N	\N	\N	\N	\N	\N
6959	1558	5	\N	\N	\N	\N	\N	\N
6960	1556	5	\N	\N	\N	\N	\N	\N
6961	1554	5	\N	\N	\N	\N	\N	\N
6962	1562	5	\N	\N	\N	\N	\N	\N
6963	1563	5	\N	\N	\N	\N	\N	\N
6964	1561	5	\N	\N	\N	\N	\N	\N
6965	1559	5	\N	\N	\N	\N	\N	\N
6966	1566	5	\N	\N	\N	\N	\N	\N
6967	1567	5	\N	\N	\N	\N	\N	\N
6968	1565	5	\N	\N	\N	\N	\N	\N
6969	1568	5	\N	\N	\N	\N	\N	\N
6970	1570	5	\N	\N	\N	\N	\N	\N
6971	1575	5	\N	\N	\N	\N	\N	\N
6972	1576	5	\N	\N	\N	\N	\N	\N
6973	1577	5	\N	\N	\N	\N	\N	\N
6974	1578	5	\N	\N	\N	\N	\N	\N
6975	1579	5	\N	\N	\N	\N	\N	\N
6976	1581	5	\N	\N	\N	\N	\N	\N
6977	1582	5	\N	\N	\N	\N	\N	\N
6978	1586	5	\N	\N	\N	\N	\N	\N
6979	1587	5	\N	\N	\N	\N	\N	\N
6980	1588	5	\N	\N	\N	\N	\N	\N
6981	1590	5	\N	\N	\N	\N	\N	\N
6982	1592	5	\N	\N	\N	\N	\N	\N
6983	1596	5	\N	\N	\N	\N	\N	\N
6984	1597	5	\N	\N	\N	\N	\N	\N
6985	1598	5	\N	\N	\N	\N	\N	\N
6986	1595	5	\N	\N	\N	\N	\N	\N
6987	1605	5	\N	\N	\N	\N	\N	\N
6988	1606	5	\N	\N	\N	\N	\N	\N
6989	1607	5	\N	\N	\N	\N	\N	\N
6990	1602	5	\N	\N	\N	\N	\N	\N
6991	1603	5	\N	\N	\N	\N	\N	\N
6992	1609	5	\N	\N	\N	\N	\N	\N
6993	1611	5	\N	\N	\N	\N	\N	\N
6994	1614	5	\N	\N	\N	\N	\N	\N
6995	1608	5	\N	\N	\N	\N	\N	\N
6996	1610	5	\N	\N	\N	\N	\N	\N
6997	1616	5	\N	\N	\N	\N	\N	\N
6998	1624	5	\N	\N	\N	\N	\N	\N
6999	1619	5	\N	\N	\N	\N	\N	\N
7000	1623	5	\N	\N	\N	\N	\N	\N
7001	1617	5	\N	\N	\N	\N	\N	\N
7002	1618	5	\N	\N	\N	\N	\N	\N
7003	1625	5	\N	\N	\N	\N	\N	\N
7004	1629	5	\N	\N	\N	\N	\N	\N
7005	1630	5	\N	\N	\N	\N	\N	\N
7006	1626	5	\N	\N	\N	\N	\N	\N
7007	1628	5	\N	\N	\N	\N	\N	\N
7008	1631	5	\N	\N	\N	\N	\N	\N
7009	1638	5	\N	\N	\N	\N	\N	\N
7010	1640	5	\N	\N	\N	\N	\N	\N
7011	1632	5	\N	\N	\N	\N	\N	\N
7012	1636	5	\N	\N	\N	\N	\N	\N
7013	1637	5	\N	\N	\N	\N	\N	\N
7014	1642	5	\N	\N	\N	\N	\N	\N
7015	1650	5	\N	\N	\N	\N	\N	\N
7016	1644	5	\N	\N	\N	\N	\N	\N
7017	1643	5	\N	\N	\N	\N	\N	\N
7018	1647	5	\N	\N	\N	\N	\N	\N
7019	1651	5	\N	\N	\N	\N	\N	\N
7020	1660	5	\N	\N	\N	\N	\N	\N
7021	1657	5	\N	\N	\N	\N	\N	\N
7022	1659	5	\N	\N	\N	\N	\N	\N
7023	1654	5	\N	\N	\N	\N	\N	\N
7024	1658	5	\N	\N	\N	\N	\N	\N
7025	1662	5	\N	\N	\N	\N	\N	\N
7026	1671	5	\N	\N	\N	\N	\N	\N
7027	1665	5	\N	\N	\N	\N	\N	\N
7028	1669	5	\N	\N	\N	\N	\N	\N
7029	1670	5	\N	\N	\N	\N	\N	\N
7030	1673	5	\N	\N	\N	\N	\N	\N
7031	1678	5	\N	\N	\N	\N	\N	\N
7032	1679	5	\N	\N	\N	\N	\N	\N
7033	1674	5	\N	\N	\N	\N	\N	\N
7034	1677	5	\N	\N	\N	\N	\N	\N
7035	1676	5	\N	\N	\N	\N	\N	\N
7036	1680	5	\N	\N	\N	\N	\N	\N
7037	1685	5	\N	\N	\N	\N	\N	\N
7038	1681	5	\N	\N	\N	\N	\N	\N
7039	1683	5	\N	\N	\N	\N	\N	\N
7040	1684	5	\N	\N	\N	\N	\N	\N
7041	1686	5	\N	\N	\N	\N	\N	\N
7042	1693	5	\N	\N	\N	\N	\N	\N
7043	1690	5	\N	\N	\N	\N	\N	\N
7044	1687	5	\N	\N	\N	\N	\N	\N
7045	1688	5	\N	\N	\N	\N	\N	\N
7046	1691	5	\N	\N	\N	\N	\N	\N
7047	1694	5	\N	\N	\N	\N	\N	\N
7048	1699	5	\N	\N	\N	\N	\N	\N
7049	1695	5	\N	\N	\N	\N	\N	\N
7050	1697	5	\N	\N	\N	\N	\N	\N
7051	1698	5	\N	\N	\N	\N	\N	\N
7052	1700	5	\N	\N	\N	\N	\N	\N
7053	1702	5	\N	\N	\N	\N	\N	\N
7054	1703	5	\N	\N	\N	\N	\N	\N
7055	1706	5	\N	\N	\N	\N	\N	\N
7056	1707	5	\N	\N	\N	\N	\N	\N
7057	1708	5	\N	\N	\N	\N	\N	\N
7058	1709	5	\N	\N	\N	\N	\N	\N
7059	1710	5	\N	\N	\N	\N	\N	\N
7060	1711	5	\N	\N	\N	\N	\N	\N
7061	1704	5	\N	\N	\N	\N	\N	\N
7062	1712	5	\N	\N	\N	\N	\N	\N
7063	1717	5	\N	\N	\N	\N	\N	\N
7064	1716	5	\N	\N	\N	\N	\N	\N
7065	1715	5	\N	\N	\N	\N	\N	\N
7066	1714	5	\N	\N	\N	\N	\N	\N
7067	1719	5	\N	\N	\N	\N	\N	\N
7068	1724	5	\N	\N	\N	\N	\N	\N
7069	1723	5	\N	\N	\N	\N	\N	\N
7070	1720	5	\N	\N	\N	\N	\N	\N
7071	1721	5	\N	\N	\N	\N	\N	\N
7072	1722	5	\N	\N	\N	\N	\N	\N
7073	1726	5	\N	\N	\N	\N	\N	\N
7074	1731	5	\N	\N	\N	\N	\N	\N
7075	1728	5	\N	\N	\N	\N	\N	\N
7076	1729	5	\N	\N	\N	\N	\N	\N
7077	1727	5	\N	\N	\N	\N	\N	\N
7078	1739	5	\N	\N	\N	\N	\N	\N
7079	1732	5	\N	\N	\N	\N	\N	\N
7080	1733	5	\N	\N	\N	\N	\N	\N
7081	1736	5	\N	\N	\N	\N	\N	\N
7082	1737	5	\N	\N	\N	\N	\N	\N
7083	1738	5	\N	\N	\N	\N	\N	\N
7084	1745	5	\N	\N	\N	\N	\N	\N
7085	1741	5	\N	\N	\N	\N	\N	\N
7086	1743	5	\N	\N	\N	\N	\N	\N
7087	1742	5	\N	\N	\N	\N	\N	\N
7088	1746	5	\N	\N	\N	\N	\N	\N
7089	1748	5	\N	\N	\N	\N	\N	\N
7090	1747	5	\N	\N	\N	\N	\N	\N
7091	1753	5	\N	\N	\N	\N	\N	\N
7092	1750	5	\N	\N	\N	\N	\N	\N
7093	1752	5	\N	\N	\N	\N	\N	\N
7094	1757	5	\N	\N	\N	\N	\N	\N
7095	1755	5	\N	\N	\N	\N	\N	\N
7096	1756	5	\N	\N	\N	\N	\N	\N
7097	1754	5	\N	\N	\N	\N	\N	\N
7098	1758	5	\N	\N	\N	\N	\N	\N
7099	1759	5	\N	\N	\N	\N	\N	\N
7100	1760	5	\N	\N	\N	\N	\N	\N
7101	1762	5	\N	\N	\N	\N	\N	\N
7102	1763	5	\N	\N	\N	\N	\N	\N
7103	1765	5	\N	\N	\N	\N	\N	\N
7104	1767	5	\N	\N	\N	\N	\N	\N
7105	1772	5	\N	\N	\N	\N	\N	\N
7106	1773	5	\N	\N	\N	\N	\N	\N
7107	1769	5	\N	\N	\N	\N	\N	\N
7108	1771	5	\N	\N	\N	\N	\N	\N
7109	1768	5	\N	\N	\N	\N	\N	\N
7110	1774	5	\N	\N	\N	\N	\N	\N
7111	1777	5	\N	\N	\N	\N	\N	\N
7112	1778	5	\N	\N	\N	\N	\N	\N
7113	1776	5	\N	\N	\N	\N	\N	\N
7114	1775	5	\N	\N	\N	\N	\N	\N
7115	1779	5	\N	\N	\N	\N	\N	\N
7116	1785	5	\N	\N	\N	\N	\N	\N
7117	1781	5	\N	\N	\N	\N	\N	\N
7118	1784	5	\N	\N	\N	\N	\N	\N
7119	1782	5	\N	\N	\N	\N	\N	\N
7120	1783	5	\N	\N	\N	\N	\N	\N
7121	1786	5	\N	\N	\N	\N	\N	\N
7122	1790	5	\N	\N	\N	\N	\N	\N
7123	1788	5	\N	\N	\N	\N	\N	\N
7124	1787	5	\N	\N	\N	\N	\N	\N
7125	1789	5	\N	\N	\N	\N	\N	\N
7126	1792	5	\N	\N	\N	\N	\N	\N
7127	1799	5	\N	\N	\N	\N	\N	\N
7128	1798	5	\N	\N	\N	\N	\N	\N
7129	1793	5	\N	\N	\N	\N	\N	\N
7130	1797	5	\N	\N	\N	\N	\N	\N
7131	1795	5	\N	\N	\N	\N	\N	\N
7132	1801	5	\N	\N	\N	\N	\N	\N
7133	1803	5	\N	\N	\N	\N	\N	\N
7134	1805	5	\N	\N	\N	\N	\N	\N
7135	1807	5	\N	\N	\N	\N	\N	\N
7136	1814	5	\N	\N	\N	\N	\N	\N
7137	1815	5	\N	\N	\N	\N	\N	\N
7138	1808	5	\N	\N	\N	\N	\N	\N
7139	1812	5	\N	\N	\N	\N	\N	\N
7140	1810	5	\N	\N	\N	\N	\N	\N
7141	1811	5	\N	\N	\N	\N	\N	\N
7142	1809	5	\N	\N	\N	\N	\N	\N
7143	1818	5	\N	\N	\N	\N	\N	\N
7144	1816	5	\N	\N	\N	\N	\N	\N
7145	1817	5	\N	\N	\N	\N	\N	\N
7146	1831	5	\N	\N	\N	\N	\N	\N
7147	1819	5	\N	\N	\N	\N	\N	\N
7148	1830	5	\N	\N	\N	\N	\N	\N
7149	1826	5	\N	\N	\N	\N	\N	\N
7150	1828	5	\N	\N	\N	\N	\N	\N
7151	1824	5	\N	\N	\N	\N	\N	\N
7152	1825	5	\N	\N	\N	\N	\N	\N
7153	1834	5	\N	\N	\N	\N	\N	\N
7154	1832	5	\N	\N	\N	\N	\N	\N
7155	1833	5	\N	\N	\N	\N	\N	\N
7156	1835	5	\N	\N	\N	\N	\N	\N
7157	1839	5	\N	\N	\N	\N	\N	\N
7158	1836	5	\N	\N	\N	\N	\N	\N
7159	1837	5	\N	\N	\N	\N	\N	\N
7160	1838	5	\N	\N	\N	\N	\N	\N
7161	1840	5	\N	\N	\N	\N	\N	\N
7162	1841	5	\N	\N	\N	\N	\N	\N
7163	1845	5	\N	\N	\N	\N	\N	\N
7164	1842	5	\N	\N	\N	\N	\N	\N
7165	1843	5	\N	\N	\N	\N	\N	\N
7166	1846	5	\N	\N	\N	\N	\N	\N
7167	1850	5	\N	\N	\N	\N	\N	\N
7168	1849	5	\N	\N	\N	\N	\N	\N
7169	1848	5	\N	\N	\N	\N	\N	\N
7170	1847	5	\N	\N	\N	\N	\N	\N
7171	1851	5	\N	\N	\N	\N	\N	\N
7172	1852	5	\N	\N	\N	\N	\N	\N
7173	1861	5	\N	\N	\N	\N	\N	\N
7174	1853	5	\N	\N	\N	\N	\N	\N
7175	1856	5	\N	\N	\N	\N	\N	\N
7176	1857	5	\N	\N	\N	\N	\N	\N
7177	1863	5	\N	\N	\N	\N	\N	\N
7178	1864	5	\N	\N	\N	\N	\N	\N
7179	1865	5	\N	\N	\N	\N	\N	\N
7180	1866	5	\N	\N	\N	\N	\N	\N
7181	1869	5	\N	\N	\N	\N	\N	\N
7182	1871	5	\N	\N	\N	\N	\N	\N
7183	1872	5	\N	\N	\N	\N	\N	\N
7184	1873	5	\N	\N	\N	\N	\N	\N
7185	1876	5	\N	\N	\N	\N	\N	\N
7186	1877	5	\N	\N	\N	\N	\N	\N
7187	1881	5	\N	\N	\N	\N	\N	\N
7188	1883	5	\N	\N	\N	\N	\N	\N
7189	1878	5	\N	\N	\N	\N	\N	\N
7190	1882	5	\N	\N	\N	\N	\N	\N
7191	1884	5	\N	\N	\N	\N	\N	\N
7192	1889	5	\N	\N	\N	\N	\N	\N
7193	1885	5	\N	\N	\N	\N	\N	\N
7194	1887	5	\N	\N	\N	\N	\N	\N
7195	1888	5	\N	\N	\N	\N	\N	\N
7196	1886	5	\N	\N	\N	\N	\N	\N
7197	1898	5	\N	\N	\N	\N	\N	\N
7198	1890	5	\N	\N	\N	\N	\N	\N
7199	1894	5	\N	\N	\N	\N	\N	\N
7200	1897	5	\N	\N	\N	\N	\N	\N
7201	1896	5	\N	\N	\N	\N	\N	\N
7202	1899	5	\N	\N	\N	\N	\N	\N
7203	1904	5	\N	\N	\N	\N	\N	\N
7204	1903	5	\N	\N	\N	\N	\N	\N
7205	1902	5	\N	\N	\N	\N	\N	\N
7206	1900	5	\N	\N	\N	\N	\N	\N
7207	1905	5	\N	\N	\N	\N	\N	\N
7208	1913	5	\N	\N	\N	\N	\N	\N
7209	1910	5	\N	\N	\N	\N	\N	\N
7210	1912	5	\N	\N	\N	\N	\N	\N
7211	1907	5	\N	\N	\N	\N	\N	\N
7212	1908	5	\N	\N	\N	\N	\N	\N
7213	1915	5	\N	\N	\N	\N	\N	\N
7214	1920	5	\N	\N	\N	\N	\N	\N
7215	1917	5	\N	\N	\N	\N	\N	\N
7216	1918	5	\N	\N	\N	\N	\N	\N
7217	1916	5	\N	\N	\N	\N	\N	\N
7218	1921	5	\N	\N	\N	\N	\N	\N
7219	1927	5	\N	\N	\N	\N	\N	\N
7220	1926	5	\N	\N	\N	\N	\N	\N
7221	1923	5	\N	\N	\N	\N	\N	\N
7222	1922	5	\N	\N	\N	\N	\N	\N
7223	1925	5	\N	\N	\N	\N	\N	\N
7224	1930	5	\N	\N	\N	\N	\N	\N
7225	1935	5	\N	\N	\N	\N	\N	\N
7226	1931	5	\N	\N	\N	\N	\N	\N
7227	1934	5	\N	\N	\N	\N	\N	\N
7228	1933	5	\N	\N	\N	\N	\N	\N
7229	1937	5	\N	\N	\N	\N	\N	\N
7230	1938	5	\N	\N	\N	\N	\N	\N
7231	1943	5	\N	\N	\N	\N	\N	\N
7232	1945	5	\N	\N	\N	\N	\N	\N
7233	1942	5	\N	\N	\N	\N	\N	\N
7234	1946	5	\N	\N	\N	\N	\N	\N
7235	1947	5	\N	\N	\N	\N	\N	\N
7236	1948	5	\N	\N	\N	\N	\N	\N
7237	1949	5	\N	\N	\N	\N	\N	\N
7238	1950	5	\N	\N	\N	\N	\N	\N
7239	1951	5	\N	\N	\N	\N	\N	\N
7240	1952	5	\N	\N	\N	\N	\N	\N
7241	1954	5	\N	\N	\N	\N	\N	\N
7242	1955	5	\N	\N	\N	\N	\N	\N
7243	1956	5	\N	\N	\N	\N	\N	\N
7244	1958	5	\N	\N	\N	\N	\N	\N
7245	1964	5	\N	\N	\N	\N	\N	\N
7246	1962	5	\N	\N	\N	\N	\N	\N
7247	1963	5	\N	\N	\N	\N	\N	\N
7248	1961	5	\N	\N	\N	\N	\N	\N
7249	1959	5	\N	\N	\N	\N	\N	\N
7250	1965	5	\N	\N	\N	\N	\N	\N
7251	1969	5	\N	\N	\N	\N	\N	\N
7252	1968	5	\N	\N	\N	\N	\N	\N
7253	1967	5	\N	\N	\N	\N	\N	\N
7254	1966	5	\N	\N	\N	\N	\N	\N
7255	1970	5	\N	\N	\N	\N	\N	\N
7256	1976	5	\N	\N	\N	\N	\N	\N
7257	1974	5	\N	\N	\N	\N	\N	\N
7258	1971	5	\N	\N	\N	\N	\N	\N
7259	1975	5	\N	\N	\N	\N	\N	\N
7260	1973	5	\N	\N	\N	\N	\N	\N
7261	1979	5	\N	\N	\N	\N	\N	\N
7262	1983	5	\N	\N	\N	\N	\N	\N
7263	1982	5	\N	\N	\N	\N	\N	\N
7264	1981	5	\N	\N	\N	\N	\N	\N
7265	1980	5	\N	\N	\N	\N	\N	\N
7266	1984	5	\N	\N	\N	\N	\N	\N
7267	1989	5	\N	\N	\N	\N	\N	\N
7268	1985	5	\N	\N	\N	\N	\N	\N
7269	1988	5	\N	\N	\N	\N	\N	\N
7270	1986	5	\N	\N	\N	\N	\N	\N
7271	1987	5	\N	\N	\N	\N	\N	\N
7272	1990	5	\N	\N	\N	\N	\N	\N
7273	1995	5	\N	\N	\N	\N	\N	\N
7274	1994	5	\N	\N	\N	\N	\N	\N
7275	1991	5	\N	\N	\N	\N	\N	\N
7276	1993	5	\N	\N	\N	\N	\N	\N
7277	1996	5	\N	\N	\N	\N	\N	\N
7278	2002	5	\N	\N	\N	\N	\N	\N
7279	2000	5	\N	\N	\N	\N	\N	\N
7280	1999	5	\N	\N	\N	\N	\N	\N
7281	1998	5	\N	\N	\N	\N	\N	\N
7282	2001	5	\N	\N	\N	\N	\N	\N
7283	2004	5	\N	\N	\N	\N	\N	\N
7284	2008	5	\N	\N	\N	\N	\N	\N
7285	2005	5	\N	\N	\N	\N	\N	\N
7286	2007	5	\N	\N	\N	\N	\N	\N
7287	2006	5	\N	\N	\N	\N	\N	\N
7288	2009	5	\N	\N	\N	\N	\N	\N
7289	2015	5	\N	\N	\N	\N	\N	\N
7290	2010	5	\N	\N	\N	\N	\N	\N
7291	2012	5	\N	\N	\N	\N	\N	\N
7292	2013	5	\N	\N	\N	\N	\N	\N
7293	2011	5	\N	\N	\N	\N	\N	\N
7294	2017	5	\N	\N	\N	\N	\N	\N
7295	2022	5	\N	\N	\N	\N	\N	\N
7296	2018	5	\N	\N	\N	\N	\N	\N
7297	2019	5	\N	\N	\N	\N	\N	\N
7298	2021	5	\N	\N	\N	\N	\N	\N
7299	2024	5	\N	\N	\N	\N	\N	\N
7300	2030	5	\N	\N	\N	\N	\N	\N
7301	2026	5	\N	\N	\N	\N	\N	\N
7302	2025	5	\N	\N	\N	\N	\N	\N
7303	2029	5	\N	\N	\N	\N	\N	\N
7304	2027	5	\N	\N	\N	\N	\N	\N
7305	2031	5	\N	\N	\N	\N	\N	\N
7306	2036	5	\N	\N	\N	\N	\N	\N
7307	2032	5	\N	\N	\N	\N	\N	\N
7308	2033	5	\N	\N	\N	\N	\N	\N
7309	2034	5	\N	\N	\N	\N	\N	\N
7310	2037	5	\N	\N	\N	\N	\N	\N
7311	2042	5	\N	\N	\N	\N	\N	\N
7312	2039	5	\N	\N	\N	\N	\N	\N
7313	2040	5	\N	\N	\N	\N	\N	\N
7314	2038	5	\N	\N	\N	\N	\N	\N
7315	2041	5	\N	\N	\N	\N	\N	\N
7316	2043	5	\N	\N	\N	\N	\N	\N
7317	2047	5	\N	\N	\N	\N	\N	\N
7318	2044	5	\N	\N	\N	\N	\N	\N
7319	2046	5	\N	\N	\N	\N	\N	\N
7320	2045	5	\N	\N	\N	\N	\N	\N
7321	2048	5	\N	\N	\N	\N	\N	\N
7322	2054	5	\N	\N	\N	\N	\N	\N
7323	2051	5	\N	\N	\N	\N	\N	\N
7324	2049	5	\N	\N	\N	\N	\N	\N
7325	2050	5	\N	\N	\N	\N	\N	\N
7326	2053	5	\N	\N	\N	\N	\N	\N
7327	2055	5	\N	\N	\N	\N	\N	\N
7328	2059	5	\N	\N	\N	\N	\N	\N
7329	2056	5	\N	\N	\N	\N	\N	\N
7330	2057	5	\N	\N	\N	\N	\N	\N
7331	2058	5	\N	\N	\N	\N	\N	\N
7332	2060	5	\N	\N	\N	\N	\N	\N
7333	2065	5	\N	\N	\N	\N	\N	\N
7334	2061	5	\N	\N	\N	\N	\N	\N
7335	2062	5	\N	\N	\N	\N	\N	\N
7336	2063	5	\N	\N	\N	\N	\N	\N
7337	2064	5	\N	\N	\N	\N	\N	\N
7338	2066	5	\N	\N	\N	\N	\N	\N
7339	2071	5	\N	\N	\N	\N	\N	\N
7340	2069	5	\N	\N	\N	\N	\N	\N
7341	2067	5	\N	\N	\N	\N	\N	\N
7342	2070	5	\N	\N	\N	\N	\N	\N
7343	2072	5	\N	\N	\N	\N	\N	\N
7344	2079	5	\N	\N	\N	\N	\N	\N
7345	2076	5	\N	\N	\N	\N	\N	\N
7346	2077	5	\N	\N	\N	\N	\N	\N
7347	2074	5	\N	\N	\N	\N	\N	\N
7348	2078	5	\N	\N	\N	\N	\N	\N
7349	2080	5	\N	\N	\N	\N	\N	\N
7350	2082	5	\N	\N	\N	\N	\N	\N
7351	2081	5	\N	\N	\N	\N	\N	\N
7352	2083	5	\N	\N	\N	\N	\N	\N
7353	2087	5	\N	\N	\N	\N	\N	\N
7354	2089	5	\N	\N	\N	\N	\N	\N
7355	2090	5	\N	\N	\N	\N	\N	\N
7356	2091	5	\N	\N	\N	\N	\N	\N
7357	2088	5	\N	\N	\N	\N	\N	\N
7358	2092	5	\N	\N	\N	\N	\N	\N
7359	2093	5	\N	\N	\N	\N	\N	\N
7360	2094	5	\N	\N	\N	\N	\N	\N
7361	2096	5	\N	\N	\N	\N	\N	\N
7362	2095	5	\N	\N	\N	\N	\N	\N
7363	2098	5	\N	\N	\N	\N	\N	\N
7364	2101	5	\N	\N	\N	\N	\N	\N
7365	2099	5	\N	\N	\N	\N	\N	\N
7366	2103	5	\N	\N	\N	\N	\N	\N
7367	2100	5	\N	\N	\N	\N	\N	\N
7368	2106	5	\N	\N	\N	\N	\N	\N
7369	2104	5	\N	\N	\N	\N	\N	\N
7370	2105	5	\N	\N	\N	\N	\N	\N
7371	2109	5	\N	\N	\N	\N	\N	\N
7372	2110	5	\N	\N	\N	\N	\N	\N
7373	2107	5	\N	\N	\N	\N	\N	\N
7374	2112	5	\N	\N	\N	\N	\N	\N
7375	2114	5	\N	\N	\N	\N	\N	\N
7376	2115	5	\N	\N	\N	\N	\N	\N
7377	2118	5	\N	\N	\N	\N	\N	\N
7378	2119	5	\N	\N	\N	\N	\N	\N
7379	2120	5	\N	\N	\N	\N	\N	\N
7380	2117	5	\N	\N	\N	\N	\N	\N
7381	2122	5	\N	\N	\N	\N	\N	\N
7382	2123	5	\N	\N	\N	\N	\N	\N
7383	2124	5	\N	\N	\N	\N	\N	\N
7384	2125	5	\N	\N	\N	\N	\N	\N
7385	2126	5	\N	\N	\N	\N	\N	\N
7386	2127	5	\N	\N	\N	\N	\N	\N
7387	2129	5	\N	\N	\N	\N	\N	\N
7388	2130	5	\N	\N	\N	\N	\N	\N
7389	2132	5	\N	\N	\N	\N	\N	\N
7390	2134	5	\N	\N	\N	\N	\N	\N
7391	2135	5	\N	\N	\N	\N	\N	\N
7392	2136	5	\N	\N	\N	\N	\N	\N
7393	2137	5	\N	\N	\N	\N	\N	\N
7394	2138	5	\N	\N	\N	\N	\N	\N
7395	2139	5	\N	\N	\N	\N	\N	\N
7396	2140	5	\N	\N	\N	\N	\N	\N
7397	2142	5	\N	\N	\N	\N	\N	\N
7398	2143	5	\N	\N	\N	\N	\N	\N
7399	2144	5	\N	\N	\N	\N	\N	\N
7400	2146	5	\N	\N	\N	\N	\N	\N
7401	2147	5	\N	\N	\N	\N	\N	\N
7402	2148	5	\N	\N	\N	\N	\N	\N
7403	2149	5	\N	\N	\N	\N	\N	\N
7404	2150	5	\N	\N	\N	\N	\N	\N
7405	2151	5	\N	\N	\N	\N	\N	\N
7406	2152	5	\N	\N	\N	\N	\N	\N
7407	2153	5	\N	\N	\N	\N	\N	\N
7408	2157	5	\N	\N	\N	\N	\N	\N
7409	2158	5	\N	\N	\N	\N	\N	\N
7410	2159	5	\N	\N	\N	\N	\N	\N
7411	2160	5	\N	\N	\N	\N	\N	\N
7412	2161	5	\N	\N	\N	\N	\N	\N
7413	2162	5	\N	\N	\N	\N	\N	\N
7414	2167	5	\N	\N	\N	\N	\N	\N
7415	2170	5	\N	\N	\N	\N	\N	\N
7416	2171	5	\N	\N	\N	\N	\N	\N
7417	2165	5	\N	\N	\N	\N	\N	\N
7418	2163	5	\N	\N	\N	\N	\N	\N
7419	2166	5	\N	\N	\N	\N	\N	\N
7420	2172	5	\N	\N	\N	\N	\N	\N
7421	2173	5	\N	\N	\N	\N	\N	\N
7422	2168	5	\N	\N	\N	\N	\N	\N
7423	2175	5	\N	\N	\N	\N	\N	\N
7424	2179	5	\N	\N	\N	\N	\N	\N
7425	2180	5	\N	\N	\N	\N	\N	\N
7426	2174	5	\N	\N	\N	\N	\N	\N
7427	2176	5	\N	\N	\N	\N	\N	\N
7428	2177	5	\N	\N	\N	\N	\N	\N
7429	2178	5	\N	\N	\N	\N	\N	\N
7430	2181	5	\N	\N	\N	\N	\N	\N
7431	2182	5	\N	\N	\N	\N	\N	\N
7432	2183	5	\N	\N	\N	\N	\N	\N
7433	2184	5	\N	\N	\N	\N	\N	\N
7434	2192	5	\N	\N	\N	\N	\N	\N
7435	2189	5	\N	\N	\N	\N	\N	\N
7436	2190	5	\N	\N	\N	\N	\N	\N
7437	2185	5	\N	\N	\N	\N	\N	\N
7438	2187	5	\N	\N	\N	\N	\N	\N
7439	2191	5	\N	\N	\N	\N	\N	\N
7440	2193	5	\N	\N	\N	\N	\N	\N
7441	2196	5	\N	\N	\N	\N	\N	\N
7442	2198	5	\N	\N	\N	\N	\N	\N
7443	2194	5	\N	\N	\N	\N	\N	\N
7444	2199	5	\N	\N	\N	\N	\N	\N
7445	2201	5	\N	\N	\N	\N	\N	\N
7446	2202	5	\N	\N	\N	\N	\N	\N
7447	2200	5	\N	\N	\N	\N	\N	\N
7448	2205	5	\N	\N	\N	\N	\N	\N
7449	2204	5	\N	\N	\N	\N	\N	\N
7450	2207	5	\N	\N	\N	\N	\N	\N
7451	2212	5	\N	\N	\N	\N	\N	\N
7452	2209	5	\N	\N	\N	\N	\N	\N
7453	2208	5	\N	\N	\N	\N	\N	\N
7454	2211	5	\N	\N	\N	\N	\N	\N
7455	2213	5	\N	\N	\N	\N	\N	\N
7456	2219	5	\N	\N	\N	\N	\N	\N
7457	2217	5	\N	\N	\N	\N	\N	\N
7458	2214	5	\N	\N	\N	\N	\N	\N
7459	2215	5	\N	\N	\N	\N	\N	\N
7460	2218	5	\N	\N	\N	\N	\N	\N
7461	2221	5	\N	\N	\N	\N	\N	\N
7462	2225	5	\N	\N	\N	\N	\N	\N
7463	2223	5	\N	\N	\N	\N	\N	\N
7464	2222	5	\N	\N	\N	\N	\N	\N
7465	2224	5	\N	\N	\N	\N	\N	\N
7466	2228	5	\N	\N	\N	\N	\N	\N
7467	2235	5	\N	\N	\N	\N	\N	\N
7468	2229	5	\N	\N	\N	\N	\N	\N
7469	2230	5	\N	\N	\N	\N	\N	\N
7470	2231	5	\N	\N	\N	\N	\N	\N
7471	2232	5	\N	\N	\N	\N	\N	\N
7472	2236	5	\N	\N	\N	\N	\N	\N
7473	2241	5	\N	\N	\N	\N	\N	\N
7474	2239	5	\N	\N	\N	\N	\N	\N
7475	2240	5	\N	\N	\N	\N	\N	\N
7476	2237	5	\N	\N	\N	\N	\N	\N
7477	2242	5	\N	\N	\N	\N	\N	\N
7478	2247	5	\N	\N	\N	\N	\N	\N
7479	2245	5	\N	\N	\N	\N	\N	\N
7480	2243	5	\N	\N	\N	\N	\N	\N
7481	2244	5	\N	\N	\N	\N	\N	\N
7482	2246	5	\N	\N	\N	\N	\N	\N
7483	2248	5	\N	\N	\N	\N	\N	\N
7484	2253	5	\N	\N	\N	\N	\N	\N
7485	2251	5	\N	\N	\N	\N	\N	\N
7486	2249	5	\N	\N	\N	\N	\N	\N
7487	2250	5	\N	\N	\N	\N	\N	\N
7488	2255	5	\N	\N	\N	\N	\N	\N
7489	2260	5	\N	\N	\N	\N	\N	\N
7490	2257	5	\N	\N	\N	\N	\N	\N
7491	2256	5	\N	\N	\N	\N	\N	\N
7492	2258	5	\N	\N	\N	\N	\N	\N
7493	2259	5	\N	\N	\N	\N	\N	\N
7494	2261	5	\N	\N	\N	\N	\N	\N
7495	2265	5	\N	\N	\N	\N	\N	\N
7496	2263	5	\N	\N	\N	\N	\N	\N
7497	2264	5	\N	\N	\N	\N	\N	\N
7498	2262	5	\N	\N	\N	\N	\N	\N
7499	2266	5	\N	\N	\N	\N	\N	\N
7500	2271	5	\N	\N	\N	\N	\N	\N
7501	2268	5	\N	\N	\N	\N	\N	\N
7502	2269	5	\N	\N	\N	\N	\N	\N
7503	2270	5	\N	\N	\N	\N	\N	\N
7504	2267	5	\N	\N	\N	\N	\N	\N
7505	2272	5	\N	\N	\N	\N	\N	\N
7506	2276	5	\N	\N	\N	\N	\N	\N
7507	2273	5	\N	\N	\N	\N	\N	\N
7508	2274	5	\N	\N	\N	\N	\N	\N
7509	2275	5	\N	\N	\N	\N	\N	\N
7510	2277	5	\N	\N	\N	\N	\N	\N
7511	2282	5	\N	\N	\N	\N	\N	\N
7512	2278	5	\N	\N	\N	\N	\N	\N
7513	2281	5	\N	\N	\N	\N	\N	\N
7514	2279	5	\N	\N	\N	\N	\N	\N
7515	2280	5	\N	\N	\N	\N	\N	\N
7516	2283	5	\N	\N	\N	\N	\N	\N
7517	2286	5	\N	\N	\N	\N	\N	\N
7518	2287	5	\N	\N	\N	\N	\N	\N
7519	2284	5	\N	\N	\N	\N	\N	\N
7520	2285	5	\N	\N	\N	\N	\N	\N
7521	2288	5	\N	\N	\N	\N	\N	\N
7522	2295	5	\N	\N	\N	\N	\N	\N
7523	2289	5	\N	\N	\N	\N	\N	\N
7524	2291	5	\N	\N	\N	\N	\N	\N
7525	2290	5	\N	\N	\N	\N	\N	\N
7526	2293	5	\N	\N	\N	\N	\N	\N
7527	2300	5	\N	\N	\N	\N	\N	\N
7528	2297	5	\N	\N	\N	\N	\N	\N
7529	2298	5	\N	\N	\N	\N	\N	\N
7530	2299	5	\N	\N	\N	\N	\N	\N
7531	2296	5	\N	\N	\N	\N	\N	\N
7532	2304	5	\N	\N	\N	\N	\N	\N
7533	2306	5	\N	\N	\N	\N	\N	\N
7534	2305	5	\N	\N	\N	\N	\N	\N
7535	2303	5	\N	\N	\N	\N	\N	\N
7536	2308	5	\N	\N	\N	\N	\N	\N
7537	2307	5	\N	\N	\N	\N	\N	\N
7538	2312	5	\N	\N	\N	\N	\N	\N
7539	2310	5	\N	\N	\N	\N	\N	\N
7540	2311	5	\N	\N	\N	\N	\N	\N
7541	2309	5	\N	\N	\N	\N	\N	\N
7542	2313	5	\N	\N	\N	\N	\N	\N
7543	2317	5	\N	\N	\N	\N	\N	\N
7544	2318	5	\N	\N	\N	\N	\N	\N
7545	2315	5	\N	\N	\N	\N	\N	\N
7546	2316	5	\N	\N	\N	\N	\N	\N
7547	2314	5	\N	\N	\N	\N	\N	\N
7548	2320	5	\N	\N	\N	\N	\N	\N
7549	2325	5	\N	\N	\N	\N	\N	\N
7550	2324	5	\N	\N	\N	\N	\N	\N
7551	2321	5	\N	\N	\N	\N	\N	\N
7552	2323	5	\N	\N	\N	\N	\N	\N
7553	2326	5	\N	\N	\N	\N	\N	\N
7554	2327	5	\N	\N	\N	\N	\N	\N
7555	2332	5	\N	\N	\N	\N	\N	\N
7556	2329	5	\N	\N	\N	\N	\N	\N
7557	2330	5	\N	\N	\N	\N	\N	\N
7558	2333	5	\N	\N	\N	\N	\N	\N
7559	2334	5	\N	\N	\N	\N	\N	\N
7560	2335	5	\N	\N	\N	\N	\N	\N
7561	2337	5	\N	\N	\N	\N	\N	\N
7562	2338	5	\N	\N	\N	\N	\N	\N
7563	2336	5	\N	\N	\N	\N	\N	\N
7564	2331	5	\N	\N	\N	\N	\N	\N
7565	2340	5	\N	\N	\N	\N	\N	\N
7566	2343	5	\N	\N	\N	\N	\N	\N
7567	2344	5	\N	\N	\N	\N	\N	\N
7568	2341	5	\N	\N	\N	\N	\N	\N
7569	2342	5	\N	\N	\N	\N	\N	\N
7570	2345	5	\N	\N	\N	\N	\N	\N
7571	2350	5	\N	\N	\N	\N	\N	\N
7572	2346	5	\N	\N	\N	\N	\N	\N
7573	2347	5	\N	\N	\N	\N	\N	\N
7574	2349	5	\N	\N	\N	\N	\N	\N
7575	2348	5	\N	\N	\N	\N	\N	\N
7576	2351	5	\N	\N	\N	\N	\N	\N
7577	2355	5	\N	\N	\N	\N	\N	\N
7578	2353	5	\N	\N	\N	\N	\N	\N
7579	2352	5	\N	\N	\N	\N	\N	\N
7580	2354	5	\N	\N	\N	\N	\N	\N
7581	2356	5	\N	\N	\N	\N	\N	\N
7582	2361	5	\N	\N	\N	\N	\N	\N
7583	2357	5	\N	\N	\N	\N	\N	\N
7584	2359	5	\N	\N	\N	\N	\N	\N
7585	2358	5	\N	\N	\N	\N	\N	\N
7586	2360	5	\N	\N	\N	\N	\N	\N
7587	2362	5	\N	\N	\N	\N	\N	\N
7588	2367	5	\N	\N	\N	\N	\N	\N
7589	2363	5	\N	\N	\N	\N	\N	\N
7590	2364	5	\N	\N	\N	\N	\N	\N
7591	2366	5	\N	\N	\N	\N	\N	\N
7592	2368	5	\N	\N	\N	\N	\N	\N
7593	2373	5	\N	\N	\N	\N	\N	\N
7594	2372	5	\N	\N	\N	\N	\N	\N
7595	2371	5	\N	\N	\N	\N	\N	\N
7596	2370	5	\N	\N	\N	\N	\N	\N
7597	2369	5	\N	\N	\N	\N	\N	\N
7598	2375	5	\N	\N	\N	\N	\N	\N
7599	2378	5	\N	\N	\N	\N	\N	\N
7600	2376	5	\N	\N	\N	\N	\N	\N
7601	2377	5	\N	\N	\N	\N	\N	\N
7602	2374	5	\N	\N	\N	\N	\N	\N
7603	2381	5	\N	\N	\N	\N	\N	\N
7604	2384	5	\N	\N	\N	\N	\N	\N
7605	2383	5	\N	\N	\N	\N	\N	\N
7606	2379	5	\N	\N	\N	\N	\N	\N
7607	2382	5	\N	\N	\N	\N	\N	\N
7608	2380	5	\N	\N	\N	\N	\N	\N
7609	2385	5	\N	\N	\N	\N	\N	\N
7610	2390	5	\N	\N	\N	\N	\N	\N
7611	2386	5	\N	\N	\N	\N	\N	\N
7612	2387	5	\N	\N	\N	\N	\N	\N
7613	2389	5	\N	\N	\N	\N	\N	\N
7614	2391	5	\N	\N	\N	\N	\N	\N
7615	2397	5	\N	\N	\N	\N	\N	\N
7616	2394	5	\N	\N	\N	\N	\N	\N
7617	2395	5	\N	\N	\N	\N	\N	\N
7618	2392	5	\N	\N	\N	\N	\N	\N
7619	2396	5	\N	\N	\N	\N	\N	\N
7620	2398	5	\N	\N	\N	\N	\N	\N
7621	2403	5	\N	\N	\N	\N	\N	\N
7622	2399	5	\N	\N	\N	\N	\N	\N
7623	2400	5	\N	\N	\N	\N	\N	\N
7624	2402	5	\N	\N	\N	\N	\N	\N
7625	2404	5	\N	\N	\N	\N	\N	\N
7626	2409	5	\N	\N	\N	\N	\N	\N
7627	2405	5	\N	\N	\N	\N	\N	\N
7628	2406	5	\N	\N	\N	\N	\N	\N
7629	2407	5	\N	\N	\N	\N	\N	\N
7630	2408	5	\N	\N	\N	\N	\N	\N
7631	2410	5	\N	\N	\N	\N	\N	\N
7632	2414	5	\N	\N	\N	\N	\N	\N
7633	2411	5	\N	\N	\N	\N	\N	\N
7634	2412	5	\N	\N	\N	\N	\N	\N
7635	2413	5	\N	\N	\N	\N	\N	\N
7636	2415	5	\N	\N	\N	\N	\N	\N
7637	2421	5	\N	\N	\N	\N	\N	\N
7638	2416	5	\N	\N	\N	\N	\N	\N
7639	2418	5	\N	\N	\N	\N	\N	\N
7640	2420	5	\N	\N	\N	\N	\N	\N
7641	2419	5	\N	\N	\N	\N	\N	\N
7642	2422	5	\N	\N	\N	\N	\N	\N
7643	2426	5	\N	\N	\N	\N	\N	\N
7644	2424	5	\N	\N	\N	\N	\N	\N
7645	2423	5	\N	\N	\N	\N	\N	\N
7646	2425	5	\N	\N	\N	\N	\N	\N
7647	2427	5	\N	\N	\N	\N	\N	\N
7648	2428	5	\N	\N	\N	\N	\N	\N
7649	2429	5	\N	\N	\N	\N	\N	\N
7650	2433	5	\N	\N	\N	\N	\N	\N
7651	2430	5	\N	\N	\N	\N	\N	\N
7652	2432	5	\N	\N	\N	\N	\N	\N
7653	2434	5	\N	\N	\N	\N	\N	\N
7654	2436	5	\N	\N	\N	\N	\N	\N
7655	2438	5	\N	\N	\N	\N	\N	\N
7656	2435	5	\N	\N	\N	\N	\N	\N
7657	2437	5	\N	\N	\N	\N	\N	\N
7658	2441	5	\N	\N	\N	\N	\N	\N
7659	2439	5	\N	\N	\N	\N	\N	\N
7660	2440	5	\N	\N	\N	\N	\N	\N
7661	2445	5	\N	\N	\N	\N	\N	\N
7662	2443	5	\N	\N	\N	\N	\N	\N
7663	2444	5	\N	\N	\N	\N	\N	\N
7664	2447	5	\N	\N	\N	\N	\N	\N
7665	2448	5	\N	\N	\N	\N	\N	\N
7666	2450	5	\N	\N	\N	\N	\N	\N
7667	2446	5	\N	\N	\N	\N	\N	\N
7668	2452	5	\N	\N	\N	\N	\N	\N
7669	2453	5	\N	\N	\N	\N	\N	\N
7670	2454	5	\N	\N	\N	\N	\N	\N
7671	2455	5	\N	\N	\N	\N	\N	\N
7672	2456	5	\N	\N	\N	\N	\N	\N
7673	2457	5	\N	\N	\N	\N	\N	\N
7674	2458	5	\N	\N	\N	\N	\N	\N
7675	2459	5	\N	\N	\N	\N	\N	\N
7676	2460	5	\N	\N	\N	\N	\N	\N
7677	2461	5	\N	\N	\N	\N	\N	\N
7678	2462	5	\N	\N	\N	\N	\N	\N
7679	2464	5	\N	\N	\N	\N	\N	\N
7680	2465	5	\N	\N	\N	\N	\N	\N
7681	2466	5	\N	\N	\N	\N	\N	\N
7682	2467	5	\N	\N	\N	\N	\N	\N
7683	2468	5	\N	\N	\N	\N	\N	\N
7684	2469	5	\N	\N	\N	\N	\N	\N
7685	2473	5	\N	\N	\N	\N	\N	\N
7686	2470	5	\N	\N	\N	\N	\N	\N
7687	2472	5	\N	\N	\N	\N	\N	\N
7688	2471	5	\N	\N	\N	\N	\N	\N
7689	2476	5	\N	\N	\N	\N	\N	\N
7690	2474	5	\N	\N	\N	\N	\N	\N
7691	2475	5	\N	\N	\N	\N	\N	\N
7692	2479	5	\N	\N	\N	\N	\N	\N
7693	2477	5	\N	\N	\N	\N	\N	\N
7694	2478	5	\N	\N	\N	\N	\N	\N
7695	2480	5	\N	\N	\N	\N	\N	\N
7696	2481	5	\N	\N	\N	\N	\N	\N
7697	2482	5	\N	\N	\N	\N	\N	\N
7698	2483	5	\N	\N	\N	\N	\N	\N
7699	2484	5	\N	\N	\N	\N	\N	\N
7700	2485	5	\N	\N	\N	\N	\N	\N
7701	2486	5	\N	\N	\N	\N	\N	\N
7702	2487	5	\N	\N	\N	\N	\N	\N
7703	2488	5	\N	\N	\N	\N	\N	\N
7704	2489	5	\N	\N	\N	\N	\N	\N
7705	2490	5	\N	\N	\N	\N	\N	\N
7706	2491	5	\N	\N	\N	\N	\N	\N
7707	2492	5	\N	\N	\N	\N	\N	\N
7708	2495	5	\N	\N	\N	\N	\N	\N
7709	2496	5	\N	\N	\N	\N	\N	\N
7710	2493	5	\N	\N	\N	\N	\N	\N
7711	2498	5	\N	\N	\N	\N	\N	\N
7712	2499	5	\N	\N	\N	\N	\N	\N
7713	2500	5	\N	\N	\N	\N	\N	\N
7714	2497	5	\N	\N	\N	\N	\N	\N
7715	2501	5	\N	\N	\N	\N	\N	\N
7716	2502	5	\N	\N	\N	\N	\N	\N
7717	2503	5	\N	\N	\N	\N	\N	\N
7718	2504	5	\N	\N	\N	\N	\N	\N
7719	2505	5	\N	\N	\N	\N	\N	\N
7720	2506	5	\N	\N	\N	\N	\N	\N
7721	2507	5	\N	\N	\N	\N	\N	\N
7722	2508	5	\N	\N	\N	\N	\N	\N
7723	2509	5	\N	\N	\N	\N	\N	\N
7724	2510	5	\N	\N	\N	\N	\N	\N
7725	2511	5	\N	\N	\N	\N	\N	\N
7726	2512	5	\N	\N	\N	\N	\N	\N
7727	2513	5	\N	\N	\N	\N	\N	\N
7728	2514	5	\N	\N	\N	\N	\N	\N
7729	2515	5	\N	\N	\N	\N	\N	\N
7730	2516	5	\N	\N	\N	\N	\N	\N
7731	2517	5	\N	\N	\N	\N	\N	\N
7732	2518	5	\N	\N	\N	\N	\N	\N
7733	2519	5	\N	\N	\N	\N	\N	\N
7734	2520	5	\N	\N	\N	\N	\N	\N
7735	2521	5	\N	\N	\N	\N	\N	\N
7736	2522	5	\N	\N	\N	\N	\N	\N
7737	2523	5	\N	\N	\N	\N	\N	\N
7738	2524	5	\N	\N	\N	\N	\N	\N
7739	2525	5	\N	\N	\N	\N	\N	\N
7740	2526	5	\N	\N	\N	\N	\N	\N
7741	2527	5	\N	\N	\N	\N	\N	\N
7742	2528	5	\N	\N	\N	\N	\N	\N
7743	2529	5	\N	\N	\N	\N	\N	\N
7744	2530	5	\N	\N	\N	\N	\N	\N
7745	2531	5	\N	\N	\N	\N	\N	\N
7746	2532	5	\N	\N	\N	\N	\N	\N
7747	2533	5	\N	\N	\N	\N	\N	\N
7748	2534	5	\N	\N	\N	\N	\N	\N
7749	2535	5	\N	\N	\N	\N	\N	\N
7750	2536	5	\N	\N	\N	\N	\N	\N
7751	2537	5	\N	\N	\N	\N	\N	\N
7752	2538	5	\N	\N	\N	\N	\N	\N
7753	2539	5	\N	\N	\N	\N	\N	\N
7754	2540	5	\N	\N	\N	\N	\N	\N
7755	2541	5	\N	\N	\N	\N	\N	\N
7756	2542	5	\N	\N	\N	\N	\N	\N
7757	2543	5	\N	\N	\N	\N	\N	\N
7758	2544	5	\N	\N	\N	\N	\N	\N
7759	2545	5	\N	\N	\N	\N	\N	\N
7760	2546	5	\N	\N	\N	\N	\N	\N
7761	2547	5	\N	\N	\N	\N	\N	\N
7762	2548	5	\N	\N	\N	\N	\N	\N
7763	2549	5	\N	\N	\N	\N	\N	\N
7764	2550	5	\N	\N	\N	\N	\N	\N
7765	2551	5	\N	\N	\N	\N	\N	\N
7766	2552	5	\N	\N	\N	\N	\N	\N
7767	2553	5	\N	\N	\N	\N	\N	\N
7768	2554	5	\N	\N	\N	\N	\N	\N
7769	2555	5	\N	\N	\N	\N	\N	\N
7770	2556	5	\N	\N	\N	\N	\N	\N
7771	2557	5	\N	\N	\N	\N	\N	\N
7772	2558	5	\N	\N	\N	\N	\N	\N
7773	2559	5	\N	\N	\N	\N	\N	\N
7774	2560	5	\N	\N	\N	\N	\N	\N
7775	2561	5	\N	\N	\N	\N	\N	\N
7776	2562	5	\N	\N	\N	\N	\N	\N
7777	2563	5	\N	\N	\N	\N	\N	\N
7778	2564	5	\N	\N	\N	\N	\N	\N
7779	2565	5	\N	\N	\N	\N	\N	\N
7780	2566	5	\N	\N	\N	\N	\N	\N
7781	2567	5	\N	\N	\N	\N	\N	\N
7782	2568	5	\N	\N	\N	\N	\N	\N
7783	2569	5	\N	\N	\N	\N	\N	\N
7784	2570	5	\N	\N	\N	\N	\N	\N
7785	2571	5	\N	\N	\N	\N	\N	\N
7786	2572	5	\N	\N	\N	\N	\N	\N
7787	2573	5	\N	\N	\N	\N	\N	\N
7788	2575	5	\N	\N	\N	\N	\N	\N
7789	2577	5	\N	\N	\N	\N	\N	\N
7790	2578	5	\N	\N	\N	\N	\N	\N
7791	2581	5	\N	\N	\N	\N	\N	\N
7792	2576	5	\N	\N	\N	\N	\N	\N
7793	2584	5	\N	\N	\N	\N	\N	\N
7794	2583	5	\N	\N	\N	\N	\N	\N
7795	2580	5	\N	\N	\N	\N	\N	\N
7796	2579	5	\N	\N	\N	\N	\N	\N
7797	2585	5	\N	\N	\N	\N	\N	\N
7798	2586	5	\N	\N	\N	\N	\N	\N
7799	2582	5	\N	\N	\N	\N	\N	\N
7800	2588	5	\N	\N	\N	\N	\N	\N
7801	2589	5	\N	\N	\N	\N	\N	\N
7802	2587	5	\N	\N	\N	\N	\N	\N
7803	2590	5	\N	\N	\N	\N	\N	\N
7804	2594	5	\N	\N	\N	\N	\N	\N
7805	2595	5	\N	\N	\N	\N	\N	\N
7806	2592	5	\N	\N	\N	\N	\N	\N
7807	2593	5	\N	\N	\N	\N	\N	\N
7808	2591	5	\N	\N	\N	\N	\N	\N
7809	2596	5	\N	\N	\N	\N	\N	\N
7810	2600	5	\N	\N	\N	\N	\N	\N
7811	2598	5	\N	\N	\N	\N	\N	\N
7812	2599	5	\N	\N	\N	\N	\N	\N
7813	2597	5	\N	\N	\N	\N	\N	\N
7814	2601	5	\N	\N	\N	\N	\N	\N
7815	2606	5	\N	\N	\N	\N	\N	\N
7816	2605	5	\N	\N	\N	\N	\N	\N
7817	2604	5	\N	\N	\N	\N	\N	\N
7818	2602	5	\N	\N	\N	\N	\N	\N
7819	2603	5	\N	\N	\N	\N	\N	\N
7820	2607	5	\N	\N	\N	\N	\N	\N
7821	2611	5	\N	\N	\N	\N	\N	\N
7822	2608	5	\N	\N	\N	\N	\N	\N
7823	2609	5	\N	\N	\N	\N	\N	\N
7824	2610	5	\N	\N	\N	\N	\N	\N
7825	2612	5	\N	\N	\N	\N	\N	\N
7826	2618	5	\N	\N	\N	\N	\N	\N
7827	2617	5	\N	\N	\N	\N	\N	\N
7828	2615	5	\N	\N	\N	\N	\N	\N
7829	2614	5	\N	\N	\N	\N	\N	\N
7830	2616	5	\N	\N	\N	\N	\N	\N
7831	2619	5	\N	\N	\N	\N	\N	\N
7832	2625	5	\N	\N	\N	\N	\N	\N
7833	2620	5	\N	\N	\N	\N	\N	\N
7834	2621	5	\N	\N	\N	\N	\N	\N
7835	2624	5	\N	\N	\N	\N	\N	\N
7836	2626	5	\N	\N	\N	\N	\N	\N
7837	2631	5	\N	\N	\N	\N	\N	\N
7838	2628	5	\N	\N	\N	\N	\N	\N
7839	2629	5	\N	\N	\N	\N	\N	\N
7840	2627	5	\N	\N	\N	\N	\N	\N
7841	2630	5	\N	\N	\N	\N	\N	\N
7842	2632	5	\N	\N	\N	\N	\N	\N
7843	2636	5	\N	\N	\N	\N	\N	\N
7844	2635	5	\N	\N	\N	\N	\N	\N
7845	2633	5	\N	\N	\N	\N	\N	\N
7846	2634	5	\N	\N	\N	\N	\N	\N
7847	2637	5	\N	\N	\N	\N	\N	\N
7848	2642	5	\N	\N	\N	\N	\N	\N
7849	2639	5	\N	\N	\N	\N	\N	\N
7850	2641	5	\N	\N	\N	\N	\N	\N
7851	2638	5	\N	\N	\N	\N	\N	\N
7852	2640	5	\N	\N	\N	\N	\N	\N
7853	2643	5	\N	\N	\N	\N	\N	\N
7854	2644	5	\N	\N	\N	\N	\N	\N
7855	2645	5	\N	\N	\N	\N	\N	\N
7856	2646	5	\N	\N	\N	\N	\N	\N
7857	2647	5	\N	\N	\N	\N	\N	\N
7858	2648	5	\N	\N	\N	\N	\N	\N
7859	2649	5	\N	\N	\N	\N	\N	\N
7860	2650	5	\N	\N	\N	\N	\N	\N
7861	2651	5	\N	\N	\N	\N	\N	\N
7862	2652	5	\N	\N	\N	\N	\N	\N
7863	2653	5	\N	\N	\N	\N	\N	\N
7864	2657	5	\N	\N	\N	\N	\N	\N
7865	2656	5	\N	\N	\N	\N	\N	\N
7866	2655	5	\N	\N	\N	\N	\N	\N
7867	2654	5	\N	\N	\N	\N	\N	\N
7868	2658	5	\N	\N	\N	\N	\N	\N
7869	2663	5	\N	\N	\N	\N	\N	\N
7870	2661	5	\N	\N	\N	\N	\N	\N
7871	2659	5	\N	\N	\N	\N	\N	\N
7872	2662	5	\N	\N	\N	\N	\N	\N
7873	2660	5	\N	\N	\N	\N	\N	\N
7874	2664	5	\N	\N	\N	\N	\N	\N
7875	2668	5	\N	\N	\N	\N	\N	\N
7876	2665	5	\N	\N	\N	\N	\N	\N
7877	2666	5	\N	\N	\N	\N	\N	\N
7878	2667	5	\N	\N	\N	\N	\N	\N
7879	2669	5	\N	\N	\N	\N	\N	\N
7880	2674	5	\N	\N	\N	\N	\N	\N
7881	2671	5	\N	\N	\N	\N	\N	\N
7882	2670	5	\N	\N	\N	\N	\N	\N
7883	2673	5	\N	\N	\N	\N	\N	\N
7884	2672	5	\N	\N	\N	\N	\N	\N
7885	2675	5	\N	\N	\N	\N	\N	\N
7886	2678	5	\N	\N	\N	\N	\N	\N
7887	2679	5	\N	\N	\N	\N	\N	\N
7888	2677	5	\N	\N	\N	\N	\N	\N
7889	2676	5	\N	\N	\N	\N	\N	\N
7890	2680	5	\N	\N	\N	\N	\N	\N
7891	2685	5	\N	\N	\N	\N	\N	\N
7892	2681	5	\N	\N	\N	\N	\N	\N
7893	2683	5	\N	\N	\N	\N	\N	\N
7894	2682	5	\N	\N	\N	\N	\N	\N
7895	2684	5	\N	\N	\N	\N	\N	\N
7896	2686	5	\N	\N	\N	\N	\N	\N
7897	2690	5	\N	\N	\N	\N	\N	\N
7898	2688	5	\N	\N	\N	\N	\N	\N
7899	2689	5	\N	\N	\N	\N	\N	\N
7900	2687	5	\N	\N	\N	\N	\N	\N
7901	2691	5	\N	\N	\N	\N	\N	\N
7902	2694	5	\N	\N	\N	\N	\N	\N
7903	2692	5	\N	\N	\N	\N	\N	\N
7904	2693	5	\N	\N	\N	\N	\N	\N
7905	2695	5	\N	\N	\N	\N	\N	\N
7906	2703	5	\N	\N	\N	\N	\N	\N
7907	2701	5	\N	\N	\N	\N	\N	\N
7908	2699	5	\N	\N	\N	\N	\N	\N
7909	2702	5	\N	\N	\N	\N	\N	\N
7910	2698	5	\N	\N	\N	\N	\N	\N
7911	2696	5	\N	\N	\N	\N	\N	\N
7912	2704	5	\N	\N	\N	\N	\N	\N
7913	2708	5	\N	\N	\N	\N	\N	\N
7914	2705	5	\N	\N	\N	\N	\N	\N
7915	2706	5	\N	\N	\N	\N	\N	\N
7916	2709	5	\N	\N	\N	\N	\N	\N
7917	2715	5	\N	\N	\N	\N	\N	\N
7918	2710	5	\N	\N	\N	\N	\N	\N
7919	2712	5	\N	\N	\N	\N	\N	\N
7920	2711	5	\N	\N	\N	\N	\N	\N
7921	2713	5	\N	\N	\N	\N	\N	\N
7922	2714	5	\N	\N	\N	\N	\N	\N
7923	2717	5	\N	\N	\N	\N	\N	\N
7924	2719	5	\N	\N	\N	\N	\N	\N
7925	2720	5	\N	\N	\N	\N	\N	\N
7926	2718	5	\N	\N	\N	\N	\N	\N
7927	2721	5	\N	\N	\N	\N	\N	\N
7928	2727	5	\N	\N	\N	\N	\N	\N
7929	2722	5	\N	\N	\N	\N	\N	\N
7930	2723	5	\N	\N	\N	\N	\N	\N
7931	2724	5	\N	\N	\N	\N	\N	\N
7932	2725	5	\N	\N	\N	\N	\N	\N
7933	2726	5	\N	\N	\N	\N	\N	\N
7934	2729	5	\N	\N	\N	\N	\N	\N
7935	2732	5	\N	\N	\N	\N	\N	\N
7936	2730	5	\N	\N	\N	\N	\N	\N
7937	2731	5	\N	\N	\N	\N	\N	\N
7938	2733	5	\N	\N	\N	\N	\N	\N
7939	2739	5	\N	\N	\N	\N	\N	\N
7940	2736	5	\N	\N	\N	\N	\N	\N
7941	2735	5	\N	\N	\N	\N	\N	\N
7942	2738	5	\N	\N	\N	\N	\N	\N
7943	2734	5	\N	\N	\N	\N	\N	\N
7944	2737	5	\N	\N	\N	\N	\N	\N
7945	2740	5	\N	\N	\N	\N	\N	\N
7946	2743	5	\N	\N	\N	\N	\N	\N
7947	2741	5	\N	\N	\N	\N	\N	\N
7948	2742	5	\N	\N	\N	\N	\N	\N
7949	2744	5	\N	\N	\N	\N	\N	\N
7950	2749	5	\N	\N	\N	\N	\N	\N
7951	2747	5	\N	\N	\N	\N	\N	\N
7952	2750	5	\N	\N	\N	\N	\N	\N
7953	2746	5	\N	\N	\N	\N	\N	\N
7954	2748	5	\N	\N	\N	\N	\N	\N
7955	2752	5	\N	\N	\N	\N	\N	\N
7956	2751	5	\N	\N	\N	\N	\N	\N
7957	2755	5	\N	\N	\N	\N	\N	\N
7958	2753	5	\N	\N	\N	\N	\N	\N
7959	2754	5	\N	\N	\N	\N	\N	\N
7960	2756	5	\N	\N	\N	\N	\N	\N
7961	2761	5	\N	\N	\N	\N	\N	\N
7962	2762	5	\N	\N	\N	\N	\N	\N
7963	2757	5	\N	\N	\N	\N	\N	\N
7964	2758	5	\N	\N	\N	\N	\N	\N
7965	2759	5	\N	\N	\N	\N	\N	\N
7966	2760	5	\N	\N	\N	\N	\N	\N
7967	2763	5	\N	\N	\N	\N	\N	\N
7968	2766	5	\N	\N	\N	\N	\N	\N
7969	2764	5	\N	\N	\N	\N	\N	\N
7970	2765	5	\N	\N	\N	\N	\N	\N
7971	2767	5	\N	\N	\N	\N	\N	\N
7972	2771	5	\N	\N	\N	\N	\N	\N
7973	2772	5	\N	\N	\N	\N	\N	\N
7974	2768	5	\N	\N	\N	\N	\N	\N
7975	2769	5	\N	\N	\N	\N	\N	\N
7976	2770	5	\N	\N	\N	\N	\N	\N
7977	2774	5	\N	\N	\N	\N	\N	\N
7978	2773	5	\N	\N	\N	\N	\N	\N
7979	2777	5	\N	\N	\N	\N	\N	\N
7980	2775	5	\N	\N	\N	\N	\N	\N
7981	2776	5	\N	\N	\N	\N	\N	\N
7982	2778	5	\N	\N	\N	\N	\N	\N
7983	2827	5	\N	\N	\N	\N	\N	\N
7984	2825	5	\N	\N	\N	\N	\N	\N
7985	2779	5	\N	\N	\N	\N	\N	\N
7986	2780	5	\N	\N	\N	\N	\N	\N
7987	2826	5	\N	\N	\N	\N	\N	\N
7988	2829	5	\N	\N	\N	\N	\N	\N
7989	2828	5	\N	\N	\N	\N	\N	\N
7990	2833	5	\N	\N	\N	\N	\N	\N
7991	2831	5	\N	\N	\N	\N	\N	\N
7992	2830	5	\N	\N	\N	\N	\N	\N
7993	2834	5	\N	\N	\N	\N	\N	\N
7994	2839	5	\N	\N	\N	\N	\N	\N
7995	2835	5	\N	\N	\N	\N	\N	\N
7996	2836	5	\N	\N	\N	\N	\N	\N
7997	2837	5	\N	\N	\N	\N	\N	\N
7998	2838	5	\N	\N	\N	\N	\N	\N
7999	2841	5	\N	\N	\N	\N	\N	\N
8000	2842	5	\N	\N	\N	\N	\N	\N
8001	2840	5	\N	\N	\N	\N	\N	\N
8002	2844	5	\N	\N	\N	\N	\N	\N
8003	2843	5	\N	\N	\N	\N	\N	\N
8004	2845	5	\N	\N	\N	\N	\N	\N
8005	2850	5	\N	\N	\N	\N	\N	\N
8006	2847	5	\N	\N	\N	\N	\N	\N
8007	2846	5	\N	\N	\N	\N	\N	\N
8008	2848	5	\N	\N	\N	\N	\N	\N
8009	2849	5	\N	\N	\N	\N	\N	\N
8010	2851	5	\N	\N	\N	\N	\N	\N
8011	2852	5	\N	\N	\N	\N	\N	\N
8012	2855	5	\N	\N	\N	\N	\N	\N
8013	2853	5	\N	\N	\N	\N	\N	\N
8014	2854	5	\N	\N	\N	\N	\N	\N
8015	2856	5	\N	\N	\N	\N	\N	\N
8016	2857	5	\N	\N	\N	\N	\N	\N
8017	2858	5	\N	\N	\N	\N	\N	\N
8018	2859	5	\N	\N	\N	\N	\N	\N
8019	2862	5	\N	\N	\N	\N	\N	\N
8020	2866	5	\N	\N	\N	\N	\N	\N
8021	2861	5	\N	\N	\N	\N	\N	\N
8022	2867	5	\N	\N	\N	\N	\N	\N
8023	2869	5	\N	\N	\N	\N	\N	\N
8024	2868	5	\N	\N	\N	\N	\N	\N
8025	2870	5	\N	\N	\N	\N	\N	\N
4155	2099	3	0.0002934754	5969.6126518656	113702.0000000000	-0.20	-4.38	-12.65
3563	1168	3	0.0133878256	1476.0195597412	95666.0000000000	-0.13	-1.59	-9.46
620	1684	1	10.2174000000	82673300.0000000000	905920826.0000000000	0.30	-3.55	-7.47
1287	2492	1	26.2622000000	7276850.0000000000	137248948.0000000000	0.37	-5.90	-12.72
639	1710	1	61.1713000000	999438.0000000000	124584249.0000000000	1.74	-10.67	-14.76
1218	2416	1	0.1592630000	14545200.0000000000	105735134.0000000000	5.68	1.97	-6.07
3214	1	3	1.0000000000	530765.2816090836	17107850.0000000000	0.00	0.00	0.00
320	1087	1	11.7804000000	272820.0000000000	103020800.0000000000	0.69	-2.12	9.36
657	1727	1	3.4310900000	6349370.0000000000	172736166.0000000000	0.39	-3.98	0.45
1110	2299	1	0.6462350000	10345200.0000000000	161558750.0000000000	-0.03	-7.04	-6.07
1402	2608	1	0.4310590000	35599600.0000000000	132122610.0000000000	0.20	-4.94	15.35
674	1757	1	0.0287616000	8569110.0000000000	144120011.0000000000	0.68	15.99	8.37
3511	1027	3	0.0777082114	231865.5544695685	7788341.0000000000	0.22	-2.54	0.61
4034	1958	3	0.0000071499	30522.9551553868	470095.0000000000	0.27	-2.30	4.57
3453	825	3	0.0001499356	328383.0284669971	390903.0000000000	-0.20	1.76	-0.98
3928	1808	3	0.0013381404	2408.6860338239	136547.0000000000	0.01	-1.05	-5.32
3375	463	3	0.0000236655	752.1310209293	62367.0000000000	-0.12	-1.38	-4.27
435	1376	1	37.0335000000	71521000.0000000000	2407177500.0000000000	0.40	-5.91	-7.92
737	1839	1	16.7215000000	128129000.0000000000	1906941433.0000000000	-0.14	2.20	12.46
419	1321	1	17.2458000000	369315000.0000000000	1767218085.0000000000	0.38	0.71	23.95
3860	1720	3	0.0001696360	7124.4725769974	471508.0000000000	-0.24	-1.69	-11.29
3645	1376	3	0.0055430492	10705.0218004002	360298.0000000000	0.19	-4.32	-8.60
3629	1321	3	0.0025812931	55277.8222649965	264511.0000000000	0.17	2.41	23.04
945	2099	1	1.9607300000	39883400.0000000000	759648251.0000000000	0.01	-5.97	-12.00
369	1214	1	6.0879700000	7864460.0000000000	652612705.0000000000	0.36	-4.37	-10.67
353	1168	1	89.4450000000	9861390.0000000000	639150975.0000000000	0.08	-3.22	-8.79
1264	2469	1	0.0832396000	25081100.0000000000	630614340.0000000000	0.78	-5.58	-9.16
760	1866	1	0.4919540000	61930900.0000000000	493183528.0000000000	-0.28	-5.34	-6.04
211	693	1	0.0279471000	6548940.0000000000	420724462.0000000000	1.62	-5.28	-6.57
395	1274	1	3.4846000000	23626300.0000000000	348460000.0000000000	0.39	-6.26	-2.62
165	463	1	0.1581110000	5025040.0000000000	416677824.0000000000	0.09	-3.02	-3.56
878	2021	1	0.9370830000	778071.0000000000	337921329.0000000000	0.70	-7.25	-10.49
898	2044	1	1.7177200000	5659220.0000000000	128547588.0000000000	2.74	-0.86	19.51
1388	2591	1	0.0058641800	356472.0000000000	114288146.0000000000	0.20	2.43	0.15
1035	2213	1	0.3171750000	1432600.0000000000	111011250.0000000000	0.22	-6.85	-9.85
938	2092	1	2.5307900000	2119810.0000000000	101231600.0000000000	-0.34	-6.03	-6.19
1152	2346	1	0.5853230000	13216200.0000000000	102665654.0000000000	-0.54	-5.77	-37.55
3936	1831	3	0.1280763411	58468.9278813124	2202486.0000000000	0.29	-3.03	-3.59
476	1455	1	0.3572470000	4054440.0000000000	299816687.0000000000	0.44	-4.62	-8.08
933	2087	1	2.7479800000	1432620.0000000000	249325808.0000000000	1.10	4.72	7.37
1207	2405	1	0.0301977000	30977800.0000000000	253660680.0000000000	0.00	-5.91	9.06
679	1759	1	0.0708065000	6083710.0000000000	245732810.0000000000	0.06	-4.00	-9.91
803	1925	1	7.8483800000	5258550.0000000000	244430727.0000000000	-0.21	-5.93	-12.08
807	1934	1	0.3602790000	4657700.0000000000	206106264.0000000000	0.60	-6.58	-4.12
63	118	1	0.0059417100	3221180.0000000000	171173019.0000000000	0.01	-7.39	13.44
95	213	1	2.6228500000	479206.0000000000	158245130.0000000000	0.32	-1.55	-5.19
834	1966	1	0.0962215000	6882540.0000000000	101046191.0000000000	0.33	-8.81	-2.93
3893	1765	3	0.0015322845	90401.5374782782	1373156.0000000000	-0.02	-2.51	-8.34
4	1	1	6681.0700000000	3546080000.0000000000	114298743400.0000000000	0.21	-1.66	0.74
301	1027	1	519.1740000000	1549110000.0000000000	52034452142.0000000000	0.43	-4.16	1.36
683	1765	1	10.2373000000	603979000.0000000000	9174151196.0000000000	0.19	-4.13	-7.66
3842	1700	3	0.0003659863	1004.0607267997	85282.0000000000	-0.55	-3.56	-8.75
4474	2469	3	0.0000124590	3754.0543655432	94388.0000000000	0.57	-3.99	-9.83
131	328	1	122.1610000000	28553400.0000000000	1973425809.0000000000	0.89	-1.31	-6.09
783	1904	1	3.1232100000	58179600.0000000000	1709943500.0000000000	0.21	-2.53	5.17
3991	1896	3	0.0001234527	1191.0786745237	65641.0000000000	0.39	-5.32	-12.22
3593	1230	3	0.0002313896	266.4079256766	60770.0000000000	0.24	-1.59	-11.94
4142	2083	3	0.0046645223	1607.1976494783	79671.0000000000	-0.59	-2.44	-9.18
558	1586	1	1.5586600000	762003.0000000000	161097521.0000000000	0.10	-2.09	-7.70
3341	328	3	0.0182846460	4273.7765058591	295376.0000000000	0.68	0.36	-6.78
3466	873	3	0.0000281958	2203.4344798064	253762.0000000000	0.47	-1.24	-7.20
630	1697	1	0.2949950000	8225670.0000000000	294995000.0000000000	3.25	7.28	34.17
1368	2575	1	14.3618000000	262630.0000000000	293950719.0000000000	0.68	-6.15	-8.75
846	1984	1	0.2589680000	1817510.0000000000	99190182.0000000000	-0.88	-8.69	-7.75
1201	2403	1	4.2535600000	217004.0000000000	152690275.0000000000	0.40	-7.35	-3.19
726	1831	1	855.6870000000	390635000.0000000000	14714960545.0000000000	0.50	-4.64	-2.87
870	2010	1	0.1555720000	39326200.0000000000	4033526218.0000000000	-0.08	-4.23	-8.03
29	52	1	0.5288580000	204426000.0000000000	20755193341.0000000000	0.29	-2.90	-4.52
256	873	1	0.1883780000	14721300.0000000000	1695402000.0000000000	0.68	-2.88	-6.51
1360	2566	1	6.1812200000	79942300.0000000000	935170217.0000000000	0.70	-6.77	-0.13
3535	1104	3	0.0051344470	240.4569926673	56479.0000000000	-1.75	-3.67	0.12
4578	2575	3	0.0021496257	39.3095716704	43998.0000000000	0.47	-4.56	-9.42
4125	2062	3	0.0001939555	337.3756000162	32484.0000000000	-0.63	-3.67	-17.73
3329	291	3	0.0000547942	313.8853506998	24797.0000000000	0.07	-0.70	7.97
4598	2591	3	0.0000008777	53.3555253874	17106.0000000000	-0.01	4.16	-0.59
4148	2092	3	0.0003788001	317.2860035892	15152.0000000000	-0.54	-4.44	-6.88
1606	2	2	81.6347975883	270530577.0887166000	4660041003.0000000000	0.73	-3.59	-4.88
2869	2469	2	0.0716964686	21603014.6425495260	543164806.0000000000	0.78	-5.58	-9.16
1664	109	2	0.0216695952	1573746.7700258396	225869205.0000000000	0.04	-3.79	-11.23
2520	2062	2	1.1161326443	1941455.6416881997	186930537.0000000000	-0.43	-5.27	-17.12
2806	2403	2	3.6637037037	186911.2833763996	131516172.0000000000	0.40	-7.35	-3.19
2757	2346	2	0.5041541774	11383462.5322997400	88428643.0000000000	-0.54	-5.77	-37.55
3757	1567	3	0.0004356667	2488.9875424146	58052.0000000000	2.13	0.84	1.01
3635	1343	3	0.0004409668	407.5350205880	43614.0000000000	-0.11	-0.71	-10.13
4143	2087	3	0.0004113084	214.4297245800	37318.0000000000	0.89	6.49	6.58
3849	1710	3	0.0091559136	149.5925053921	18647.0000000000	1.53	-9.16	-15.39
4428	2416	3	0.0000238379	2177.0764263808	15826.0000000000	5.46	3.69	-6.76
2429	1958	2	0.0411448751	175646856.1584840400	2705197842.0000000000	0.48	-3.92	5.35
2550	2099	2	1.6888285960	34352627.0456502960	654305126.0000000000	0.01	-5.97	-12.00
1770	463	2	0.1361851852	4328199.8277347110	358895628.0000000000	0.09	-3.02	-3.56
2310	1789	2	6.2408268734	4322859.6037898360	230935725.0000000000	-0.30	-6.73	-17.59
1724	291	2	0.3153178295	1806279.0697674416	142697844.0000000000	0.28	-2.35	8.77
3007	2608	2	0.3712825151	30662876.8303186900	113800698.0000000000	0.20	-4.94	15.35
2993	2591	2	0.0050509733	307038.7596899224	98439402.0000000000	0.20	2.43	0.15
2543	2092	2	2.1798363480	1825848.4065460807	87193454.0000000000	-0.34	-6.03	-6.19
4254	2222	3	0.0003391672	155.6038179513	52149.0000000000	-0.19	-1.65	-10.69
4320	2299	3	0.0000967263	1548.4346070315	24182.0000000000	-0.24	-5.47	-6.76
4362	2346	3	0.0000876092	1978.1561935438	15367.0000000000	-0.74	-4.18	-38.01
1848	825	2	0.8628165375	1889707149.0094745000	2249483806.0000000000	0.01	0.07	-0.25
2965	2566	2	5.3240482343	68856416.8819982700	805486837.0000000000	0.70	-6.77	-0.13
2386	1896	2	0.7104186047	6854160.2067183460	377738513.0000000000	0.60	-6.89	-11.57
2235	1697	2	0.2540869940	7084987.0801033580	254086994.0000000000	3.25	7.28	34.17
1700	213	2	2.2591300603	412752.7993109388	136300715.0000000000	0.32	-1.55	-5.19
2451	1984	2	0.2230559862	1565469.4229112833	85435127.0000000000	-0.88	-8.69	-7.75
3605	1274	3	0.0005215632	3536.3048134505	52156.0000000000	0.18	-4.68	-3.34
3840	1697	3	0.0000441539	1231.1905128969	44154.0000000000	3.04	9.09	33.18
4411	2403	3	0.0006366585	32.4804260395	22854.0000000000	0.19	-5.78	-3.90
3935	1817	3	0.0002228191	303.7956494993	17124.0000000000	1.13	-4.37	-21.46
1634	52	2	0.4555193798	176077519.3798449300	17876996848.0000000000	0.29	-2.90	-4.52
2073	1437	2	162.9035314384	38101291.9896640800	682701210.0000000000	0.44	-3.60	-3.77
3723	1518	3	0.0848380574	5.3538729575	52449.0000000000	-0.13	-0.25	-8.38
4002	1908	3	0.0007923746	5001.6838620161	36053.0000000000	-0.55	-1.39	-5.09
2331	1831	2	737.0258397933	336464254.9526270000	12674384621.0000000000	0.50	-4.64	-2.87
2040	1376	2	31.8979328165	61602928.5099052500	2073365633.0000000000	0.40	-5.91	-7.92
2537	2083	2	26.8423772610	9248751.0766580530	458474141.0000000000	-0.39	-4.06	-8.51
2284	1759	2	0.0609875108	5240060.2928509900	211656167.0000000000	0.06	-4.00	-9.91
2163	1586	2	1.3425150732	656333.3333333333	138757554.0000000000	0.10	-2.09	-7.70
2448	1982	2	0.8217777778	4273083.5486649430	110227270.0000000000	0.81	-3.83	-7.45
4534	2530	3	0.0005674615	634.1050161127	16845.0000000000	0.70	-6.23	-16.71
4499	2496	3	0.0000538751	484.0392332366	14892.0000000000	-0.02	-1.13	-13.15
1777	512	2	0.1951739879	32090869.9397071450	3661350854.0000000000	0.71	-3.20	-5.35
2024	1321	2	14.8542635659	318100775.1937984000	1522151666.0000000000	0.38	0.71	23.95
1816	693	2	0.0240715762	5640775.1937984490	362381104.0000000000	1.62	-5.28	-6.57
2397	1908	2	4.5597846684	28782601.2058570160	207470202.0000000000	-0.35	-3.03	-4.39
2489	2027	2	3.2946856158	1171042.2049956932	149358527.0000000000	-0.15	-2.25	0.82
4605	2606	3	0.0004360559	776.5552523772	46288.0000000000	0.80	-6.60	-7.65
3889	1759	3	0.0000105981	910.5891720937	36780.0000000000	-0.15	-2.38	-10.57
3269	109	3	0.0000037656	273.4771526118	39250.0000000000	-0.17	-2.16	-11.88
2288	1765	2	8.8176571921	520223083.5486649000	7901939015.0000000000	0.19	-4.13	-7.66
2342	1839	2	14.4026701120	110360895.7795004200	1642499081.0000000000	-0.14	2.20	12.46
2152	1567	2	2.5070801034	14323083.5486649420	334064135.0000000000	2.34	-0.84	1.76
3000	2606	2	2.5093195521	4468751.0766580530	266370525.0000000000	1.01	-8.15	-6.96
2901	2502	2	4.0818518519	65127304.0482342800	204093409.0000000000	-0.12	-5.21	6.47
2279	1757	2	0.0247731266	7380801.0335917305	124134377.0000000000	0.68	15.99	8.37
2894	2496	2	0.3100284238	2785443.5831180015	85698090.0000000000	0.19	-2.77	-12.51
4056	1984	3	0.0000387336	271.8434549281	14836.0000000000	-1.20	-7.21	-8.49
4417	2405	3	0.0000045199	4636.6525122473	37967.0000000000	-0.21	-4.32	8.26
3768	1586	3	0.0002332950	114.0540362547	24113.0000000000	-0.11	-0.44	-8.38
4590	2588	3	0.0000256830	343.1531176892	15492.0000000000	0.01	-6.67	-28.90
1906	1027	2	447.1782945736	1334289405.6847544000	44818649563.0000000000	0.43	-4.16	1.36
1736	328	2	105.2204995693	24593798.4496124000	1699763832.0000000000	0.89	-1.31	-6.09
1958	1168	2	77.0413436693	8493875.9689922480	550517635.0000000000	0.08	-3.22	-8.79
1930	1104	2	29.5465977606	1383729.5434969852	325012575.0000000000	-1.55	-5.27	0.86
2538	2087	2	2.3669078381	1233953.4883720928	214750911.0000000000	1.10	4.72	7.37
2715	2299	2	0.5566192937	8910594.3152454770	139154823.0000000000	-0.03	-7.04	-6.07
3994	1903	3	0.0008106920	3173.2940981011	34972.0000000000	0.06	-4.63	-7.20
4044	1966	3	0.0000144021	1030.1553493677	15124.0000000000	0.12	-7.27	-3.65
2475	2010	2	0.1339982773	33872695.9517657160	3474182789.0000000000	-0.08	-4.23	-8.03
1988	1230	2	1.3315503876	1533066.3221360894	349703856.0000000000	0.45	-3.22	-11.29
2389	1903	2	4.6651937984	18260981.9121447020	201251557.0000000000	0.27	-6.21	-6.51
2929	2530	2	3.2655038760	3649009.4745908696	96934299.0000000000	0.91	-7.79	-16.09
1925	1087	2	10.1467700258	234987.0801033592	88734539.0000000000	0.69	-2.12	9.36
547	1567	1	2.9107200000	16629100.0000000000	387848460.0000000000	2.34	-0.84	1.76
325	1104	1	34.3036000000	1606510.0000000000	377339600.0000000000	-1.55	-5.27	0.86
2000	1274	2	3.0013781223	20349956.9336778630	300137812.0000000000	0.39	-6.26	-2.62
2649	2222	2	1.9517657192	895434.9698535744	300097398.0000000000	0.02	-3.28	-10.03
2081	1455	2	0.3077062877	3492196.3824289404	258240040.0000000000	0.44	-4.62	-8.08
2812	2405	2	0.0260100775	26681998.2773471140	218484651.0000000000	0.00	-5.91	9.06
2412	1934	2	0.3103178295	4011800.1722652884	177524775.0000000000	0.60	-6.58	-4.12
2262	1727	2	2.9552885444	5468880.2756244615	148782228.0000000000	0.39	-3.98	0.45
2025	1320	2	0.1486985357	1053695.0904392763	148549762.0000000000	0.72	-3.59	-10.86
2982	2585	2	0.1442532300	435202.4117140396	113730783.0000000000	4.16	62.89	40.73
2301	1785	2	11.0480620155	3031731.2661498706	111898916.0000000000	-0.25	-5.40	-8.48
1792	558	2	2.3352627046	1692394.4875107664	97879286.0000000000	-0.12	-1.08	8.42
3036	2638	2	0.6514401378	20158484.0654608100	97580819.0000000000	-0.23	-3.94	-3.86
2833	2428	2	0.3030068906	1300999.1386735572	90919326.0000000000	1.96	-9.55	-2.32
2439	1966	2	0.0828781223	5928113.6950904390	87033756.0000000000	0.33	-8.81	-2.93
1044	2222	1	2.2660000000	1039600.0000000000	348413079.0000000000	0.02	-3.28	-10.03
425	1343	1	2.9461300000	2722770.0000000000	291386396.0000000000	0.10	-2.36	-9.46
59	109	1	0.0251584000	1827120.0000000000	262234147.0000000000	0.04	-3.79	-11.23
1062	2246	1	0.1918620000	18542800.0000000000	132856753.0000000000	-0.30	-8.62	-12.73
187	558	1	2.7112400000	1964870.0000000000	113637851.0000000000	-0.12	-1.08	8.42
1431	2638	1	0.7563220000	23404000.0000000000	113291331.0000000000	-0.23	-3.94	-3.86
1380	2588	1	0.1715900000	2292630.0000000000	103500013.0000000000	0.22	-8.22	-28.37
1289	2496	1	0.3599430000	3233900.0000000000	99495483.0000000000	0.19	-2.77	-12.51
3239	52	3	0.0000791577	30597.7934672141	3106567.0000000000	0.08	-1.26	-5.22
3211	2	3	0.0141860510	47011.3320171769	809797.0000000000	0.52	-1.96	-5.58
3382	512	3	0.0000339163	5576.5768058110	636250.0000000000	0.50	-1.56	-6.05
4080	2010	3	0.0000232855	5886.2128371653	603725.0000000000	-0.28	-2.61	-8.71
3281	131	3	0.0385498131	7477.4699262244	314057.0000000000	-0.01	-1.59	-3.91
4570	2566	3	0.0009251841	11965.4935511827	139973.0000000000	0.49	-5.20	-0.87
3357	372	3	0.0000005263	2223.6108886750	96777.0000000000	1.70	-4.29	-22.38
3517	1042	3	0.0000018550	1466.9850787374	65313.0000000000	-0.77	-1.73	-11.47
4017	1934	3	0.0000539253	697.1488099960	30849.0000000000	0.39	-5.00	-4.83
3867	1727	3	0.0005135540	950.3522639338	25855.0000000000	0.18	-2.36	-0.29
3630	1320	3	0.0000258400	183.1054007816	25814.0000000000	0.51	-1.96	-11.52
1	2	1	94.7780000000	314086000.0000000000	5410307605.0000000000	0.73	-3.59	-4.88
172	512	1	0.2265970000	37257500.0000000000	4250828341.0000000000	0.71	-3.20	-5.35
3884	1757	3	0.0000043049	1282.5954525248	21571.0000000000	0.47	17.95	7.57
4327	2307	3	0.0001976210	6533.6091374585	20620.0000000000	0.55	-3.40	-10.21
4272	2246	3	0.0000287173	2775.4236971024	19886.0000000000	-0.50	-7.08	-13.37
3397	558	3	0.0004058092	294.0951075202	17009.0000000000	-0.32	0.59	7.62
4641	2638	3	0.0001132037	3503.0317000121	16957.0000000000	-0.43	-2.32	-4.57
824	1958	1	0.0477692000	203926000.0000000000	3140734695.0000000000	0.48	-3.92	5.35
1609	1	2	5754.5822566753	3054332472.0068903000	98448530060.0000000000	0.21	-1.66	0.74
1861	873	2	0.1622549526	12679844.9612403080	1460294573.0000000000	0.68	-2.88	-6.51
2225	1684	2	8.8005167959	71208699.3970714800	780293562.0000000000	0.30	-3.55	-7.47
2365	1866	2	0.4237329888	53342721.7915589960	424792014.0000000000	-0.28	-5.34	-6.04
71	131	1	257.5540000000	49957500.0000000000	2098239813.0000000000	0.20	-3.22	-3.20
468	1437	1	189.1310000000	44235600.0000000000	792616105.0000000000	0.44	-3.60	-3.77
781	1896	1	0.8247960000	7957680.0000000000	438554413.0000000000	0.60	-6.89	-11.57
2118	1518	2	488.2075796727	30809.3023255814	301823483.0000000000	0.08	-1.91	-7.70
\.


--
-- Data for Name: price_alert; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price_alert (id, user_id, price_id, upper, price_point, active) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, token) FROM stdin;
\.


--
-- Data for Name: source; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.source (id, name, link) FROM stdin;
2	\N	\N
4	\N	\N
5	\N	\N
7	\N	\N
11	\N	\N
12	\N	\N
13	\N	\N
14	\N	\N
15	\N	\N
16	\N	\N
17	\N	\N
18	\N	\N
19	\N	\N
20	\N	\N
21	\N	\N
22	\N	\N
23	\N	\N
24	\N	\N
25	\N	\N
26	\N	\N
27	\N	\N
28	\N	\N
29	\N	\N
30	\N	\N
31	\N	\N
32	\N	\N
33	\N	\N
34	\N	\N
35	\N	\N
36	\N	\N
37	\N	\N
38	\N	\N
39	\N	\N
40	\N	\N
41	\N	\N
42	\N	\N
43	\N	\N
44	\N	\N
45	\N	\N
46	\N	\N
47	\N	\N
48	\N	\N
49	\N	\N
50	\N	\N
51	\N	\N
52	\N	\N
53	\N	\N
54	\N	\N
55	\N	\N
56	\N	\N
57	\N	\N
58	\N	\N
59	\N	\N
60	\N	\N
61	\N	\N
62	\N	\N
63	\N	\N
64	\N	\N
65	\N	\N
66	\N	\N
67	\N	\N
68	\N	\N
69	\N	\N
70	\N	\N
71	\N	\N
72	\N	\N
73	\N	\N
74	\N	\N
75	\N	\N
76	\N	\N
77	\N	\N
78	\N	\N
79	\N	\N
80	\N	\N
81	\N	\N
82	\N	\N
83	\N	\N
84	\N	\N
85	\N	\N
86	\N	\N
87	\N	\N
88	\N	\N
89	\N	\N
90	\N	\N
91	\N	\N
92	\N	\N
93	\N	\N
94	\N	\N
95	\N	\N
96	\N	\N
97	\N	\N
98	\N	\N
99	\N	\N
100	\N	\N
101	\N	\N
102	\N	\N
103	\N	\N
104	\N	\N
105	\N	\N
106	\N	\N
107	\N	\N
108	\N	\N
109	\N	\N
110	\N	\N
111	\N	\N
112	\N	\N
113	\N	\N
114	\N	\N
115	\N	\N
116	\N	\N
117	\N	\N
118	\N	\N
119	\N	\N
120	\N	\N
121	\N	\N
122	\N	\N
123	\N	\N
124	\N	\N
125	\N	\N
126	\N	\N
127	\N	\N
128	\N	\N
129	\N	\N
130	\N	\N
132	\N	\N
136	\N	\N
137	\N	\N
138	\N	\N
139	\N	\N
140	\N	\N
141	\N	\N
142	\N	\N
143	\N	\N
144	\N	\N
145	\N	\N
146	\N	\N
147	\N	\N
148	\N	\N
149	\N	\N
150	\N	\N
151	\N	\N
152	\N	\N
153	\N	\N
154	\N	\N
155	\N	\N
156	\N	\N
157	\N	\N
158	\N	\N
159	\N	\N
160	\N	\N
161	\N	\N
162	\N	\N
163	\N	\N
164	\N	\N
165	\N	\N
166	\N	\N
167	\N	\N
168	\N	\N
169	\N	\N
170	\N	\N
171	\N	\N
172	\N	\N
173	\N	\N
174	\N	\N
175	\N	\N
176	\N	\N
177	\N	\N
178	\N	\N
179	\N	\N
180	\N	\N
181	\N	\N
182	\N	\N
183	\N	\N
184	\N	\N
185	\N	\N
186	\N	\N
187	\N	\N
188	\N	\N
189	\N	\N
190	\N	\N
191	\N	\N
192	\N	\N
193	\N	\N
194	\N	\N
195	\N	\N
196	\N	\N
197	\N	\N
198	\N	\N
199	\N	\N
200	\N	\N
201	\N	\N
202	\N	\N
203	\N	\N
204	\N	\N
205	\N	\N
206	\N	\N
207	\N	\N
208	\N	\N
209	\N	\N
210	\N	\N
211	\N	\N
212	\N	\N
213	\N	\N
214	\N	\N
215	\N	\N
216	\N	\N
217	\N	\N
218	\N	\N
219	\N	\N
220	\N	\N
221	\N	\N
222	\N	\N
223	\N	\N
224	\N	\N
225	\N	\N
226	\N	\N
1	bitcoin.org	https://bitcoin.org/
6	litecoin.com	https://litecoin.com
135	Telegram	https://t.me/Ripple
227	\N	\N
228	\N	\N
229	\N	\N
230	\N	\N
276	\N	\N
277	\N	\N
278	\N	\N
279	\N	\N
280	\N	\N
326	\N	\N
327	\N	\N
328	\N	\N
329	\N	\N
330	\N	\N
376	\N	\N
377	\N	\N
378	\N	\N
379	\N	\N
380	\N	\N
426	\N	\N
427	\N	\N
428	\N	\N
429	\N	\N
430	\N	\N
476	\N	\N
477	\N	\N
478	\N	\N
479	\N	\N
480	\N	\N
511	\N	\N
512	\N	\N
513	\N	\N
514	\N	\N
515	\N	\N
561	\N	\N
562	\N	\N
563	\N	\N
564	\N	\N
565	\N	\N
611	\N	\N
612	\N	\N
613	\N	\N
614	\N	\N
615	\N	\N
661	\N	\N
662	\N	\N
663	\N	\N
664	\N	\N
665	\N	\N
711	\N	\N
712	\N	\N
713	\N	\N
714	\N	\N
715	\N	\N
761	\N	\N
762	\N	\N
763	\N	\N
764	\N	\N
765	\N	\N
811	\N	\N
812	\N	\N
813	\N	\N
814	\N	\N
815	\N	\N
866	\N	\N
867	\N	\N
868	\N	\N
869	\N	\N
870	\N	\N
926	\N	\N
927	\N	\N
928	\N	\N
929	\N	\N
930	\N	\N
971	\N	\N
972	\N	\N
973	\N	\N
974	\N	\N
975	\N	\N
1021	\N	\N
1022	\N	\N
1023	\N	\N
1024	\N	\N
1025	\N	\N
1071	\N	\N
1072	\N	\N
1073	\N	\N
1074	\N	\N
1075	\N	\N
1121	\N	\N
1122	\N	\N
1123	\N	\N
1124	\N	\N
1125	\N	\N
1171	\N	\N
1172	\N	\N
1173	\N	\N
1174	\N	\N
1175	\N	\N
1221	\N	\N
1222	\N	\N
1223	\N	\N
1224	\N	\N
1225	\N	\N
1271	\N	\N
1272	\N	\N
1273	\N	\N
1274	\N	\N
1275	\N	\N
1321	\N	\N
1322	\N	\N
1323	\N	\N
1324	\N	\N
1325	\N	\N
1371	\N	\N
1372	\N	\N
1373	\N	\N
1374	\N	\N
1375	\N	\N
1421	\N	\N
1422	\N	\N
1423	\N	\N
1424	\N	\N
1425	\N	\N
1471	\N	\N
1472	\N	\N
1473	\N	\N
1474	\N	\N
1475	\N	\N
1521	\N	\N
1522	\N	\N
1523	\N	\N
1524	\N	\N
1525	\N	\N
1571	\N	\N
1572	\N	\N
1573	\N	\N
1574	\N	\N
1575	\N	\N
1621	\N	\N
1622	\N	\N
1623	\N	\N
1624	\N	\N
1625	\N	\N
1671	\N	\N
1672	\N	\N
1673	\N	\N
1674	\N	\N
1675	\N	\N
1716	\N	\N
1717	\N	\N
1718	\N	\N
1719	\N	\N
1720	\N	\N
1766	\N	\N
1767	\N	\N
1768	\N	\N
1769	\N	\N
1770	\N	\N
1816	\N	\N
1817	\N	\N
1818	\N	\N
1819	\N	\N
1820	\N	\N
1851	\N	\N
1852	\N	\N
1853	\N	\N
1854	\N	\N
1855	\N	\N
1906	\N	\N
1907	\N	\N
1908	\N	\N
1909	\N	\N
1910	\N	\N
1946	\N	\N
1947	\N	\N
1948	\N	\N
1949	\N	\N
1950	\N	\N
2001	\N	\N
2002	\N	\N
2003	\N	\N
2004	\N	\N
2005	\N	\N
2056	\N	\N
2057	\N	\N
2058	\N	\N
2059	\N	\N
2060	\N	\N
2106	\N	\N
2107	\N	\N
2108	\N	\N
2109	\N	\N
2110	\N	\N
2166	\N	\N
2167	\N	\N
2168	\N	\N
2169	\N	\N
2170	\N	\N
2231	\N	\N
2232	\N	\N
2233	\N	\N
2234	\N	\N
2235	\N	\N
2281	\N	\N
2282	\N	\N
2283	\N	\N
2284	\N	\N
2285	\N	\N
2326	\N	\N
2327	\N	\N
2328	\N	\N
2329	\N	\N
2330	\N	\N
2376	\N	\N
2377	\N	\N
2378	\N	\N
2379	\N	\N
2380	\N	\N
2426	\N	\N
2427	\N	\N
2428	\N	\N
2429	\N	\N
2430	\N	\N
2476	\N	\N
2477	\N	\N
231	\N	\N
232	\N	\N
233	\N	\N
234	\N	\N
235	\N	\N
281	\N	\N
282	\N	\N
283	\N	\N
284	\N	\N
285	\N	\N
331	\N	\N
332	\N	\N
333	\N	\N
334	\N	\N
335	\N	\N
381	\N	\N
382	\N	\N
383	\N	\N
384	\N	\N
385	\N	\N
431	\N	\N
432	\N	\N
433	\N	\N
434	\N	\N
435	\N	\N
491	\N	\N
492	\N	\N
493	\N	\N
494	\N	\N
495	\N	\N
551	\N	\N
552	\N	\N
553	\N	\N
554	\N	\N
555	\N	\N
606	\N	\N
607	\N	\N
608	\N	\N
609	\N	\N
610	\N	\N
656	\N	\N
657	\N	\N
658	\N	\N
659	\N	\N
660	\N	\N
706	\N	\N
707	\N	\N
708	\N	\N
709	\N	\N
710	\N	\N
756	\N	\N
757	\N	\N
758	\N	\N
759	\N	\N
760	\N	\N
806	\N	\N
807	\N	\N
808	\N	\N
809	\N	\N
810	\N	\N
841	\N	\N
842	\N	\N
843	\N	\N
844	\N	\N
845	\N	\N
911	\N	\N
912	\N	\N
913	\N	\N
914	\N	\N
915	\N	\N
961	\N	\N
962	\N	\N
963	\N	\N
964	\N	\N
965	\N	\N
1016	\N	\N
1017	\N	\N
1018	\N	\N
1019	\N	\N
1020	\N	\N
1066	\N	\N
1067	\N	\N
1068	\N	\N
1069	\N	\N
1070	\N	\N
1116	\N	\N
1117	\N	\N
1118	\N	\N
1119	\N	\N
1120	\N	\N
1166	\N	\N
1167	\N	\N
1168	\N	\N
1169	\N	\N
1170	\N	\N
1212	\N	\N
1215	\N	\N
1261	\N	\N
1262	\N	\N
1263	\N	\N
1264	\N	\N
1265	\N	\N
1311	\N	\N
1312	\N	\N
1313	\N	\N
1314	\N	\N
1315	\N	\N
1361	\N	\N
1362	\N	\N
1363	\N	\N
1364	\N	\N
1365	\N	\N
1411	\N	\N
1412	\N	\N
1413	\N	\N
1414	\N	\N
1415	\N	\N
1461	\N	\N
1462	\N	\N
1463	\N	\N
1464	\N	\N
1465	\N	\N
1511	\N	\N
1512	\N	\N
1513	\N	\N
1514	\N	\N
1515	\N	\N
1561	\N	\N
1562	\N	\N
1563	\N	\N
1564	\N	\N
1565	\N	\N
1611	\N	\N
1612	\N	\N
1613	\N	\N
1614	\N	\N
1615	\N	\N
1661	\N	\N
1662	\N	\N
1663	\N	\N
1664	\N	\N
1665	\N	\N
1711	\N	\N
1712	\N	\N
1713	\N	\N
1714	\N	\N
1715	\N	\N
1761	\N	\N
1762	\N	\N
1763	\N	\N
1764	\N	\N
1765	\N	\N
1801	\N	\N
1802	\N	\N
1803	\N	\N
1804	\N	\N
1805	\N	\N
1866	\N	\N
1867	\N	\N
1868	\N	\N
1869	\N	\N
1870	\N	\N
1911	\N	\N
1912	\N	\N
1913	\N	\N
1914	\N	\N
1915	\N	\N
1951	\N	\N
1952	\N	\N
1953	\N	\N
1954	\N	\N
1955	\N	\N
2011	\N	\N
2012	\N	\N
2013	\N	\N
2014	\N	\N
2015	\N	\N
2066	\N	\N
2067	\N	\N
2068	\N	\N
2069	\N	\N
2070	\N	\N
2116	\N	\N
2117	\N	\N
2118	\N	\N
2119	\N	\N
2120	\N	\N
2176	\N	\N
2177	\N	\N
2178	\N	\N
2179	\N	\N
2180	\N	\N
2221	\N	\N
2222	\N	\N
2223	\N	\N
2224	\N	\N
2225	\N	\N
2266	\N	\N
2267	\N	\N
2268	\N	\N
2269	\N	\N
2270	\N	\N
2321	\N	\N
2322	\N	\N
2323	\N	\N
2324	\N	\N
2325	\N	\N
2371	\N	\N
2372	\N	\N
2373	\N	\N
2374	\N	\N
2375	\N	\N
2421	\N	\N
2422	\N	\N
2423	\N	\N
2424	\N	\N
2425	\N	\N
2471	\N	\N
2472	\N	\N
2473	\N	\N
2474	\N	\N
2475	\N	\N
2521	\N	\N
236	\N	\N
237	\N	\N
238	\N	\N
239	\N	\N
240	\N	\N
286	\N	\N
287	\N	\N
288	\N	\N
289	\N	\N
290	\N	\N
336	\N	\N
337	\N	\N
338	\N	\N
339	\N	\N
340	\N	\N
386	\N	\N
387	\N	\N
388	\N	\N
389	\N	\N
390	\N	\N
436	\N	\N
437	\N	\N
438	\N	\N
439	\N	\N
440	\N	\N
481	\N	\N
482	\N	\N
483	\N	\N
484	\N	\N
485	\N	\N
521	\N	\N
522	\N	\N
523	\N	\N
524	\N	\N
525	\N	\N
571	\N	\N
572	\N	\N
573	\N	\N
574	\N	\N
575	\N	\N
631	\N	\N
632	\N	\N
633	\N	\N
634	\N	\N
635	\N	\N
681	\N	\N
682	\N	\N
683	\N	\N
684	\N	\N
685	\N	\N
731	\N	\N
732	\N	\N
733	\N	\N
734	\N	\N
735	\N	\N
781	\N	\N
782	\N	\N
783	\N	\N
784	\N	\N
785	\N	\N
851	\N	\N
852	\N	\N
853	\N	\N
854	\N	\N
855	\N	\N
896	\N	\N
897	\N	\N
898	\N	\N
899	\N	\N
900	\N	\N
946	\N	\N
947	\N	\N
948	\N	\N
949	\N	\N
950	\N	\N
996	\N	\N
997	\N	\N
998	\N	\N
999	\N	\N
1000	\N	\N
1046	\N	\N
1047	\N	\N
1048	\N	\N
1049	\N	\N
1050	\N	\N
1096	\N	\N
1097	\N	\N
1098	\N	\N
1099	\N	\N
1100	\N	\N
1146	\N	\N
1147	\N	\N
1148	\N	\N
1149	\N	\N
1150	\N	\N
1191	\N	\N
1192	\N	\N
1193	\N	\N
1194	\N	\N
1195	\N	\N
1241	\N	\N
1242	\N	\N
1243	\N	\N
1244	\N	\N
1245	\N	\N
1291	\N	\N
1292	\N	\N
1293	\N	\N
1294	\N	\N
1295	\N	\N
1341	\N	\N
1342	\N	\N
1343	\N	\N
1344	\N	\N
1345	\N	\N
1391	\N	\N
1392	\N	\N
1393	\N	\N
1394	\N	\N
1395	\N	\N
1441	\N	\N
1442	\N	\N
1443	\N	\N
1444	\N	\N
1445	\N	\N
1491	\N	\N
1492	\N	\N
1493	\N	\N
1494	\N	\N
1495	\N	\N
1541	\N	\N
1542	\N	\N
1543	\N	\N
1544	\N	\N
1545	\N	\N
1591	\N	\N
1592	\N	\N
1593	\N	\N
1594	\N	\N
1595	\N	\N
1641	\N	\N
1642	\N	\N
1643	\N	\N
1644	\N	\N
1645	\N	\N
1691	\N	\N
1692	\N	\N
1693	\N	\N
1694	\N	\N
1695	\N	\N
1741	\N	\N
1742	\N	\N
1743	\N	\N
1744	\N	\N
1745	\N	\N
1811	\N	\N
1812	\N	\N
1813	\N	\N
1814	\N	\N
1815	\N	\N
1856	\N	\N
1857	\N	\N
1858	\N	\N
1859	\N	\N
1860	\N	\N
1926	\N	\N
1927	\N	\N
1928	\N	\N
1929	\N	\N
1930	\N	\N
1986	\N	\N
1987	\N	\N
1988	\N	\N
1989	\N	\N
1990	\N	\N
2041	\N	\N
2042	\N	\N
2043	\N	\N
2044	\N	\N
2045	\N	\N
2091	\N	\N
2092	\N	\N
2093	\N	\N
2094	\N	\N
2095	\N	\N
2136	\N	\N
2137	\N	\N
2138	\N	\N
2139	\N	\N
2140	\N	\N
2201	\N	\N
2202	\N	\N
2203	\N	\N
2204	\N	\N
2205	\N	\N
2242	\N	\N
2251	\N	\N
2252	\N	\N
2253	\N	\N
2254	\N	\N
2291	\N	\N
2292	\N	\N
2293	\N	\N
2294	\N	\N
2295	\N	\N
2341	\N	\N
2342	\N	\N
2343	\N	\N
2344	\N	\N
2345	\N	\N
2391	\N	\N
2392	\N	\N
2393	\N	\N
2394	\N	\N
2395	\N	\N
2441	\N	\N
2442	\N	\N
2443	\N	\N
2444	\N	\N
2445	\N	\N
2491	\N	\N
2492	\N	\N
2493	\N	\N
2494	\N	\N
2495	\N	\N
2531	\N	\N
241	\N	\N
242	\N	\N
243	\N	\N
244	\N	\N
245	\N	\N
291	\N	\N
292	\N	\N
293	\N	\N
294	\N	\N
295	\N	\N
341	\N	\N
342	\N	\N
343	\N	\N
344	\N	\N
345	\N	\N
391	\N	\N
392	\N	\N
393	\N	\N
394	\N	\N
395	\N	\N
441	\N	\N
442	\N	\N
443	\N	\N
444	\N	\N
445	\N	\N
486	\N	\N
487	\N	\N
488	\N	\N
489	\N	\N
490	\N	\N
541	\N	\N
542	\N	\N
543	\N	\N
544	\N	\N
545	\N	\N
596	\N	\N
597	\N	\N
598	\N	\N
599	\N	\N
600	\N	\N
646	\N	\N
647	\N	\N
648	\N	\N
649	\N	\N
650	\N	\N
696	\N	\N
697	\N	\N
698	\N	\N
699	\N	\N
700	\N	\N
746	\N	\N
747	\N	\N
748	\N	\N
749	\N	\N
750	\N	\N
796	\N	\N
797	\N	\N
798	\N	\N
799	\N	\N
800	\N	\N
831	\N	\N
832	\N	\N
833	\N	\N
834	\N	\N
835	\N	\N
881	\N	\N
882	\N	\N
883	\N	\N
884	\N	\N
885	\N	\N
916	\N	\N
917	\N	\N
918	\N	\N
919	\N	\N
920	\N	\N
966	\N	\N
967	\N	\N
968	\N	\N
969	\N	\N
970	\N	\N
1011	\N	\N
1012	\N	\N
1013	\N	\N
1014	\N	\N
1015	\N	\N
1061	\N	\N
1062	\N	\N
1063	\N	\N
1064	\N	\N
1065	\N	\N
1111	\N	\N
1112	\N	\N
1113	\N	\N
1114	\N	\N
1115	\N	\N
1161	\N	\N
1162	\N	\N
1163	\N	\N
1164	\N	\N
1165	\N	\N
1206	\N	\N
1207	\N	\N
1208	\N	\N
1209	\N	\N
1210	\N	\N
1256	\N	\N
1257	\N	\N
1258	\N	\N
1259	\N	\N
1260	\N	\N
1306	\N	\N
1307	\N	\N
1308	\N	\N
1309	\N	\N
1310	\N	\N
1356	\N	\N
1357	\N	\N
1358	\N	\N
1359	\N	\N
1360	\N	\N
1406	\N	\N
1407	\N	\N
1408	\N	\N
1409	\N	\N
1410	\N	\N
1456	\N	\N
1457	\N	\N
1458	\N	\N
1459	\N	\N
1460	\N	\N
1506	\N	\N
1507	\N	\N
1508	\N	\N
1509	\N	\N
1510	\N	\N
1556	\N	\N
1557	\N	\N
1558	\N	\N
1559	\N	\N
1560	\N	\N
1606	\N	\N
1607	\N	\N
1608	\N	\N
1609	\N	\N
1610	\N	\N
1656	\N	\N
1657	\N	\N
1658	\N	\N
1659	\N	\N
1660	\N	\N
1706	\N	\N
1707	\N	\N
1708	\N	\N
1709	\N	\N
1710	\N	\N
1756	\N	\N
1757	\N	\N
1758	\N	\N
1759	\N	\N
1760	\N	\N
1796	\N	\N
1797	\N	\N
1798	\N	\N
1799	\N	\N
1800	\N	\N
1846	\N	\N
1847	\N	\N
1848	\N	\N
1849	\N	\N
1850	\N	\N
1896	\N	\N
1897	\N	\N
1898	\N	\N
1899	\N	\N
1900	\N	\N
1956	\N	\N
1957	\N	\N
1958	\N	\N
1959	\N	\N
1960	\N	\N
2006	\N	\N
2007	\N	\N
2008	\N	\N
2009	\N	\N
2010	\N	\N
2061	\N	\N
2062	\N	\N
2063	\N	\N
2064	\N	\N
2065	\N	\N
2111	\N	\N
2112	\N	\N
2113	\N	\N
2114	\N	\N
2115	\N	\N
2161	\N	\N
2162	\N	\N
2163	\N	\N
2164	\N	\N
2165	\N	\N
2211	\N	\N
2212	\N	\N
2213	\N	\N
2214	\N	\N
2215	\N	\N
2271	\N	\N
2272	\N	\N
2273	\N	\N
2274	\N	\N
2275	\N	\N
2311	\N	\N
2312	\N	\N
2313	\N	\N
2314	\N	\N
2315	\N	\N
2361	\N	\N
2362	\N	\N
2363	\N	\N
2364	\N	\N
2365	\N	\N
2411	\N	\N
2412	\N	\N
2413	\N	\N
2414	\N	\N
2415	\N	\N
2461	\N	\N
246	\N	\N
247	\N	\N
248	\N	\N
249	\N	\N
250	\N	\N
296	\N	\N
297	\N	\N
298	\N	\N
299	\N	\N
300	\N	\N
346	\N	\N
347	\N	\N
348	\N	\N
349	\N	\N
350	\N	\N
396	\N	\N
397	\N	\N
398	\N	\N
399	\N	\N
400	\N	\N
446	\N	\N
447	\N	\N
448	\N	\N
449	\N	\N
450	\N	\N
496	\N	\N
497	\N	\N
498	\N	\N
499	\N	\N
500	\N	\N
546	\N	\N
547	\N	\N
548	\N	\N
549	\N	\N
550	\N	\N
601	\N	\N
602	\N	\N
603	\N	\N
604	\N	\N
605	\N	\N
652	\N	\N
701	\N	\N
702	\N	\N
703	\N	\N
704	\N	\N
705	\N	\N
751	\N	\N
752	\N	\N
753	\N	\N
754	\N	\N
755	\N	\N
801	\N	\N
802	\N	\N
803	\N	\N
804	\N	\N
805	\N	\N
876	\N	\N
877	\N	\N
878	\N	\N
879	\N	\N
880	\N	\N
931	\N	\N
932	\N	\N
933	\N	\N
934	\N	\N
935	\N	\N
986	\N	\N
987	\N	\N
988	\N	\N
989	\N	\N
990	\N	\N
1036	\N	\N
1037	\N	\N
1038	\N	\N
1039	\N	\N
1040	\N	\N
1086	\N	\N
1087	\N	\N
1088	\N	\N
1089	\N	\N
1090	\N	\N
1136	\N	\N
1137	\N	\N
1138	\N	\N
1139	\N	\N
1140	\N	\N
1186	\N	\N
1187	\N	\N
1188	\N	\N
1189	\N	\N
1190	\N	\N
1236	\N	\N
1237	\N	\N
1238	\N	\N
1239	\N	\N
1240	\N	\N
1286	\N	\N
1287	\N	\N
1288	\N	\N
1289	\N	\N
1290	\N	\N
1336	\N	\N
1337	\N	\N
1338	\N	\N
1339	\N	\N
1340	\N	\N
1386	\N	\N
1387	\N	\N
1388	\N	\N
1389	\N	\N
1390	\N	\N
1436	\N	\N
1437	\N	\N
1438	\N	\N
1439	\N	\N
1440	\N	\N
1486	\N	\N
1487	\N	\N
1488	\N	\N
1489	\N	\N
1490	\N	\N
1536	\N	\N
1537	\N	\N
1538	\N	\N
1539	\N	\N
1540	\N	\N
1586	\N	\N
1587	\N	\N
1588	\N	\N
1589	\N	\N
1590	\N	\N
1636	\N	\N
1637	\N	\N
1638	\N	\N
1639	\N	\N
1640	\N	\N
1686	\N	\N
1687	\N	\N
1688	\N	\N
1689	\N	\N
1690	\N	\N
1736	\N	\N
1737	\N	\N
1738	\N	\N
1739	\N	\N
1740	\N	\N
1786	\N	\N
1787	\N	\N
1788	\N	\N
1789	\N	\N
1790	\N	\N
1821	\N	\N
1822	\N	\N
1823	\N	\N
1824	\N	\N
1825	\N	\N
1891	\N	\N
1892	\N	\N
1893	\N	\N
1894	\N	\N
1895	\N	\N
1961	\N	\N
1962	\N	\N
1963	\N	\N
1964	\N	\N
1965	\N	\N
2016	\N	\N
2017	\N	\N
2018	\N	\N
2019	\N	\N
2020	\N	\N
2071	\N	\N
2072	\N	\N
2073	\N	\N
2074	\N	\N
2075	\N	\N
2121	\N	\N
2122	\N	\N
2123	\N	\N
2124	\N	\N
2125	\N	\N
2171	\N	\N
2172	\N	\N
2173	\N	\N
2174	\N	\N
2175	\N	\N
2239	\N	\N
2243	\N	\N
2244	\N	\N
2245	\N	\N
2255	\N	\N
2316	\N	\N
2317	\N	\N
2318	\N	\N
2319	\N	\N
2320	\N	\N
2366	\N	\N
2367	\N	\N
2368	\N	\N
2369	\N	\N
2370	\N	\N
2416	\N	\N
2417	\N	\N
2418	\N	\N
2419	\N	\N
2420	\N	\N
2466	\N	\N
2467	\N	\N
2468	\N	\N
2469	\N	\N
2470	\N	\N
2506	\N	\N
2507	\N	\N
2508	\N	\N
2509	\N	\N
2510	\N	\N
2546	\N	\N
2547	\N	\N
2548	\N	\N
2549	\N	\N
2550	\N	\N
2596	\N	\N
251	\N	\N
252	\N	\N
253	\N	\N
254	\N	\N
255	\N	\N
301	\N	\N
302	\N	\N
303	\N	\N
304	\N	\N
305	\N	\N
352	\N	\N
401	\N	\N
402	\N	\N
403	\N	\N
404	\N	\N
405	\N	\N
451	\N	\N
452	\N	\N
453	\N	\N
454	\N	\N
455	\N	\N
501	\N	\N
502	\N	\N
503	\N	\N
504	\N	\N
505	\N	\N
536	\N	\N
537	\N	\N
538	\N	\N
539	\N	\N
540	\N	\N
586	\N	\N
587	\N	\N
588	\N	\N
589	\N	\N
590	\N	\N
626	\N	\N
627	\N	\N
628	\N	\N
629	\N	\N
630	\N	\N
676	\N	\N
677	\N	\N
678	\N	\N
679	\N	\N
680	\N	\N
726	\N	\N
727	\N	\N
728	\N	\N
729	\N	\N
730	\N	\N
786	\N	\N
787	\N	\N
788	\N	\N
789	\N	\N
790	\N	\N
861	\N	\N
862	\N	\N
863	\N	\N
864	\N	\N
865	\N	\N
921	\N	\N
922	\N	\N
923	\N	\N
924	\N	\N
925	\N	\N
976	\N	\N
977	\N	\N
978	\N	\N
979	\N	\N
980	\N	\N
1026	\N	\N
1027	\N	\N
1028	\N	\N
1029	\N	\N
1030	\N	\N
1076	\N	\N
1077	\N	\N
1078	\N	\N
1079	\N	\N
1080	\N	\N
1126	\N	\N
1127	\N	\N
1128	\N	\N
1129	\N	\N
1130	\N	\N
1176	\N	\N
1177	\N	\N
1178	\N	\N
1179	\N	\N
1180	\N	\N
1226	\N	\N
1227	\N	\N
1228	\N	\N
1229	\N	\N
1230	\N	\N
1277	\N	\N
1326	\N	\N
1327	\N	\N
1328	\N	\N
1329	\N	\N
1330	\N	\N
1376	\N	\N
1377	\N	\N
1378	\N	\N
1379	\N	\N
1380	\N	\N
1426	\N	\N
1427	\N	\N
1428	\N	\N
1429	\N	\N
1430	\N	\N
1476	\N	\N
1477	\N	\N
1478	\N	\N
1479	\N	\N
1480	\N	\N
1526	\N	\N
1527	\N	\N
1528	\N	\N
1529	\N	\N
1530	\N	\N
1576	\N	\N
1577	\N	\N
1578	\N	\N
1579	\N	\N
1580	\N	\N
1626	\N	\N
1627	\N	\N
1628	\N	\N
1629	\N	\N
1630	\N	\N
1676	\N	\N
1677	\N	\N
1678	\N	\N
1679	\N	\N
1680	\N	\N
1721	\N	\N
1722	\N	\N
1723	\N	\N
1724	\N	\N
1725	\N	\N
1771	\N	\N
1772	\N	\N
1773	\N	\N
1774	\N	\N
1775	\N	\N
1831	\N	\N
1832	\N	\N
1833	\N	\N
1834	\N	\N
1835	\N	\N
1886	\N	\N
1887	\N	\N
1888	\N	\N
1889	\N	\N
1890	\N	\N
1931	\N	\N
1932	\N	\N
1933	\N	\N
1934	\N	\N
1935	\N	\N
1971	\N	\N
1972	\N	\N
1973	\N	\N
1974	\N	\N
1975	\N	\N
2021	\N	\N
2022	\N	\N
2023	\N	\N
2024	\N	\N
2025	\N	\N
2051	\N	\N
2052	\N	\N
2053	\N	\N
2054	\N	\N
2055	\N	\N
2101	\N	\N
2102	\N	\N
2103	\N	\N
2104	\N	\N
2105	\N	\N
2151	\N	\N
2152	\N	\N
2153	\N	\N
2154	\N	\N
2155	\N	\N
2186	\N	\N
2187	\N	\N
2188	\N	\N
2189	\N	\N
2190	\N	\N
2226	\N	\N
2227	\N	\N
2228	\N	\N
2229	\N	\N
2230	\N	\N
2276	\N	\N
2277	\N	\N
2278	\N	\N
2279	\N	\N
2280	\N	\N
2336	\N	\N
2337	\N	\N
2338	\N	\N
2339	\N	\N
2340	\N	\N
2386	\N	\N
2387	\N	\N
2388	\N	\N
2389	\N	\N
2390	\N	\N
2436	\N	\N
2437	\N	\N
2438	\N	\N
2439	\N	\N
2440	\N	\N
2486	\N	\N
1276	nem.io	http://nem.io
1279	@NEMofficial	https://twitter.com/NEMofficial
256	\N	\N
257	\N	\N
258	\N	\N
259	\N	\N
260	\N	\N
306	\N	\N
307	\N	\N
308	\N	\N
309	\N	\N
310	\N	\N
356	\N	\N
357	\N	\N
358	\N	\N
359	\N	\N
360	\N	\N
406	\N	\N
407	\N	\N
408	\N	\N
409	\N	\N
410	\N	\N
456	\N	\N
457	\N	\N
458	\N	\N
459	\N	\N
460	\N	\N
506	\N	\N
507	\N	\N
508	\N	\N
509	\N	\N
510	\N	\N
556	\N	\N
557	\N	\N
558	\N	\N
559	\N	\N
560	\N	\N
591	\N	\N
592	\N	\N
593	\N	\N
594	\N	\N
595	\N	\N
641	\N	\N
642	\N	\N
643	\N	\N
644	\N	\N
645	\N	\N
691	\N	\N
692	\N	\N
693	\N	\N
694	\N	\N
695	\N	\N
741	\N	\N
742	\N	\N
743	\N	\N
744	\N	\N
745	\N	\N
791	\N	\N
792	\N	\N
793	\N	\N
794	\N	\N
795	\N	\N
836	\N	\N
837	\N	\N
838	\N	\N
839	\N	\N
840	\N	\N
886	\N	\N
887	\N	\N
888	\N	\N
889	\N	\N
890	\N	\N
936	\N	\N
937	\N	\N
938	\N	\N
939	\N	\N
940	\N	\N
981	\N	\N
982	\N	\N
983	\N	\N
984	\N	\N
985	\N	\N
1031	\N	\N
1032	\N	\N
1033	\N	\N
1034	\N	\N
1035	\N	\N
1081	\N	\N
1082	\N	\N
1083	\N	\N
1084	\N	\N
1085	\N	\N
1131	\N	\N
1132	\N	\N
1133	\N	\N
1134	\N	\N
1135	\N	\N
1181	\N	\N
1182	\N	\N
1183	\N	\N
1184	\N	\N
1185	\N	\N
1231	\N	\N
1232	\N	\N
1233	\N	\N
1234	\N	\N
1235	\N	\N
1281	\N	\N
1282	\N	\N
1283	\N	\N
1284	\N	\N
1285	\N	\N
1331	\N	\N
1332	\N	\N
1333	\N	\N
1334	\N	\N
1335	\N	\N
1381	\N	\N
1382	\N	\N
1383	\N	\N
1384	\N	\N
1385	\N	\N
1431	\N	\N
1432	\N	\N
1433	\N	\N
1434	\N	\N
1435	\N	\N
1481	\N	\N
1482	\N	\N
1483	\N	\N
1484	\N	\N
1485	\N	\N
1531	\N	\N
1532	\N	\N
1533	\N	\N
1534	\N	\N
1535	\N	\N
1581	\N	\N
1582	\N	\N
1583	\N	\N
1584	\N	\N
1585	\N	\N
1631	\N	\N
1632	\N	\N
1633	\N	\N
1634	\N	\N
1635	\N	\N
1681	\N	\N
1682	\N	\N
1683	\N	\N
1684	\N	\N
1685	\N	\N
1726	\N	\N
1728	\N	\N
1730	\N	\N
1732	\N	\N
1734	\N	\N
1776	\N	\N
1777	\N	\N
1778	\N	\N
1779	\N	\N
1780	\N	\N
1841	\N	\N
1842	\N	\N
1843	\N	\N
1844	\N	\N
1845	\N	\N
1881	\N	\N
1882	\N	\N
1883	\N	\N
1884	\N	\N
1885	\N	\N
1936	\N	\N
1937	\N	\N
1938	\N	\N
1939	\N	\N
1940	\N	\N
1976	\N	\N
1977	\N	\N
1978	\N	\N
1979	\N	\N
1980	\N	\N
2031	\N	\N
2032	\N	\N
2033	\N	\N
2034	\N	\N
2035	\N	\N
2081	\N	\N
2082	\N	\N
2083	\N	\N
2084	\N	\N
2085	\N	\N
2146	\N	\N
2147	\N	\N
2148	\N	\N
2149	\N	\N
2150	\N	\N
2196	\N	\N
2197	\N	\N
2198	\N	\N
2199	\N	\N
2200	\N	\N
2241	\N	\N
2247	\N	\N
2248	\N	\N
2249	\N	\N
2250	\N	\N
2301	\N	\N
2302	\N	\N
2303	\N	\N
2304	\N	\N
2305	\N	\N
2351	\N	\N
2352	\N	\N
2353	\N	\N
2354	\N	\N
2355	\N	\N
2401	\N	\N
2402	\N	\N
2403	\N	\N
2404	\N	\N
2405	\N	\N
2451	\N	\N
2452	\N	\N
2453	\N	\N
2454	\N	\N
2455	\N	\N
2516	\N	\N
261	\N	\N
262	\N	\N
263	\N	\N
264	\N	\N
265	\N	\N
311	\N	\N
312	\N	\N
313	\N	\N
314	\N	\N
315	\N	\N
361	\N	\N
362	\N	\N
363	\N	\N
364	\N	\N
365	\N	\N
411	\N	\N
412	\N	\N
413	\N	\N
414	\N	\N
415	\N	\N
461	\N	\N
462	\N	\N
463	\N	\N
464	\N	\N
465	\N	\N
531	\N	\N
532	\N	\N
533	\N	\N
534	\N	\N
535	\N	\N
581	\N	\N
582	\N	\N
583	\N	\N
584	\N	\N
585	\N	\N
621	\N	\N
622	\N	\N
623	\N	\N
624	\N	\N
625	\N	\N
671	\N	\N
672	\N	\N
673	\N	\N
674	\N	\N
675	\N	\N
721	\N	\N
722	\N	\N
723	\N	\N
724	\N	\N
725	\N	\N
771	\N	\N
772	\N	\N
773	\N	\N
774	\N	\N
775	\N	\N
821	\N	\N
822	\N	\N
823	\N	\N
824	\N	\N
825	\N	\N
857	\N	\N
860	\N	\N
906	\N	\N
907	\N	\N
908	\N	\N
909	\N	\N
910	\N	\N
956	\N	\N
957	\N	\N
958	\N	\N
959	\N	\N
960	\N	\N
1006	\N	\N
1007	\N	\N
1008	\N	\N
1009	\N	\N
1010	\N	\N
1056	\N	\N
1057	\N	\N
1058	\N	\N
1059	\N	\N
1060	\N	\N
1106	\N	\N
1107	\N	\N
1108	\N	\N
1109	\N	\N
1110	\N	\N
1156	\N	\N
1157	\N	\N
1158	\N	\N
1159	\N	\N
1160	\N	\N
1201	\N	\N
1202	\N	\N
1203	\N	\N
1204	\N	\N
1205	\N	\N
1251	\N	\N
1252	\N	\N
1253	\N	\N
1254	\N	\N
1255	\N	\N
1301	\N	\N
1302	\N	\N
1303	\N	\N
1304	\N	\N
1305	\N	\N
1351	\N	\N
1352	\N	\N
1353	\N	\N
1354	\N	\N
1355	\N	\N
1401	\N	\N
1402	\N	\N
1403	\N	\N
1404	\N	\N
1405	\N	\N
1451	\N	\N
1452	\N	\N
1453	\N	\N
1454	\N	\N
1455	\N	\N
1502	\N	\N
1505	\N	\N
1551	\N	\N
1552	\N	\N
1553	\N	\N
1554	\N	\N
1555	\N	\N
1601	\N	\N
1602	\N	\N
1603	\N	\N
1604	\N	\N
1605	\N	\N
1651	\N	\N
1652	\N	\N
1653	\N	\N
1654	\N	\N
1655	\N	\N
1701	\N	\N
1702	\N	\N
1703	\N	\N
1704	\N	\N
1705	\N	\N
1751	\N	\N
1752	\N	\N
1753	\N	\N
1754	\N	\N
1755	\N	\N
1806	\N	\N
1807	\N	\N
1808	\N	\N
1809	\N	\N
1810	\N	\N
1861	\N	\N
1862	\N	\N
1863	\N	\N
1864	\N	\N
1865	\N	\N
1901	\N	\N
1902	\N	\N
1903	\N	\N
1904	\N	\N
1905	\N	\N
1941	\N	\N
1942	\N	\N
1943	\N	\N
1944	\N	\N
1945	\N	\N
1991	\N	\N
1992	\N	\N
1993	\N	\N
1994	\N	\N
1995	\N	\N
2026	\N	\N
2027	\N	\N
2028	\N	\N
2029	\N	\N
2030	\N	\N
2076	\N	\N
2077	\N	\N
2078	\N	\N
2079	\N	\N
2080	\N	\N
2126	\N	\N
2127	\N	\N
2128	\N	\N
2129	\N	\N
2130	\N	\N
2156	\N	\N
2157	\N	\N
2158	\N	\N
2159	\N	\N
2160	\N	\N
2206	\N	\N
2207	\N	\N
2208	\N	\N
2209	\N	\N
2210	\N	\N
2256	\N	\N
2257	\N	\N
2258	\N	\N
2259	\N	\N
2260	\N	\N
2296	\N	\N
2297	\N	\N
2298	\N	\N
2299	\N	\N
2300	\N	\N
2346	\N	\N
2347	\N	\N
2348	\N	\N
2349	\N	\N
2350	\N	\N
2396	\N	\N
2397	\N	\N
2398	\N	\N
2399	\N	\N
2400	\N	\N
2446	\N	\N
856	www.stellar.org	https://www.stellar.org
266	\N	\N
267	\N	\N
268	\N	\N
269	\N	\N
270	\N	\N
316	\N	\N
317	\N	\N
318	\N	\N
319	\N	\N
320	\N	\N
366	\N	\N
367	\N	\N
368	\N	\N
369	\N	\N
370	\N	\N
416	\N	\N
417	\N	\N
418	\N	\N
419	\N	\N
420	\N	\N
466	\N	\N
467	\N	\N
468	\N	\N
469	\N	\N
470	\N	\N
516	\N	\N
517	\N	\N
518	\N	\N
519	\N	\N
520	\N	\N
566	\N	\N
567	\N	\N
568	\N	\N
569	\N	\N
570	\N	\N
616	\N	\N
617	\N	\N
618	\N	\N
619	\N	\N
620	\N	\N
666	\N	\N
667	\N	\N
668	\N	\N
669	\N	\N
670	\N	\N
716	\N	\N
717	\N	\N
718	\N	\N
719	\N	\N
720	\N	\N
766	\N	\N
767	\N	\N
768	\N	\N
769	\N	\N
770	\N	\N
816	\N	\N
817	\N	\N
818	\N	\N
819	\N	\N
820	\N	\N
871	\N	\N
872	\N	\N
873	\N	\N
874	\N	\N
875	\N	\N
891	\N	\N
892	\N	\N
893	\N	\N
894	\N	\N
895	\N	\N
941	\N	\N
942	\N	\N
943	\N	\N
944	\N	\N
945	\N	\N
991	\N	\N
992	\N	\N
993	\N	\N
994	\N	\N
995	\N	\N
1041	\N	\N
1042	\N	\N
1043	\N	\N
1044	\N	\N
1045	\N	\N
1091	\N	\N
1092	\N	\N
1093	\N	\N
1094	\N	\N
1095	\N	\N
1141	\N	\N
1142	\N	\N
1143	\N	\N
1144	\N	\N
1145	\N	\N
1216	\N	\N
1217	\N	\N
1218	\N	\N
1219	\N	\N
1220	\N	\N
1266	\N	\N
1267	\N	\N
1268	\N	\N
1269	\N	\N
1270	\N	\N
1316	\N	\N
1317	\N	\N
1318	\N	\N
1319	\N	\N
1320	\N	\N
1366	\N	\N
1367	\N	\N
1368	\N	\N
1369	\N	\N
1370	\N	\N
1416	\N	\N
1417	\N	\N
1418	\N	\N
1419	\N	\N
1420	\N	\N
1466	\N	\N
1467	\N	\N
1468	\N	\N
1469	\N	\N
1470	\N	\N
1516	\N	\N
1517	\N	\N
1518	\N	\N
1519	\N	\N
1520	\N	\N
1566	\N	\N
1567	\N	\N
1568	\N	\N
1569	\N	\N
1570	\N	\N
1616	\N	\N
1617	\N	\N
1618	\N	\N
1619	\N	\N
1620	\N	\N
1666	\N	\N
1667	\N	\N
1668	\N	\N
1669	\N	\N
1670	\N	\N
1727	\N	\N
1729	\N	\N
1731	\N	\N
1733	\N	\N
1735	\N	\N
1781	\N	\N
1782	\N	\N
1783	\N	\N
1784	\N	\N
1785	\N	\N
1836	\N	\N
1837	\N	\N
1838	\N	\N
1839	\N	\N
1840	\N	\N
1876	\N	\N
1877	\N	\N
1878	\N	\N
1879	\N	\N
1880	\N	\N
1921	\N	\N
1922	\N	\N
1923	\N	\N
1924	\N	\N
1925	\N	\N
1981	\N	\N
1982	\N	\N
1983	\N	\N
1984	\N	\N
1985	\N	\N
2036	\N	\N
2037	\N	\N
2038	\N	\N
2039	\N	\N
2040	\N	\N
2087	\N	\N
2090	\N	\N
2141	\N	\N
2142	\N	\N
2143	\N	\N
2144	\N	\N
2145	\N	\N
2191	\N	\N
2192	\N	\N
2193	\N	\N
2194	\N	\N
2195	\N	\N
2236	\N	\N
2237	\N	\N
2238	\N	\N
2240	\N	\N
2246	\N	\N
2286	\N	\N
2287	\N	\N
2288	\N	\N
2289	\N	\N
2290	\N	\N
2331	\N	\N
2332	\N	\N
2333	\N	\N
2334	\N	\N
2335	\N	\N
2381	\N	\N
2382	\N	\N
2383	\N	\N
2384	\N	\N
2385	\N	\N
2431	\N	\N
2432	\N	\N
2433	\N	\N
2434	\N	\N
2435	\N	\N
2481	\N	\N
2482	\N	\N
2483	\N	\N
2484	\N	\N
2485	\N	\N
2536	\N	\N
271	\N	\N
272	\N	\N
273	\N	\N
274	\N	\N
275	\N	\N
321	\N	\N
322	\N	\N
323	\N	\N
324	\N	\N
325	\N	\N
371	\N	\N
372	\N	\N
373	\N	\N
374	\N	\N
375	\N	\N
421	\N	\N
422	\N	\N
423	\N	\N
424	\N	\N
425	\N	\N
471	\N	\N
472	\N	\N
473	\N	\N
474	\N	\N
475	\N	\N
526	\N	\N
527	\N	\N
528	\N	\N
529	\N	\N
530	\N	\N
576	\N	\N
577	\N	\N
578	\N	\N
579	\N	\N
580	\N	\N
636	\N	\N
637	\N	\N
638	\N	\N
639	\N	\N
640	\N	\N
686	\N	\N
687	\N	\N
688	\N	\N
689	\N	\N
690	\N	\N
736	\N	\N
737	\N	\N
738	\N	\N
739	\N	\N
740	\N	\N
776	\N	\N
777	\N	\N
778	\N	\N
779	\N	\N
780	\N	\N
826	\N	\N
827	\N	\N
828	\N	\N
829	\N	\N
830	\N	\N
846	\N	\N
847	\N	\N
848	\N	\N
849	\N	\N
850	\N	\N
901	\N	\N
902	\N	\N
903	\N	\N
904	\N	\N
905	\N	\N
951	\N	\N
952	\N	\N
953	\N	\N
954	\N	\N
955	\N	\N
1001	\N	\N
1002	\N	\N
1003	\N	\N
1004	\N	\N
1005	\N	\N
1051	\N	\N
1052	\N	\N
1053	\N	\N
1054	\N	\N
1055	\N	\N
1101	\N	\N
1102	\N	\N
1103	\N	\N
1104	\N	\N
1105	\N	\N
1151	\N	\N
1152	\N	\N
1153	\N	\N
1154	\N	\N
1155	\N	\N
1196	\N	\N
1197	\N	\N
1198	\N	\N
1199	\N	\N
1200	\N	\N
1246	\N	\N
1247	\N	\N
1248	\N	\N
1249	\N	\N
1250	\N	\N
1296	\N	\N
1297	\N	\N
1298	\N	\N
1299	\N	\N
1300	\N	\N
1346	\N	\N
1347	\N	\N
1348	\N	\N
1349	\N	\N
1350	\N	\N
1396	\N	\N
1397	\N	\N
1398	\N	\N
1399	\N	\N
1400	\N	\N
1446	\N	\N
1447	\N	\N
1448	\N	\N
1449	\N	\N
1450	\N	\N
1496	\N	\N
1497	\N	\N
1498	\N	\N
1499	\N	\N
1500	\N	\N
1546	\N	\N
1547	\N	\N
1548	\N	\N
1549	\N	\N
1550	\N	\N
1596	\N	\N
1597	\N	\N
1598	\N	\N
1599	\N	\N
1600	\N	\N
1646	\N	\N
1647	\N	\N
1648	\N	\N
1649	\N	\N
1650	\N	\N
1696	\N	\N
1697	\N	\N
1698	\N	\N
1699	\N	\N
1700	\N	\N
1746	\N	\N
1747	\N	\N
1748	\N	\N
1749	\N	\N
1750	\N	\N
1791	\N	\N
1792	\N	\N
1793	\N	\N
1794	\N	\N
1795	\N	\N
1826	\N	\N
1827	\N	\N
1828	\N	\N
1829	\N	\N
1830	\N	\N
1871	\N	\N
1872	\N	\N
1873	\N	\N
1874	\N	\N
1875	\N	\N
1916	\N	\N
1917	\N	\N
1918	\N	\N
1919	\N	\N
1920	\N	\N
1966	\N	\N
1967	\N	\N
1968	\N	\N
1969	\N	\N
1970	\N	\N
1996	\N	\N
1997	\N	\N
1998	\N	\N
1999	\N	\N
2000	\N	\N
2046	\N	\N
2047	\N	\N
2048	\N	\N
2049	\N	\N
2050	\N	\N
2096	\N	\N
2097	\N	\N
2098	\N	\N
2099	\N	\N
2100	\N	\N
2131	\N	\N
2132	\N	\N
2133	\N	\N
2134	\N	\N
2135	\N	\N
2182	\N	\N
2185	\N	\N
2216	\N	\N
2217	\N	\N
2218	\N	\N
2219	\N	\N
2220	\N	\N
2261	\N	\N
2262	\N	\N
2263	\N	\N
2264	\N	\N
2265	\N	\N
2306	\N	\N
2307	\N	\N
2308	\N	\N
2309	\N	\N
2310	\N	\N
2356	\N	\N
2357	\N	\N
2358	\N	\N
2359	\N	\N
2360	\N	\N
2406	\N	\N
2407	\N	\N
2408	\N	\N
2409	\N	\N
2410	\N	\N
2456	\N	\N
2457	\N	\N
2458	\N	\N
2459	\N	\N
2460	\N	\N
2496	\N	\N
2497	\N	\N
2498	\N	\N
2499	\N	\N
2500	\N	\N
2561	\N	\N
2562	\N	\N
2563	\N	\N
2564	\N	\N
2565	\N	\N
2621	\N	\N
2622	\N	\N
2623	\N	\N
2624	\N	\N
2625	\N	\N
2666	\N	\N
2667	\N	\N
2668	\N	\N
2669	\N	\N
2670	\N	\N
2726	\N	\N
2727	\N	\N
2728	\N	\N
2729	\N	\N
2730	\N	\N
2786	\N	\N
2787	\N	\N
2788	\N	\N
2789	\N	\N
2790	\N	\N
2836	\N	\N
2837	\N	\N
2838	\N	\N
2839	\N	\N
2840	\N	\N
2901	\N	\N
2902	\N	\N
2903	\N	\N
2904	\N	\N
2905	\N	\N
2946	\N	\N
2947	\N	\N
2948	\N	\N
2949	\N	\N
2950	\N	\N
3006	\N	\N
3007	\N	\N
3008	\N	\N
3009	\N	\N
3010	\N	\N
3066	\N	\N
3067	\N	\N
3068	\N	\N
3069	\N	\N
3070	\N	\N
3101	\N	\N
3102	\N	\N
3103	\N	\N
3104	\N	\N
3105	\N	\N
3151	\N	\N
3152	\N	\N
3153	\N	\N
3154	\N	\N
3155	\N	\N
3186	\N	\N
3187	\N	\N
3188	\N	\N
3189	\N	\N
3190	\N	\N
3231	\N	\N
3232	\N	\N
3233	\N	\N
3234	\N	\N
3235	\N	\N
3281	\N	\N
3282	\N	\N
3283	\N	\N
3284	\N	\N
3285	\N	\N
3316	\N	\N
3317	\N	\N
3318	\N	\N
3319	\N	\N
3320	\N	\N
3371	\N	\N
3372	\N	\N
3373	\N	\N
3374	\N	\N
3375	\N	\N
3421	\N	\N
3422	\N	\N
3423	\N	\N
3424	\N	\N
3425	\N	\N
3491	\N	\N
3492	\N	\N
3493	\N	\N
3494	\N	\N
3495	\N	\N
3536	\N	\N
3537	\N	\N
3538	\N	\N
3539	\N	\N
3540	\N	\N
3601	\N	\N
3602	\N	\N
3603	\N	\N
3604	\N	\N
3605	\N	\N
3626	\N	\N
3627	\N	\N
3628	\N	\N
3629	\N	\N
3630	\N	\N
3681	\N	\N
3682	\N	\N
3683	\N	\N
3684	\N	\N
3685	\N	\N
3736	\N	\N
3737	\N	\N
3738	\N	\N
3739	\N	\N
3740	\N	\N
3791	\N	\N
3792	\N	\N
3793	\N	\N
3794	\N	\N
3795	\N	\N
3836	\N	\N
3837	\N	\N
3838	\N	\N
3840	\N	\N
3841	\N	\N
3896	\N	\N
3897	\N	\N
3898	\N	\N
3899	\N	\N
3900	\N	\N
3946	\N	\N
3947	\N	\N
3948	\N	\N
3949	\N	\N
3950	\N	\N
3991	\N	\N
3992	\N	\N
3993	\N	\N
3994	\N	\N
3995	\N	\N
4056	\N	\N
4057	\N	\N
4058	\N	\N
4059	\N	\N
4060	\N	\N
4101	\N	\N
4102	\N	\N
4103	\N	\N
4104	\N	\N
4105	\N	\N
4151	\N	\N
4152	\N	\N
4153	\N	\N
4154	\N	\N
4155	\N	\N
4216	\N	\N
4217	\N	\N
4218	\N	\N
4219	\N	\N
4220	\N	\N
4261	\N	\N
4262	\N	\N
4263	\N	\N
4264	\N	\N
4265	\N	\N
4321	\N	\N
4322	\N	\N
4323	\N	\N
4324	\N	\N
4325	\N	\N
4381	\N	\N
4382	\N	\N
4383	\N	\N
4384	\N	\N
4385	\N	\N
4436	\N	\N
4437	\N	\N
4438	\N	\N
4439	\N	\N
4440	\N	\N
4491	\N	\N
4492	\N	\N
4493	\N	\N
4494	\N	\N
4495	\N	\N
4541	\N	\N
4542	\N	\N
4543	\N	\N
4544	\N	\N
4545	\N	\N
4596	\N	\N
4597	\N	\N
4598	\N	\N
4599	\N	\N
4600	\N	\N
4646	\N	\N
4647	\N	\N
4648	\N	\N
4649	\N	\N
4650	\N	\N
4701	\N	\N
4702	\N	\N
4703	\N	\N
4704	\N	\N
4705	\N	\N
4756	\N	\N
4757	\N	\N
2447	\N	\N
2448	\N	\N
2449	\N	\N
2450	\N	\N
2511	\N	\N
2512	\N	\N
2513	\N	\N
2514	\N	\N
2515	\N	\N
2566	\N	\N
2567	\N	\N
2568	\N	\N
2569	\N	\N
2570	\N	\N
2601	\N	\N
2602	\N	\N
2603	\N	\N
2604	\N	\N
2605	\N	\N
2671	\N	\N
2672	\N	\N
2673	\N	\N
2674	\N	\N
2675	\N	\N
2721	\N	\N
2722	\N	\N
2723	\N	\N
2724	\N	\N
2725	\N	\N
2761	\N	\N
2762	\N	\N
2763	\N	\N
2764	\N	\N
2765	\N	\N
2811	\N	\N
2812	\N	\N
2813	\N	\N
2814	\N	\N
2815	\N	\N
2876	\N	\N
2877	\N	\N
2878	\N	\N
2879	\N	\N
2880	\N	\N
2916	\N	\N
2917	\N	\N
2918	\N	\N
2919	\N	\N
2920	\N	\N
2976	\N	\N
2977	\N	\N
2978	\N	\N
2979	\N	\N
2980	\N	\N
3026	\N	\N
3027	\N	\N
3028	\N	\N
3029	\N	\N
3030	\N	\N
3081	\N	\N
3082	\N	\N
3083	\N	\N
3084	\N	\N
3085	\N	\N
3136	\N	\N
3137	\N	\N
3138	\N	\N
3139	\N	\N
3140	\N	\N
3191	\N	\N
3192	\N	\N
3193	\N	\N
3194	\N	\N
3195	\N	\N
3237	\N	\N
3240	\N	\N
3296	\N	\N
3297	\N	\N
3298	\N	\N
3299	\N	\N
3300	\N	\N
3351	\N	\N
3352	\N	\N
3353	\N	\N
3354	\N	\N
3355	\N	\N
3406	\N	\N
3407	\N	\N
3408	\N	\N
3409	\N	\N
3410	\N	\N
3456	\N	\N
3457	\N	\N
3458	\N	\N
3459	\N	\N
3460	\N	\N
3511	\N	\N
3512	\N	\N
3513	\N	\N
3514	\N	\N
3515	\N	\N
3561	\N	\N
3562	\N	\N
3563	\N	\N
3564	\N	\N
3565	\N	\N
3611	\N	\N
3612	\N	\N
3613	\N	\N
3614	\N	\N
3615	\N	\N
3666	\N	\N
3667	\N	\N
3668	\N	\N
3669	\N	\N
3670	\N	\N
3721	\N	\N
3722	\N	\N
3723	\N	\N
3724	\N	\N
3725	\N	\N
3761	\N	\N
3762	\N	\N
3763	\N	\N
3764	\N	\N
3765	\N	\N
3816	\N	\N
3817	\N	\N
3818	\N	\N
3819	\N	\N
3820	\N	\N
3866	\N	\N
3867	\N	\N
3868	\N	\N
3869	\N	\N
3870	\N	\N
3916	\N	\N
3917	\N	\N
3918	\N	\N
3919	\N	\N
3920	\N	\N
3971	\N	\N
3972	\N	\N
3973	\N	\N
3974	\N	\N
3975	\N	\N
4021	\N	\N
4022	\N	\N
4023	\N	\N
4024	\N	\N
4025	\N	\N
4076	\N	\N
4077	\N	\N
4078	\N	\N
4079	\N	\N
4080	\N	\N
4126	\N	\N
4127	\N	\N
4128	\N	\N
4129	\N	\N
4130	\N	\N
4186	\N	\N
4187	\N	\N
4188	\N	\N
4189	\N	\N
4190	\N	\N
4231	\N	\N
4232	\N	\N
4233	\N	\N
4234	\N	\N
4235	\N	\N
4286	\N	\N
4287	\N	\N
4288	\N	\N
4289	\N	\N
4290	\N	\N
4351	\N	\N
4352	\N	\N
4353	\N	\N
4354	\N	\N
4355	\N	\N
4401	\N	\N
4402	\N	\N
4403	\N	\N
4404	\N	\N
4405	\N	\N
4451	\N	\N
4452	\N	\N
4453	\N	\N
4454	\N	\N
4455	\N	\N
4516	\N	\N
4517	\N	\N
4518	\N	\N
4519	\N	\N
4520	\N	\N
4561	\N	\N
4562	\N	\N
4563	\N	\N
4564	\N	\N
4565	\N	\N
4616	\N	\N
4617	\N	\N
4618	\N	\N
4619	\N	\N
4620	\N	\N
4681	\N	\N
4682	\N	\N
4683	\N	\N
4684	\N	\N
4685	\N	\N
4726	\N	\N
4727	\N	\N
4728	\N	\N
4729	\N	\N
4730	\N	\N
4766	\N	\N
4767	\N	\N
4768	\N	\N
4769	\N	\N
4770	\N	\N
4816	\N	\N
4817	\N	\N
2462	\N	\N
2463	\N	\N
2464	\N	\N
2465	\N	\N
2501	\N	\N
2502	\N	\N
2503	\N	\N
2504	\N	\N
2505	\N	\N
2571	\N	\N
2572	\N	\N
2573	\N	\N
2574	\N	\N
2575	\N	\N
2606	\N	\N
2607	\N	\N
2608	\N	\N
2609	\N	\N
2610	\N	\N
2651	\N	\N
2652	\N	\N
2653	\N	\N
2654	\N	\N
2655	\N	\N
2701	\N	\N
2702	\N	\N
2703	\N	\N
2704	\N	\N
2705	\N	\N
2741	\N	\N
2742	\N	\N
2743	\N	\N
2744	\N	\N
2745	\N	\N
2791	\N	\N
2792	\N	\N
2793	\N	\N
2794	\N	\N
2795	\N	\N
2841	\N	\N
2842	\N	\N
2843	\N	\N
2844	\N	\N
2845	\N	\N
2881	\N	\N
2882	\N	\N
2883	\N	\N
2884	\N	\N
2885	\N	\N
2931	\N	\N
2932	\N	\N
2933	\N	\N
2934	\N	\N
2935	\N	\N
2971	\N	\N
2972	\N	\N
2973	\N	\N
2974	\N	\N
2975	\N	\N
3031	\N	\N
3032	\N	\N
3033	\N	\N
3034	\N	\N
3035	\N	\N
3086	\N	\N
3087	\N	\N
3088	\N	\N
3089	\N	\N
3090	\N	\N
3141	\N	\N
3142	\N	\N
3143	\N	\N
3144	\N	\N
3145	\N	\N
3196	\N	\N
3197	\N	\N
3198	\N	\N
3199	\N	\N
3200	\N	\N
3241	\N	\N
3242	\N	\N
3243	\N	\N
3244	\N	\N
3245	\N	\N
3301	\N	\N
3302	\N	\N
3303	\N	\N
3304	\N	\N
3305	\N	\N
3356	\N	\N
3357	\N	\N
3358	\N	\N
3359	\N	\N
3360	\N	\N
3412	\N	\N
3461	\N	\N
3462	\N	\N
3463	\N	\N
3464	\N	\N
3465	\N	\N
3501	\N	\N
3502	\N	\N
3503	\N	\N
3504	\N	\N
3505	\N	\N
3551	\N	\N
3552	\N	\N
3553	\N	\N
3554	\N	\N
3555	\N	\N
3581	\N	\N
3582	\N	\N
3583	\N	\N
3584	\N	\N
3585	\N	\N
3657	\N	\N
3659	\N	\N
3660	\N	\N
3676	\N	\N
3677	\N	\N
3678	\N	\N
3679	\N	\N
3680	\N	\N
3726	\N	\N
3727	\N	\N
3728	\N	\N
3729	\N	\N
3730	\N	\N
3776	\N	\N
3777	\N	\N
3778	\N	\N
3779	\N	\N
3780	\N	\N
3811	\N	\N
3812	\N	\N
3813	\N	\N
3814	\N	\N
3815	\N	\N
3861	\N	\N
3862	\N	\N
3863	\N	\N
3864	\N	\N
3865	\N	\N
3926	\N	\N
3927	\N	\N
3928	\N	\N
3929	\N	\N
3930	\N	\N
3961	\N	\N
3962	\N	\N
3963	\N	\N
3964	\N	\N
3965	\N	\N
4011	\N	\N
4012	\N	\N
4013	\N	\N
4014	\N	\N
4015	\N	\N
4041	\N	\N
4042	\N	\N
4043	\N	\N
4044	\N	\N
4045	\N	\N
4091	\N	\N
4092	\N	\N
4093	\N	\N
4094	\N	\N
4095	\N	\N
4141	\N	\N
4142	\N	\N
4143	\N	\N
4144	\N	\N
4145	\N	\N
4171	\N	\N
4172	\N	\N
4173	\N	\N
4174	\N	\N
4175	\N	\N
4221	\N	\N
4222	\N	\N
4223	\N	\N
4224	\N	\N
4225	\N	\N
4256	\N	\N
4257	\N	\N
4258	\N	\N
4259	\N	\N
4260	\N	\N
4306	\N	\N
4307	\N	\N
4308	\N	\N
4309	\N	\N
4310	\N	\N
4336	\N	\N
4337	\N	\N
4338	\N	\N
4339	\N	\N
4340	\N	\N
4386	\N	\N
4387	\N	\N
4388	\N	\N
4389	\N	\N
4390	\N	\N
4421	\N	\N
4422	\N	\N
4423	\N	\N
4424	\N	\N
4425	\N	\N
4471	\N	\N
4472	\N	\N
4473	\N	\N
4474	\N	\N
4475	\N	\N
4501	\N	\N
4502	\N	\N
4503	\N	\N
4504	\N	\N
4505	\N	\N
4551	\N	\N
4552	\N	\N
3411	eos.io	https://eos.io/
2478	\N	\N
2479	\N	\N
2480	\N	\N
2541	\N	\N
2542	\N	\N
2543	\N	\N
2544	\N	\N
2545	\N	\N
2591	\N	\N
2592	\N	\N
2593	\N	\N
2594	\N	\N
2595	\N	\N
2646	\N	\N
2647	\N	\N
2648	\N	\N
2649	\N	\N
2650	\N	\N
2696	\N	\N
2697	\N	\N
2698	\N	\N
2699	\N	\N
2700	\N	\N
2746	\N	\N
2747	\N	\N
2748	\N	\N
2749	\N	\N
2750	\N	\N
2796	\N	\N
2797	\N	\N
2798	\N	\N
2799	\N	\N
2800	\N	\N
2846	\N	\N
2847	\N	\N
2848	\N	\N
2849	\N	\N
2850	\N	\N
2886	\N	\N
2887	\N	\N
2888	\N	\N
2889	\N	\N
2890	\N	\N
2951	\N	\N
2952	\N	\N
2953	\N	\N
2954	\N	\N
2955	\N	\N
3011	\N	\N
3012	\N	\N
3013	\N	\N
3014	\N	\N
3015	\N	\N
3056	\N	\N
3057	\N	\N
3058	\N	\N
3059	\N	\N
3060	\N	\N
3121	\N	\N
3122	\N	\N
3123	\N	\N
3124	\N	\N
3125	\N	\N
3176	\N	\N
3177	\N	\N
3178	\N	\N
3179	\N	\N
3180	\N	\N
3221	\N	\N
3222	\N	\N
3223	\N	\N
3224	\N	\N
3225	\N	\N
3266	\N	\N
3267	\N	\N
3268	\N	\N
3269	\N	\N
3270	\N	\N
3331	\N	\N
3332	\N	\N
3333	\N	\N
3334	\N	\N
3335	\N	\N
3366	\N	\N
3367	\N	\N
3368	\N	\N
3369	\N	\N
3370	\N	\N
3431	\N	\N
3432	\N	\N
3433	\N	\N
3434	\N	\N
3435	\N	\N
3486	\N	\N
3487	\N	\N
3488	\N	\N
3489	\N	\N
3490	\N	\N
3546	\N	\N
3547	\N	\N
3548	\N	\N
3549	\N	\N
3550	\N	\N
3586	\N	\N
3587	\N	\N
3588	\N	\N
3589	\N	\N
3590	\N	\N
3646	\N	\N
3647	\N	\N
3648	\N	\N
3649	\N	\N
3650	\N	\N
3697	\N	\N
3731	\N	\N
3732	\N	\N
3733	\N	\N
3734	\N	\N
3735	\N	\N
3796	\N	\N
3797	\N	\N
3798	\N	\N
3799	\N	\N
3800	\N	\N
3846	\N	\N
3847	\N	\N
3848	\N	\N
3849	\N	\N
3850	\N	\N
3886	\N	\N
3887	\N	\N
3888	\N	\N
3889	\N	\N
3890	\N	\N
3941	\N	\N
3942	\N	\N
3943	\N	\N
3944	\N	\N
3945	\N	\N
4006	\N	\N
4007	\N	\N
4008	\N	\N
4009	\N	\N
4010	\N	\N
4046	\N	\N
4047	\N	\N
4048	\N	\N
4049	\N	\N
4050	\N	\N
4096	\N	\N
4097	\N	\N
4098	\N	\N
4099	\N	\N
4100	\N	\N
4146	\N	\N
4147	\N	\N
4148	\N	\N
4149	\N	\N
4150	\N	\N
4196	\N	\N
4197	\N	\N
4198	\N	\N
4199	\N	\N
4200	\N	\N
4226	\N	\N
4227	\N	\N
4228	\N	\N
4229	\N	\N
4230	\N	\N
4276	\N	\N
4277	\N	\N
4278	\N	\N
4279	\N	\N
4280	\N	\N
4311	\N	\N
4312	\N	\N
4313	\N	\N
4314	\N	\N
4315	\N	\N
4361	\N	\N
4362	\N	\N
4363	\N	\N
4364	\N	\N
4365	\N	\N
4391	\N	\N
4392	\N	\N
4393	\N	\N
4394	\N	\N
4395	\N	\N
4441	\N	\N
4442	\N	\N
4443	\N	\N
4444	\N	\N
4445	\N	\N
4476	\N	\N
4477	\N	\N
4478	\N	\N
4479	\N	\N
4480	\N	\N
4526	\N	\N
4527	\N	\N
4528	\N	\N
4529	\N	\N
4530	\N	\N
4556	\N	\N
4557	\N	\N
4558	\N	\N
4559	\N	\N
4560	\N	\N
4606	\N	\N
4607	\N	\N
4608	\N	\N
4609	\N	\N
4610	\N	\N
4641	\N	\N
4642	\N	\N
4643	\N	\N
4644	\N	\N
4645	\N	\N
4691	\N	\N
4692	\N	\N
4693	\N	\N
2487	\N	\N
2488	\N	\N
2489	\N	\N
2490	\N	\N
2526	\N	\N
2527	\N	\N
2528	\N	\N
2529	\N	\N
2530	\N	\N
2576	\N	\N
2577	\N	\N
2578	\N	\N
2579	\N	\N
2580	\N	\N
2611	\N	\N
2612	\N	\N
2613	\N	\N
2614	\N	\N
2615	\N	\N
2656	\N	\N
2657	\N	\N
2658	\N	\N
2659	\N	\N
2660	\N	\N
2706	\N	\N
2707	\N	\N
2708	\N	\N
2709	\N	\N
2710	\N	\N
2771	\N	\N
2772	\N	\N
2773	\N	\N
2774	\N	\N
2775	\N	\N
2821	\N	\N
2822	\N	\N
2823	\N	\N
2824	\N	\N
2825	\N	\N
2866	\N	\N
2867	\N	\N
2868	\N	\N
2869	\N	\N
2870	\N	\N
2926	\N	\N
2927	\N	\N
2928	\N	\N
2929	\N	\N
2930	\N	\N
2966	\N	\N
2967	\N	\N
2968	\N	\N
2969	\N	\N
2970	\N	\N
3016	\N	\N
3017	\N	\N
3018	\N	\N
3019	\N	\N
3020	\N	\N
3046	\N	\N
3047	\N	\N
3048	\N	\N
3049	\N	\N
3050	\N	\N
3096	\N	\N
3097	\N	\N
3098	\N	\N
3099	\N	\N
3100	\N	\N
3131	\N	\N
3132	\N	\N
3133	\N	\N
3134	\N	\N
3135	\N	\N
3181	\N	\N
3182	\N	\N
3183	\N	\N
3184	\N	\N
3185	\N	\N
3226	\N	\N
3227	\N	\N
3228	\N	\N
3229	\N	\N
3230	\N	\N
3261	\N	\N
3262	\N	\N
3263	\N	\N
3264	\N	\N
3265	\N	\N
3311	\N	\N
3312	\N	\N
3313	\N	\N
3314	\N	\N
3315	\N	\N
3336	\N	\N
3337	\N	\N
3338	\N	\N
3339	\N	\N
3340	\N	\N
3386	\N	\N
3387	\N	\N
3388	\N	\N
3389	\N	\N
3390	\N	\N
3436	\N	\N
3437	\N	\N
3438	\N	\N
3439	\N	\N
3440	\N	\N
3471	\N	\N
3472	\N	\N
3473	\N	\N
3474	\N	\N
3475	\N	\N
3521	\N	\N
3522	\N	\N
3523	\N	\N
3524	\N	\N
3525	\N	\N
3556	\N	\N
3557	\N	\N
3558	\N	\N
3559	\N	\N
3560	\N	\N
3606	\N	\N
3607	\N	\N
3608	\N	\N
3609	\N	\N
3610	\N	\N
3631	\N	\N
3632	\N	\N
3633	\N	\N
3634	\N	\N
3635	\N	\N
3701	\N	\N
3702	\N	\N
3703	\N	\N
3704	\N	\N
3705	\N	\N
3751	\N	\N
3752	\N	\N
3753	\N	\N
3754	\N	\N
3755	\N	\N
3801	\N	\N
3802	\N	\N
3803	\N	\N
3804	\N	\N
3805	\N	\N
3851	\N	\N
3852	\N	\N
3853	\N	\N
3854	\N	\N
3855	\N	\N
3901	\N	\N
3902	\N	\N
3903	\N	\N
3904	\N	\N
3905	\N	\N
3931	\N	\N
3932	\N	\N
3933	\N	\N
3934	\N	\N
3935	\N	\N
3981	\N	\N
3982	\N	\N
3983	\N	\N
3984	\N	\N
3985	\N	\N
4016	\N	\N
4017	\N	\N
4018	\N	\N
4019	\N	\N
4020	\N	\N
4066	\N	\N
4067	\N	\N
4068	\N	\N
4069	\N	\N
4070	\N	\N
4166	\N	\N
4167	\N	\N
4168	\N	\N
4169	\N	\N
4170	\N	\N
4201	\N	\N
4202	\N	\N
4203	\N	\N
4204	\N	\N
4205	\N	\N
4251	\N	\N
4252	\N	\N
4253	\N	\N
4254	\N	\N
4255	\N	\N
4281	\N	\N
4282	\N	\N
4283	\N	\N
4284	\N	\N
4285	\N	\N
4331	\N	\N
4332	\N	\N
4333	\N	\N
4334	\N	\N
4335	\N	\N
4366	\N	\N
4367	\N	\N
4368	\N	\N
4369	\N	\N
4370	\N	\N
4416	\N	\N
4417	\N	\N
4418	\N	\N
4419	\N	\N
4420	\N	\N
4446	\N	\N
4447	\N	\N
4448	\N	\N
4449	\N	\N
4450	\N	\N
4496	\N	\N
4497	\N	\N
2517	\N	\N
2518	\N	\N
2519	\N	\N
2520	\N	\N
2551	\N	\N
2552	\N	\N
2553	\N	\N
2554	\N	\N
2555	\N	\N
2616	\N	\N
2617	\N	\N
2618	\N	\N
2619	\N	\N
2620	\N	\N
2661	\N	\N
2662	\N	\N
2663	\N	\N
2664	\N	\N
2665	\N	\N
2711	\N	\N
2712	\N	\N
2713	\N	\N
2714	\N	\N
2715	\N	\N
2766	\N	\N
2767	\N	\N
2768	\N	\N
2769	\N	\N
2770	\N	\N
2816	\N	\N
2817	\N	\N
2818	\N	\N
2819	\N	\N
2820	\N	\N
2861	\N	\N
2862	\N	\N
2863	\N	\N
2864	\N	\N
2865	\N	\N
2906	\N	\N
2907	\N	\N
2908	\N	\N
2909	\N	\N
2910	\N	\N
2936	\N	\N
2937	\N	\N
2938	\N	\N
2939	\N	\N
2940	\N	\N
2986	\N	\N
2987	\N	\N
2988	\N	\N
2989	\N	\N
2990	\N	\N
3021	\N	\N
3022	\N	\N
3023	\N	\N
3024	\N	\N
3025	\N	\N
3071	\N	\N
3072	\N	\N
3073	\N	\N
3074	\N	\N
3075	\N	\N
3106	\N	\N
3107	\N	\N
3108	\N	\N
3109	\N	\N
3110	\N	\N
3166	\N	\N
3167	\N	\N
3168	\N	\N
3169	\N	\N
3170	\N	\N
3216	\N	\N
3217	\N	\N
3218	\N	\N
3219	\N	\N
3220	\N	\N
3271	\N	\N
3272	\N	\N
3273	\N	\N
3274	\N	\N
3275	\N	\N
3321	\N	\N
3322	\N	\N
3323	\N	\N
3324	\N	\N
3325	\N	\N
3381	\N	\N
3382	\N	\N
3383	\N	\N
3384	\N	\N
3385	\N	\N
3416	\N	\N
3417	\N	\N
3418	\N	\N
3419	\N	\N
3420	\N	\N
3466	\N	\N
3467	\N	\N
3468	\N	\N
3469	\N	\N
3470	\N	\N
3506	\N	\N
3507	\N	\N
3508	\N	\N
3509	\N	\N
3510	\N	\N
3566	\N	\N
3567	\N	\N
3568	\N	\N
3569	\N	\N
3570	\N	\N
3616	\N	\N
3617	\N	\N
3618	\N	\N
3619	\N	\N
3620	\N	\N
3671	\N	\N
3672	\N	\N
3673	\N	\N
3674	\N	\N
3675	\N	\N
3711	\N	\N
3712	\N	\N
3713	\N	\N
3714	\N	\N
3715	\N	\N
3766	\N	\N
3767	\N	\N
3768	\N	\N
3769	\N	\N
3770	\N	\N
3821	\N	\N
3822	\N	\N
3823	\N	\N
3824	\N	\N
3825	\N	\N
3871	\N	\N
3872	\N	\N
3873	\N	\N
3874	\N	\N
3875	\N	\N
3921	\N	\N
3922	\N	\N
3923	\N	\N
3924	\N	\N
3925	\N	\N
3966	\N	\N
3967	\N	\N
3968	\N	\N
3969	\N	\N
3970	\N	\N
4031	\N	\N
4032	\N	\N
4033	\N	\N
4034	\N	\N
4035	\N	\N
4081	\N	\N
4082	\N	\N
4083	\N	\N
4084	\N	\N
4085	\N	\N
4131	\N	\N
4132	\N	\N
4133	\N	\N
4134	\N	\N
4135	\N	\N
4176	\N	\N
4177	\N	\N
4178	\N	\N
4179	\N	\N
4180	\N	\N
4236	\N	\N
4237	\N	\N
4238	\N	\N
4239	\N	\N
4240	\N	\N
4296	\N	\N
4297	\N	\N
4298	\N	\N
4299	\N	\N
4300	\N	\N
4342	\N	\N
4396	\N	\N
4397	\N	\N
4398	\N	\N
4399	\N	\N
4400	\N	\N
4456	\N	\N
4457	\N	\N
4458	\N	\N
4459	\N	\N
4460	\N	\N
4506	\N	\N
4507	\N	\N
4508	\N	\N
4509	\N	\N
4510	\N	\N
4566	\N	\N
4567	\N	\N
4568	\N	\N
4569	\N	\N
4570	\N	\N
4621	\N	\N
4622	\N	\N
4623	\N	\N
4624	\N	\N
4625	\N	\N
4671	\N	\N
4672	\N	\N
4673	\N	\N
4674	\N	\N
4675	\N	\N
4716	\N	\N
4717	\N	\N
4718	\N	\N
4719	\N	\N
4720	\N	\N
4771	\N	\N
4772	\N	\N
2522	\N	\N
2523	\N	\N
2524	\N	\N
2525	\N	\N
2556	\N	\N
2557	\N	\N
2558	\N	\N
2559	\N	\N
2560	\N	\N
2626	\N	\N
2627	\N	\N
2628	\N	\N
2629	\N	\N
2630	\N	\N
2676	\N	\N
2677	\N	\N
2678	\N	\N
2679	\N	\N
2680	\N	\N
2716	\N	\N
2717	\N	\N
2718	\N	\N
2719	\N	\N
2720	\N	\N
2756	\N	\N
2757	\N	\N
2758	\N	\N
2759	\N	\N
2760	\N	\N
2806	\N	\N
2807	\N	\N
2808	\N	\N
2809	\N	\N
2810	\N	\N
2856	\N	\N
2857	\N	\N
2858	\N	\N
2859	\N	\N
2860	\N	\N
2921	\N	\N
2922	\N	\N
2923	\N	\N
2924	\N	\N
2925	\N	\N
2981	\N	\N
2982	\N	\N
2983	\N	\N
2984	\N	\N
2985	\N	\N
3036	\N	\N
3037	\N	\N
3038	\N	\N
3039	\N	\N
3040	\N	\N
3091	\N	\N
3092	\N	\N
3093	\N	\N
3094	\N	\N
3095	\N	\N
3146	\N	\N
3147	\N	\N
3148	\N	\N
3149	\N	\N
3150	\N	\N
3201	\N	\N
3202	\N	\N
3203	\N	\N
3204	\N	\N
3205	\N	\N
3246	\N	\N
3247	\N	\N
3248	\N	\N
3249	\N	\N
3250	\N	\N
3306	\N	\N
3307	\N	\N
3308	\N	\N
3309	\N	\N
3310	\N	\N
3361	\N	\N
3362	\N	\N
3363	\N	\N
3364	\N	\N
3365	\N	\N
3401	\N	\N
3402	\N	\N
3403	\N	\N
3404	\N	\N
3405	\N	\N
3451	\N	\N
3452	\N	\N
3453	\N	\N
3454	\N	\N
3455	\N	\N
3516	\N	\N
3517	\N	\N
3518	\N	\N
3519	\N	\N
3520	\N	\N
3571	\N	\N
3572	\N	\N
3573	\N	\N
3574	\N	\N
3575	\N	\N
3621	\N	\N
3622	\N	\N
3623	\N	\N
3624	\N	\N
3625	\N	\N
3661	\N	\N
3662	\N	\N
3663	\N	\N
3664	\N	\N
3665	\N	\N
3716	\N	\N
3717	\N	\N
3718	\N	\N
3719	\N	\N
3720	\N	\N
3771	\N	\N
3772	\N	\N
3773	\N	\N
3774	\N	\N
3775	\N	\N
3826	\N	\N
3827	\N	\N
3828	\N	\N
3829	\N	\N
3830	\N	\N
3876	\N	\N
3877	\N	\N
3878	\N	\N
3879	\N	\N
3880	\N	\N
3906	\N	\N
3907	\N	\N
3908	\N	\N
3909	\N	\N
3910	\N	\N
3956	\N	\N
3957	\N	\N
3958	\N	\N
3959	\N	\N
3960	\N	\N
3986	\N	\N
3987	\N	\N
3988	\N	\N
3989	\N	\N
3990	\N	\N
4036	\N	\N
4037	\N	\N
4038	\N	\N
4039	\N	\N
4040	\N	\N
4071	\N	\N
4072	\N	\N
4073	\N	\N
4074	\N	\N
4075	\N	\N
4121	\N	\N
4122	\N	\N
4123	\N	\N
4124	\N	\N
4125	\N	\N
4191	\N	\N
4192	\N	\N
4193	\N	\N
4194	\N	\N
4195	\N	\N
4241	\N	\N
4242	\N	\N
4243	\N	\N
4244	\N	\N
4245	\N	\N
4301	\N	\N
4302	\N	\N
4303	\N	\N
4304	\N	\N
4305	\N	\N
4356	\N	\N
4357	\N	\N
4358	\N	\N
4359	\N	\N
4360	\N	\N
4406	\N	\N
4407	\N	\N
4408	\N	\N
4409	\N	\N
4410	\N	\N
4466	\N	\N
4467	\N	\N
4468	\N	\N
4469	\N	\N
4470	\N	\N
4521	\N	\N
4522	\N	\N
4523	\N	\N
4524	\N	\N
4525	\N	\N
4576	\N	\N
4577	\N	\N
4578	\N	\N
4579	\N	\N
4580	\N	\N
4631	\N	\N
4632	\N	\N
4633	\N	\N
4634	\N	\N
4635	\N	\N
4686	\N	\N
4687	\N	\N
4688	\N	\N
4689	\N	\N
4690	\N	\N
4736	\N	\N
4737	\N	\N
4738	\N	\N
4739	\N	\N
4740	\N	\N
4791	\N	\N
4792	\N	\N
4793	\N	\N
4794	\N	\N
4795	\N	\N
4836	\N	\N
4837	\N	\N
2532	\N	\N
2533	\N	\N
2534	\N	\N
2535	\N	\N
2586	\N	\N
2587	\N	\N
2588	\N	\N
2589	\N	\N
2590	\N	\N
2641	\N	\N
2642	\N	\N
2643	\N	\N
2644	\N	\N
2645	\N	\N
2691	\N	\N
2692	\N	\N
2693	\N	\N
2694	\N	\N
2695	\N	\N
2731	\N	\N
2732	\N	\N
2733	\N	\N
2734	\N	\N
2735	\N	\N
2776	\N	\N
2777	\N	\N
2778	\N	\N
2779	\N	\N
2780	\N	\N
2826	\N	\N
2827	\N	\N
2828	\N	\N
2829	\N	\N
2830	\N	\N
2871	\N	\N
2872	\N	\N
2873	\N	\N
2874	\N	\N
2875	\N	\N
2911	\N	\N
2912	\N	\N
2913	\N	\N
2914	\N	\N
2915	\N	\N
2961	\N	\N
2962	\N	\N
2963	\N	\N
2964	\N	\N
2965	\N	\N
2996	\N	\N
2997	\N	\N
2998	\N	\N
2999	\N	\N
3000	\N	\N
3061	\N	\N
3062	\N	\N
3063	\N	\N
3064	\N	\N
3065	\N	\N
3116	\N	\N
3117	\N	\N
3118	\N	\N
3119	\N	\N
3120	\N	\N
3161	\N	\N
3162	\N	\N
3163	\N	\N
3164	\N	\N
3165	\N	\N
3211	\N	\N
3212	\N	\N
3213	\N	\N
3214	\N	\N
3215	\N	\N
3276	\N	\N
3277	\N	\N
3278	\N	\N
3279	\N	\N
3280	\N	\N
3326	\N	\N
3327	\N	\N
3328	\N	\N
3329	\N	\N
3330	\N	\N
3376	\N	\N
3377	\N	\N
3378	\N	\N
3379	\N	\N
3380	\N	\N
3426	\N	\N
3427	\N	\N
3428	\N	\N
3429	\N	\N
3430	\N	\N
3481	\N	\N
3482	\N	\N
3483	\N	\N
3484	\N	\N
3485	\N	\N
3541	\N	\N
3542	\N	\N
3543	\N	\N
3544	\N	\N
3545	\N	\N
3596	\N	\N
3597	\N	\N
3598	\N	\N
3599	\N	\N
3600	\N	\N
3641	\N	\N
3642	\N	\N
3643	\N	\N
3644	\N	\N
3645	\N	\N
3691	\N	\N
3692	\N	\N
3693	\N	\N
3694	\N	\N
3695	\N	\N
3746	\N	\N
3747	\N	\N
3748	\N	\N
3749	\N	\N
3750	\N	\N
3781	\N	\N
3782	\N	\N
3783	\N	\N
3784	\N	\N
3785	\N	\N
3839	\N	\N
3842	\N	\N
3843	\N	\N
3844	\N	\N
3845	\N	\N
3891	\N	\N
3892	\N	\N
3893	\N	\N
3894	\N	\N
3895	\N	\N
3951	\N	\N
3952	\N	\N
3953	\N	\N
3954	\N	\N
3955	\N	\N
3996	\N	\N
3997	\N	\N
3998	\N	\N
3999	\N	\N
4000	\N	\N
4051	\N	\N
4052	\N	\N
4053	\N	\N
4054	\N	\N
4055	\N	\N
4111	\N	\N
4112	\N	\N
4113	\N	\N
4114	\N	\N
4115	\N	\N
4161	\N	\N
4162	\N	\N
4163	\N	\N
4164	\N	\N
4165	\N	\N
4206	\N	\N
4207	\N	\N
4208	\N	\N
4209	\N	\N
4210	\N	\N
4271	\N	\N
4272	\N	\N
4273	\N	\N
4274	\N	\N
4275	\N	\N
4316	\N	\N
4317	\N	\N
4318	\N	\N
4319	\N	\N
4320	\N	\N
4371	\N	\N
4372	\N	\N
4373	\N	\N
4374	\N	\N
4375	\N	\N
4426	\N	\N
4427	\N	\N
4428	\N	\N
4429	\N	\N
4430	\N	\N
4481	\N	\N
4482	\N	\N
4483	\N	\N
4484	\N	\N
4485	\N	\N
4536	\N	\N
4537	\N	\N
4538	\N	\N
4539	\N	\N
4540	\N	\N
4591	\N	\N
4592	\N	\N
4593	\N	\N
4594	\N	\N
4595	\N	\N
4651	\N	\N
4652	\N	\N
4653	\N	\N
4654	\N	\N
4655	\N	\N
4696	\N	\N
4697	\N	\N
4698	\N	\N
4699	\N	\N
4700	\N	\N
4746	\N	\N
4747	\N	\N
4748	\N	\N
4749	\N	\N
4750	\N	\N
4786	\N	\N
4787	\N	\N
4788	\N	\N
4789	\N	\N
4790	\N	\N
4831	\N	\N
4832	\N	\N
2537	\N	\N
2538	\N	\N
2539	\N	\N
2540	\N	\N
2581	\N	\N
2582	\N	\N
2583	\N	\N
2584	\N	\N
2585	\N	\N
2631	\N	\N
2632	\N	\N
2633	\N	\N
2634	\N	\N
2635	\N	\N
2681	\N	\N
2682	\N	\N
2683	\N	\N
2684	\N	\N
2685	\N	\N
2736	\N	\N
2737	\N	\N
2738	\N	\N
2739	\N	\N
2740	\N	\N
2781	\N	\N
2782	\N	\N
2783	\N	\N
2784	\N	\N
2785	\N	\N
2831	\N	\N
2832	\N	\N
2833	\N	\N
2834	\N	\N
2835	\N	\N
2896	\N	\N
2897	\N	\N
2898	\N	\N
2899	\N	\N
2900	\N	\N
2941	\N	\N
2942	\N	\N
2943	\N	\N
2944	\N	\N
2945	\N	\N
3001	\N	\N
3002	\N	\N
3003	\N	\N
3004	\N	\N
3005	\N	\N
3051	\N	\N
3052	\N	\N
3053	\N	\N
3054	\N	\N
3055	\N	\N
3111	\N	\N
3112	\N	\N
3113	\N	\N
3114	\N	\N
3115	\N	\N
3171	\N	\N
3172	\N	\N
3173	\N	\N
3174	\N	\N
3175	\N	\N
3251	\N	\N
3252	\N	\N
3253	\N	\N
3254	\N	\N
3255	\N	\N
3291	\N	\N
3292	\N	\N
3293	\N	\N
3294	\N	\N
3295	\N	\N
3346	\N	\N
3347	\N	\N
3348	\N	\N
3349	\N	\N
3350	\N	\N
3391	\N	\N
3392	\N	\N
3393	\N	\N
3394	\N	\N
3395	\N	\N
3441	\N	\N
3442	\N	\N
3443	\N	\N
3444	\N	\N
3445	\N	\N
3476	\N	\N
3477	\N	\N
3478	\N	\N
3479	\N	\N
3480	\N	\N
3531	\N	\N
3532	\N	\N
3533	\N	\N
3534	\N	\N
3535	\N	\N
3591	\N	\N
3592	\N	\N
3593	\N	\N
3594	\N	\N
3595	\N	\N
3651	\N	\N
3652	\N	\N
3653	\N	\N
3654	\N	\N
3655	\N	\N
3686	\N	\N
3687	\N	\N
3688	\N	\N
3689	\N	\N
3690	\N	\N
3741	\N	\N
3742	\N	\N
3743	\N	\N
3744	\N	\N
3745	\N	\N
3786	\N	\N
3787	\N	\N
3788	\N	\N
3789	\N	\N
3790	\N	\N
3831	\N	\N
3832	\N	\N
3833	\N	\N
3834	\N	\N
3835	\N	\N
3881	\N	\N
3882	\N	\N
3883	\N	\N
3884	\N	\N
3885	\N	\N
3936	\N	\N
3937	\N	\N
3938	\N	\N
3939	\N	\N
3940	\N	\N
4001	\N	\N
4002	\N	\N
4003	\N	\N
4004	\N	\N
4005	\N	\N
4061	\N	\N
4062	\N	\N
4063	\N	\N
4064	\N	\N
4065	\N	\N
4106	\N	\N
4107	\N	\N
4108	\N	\N
4109	\N	\N
4110	\N	\N
4156	\N	\N
4157	\N	\N
4158	\N	\N
4159	\N	\N
4160	\N	\N
4211	\N	\N
4212	\N	\N
4213	\N	\N
4214	\N	\N
4215	\N	\N
4266	\N	\N
4267	\N	\N
4268	\N	\N
4269	\N	\N
4270	\N	\N
4326	\N	\N
4327	\N	\N
4328	\N	\N
4329	\N	\N
4330	\N	\N
4376	\N	\N
4377	\N	\N
4378	\N	\N
4379	\N	\N
4380	\N	\N
4431	\N	\N
4432	\N	\N
4433	\N	\N
4434	\N	\N
4435	\N	\N
4486	\N	\N
4487	\N	\N
4488	\N	\N
4489	\N	\N
4490	\N	\N
4546	\N	\N
4547	\N	\N
4548	\N	\N
4549	\N	\N
4550	\N	\N
4601	\N	\N
4602	\N	\N
4603	\N	\N
4604	\N	\N
4605	\N	\N
4656	\N	\N
4657	\N	\N
4658	\N	\N
4659	\N	\N
4660	\N	\N
4706	\N	\N
4707	\N	\N
4708	\N	\N
4709	\N	\N
4710	\N	\N
4751	\N	\N
4752	\N	\N
4753	\N	\N
4754	\N	\N
4755	\N	\N
4811	\N	\N
4812	\N	\N
4813	\N	\N
4814	\N	\N
4815	\N	\N
4861	\N	\N
4862	\N	\N
4863	\N	\N
4864	\N	\N
4865	\N	\N
4911	\N	\N
4912	\N	\N
2597	\N	\N
2598	\N	\N
2599	\N	\N
2600	\N	\N
2636	\N	\N
2637	\N	\N
2638	\N	\N
2639	\N	\N
2640	\N	\N
2686	\N	\N
2687	\N	\N
2688	\N	\N
2689	\N	\N
2690	\N	\N
2751	\N	\N
2752	\N	\N
2753	\N	\N
2754	\N	\N
2755	\N	\N
2801	\N	\N
2802	\N	\N
2803	\N	\N
2804	\N	\N
2805	\N	\N
2851	\N	\N
2852	\N	\N
2853	\N	\N
2854	\N	\N
2855	\N	\N
2891	\N	\N
2892	\N	\N
2893	\N	\N
2894	\N	\N
2895	\N	\N
2956	\N	\N
2957	\N	\N
2958	\N	\N
2959	\N	\N
2960	\N	\N
2991	\N	\N
2992	\N	\N
2993	\N	\N
2994	\N	\N
2995	\N	\N
3041	\N	\N
3042	\N	\N
3043	\N	\N
3044	\N	\N
3045	\N	\N
3076	\N	\N
3077	\N	\N
3078	\N	\N
3079	\N	\N
3080	\N	\N
3126	\N	\N
3127	\N	\N
3128	\N	\N
3129	\N	\N
3130	\N	\N
3156	\N	\N
3157	\N	\N
3158	\N	\N
3159	\N	\N
3160	\N	\N
3206	\N	\N
3207	\N	\N
3208	\N	\N
3209	\N	\N
3210	\N	\N
3256	\N	\N
3257	\N	\N
3258	\N	\N
3259	\N	\N
3260	\N	\N
3286	\N	\N
3287	\N	\N
3288	\N	\N
3289	\N	\N
3290	\N	\N
3341	\N	\N
3342	\N	\N
3343	\N	\N
3344	\N	\N
3345	\N	\N
3396	\N	\N
3397	\N	\N
3398	\N	\N
3399	\N	\N
3400	\N	\N
3446	\N	\N
3447	\N	\N
3448	\N	\N
3449	\N	\N
3450	\N	\N
3496	\N	\N
3497	\N	\N
3498	\N	\N
3499	\N	\N
3500	\N	\N
3526	\N	\N
3527	\N	\N
3528	\N	\N
3529	\N	\N
3530	\N	\N
3577	\N	\N
3636	\N	\N
3637	\N	\N
3638	\N	\N
3639	\N	\N
3640	\N	\N
3706	\N	\N
3707	\N	\N
3708	\N	\N
3709	\N	\N
3710	\N	\N
3756	\N	\N
3757	\N	\N
3758	\N	\N
3759	\N	\N
3760	\N	\N
3806	\N	\N
3807	\N	\N
3808	\N	\N
3809	\N	\N
3810	\N	\N
3856	\N	\N
3857	\N	\N
3858	\N	\N
3859	\N	\N
3860	\N	\N
3911	\N	\N
3912	\N	\N
3913	\N	\N
3914	\N	\N
3915	\N	\N
3976	\N	\N
3977	\N	\N
3978	\N	\N
3979	\N	\N
3980	\N	\N
4026	\N	\N
4027	\N	\N
4028	\N	\N
4029	\N	\N
4030	\N	\N
4086	\N	\N
4087	\N	\N
4088	\N	\N
4089	\N	\N
4090	\N	\N
4136	\N	\N
4137	\N	\N
4138	\N	\N
4139	\N	\N
4140	\N	\N
4181	\N	\N
4182	\N	\N
4183	\N	\N
4184	\N	\N
4185	\N	\N
4246	\N	\N
4247	\N	\N
4248	\N	\N
4249	\N	\N
4250	\N	\N
4291	\N	\N
4292	\N	\N
4293	\N	\N
4294	\N	\N
4295	\N	\N
4346	\N	\N
4347	\N	\N
4348	\N	\N
4349	\N	\N
4350	\N	\N
4411	\N	\N
4412	\N	\N
4413	\N	\N
4414	\N	\N
4415	\N	\N
4461	\N	\N
4462	\N	\N
4463	\N	\N
4464	\N	\N
4465	\N	\N
4511	\N	\N
4512	\N	\N
4513	\N	\N
4514	\N	\N
4515	\N	\N
4571	\N	\N
4572	\N	\N
4573	\N	\N
4574	\N	\N
4575	\N	\N
4626	\N	\N
4627	\N	\N
4628	\N	\N
4629	\N	\N
4630	\N	\N
4676	\N	\N
4677	\N	\N
4678	\N	\N
4679	\N	\N
4680	\N	\N
4721	\N	\N
4722	\N	\N
4723	\N	\N
4724	\N	\N
4725	\N	\N
4781	\N	\N
4782	\N	\N
4783	\N	\N
4784	\N	\N
4785	\N	\N
4846	\N	\N
4847	\N	\N
4848	\N	\N
4849	\N	\N
4850	\N	\N
4896	\N	\N
4897	\N	\N
4498	\N	\N
4499	\N	\N
4500	\N	\N
4531	\N	\N
4532	\N	\N
4533	\N	\N
4534	\N	\N
4535	\N	\N
4581	\N	\N
4582	\N	\N
4583	\N	\N
4584	\N	\N
4585	\N	\N
4611	\N	\N
4612	\N	\N
4613	\N	\N
4614	\N	\N
4615	\N	\N
4661	\N	\N
4662	\N	\N
4663	\N	\N
4664	\N	\N
4665	\N	\N
4711	\N	\N
4712	\N	\N
4713	\N	\N
4714	\N	\N
4715	\N	\N
4761	\N	\N
4762	\N	\N
4763	\N	\N
4764	\N	\N
4765	\N	\N
4806	\N	\N
4807	\N	\N
4808	\N	\N
4809	\N	\N
4810	\N	\N
4856	\N	\N
4857	\N	\N
4858	\N	\N
4859	\N	\N
4860	\N	\N
4906	\N	\N
4907	\N	\N
4908	\N	\N
4909	\N	\N
4910	\N	\N
4956	\N	\N
4957	\N	\N
4958	\N	\N
4959	\N	\N
4960	\N	\N
5001	\N	\N
5002	\N	\N
5003	\N	\N
5004	\N	\N
5005	\N	\N
5051	\N	\N
5052	\N	\N
5053	\N	\N
5054	\N	\N
5055	\N	\N
5101	\N	\N
5102	\N	\N
5103	\N	\N
5104	\N	\N
5105	\N	\N
5161	\N	\N
5162	\N	\N
5163	\N	\N
5164	\N	\N
5165	\N	\N
5216	\N	\N
5217	\N	\N
5218	\N	\N
5219	\N	\N
5220	\N	\N
5271	\N	\N
5272	\N	\N
5273	\N	\N
5274	\N	\N
5275	\N	\N
5321	\N	\N
5322	\N	\N
5323	\N	\N
5324	\N	\N
5325	\N	\N
5381	\N	\N
5382	\N	\N
5383	\N	\N
5384	\N	\N
5385	\N	\N
5431	\N	\N
5432	\N	\N
5433	\N	\N
5434	\N	\N
5435	\N	\N
5486	\N	\N
5487	\N	\N
5488	\N	\N
5489	\N	\N
5490	\N	\N
5546	\N	\N
5547	\N	\N
5548	\N	\N
5549	\N	\N
5550	\N	\N
5596	\N	\N
5597	\N	\N
5598	\N	\N
5599	\N	\N
5600	\N	\N
5646	\N	\N
5647	\N	\N
5648	\N	\N
5649	\N	\N
5650	\N	\N
5712	\N	\N
5717	\N	\N
5718	\N	\N
5719	\N	\N
5720	\N	\N
5761	\N	\N
5762	\N	\N
5763	\N	\N
5764	\N	\N
5765	\N	\N
5821	\N	\N
5822	\N	\N
5823	\N	\N
5824	\N	\N
5825	\N	\N
5876	\N	\N
5877	\N	\N
5878	\N	\N
5879	\N	\N
5880	\N	\N
5921	\N	\N
5922	\N	\N
5923	\N	\N
5924	\N	\N
5925	\N	\N
5986	\N	\N
5987	\N	\N
5988	\N	\N
5989	\N	\N
5990	\N	\N
6041	\N	\N
6042	\N	\N
6043	\N	\N
6044	\N	\N
6045	\N	\N
6096	\N	\N
6097	\N	\N
6098	\N	\N
6099	\N	\N
6100	\N	\N
6146	\N	\N
6147	\N	\N
6148	\N	\N
6149	\N	\N
6150	\N	\N
6201	\N	\N
6202	\N	\N
6203	\N	\N
6204	\N	\N
6205	\N	\N
6256	\N	\N
6257	\N	\N
6258	\N	\N
6259	\N	\N
6260	\N	\N
6306	\N	\N
6307	\N	\N
6308	\N	\N
6309	\N	\N
6310	\N	\N
6356	\N	\N
6357	\N	\N
6358	\N	\N
6359	\N	\N
6360	\N	\N
6411	\N	\N
6412	\N	\N
6413	\N	\N
6414	\N	\N
6415	\N	\N
6461	\N	\N
6462	\N	\N
6463	\N	\N
6464	\N	\N
6465	\N	\N
6506	\N	\N
6507	\N	\N
6508	\N	\N
6509	\N	\N
6510	\N	\N
6556	\N	\N
6557	\N	\N
6558	\N	\N
6559	\N	\N
6560	\N	\N
6606	\N	\N
6607	\N	\N
6608	\N	\N
6609	\N	\N
6610	\N	\N
6656	\N	\N
6657	\N	\N
6658	\N	\N
6659	\N	\N
6660	\N	\N
6706	\N	\N
6707	\N	\N
6708	\N	\N
6709	\N	\N
6710	\N	\N
6756	\N	\N
6757	\N	\N
6758	\N	\N
6759	\N	\N
6760	\N	\N
6806	\N	\N
6807	\N	\N
6808	\N	\N
4553	\N	\N
4554	\N	\N
4555	\N	\N
4586	\N	\N
4587	\N	\N
4588	\N	\N
4589	\N	\N
4590	\N	\N
4636	\N	\N
4637	\N	\N
4638	\N	\N
4639	\N	\N
4640	\N	\N
4666	\N	\N
4667	\N	\N
4668	\N	\N
4669	\N	\N
4670	\N	\N
4731	\N	\N
4732	\N	\N
4733	\N	\N
4734	\N	\N
4735	\N	\N
4776	\N	\N
4777	\N	\N
4778	\N	\N
4779	\N	\N
4780	\N	\N
4826	\N	\N
4827	\N	\N
4828	\N	\N
4829	\N	\N
4830	\N	\N
4876	\N	\N
4877	\N	\N
4878	\N	\N
4879	\N	\N
4880	\N	\N
4926	\N	\N
4927	\N	\N
4928	\N	\N
4929	\N	\N
4930	\N	\N
4976	\N	\N
4977	\N	\N
4978	\N	\N
4979	\N	\N
4980	\N	\N
5041	\N	\N
5042	\N	\N
5043	\N	\N
5044	\N	\N
5045	\N	\N
5071	\N	\N
5072	\N	\N
5073	\N	\N
5074	\N	\N
5075	\N	\N
5136	\N	\N
5137	\N	\N
5138	\N	\N
5139	\N	\N
5140	\N	\N
5191	\N	\N
5192	\N	\N
5193	\N	\N
5194	\N	\N
5195	\N	\N
5246	\N	\N
5247	\N	\N
5248	\N	\N
5249	\N	\N
5250	\N	\N
5301	\N	\N
5302	\N	\N
5303	\N	\N
5304	\N	\N
5305	\N	\N
5356	\N	\N
5357	\N	\N
5358	\N	\N
5359	\N	\N
5360	\N	\N
5411	\N	\N
5412	\N	\N
5413	\N	\N
5414	\N	\N
5415	\N	\N
5461	\N	\N
5462	\N	\N
5463	\N	\N
5464	\N	\N
5465	\N	\N
5521	\N	\N
5522	\N	\N
5523	\N	\N
5524	\N	\N
5525	\N	\N
5576	\N	\N
5577	\N	\N
5578	\N	\N
5579	\N	\N
5580	\N	\N
5631	\N	\N
5632	\N	\N
5633	\N	\N
5634	\N	\N
5635	\N	\N
5666	\N	\N
5667	\N	\N
5668	\N	\N
5669	\N	\N
5670	\N	\N
5711	\N	\N
5713	\N	\N
5714	\N	\N
5715	\N	\N
5716	\N	\N
5754	\N	\N
5757	\N	\N
5758	\N	\N
5759	\N	\N
5760	\N	\N
5811	\N	\N
5812	\N	\N
5813	\N	\N
5814	\N	\N
5815	\N	\N
5871	\N	\N
5872	\N	\N
5873	\N	\N
5874	\N	\N
5875	\N	\N
5916	\N	\N
5917	\N	\N
5918	\N	\N
5919	\N	\N
5920	\N	\N
5961	\N	\N
5962	\N	\N
5963	\N	\N
5964	\N	\N
5965	\N	\N
5996	\N	\N
5997	\N	\N
5998	\N	\N
5999	\N	\N
6000	\N	\N
6046	\N	\N
6047	\N	\N
6048	\N	\N
6049	\N	\N
6050	\N	\N
6076	\N	\N
6077	\N	\N
6078	\N	\N
6079	\N	\N
6080	\N	\N
6126	\N	\N
6127	\N	\N
6128	\N	\N
6129	\N	\N
6130	\N	\N
6161	\N	\N
6162	\N	\N
6163	\N	\N
6164	\N	\N
6165	\N	\N
6211	\N	\N
6212	\N	\N
6213	\N	\N
6214	\N	\N
6215	\N	\N
6251	\N	\N
6252	\N	\N
6253	\N	\N
6254	\N	\N
6255	\N	\N
6301	\N	\N
6302	\N	\N
6303	\N	\N
6304	\N	\N
6305	\N	\N
6351	\N	\N
6352	\N	\N
6353	\N	\N
6354	\N	\N
6355	\N	\N
6391	\N	\N
6392	\N	\N
6393	\N	\N
6394	\N	\N
6395	\N	\N
6441	\N	\N
6442	\N	\N
6443	\N	\N
6444	\N	\N
6445	\N	\N
6486	\N	\N
6487	\N	\N
6488	\N	\N
6489	\N	\N
6490	\N	\N
6536	\N	\N
6537	\N	\N
6538	\N	\N
6539	\N	\N
6540	\N	\N
6586	\N	\N
6587	\N	\N
6588	\N	\N
6589	\N	\N
6590	\N	\N
6636	\N	\N
6637	\N	\N
6638	\N	\N
6639	\N	\N
6640	\N	\N
6686	\N	\N
6687	\N	\N
6688	\N	\N
6689	\N	\N
6690	\N	\N
6736	\N	\N
6737	\N	\N
6738	\N	\N
4694	\N	\N
4695	\N	\N
4741	\N	\N
4742	\N	\N
4743	\N	\N
4744	\N	\N
4745	\N	\N
4796	\N	\N
4797	\N	\N
4798	\N	\N
4799	\N	\N
4800	\N	\N
4841	\N	\N
4842	\N	\N
4843	\N	\N
4844	\N	\N
4845	\N	\N
4891	\N	\N
4892	\N	\N
4893	\N	\N
4894	\N	\N
4895	\N	\N
4941	\N	\N
4942	\N	\N
4943	\N	\N
4944	\N	\N
4945	\N	\N
4986	\N	\N
4987	\N	\N
4988	\N	\N
4989	\N	\N
4990	\N	\N
5016	\N	\N
5017	\N	\N
5018	\N	\N
5019	\N	\N
5020	\N	\N
5081	\N	\N
5082	\N	\N
5083	\N	\N
5084	\N	\N
5085	\N	\N
5126	\N	\N
5127	\N	\N
5128	\N	\N
5129	\N	\N
5130	\N	\N
5171	\N	\N
5172	\N	\N
5173	\N	\N
5174	\N	\N
5175	\N	\N
5221	\N	\N
5222	\N	\N
5223	\N	\N
5224	\N	\N
5225	\N	\N
5256	\N	\N
5257	\N	\N
5258	\N	\N
5259	\N	\N
5260	\N	\N
5306	\N	\N
5307	\N	\N
5308	\N	\N
5309	\N	\N
5310	\N	\N
5336	\N	\N
5337	\N	\N
5338	\N	\N
5339	\N	\N
5340	\N	\N
5386	\N	\N
5387	\N	\N
5388	\N	\N
5389	\N	\N
5390	\N	\N
5421	\N	\N
5422	\N	\N
5423	\N	\N
5424	\N	\N
5425	\N	\N
5471	\N	\N
5472	\N	\N
5473	\N	\N
5474	\N	\N
5475	\N	\N
5501	\N	\N
5502	\N	\N
5503	\N	\N
5504	\N	\N
5505	\N	\N
5551	\N	\N
5552	\N	\N
5553	\N	\N
5554	\N	\N
5555	\N	\N
5581	\N	\N
5582	\N	\N
5583	\N	\N
5584	\N	\N
5585	\N	\N
5626	\N	\N
5627	\N	\N
5628	\N	\N
5629	\N	\N
5630	\N	\N
5661	\N	\N
5662	\N	\N
5663	\N	\N
5664	\N	\N
5665	\N	\N
5706	\N	\N
5707	\N	\N
5708	\N	\N
5709	\N	\N
5710	\N	\N
5751	\N	\N
5752	\N	\N
5753	\N	\N
5755	\N	\N
5756	\N	\N
5806	\N	\N
5807	\N	\N
5808	\N	\N
5809	\N	\N
5810	\N	\N
5861	\N	\N
5862	\N	\N
5863	\N	\N
5864	\N	\N
5865	\N	\N
5936	\N	\N
5937	\N	\N
5938	\N	\N
5939	\N	\N
5940	\N	\N
5971	\N	\N
5972	\N	\N
5973	\N	\N
5974	\N	\N
5975	\N	\N
6036	\N	\N
6037	\N	\N
6038	\N	\N
6039	\N	\N
6040	\N	\N
6091	\N	\N
6092	\N	\N
6093	\N	\N
6094	\N	\N
6095	\N	\N
6151	\N	\N
6152	\N	\N
6153	\N	\N
6154	\N	\N
6155	\N	\N
6206	\N	\N
6207	\N	\N
6208	\N	\N
6209	\N	\N
6210	\N	\N
6261	\N	\N
6262	\N	\N
6263	\N	\N
6264	\N	\N
6265	\N	\N
6311	\N	\N
6312	\N	\N
6313	\N	\N
6314	\N	\N
6315	\N	\N
6361	\N	\N
6362	\N	\N
6363	\N	\N
6364	\N	\N
6365	\N	\N
6416	\N	\N
6417	\N	\N
6418	\N	\N
6419	\N	\N
6420	\N	\N
6466	\N	\N
6467	\N	\N
6468	\N	\N
6469	\N	\N
6470	\N	\N
6511	\N	\N
6512	\N	\N
6513	\N	\N
6514	\N	\N
6515	\N	\N
6561	\N	\N
6562	\N	\N
6563	\N	\N
6564	\N	\N
6565	\N	\N
6611	\N	\N
6612	\N	\N
6613	\N	\N
6614	\N	\N
6615	\N	\N
6661	\N	\N
6662	\N	\N
6663	\N	\N
6664	\N	\N
6665	\N	\N
6711	\N	\N
6712	\N	\N
6713	\N	\N
6714	\N	\N
6715	\N	\N
6761	\N	\N
6762	\N	\N
6763	\N	\N
6764	\N	\N
6765	\N	\N
6811	\N	\N
6812	\N	\N
6813	\N	\N
6814	\N	\N
6815	\N	\N
6861	\N	\N
6862	\N	\N
6863	\N	\N
6864	\N	\N
4758	\N	\N
4759	\N	\N
4760	\N	\N
4801	\N	\N
4802	\N	\N
4803	\N	\N
4804	\N	\N
4805	\N	\N
4851	\N	\N
4852	\N	\N
4853	\N	\N
4854	\N	\N
4855	\N	\N
4901	\N	\N
4902	\N	\N
4903	\N	\N
4904	\N	\N
4905	\N	\N
4951	\N	\N
4952	\N	\N
4953	\N	\N
4954	\N	\N
4955	\N	\N
4996	\N	\N
4997	\N	\N
4998	\N	\N
4999	\N	\N
5000	\N	\N
5046	\N	\N
5047	\N	\N
5048	\N	\N
5049	\N	\N
5050	\N	\N
5096	\N	\N
5097	\N	\N
5098	\N	\N
5099	\N	\N
5100	\N	\N
5146	\N	\N
5147	\N	\N
5148	\N	\N
5149	\N	\N
5150	\N	\N
5196	\N	\N
5197	\N	\N
5198	\N	\N
5199	\N	\N
5200	\N	\N
5226	\N	\N
5227	\N	\N
5228	\N	\N
5229	\N	\N
5230	\N	\N
5276	\N	\N
5277	\N	\N
5278	\N	\N
5279	\N	\N
5280	\N	\N
5311	\N	\N
5312	\N	\N
5313	\N	\N
5314	\N	\N
5315	\N	\N
5361	\N	\N
5362	\N	\N
5363	\N	\N
5364	\N	\N
5365	\N	\N
5391	\N	\N
5392	\N	\N
5393	\N	\N
5394	\N	\N
5395	\N	\N
5441	\N	\N
5442	\N	\N
5443	\N	\N
5444	\N	\N
5445	\N	\N
5476	\N	\N
5477	\N	\N
5478	\N	\N
5479	\N	\N
5480	\N	\N
5526	\N	\N
5527	\N	\N
5528	\N	\N
5529	\N	\N
5530	\N	\N
5566	\N	\N
5567	\N	\N
5568	\N	\N
5569	\N	\N
5570	\N	\N
5621	\N	\N
5622	\N	\N
5623	\N	\N
5624	\N	\N
5625	\N	\N
5676	\N	\N
5677	\N	\N
5678	\N	\N
5679	\N	\N
5680	\N	\N
5731	\N	\N
5732	\N	\N
5733	\N	\N
5734	\N	\N
5735	\N	\N
5791	\N	\N
5792	\N	\N
5793	\N	\N
5794	\N	\N
5795	\N	\N
5846	\N	\N
5847	\N	\N
5848	\N	\N
5849	\N	\N
5850	\N	\N
5901	\N	\N
5902	\N	\N
5903	\N	\N
5904	\N	\N
5905	\N	\N
5951	\N	\N
5952	\N	\N
5953	\N	\N
5954	\N	\N
5955	\N	\N
6006	\N	\N
6007	\N	\N
6008	\N	\N
6009	\N	\N
6010	\N	\N
6061	\N	\N
6062	\N	\N
6063	\N	\N
6064	\N	\N
6065	\N	\N
6116	\N	\N
6117	\N	\N
6118	\N	\N
6119	\N	\N
6120	\N	\N
6166	\N	\N
6167	\N	\N
6168	\N	\N
6169	\N	\N
6170	\N	\N
6226	\N	\N
6227	\N	\N
6228	\N	\N
6229	\N	\N
6230	\N	\N
6271	\N	\N
6272	\N	\N
6273	\N	\N
6274	\N	\N
6275	\N	\N
6321	\N	\N
6322	\N	\N
6323	\N	\N
6324	\N	\N
6325	\N	\N
6376	\N	\N
6377	\N	\N
6378	\N	\N
6379	\N	\N
6380	\N	\N
6426	\N	\N
6427	\N	\N
6428	\N	\N
6429	\N	\N
6430	\N	\N
6476	\N	\N
6477	\N	\N
6478	\N	\N
6479	\N	\N
6480	\N	\N
6526	\N	\N
6527	\N	\N
6528	\N	\N
6529	\N	\N
6530	\N	\N
6576	\N	\N
6577	\N	\N
6578	\N	\N
6579	\N	\N
6580	\N	\N
6626	\N	\N
6627	\N	\N
6628	\N	\N
6629	\N	\N
6630	\N	\N
6676	\N	\N
6677	\N	\N
6678	\N	\N
6679	\N	\N
6680	\N	\N
6726	\N	\N
6727	\N	\N
6728	\N	\N
6729	\N	\N
6730	\N	\N
6776	\N	\N
6777	\N	\N
6778	\N	\N
6779	\N	\N
6780	\N	\N
6826	\N	\N
6827	\N	\N
6828	\N	\N
6829	\N	\N
6830	\N	\N
6871	\N	\N
6872	\N	\N
6873	\N	\N
6874	\N	\N
6875	\N	\N
6916	\N	\N
6917	\N	\N
6918	\N	\N
6919	\N	\N
6920	\N	\N
6986	\N	\N
6987	\N	\N
6988	\N	\N
4773	\N	\N
4774	\N	\N
4775	\N	\N
4821	\N	\N
4822	\N	\N
4823	\N	\N
4824	\N	\N
4825	\N	\N
4871	\N	\N
4872	\N	\N
4873	\N	\N
4874	\N	\N
4875	\N	\N
4921	\N	\N
4922	\N	\N
4923	\N	\N
4924	\N	\N
4925	\N	\N
4971	\N	\N
4972	\N	\N
4973	\N	\N
4974	\N	\N
4975	\N	\N
5031	\N	\N
5032	\N	\N
5033	\N	\N
5034	\N	\N
5035	\N	\N
5091	\N	\N
5092	\N	\N
5093	\N	\N
5094	\N	\N
5095	\N	\N
5116	\N	\N
5117	\N	\N
5118	\N	\N
5119	\N	\N
5120	\N	\N
5166	\N	\N
5167	\N	\N
5168	\N	\N
5169	\N	\N
5170	\N	\N
5201	\N	\N
5202	\N	\N
5203	\N	\N
5204	\N	\N
5205	\N	\N
5251	\N	\N
5252	\N	\N
5253	\N	\N
5254	\N	\N
5255	\N	\N
5281	\N	\N
5282	\N	\N
5283	\N	\N
5284	\N	\N
5285	\N	\N
5331	\N	\N
5332	\N	\N
5333	\N	\N
5334	\N	\N
5335	\N	\N
5366	\N	\N
5367	\N	\N
5368	\N	\N
5369	\N	\N
5370	\N	\N
5416	\N	\N
5417	\N	\N
5418	\N	\N
5419	\N	\N
5420	\N	\N
5446	\N	\N
5447	\N	\N
5448	\N	\N
5449	\N	\N
5450	\N	\N
5496	\N	\N
5497	\N	\N
5498	\N	\N
5499	\N	\N
5500	\N	\N
5531	\N	\N
5532	\N	\N
5533	\N	\N
5534	\N	\N
5535	\N	\N
5586	\N	\N
5587	\N	\N
5588	\N	\N
5589	\N	\N
5590	\N	\N
5651	\N	\N
5652	\N	\N
5653	\N	\N
5654	\N	\N
5655	\N	\N
5696	\N	\N
5697	\N	\N
5698	\N	\N
5699	\N	\N
5700	\N	\N
5741	\N	\N
5742	\N	\N
5743	\N	\N
5744	\N	\N
5745	\N	\N
5781	\N	\N
5782	\N	\N
5783	\N	\N
5784	\N	\N
5785	\N	\N
5841	\N	\N
5842	\N	\N
5843	\N	\N
5844	\N	\N
5845	\N	\N
5896	\N	\N
5897	\N	\N
5898	\N	\N
5899	\N	\N
5900	\N	\N
5946	\N	\N
5947	\N	\N
5948	\N	\N
5949	\N	\N
5950	\N	\N
6001	\N	\N
6002	\N	\N
6003	\N	\N
6004	\N	\N
6005	\N	\N
6056	\N	\N
6057	\N	\N
6058	\N	\N
6059	\N	\N
6060	\N	\N
6111	\N	\N
6112	\N	\N
6113	\N	\N
6114	\N	\N
6115	\N	\N
6171	\N	\N
6172	\N	\N
6173	\N	\N
6174	\N	\N
6175	\N	\N
6216	\N	\N
6217	\N	\N
6218	\N	\N
6219	\N	\N
6220	\N	\N
6281	\N	\N
6282	\N	\N
6283	\N	\N
6284	\N	\N
6285	\N	\N
6331	\N	\N
6332	\N	\N
6333	\N	\N
6334	\N	\N
6335	\N	\N
6381	\N	\N
6382	\N	\N
6383	\N	\N
6384	\N	\N
6385	\N	\N
6431	\N	\N
6432	\N	\N
6433	\N	\N
6434	\N	\N
6435	\N	\N
6481	\N	\N
6482	\N	\N
6483	\N	\N
6484	\N	\N
6485	\N	\N
6531	\N	\N
6532	\N	\N
6533	\N	\N
6534	\N	\N
6535	\N	\N
6581	\N	\N
6582	\N	\N
6583	\N	\N
6584	\N	\N
6585	\N	\N
6631	\N	\N
6632	\N	\N
6633	\N	\N
6634	\N	\N
6635	\N	\N
6681	\N	\N
6682	\N	\N
6683	\N	\N
6684	\N	\N
6685	\N	\N
6731	\N	\N
6732	\N	\N
6733	\N	\N
6734	\N	\N
6735	\N	\N
6781	\N	\N
6782	\N	\N
6783	\N	\N
6784	\N	\N
6785	\N	\N
6831	\N	\N
6832	\N	\N
6833	\N	\N
6834	\N	\N
6835	\N	\N
6876	\N	\N
6877	\N	\N
6878	\N	\N
6879	\N	\N
6880	\N	\N
6911	\N	\N
6912	\N	\N
6913	\N	\N
6914	\N	\N
6915	\N	\N
6961	\N	\N
6962	\N	\N
6963	\N	\N
4818	\N	\N
4819	\N	\N
4820	\N	\N
4866	\N	\N
4867	\N	\N
4868	\N	\N
4869	\N	\N
4870	\N	\N
4916	\N	\N
4917	\N	\N
4918	\N	\N
4919	\N	\N
4920	\N	\N
4966	\N	\N
4967	\N	\N
4968	\N	\N
4969	\N	\N
4970	\N	\N
5036	\N	\N
5037	\N	\N
5038	\N	\N
5039	\N	\N
5040	\N	\N
5066	\N	\N
5067	\N	\N
5068	\N	\N
5069	\N	\N
5070	\N	\N
5131	\N	\N
5132	\N	\N
5133	\N	\N
5134	\N	\N
5135	\N	\N
5176	\N	\N
5177	\N	\N
5178	\N	\N
5179	\N	\N
5180	\N	\N
5236	\N	\N
5237	\N	\N
5238	\N	\N
5239	\N	\N
5240	\N	\N
5291	\N	\N
5292	\N	\N
5293	\N	\N
5294	\N	\N
5295	\N	\N
5351	\N	\N
5352	\N	\N
5353	\N	\N
5354	\N	\N
5355	\N	\N
5406	\N	\N
5407	\N	\N
5408	\N	\N
5409	\N	\N
5410	\N	\N
5456	\N	\N
5457	\N	\N
5458	\N	\N
5459	\N	\N
5460	\N	\N
5516	\N	\N
5517	\N	\N
5518	\N	\N
5519	\N	\N
5520	\N	\N
5561	\N	\N
5562	\N	\N
5563	\N	\N
5564	\N	\N
5565	\N	\N
5616	\N	\N
5617	\N	\N
5618	\N	\N
5619	\N	\N
5620	\N	\N
5671	\N	\N
5672	\N	\N
5673	\N	\N
5674	\N	\N
5675	\N	\N
5726	\N	\N
5727	\N	\N
5728	\N	\N
5729	\N	\N
5730	\N	\N
5786	\N	\N
5787	\N	\N
5788	\N	\N
5789	\N	\N
5790	\N	\N
5836	\N	\N
5837	\N	\N
5838	\N	\N
5839	\N	\N
5840	\N	\N
5891	\N	\N
5892	\N	\N
5893	\N	\N
5894	\N	\N
5895	\N	\N
5931	\N	\N
5932	\N	\N
5933	\N	\N
5934	\N	\N
5935	\N	\N
5966	\N	\N
5967	\N	\N
5968	\N	\N
5969	\N	\N
5970	\N	\N
6016	\N	\N
6017	\N	\N
6018	\N	\N
6019	\N	\N
6020	\N	\N
6051	\N	\N
6052	\N	\N
6053	\N	\N
6054	\N	\N
6055	\N	\N
6101	\N	\N
6102	\N	\N
6103	\N	\N
6104	\N	\N
6105	\N	\N
6131	\N	\N
6132	\N	\N
6133	\N	\N
6134	\N	\N
6135	\N	\N
6181	\N	\N
6182	\N	\N
6183	\N	\N
6184	\N	\N
6185	\N	\N
6221	\N	\N
6222	\N	\N
6223	\N	\N
6224	\N	\N
6225	\N	\N
6266	\N	\N
6267	\N	\N
6268	\N	\N
6269	\N	\N
6270	\N	\N
6316	\N	\N
6317	\N	\N
6318	\N	\N
6319	\N	\N
6320	\N	\N
6366	\N	\N
6367	\N	\N
6368	\N	\N
6369	\N	\N
6370	\N	\N
6406	\N	\N
6407	\N	\N
6408	\N	\N
6409	\N	\N
6410	\N	\N
6456	\N	\N
6457	\N	\N
6458	\N	\N
6459	\N	\N
6460	\N	\N
6501	\N	\N
6502	\N	\N
6503	\N	\N
6504	\N	\N
6505	\N	\N
6551	\N	\N
6552	\N	\N
6553	\N	\N
6554	\N	\N
6555	\N	\N
6601	\N	\N
6602	\N	\N
6603	\N	\N
6604	\N	\N
6605	\N	\N
6651	\N	\N
6652	\N	\N
6653	\N	\N
6654	\N	\N
6655	\N	\N
6701	\N	\N
6702	\N	\N
6703	\N	\N
6704	\N	\N
6705	\N	\N
6751	\N	\N
6752	\N	\N
6753	\N	\N
6754	\N	\N
6755	\N	\N
6801	\N	\N
6802	\N	\N
6803	\N	\N
6804	\N	\N
6805	\N	\N
6846	\N	\N
6847	\N	\N
6848	\N	\N
6849	\N	\N
6850	\N	\N
6891	\N	\N
6892	\N	\N
6893	\N	\N
6894	\N	\N
6895	\N	\N
6956	\N	\N
6957	\N	\N
6958	\N	\N
6959	\N	\N
6960	\N	\N
7006	\N	\N
7007	\N	\N
7008	\N	\N
7009	\N	\N
7010	\N	\N
7061	\N	\N
7062	\N	\N
7063	\N	\N
4833	\N	\N
4834	\N	\N
4835	\N	\N
4881	\N	\N
4882	\N	\N
4883	\N	\N
4884	\N	\N
4885	\N	\N
4931	\N	\N
4932	\N	\N
4933	\N	\N
4934	\N	\N
4935	\N	\N
4981	\N	\N
4982	\N	\N
4983	\N	\N
4984	\N	\N
4985	\N	\N
5011	\N	\N
5012	\N	\N
5013	\N	\N
5014	\N	\N
5015	\N	\N
5061	\N	\N
5062	\N	\N
5063	\N	\N
5064	\N	\N
5065	\N	\N
5111	\N	\N
5112	\N	\N
5113	\N	\N
5114	\N	\N
5115	\N	\N
5156	\N	\N
5157	\N	\N
5158	\N	\N
5159	\N	\N
5160	\N	\N
5206	\N	\N
5207	\N	\N
5208	\N	\N
5209	\N	\N
5210	\N	\N
5266	\N	\N
5267	\N	\N
5268	\N	\N
5269	\N	\N
5270	\N	\N
5316	\N	\N
5317	\N	\N
5318	\N	\N
5319	\N	\N
5320	\N	\N
5376	\N	\N
5377	\N	\N
5378	\N	\N
5379	\N	\N
5380	\N	\N
5426	\N	\N
5427	\N	\N
5428	\N	\N
5429	\N	\N
5430	\N	\N
5481	\N	\N
5482	\N	\N
5483	\N	\N
5484	\N	\N
5485	\N	\N
5541	\N	\N
5542	\N	\N
5543	\N	\N
5544	\N	\N
5545	\N	\N
5591	\N	\N
5592	\N	\N
5593	\N	\N
5594	\N	\N
5595	\N	\N
5641	\N	\N
5642	\N	\N
5643	\N	\N
5644	\N	\N
5645	\N	\N
5701	\N	\N
5702	\N	\N
5703	\N	\N
5704	\N	\N
5705	\N	\N
5746	\N	\N
5747	\N	\N
5748	\N	\N
5749	\N	\N
5750	\N	\N
5796	\N	\N
5797	\N	\N
5798	\N	\N
5799	\N	\N
5800	\N	\N
5831	\N	\N
5832	\N	\N
5833	\N	\N
5834	\N	\N
5835	\N	\N
5881	\N	\N
5882	\N	\N
5883	\N	\N
5884	\N	\N
5885	\N	\N
5911	\N	\N
5912	\N	\N
5913	\N	\N
5914	\N	\N
5915	\N	\N
5976	\N	\N
5977	\N	\N
5978	\N	\N
5979	\N	\N
5980	\N	\N
6026	\N	\N
6027	\N	\N
6028	\N	\N
6029	\N	\N
6030	\N	\N
6081	\N	\N
6082	\N	\N
6083	\N	\N
6084	\N	\N
6085	\N	\N
6136	\N	\N
6137	\N	\N
6138	\N	\N
6139	\N	\N
6140	\N	\N
6186	\N	\N
6187	\N	\N
6188	\N	\N
6189	\N	\N
6190	\N	\N
6241	\N	\N
6242	\N	\N
6243	\N	\N
6244	\N	\N
6245	\N	\N
6291	\N	\N
6292	\N	\N
6293	\N	\N
6294	\N	\N
6295	\N	\N
6341	\N	\N
6342	\N	\N
6343	\N	\N
6344	\N	\N
6345	\N	\N
6396	\N	\N
6397	\N	\N
6398	\N	\N
6399	\N	\N
6400	\N	\N
6446	\N	\N
6447	\N	\N
6448	\N	\N
6449	\N	\N
6450	\N	\N
6491	\N	\N
6492	\N	\N
6493	\N	\N
6494	\N	\N
6495	\N	\N
6541	\N	\N
6542	\N	\N
6543	\N	\N
6544	\N	\N
6545	\N	\N
6591	\N	\N
6592	\N	\N
6593	\N	\N
6594	\N	\N
6595	\N	\N
6641	\N	\N
6642	\N	\N
6643	\N	\N
6644	\N	\N
6645	\N	\N
6691	\N	\N
6692	\N	\N
6693	\N	\N
6694	\N	\N
6695	\N	\N
6741	\N	\N
6742	\N	\N
6743	\N	\N
6744	\N	\N
6745	\N	\N
6791	\N	\N
6792	\N	\N
6793	\N	\N
6794	\N	\N
6795	\N	\N
6851	\N	\N
6852	\N	\N
6853	\N	\N
6854	\N	\N
6855	\N	\N
6906	\N	\N
6907	\N	\N
6908	\N	\N
6909	\N	\N
6910	\N	\N
6951	\N	\N
6952	\N	\N
6953	\N	\N
6954	\N	\N
6955	\N	\N
7001	\N	\N
7002	\N	\N
7003	\N	\N
7004	\N	\N
7005	\N	\N
7056	\N	\N
7057	\N	\N
7058	\N	\N
7059	\N	\N
7060	\N	\N
7111	\N	\N
7112	\N	\N
7113	\N	\N
4838	\N	\N
4839	\N	\N
4840	\N	\N
4886	\N	\N
4887	\N	\N
4888	\N	\N
4889	\N	\N
4890	\N	\N
4936	\N	\N
4937	\N	\N
4938	\N	\N
4939	\N	\N
4940	\N	\N
5006	\N	\N
5007	\N	\N
5008	\N	\N
5009	\N	\N
5010	\N	\N
5056	\N	\N
5057	\N	\N
5058	\N	\N
5059	\N	\N
5060	\N	\N
5106	\N	\N
5107	\N	\N
5108	\N	\N
5109	\N	\N
5110	\N	\N
5151	\N	\N
5152	\N	\N
5153	\N	\N
5154	\N	\N
5155	\N	\N
5211	\N	\N
5212	\N	\N
5213	\N	\N
5214	\N	\N
5215	\N	\N
5261	\N	\N
5262	\N	\N
5263	\N	\N
5264	\N	\N
5265	\N	\N
5326	\N	\N
5327	\N	\N
5328	\N	\N
5329	\N	\N
5330	\N	\N
5371	\N	\N
5372	\N	\N
5373	\N	\N
5374	\N	\N
5375	\N	\N
5436	\N	\N
5437	\N	\N
5438	\N	\N
5439	\N	\N
5440	\N	\N
5491	\N	\N
5492	\N	\N
5493	\N	\N
5494	\N	\N
5495	\N	\N
5536	\N	\N
5537	\N	\N
5538	\N	\N
5539	\N	\N
5540	\N	\N
5601	\N	\N
5602	\N	\N
5603	\N	\N
5604	\N	\N
5605	\N	\N
5636	\N	\N
5637	\N	\N
5638	\N	\N
5639	\N	\N
5640	\N	\N
5686	\N	\N
5687	\N	\N
5688	\N	\N
5689	\N	\N
5690	\N	\N
5721	\N	\N
5722	\N	\N
5723	\N	\N
5724	\N	\N
5725	\N	\N
5771	\N	\N
5772	\N	\N
5773	\N	\N
5774	\N	\N
5775	\N	\N
5801	\N	\N
5802	\N	\N
5803	\N	\N
5804	\N	\N
5805	\N	\N
5851	\N	\N
5852	\N	\N
5853	\N	\N
5854	\N	\N
5855	\N	\N
5886	\N	\N
5887	\N	\N
5888	\N	\N
5889	\N	\N
5890	\N	\N
5956	\N	\N
5957	\N	\N
5958	\N	\N
5959	\N	\N
5960	\N	\N
6011	\N	\N
6012	\N	\N
6013	\N	\N
6014	\N	\N
6015	\N	\N
6066	\N	\N
6067	\N	\N
6068	\N	\N
6069	\N	\N
6070	\N	\N
6121	\N	\N
6122	\N	\N
6123	\N	\N
6124	\N	\N
6125	\N	\N
6176	\N	\N
6177	\N	\N
6178	\N	\N
6179	\N	\N
6180	\N	\N
6231	\N	\N
6232	\N	\N
6233	\N	\N
6234	\N	\N
6235	\N	\N
6276	\N	\N
6277	\N	\N
6278	\N	\N
6279	\N	\N
6280	\N	\N
6326	\N	\N
6327	\N	\N
6328	\N	\N
6329	\N	\N
6330	\N	\N
6386	\N	\N
6387	\N	\N
6388	\N	\N
6389	\N	\N
6390	\N	\N
6436	\N	\N
6437	\N	\N
6438	\N	\N
6439	\N	\N
6440	\N	\N
6496	\N	\N
6497	\N	\N
6498	\N	\N
6499	\N	\N
6500	\N	\N
6546	\N	\N
6547	\N	\N
6548	\N	\N
6549	\N	\N
6550	\N	\N
6596	\N	\N
6597	\N	\N
6598	\N	\N
6599	\N	\N
6600	\N	\N
6646	\N	\N
6647	\N	\N
6648	\N	\N
6649	\N	\N
6650	\N	\N
6696	\N	\N
6697	\N	\N
6698	\N	\N
6699	\N	\N
6700	\N	\N
6746	\N	\N
6747	\N	\N
6748	\N	\N
6749	\N	\N
6750	\N	\N
6841	\N	\N
6842	\N	\N
6843	\N	\N
6844	\N	\N
6845	\N	\N
6886	\N	\N
6887	\N	\N
6888	\N	\N
6889	\N	\N
6890	\N	\N
6936	\N	\N
6937	\N	\N
6938	\N	\N
6939	\N	\N
6940	\N	\N
6971	\N	\N
6972	\N	\N
6973	\N	\N
6974	\N	\N
6975	\N	\N
7036	\N	\N
7037	\N	\N
7038	\N	\N
7039	\N	\N
7040	\N	\N
7096	\N	\N
7097	\N	\N
7098	\N	\N
7099	\N	\N
7100	\N	\N
7151	\N	\N
7152	\N	\N
7153	\N	\N
4898	\N	\N
4899	\N	\N
4900	\N	\N
4946	\N	\N
4947	\N	\N
4948	\N	\N
4949	\N	\N
4950	\N	\N
4991	\N	\N
4992	\N	\N
4993	\N	\N
4994	\N	\N
4995	\N	\N
5026	\N	\N
5027	\N	\N
5028	\N	\N
5029	\N	\N
5030	\N	\N
5086	\N	\N
5087	\N	\N
5088	\N	\N
5089	\N	\N
5090	\N	\N
5141	\N	\N
5142	\N	\N
5143	\N	\N
5144	\N	\N
5145	\N	\N
5186	\N	\N
5187	\N	\N
5188	\N	\N
5189	\N	\N
5190	\N	\N
5231	\N	\N
5232	\N	\N
5233	\N	\N
5234	\N	\N
5235	\N	\N
5286	\N	\N
5287	\N	\N
5288	\N	\N
5289	\N	\N
5290	\N	\N
5346	\N	\N
5347	\N	\N
5348	\N	\N
5349	\N	\N
5350	\N	\N
5396	\N	\N
5397	\N	\N
5398	\N	\N
5399	\N	\N
5400	\N	\N
5466	\N	\N
5467	\N	\N
5468	\N	\N
5469	\N	\N
5470	\N	\N
5511	\N	\N
5512	\N	\N
5513	\N	\N
5514	\N	\N
5515	\N	\N
5571	\N	\N
5572	\N	\N
5573	\N	\N
5574	\N	\N
5575	\N	\N
5611	\N	\N
5612	\N	\N
5613	\N	\N
5614	\N	\N
5615	\N	\N
5681	\N	\N
5682	\N	\N
5683	\N	\N
5684	\N	\N
5685	\N	\N
5766	\N	\N
5767	\N	\N
5768	\N	\N
5769	\N	\N
5770	\N	\N
5816	\N	\N
5817	\N	\N
5818	\N	\N
5819	\N	\N
5820	\N	\N
5866	\N	\N
5867	\N	\N
5868	\N	\N
5869	\N	\N
5870	\N	\N
5926	\N	\N
5927	\N	\N
5928	\N	\N
5929	\N	\N
5930	\N	\N
5981	\N	\N
5982	\N	\N
5983	\N	\N
5984	\N	\N
5985	\N	\N
6031	\N	\N
6032	\N	\N
6033	\N	\N
6034	\N	\N
6035	\N	\N
6086	\N	\N
6087	\N	\N
6088	\N	\N
6089	\N	\N
6090	\N	\N
6141	\N	\N
6142	\N	\N
6143	\N	\N
6144	\N	\N
6145	\N	\N
6191	\N	\N
6192	\N	\N
6193	\N	\N
6194	\N	\N
6195	\N	\N
6246	\N	\N
6247	\N	\N
6248	\N	\N
6249	\N	\N
6250	\N	\N
6296	\N	\N
6297	\N	\N
6298	\N	\N
6299	\N	\N
6300	\N	\N
6346	\N	\N
6347	\N	\N
6348	\N	\N
6349	\N	\N
6350	\N	\N
6401	\N	\N
6402	\N	\N
6403	\N	\N
6404	\N	\N
6405	\N	\N
6451	\N	\N
6452	\N	\N
6453	\N	\N
6454	\N	\N
6455	\N	\N
6516	\N	\N
6517	\N	\N
6518	\N	\N
6519	\N	\N
6520	\N	\N
6566	\N	\N
6567	\N	\N
6568	\N	\N
6569	\N	\N
6570	\N	\N
6616	\N	\N
6617	\N	\N
6618	\N	\N
6619	\N	\N
6620	\N	\N
6666	\N	\N
6667	\N	\N
6668	\N	\N
6669	\N	\N
6670	\N	\N
6716	\N	\N
6717	\N	\N
6718	\N	\N
6719	\N	\N
6720	\N	\N
6766	\N	\N
6767	\N	\N
6768	\N	\N
6769	\N	\N
6770	\N	\N
6816	\N	\N
6817	\N	\N
6818	\N	\N
6819	\N	\N
6820	\N	\N
6856	\N	\N
6857	\N	\N
6858	\N	\N
6859	\N	\N
6860	\N	\N
6901	\N	\N
6902	\N	\N
6903	\N	\N
6904	\N	\N
6905	\N	\N
6946	\N	\N
6947	\N	\N
6948	\N	\N
6949	\N	\N
6950	\N	\N
7011	\N	\N
7012	\N	\N
7013	\N	\N
7014	\N	\N
7015	\N	\N
7066	\N	\N
7067	\N	\N
7068	\N	\N
7069	\N	\N
7070	\N	\N
7121	\N	\N
7122	\N	\N
7123	\N	\N
7124	\N	\N
7125	\N	\N
7166	\N	\N
7167	\N	\N
7168	\N	\N
7169	\N	\N
7170	\N	\N
7216	\N	\N
7217	\N	\N
7218	\N	\N
7219	\N	\N
7220	\N	\N
7281	\N	\N
7282	\N	\N
7283	\N	\N
4913	\N	\N
4914	\N	\N
4915	\N	\N
4961	\N	\N
4962	\N	\N
4963	\N	\N
4964	\N	\N
4965	\N	\N
5021	\N	\N
5022	\N	\N
5023	\N	\N
5024	\N	\N
5025	\N	\N
5076	\N	\N
5077	\N	\N
5078	\N	\N
5079	\N	\N
5080	\N	\N
5121	\N	\N
5122	\N	\N
5123	\N	\N
5124	\N	\N
5125	\N	\N
5181	\N	\N
5182	\N	\N
5183	\N	\N
5184	\N	\N
5185	\N	\N
5241	\N	\N
5242	\N	\N
5243	\N	\N
5244	\N	\N
5245	\N	\N
5296	\N	\N
5297	\N	\N
5298	\N	\N
5299	\N	\N
5300	\N	\N
5341	\N	\N
5342	\N	\N
5343	\N	\N
5344	\N	\N
5345	\N	\N
5401	\N	\N
5402	\N	\N
5403	\N	\N
5404	\N	\N
5405	\N	\N
5451	\N	\N
5452	\N	\N
5453	\N	\N
5454	\N	\N
5455	\N	\N
5506	\N	\N
5507	\N	\N
5508	\N	\N
5509	\N	\N
5510	\N	\N
5556	\N	\N
5557	\N	\N
5558	\N	\N
5559	\N	\N
5560	\N	\N
5606	\N	\N
5607	\N	\N
5608	\N	\N
5609	\N	\N
5610	\N	\N
5656	\N	\N
5657	\N	\N
5658	\N	\N
5659	\N	\N
5660	\N	\N
5691	\N	\N
5692	\N	\N
5693	\N	\N
5694	\N	\N
5695	\N	\N
5736	\N	\N
5737	\N	\N
5738	\N	\N
5739	\N	\N
5740	\N	\N
5776	\N	\N
5777	\N	\N
5778	\N	\N
5779	\N	\N
5780	\N	\N
5826	\N	\N
5827	\N	\N
5828	\N	\N
5829	\N	\N
5830	\N	\N
5856	\N	\N
5857	\N	\N
5858	\N	\N
5859	\N	\N
5860	\N	\N
5906	\N	\N
5907	\N	\N
5908	\N	\N
5909	\N	\N
5910	\N	\N
5941	\N	\N
5942	\N	\N
5943	\N	\N
5944	\N	\N
5945	\N	\N
5991	\N	\N
5992	\N	\N
5993	\N	\N
5994	\N	\N
5995	\N	\N
6021	\N	\N
6022	\N	\N
6023	\N	\N
6024	\N	\N
6025	\N	\N
6071	\N	\N
6072	\N	\N
6073	\N	\N
6074	\N	\N
6075	\N	\N
6106	\N	\N
6107	\N	\N
6108	\N	\N
6109	\N	\N
6110	\N	\N
6156	\N	\N
6157	\N	\N
6158	\N	\N
6159	\N	\N
6160	\N	\N
6196	\N	\N
6197	\N	\N
6198	\N	\N
6199	\N	\N
6200	\N	\N
6236	\N	\N
6237	\N	\N
6238	\N	\N
6239	\N	\N
6240	\N	\N
6286	\N	\N
6287	\N	\N
6288	\N	\N
6289	\N	\N
6290	\N	\N
6336	\N	\N
6337	\N	\N
6338	\N	\N
6339	\N	\N
6340	\N	\N
6371	\N	\N
6372	\N	\N
6373	\N	\N
6374	\N	\N
6375	\N	\N
6421	\N	\N
6422	\N	\N
6423	\N	\N
6424	\N	\N
6425	\N	\N
6471	\N	\N
6472	\N	\N
6473	\N	\N
6474	\N	\N
6475	\N	\N
6521	\N	\N
6522	\N	\N
6523	\N	\N
6524	\N	\N
6525	\N	\N
6571	\N	\N
6572	\N	\N
6573	\N	\N
6574	\N	\N
6575	\N	\N
6621	\N	\N
6622	\N	\N
6623	\N	\N
6624	\N	\N
6625	\N	\N
6671	\N	\N
6672	\N	\N
6673	\N	\N
6674	\N	\N
6675	\N	\N
6721	\N	\N
6722	\N	\N
6723	\N	\N
6724	\N	\N
6725	\N	\N
6771	\N	\N
6772	\N	\N
6773	\N	\N
6774	\N	\N
6775	\N	\N
6821	\N	\N
6822	\N	\N
6823	\N	\N
6824	\N	\N
6825	\N	\N
6896	\N	\N
6897	\N	\N
6898	\N	\N
6899	\N	\N
6900	\N	\N
6941	\N	\N
6942	\N	\N
6943	\N	\N
6944	\N	\N
6945	\N	\N
6991	\N	\N
6992	\N	\N
6993	\N	\N
6994	\N	\N
6995	\N	\N
7021	\N	\N
7022	\N	\N
7023	\N	\N
7024	\N	\N
7025	\N	\N
7071	\N	\N
7072	\N	\N
7073	\N	\N
6739	\N	\N
6740	\N	\N
6786	\N	\N
6787	\N	\N
6788	\N	\N
6789	\N	\N
6790	\N	\N
6836	\N	\N
6837	\N	\N
6838	\N	\N
6839	\N	\N
6840	\N	\N
6881	\N	\N
6882	\N	\N
6883	\N	\N
6884	\N	\N
6885	\N	\N
6931	\N	\N
6932	\N	\N
6933	\N	\N
6934	\N	\N
6935	\N	\N
6966	\N	\N
6967	\N	\N
6968	\N	\N
6969	\N	\N
6970	\N	\N
7016	\N	\N
7017	\N	\N
7018	\N	\N
7019	\N	\N
7020	\N	\N
7051	\N	\N
7052	\N	\N
7053	\N	\N
7054	\N	\N
7055	\N	\N
7101	\N	\N
7102	\N	\N
7103	\N	\N
7104	\N	\N
7105	\N	\N
7131	\N	\N
7132	\N	\N
7133	\N	\N
7134	\N	\N
7135	\N	\N
7181	\N	\N
7182	\N	\N
7183	\N	\N
7184	\N	\N
7185	\N	\N
7231	\N	\N
7232	\N	\N
7233	\N	\N
7234	\N	\N
7235	\N	\N
7266	\N	\N
7267	\N	\N
7268	\N	\N
7269	\N	\N
7270	\N	\N
7316	\N	\N
7317	\N	\N
7318	\N	\N
7319	\N	\N
7320	\N	\N
7346	\N	\N
7347	\N	\N
7348	\N	\N
7349	\N	\N
7350	\N	\N
7396	\N	\N
7397	\N	\N
7398	\N	\N
7399	\N	\N
7400	\N	\N
7431	\N	\N
7432	\N	\N
7433	\N	\N
7434	\N	\N
7435	\N	\N
7496	\N	\N
7497	\N	\N
7498	\N	\N
7499	\N	\N
7500	\N	\N
7551	\N	\N
7552	\N	\N
7553	\N	\N
7554	\N	\N
7555	\N	\N
7606	\N	\N
7607	\N	\N
7608	\N	\N
7609	\N	\N
7610	\N	\N
7666	\N	\N
7667	\N	\N
7668	\N	\N
7669	\N	\N
7670	\N	\N
7706	\N	\N
7707	\N	\N
7708	\N	\N
7709	\N	\N
7710	\N	\N
7766	\N	\N
7767	\N	\N
7768	\N	\N
7769	\N	\N
7770	\N	\N
7826	\N	\N
7827	\N	\N
7828	\N	\N
7829	\N	\N
7830	\N	\N
7881	\N	\N
7882	\N	\N
7883	\N	\N
7884	\N	\N
7885	\N	\N
7936	\N	\N
7937	\N	\N
7938	\N	\N
7939	\N	\N
7940	\N	\N
7991	\N	\N
7992	\N	\N
7993	\N	\N
7994	\N	\N
7995	\N	\N
6809	\N	\N
6810	\N	\N
6866	\N	\N
6867	\N	\N
6868	\N	\N
6869	\N	\N
6870	\N	\N
6926	\N	\N
6927	\N	\N
6928	\N	\N
6929	\N	\N
6930	\N	\N
6981	\N	\N
6982	\N	\N
6983	\N	\N
6984	\N	\N
6985	\N	\N
7031	\N	\N
7032	\N	\N
7033	\N	\N
7034	\N	\N
7035	\N	\N
7086	\N	\N
7087	\N	\N
7088	\N	\N
7089	\N	\N
7090	\N	\N
7136	\N	\N
7137	\N	\N
7138	\N	\N
7139	\N	\N
7140	\N	\N
7201	\N	\N
7202	\N	\N
7203	\N	\N
7204	\N	\N
7205	\N	\N
7251	\N	\N
7252	\N	\N
7253	\N	\N
7254	\N	\N
7255	\N	\N
7296	\N	\N
7297	\N	\N
7298	\N	\N
7299	\N	\N
7300	\N	\N
7356	\N	\N
7357	\N	\N
7358	\N	\N
7359	\N	\N
7360	\N	\N
7416	\N	\N
7417	\N	\N
7418	\N	\N
7419	\N	\N
7420	\N	\N
7456	\N	\N
7457	\N	\N
7458	\N	\N
7459	\N	\N
7460	\N	\N
7506	\N	\N
7507	\N	\N
7508	\N	\N
7509	\N	\N
7510	\N	\N
7531	\N	\N
7532	\N	\N
7533	\N	\N
7534	\N	\N
7535	\N	\N
7581	\N	\N
7582	\N	\N
7583	\N	\N
7584	\N	\N
7585	\N	\N
7621	\N	\N
7622	\N	\N
7623	\N	\N
7624	\N	\N
7625	\N	\N
7671	\N	\N
7672	\N	\N
7673	\N	\N
7674	\N	\N
7675	\N	\N
7726	\N	\N
7727	\N	\N
7728	\N	\N
7729	\N	\N
7730	\N	\N
7756	\N	\N
7757	\N	\N
7758	\N	\N
7759	\N	\N
7760	\N	\N
7816	\N	\N
7817	\N	\N
7818	\N	\N
7819	\N	\N
7820	\N	\N
7876	\N	\N
7877	\N	\N
7878	\N	\N
7879	\N	\N
7880	\N	\N
7931	\N	\N
7932	\N	\N
7933	\N	\N
7934	\N	\N
7935	\N	\N
7986	\N	\N
7987	\N	\N
7988	\N	\N
7989	\N	\N
7990	\N	\N
6865	\N	\N
6921	\N	\N
6922	\N	\N
6923	\N	\N
6924	\N	\N
6925	\N	\N
6976	\N	\N
6977	\N	\N
6978	\N	\N
6979	\N	\N
6980	\N	\N
7041	\N	\N
7042	\N	\N
7043	\N	\N
7044	\N	\N
7045	\N	\N
7081	\N	\N
7082	\N	\N
7083	\N	\N
7084	\N	\N
7085	\N	\N
7146	\N	\N
7147	\N	\N
7148	\N	\N
7149	\N	\N
7150	\N	\N
7206	\N	\N
7207	\N	\N
7208	\N	\N
7209	\N	\N
7210	\N	\N
7256	\N	\N
7257	\N	\N
7258	\N	\N
7259	\N	\N
7260	\N	\N
7306	\N	\N
7307	\N	\N
7308	\N	\N
7309	\N	\N
7310	\N	\N
7386	\N	\N
7387	\N	\N
7388	\N	\N
7389	\N	\N
7390	\N	\N
7421	\N	\N
7422	\N	\N
7423	\N	\N
7424	\N	\N
7425	\N	\N
7471	\N	\N
7472	\N	\N
7473	\N	\N
7474	\N	\N
7475	\N	\N
7511	\N	\N
7512	\N	\N
7513	\N	\N
7514	\N	\N
7515	\N	\N
7561	\N	\N
7562	\N	\N
7563	\N	\N
7564	\N	\N
7565	\N	\N
7586	\N	\N
7587	\N	\N
7588	\N	\N
7589	\N	\N
7590	\N	\N
7636	\N	\N
7637	\N	\N
7638	\N	\N
7639	\N	\N
7640	\N	\N
7676	\N	\N
7677	\N	\N
7678	\N	\N
7679	\N	\N
7680	\N	\N
7721	\N	\N
7722	\N	\N
7723	\N	\N
7724	\N	\N
7725	\N	\N
7751	\N	\N
7752	\N	\N
7753	\N	\N
7754	\N	\N
7755	\N	\N
7801	\N	\N
7802	\N	\N
7803	\N	\N
7804	\N	\N
7805	\N	\N
7841	\N	\N
7842	\N	\N
7843	\N	\N
7844	\N	\N
7845	\N	\N
7886	\N	\N
7887	\N	\N
7888	\N	\N
7889	\N	\N
7890	\N	\N
7916	\N	\N
7917	\N	\N
7918	\N	\N
7919	\N	\N
7920	\N	\N
7966	\N	\N
7967	\N	\N
7968	\N	\N
7969	\N	\N
7970	\N	\N
8006	\N	\N
8007	\N	\N
8008	\N	\N
8009	\N	\N
8010	\N	\N
6964	\N	\N
6965	\N	\N
6996	\N	\N
6997	\N	\N
6998	\N	\N
6999	\N	\N
7000	\N	\N
7046	\N	\N
7047	\N	\N
7048	\N	\N
7049	\N	\N
7050	\N	\N
7076	\N	\N
7077	\N	\N
7078	\N	\N
7079	\N	\N
7080	\N	\N
7126	\N	\N
7127	\N	\N
7128	\N	\N
7129	\N	\N
7130	\N	\N
7161	\N	\N
7162	\N	\N
7163	\N	\N
7164	\N	\N
7165	\N	\N
7211	\N	\N
7212	\N	\N
7213	\N	\N
7214	\N	\N
7215	\N	\N
7261	\N	\N
7262	\N	\N
7263	\N	\N
7264	\N	\N
7265	\N	\N
7291	\N	\N
7292	\N	\N
7293	\N	\N
7294	\N	\N
7295	\N	\N
7341	\N	\N
7342	\N	\N
7343	\N	\N
7344	\N	\N
7345	\N	\N
7371	\N	\N
7372	\N	\N
7373	\N	\N
7374	\N	\N
7375	\N	\N
7446	\N	\N
7447	\N	\N
7448	\N	\N
7449	\N	\N
7450	\N	\N
7491	\N	\N
7492	\N	\N
7493	\N	\N
7494	\N	\N
7495	\N	\N
7541	\N	\N
7542	\N	\N
7543	\N	\N
7544	\N	\N
7545	\N	\N
7596	\N	\N
7597	\N	\N
7598	\N	\N
7599	\N	\N
7600	\N	\N
7651	\N	\N
7652	\N	\N
7653	\N	\N
7654	\N	\N
7655	\N	\N
7701	\N	\N
7702	\N	\N
7703	\N	\N
7704	\N	\N
7705	\N	\N
7761	\N	\N
7762	\N	\N
7763	\N	\N
7764	\N	\N
7765	\N	\N
7821	\N	\N
7822	\N	\N
7823	\N	\N
7824	\N	\N
7825	\N	\N
7866	\N	\N
7867	\N	\N
7868	\N	\N
7869	\N	\N
7870	\N	\N
7921	\N	\N
7922	\N	\N
7923	\N	\N
7924	\N	\N
7925	\N	\N
7981	\N	\N
7982	\N	\N
7983	\N	\N
7984	\N	\N
7985	\N	\N
6989	\N	\N
6990	\N	\N
7026	\N	\N
7027	\N	\N
7028	\N	\N
7029	\N	\N
7030	\N	\N
7091	\N	\N
7092	\N	\N
7093	\N	\N
7094	\N	\N
7095	\N	\N
7141	\N	\N
7142	\N	\N
7143	\N	\N
7144	\N	\N
7145	\N	\N
7191	\N	\N
7192	\N	\N
7193	\N	\N
7194	\N	\N
7195	\N	\N
7241	\N	\N
7242	\N	\N
7243	\N	\N
7244	\N	\N
7245	\N	\N
7301	\N	\N
7302	\N	\N
7303	\N	\N
7304	\N	\N
7305	\N	\N
7351	\N	\N
7352	\N	\N
7353	\N	\N
7354	\N	\N
7355	\N	\N
7406	\N	\N
7407	\N	\N
7408	\N	\N
7409	\N	\N
7410	\N	\N
7461	\N	\N
7462	\N	\N
7463	\N	\N
7464	\N	\N
7465	\N	\N
7516	\N	\N
7517	\N	\N
7518	\N	\N
7519	\N	\N
7520	\N	\N
7576	\N	\N
7577	\N	\N
7578	\N	\N
7579	\N	\N
7580	\N	\N
7631	\N	\N
7632	\N	\N
7633	\N	\N
7634	\N	\N
7635	\N	\N
7686	\N	\N
7687	\N	\N
7688	\N	\N
7689	\N	\N
7690	\N	\N
7741	\N	\N
7742	\N	\N
7743	\N	\N
7744	\N	\N
7745	\N	\N
7796	\N	\N
7797	\N	\N
7798	\N	\N
7799	\N	\N
7800	\N	\N
7851	\N	\N
7852	\N	\N
7853	\N	\N
7854	\N	\N
7855	\N	\N
7901	\N	\N
7902	\N	\N
7903	\N	\N
7904	\N	\N
7905	\N	\N
7946	\N	\N
7947	\N	\N
7948	\N	\N
7949	\N	\N
7950	\N	\N
7996	\N	\N
7997	\N	\N
7998	\N	\N
7999	\N	\N
8000	\N	\N
7064	\N	\N
7065	\N	\N
7116	\N	\N
7117	\N	\N
7118	\N	\N
7119	\N	\N
7120	\N	\N
7176	\N	\N
7177	\N	\N
7178	\N	\N
7179	\N	\N
7180	\N	\N
7226	\N	\N
7227	\N	\N
7228	\N	\N
7229	\N	\N
7230	\N	\N
7271	\N	\N
7272	\N	\N
7273	\N	\N
7274	\N	\N
7275	\N	\N
7326	\N	\N
7327	\N	\N
7328	\N	\N
7329	\N	\N
7330	\N	\N
7376	\N	\N
7377	\N	\N
7378	\N	\N
7379	\N	\N
7380	\N	\N
7441	\N	\N
7442	\N	\N
7443	\N	\N
7444	\N	\N
7445	\N	\N
7481	\N	\N
7482	\N	\N
7483	\N	\N
7484	\N	\N
7485	\N	\N
7536	\N	\N
7537	\N	\N
7538	\N	\N
7539	\N	\N
7540	\N	\N
7591	\N	\N
7592	\N	\N
7593	\N	\N
7594	\N	\N
7595	\N	\N
7661	\N	\N
7662	\N	\N
7663	\N	\N
7664	\N	\N
7665	\N	\N
7696	\N	\N
7697	\N	\N
7698	\N	\N
7699	\N	\N
7700	\N	\N
7746	\N	\N
7747	\N	\N
7748	\N	\N
7749	\N	\N
7750	\N	\N
7786	\N	\N
7787	\N	\N
7788	\N	\N
7789	\N	\N
7790	\N	\N
7831	\N	\N
7832	\N	\N
7833	\N	\N
7834	\N	\N
7835	\N	\N
7861	\N	\N
7862	\N	\N
7863	\N	\N
7864	\N	\N
7865	\N	\N
7911	\N	\N
7912	\N	\N
7913	\N	\N
7914	\N	\N
7915	\N	\N
7956	\N	\N
7957	\N	\N
7958	\N	\N
7959	\N	\N
7960	\N	\N
8011	\N	\N
8012	\N	\N
8013	\N	\N
8014	\N	\N
8015	\N	\N
7074	\N	\N
7075	\N	\N
7106	\N	\N
7107	\N	\N
7108	\N	\N
7109	\N	\N
7110	\N	\N
7156	\N	\N
7157	\N	\N
7158	\N	\N
7159	\N	\N
7160	\N	\N
7186	\N	\N
7187	\N	\N
7188	\N	\N
7189	\N	\N
7190	\N	\N
7236	\N	\N
7237	\N	\N
7238	\N	\N
7239	\N	\N
7240	\N	\N
7286	\N	\N
7287	\N	\N
7288	\N	\N
7289	\N	\N
7290	\N	\N
7321	\N	\N
7322	\N	\N
7323	\N	\N
7324	\N	\N
7325	\N	\N
7366	\N	\N
7367	\N	\N
7368	\N	\N
7369	\N	\N
7370	\N	\N
7401	\N	\N
7402	\N	\N
7403	\N	\N
7404	\N	\N
7405	\N	\N
7451	\N	\N
7452	\N	\N
7453	\N	\N
7454	\N	\N
7455	\N	\N
7476	\N	\N
7477	\N	\N
7478	\N	\N
7479	\N	\N
7480	\N	\N
7526	\N	\N
7527	\N	\N
7528	\N	\N
7529	\N	\N
7530	\N	\N
7571	\N	\N
7572	\N	\N
7573	\N	\N
7574	\N	\N
7575	\N	\N
7626	\N	\N
7627	\N	\N
7628	\N	\N
7629	\N	\N
7630	\N	\N
7681	\N	\N
7682	\N	\N
7683	\N	\N
7684	\N	\N
7685	\N	\N
7736	\N	\N
7737	\N	\N
7738	\N	\N
7739	\N	\N
7740	\N	\N
7791	\N	\N
7792	\N	\N
7793	\N	\N
7794	\N	\N
7795	\N	\N
7846	\N	\N
7847	\N	\N
7848	\N	\N
7849	\N	\N
7850	\N	\N
7906	\N	\N
7907	\N	\N
7908	\N	\N
7909	\N	\N
7910	\N	\N
7961	\N	\N
7962	\N	\N
7963	\N	\N
7964	\N	\N
7965	\N	\N
8016	\N	\N
8017	\N	\N
8018	\N	\N
8019	\N	\N
8020	\N	\N
7114	\N	\N
7115	\N	\N
7171	\N	\N
7172	\N	\N
7173	\N	\N
7174	\N	\N
7175	\N	\N
7221	\N	\N
7222	\N	\N
7223	\N	\N
7224	\N	\N
7225	\N	\N
7276	\N	\N
7277	\N	\N
7278	\N	\N
7279	\N	\N
7280	\N	\N
7331	\N	\N
7332	\N	\N
7333	\N	\N
7334	\N	\N
7335	\N	\N
7381	\N	\N
7382	\N	\N
7383	\N	\N
7384	\N	\N
7385	\N	\N
7436	\N	\N
7437	\N	\N
7438	\N	\N
7439	\N	\N
7440	\N	\N
7486	\N	\N
7487	\N	\N
7488	\N	\N
7489	\N	\N
7490	\N	\N
7546	\N	\N
7547	\N	\N
7548	\N	\N
7549	\N	\N
7550	\N	\N
7601	\N	\N
7602	\N	\N
7603	\N	\N
7604	\N	\N
7605	\N	\N
7646	\N	\N
7647	\N	\N
7648	\N	\N
7649	\N	\N
7650	\N	\N
7711	\N	\N
7712	\N	\N
7713	\N	\N
7714	\N	\N
7715	\N	\N
7771	\N	\N
7772	\N	\N
7773	\N	\N
7774	\N	\N
7775	\N	\N
7806	\N	\N
7807	\N	\N
7808	\N	\N
7809	\N	\N
7810	\N	\N
7856	\N	\N
7857	\N	\N
7858	\N	\N
7859	\N	\N
7860	\N	\N
7896	\N	\N
7897	\N	\N
7898	\N	\N
7899	\N	\N
7900	\N	\N
7941	\N	\N
7942	\N	\N
7943	\N	\N
7944	\N	\N
7945	\N	\N
7971	\N	\N
7972	\N	\N
7973	\N	\N
7974	\N	\N
7975	\N	\N
8021	\N	\N
8022	\N	\N
8023	\N	\N
8024	\N	\N
8025	\N	\N
7154	\N	\N
7155	\N	\N
7196	\N	\N
7197	\N	\N
7198	\N	\N
7199	\N	\N
7200	\N	\N
7246	\N	\N
7247	\N	\N
7248	\N	\N
7249	\N	\N
7250	\N	\N
7311	\N	\N
7312	\N	\N
7313	\N	\N
7314	\N	\N
7315	\N	\N
7361	\N	\N
7362	\N	\N
7363	\N	\N
7364	\N	\N
7365	\N	\N
7411	\N	\N
7412	\N	\N
7413	\N	\N
7414	\N	\N
7415	\N	\N
7466	\N	\N
7467	\N	\N
7468	\N	\N
7469	\N	\N
7470	\N	\N
7521	\N	\N
7522	\N	\N
7523	\N	\N
7524	\N	\N
7525	\N	\N
7566	\N	\N
7567	\N	\N
7568	\N	\N
7569	\N	\N
7570	\N	\N
7616	\N	\N
7617	\N	\N
7618	\N	\N
7619	\N	\N
7620	\N	\N
7641	\N	\N
7642	\N	\N
7643	\N	\N
7644	\N	\N
7645	\N	\N
7691	\N	\N
7692	\N	\N
7693	\N	\N
7694	\N	\N
7695	\N	\N
7731	\N	\N
7732	\N	\N
7733	\N	\N
7734	\N	\N
7735	\N	\N
7781	\N	\N
7782	\N	\N
7783	\N	\N
7784	\N	\N
7785	\N	\N
7836	\N	\N
7837	\N	\N
7838	\N	\N
7839	\N	\N
7840	\N	\N
7891	\N	\N
7892	\N	\N
7893	\N	\N
7894	\N	\N
7895	\N	\N
7951	\N	\N
7952	\N	\N
7953	\N	\N
7954	\N	\N
7955	\N	\N
8001	\N	\N
8002	\N	\N
8003	\N	\N
8004	\N	\N
8005	\N	\N
7284	\N	\N
7285	\N	\N
7336	\N	\N
7337	\N	\N
7338	\N	\N
7339	\N	\N
7340	\N	\N
7391	\N	\N
7392	\N	\N
7393	\N	\N
7394	\N	\N
7395	\N	\N
7426	\N	\N
7427	\N	\N
7428	\N	\N
7429	\N	\N
7430	\N	\N
7501	\N	\N
7502	\N	\N
7503	\N	\N
7504	\N	\N
7505	\N	\N
7556	\N	\N
7557	\N	\N
7558	\N	\N
7559	\N	\N
7560	\N	\N
7611	\N	\N
7612	\N	\N
7613	\N	\N
7614	\N	\N
7615	\N	\N
7656	\N	\N
7657	\N	\N
7658	\N	\N
7659	\N	\N
7660	\N	\N
7716	\N	\N
7717	\N	\N
7718	\N	\N
7719	\N	\N
7720	\N	\N
7776	\N	\N
7777	\N	\N
7778	\N	\N
7779	\N	\N
7780	\N	\N
7811	\N	\N
7812	\N	\N
7813	\N	\N
7814	\N	\N
7815	\N	\N
7871	\N	\N
7872	\N	\N
7873	\N	\N
7874	\N	\N
7875	\N	\N
7926	\N	\N
7927	\N	\N
7928	\N	\N
7929	\N	\N
7930	\N	\N
7976	\N	\N
7977	\N	\N
7978	\N	\N
7979	\N	\N
7980	\N	\N
9	@litecoin	https://twitter.com/litecoin
8	/r/litecoin	https://reddit.com/r/litecoin
10	Telegram	https://t.me/litecoin
859	@stellarorg	https://twitter.com/stellarorg
858	/r/stellar	https://reddit.com/r/stellar
1278	/r/nem	https://reddit.com/r/nem
1280	Telegram	https://t.me/nemred
4341	www.cardanohub.org	https://www.cardanohub.org/
2183	/r/NEO	https://reddit.com/r/NEO
351	www.dash.org	https://www.dash.org/
354	@Dashpay	https://twitter.com/Dashpay
353	/r/dashpay	https://reddit.com/r/dashpay
651	www.monero.cc	http://www.monero.cc
654	@monerocurrency	https://twitter.com/monerocurrency
653	/r/monero	https://reddit.com/r/monero
3414	@eos_io	https://twitter.com/eos_io
3413	/r/eos	https://reddit.com/r/eos
3415	Telegram	https://t.me/joinchat/AAAAAEQbOeucnaMWN0A9dQ
3696	www.binance.com	https://www.binance.com/
3699	@binance_2017	https://twitter.com/binance_2017
3698	/r/binance	https://reddit.com/r/binance
3700	Telegram	https://t.me/BinanceChinese
2086	ethereumclassic.github.io	https://ethereumclassic.github.io/
2089	@eth_classic	https://twitter.com/eth_classic
2088	/r/EthereumClassic	https://reddit.com/r/EthereumClassic
4344	@CardanoStiftung	https://twitter.com/CardanoStiftung
4343	/r/cardano	https://reddit.com/r/cardano
4345	Telegram	https://t.me/CardanoChinaOfficial
6796	ont.io	https://ont.io/
6797	medium.com	https://medium.com/ontologynetwork
6799	@OntologyNetwork	https://twitter.com/OntologyNetwork
6798	/r/OntologyNetwork	https://reddit.com/r/OntologyNetwork
6800	Telegram	https://t.me/OntologyNetwork
3236	iota.org	https://iota.org/
3239	@iotatoken	https://twitter.com/iotatoken
3238	/r/Iota	https://reddit.com/r/Iota
4116	tronlab.com	https://tronlab.com/
4117	medium.com	https://medium.com/@Tronfoundation
4119	@tronfoundation	https://twitter.com/tronfoundation
4118	/r/Tronix	https://reddit.com/r/Tronix
4120	Telegram	https://t.me/tronnetworkCN
3576	omg.omise.co	https://omg.omise.co/
3579	@omise_go	https://twitter.com/omise_go
3578	/r/omise_go	https://reddit.com/r/omise_go
3580	Telegram	https://t.me/omisego
1211	tether.to	https://tether.to
1214	@Tether_to	https://twitter.com/Tether_to
1213	/r/Tether	https://reddit.com/r/Tether
3	/r/bitcoin	https://reddit.com/r/bitcoin
2181	neo.org	https://neo.org/
2184	@neo_blockchain	https://twitter.com/neo_blockchain
1501	www.ethereum.org	https://www.ethereum.org
1504	@ethereum	https://twitter.com/ethereum
1503	/r/ethereum	https://reddit.com/r/ethereum
355	Telegram	https://t.me/DashDigitalCash
131	ripple.com	https://ripple.com/
134	@Ripple	https://twitter.com/Ripple
133	/r/ripple	https://reddit.com/r/ripple
655	Telegram	https://t.me/bitmonero
3656	www.bitcoincash.org	https://www.bitcoincash.org/
3658	/r/Bitcoincash	https://reddit.com/r/Bitcoincash
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, fiat_currency_id, coin_currency_id, email, password, notifications) FROM stdin;
\.


--
-- Name: coin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coin_id_seq', 1605, true);


--
-- Name: coin_news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coin_news_id_seq', 294, true);


--
-- Name: currency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.currency_id_seq', 5, true);


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

SELECT pg_catalog.setval('public.news_id_seq', 184, true);


--
-- Name: price_alert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.price_alert_id_seq', 1, false);


--
-- Name: price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.price_id_seq', 8025, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sessions_id_seq', 1, false);


--
-- Name: source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.source_id_seq', 8025, true);


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
-- Name: coin coin_medium_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin
    ADD CONSTRAINT coin_medium_foreign FOREIGN KEY (medium) REFERENCES public.source(id);


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
-- Name: coin coin_official_website_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin
    ADD CONSTRAINT coin_official_website_foreign FOREIGN KEY (official_website) REFERENCES public.source(id);


--
-- Name: coin coin_reddit_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin
    ADD CONSTRAINT coin_reddit_foreign FOREIGN KEY (reddit) REFERENCES public.source(id);


--
-- Name: coin coin_telegram_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin
    ADD CONSTRAINT coin_telegram_foreign FOREIGN KEY (telegram) REFERENCES public.source(id);


--
-- Name: coin coin_twitter_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin
    ADD CONSTRAINT coin_twitter_foreign FOREIGN KEY (twitter) REFERENCES public.source(id);


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
-- Name: price_alert price_alert_price_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_alert
    ADD CONSTRAINT price_alert_price_id_foreign FOREIGN KEY (price_id) REFERENCES public.price(id);


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

