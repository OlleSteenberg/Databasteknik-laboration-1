---
--- drop tables
---

DROP TABLE IF EXISTS player_position;
DROP TABLE IF EXISTS player;
DROP TABLE IF EXISTS positions;
DROP TABLE IF EXISTS football_club;

--
-- Name: football_club; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE football_club (
    club_id SERIAL PRIMARY KEY,
    club_name VARCHAR(25) NOT NULL
);

--
-- Name: player; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE player (
    player_id SERIAL PRIMARY KEY,
    firstname VARCHAR(25) NOT NULL,
		lastname VARCHAR(25) NOT NULL,
    shirtnumber smallint,
		club INTEGER REFERENCES football_club(club_id) ON DELETE SET NULL
);

--
-- Name: positions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE positions (
    position_id SERIAL PRIMARY KEY,
    position_name VARCHAR(3) NOT NULL
);

--
-- Name: player; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE player_position (
		player_id INTEGER REFERENCES player(player_id),
		position_id INTEGER REFERENCES positions(position_id),
		PRIMARY KEY(player_id, position_id)
);

--
-- Data for Name: football_club; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO football_club (club_name)
VALUES
	('Tottenhamn'),
	('ManUnited'),
	('Barcelona'),
	('Hammarby');

--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO player (firstname, lastname, shirtnumber, club)
VALUES 
	('Olle', 'Steenberg', 10, 3),
	('Zlatan', 'Ibra', 10, 1),
	('Harry', 'Kane', 9, 4),
	('Cristiano', 'Ronaldo', 7, 4),
	('Vinicius', 'Junior', 11, 4),
	('Harry', 'Maguire', 3, 2);

--
-- Data for Name: s; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO positions (position_name)
VALUES 
	('CB'),
	('LB'),
	('RB'),
	('CM'),
	('LM'),
	('RM'),
	('ST');

--
-- Data for Name: player_position; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO player_position (player_id, position_id)
VALUES
	(1, 1),
	(1, 2),
	(2, 5),
	(2, 6),
	(2, 7),
	(3, 4),
	(4, 7),
	(5, 2),
	(5, 3),
	(6, 5);


SELECT *
FROM player;

SELECT firstname, lastname
FROM player;

UPDATE player
SET club = 4
WHERE club IS NULL;

-- Tar bort Barcelona som från tabellen av fotbollslag
DELETE FROM football_club
WHERE club_name = 'Barcelona';

-- Tar bort player_id 1 från relationstabellen
DELETE FROM player_position
WHERE player_id = '1';

-- Tar bort Spelaren som inte tillhör ett lag
DELETE FROM player
WHERE club IS NULL;

-- Test för referensintegritet
INSERT INTO player (firstname, lastname, shirtnumber, club)
VALUES ('test', 'reference', 4, 7);




SELECT *
FROM player;

SELECT firstname, lastname
FROM player;