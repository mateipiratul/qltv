-- 04_seed_data.sql

--------------- DB INSERT -----------------
SET VERIFY OFF                           --
ALTER SESSION SET NLS_LANGUAGE=American; --
-------------------------------------------

REM inseram date in tabelul REGIUNI
PROMPT *** populating REGIUNI table

INSERT INTO regiuni VALUES ('NA', 'North America');
INSERT INTO regiuni VALUES ('SA', 'South America');
INSERT INTO regiuni VALUES ('EU', 'Europe');
INSERT INTO regiuni VALUES ('AS', 'Asia');
INSERT INTO regiuni VALUES ('OC', 'Oceania');
INSERT INTO regiuni VALUES ('AF', 'Africa');
COMMIT;


REM inseram date in tabelul TARI
PROMPT *** populating TARI table

INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('AF', 'AS', 'Afghanistan');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('AL', 'EU', 'Albania');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('DZ', 'AF', 'Algeria');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('AD', 'EU', 'Andorra');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('AO', 'AF', 'Angola');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('AG', 'SA', 'Antigua and Barbuda');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('AR', 'SA', 'Argentina');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('AM', 'EU', 'Armenia');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('AU', 'OC', 'Australia');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('AT', 'EU', 'Austria');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('AZ', 'AS', 'Azerbaijan');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('BS', 'SA', 'Bahamas');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('BH', 'AS', 'Bahrain');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('BD', 'AS', 'Bangladesh');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('BB', 'SA', 'Barbados');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('BY', 'EU', 'Belarus');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('BE', 'EU', 'Belgium');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('BZ', 'SA', 'Belize');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('BJ', 'AF', 'Benin');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('BT', 'AS', 'Bhutan');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('BO', 'SA', 'Bolivia');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('BA', 'EU', 'Bosnia and Herzegovina');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('BW', 'AF', 'Botswana');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('BR', 'SA', 'Brazil');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('BN', 'AS', 'Brunei Darussalam');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('BG', 'EU', 'Bulgaria');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('BF', 'AF', 'Burkina Faso');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('BI', 'AF', 'Burundi');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('CV', 'AF', 'Cabo Verde');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('KH', 'AS', 'Cambodia');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('CM', 'AF', 'Cameroon');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('CA', 'NA', 'Canada');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('CF', 'AF', 'Central African Republic');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('TD', 'AF', 'Chad');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('CL', 'SA', 'Chile');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('CN', 'AS', 'China');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('CO', 'SA', 'Colombia');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('KM', 'AF', 'Comoros');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('CD', 'AF', 'Congo (D.R.)');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('CG', 'AF', 'Congo');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('CR', 'SA', 'Costa Rica');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('CI', 'AF', 'Cote d''Ivoire');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('HR', 'EU', 'Croatia');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('CU', 'SA', 'Cuba');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('CY', 'EU', 'Cyprus');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('CZ', 'EU', 'Czechia');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('DK', 'EU', 'Denmark');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('DJ', 'AF', 'Djibouti');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('DM', 'NA', 'Dominica');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('DO', 'SA', 'Dominican Republic');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('EC', 'SA', 'Ecuador');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('EG', 'AF', 'Egypt');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('SV', 'NA', 'El Salvador');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('GQ', 'AF', 'Equatorial Guinea');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('ER', 'AF', 'Eritrea');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('EE', 'EU', 'Estonia');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('SZ', 'AF', 'Eswatini');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('ET', 'AF', 'Ethiopia');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('FJ', 'OC', 'Fiji');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('FI', 'EU', 'Finland');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('FR', 'EU', 'France');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('GA', 'AF', 'Gabon');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('GM', 'AF', 'Gambia');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('GE', 'EU', 'Georgia');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('DE', 'EU', 'Germany');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('GH', 'AF', 'Ghana');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('GR', 'EU', 'Greece');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('GD', 'NA', 'Grenada');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('GT', 'NA', 'Guatemala');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('GN', 'AF', 'Guinea');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('GW', 'AF', 'Guinea-Bissau');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('GY', 'SA', 'Guyana');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('HT', 'NA', 'Haiti');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('HN', 'NA', 'Honduras');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('HU', 'EU', 'Hungary');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('IS', 'EU', 'Iceland');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('IN', 'AS', 'India');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('ID', 'AS', 'Indonesia');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('IR', 'AS', 'Iran');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('IQ', 'AS', 'Iraq');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('IE', 'EU', 'Ireland');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('IL', 'AS', 'Israel');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('IT', 'EU', 'Italy');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('JM', 'NA', 'Jamaica');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('JP', 'AS', 'Japan');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('JO', 'AS', 'Jordan');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('KZ', 'AS', 'Kazakhstan');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('KE', 'AF', 'Kenya');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('KI', 'OC', 'Kiribati');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('KP', 'AS', 'North Korea');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('KR', 'AS', 'South Korea');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('XK', 'EU', 'Kosovo');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('KW', 'AS', 'Kuwait');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('KG', 'AS', 'Kyrgyzstan');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('LA', 'AS', 'Laos');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('LV', 'EU', 'Latvia');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('LB', 'AS', 'Lebanon');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('LS', 'AF', 'Lesotho');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('LR', 'AF', 'Liberia');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('LY', 'AF', 'Libya');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('LI', 'EU', 'Lichtenstein');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('LT', 'EU', 'Lithuania');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('LU', 'EU', 'Luxembourg');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('MG', 'AF', 'Madagascar');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('MW', 'AF', 'Malawi');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('MY', 'AS', 'Malaysia');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('MV', 'AS', 'Maldives');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('ML', 'AF', 'Mali');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('MT', 'EU', 'Malta');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('MH', 'OC', 'Marshall Islands');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('MR', 'AF', 'Mauritania');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('MU', 'AF', 'Mauritius');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('MX', 'NA', 'Mexico');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('FM', 'OC', 'Micronesia');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('MD', 'EU', 'Moldova');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('MC', 'EU', 'Monaco');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('MN', 'AS', 'Mongolia');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('ME', 'EU', 'Montenegro');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('MA', 'AF', 'Morocco');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('MZ', 'AF', 'Mozambique');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('MM', 'AS', 'Myanmar');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('NA', 'AF', 'Namibia');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('NR', 'OC', 'Nauru');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('NP', 'AS', 'Nepal');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('NL', 'EU', 'Netherlands');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('NZ', 'OC', 'New Zealand');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('NI', 'NA', 'Nicaragua');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('NE', 'AF', 'Niger');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('NG', 'AF', 'Nigeria');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('MK', 'EU', 'North Macedonia');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('NO', 'EU', 'Norway');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('OM', 'AS', 'Oman');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('PK', 'AS', 'Pakistan');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('PW', 'OC', 'Palau');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('PA', 'NA', 'Panama');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('PG', 'OC', 'Papua New Guinea');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('PY', 'SA', 'Paraguay');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('PE', 'SA', 'Peru');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('PH', 'AS', 'Philippines');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('PL', 'EU', 'Poland');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('PT', 'EU', 'Portugal');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('QA', 'AS', 'Qatar');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('RO', 'EU', 'Romania');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('RU', 'AS', 'Russian Federation');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('RW', 'AF', 'Rwanda');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('KN', 'NA', 'Saint Kitts and Nevis');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('LC', 'NA', 'Saint Lucia');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('VC', 'NA', 'Saint Vincent and the Grenadines');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('WS', 'OC', 'Samoa');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('SM', 'EU', 'San Marino');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('ST', 'AF', 'Sao Tome and Principe');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('SA', 'AS', 'Saudi Arabia');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('SN', 'AF', 'Senegal');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('RS', 'EU', 'Serbia');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('SC', 'AF', 'Seychelles');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('SL', 'AF', 'Sierra Leone');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('SG', 'AS', 'Singapore');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('SK', 'EU', 'Slovakia');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('SI', 'EU', 'Slovenia');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('SB', 'OC', 'Solomon Islands');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('SO', 'AF', 'Somalia');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('ZA', 'AF', 'South Africa');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('SS', 'AF', 'South Sudan');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('ES', 'EU', 'Spain');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('LK', 'AS', 'Sri Lanka');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('SD', 'AF', 'Sudan');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('SR', 'SA', 'Suriname');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('SE', 'EU', 'Sweden');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('CH', 'EU', 'Switzerland');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('SY', 'AS', 'Syrian Arab Republic');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('TJ', 'AS', 'Tajikistan');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('TZ', 'AF', 'Tanzania');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('TH', 'AS', 'Thailand');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('TL', 'AS', 'Timor Leste');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('TG', 'AF', 'Togo');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('TO', 'OC', 'Tonga');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('TT', 'NA', 'Trinidad and Tobago');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('TN', 'AF', 'Tunisia');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('TR', 'AS', 'Turkey');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('TM', 'AS', 'Turkmenistan');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('TV', 'OC', 'Tuvalu');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('UG', 'AF', 'Uganda');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('UA', 'EU', 'Ukraine');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('AE', 'AS', 'United Arab Emirates');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('GB', 'EU', 'United Kingdom of Great Britain and Northern Ireland');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('US', 'NA', 'United States of America');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('UY', 'SA', 'Uruguay');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('UZ', 'AS', 'Uzbekistan');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('VU', 'OC', 'Vanuatu');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('VE', 'SA', 'Venezuela');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('VN', 'AS', 'Vietnam');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('YE', 'AS', 'Yemen');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('ZM', 'AF', 'Zambia');
INSERT INTO tari (id_tara, id_regiune, nume_tara) VALUES ('ZW', 'AF', 'Zimbabwe');
COMMIT;


REM inseram date in tabelul TIPURI_EVENIMENT
PROMPT *** populating TIPURI_EVENIMENT table

INSERT INTO tipuri_eveniment VALUES ('MJ', 'Major', 'Largest type of event hosted, biggest prize pools available, with attending teams being only from top 40.');
INSERT INTO tipuri_eveniment VALUES ('IL', 'International LAN', 'While the magnitude of such event may vary, most have great impact on the Counter-Strike community, having top 50 teams attending.');
INSERT INTO tipuri_eveniment VALUES ('RL', 'Regional LAN', 'Nationally hosted events that promote the Counter-Strike culture on a regional level, sometimes standing as local qualifiers for large scale events.');
INSERT INTO tipuri_eveniment VALUES ('ON', 'Online', 'The event is hosted online, meaning that the attending teams may vary from tournament to tournament, usually being organised as qualifier stages for other bigger, physically hosted events.');
INSERT INTO tipuri_eveniment VALUES ('LL', 'Local LAN', 'Smallest type of event hosted, usually meant for smaller, local teams to perform and get recognized.');
INSERT INTO tipuri_eveniment VALUES ('OT', 'Other', 'Anything else that does not fall into any category');
COMMIT;


REM inseram date in tabelul ROLURI
PROMPT *** populating ROLURI table

INSERT INTO roluri VALUES ('RFL', 'Rifler');
INSERT INTO roluri VALUES ('IGL', 'In-Game Leader');
INSERT INTO roluri VALUES ('AWP', 'AWPer');
INSERT INTO roluri VALUES ('ENT', 'Entry Fragger');
INSERT INTO roluri VALUES ('SUP', 'Support');
INSERT INTO roluri VALUES ('ANC', 'Anchor');
INSERT INTO roluri VALUES ('LRK', 'Lurker');
COMMIT;


REM inseram date in tabelul HARTI
PROMPT *** populating HARTI table

INSERT INTO harti (nume_harta, pool_activ) VALUES ('Ancient', 1);
INSERT INTO harti (nume_harta, pool_activ) VALUES ('Dust 2', 1);
INSERT INTO harti (nume_harta, pool_activ) VALUES ('Inferno', 1);
INSERT INTO harti (nume_harta, pool_activ) VALUES ('Mirage', 1);
INSERT INTO harti (nume_harta, pool_activ) VALUES ('Nuke', 1);
INSERT INTO harti (nume_harta, pool_activ) VALUES ('Overpass', 1);
INSERT INTO harti (nume_harta, pool_activ) VALUES ('Train', 1);
INSERT INTO harti (nume_harta, pool_activ) VALUES ('Anubis', 0);
INSERT INTO harti (nume_harta, pool_activ) VALUES ('Vertigo', 0);
COMMIT;


REM inseram date in tabelul ORGANIZATORI
PROMPT *** populating ORGANIZATORI table

INSERT INTO organizatori (id_organizator, nume_organizator, site_web, email_contact) VALUES (3000, 'ESL Gaming', 'https://pro.eslgaming.com', 'info@eslgaming.com');
INSERT INTO organizatori (id_organizator, nume_organizator, site_web, email_contact) VALUES (3001, 'BLAST Premier', 'https://blast.tv', 'contact@blast.tv');
INSERT INTO organizatori (id_organizator, nume_organizator, site_web, email_contact) VALUES (3002, 'PGL Esports', 'https://pglesports.com', 'contact@pgl.ro');
INSERT INTO organizatori (id_organizator, nume_organizator, site_web, email_contact) VALUES (3003, 'DreamHack', 'https://dreamhack.com', 'support@dreamhack.com');
INSERT INTO organizatori (id_organizator, nume_organizator, site_web, email_contact) VALUES (3004, 'StarLadder', 'https://starladder.com', 'info@starladder.com');
INSERT INTO organizatori (id_organizator, nume_organizator, site_web, email_contact) VALUES (3005, 'FACEIT Group', 'https://faceit.com', 'media@faceit.com');
INSERT INTO organizatori (id_organizator, nume_organizator, site_web, email_contact) VALUES (3006, 'Perfect World', 'https://www.pwan.com', 'cs2_cn@pwan.com');
INSERT INTO organizatori (id_organizator, nume_organizator, site_web, email_contact) VALUES (3007, 'WePlay Esports', 'https://weplay.tv', 'press@weplay.tv');
INSERT INTO organizatori (id_organizator, nume_organizator, site_web, email_contact) VALUES (3008, 'ELEAGUE', 'https://www.eleague.com', 'contact@eleague.com');
INSERT INTO organizatori (id_organizator, nume_organizator, site_web, email_contact) VALUES (3009, 'Relog Media', 'https://relogmedia.com', 'office@relogmedia.com');
INSERT INTO organizatori (id_organizator, nume_organizator, site_web, email_contact) VALUES (3010, 'Elisa Esports', 'https://elisaesports.fi', 'masters@elisa.fi');
INSERT INTO organizatori (id_organizator, nume_organizator, site_web, email_contact) VALUES (3011, 'ESEA', 'https://esea.net', 'support@esea.net');
INSERT INTO organizatori (id_organizator, nume_organizator, site_web, email_contact) VALUES (3012, 'Gamers8', 'https://gamers8.gg', 'info@gamers8.gg');
INSERT INTO organizatori (id_organizator, nume_organizator, site_web, email_contact) VALUES (3013, 'FISSURE', 'https://fissure.pro', 'contact@fissure.pro');
INSERT INTO organizatori (id_organizator, nume_organizator, site_web, email_contact) VALUES (3014, 'Eden Esports', 'https://edenesports.com', 'hi@edenesports.com');
COMMIT;


REM inseram date in tabelul SPONSORI
PROMPT *** populating SPONSORI table

INSERT INTO sponsori (id_sponsor, nume_sponsor, domeniu_activitate, site_web) VALUES (5000, 'Logitech G', 'Periferice Gaming', 'https://www.logitechg.com');
INSERT INTO sponsori (id_sponsor, nume_sponsor, domeniu_activitate, site_web) VALUES (5001, 'GG.BET', 'Pariuri Sportive', 'https://gg.bet');
INSERT INTO sponsori (id_sponsor, nume_sponsor, domeniu_activitate, site_web) VALUES (5002, 'Monster Energy', 'Bauturi Energizante', 'https://monsterenergy.com');
INSERT INTO sponsori (id_sponsor, nume_sponsor, domeniu_activitate, site_web) VALUES (5003, 'Intel', 'Hardware PC', 'https://intel.com');
INSERT INTO sponsori (id_sponsor, nume_sponsor, domeniu_activitate, site_web) VALUES (5004, 'HyperX', 'Periferice Gaming', 'https://hyperx.com');
INSERT INTO sponsori (id_sponsor, nume_sponsor, domeniu_activitate, site_web) VALUES (5005, 'CS.MONEY', 'Tranzactionare Skins', 'https://cs.money');
INSERT INTO sponsori (id_sponsor, nume_sponsor, domeniu_activitate, site_web) VALUES (5006, 'Red Bull', 'Bauturi Energizante', 'https://redbull.com');
INSERT INTO sponsori (id_sponsor, nume_sponsor, domeniu_activitate, site_web) VALUES (5007, 'SteelSeries', 'Periferice Gaming', 'https://steelseries.com');
INSERT INTO sponsori (id_sponsor, nume_sponsor, domeniu_activitate, site_web) VALUES (5008, 'DHL', 'Logistica', 'https://dhl.com');
INSERT INTO sponsori (id_sponsor, nume_sponsor, domeniu_activitate, site_web) VALUES (5009, '1xBet', 'Pariuri Sportive', 'https://1xbet.com');
INSERT INTO sponsori (id_sponsor, nume_sponsor, domeniu_activitate, site_web) VALUES (5010, 'AMD', 'Hardware PC', 'https://amd.com');
INSERT INTO sponsori (id_sponsor, nume_sponsor, domeniu_activitate, site_web) VALUES (5011, 'Secretlab', 'Scaune Gaming', 'https://secretlab.eu');
INSERT INTO sponsori (id_sponsor, nume_sponsor, domeniu_activitate, site_web) VALUES (5012, 'ZOWIE by BenQ', 'Monitoare Gaming', 'https://zowie.benq.com');
INSERT INTO sponsori (id_sponsor, nume_sponsor, domeniu_activitate, site_web) VALUES (5013, 'Razer', 'Periferice Gaming', 'https://razer.com');
INSERT INTO sponsori (id_sponsor, nume_sponsor, domeniu_activitate, site_web) VALUES (5014, 'Coinbase', 'Criptomonede', 'https://coinbase.com');
COMMIT;


REM inseram date in tabelul ECHIPE
PROMPT *** populating ECHIPE table

INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100000, 'Natus Vincere', 'NAVI', 1);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100001, 'FaZe Clan', 'FaZe', 2);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100002, 'Team Spirit', 'TS', 3);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100003, 'MOUZ', 'MOUZ', 4);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100004, 'G2 Esports', 'G2', 5);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100005, 'Team Vitality', 'VIT', 6);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100006, 'Virtus.pro', 'VP', 7);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100007, 'Eternal Fire', 'EF', 8);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100008, 'Astralis', 'AST', 9);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100009, 'Complexity', 'COL', 10);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100010, 'HEROIC', 'HER', 11);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100011, 'The MongolZ', 'MGLZ', 12);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100012, 'Cloud9', 'C9', 13);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100013, 'Team Falcons', 'FAL', 14);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100014, 'Team Liquid', 'TL', 15);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100015, 'FURIA Esports', 'FURIA', 16);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100016, 'ENCE', 'ENCE', 17);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100017, 'BIG', 'BIG', 18);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100018, 'GamerLegion', 'GL', 19);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100019, 'Monte', 'MNT', 20);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100020, 'BetBoom Team', 'BB', 21);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100021, 'SAW', 'SAW', 22);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100022, '9 Pandas', '9P', 23);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100023, 'M80', 'M80', 24);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100024, 'Apeks', 'APK', 25);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100025, 'Ninjas in Pyjamas', 'NIP', 26);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100026, 'Fnatic', 'FNC', 27);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100027, 'OG Esports', 'OG', 28);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100028, 'Imperial Esports', 'IMP', 29);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100029, 'paiN Gaming', 'paiN', 30);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100030, 'MIBR', 'MIBR', 31);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100031, 'AMKAL ESPORTS', 'AMKAL', 32);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100032, 'Movistar KOI', 'KOI', 33);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100033, '3DMAX', '3DMAX', 34);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100034, 'ECSTATIC', 'ECS', 35);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100035, 'Preasy Esport', 'PRE', 36);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100036, 'TYLOO', 'TYLOO', 37);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100037, 'Lynn Vision', 'LVG', 38);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100038, 'Rare Atom', 'RA', 39);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100039, 'BLEED Esports', 'BLEED', 40);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100040, 'Nexus Esports', 'NXS', 41);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100041, '9z Team', '9z', 42);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100042, 'Aurora Gaming', 'AUR', 43);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100043, 'FORZE Esports', 'FORZE', 44);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100044, 'Nemiga Gaming', 'NEM', 45);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100045, 'Sangal Esports', 'SAN', 46);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100046, 'B8 Esports', 'B8', 47);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100047, 'Into the Breach', 'ITB', 48);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100048, 'Endpoint', 'END', 49);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100049, 'Parivision', 'PARI', 50);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100050, 'Metizport', 'MET', 51);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100051, 'NRG', 'NRG', 52);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100052, 'Wildcard Gaming', 'WC', 53);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100053, 'Nouns Esports', 'NOUNS', 54);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100054, 'Legacy', 'LGC', 55);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100055, 'RED Canids', 'RED', 56);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100056, 'Sharks Esports', 'SHARK', 57);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100057, 'FlyQuest', 'FQ', 58);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100058, 'Grayhound', 'GH', NULL);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100059, 'NAVI Junior', 'NAVIj', 85);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100060, 'MOUZ NXT', 'NXT', 88);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100061, 'Spirit Academy', 'TS.A', 90);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100062, 'SK Gaming', 'SK', NULL);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100063, 'Titan', 'Titan', NULL);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100064, 'Team Envy', 'nV', NULL);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100065, 'Luminosity Gaming', 'LG', NULL);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100066, 'Dignitas', 'DIG', NULL);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100067, '100 Thieves', '100T', NULL);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100068, 'Evil Geniuses', 'EG', NULL);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100069, 'Copenhagen Flames', 'CPHF', NULL);
INSERT INTO echipe (id_echipa, nume_echipa, tag_echipa, ranking_mondial) VALUES (100070, 'Gambit Esports', 'GMB', NULL);
COMMIT;


REM inseram date in tabelul TURNEE
PROMPT *** populating TURNEE table

INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (1, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'PGL Esports'), 'MJ', 'PGL Major Copenhagen 2024', TO_DATE('17-03-2024', 'DD-MM-YYYY'), TO_DATE('31-03-2024', 'DD-MM-YYYY'), 'Copenhagen', 1250000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (2, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'PGL Esports'), 'MJ', 'PGL Major Antwerp 2022', TO_DATE('09-05-2022', 'DD-MM-YYYY'), TO_DATE('22-05-2022', 'DD-MM-YYYY'), 'Antwerp', 1000000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (3, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'PGL Esports'), 'ON', 'PGL Major Copenhagen: European RMR A', TO_DATE('14-02-2024', 'DD-MM-YYYY'), TO_DATE('17-02-2024', 'DD-MM-YYYY'), 'Bucharest', 0);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (4, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'PGL Esports'), 'ON', 'PGL Major Copenhagen: European RMR B', TO_DATE('19-02-2024', 'DD-MM-YYYY'), TO_DATE('22-02-2024', 'DD-MM-YYYY'), 'Bucharest', 0);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (5, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'PGL Esports'), 'IL', 'PGL Wallachia 2024', TO_DATE('10-05-2024', 'DD-MM-YYYY'), TO_DATE('19-05-2024', 'DD-MM-YYYY'), 'Bucharest', 1000000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (6, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'ESL Gaming'), 'IL', 'IEM Katowice 2024', TO_DATE('31-01-2024', 'DD-MM-YYYY'), TO_DATE('11-02-2024', 'DD-MM-YYYY'), 'Katowice', 1000000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (7, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'ESL Gaming'), 'IL', 'IEM Cologne 2023', TO_DATE('26-07-2023', 'DD-MM-YYYY'), TO_DATE('06-08-2023', 'DD-MM-YYYY'), 'Cologne', 1000000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (8, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'ESL Gaming'), 'IL', 'ESL Pro League Season 19', TO_DATE('23-04-2024', 'DD-MM-YYYY'), TO_DATE('12-05-2024', 'DD-MM-YYYY'), 'Saint Julian''s', 750000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (9, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'ESL Gaming'), 'IL', 'IEM Dallas 2024', TO_DATE('27-05-2024', 'DD-MM-YYYY'), TO_DATE('02-06-2024', 'DD-MM-YYYY'), 'Dallas', 250000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (10, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'ESL Gaming'), 'IL', 'IEM Chengdu 2024', TO_DATE('08-04-2024', 'DD-MM-YYYY'), TO_DATE('14-04-2024', 'DD-MM-YYYY'), 'Chengdu', 250000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (11, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'ESL Gaming'), 'RL', 'ESL Challenger J�nk�ping 2024', TO_DATE('14-06-2024', 'DD-MM-YYYY'), TO_DATE('16-06-2024', 'DD-MM-YYYY'), 'J�nk�ping', 100000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (12, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'ESL Gaming'), 'RL', 'ESL Challenger Atlanta 2023', TO_DATE('15-12-2023', 'DD-MM-YYYY'), TO_DATE('17-12-2023', 'DD-MM-YYYY'), 'Atlanta', 100000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (13, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'ESL Gaming'), 'ON', 'IEM Road to Rio 2022: European RMR A', TO_DATE('04-10-2022', 'DD-MM-YYYY'), TO_DATE('09-10-2022', 'DD-MM-YYYY'), 'Malta', 0);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (14, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'ESL Gaming'), 'IL', 'IEM Sydney 2023', TO_DATE('16-10-2023', 'DD-MM-YYYY'), TO_DATE('22-10-2023', 'DD-MM-YYYY'), 'Sydney', 250000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (15, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'ESL Gaming'), 'IL', 'IEM Rio 2023', TO_DATE('17-04-2023', 'DD-MM-YYYY'), TO_DATE('23-04-2023', 'DD-MM-YYYY'), 'Rio de Janeiro', 250000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (16, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'ESL Gaming'), 'MJ', 'IEM Rio Major 2022', TO_DATE('31-10-2022', 'DD-MM-YYYY'), TO_DATE('13-11-2022', 'DD-MM-YYYY'), 'Rio de Janeiro', 1250000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (17, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'ESL Gaming'), 'LL', 'ESL Meisterschaft: Spring 2023', TO_DATE('10-03-2023', 'DD-MM-YYYY'), TO_DATE('20-05-2023', 'DD-MM-YYYY'), 'Online', 30000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (18, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'ESL Gaming'), 'LL', 'ESL Benelux Championship', TO_DATE('15-02-2023', 'DD-MM-YYYY'), TO_DATE('30-04-2023', 'DD-MM-YYYY'), 'Online', 15000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (19, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'BLAST Premier'), 'IL', 'BLAST Premier: World Final 2023', TO_DATE('13-12-2023', 'DD-MM-YYYY'), TO_DATE('17-12-2023', 'DD-MM-YYYY'), 'Abu Dhabi', 1000000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (20, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'BLAST Premier'), 'IL', 'BLAST Premier: Spring Final 2024', TO_DATE('12-06-2024', 'DD-MM-YYYY'), TO_DATE('16-06-2024', 'DD-MM-YYYY'), 'London', 425000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (21, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'BLAST Premier'), 'IL', 'BLAST Premier: Fall Groups 2023', TO_DATE('13-07-2023', 'DD-MM-YYYY'), TO_DATE('23-07-2023', 'DD-MM-YYYY'), 'Copenhagen', 177500);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (22, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'BLAST Premier'), 'ON', 'BLAST Premier: Spring Showdown 2024', TO_DATE('06-03-2024', 'DD-MM-YYYY'), TO_DATE('10-03-2024', 'DD-MM-YYYY'), 'Online', 135000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (23, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'BLAST Premier'), 'MJ', 'BLAST.tv Paris Major 2023', TO_DATE('08-05-2023', 'DD-MM-YYYY'), TO_DATE('21-05-2023', 'DD-MM-YYYY'), 'Paris', 1250000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (24, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'BLAST Premier'), 'ON', 'BLAST Premier: Fall Showdown 2023', TO_DATE('04-10-2023', 'DD-MM-YYYY'), TO_DATE('08-10-2023', 'DD-MM-YYYY'), 'Online', 135000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (25, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'Perfect World'), 'MJ', 'Perfect World Shanghai Major 2024', TO_DATE('01-12-2024', 'DD-MM-YYYY'), TO_DATE('15-12-2024', 'DD-MM-YYYY'), 'Shanghai', 1250000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (26, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'Perfect World'), 'IL', 'CS Asia Championships 2023', TO_DATE('08-11-2023', 'DD-MM-YYYY'), TO_DATE('12-11-2023', 'DD-MM-YYYY'), 'Shanghai', 500000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (27, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'Perfect World'), 'OT', 'CS2 Showmatch: East vs West', TO_DATE('12-11-2023', 'DD-MM-YYYY'), TO_DATE('13-11-2023', 'DD-MM-YYYY'), 'Shanghai', 10000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (28, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'Gamers8'), 'IL', 'Gamers8 2023', TO_DATE('16-08-2023', 'DD-MM-YYYY'), TO_DATE('20-08-2023', 'DD-MM-YYYY'), 'Riyadh', 1000000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (29, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'FISSURE'), 'IL', 'BetBoom Dacha Belgrade 2024', TO_DATE('14-05-2024', 'DD-MM-YYYY'), TO_DATE('19-05-2024', 'DD-MM-YYYY'), 'Belgrade', 500000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (30, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'FISSURE'), 'IL', 'BetBoom Dacha Dubai 2023', TO_DATE('05-12-2023', 'DD-MM-YYYY'), TO_DATE('10-12-2023', 'DD-MM-YYYY'), 'Dubai', 300000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (31, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'FISSURE'), 'ON', 'BetBoom Playlist. Urbanistic', TO_DATE('20-02-2023', 'DD-MM-YYYY'), TO_DATE('03-04-2023', 'DD-MM-YYYY'), 'Online', 300000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (32, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'Elisa Esports'), 'IL', 'Elisa Masters Espoo 2023', TO_DATE('29-11-2023', 'DD-MM-YYYY'), TO_DATE('03-12-2023', 'DD-MM-YYYY'), 'Espoo', 200000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (33, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'Elisa Esports'), 'ON', 'Elisa Invitational Spring 2024', TO_DATE('26-02-2024', 'DD-MM-YYYY'), TO_DATE('18-05-2024', 'DD-MM-YYYY'), 'Online', 25000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (34, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'DreamHack'), 'RL', 'DreamHack Melbourne 2024', TO_DATE('26-04-2024', 'DD-MM-YYYY'), TO_DATE('28-04-2024', 'DD-MM-YYYY'), 'Melbourne', 100000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (35, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'DreamHack'), 'RL', 'DreamHack Valencia 2023', TO_DATE('08-12-2023', 'DD-MM-YYYY'), TO_DATE('10-12-2023', 'DD-MM-YYYY'), 'Valencia', 100000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (36, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'DreamHack'), 'RL', 'DreamHack Hanover 2023', TO_DATE('14-12-2023', 'DD-MM-YYYY'), TO_DATE('17-12-2023', 'DD-MM-YYYY'), 'Hanover', 100000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (37, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'Relog Media'), 'ON', 'Brazy Party 2023', TO_DATE('26-04-2023', 'DD-MM-YYYY'), TO_DATE('03-05-2023', 'DD-MM-YYYY'), 'Online', 333000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (38, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'Relog Media'), 'ON', 'Roobet Cup 2023', TO_DATE('25-10-2023', 'DD-MM-YYYY'), TO_DATE('02-11-2023', 'DD-MM-YYYY'), 'Online', 250000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (39, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'Relog Media'), 'ON', 'RES Regional Series 1 LatAm', TO_DATE('12-02-2024', 'DD-MM-YYYY'), TO_DATE('26-02-2024', 'DD-MM-YYYY'), 'Online', 50000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (40, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'Relog Media'), 'ON', 'RES Eastern European Masters', TO_DATE('01-03-2024', 'DD-MM-YYYY'), TO_DATE('03-03-2024', 'DD-MM-YYYY'), 'Online', 0);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (41, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'Eden Esports'), 'ON', 'CCT Global Finals 2024', TO_DATE('16-05-2024', 'DD-MM-YYYY'), TO_DATE('23-05-2024', 'DD-MM-YYYY'), 'Online', 500000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (42, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'Eden Esports'), 'ON', 'Malta Vibes Knockout Series 1', TO_DATE('07-08-2023', 'DD-MM-YYYY'), TO_DATE('17-08-2023', 'DD-MM-YYYY'), 'Online', 50000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (43, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'Eden Esports'), 'ON', 'CCT North Europe Series 5', TO_DATE('15-05-2023', 'DD-MM-YYYY'), TO_DATE('28-05-2023', 'DD-MM-YYYY'), 'Online', 50000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (44, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'WePlay Esports'), 'ON', 'WePlay Academy League Season 6', TO_DATE('12-10-2022', 'DD-MM-YYYY'), TO_DATE('20-11-2022', 'DD-MM-YYYY'), 'Online', 100000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (45, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'FACEIT Group'), 'MJ', 'FACEIT Major: London 2018', TO_DATE('05-09-2018', 'DD-MM-YYYY'), TO_DATE('23-09-2018', 'DD-MM-YYYY'), 'London', 1000000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (46, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'FACEIT Group'), 'ON', 'IEM Road to Rio 2022: NA RMR', TO_DATE('05-10-2022', 'DD-MM-YYYY'), TO_DATE('09-10-2022', 'DD-MM-YYYY'), 'Stockholm', 0);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (47, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'ESEA'), 'ON', 'ESEA Season 49: Advanced Division', TO_DATE('04-04-2024', 'DD-MM-YYYY'), TO_DATE('10-06-2024', 'DD-MM-YYYY'), 'Online', 20000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (48, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'ESEA'), 'ON', 'ESEA Cash Cup: Europe - Spring 2024', TO_DATE('20-03-2024', 'DD-MM-YYYY'), TO_DATE('21-03-2024', 'DD-MM-YYYY'), 'Online', 4000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (49, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'ESEA'), 'LL', 'ESEA Open Season 48', TO_DATE('10-01-2024', 'DD-MM-YYYY'), TO_DATE('20-03-2024', 'DD-MM-YYYY'), 'Online', 5000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (50, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'StarLadder'), 'MJ', 'StarLadder Berlin Major 2019', TO_DATE('23-08-2019', 'DD-MM-YYYY'), TO_DATE('08-09-2019', 'DD-MM-YYYY'), 'Berlin', 1000000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (51, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'PGL Esports'), 'MJ', 'PGL Major Stockholm 2025', TO_DATE('15-12-2025', 'DD-MM-YYYY'), TO_DATE('10-01-2026', 'DD-MM-YYYY'), 'Stockholm', 1500000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (52, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'ESL Gaming'), 'IL', 'IEM China 2026', TO_DATE('03-01-2026', 'DD-MM-YYYY'), TO_DATE('14-01-2026', 'DD-MM-YYYY'), 'Beijing', 500000);
INSERT INTO turnee (id_turneu, id_organizator, id_tip_eveniment, nume_turneu, data_inceput, data_sfarsit, locatie_oras, premiu_total_usd)
    VALUES (53, (SELECT id_organizator FROM organizatori WHERE nume_organizator = 'BLAST Premier'), 'IL', 'BLAST Premier: Spring Groups 2026', TO_DATE('25-01-2026', 'DD-MM-YYYY'), TO_DATE('04-02-2026', 'DD-MM-YYYY'), 'Copenhagen', 190000);
COMMIT;


REM inseram date in tabelul MEMBRI
PROMPT *** populating MEMBRI table

INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (1, 'UA', 'Kostyliev', 'Oleksandr', 's1mple', TO_DATE('02-10-1997', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (2, 'RO', 'Ivan', 'Mihai', 'iM', TO_DATE('29-07-1999', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (3, 'FR', 'Herbaut', 'Mathieu', 'ZywOo', TO_DATE('09-11-2000', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (4, 'BA', 'Kovac', 'Nikola', 'NiKo', TO_DATE('16-02-1997', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (5, 'DK', 'Andersen', 'Finn', 'karrigan', TO_DATE('14-04-1990', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (6, 'RU', 'Osipov', 'Ilya', 'm0NESY', TO_DATE('01-05-2005', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (7, 'RU', 'Kryshkovets', 'Danil', 'donk', TO_DATE('25-01-2007', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (8, 'NO', 'Nygaard', 'Havard', 'rain', TO_DATE('27-08-1994', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (9, 'EE', 'Kool', 'Robin', 'ropz', TO_DATE('22-12-1999', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (10, 'LV', 'Saukants', 'Helvijs', 'broky', TO_DATE('14-02-2001', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (11, 'UA', 'Vakhovsjkyj', 'Valerij', 'b1t', TO_DATE('05-01-2003', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (12, 'FI', 'Virolainen', 'Aleksi', 'Aleksib', TO_DATE('30-03-1997', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (13, 'UA', 'Gorodenskiy', 'Andrey', 'B1ad3', TO_DATE('11-10-1986', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (14, 'DK', 'Sorensen', 'Danny', 'zonic', TO_DATE('30-07-1986', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (15, 'BR', 'Toledo', 'Gabriel', 'FalleN', TO_DATE('13-09-1991', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (16, 'US', 'Jablonowski', 'Jonathan', 'EliGE', TO_DATE('16-07-1997', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (17, 'DK', 'Reedtz', 'Nicolai', 'device', TO_DATE('08-09-1995', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (18, 'CA', 'Van Dulken', 'Russel', 'Twistzz', TO_DATE('14-11-1999', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (19, 'IL', 'Giladi', 'Lotan', 'Spinx', TO_DATE('13-09-2000', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (20, 'RO', 'Guta', 'Adrian', 'XELLOW', TO_DATE('04-03-2000', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (21, 'FR', 'Madesclaire', 'Dan', 'apEX', TO_DATE('22-02-1993', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (22, 'IL', 'Shushan', 'Shahar', 'flameZ', TO_DATE('22-06-2003', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (23, 'BA', 'Kovac', 'Nemanja', 'huNter', TO_DATE('03-01-1996', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (24, 'PL', 'Pogorzelski', 'Janusz', 'Snax', TO_DATE('05-07-1993', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (25, 'PL', 'Wojtas', 'Wiktor', 'TaZ', TO_DATE('06-06-1986', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (26, 'RU', 'Vishnyakov', 'Leonid', 'chopper', TO_DATE('04-02-1997', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (27, 'RU', 'Sokolov', 'Dmitry', 'sh1ro', TO_DATE('15-07-2001', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (28, 'UA', 'Plakhotia', 'Myroslav', 'zont1x', TO_DATE('20-07-2005', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (29, 'RU', 'Vorobiev', 'Boris', 'magixx', TO_DATE('03-06-2003', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (30, 'PL', 'Szkaradek', 'Kamil', 'siuhy', TO_DATE('26-08-2002', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (31, 'HU', 'Torzsas', 'Adam', 'torzsi', TO_DATE('17-06-2002', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (32, 'IL', 'Berman', 'Dorian', 'xertioN', TO_DATE('25-07-2004', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (33, 'FI', 'Salo', 'Jimi', 'Jimpphat', TO_DATE('09-09-2006', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (34, 'SE', 'Brolin', 'Ludvig', 'Brollan', TO_DATE('17-06-2002', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (35, 'RU', 'Ali', 'Dzhami', 'Jame', TO_DATE('23-08-1998', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (36, 'RU', 'Lebedev', 'Evgenii', 'FL1T', TO_DATE('24-02-2001', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (37, 'DK', 'Staehr', 'Victor', 'Staehr', TO_DATE('13-06-2004', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (38, 'CA', 'Markovic', 'Keith', 'NAF', TO_DATE('24-11-1997', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (39, 'LV', 'Galinskis', 'Mareks', 'YEKINDAR', TO_DATE('04-10-1999', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (40, 'BR', 'Cerato', 'Kaike', 'KSCERATO', TO_DATE('12-09-1999', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (41, 'BR', 'Santos', 'Yuri', 'yuurih', TO_DATE('22-12-1999', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (42, 'LT', 'Lekavicius', 'Justinas', 'jL', TO_DATE('29-09-1999', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (43, 'SE', 'Kajbjer', 'Olof', 'olofmeister', TO_DATE('31-01-1992', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (44, 'SK', 'Kovacs', 'Ladislav', 'GuardiaN', TO_DATE('09-07-1991', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (45, 'SE', 'Lindberg', 'Patrik', 'f0rest', TO_DATE('10-06-1988', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (46, 'SE', 'Alesund', 'Christopher', 'GeT_RiGhT', TO_DATE('29-05-1990', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (47, 'FR', 'Schrub', 'Kenny', 'KennyS', TO_DATE('19-05-1995', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (48, 'RO', 'Stanescu', 'Catalin-Ionut', 'BTN', TO_DATE('24-05-1989', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (49, 'PL', 'Jarzabkowski', 'Jaroslaw', 'pashaBiceps', TO_DATE('11-04-1988', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (50, 'SK', 'Styk', 'Martin', 'STYKO', TO_DATE('23-02-1996', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (51, 'GB', 'Merriman', 'William', 'mezii', TO_DATE('15-08-1998', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (52, 'PL', 'Kubski', 'Filip', 'NEO', TO_DATE('15-06-1987', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (53, 'FR', 'Quoniam', 'Remy', 'XTQZZZ', TO_DATE('21-12-1988', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (54, 'BR', 'Prado', 'Wilton', 'zews', TO_DATE('05-11-1987', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (55, 'CA', 'Steele', 'Damian', 'daps', TO_DATE('29-07-1993', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (56, 'DK', 'Nielsen', 'Dennis', 'sycrone', TO_DATE('11-04-1996', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (57, 'FI', 'Saha', 'Eetu', 'sAw', TO_DATE('28-09-1992', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (58, 'PL', 'Gurczynski', 'Jakub', 'kuben', TO_DATE('13-06-1988', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (59, 'GB', 'Battye', 'Ashley', 'ash', TO_DATE('06-08-1991', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (60, 'GB', 'Hall', 'Jamie', 'keita', TO_DATE('30-10-1993', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (61, 'DK', 'Vestergaard', 'Torbjorn', 'mithR', TO_DATE('26-06-1989', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (62, 'DE', 'Altenburg', 'Jan', 'Swani', TO_DATE('28-01-1995', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (63, 'FR', 'Benouwa', 'Damien', 'maLeK', TO_DATE('21-02-1986', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (64, 'SE', 'Harysson', 'Daniel', 'djL', TO_DATE('14-02-1994', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (65, 'SE', 'Landstrom', 'Richard', 'Xizt', TO_DATE('22-02-1991', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (66, 'US', 'Hoag', 'Eric', 'adreN', TO_DATE('26-05-1990', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (67, 'SE', 'Johansson', 'Freddy', 'KRIMZ', TO_DATE('25-04-1994', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (68, 'DK', 'Rasmussen', 'Peter', 'dupreeh', TO_DATE('26-03-1993', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (69, 'DK', 'Reif', 'Emil', 'Magisk', TO_DATE('05-03-1998', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (70, 'DK', 'Rossander', 'Lukas', 'gla1ve', TO_DATE('07-06-1995', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (71, 'RU', 'Sharipov', 'Denis', 'electronic', TO_DATE('02-09-1998', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (72, 'RU', 'Zalutskiy', 'Ilya', 'Perfecto', TO_DATE('24-11-1999', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (73, 'DK', 'Moller', 'Casper', 'cadian', TO_DATE('26-06-1995', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (74, 'DK', 'Nygaard', 'Jakob', 'jabbi', TO_DATE('31-07-2003', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (75, 'DK', 'Lund', 'Martin', 'stavn', TO_DATE('26-03-2002', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (76, 'TR', 'Dortkardes', 'Ismailcan', 'XANTARES', TO_DATE('07-08-1995', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (77, 'TR', 'Eker', 'Ozgur', 'woxic', TO_DATE('02-09-1998', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (78, 'DE', 'Wodarz', 'Johannes', 'tabseN', TO_DATE('05-04-1995', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (79, 'KZ', 'Khassenov', 'Abay', 'Hobbit', TO_DATE('18-05-1994', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (80, 'RU', 'Rykhtorov', 'Sergey', 'Ax1Le', TO_DATE('04-04-2002', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (81, 'BR', 'David', 'Marcelo', 'coldzera', TO_DATE('31-10-1994', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (82, 'US', 'Yip', 'Jacky', 'Stewie2K', TO_DATE('07-01-1998', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (83, 'AU', 'Savage', 'Justin', 'jks', TO_DATE('12-12-1995', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (84, 'UA', 'Zhdanov', 'Ihor', 'w0nderful', TO_DATE('14-12-2004', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (85, 'GT', 'Samayoa', 'Mario', 'malbsMd', TO_DATE('19-12-2002', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (86, 'MN', 'Banzragch', 'Usukhbayar', '910', TO_DATE('10-09-2002', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (87, 'IL', 'Iluz', 'Guy', 'NertZ', TO_DATE('12-07-1999', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (88, 'ES', 'Garcia', 'Alvaro', 'SunPayus', TO_DATE('19-11-1998', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (89, 'ME', 'Boskovic', 'Pavle', 'Maden', TO_DATE('04-11-1998', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (90, 'RS', 'Isakovic', 'Nemanja', 'nexa', TO_DATE('25-04-1997', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (91, 'FR', 'Papillon', 'Richard', 'shox', TO_DATE('27-05-1992', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (92, 'SE', 'Wecksell', 'Jesper', 'JW', TO_DATE('23-02-1995', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (93, 'SE', 'Ronnquist', 'Robin', 'flusha', TO_DATE('12-08-1993', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (94, 'NO', 'Tiller', 'Hakon', 'hallzerk', TO_DATE('14-07-2000', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (95, 'US', 'Kemble', 'Ricky', 'floppy', TO_DATE('12-01-2000', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (96, 'US', 'Cannella', 'Nick', 'nitr0', TO_DATE('16-08-1995', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (97, 'NO', 'Grundtvig', 'Preben', 'jkaem', TO_DATE('27-02-1994', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (98, 'BR', 'de Melo', 'Epitacio', 'TACO', TO_DATE('24-01-1995', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (99, 'BR', 'Alvarenga', 'Fernando', 'fer', TO_DATE('30-10-1991', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (100, 'BR', 'Lau', 'Lincoln', 'fnx', TO_DATE('30-01-1990', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (101, 'SK', 'Cernansky', 'David', 'frozen', TO_DATE('18-07-2002', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (102, 'DK', 'Pfeiffer', 'Marco', 'Snappi', TO_DATE('09-06-1990', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (103, 'DK', 'Beck', 'Rasmus', 'sjuush', TO_DATE('30-01-1999', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (104, 'DK', 'Madsen', 'Rene', 'TeSeS', TO_DATE('02-02-2001', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (105, 'RU', 'Gasanov', 'Abdul', 'degster', TO_DATE('16-07-2001', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (106, 'MK', 'Stoilkovski', 'Damjan', 'kyxsan', TO_DATE('20-05-2000', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (107, 'DE', 'Rische', 'Florian', 'syrsoN', TO_DATE('19-04-1996', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (108, 'DE', 'Moussa', 'Karim', 'Krimbo', TO_DATE('02-10-2002', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (109, 'TR', 'Kupeli', 'Engin', 'MAJ3R', TO_DATE('25-01-1991', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (110, 'TR', 'Yalcin', 'Ali Haydar', 'Wicadia', TO_DATE('12-03-2005', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (111, 'US', 'Wince', 'Michael', 'Grim', TO_DATE('10-11-2000', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (112, 'RU', 'Bolyshev', 'Petr', 'fame', TO_DATE('13-05-2003', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (113, 'RU', 'Danielyan', 'David', 'n0rb3r7', TO_DATE('21-03-2001', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (114, 'MN', 'Byambasuren', 'Garidmagnai', 'bLitz', TO_DATE('05-06-2001', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (115, 'MN', 'Munkhbold', 'Sodbayar', 'Techno4K', TO_DATE('15-05-2005', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (116, 'MN', 'Batbold', 'Ayush', 'mzinho', TO_DATE('25-08-2007', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (117, 'MN', 'Munkhbold', 'Azbayar', 'Senzu', TO_DATE('11-09-2006', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (118, 'BR', 'Cespedes', 'Marcelo', 'chelo', TO_DATE('08-06-1998', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (119, 'BR', 'Medeiros', 'Felipe', 'skullz', TO_DATE('24-04-2002', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (120, 'PL', 'Tomkowiak', 'Roland', 'ultimate', TO_DATE('20-12-2003', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (121, 'FR', 'Schmitt', 'Nathan', 'NBK-', TO_DATE('05-06-1994', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (122, 'FR', 'Guipouy', 'Cedric', 'RpK', TO_DATE('12-08-1989', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (123, 'BE', 'Benrlitom', 'Adil', 'ScreaM', TO_DATE('02-07-1994', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (124, 'SE', 'Friberg', 'Adam', 'friberg', TO_DATE('19-10-1991', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (125, 'UA', 'Sukhariev', 'Ioann', 'Edward', TO_DATE('28-12-1987', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (126, 'RU', 'Stolyarov', 'Mihail', 'Dosia', TO_DATE('19-06-1988', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (127, 'KZ', 'Kystaubayev', 'Dauren', 'AdreN', TO_DATE('04-02-1990', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (128, 'KZ', 'Golubev', 'Alexey', 'Qikert', TO_DATE('01-01-1999', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (129, 'UA', 'Orudzhev', 'Viktor', 'sdy', TO_DATE('14-03-1997', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (130, 'UA', 'Veletniuk', 'Volodymyr', 'Woro2k', TO_DATE('09-01-2002', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (131, 'RU', 'Mikhaylov', 'Kirill', 'Boombl4', TO_DATE('20-12-1998', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (132, 'SE', 'Sterner', 'Fredrik', 'REZ', TO_DATE('11-01-1998', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (133, 'SE', 'Poser', 'Hampus', 'hampus', TO_DATE('26-11-1998', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (134, 'SE', 'Jonasson', 'Tim', 'nawwk', TO_DATE('24-10-1997', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (135, 'US', 'Ta', 'Timothy', 'autimatic', TO_DATE('10-09-1996', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (136, 'US', 'Cayonte', 'Vincent', 'Brehze', TO_DATE('22-05-1998', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (137, 'BR', 'Piovezan', 'Andrei', 'arT', TO_DATE('27-03-1996', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (138, 'BR', 'Figueiredo', 'Vinicius', 'VINI', TO_DATE('14-06-1999', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (139, 'BR', 'Prass', 'Ricardo', 'boltz', TO_DATE('10-04-1997', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (140, 'BR', 'Teles', 'Henrique', 'HEN1', TO_DATE('14-07-1995', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (141, 'BR', 'Teles', 'Lucas', 'LUCAS1', TO_DATE('14-07-1995', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (142, 'PL', 'Miskiewicz', 'Olek', 'hades', TO_DATE('01-01-2000', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (143, 'PL', 'Walukiewicz', 'Kacper', 'Kylar', TO_DATE('13-09-1999', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (144, 'PL', 'Gorski', 'Krzysztof', 'Goofy', TO_DATE('31-08-2001', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (145, 'CH', 'Gashi', 'Rigon', 'rigoN', TO_DATE('24-08-1999', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (146, 'XK', 'Budeci', 'Dionis', 'sinnopsyy', TO_DATE('28-11-1997', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (147, 'AU', 'Nong', 'Christopher', 'dexter', TO_DATE('15-08-1994', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (148, 'AU', 'Potter', 'Joshua', 'INS', TO_DATE('22-09-1998', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (149, 'AU', 'Tregillgas', 'Jay', 'Liazz', TO_DATE('23-09-1997', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (150, 'DK', 'Nielsen', 'Rasmus', 'HooXi', TO_DATE('21-05-1995', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (151, 'DK', 'Ali', 'Ismail', 'refrezh', TO_DATE('19-02-1998', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (152, 'DE', 'Baumann', 'Josef', 'faveN', TO_DATE('11-02-2000', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (153, 'DE', 'Gruhne', 'Nils', 'k1to', TO_DATE('28-11-1998', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (154, 'DE', 'Feldbusch', 'Tizian', 'tiziaN', TO_DATE('15-06-1996', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (155, 'RU', 'Mekhryakov', 'Andrey', 'Jerry', TO_DATE('12-06-1998', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (156, 'RU', 'Zagodyrenko', 'Aleksandr', 'zorte', TO_DATE('04-02-1998', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (157, 'RU', 'Anashkin', 'Aleksandr', 'KaiR0N-', TO_DATE('31-01-2004', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (158, 'RU', 'Frolov', 'Evgeny', 'r3salt', TO_DATE('18-05-2005', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (159, 'RU', 'Kharitonov', 'Artem', 'ArtFr0st', TO_DATE('10-10-2002', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (160, 'US', 'Ohm', 'Joshua', 'oSee', TO_DATE('19-06-1999', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (161, 'US', 'Wierzba', 'Will', 'RUSH', TO_DATE('12-04-1994', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (162, 'CA', 'Jarguz', 'Peter', 'stanislaw', TO_DATE('29-04-1994', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (163, 'BR', 'Bittencourt', 'Rodrigo', 'biguzera', TO_DATE('24-02-1997', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (164, 'CL', 'Tapia', 'David', 'dav1deus', TO_DATE('28-08-2000', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (165, 'UY', 'Garcia', 'Franco', 'dgt', TO_DATE('20-05-2001', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (166, 'UY', 'Gonzalez', 'Maximiliano', 'max', TO_DATE('03-08-1999', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (167, 'SE', 'Dahlstrom', 'Robert', 'RobbaN', TO_DATE('05-01-1985', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (168, 'RS', 'Trifunovic', 'Aleksandar', 'kassad', TO_DATE('26-09-1986', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (169, 'RS', 'Paunovic', 'Janko', 'YNk', TO_DATE('23-07-1992', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (170, 'CH', 'Quiquerez', 'Mathieu', 'Maniac', TO_DATE('29-06-1990', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (171, 'RO', 'Stefan', 'Alexandru', 's0und', TO_DATE('24-09-2002', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (172, 'RO', 'Gligor', 'Raul', 'Blytz', TO_DATE('01-01-2001', 'DD-MM-YYYY'));
INSERT INTO membri (id_membru, id_tara, nume, prenume, nickname, data_nastere) VALUES (173, 'RO', 'Musuroiu', 'David', 'fnl', TO_DATE('20-12-2005', 'DD-MM-YYYY'));
COMMIT;


REM inseram date in tabelul JUCATORI
PROMPT *** populating JUCATORI table

INSERT INTO jucatori VALUES (1, 'AWP', '1280x960', 3.09, 400);
INSERT INTO jucatori VALUES (2, 'RFL', '1280x960', 1.40, 800);
INSERT INTO jucatori VALUES (3, 'AWP', '1280x960', 2.00, 400);
INSERT INTO jucatori VALUES (4, 'ENT', '1280x960', 1.35, 400);
INSERT INTO jucatori VALUES (5, 'IGL', '1024x768', 1.30, 400);
INSERT INTO jucatori VALUES (6, 'AWP', '1280x960', 2.30, 400);
INSERT INTO jucatori VALUES (7, 'ENT', '1280x960', 2.50, 800);
INSERT INTO jucatori VALUES (8, 'RFL', '1280x960', 1.65, 400);
INSERT INTO jucatori VALUES (9, 'LRK', '1920x1080', 1.77, 400);
INSERT INTO jucatori VALUES (10, 'AWP', '1280x960', 1.90, 400);
INSERT INTO jucatori VALUES (11, 'ANC', '1280x960', 1.42, 400);
INSERT INTO jucatori VALUES (12, 'IGL', '1024x768', 0.95, 800);
INSERT INTO jucatori VALUES (13, 'RFL', '1920x1080', 1.00, 400);
INSERT INTO jucatori VALUES (15, 'AWP', '1024x768', 2.20, 400);
INSERT INTO jucatori VALUES (16, 'ENT', '1680x1050', 0.74, 1600);
INSERT INTO jucatori VALUES (17, 'AWP', '1280x960', 1.90, 400);
INSERT INTO jucatori VALUES (18, 'SUP', '1280x960', 1.70, 400);
INSERT INTO jucatori VALUES (19, 'LRK', '1280x960', 1.40, 800);
INSERT INTO jucatori VALUES (20, 'AWP', '1280x960', 2.10, 400);
INSERT INTO jucatori VALUES (21, 'IGL', '1024x768', 1.91, 400);
INSERT INTO jucatori VALUES (22, 'ENT', '1280x960', 1.66, 400);
INSERT INTO jucatori VALUES (23, 'LRK', '1280x960', 1.46, 400);
INSERT INTO jucatori VALUES (24, 'IGL', '1280x960', 1.80, 400);
INSERT INTO jucatori VALUES (26, 'IGL', '1280x960', 1.50, 400);
INSERT INTO jucatori VALUES (27, 'AWP', '1024x768', 1.73, 400);
INSERT INTO jucatori VALUES (28, 'ANC', '1280x960', 1.60, 400);
INSERT INTO jucatori VALUES (29, 'SUP', '1280x960', 1.80, 800);
INSERT INTO jucatori VALUES (30, 'IGL', '1280x960', 1.60, 400);
INSERT INTO jucatori VALUES (31, 'AWP', '1024x768', 2.20, 400);
INSERT INTO jucatori VALUES (32, 'ENT', '1280x960', 1.20, 800);
INSERT INTO jucatori VALUES (33, 'ANC', '1280x960', 1.45, 400);
INSERT INTO jucatori VALUES (34, 'LRK', '1280x960', 2.10, 400);
INSERT INTO jucatori VALUES (35, 'AWP', '1920x1080', 1.50, 800);
INSERT INTO jucatori VALUES (36, 'RFL', '1280x960', 1.40, 800);
INSERT INTO jucatori VALUES (37, 'SUP', '1280x960', 1.70, 400);
INSERT INTO jucatori VALUES (38, 'RFL', '1024x768', 0.85, 800);
INSERT INTO jucatori VALUES (39, 'ENT', '1280x960', 1.18, 800);
INSERT INTO jucatori VALUES (40, 'RFL', '1280x960', 2.30, 400);
INSERT INTO jucatori VALUES (41, 'SUP', '1920x1080', 1.50, 400);
INSERT INTO jucatori VALUES (42, 'ANC', '1280x960', 2.40, 400);
INSERT INTO jucatori VALUES (43, 'LRK', '1024x768', 1.70, 400);
INSERT INTO jucatori VALUES (44, 'AWP', '800x600', 1.30, 400);
INSERT INTO jucatori VALUES (45, 'RFL', '1280x960', 3.50, 400);
INSERT INTO jucatori VALUES (46, 'LRK', '1280x960', 2.90, 400);
INSERT INTO jucatori VALUES (47, 'AWP', '1024x768', 2.20, 400);
INSERT INTO jucatori VALUES (48, 'IGL', '1280x960', 2.30, 400);
INSERT INTO jucatori VALUES (49, 'RFL', '1920x1080', 1.90, 400);
INSERT INTO jucatori VALUES (50, 'SUP', '1920x1080', 1.80, 400);
INSERT INTO jucatori VALUES (67, 'SUP', '1280x960', 1.3, 400);
INSERT INTO jucatori VALUES (68, 'ENT', '1280x960', 1.8, 400);
INSERT INTO jucatori VALUES (69, 'RFL', '1280x960', 1.0, 800);
INSERT INTO jucatori VALUES (70, 'IGL', '1280x960', 1.2, 400);
INSERT INTO jucatori VALUES (71, 'RFL', '1920x1080', 2.2, 400);
INSERT INTO jucatori VALUES (72, 'SUP', '1280x960', 1.35, 800);
INSERT INTO jucatori VALUES (73, 'AWP', '1280x960', 1.1, 800);
INSERT INTO jucatori VALUES (74, 'RFL', '1920x1080', 0.8, 800);
INSERT INTO jucatori VALUES (75, 'RFL', '1280x960', 1.9, 400);
INSERT INTO jucatori VALUES (76, 'ENT', '1024x768', 2.0, 400);
INSERT INTO jucatori VALUES (77, 'AWP', '1280x960', 1.5, 1600);
INSERT INTO jucatori VALUES (78, 'IGL', '1920x1080', 1.4, 400);
INSERT INTO jucatori VALUES (79, 'RFL', '1280x960', 1.1, 400);
INSERT INTO jucatori VALUES (80, 'ENT', '1280x960', 1.5, 800);
INSERT INTO jucatori VALUES (81, 'RFL', '1280x960', 1.1, 800);
INSERT INTO jucatori VALUES (82, 'ENT', '1024x768', 1.8, 400);
INSERT INTO jucatori VALUES (83, 'RFL', '1920x1080', 1.9, 400);
INSERT INTO jucatori VALUES (84, 'AWP', '1280x960', 3.09, 400);
INSERT INTO jucatori VALUES (85, 'ENT', '1280x960', 1.1, 800);
INSERT INTO jucatori VALUES (86, 'AWP', '1280x960', 1.2, 800);
INSERT INTO jucatori VALUES (87, 'RFL', '1280x960', 1.3, 400);
INSERT INTO jucatori VALUES (88, 'AWP', '1280x960', 1.0, 800);
INSERT INTO jucatori VALUES (89, 'ENT', '1280x960', 1.4, 400);
INSERT INTO jucatori VALUES (90, 'IGL', '1280x960', 2.1, 400);
INSERT INTO jucatori VALUES (91, 'RFL', '1024x768', 2.25, 400);
INSERT INTO jucatori VALUES (92, 'AWP', '1280x960', 1.9, 400);
INSERT INTO jucatori VALUES (93, 'RFL', '1280x960', 1.7, 400);
INSERT INTO jucatori VALUES (94, 'AWP', '1280x960', 1.5, 400);
INSERT INTO jucatori VALUES (95, 'RFL', '1024x768', 1.2, 800);
INSERT INTO jucatori VALUES (96, 'IGL', '1280x960', 1.3, 400);
INSERT INTO jucatori VALUES (97, 'ENT', '1920x1080', 0.9, 800);
INSERT INTO jucatori VALUES (98, 'SUP', '1280x960', 1.4, 400);
INSERT INTO jucatori VALUES (99, 'ENT', '1280x960', 2.5, 400);
INSERT INTO jucatori VALUES (100, 'RFL', '1280x960', 1.6, 400);
INSERT INTO jucatori VALUES (101, 'RFL', '1280x960', 1.1, 800);
INSERT INTO jucatori VALUES (102, 'IGL', '1280x960', 1.3, 800);
INSERT INTO jucatori VALUES (103, 'SUP', '1920x1080', 1.2, 400);
INSERT INTO jucatori VALUES (104, 'ENT', '1280x960', 1.5, 400);
INSERT INTO jucatori VALUES (105, 'AWP', '1280x960', 1.8, 400);
INSERT INTO jucatori VALUES (106, 'IGL', '1280x960', 1.0, 800);
INSERT INTO jucatori VALUES (107, 'AWP', '1024x768', 1.0, 800);
INSERT INTO jucatori VALUES (108, 'SUP', '1280x960', 1.3, 400);
INSERT INTO jucatori VALUES (109, 'IGL', '1280x960', 1.2, 800);
INSERT INTO jucatori VALUES (110, 'ENT', '1280x960', 1.4, 800);
INSERT INTO jucatori VALUES (111, 'RFL', '1920x1080', 0.8, 1600);
INSERT INTO jucatori VALUES (112, 'RFL', '1280x960', 1.15, 800);
INSERT INTO jucatori VALUES (113, 'RFL', '1280x960', 1.3, 400);
INSERT INTO jucatori VALUES (114, 'IGL', '1280x960', 1.2, 400);
INSERT INTO jucatori VALUES (115, 'RFL', '1280x960', 1.5, 400);
INSERT INTO jucatori VALUES (116, 'RFL', '1280x960', 1.1, 800);
INSERT INTO jucatori VALUES (117, 'ENT', '1280x960', 1.6, 400);
INSERT INTO jucatori VALUES (118, 'ENT', '1280x960', 1.4, 800);
INSERT INTO jucatori VALUES (119, 'RFL', '1280x960', 1.1, 800);
INSERT INTO jucatori VALUES (120, 'AWP', '1280x960', 1.0, 800);
INSERT INTO jucatori VALUES (121, 'SUP', '1280x960', 1.6, 400);
INSERT INTO jucatori VALUES (122, 'SUP', '1920x1080', 1.2, 400);
INSERT INTO jucatori VALUES (123, 'RFL', '1280x960', 2.5, 400);
INSERT INTO jucatori VALUES (124, 'ENT', '1280x960', 1.1, 800);
INSERT INTO jucatori VALUES (125, 'RFL', '1024x768', 1.9, 400);
INSERT INTO jucatori VALUES (126, 'SUP', '1280x960', 1.3, 400);
INSERT INTO jucatori VALUES (127, 'RFL', '1280x960', 1.2, 400);
INSERT INTO jucatori VALUES (128, 'SUP', '1280x960', 1.1, 800);
INSERT INTO jucatori VALUES (129, 'RFL', '1280x960', 1.35, 800);
INSERT INTO jucatori VALUES (130, 'AWP', '1280x960', 1.5, 400);
INSERT INTO jucatori VALUES (131, 'IGL', '1280x960', 1.45, 400);
INSERT INTO jucatori VALUES (132, 'RFL', '1280x960', 1.1, 800);
INSERT INTO jucatori VALUES (133, 'IGL', '1280x960', 1.3, 400);
INSERT INTO jucatori VALUES (134, 'AWP', '1280x960', 1.2, 800);
INSERT INTO jucatori VALUES (135, 'RFL', '1920x1080', 1.1, 400);
INSERT INTO jucatori VALUES (136, 'RFL', '1280x960', 1.5, 400);
INSERT INTO jucatori VALUES (137, 'ENT', '1280x960', 2.6, 400);
INSERT INTO jucatori VALUES (138, 'SUP', '1280x960', 1.2, 800);
INSERT INTO jucatori VALUES (139, 'RFL', '1280x960', 1.3, 400);
INSERT INTO jucatori VALUES (140, 'AWP', '1280x960', 2.1, 400);
INSERT INTO jucatori VALUES (141, 'SUP', '1280x960', 1.8, 400);
INSERT INTO jucatori VALUES (142, 'AWP', '1280x960', 1.4, 800);
INSERT INTO jucatori VALUES (143, 'RFL', '1280x960', 1.2, 800);
INSERT INTO jucatori VALUES (144, 'SUP', '1280x960', 1.1, 800);
INSERT INTO jucatori VALUES (145, 'ENT', '1280x960', 1.6, 400);
INSERT INTO jucatori VALUES (146, 'ENT', '1280x960', 1.5, 400);
INSERT INTO jucatori VALUES (147, 'IGL', '1280x960', 1.1, 800);
INSERT INTO jucatori VALUES (148, 'RFL', '1280x960', 1.2, 800);
INSERT INTO jucatori VALUES (149, 'SUP', '1280x960', 1.0, 800);
INSERT INTO jucatori VALUES (150, 'IGL', '1280x960', 0.9, 800);
INSERT INTO jucatori VALUES (151, 'RFL', '1920x1080', 1.3, 400);
INSERT INTO jucatori VALUES (152, 'RFL', '1280x960', 1.2, 800);
INSERT INTO jucatori VALUES (153, 'RFL', '1280x960', 1.4, 400);
INSERT INTO jucatori VALUES (154, 'SUP', '1280x960', 1.1, 800);
INSERT INTO jucatori VALUES (155, 'IGL', '1280x960', 1.5, 400);
INSERT INTO jucatori VALUES (156, 'AWP', '1280x960', 1.2, 800);
INSERT INTO jucatori VALUES (157, 'ENT', '1280x960', 1.6, 400);
INSERT INTO jucatori VALUES (158, 'RFL', '1280x960', 1.3, 800);
INSERT INTO jucatori VALUES (159, 'AWP', '1280x960', 1.1, 800);
INSERT INTO jucatori VALUES (160, 'AWP', '1280x960', 1.0, 800);
INSERT INTO jucatori VALUES (161, 'ENT', '1280x960', 1.4, 400);
INSERT INTO jucatori VALUES (162, 'IGL', '1920x1080', 1.2, 400);
INSERT INTO jucatori VALUES (163, 'IGL', '1280x960', 1.3, 400);
INSERT INTO jucatori VALUES (164, 'ENT', '1280x960', 1.5, 800);
INSERT INTO jucatori VALUES (165, 'RFL', '1280x960', 1.1, 800);
INSERT INTO jucatori VALUES (166, 'IGL', '1280x960', 1.2, 800);
INSERT INTO jucatori VALUES (171, 'ANC', '1280x960', 1.0, 800);
INSERT INTO jucatori VALUES (172, 'ENT', '1280x960', 1.6, 800);
INSERT INTO jucatori VALUES (173, 'SUP', '1920x1080', 1.2, 800);
COMMIT;


REM inseram date in tabelul ANTRENORI
PROMPT *** populating ANTRENORI table

INSERT INTO antrenori VALUES (13, 'tactical', 15);
INSERT INTO antrenori VALUES (14, 'motivational', 12);
INSERT INTO antrenori VALUES (25, 'motivational', 3);
INSERT INTO antrenori VALUES (51, 'tactical', 4);
INSERT INTO antrenori VALUES (52, 'strategic', 8);
INSERT INTO antrenori VALUES (53, 'motivational', 9);
INSERT INTO antrenori VALUES (54, 'strategic', 7);
INSERT INTO antrenori VALUES (55, 'analytical', 5);
INSERT INTO antrenori VALUES (56, 'tactical', 6);
INSERT INTO antrenori VALUES (57, 'disciplinarian', 10);
INSERT INTO antrenori VALUES (58, 'analytical', 5);
INSERT INTO antrenori VALUES (59, 'strategic', 6);
INSERT INTO antrenori VALUES (60, 'tactical', 7);
INSERT INTO antrenori VALUES (61, 'analytical', 4);
INSERT INTO antrenori VALUES (62, 'strategic', 8);
INSERT INTO antrenori VALUES (63, 'tactical', 5);
INSERT INTO antrenori VALUES (64, 'strategic', 3);
INSERT INTO antrenori VALUES (65, 'tactical', 8);
INSERT INTO antrenori VALUES (66, 'tactical', 4);
INSERT INTO antrenori VALUES (167, 'strategic', 10);
INSERT INTO antrenori VALUES (168, 'emotional', 8);
INSERT INTO antrenori VALUES (169, 'tactical', 6);
INSERT INTO antrenori VALUES (170, 'strategic', 5);
COMMIT;


REM inseram date in tabelul SPONSORIZARI
PROMPT *** populating SPONSORIZARI table

INSERT INTO sponsorizari (id_echipa, id_sponsor, data_inceput, data_sfarsit, suma_contract)
    VALUES ((SELECT id_echipa FROM echipe WHERE nume_echipa = 'Natus Vincere'), (SELECT id_sponsor FROM sponsori WHERE nume_sponsor = 'GG.BET'), TO_DATE('01-01-2021', 'DD-MM-YYYY'), NULL, 5000000);
INSERT INTO sponsorizari (id_echipa, id_sponsor, data_inceput, data_sfarsit, suma_contract)
VALUES ((SELECT id_echipa FROM echipe WHERE nume_echipa = 'Natus Vincere'), (SELECT id_sponsor FROM sponsori WHERE nume_sponsor = 'Logitech G'), TO_DATE('15-06-2020', 'DD-MM-YYYY'), NULL, 2000000);
INSERT INTO sponsorizari (id_echipa, id_sponsor, data_inceput, data_sfarsit, suma_contract)
VALUES ((SELECT id_echipa FROM echipe WHERE nume_echipa = 'FaZe Clan'), (SELECT id_sponsor FROM sponsori WHERE nume_sponsor = 'SteelSeries'), TO_DATE('01-03-2019', 'DD-MM-YYYY'), NULL, 2500000);
INSERT INTO sponsorizari (id_echipa, id_sponsor, data_inceput, data_sfarsit, suma_contract)
VALUES ((SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Spirit'), (SELECT id_sponsor FROM sponsori WHERE nume_sponsor = 'Red Bull'), TO_DATE('10-02-2024', 'DD-MM-YYYY'), NULL, 1200000);
INSERT INTO sponsorizari (id_echipa, id_sponsor, data_inceput, data_sfarsit, suma_contract)
VALUES ((SELECT id_echipa FROM echipe WHERE nume_echipa = 'G2 Esports'), (SELECT id_sponsor FROM sponsori WHERE nume_sponsor = 'Logitech G'), TO_DATE('01-01-2018', 'DD-MM-YYYY'), NULL, 3500000);
INSERT INTO sponsorizari (id_echipa, id_sponsor, data_inceput, data_sfarsit, suma_contract)
VALUES ((SELECT id_echipa FROM echipe WHERE nume_echipa = 'G2 Esports'), (SELECT id_sponsor FROM sponsori WHERE nume_sponsor = 'CS.MONEY'), TO_DATE('01-01-2020', 'DD-MM-YYYY'), TO_DATE('31-12-2022', 'DD-MM-YYYY'), 1000000);
INSERT INTO sponsorizari (id_echipa, id_sponsor, data_inceput, data_sfarsit, suma_contract)
VALUES ((SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Vitality'), (SELECT id_sponsor FROM sponsori WHERE nume_sponsor = 'GG.BET'), TO_DATE('01-01-2022', 'DD-MM-YYYY'), NULL, 4000000);
INSERT INTO sponsorizari (id_echipa, id_sponsor, data_inceput, data_sfarsit, suma_contract)
VALUES ((SELECT id_echipa FROM echipe WHERE nume_echipa = 'Astralis'), (SELECT id_sponsor FROM sponsori WHERE nume_sponsor = 'Logitech G'), TO_DATE('01-09-2021', 'DD-MM-YYYY'), NULL, 1800000);
INSERT INTO sponsorizari (id_echipa, id_sponsor, data_inceput, data_sfarsit, suma_contract)
VALUES ((SELECT id_echipa FROM echipe WHERE nume_echipa = 'Astralis'), (SELECT id_sponsor FROM sponsori WHERE nume_sponsor = 'HyperX'), TO_DATE('01-01-2017', 'DD-MM-YYYY'), TO_DATE('31-12-2020', 'DD-MM-YYYY'), 2000000);
INSERT INTO sponsorizari (id_echipa, id_sponsor, data_inceput, data_sfarsit, suma_contract)
VALUES ((SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Liquid'), (SELECT id_sponsor FROM sponsori WHERE nume_sponsor = 'Monster Energy'), TO_DATE('01-01-2016', 'DD-MM-YYYY'), NULL, 3000000);
INSERT INTO sponsorizari (id_echipa, id_sponsor, data_inceput, data_sfarsit, suma_contract)
VALUES ((SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Liquid'), (SELECT id_sponsor FROM sponsori WHERE nume_sponsor = 'Coinbase'), TO_DATE('13-04-2021', 'DD-MM-YYYY'), NULL, 4500000);
INSERT INTO sponsorizari (id_echipa, id_sponsor, data_inceput, data_sfarsit, suma_contract)
VALUES ((SELECT id_echipa FROM echipe WHERE nume_echipa = 'Cloud9'), (SELECT id_sponsor FROM sponsori WHERE nume_sponsor = 'Red Bull'), TO_DATE('20-07-2022', 'DD-MM-YYYY'), NULL, 2000000);
INSERT INTO sponsorizari (id_echipa, id_sponsor, data_inceput, data_sfarsit, suma_contract)
VALUES ((SELECT id_echipa FROM echipe WHERE nume_echipa = 'MOUZ'), (SELECT id_sponsor FROM sponsori WHERE nume_sponsor = 'Razer'), TO_DATE('05-05-2023', 'DD-MM-YYYY'), NULL, 900000);
INSERT INTO sponsorizari (id_echipa, id_sponsor, data_inceput, data_sfarsit, suma_contract)
VALUES ((SELECT id_echipa FROM echipe WHERE nume_echipa = 'Ninjas in Pyjamas'), (SELECT id_sponsor FROM sponsori WHERE nume_sponsor = 'Razer'), TO_DATE('01-01-2022', 'DD-MM-YYYY'), NULL, 1100000);
INSERT INTO sponsorizari (id_echipa, id_sponsor, data_inceput, data_sfarsit, suma_contract)
VALUES ((SELECT id_echipa FROM echipe WHERE nume_echipa = 'Ninjas in Pyjamas'), (SELECT id_sponsor FROM sponsori WHERE nume_sponsor = '1xBet'), TO_DATE('01-01-2018', 'DD-MM-YYYY'), TO_DATE('01-01-2021', 'DD-MM-YYYY'), 1500000);
INSERT INTO sponsorizari (id_echipa, id_sponsor, data_inceput, data_sfarsit, suma_contract)
VALUES ((SELECT id_echipa FROM echipe WHERE nume_echipa = 'FURIA Esports'), (SELECT id_sponsor FROM sponsori WHERE nume_sponsor = '1xBet'), TO_DATE('01-06-2021', 'DD-MM-YYYY'), NULL, 1800000);
INSERT INTO sponsorizari (id_echipa, id_sponsor, data_inceput, data_sfarsit, suma_contract)
VALUES ((SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Falcons'), (SELECT id_sponsor FROM sponsori WHERE nume_sponsor = 'DHL'), TO_DATE('01-01-2024', 'DD-MM-YYYY'), NULL, 8000000);
INSERT INTO sponsorizari (id_echipa, id_sponsor, data_inceput, data_sfarsit, suma_contract)
VALUES ((SELECT id_echipa FROM echipe WHERE nume_echipa = 'ENCE'), (SELECT id_sponsor FROM sponsori WHERE nume_sponsor = 'Logitech G'), TO_DATE('14-02-2019', 'DD-MM-YYYY'), NULL, 750000);
INSERT INTO sponsorizari (id_echipa, id_sponsor, data_inceput, data_sfarsit, suma_contract)
VALUES ((SELECT id_echipa FROM echipe WHERE nume_echipa = 'Fnatic'), (SELECT id_sponsor FROM sponsori WHERE nume_sponsor = 'AMD'), TO_DATE('01-01-2019', 'DD-MM-YYYY'), TO_DATE('01-01-2022', 'DD-MM-YYYY'), 1200000);
INSERT INTO sponsorizari (id_echipa, id_sponsor, data_inceput, data_sfarsit, suma_contract)
VALUES ((SELECT id_echipa FROM echipe WHERE nume_echipa = 'Nexus Esports'), (SELECT id_sponsor FROM sponsori WHERE nume_sponsor = 'Logitech G'), TO_DATE('01-01-2023', 'DD-MM-YYYY'), NULL, 150000);
COMMIT;


REM inseram date in tabelul ISTORIC_CONTRACTE
PROMPT *** populating ISTORIC_CONTRACTE table

INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 's1mple'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Natus Vincere'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 45000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'b1t'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Natus Vincere'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 20000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'iM'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Natus Vincere'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 25000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'jL'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Natus Vincere'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 22000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Aleksib'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Natus Vincere'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 30000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'B1ad3'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Natus Vincere'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 18000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'karrigan'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'FaZe Clan'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 35000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'rain'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'FaZe Clan'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 30000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'broky'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'FaZe Clan'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 25000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'ropz'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'FaZe Clan'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 38000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'NEO'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'FaZe Clan'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 15000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'NiKo'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'G2 Esports'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 50000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'm0NESY'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'G2 Esports'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 28000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'huNter'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'G2 Esports'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 35000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Snax'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'G2 Esports'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 20000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'TaZ'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'G2 Esports'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 15000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'ZywOo'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Vitality'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 55000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'apEX'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Vitality'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 32000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Spinx'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Vitality'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 27000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'flameZ'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Vitality'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 25000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'mezii'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Vitality'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 24000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'donk'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Spirit'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 20000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'chopper'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Spirit'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 18000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'sh1ro'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Spirit'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 30000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'siuhy'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'MOUZ'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 18000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'torzsi'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'MOUZ'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 15000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Jimpphat'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'MOUZ'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 12000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Twistzz'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Liquid'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 35000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'NAF'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Liquid'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 32000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'YEKINDAR'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Liquid'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 30000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'FalleN'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'FURIA Esports'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 30000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'KSCERATO'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'FURIA Esports'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 28000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'yuurih'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'FURIA Esports'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 28000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'zonic'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Falcons'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 40000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'NiKo'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'FaZe Clan'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 30000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Twistzz'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'FaZe Clan'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 30000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'karrigan'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'MOUZ'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 18000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'ropz'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'MOUZ'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 12000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Aleksib'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'G2 Esports'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 22000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'zonic'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Vitality'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 25000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'iM'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'GamerLegion'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 8000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'KennyS'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'G2 Esports'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 25000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'EliGE'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Liquid'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 28000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'FalleN'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Imperial Esports'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 15000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'device'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Astralis'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 30000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'device'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Ninjas in Pyjamas'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), TO_DATE('02-01-2002', 'DD-MM-YYYY'), 35000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'device'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Astralis'), TO_DATE('04-01-2002', 'DD-MM-YYYY'), NULL, 32000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'GuardiaN'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'FaZe Clan'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 20000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'olofmeister'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'FaZe Clan'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 22000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'KRIMZ'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'OG Esports'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 22000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'dupreeh'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Complexity'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 25000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'dupreeh'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Liquid'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 35000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Magisk'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Virtus.pro'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 30000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Magisk'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Liquid'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 38000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'gla1ve'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Complexity'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 28000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'gla1ve'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'BIG'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 20000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'electronic'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'FaZe Clan'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 32000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'electronic'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Eternal Fire'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 40000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Perfecto'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'FaZe Clan'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 20000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Perfecto'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Falcons'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 25000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'cadian'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'The MongolZ'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 27000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'cadian'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'FURIA Esports'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 35000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'jabbi'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'The MongolZ'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 15000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'jabbi'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Complexity'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 22000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'stavn'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'The MongolZ'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 22000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'stavn'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Complexity'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 28000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'XANTARES'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'GamerLegion'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 25000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'XANTARES'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Astralis'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 30000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'woxic'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'G2 Esports'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 18000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'woxic'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Astralis'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 20000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'tabseN'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'GamerLegion'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 25000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Hobbit'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Gambit Esports'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 15000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Hobbit'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Falcons'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 23000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Ax1Le'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Gambit Esports'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 12000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Ax1Le'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Falcons'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 28000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'coldzera'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Spirit'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 40000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'coldzera'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Sharks Esports'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 15000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Stewie2K'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'FURIA Esports'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 35000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Stewie2K'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'RED Canids'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 18000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'jks'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Vitality'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 25000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'jks'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'FURIA Esports'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 28000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'w0nderful'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'MOUZ'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 8000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'w0nderful'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'FaZe Clan'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 20000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'malbsMd'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Apeks'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 6000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'malbsMd'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Vitality'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 25000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = '910'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Cloud9'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 5000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'NertZ'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'BIG'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 15000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'NertZ'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'The MongolZ'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 22000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'SunPayus'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'BIG'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 18000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'SunPayus'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Liquid'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 35000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Maden'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'BIG'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 14000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Maden'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Liquid'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 30000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'nexa'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Imperial Esports'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 18000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'nexa'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Nexus Esports'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 15000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'shox'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Virtus.pro'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 26000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'JW'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'OG Esports'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 20000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'flusha'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'OG Esports'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 20000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'hallzerk'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'HEROIC'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 12000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'floppy'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Falcons'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 15000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'floppy'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'HEROIC'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 18000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'nitr0'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'FURIA Esports'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 30000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'nitr0'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Apeks'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 15000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'jkaem'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Ninjas in Pyjamas'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 14000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'jkaem'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Nexus Esports'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 20000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'TACO'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Titan'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 22000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'fer'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Titan'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 24000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'fer'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'paiN Gaming'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 15000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'fnx'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Titan'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 20000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'frozen'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'G2 Esports'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 16000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'frozen'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Spirit'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 28000);
-- VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Snappi'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'BIG'), TO_DATE('01-01-2015', 'DD-MM-YYYY'), TO_DATE('26-11-2023', 'DD-MM-YYYY'), 14000);
-- VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Snappi'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Liquid'), TO_DATE('28-11-2023', 'DD-MM-YYYY'), NULL, 32000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'sjuush'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'The MongolZ'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 18000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'TeSeS'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'The MongolZ'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 18500);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'degster'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Imperial Esports'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 15000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'degster'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'The MongolZ'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 21000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'kyxsan'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Ninjas in Pyjamas'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 8000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'kyxsan'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'The MongolZ'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 19000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'syrsoN'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'GamerLegion'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 17000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'syrsoN'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'GamerLegion'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 20000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Krimbo'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'GamerLegion'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 14000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'MAJ3R'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Astralis'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 12000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Wicadia'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Astralis'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 10000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Grim'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'FURIA Esports'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 18000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Grim'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'HEROIC'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 22000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'fame'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Eternal Fire'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 16000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'n0rb3r7'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Eternal Fire'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 16000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'bLitz'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Cloud9'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 6000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Techno4K'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Cloud9'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 6000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'mzinho'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Cloud9'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 4500);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Senzu'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Cloud9'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 4000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'chelo'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'paiN Gaming'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 13000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'chelo'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'ENCE'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 22000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'skullz'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'MIBR'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 10000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'skullz'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'ENCE'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 25000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'ultimate'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'FURIA Esports'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 20000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'NBK-'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Virtus.pro'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 25000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'NBK-'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Liquid'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), TO_DATE('02-01-2002', 'DD-MM-YYYY'), 18000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'RpK'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Virtus.pro'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 22000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'ScreaM'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Vitality'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 26000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'friberg'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Fnatic'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 20000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Edward'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'FaZe Clan'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 18000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Dosia'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Eternal Fire'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 10000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'AdreN'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Eternal Fire'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 10000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Qikert'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Eternal Fire'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 14000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'sdy'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'FaZe Clan'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 15000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'sdy'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'BetBoom Team'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), TO_DATE('02-01-2002', 'DD-MM-YYYY'), 12000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Woro2k'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'BetBoom Team'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 11000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Boombl4'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'FaZe Clan'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 21000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Boombl4'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Falcons'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 26000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'REZ'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Fnatic'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 23000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'hampus'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Fnatic'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 20000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'hampus'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Nexus Esports'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 18000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'nawwk'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Fnatic'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 12000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'nawwk'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'OG Esports'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 16000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'autimatic'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Falcons'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 24000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'autimatic'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Wildcard Gaming'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 15000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Brehze'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Wildcard Gaming'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 15000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'arT'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'ENCE'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 18000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'VINI'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'ENCE'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 17000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'VINI'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'paiN Gaming'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 16000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'boltz'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'AMKAL ESPORTS'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 25000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'boltz'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'paiN Gaming'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 15000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'HEN1'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'ENCE'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 20000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'HEN1'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'paiN Gaming'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 17000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'LUCAS1'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'ENCE'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 18000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'hades'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'BIG'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 12000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'hades'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'BIG'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 16000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Kylar'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'BIG'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 15000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Goofy'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'BIG'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 15000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'rigoN'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'GamerLegion'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 14000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'sinnopsyy'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'ECSTATIC'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 9000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'dexter'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'G2 Esports'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 22000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'dexter'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'OG Esports'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 20000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'INS'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Grayhound'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 11000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Liazz'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Grayhound'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 10000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'HooXi'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Preasy Esport'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 8000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'HooXi'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Vitality'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 23000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'refrezh'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'The MongolZ'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 17000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'refrezh'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'TYLOO'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 13000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'faveN'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'GamerLegion'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 19000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'faveN'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Nexus Esports'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 18000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'k1to'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'GamerLegion'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 16000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'k1to'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Imperial Esports'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 17500);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'tiziaN'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'GamerLegion'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 15000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Jerry'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Nemiga Gaming'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 14000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Jerry'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Metizport'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 13000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'zorte'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Nemiga Gaming'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 12000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'zorte'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'SAW'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 18000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'KaiR0N-'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Eternal Fire'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 10000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'KaiR0N-'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'SAW'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 15000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'r3salt'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Nemiga Gaming'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 8000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'r3salt'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'FORZE Esports'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 11000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'ArtFr0st'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'MOUZ'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 7000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'ArtFr0st'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Metizport'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 10000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'oSee'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'FURIA Esports'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 20000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'oSee'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Wildcard Gaming'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 18000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'RUSH'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'HEROIC'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 24000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'RUSH'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Legacy'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 12000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'stanislaw'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'HEROIC'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 22000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'stanislaw'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Nouns Esports'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 14000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'biguzera'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'MIBR'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 16000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'dav1deus'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Aurora Gaming'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 13000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'dgt'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Aurora Gaming'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 14000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'max'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Aurora Gaming'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 14000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'RobbaN'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Spirit'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 18000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'kassad'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Falcons'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 15000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'kassad'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Nexus Esports'), TO_DATE('02-01-2001', 'DD-MM-YYYY'), NULL, 17000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'YNk'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Spirit'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 16000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Maniac'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Team Envy'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), TO_DATE('31-12-2000', 'DD-MM-YYYY'), 5000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 's0und'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Nexus Esports'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 7500);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'Blytz'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Nexus Esports'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 5000);
INSERT INTO istoric_contracte (id_membru, id_echipa, data_inceput, data_sfarsit, salariu_lunar)
VALUES ((SELECT id_membru FROM membri WHERE nickname = 'fnl'), (SELECT id_echipa FROM echipe WHERE nume_echipa = 'Nexus Esports'), TO_DATE('01-01-2000', 'DD-MM-YYYY'), NULL, 4000);
COMMIT;


REM inseram date in tabelul MECIURI
PROMPT *** populating MECIURI table

INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (1, 1, TO_DATE('31-03-2024 20:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Final');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (2, 1, TO_DATE('30-03-2024 17:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Semi-Final');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (3, 1, TO_DATE('30-03-2024 20:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Semi-Final');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (4, 1, TO_DATE('29-03-2024 14:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Quarter-Final');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (5, 1, TO_DATE('29-03-2024 17:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Quarter-Final');

INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (6, 2, TO_DATE('22-05-2022 19:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Final');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (7, 2, TO_DATE('14-05-2022 12:00', 'DD-MM-YYYY HH24:MI'), 'BO1', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (8, 2, TO_DATE('14-05-2022 13:30', 'DD-MM-YYYY HH24:MI'), 'BO1', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (9, 6, TO_DATE('11-02-2024 17:00', 'DD-MM-YYYY HH24:MI'), 'BO5', 'Final');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (10, 6, TO_DATE('03-02-2024 14:30', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (11, 6, TO_DATE('04-02-2024 14:30', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (12, 7, TO_DATE('06-08-2023 16:00', 'DD-MM-YYYY HH24:MI'), 'BO5', 'Final');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (13, 7, TO_DATE('04-08-2023 15:30', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (14, 8, TO_DATE('12-05-2024 17:00', 'DD-MM-YYYY HH24:MI'), 'BO5', 'Final');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (15, 8, TO_DATE('23-04-2024 13:30', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (16, 8, TO_DATE('24-04-2024 13:30', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Final');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (17, 9, TO_DATE('02-06-2024 19:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Final');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (18, 16, TO_DATE('13-11-2022 19:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Final');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (19, 16, TO_DATE('05-11-2022 15:00', 'DD-MM-YYYY HH24:MI'), 'BO1', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (20, 20, TO_DATE('16-06-2024 15:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Final');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (21, 20, TO_DATE('15-06-2024 10:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (22, 25, TO_DATE('15-12-2024 17:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Final');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (23, 25, TO_DATE('14-12-2024 15:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (24, 27, TO_DATE('13-11-2023 18:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (25, 27, TO_DATE('12-11-2023 10:00', 'DD-MM-YYYY HH24:MI'), 'BO1', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (26, 29, TO_DATE('19-05-2024 20:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Final');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (27, 30, TO_DATE('10-12-2023 16:00', 'DD-MM-YYYY HH24:MI'), 'BO5', 'Final');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (28, 45, TO_DATE('23-09-2018 18:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Final');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (29, 45, TO_DATE('15-09-2018 14:00', 'DD-MM-YYYY HH24:MI'), 'BO1', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (30, 49, TO_DATE('20-03-2024 18:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (31, 39, TO_DATE('26-02-2024 19:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (32, 40, TO_DATE('03-03-2024 18:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (33, 33, TO_DATE('18-05-2024 17:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (34, 35, TO_DATE('10-12-2023 09:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (35, 10, TO_DATE('14-04-2024 12:30', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (36, 10, TO_DATE('12-04-2024 10:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (37, 5, TO_DATE('19-05-2024 18:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (38, 5, TO_DATE('18-05-2024 15:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (39, 47, TO_DATE('10-04-2024 20:00', 'DD-MM-YYYY HH24:MI'), 'BO1', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (40, 44, TO_DATE('20-11-2022 18:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (41, 28, TO_DATE('20-08-2023 13:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (42, 15, TO_DATE('23-04-2023 18:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (43, 14, TO_DATE('22-10-2023 10:30', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (44, 41, TO_DATE('23-05-2024 19:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (45, 12, TO_DATE('17-12-2023 20:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (46, 23, TO_DATE('21-05-2023 20:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (47, 3, TO_DATE('17-02-2024 15:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (48, 4, TO_DATE('22-02-2024 15:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (49, 6, TO_DATE('10-02-2024 15:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Semi-Final');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (50, 6, TO_DATE('10-02-2024 19:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Semi-Final');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (51, 1, TO_DATE('28-03-2024 14:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Quarter-Final');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (52, 1, TO_DATE('28-03-2024 17:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Quarter-Final');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (53, 6, TO_DATE('05-02-2024 16:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (54, 6, TO_DATE('06-02-2024 19:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Group Stage');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (55, 1, TO_DATE('28-03-2024 20:00', 'DD-MM-YYYY HH24:MI'), 'BO3', 'Quarter-Final');
INSERT INTO meciuri (id_meci, id_turneu, data_ora, format_meci, faza_turneu)
    VALUES (56, 1, TO_DATE('21-03-2024 14:00', 'DD-MM-YYYY HH24:MI'), 'BO1', 'Group Stage');


COMMIT;


REM inseram date in tabelul INSTANTE_MECI_HARTA
PROMPT *** populating INSTANTE_MECI_HARTA table

INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (1, 1, 1, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (2, 1, 4, 30);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (3, 1, 3, 40);

INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (4, 2, 8, 55);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (5, 2, 5, 35);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (6, 2, 1, 50);

INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (7, 3, 5, 40);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (8, 3, 9, 35);

INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (9, 4, 4, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (10, 4, 3, 45);

INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (11, 5, 3, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (12, 5, 9, 35);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (13, 5, 1, 50);

INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (14, 6, 3, 65);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (15, 6, 5, 50);

INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (16, 7, 4, 60);

INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (17, 8, 4, 40);

INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (18, 9, 5, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (19, 9, 4, 50);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (20, 9, 6, 35);

INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (21, 10, 1, 40);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (22, 10, 8, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (23, 10, 4, 35);

INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (24, 11, 3, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (25, 11, 1, 35);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (26, 12, 5, 60);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (27, 12, 4, 55);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (28, 12, 8, 50);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (29, 12, 1, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (30, 13, 3, 50);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (31, 13, 4, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (32, 14, 3, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (33, 14, 4, 40);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (34, 14, 5, 35);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (35, 15, 9, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (36, 15, 5, 50);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (37, 15, 4, 40);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (38, 16, 8, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (39, 16, 3, 40);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (40, 16, 9, 35);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (41, 17, 3, 65);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (42, 17, 1, 55);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (43, 17, 5, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (44, 18, 4, 50);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (45, 18, 6, 40);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (46, 19, 3, 55);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (47, 20, 3, 35);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (48, 20, 5, 40);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (49, 21, 8, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (50, 21, 6, 50);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (51, 21, 5, 40);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (52, 22, 6, 40);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (53, 22, 5, 55);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (54, 23, 4, 55);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (55, 23, 9, 50);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (56, 23, 8, 40);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (57, 26, 8, 40);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (58, 26, 3, 50);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (59, 26, 5, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (60, 27, 9, 40);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (61, 27, 1, 50);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (62, 27, 4, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (63, 28, 5, 35);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (64, 28, 6, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (65, 29, 3, 30);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (66, 30, 9, 40);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (67, 30, 2, 35);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (68, 31, 3, 50);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (69, 31, 6, 50);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (70, 31, 1, 40);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (71, 32, 4, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (72, 32, 8, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (73, 32, 1, 40);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (74, 33, 9, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (75, 33, 5, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (76, 34, 4, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (77, 34, 3, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (78, 34, 8, 50);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (79, 35, 6, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (80, 35, 5, 40);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (81, 36, 5, 40);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (82, 36, 1, 35);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (83, 36, 3, 50);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (84, 37, 1, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (85, 37, 8, 35);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (86, 37, 5, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (87, 38, 5, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (88, 38, 2, 50);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (89, 38, 4, 50);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (90, 39, 1, 35);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (91, 40, 4, 50);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (92, 40, 3, 50);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (93, 41, 4, 40);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (94, 41, 5, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (95, 42, 9, 60);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (96, 42, 3, 55);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (97, 43, 6, 50);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (98, 43, 5, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (99, 43, 1, 65);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (100, 44, 9, 40);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (101, 44, 4, 40);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (102, 44, 3, 50);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (103, 45, 6, 40);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (104, 45, 1, 40);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (105, 46, 5, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (106, 46, 9, 50);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (107, 46, 6, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (108, 47, 8, 35);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (109, 47, 5, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (110, 48, 4, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (111, 48, 3, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (112, 48, 8, 50);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (113, 49, 1, 40);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (114, 49, 3, 50);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (115, 50, 4, 35);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (116, 50, 5, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (117, 51, 8, 55);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (118, 51, 9, 30);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (119, 52, 2, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (120, 52, 6, 40);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (121, 53, 1, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (122, 53, 4, 35);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (123, 54, 5, 40);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (124, 54, 6, 50);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (125, 55, 8, 45);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (126, 55, 9, 55);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (127, 55, 3, 40);
INSERT INTO instante_meci_harta (id_instanta, id_meci, id_harta, durata_minute) VALUES (128, 56, 1, 35);


COMMIT;


REM inseram date in tabelul RUNDE
PROMPT *** populating RUNDE table

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100000, 1, 1, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100001, 1, 2, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100002, 1, 3, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100003, 1, 4, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100004, 1, 5, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100005, 1, 6, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100006, 1, 7, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100007, 1, 8, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100008, 1, 9, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100009, 1, 10, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100010, 1, 11, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100011, 1, 12, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100012, 1, 13, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100013, 1, 14, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100014, 1, 15, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100015, 1, 16, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100016, 1, 17, 'BET');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100017, 2, 1, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100018, 2, 2, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100019, 2, 3, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100020, 2, 4, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100021, 2, 5, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100022, 2, 6, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100023, 2, 7, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100024, 2, 8, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100025, 2, 9, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100026, 2, 10, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100027, 2, 11, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100028, 2, 12, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100029, 2, 13, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100030, 2, 14, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100031, 2, 15, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100032, 2, 16, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100033, 2, 17, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100034, 2, 18, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100035, 2, 19, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100036, 2, 20, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100037, 2, 21, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100038, 2, 22, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100039, 2, 23, 'BDCT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100040, 3, 1, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100041, 3, 2, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100042, 3, 3, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100043, 3, 4, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100044, 3, 5, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100045, 3, 6, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100046, 3, 7, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100047, 3, 8, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100048, 3, 9, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100049, 3, 10, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100050, 3, 11, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100051, 3, 12, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100052, 3, 13, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100053, 3, 14, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100054, 3, 15, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100055, 3, 16, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100056, 3, 17, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100057, 3, 18, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100058, 3, 19, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100059, 3, 20, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100060, 3, 21, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100061, 3, 22, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100062, 3, 23, 'ELT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100063, 4, 1, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100064, 4, 2, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100065, 4, 3, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100066, 4, 4, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100067, 4, 5, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100068, 4, 6, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100069, 4, 7, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100070, 4, 8, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100071, 4, 9, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100072, 4, 10, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100073, 4, 11, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100074, 4, 12, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100075, 4, 13, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100076, 4, 14, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100077, 4, 15, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100078, 4, 16, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100079, 4, 17, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100080, 4, 18, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100081, 4, 19, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100082, 4, 20, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100083, 4, 21, 'BET');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100084, 5, 1, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100085, 5, 2, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100086, 5, 3, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100087, 5, 4, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100088, 5, 5, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100089, 5, 6, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100090, 5, 7, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100091, 5, 8, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100092, 5, 9, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100093, 5, 10, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100094, 5, 11, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100095, 5, 12, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100096, 5, 13, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100097, 5, 14, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100098, 5, 15, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100099, 5, 16, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100100, 5, 17, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100101, 5, 18, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100102, 5, 19, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100103, 5, 20, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100104, 5, 21, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100105, 5, 22, 'BET');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100106, 6, 1, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100107, 6, 2, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100108, 6, 3, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100109, 6, 4, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100110, 6, 5, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100111, 6, 6, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100112, 6, 7, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100113, 6, 8, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100114, 6, 9, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100115, 6, 10, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100116, 6, 11, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100117, 6, 12, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100118, 6, 13, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100119, 6, 14, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100120, 6, 15, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100121, 6, 16, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100122, 6, 17, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100123, 6, 18, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100124, 6, 19, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100125, 6, 20, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100126, 6, 21, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100127, 6, 22, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100128, 6, 23, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100129, 6, 24, 'ELCT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100130, 7, 1, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100131, 7, 2, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100132, 7, 3, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100133, 7, 4, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100134, 7, 5, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100135, 7, 6, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100136, 7, 7, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100137, 7, 8, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100138, 7, 9, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100139, 7, 10, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100140, 7, 11, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100141, 7, 12, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100142, 7, 13, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100143, 7, 14, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100144, 7, 15, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100145, 7, 16, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100146, 7, 17, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100147, 7, 18, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100148, 7, 19, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100149, 7, 20, 'ELCT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100150, 8, 1, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100151, 8, 2, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100152, 8, 3, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100153, 8, 4, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100154, 8, 5, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100155, 8, 6, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100156, 8, 7, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100157, 8, 8, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100158, 8, 9, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100159, 8, 10, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100160, 8, 11, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100161, 8, 12, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100162, 8, 13, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100163, 8, 14, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100164, 8, 15, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100165, 8, 16, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100166, 8, 17, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100167, 8, 18, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100168, 8, 19, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100169, 8, 20, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100170, 8, 21, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100171, 8, 22, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100172, 8, 23, 'ELCT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100173, 9, 1, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100174, 9, 2, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100175, 9, 3, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100176, 9, 4, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100177, 9, 5, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100178, 9, 6, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100179, 9, 7, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100180, 9, 8, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100181, 9, 9, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100182, 9, 10, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100183, 9, 11, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100184, 9, 12, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100185, 9, 13, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100186, 9, 14, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100187, 9, 15, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100188, 9, 16, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100189, 9, 17, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100190, 9, 18, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100191, 9, 19, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100192, 9, 20, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100193, 9, 21, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100194, 9, 22, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100195, 9, 23, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100196, 9, 24, 'BDCT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100197, 10, 1, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100198, 10, 2, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100199, 10, 3, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100200, 10, 4, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100201, 10, 5, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100202, 10, 6, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100203, 10, 7, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100204, 10, 8, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100205, 10, 9, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100206, 10, 10, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100207, 10, 11, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100208, 10, 12, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100209, 10, 13, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100210, 10, 14, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100211, 10, 15, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100212, 10, 16, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100213, 10, 17, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100214, 10, 18, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100215, 10, 19, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100216, 10, 20, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100217, 10, 21, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100218, 10, 22, 'ELT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100219, 11, 1, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100220, 11, 2, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100221, 11, 3, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100222, 11, 4, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100223, 11, 5, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100224, 11, 6, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100225, 11, 7, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100226, 11, 8, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100227, 11, 9, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100228, 11, 10, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100229, 11, 11, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100230, 11, 12, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100231, 11, 13, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100232, 11, 14, 'ELT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100233, 12, 1, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100234, 12, 2, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100235, 12, 3, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100236, 12, 4, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100237, 12, 5, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100238, 12, 6, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100239, 12, 7, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100240, 12, 8, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100241, 12, 9, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100242, 12, 10, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100243, 12, 11, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100244, 12, 12, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100245, 12, 13, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100246, 12, 14, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100247, 12, 15, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100248, 12, 16, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100249, 12, 17, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100250, 12, 18, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100251, 12, 19, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100252, 12, 20, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100253, 12, 21, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100254, 12, 22, 'BET');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100255, 13, 1, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100256, 13, 2, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100257, 13, 3, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100258, 13, 4, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100259, 13, 5, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100260, 13, 6, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100261, 13, 7, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100262, 13, 8, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100263, 13, 9, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100264, 13, 10, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100265, 13, 11, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100266, 13, 12, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100267, 13, 13, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100268, 13, 14, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100269, 13, 15, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100270, 13, 16, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100271, 13, 17, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100272, 13, 18, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100273, 13, 19, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100274, 13, 20, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100275, 13, 21, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100276, 13, 22, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100277, 13, 23, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100278, 13, 24, 'BDCT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100279, 14, 1, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100280, 14, 2, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100281, 14, 3, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100282, 14, 4, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100283, 14, 5, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100284, 14, 6, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100285, 14, 7, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100286, 14, 8, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100287, 14, 9, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100288, 14, 10, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100289, 14, 11, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100290, 14, 12, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100291, 14, 13, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100292, 14, 14, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100293, 14, 15, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100294, 14, 16, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100295, 14, 17, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100296, 14, 18, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100297, 14, 19, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100298, 14, 20, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100299, 14, 21, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100300, 14, 22, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100301, 14, 23, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100302, 14, 24, 'BET');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100303, 15, 1, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100304, 15, 2, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100305, 15, 3, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100306, 15, 4, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100307, 15, 5, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100308, 15, 6, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100309, 15, 7, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100310, 15, 8, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100311, 15, 9, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100312, 15, 10, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100313, 15, 11, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100314, 15, 12, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100315, 15, 13, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100316, 15, 14, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100317, 15, 15, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100318, 15, 16, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100319, 15, 17, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100320, 15, 18, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100321, 15, 19, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100322, 15, 20, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100323, 15, 21, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100324, 15, 22, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100325, 15, 23, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100326, 15, 24, 'BET');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100327, 16, 1, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100328, 16, 2, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100329, 16, 3, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100330, 16, 4, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100331, 16, 5, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100332, 16, 6, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100333, 16, 7, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100334, 16, 8, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100335, 16, 9, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100336, 16, 10, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100337, 16, 11, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100338, 16, 12, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100339, 16, 13, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100340, 16, 14, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100341, 16, 15, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100342, 16, 16, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100343, 16, 17, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100344, 16, 18, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100345, 16, 19, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100346, 16, 20, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100347, 16, 21, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100348, 16, 22, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100349, 16, 23, 'ELT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100350, 17, 1, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100351, 17, 2, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100352, 17, 3, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100353, 17, 4, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100354, 17, 5, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100355, 17, 6, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100356, 17, 7, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100357, 17, 8, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100358, 17, 9, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100359, 17, 10, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100360, 17, 11, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100361, 17, 12, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100362, 17, 13, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100363, 17, 14, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100364, 17, 15, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100365, 17, 16, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100366, 17, 17, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100367, 17, 18, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100368, 17, 19, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100369, 17, 20, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100370, 17, 21, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100371, 17, 22, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100372, 17, 23, 'ELCT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100373, 18, 1, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100374, 18, 2, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100375, 18, 3, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100376, 18, 4, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100377, 18, 5, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100378, 18, 6, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100379, 18, 7, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100380, 18, 8, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100381, 18, 9, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100382, 18, 10, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100383, 18, 11, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100384, 18, 12, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100385, 18, 13, 'ELCT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100386, 19, 1, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100387, 19, 2, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100388, 19, 3, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100389, 19, 4, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100390, 19, 5, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100391, 19, 6, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100392, 19, 7, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100393, 19, 8, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100394, 19, 9, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100395, 19, 10, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100396, 19, 11, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100397, 19, 12, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100398, 19, 13, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100399, 19, 14, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100400, 19, 15, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100401, 19, 16, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100402, 19, 17, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100403, 19, 18, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100404, 19, 19, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100405, 19, 20, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100406, 19, 21, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100407, 19, 22, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100408, 19, 23, 'ELCT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100409, 20, 1, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100410, 20, 2, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100411, 20, 3, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100412, 20, 4, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100413, 20, 5, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100414, 20, 6, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100415, 20, 7, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100416, 20, 8, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100417, 20, 9, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100418, 20, 10, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100419, 20, 11, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100420, 20, 12, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100421, 20, 13, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100422, 20, 14, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100423, 20, 15, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100424, 20, 16, 'BET');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100425, 21, 1, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100426, 21, 2, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100427, 21, 3, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100428, 21, 4, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100429, 21, 5, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100430, 21, 6, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100431, 21, 7, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100432, 21, 8, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100433, 21, 9, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100434, 21, 10, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100435, 21, 11, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100436, 21, 12, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100437, 21, 13, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100438, 21, 14, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100439, 21, 15, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100440, 21, 16, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100441, 21, 17, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100442, 21, 18, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100443, 21, 19, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100444, 21, 20, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100445, 21, 21, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100446, 21, 22, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100447, 21, 23, 'ELT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100448, 22, 1, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100449, 22, 2, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100450, 22, 3, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100451, 22, 4, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100452, 22, 5, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100453, 22, 6, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100454, 22, 7, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100455, 22, 8, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100456, 22, 9, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100457, 22, 10, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100458, 22, 11, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100459, 22, 12, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100460, 22, 13, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100461, 22, 14, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100462, 22, 15, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100463, 22, 16, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100464, 22, 17, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100465, 22, 18, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100466, 22, 19, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100467, 22, 20, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100468, 22, 21, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100469, 22, 22, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100470, 22, 23, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100471, 22, 24, 'BET');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100472, 23, 1, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100473, 23, 2, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100474, 23, 3, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100475, 23, 4, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100476, 23, 5, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100477, 23, 6, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100478, 23, 7, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100479, 23, 8, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100480, 23, 9, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100481, 23, 10, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100482, 23, 11, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100483, 23, 12, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100484, 23, 13, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100485, 23, 14, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100486, 23, 15, 'BET');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100487, 24, 1, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100488, 24, 2, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100489, 24, 3, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100490, 24, 4, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100491, 24, 5, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100492, 24, 6, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100493, 24, 7, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100494, 24, 8, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100495, 24, 9, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100496, 24, 10, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100497, 24, 11, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100498, 24, 12, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100499, 24, 13, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100500, 24, 14, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100501, 24, 15, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100502, 24, 16, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100503, 24, 17, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100504, 24, 18, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100505, 24, 19, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100506, 24, 20, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100507, 24, 21, 'ELCT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100508, 25, 1, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100509, 25, 2, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100510, 25, 3, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100511, 25, 4, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100512, 25, 5, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100513, 25, 6, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100514, 25, 7, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100515, 25, 8, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100516, 25, 9, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100517, 25, 10, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100518, 25, 11, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100519, 25, 12, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100520, 25, 13, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100521, 25, 14, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100522, 25, 15, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100523, 25, 16, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100524, 25, 17, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100525, 25, 18, 'ELCT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100526, 26, 1, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100527, 26, 2, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100528, 26, 3, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100529, 26, 4, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100530, 26, 5, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100531, 26, 6, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100532, 26, 7, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100533, 26, 8, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100534, 26, 9, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100535, 26, 10, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100536, 26, 11, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100537, 26, 12, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100538, 26, 13, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100539, 26, 14, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100540, 26, 15, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100541, 26, 16, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100542, 26, 17, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100543, 26, 18, 'BET');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100544, 27, 1, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100545, 27, 2, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100546, 27, 3, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100547, 27, 4, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100548, 27, 5, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100549, 27, 6, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100550, 27, 7, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100551, 27, 8, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100552, 27, 9, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100553, 27, 10, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100554, 27, 11, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100555, 27, 12, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100556, 27, 13, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100557, 27, 14, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100558, 27, 15, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100559, 27, 16, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100560, 27, 17, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100561, 27, 18, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100562, 27, 19, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100563, 27, 20, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100564, 27, 21, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100565, 27, 22, 'BDCT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100566, 28, 1, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100567, 28, 2, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100568, 28, 3, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100569, 28, 4, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100570, 28, 5, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100571, 28, 6, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100572, 28, 7, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100573, 28, 8, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100574, 28, 9, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100575, 28, 10, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100576, 28, 11, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100577, 28, 12, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100578, 28, 13, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100579, 28, 14, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100580, 28, 15, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100581, 28, 16, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100582, 28, 17, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100583, 28, 18, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100584, 28, 19, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100585, 28, 20, 'BET');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100586, 29, 1, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100587, 29, 2, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100588, 29, 3, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100589, 29, 4, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100590, 29, 5, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100591, 29, 6, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100592, 29, 7, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100593, 29, 8, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100594, 29, 9, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100595, 29, 10, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100596, 29, 11, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100597, 29, 12, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100598, 29, 13, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100599, 29, 14, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100600, 29, 15, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100601, 29, 16, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100602, 29, 17, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100603, 29, 18, 'BDCT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100604, 30, 1, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100605, 30, 2, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100606, 30, 3, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100607, 30, 4, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100608, 30, 5, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100609, 30, 6, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100610, 30, 7, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100611, 30, 8, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100612, 30, 9, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100613, 30, 10, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100614, 30, 11, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100615, 30, 12, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100616, 30, 13, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100617, 30, 14, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100618, 30, 15, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100619, 30, 16, 'BET');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100620, 31, 1, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100621, 31, 2, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100622, 31, 3, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100623, 31, 4, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100624, 31, 5, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100625, 31, 6, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100626, 31, 7, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100627, 31, 8, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100628, 31, 9, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100629, 31, 10, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100630, 31, 11, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100631, 31, 12, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100632, 31, 13, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100633, 31, 14, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100634, 31, 15, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100635, 31, 16, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100636, 31, 17, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100637, 31, 18, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100638, 31, 19, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100639, 31, 20, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100640, 31, 21, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100641, 31, 22, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100642, 31, 23, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100643, 31, 24, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100644, 31, 25, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100645, 31, 26, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100646, 31, 27, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100647, 31, 28, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100648, 31, 29, 'ELT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100649, 32, 1, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100650, 32, 2, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100651, 32, 3, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100652, 32, 4, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100653, 32, 5, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100654, 32, 6, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100655, 32, 7, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100656, 32, 8, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100657, 32, 9, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100658, 32, 10, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100659, 32, 11, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100660, 32, 12, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100661, 32, 13, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100662, 32, 14, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100663, 32, 15, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100664, 32, 16, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100665, 32, 17, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100666, 32, 18, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100667, 32, 19, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100668, 32, 20, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100669, 32, 21, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100670, 32, 22, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100671, 32, 23, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100672, 32, 24, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100673, 32, 25, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100674, 32, 26, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100675, 32, 27, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100676, 32, 28, 'ELCT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100677, 40, 1, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100678, 40, 2, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100679, 40, 3, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100680, 40, 4, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100681, 40, 5, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100682, 40, 6, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100683, 40, 7, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100684, 40, 8, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100685, 40, 9, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100686, 40, 10, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100687, 40, 11, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100688, 40, 12, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100689, 40, 13, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100690, 40, 14, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100691, 40, 15, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100692, 40, 16, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100693, 40, 17, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100694, 40, 18, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100695, 40, 19, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100696, 40, 20, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100697, 40, 21, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100698, 40, 22, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100699, 40, 23, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100700, 40, 24, 'ELCT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100701, 41, 1, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100702, 41, 2, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100703, 41, 3, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100704, 41, 4, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100705, 41, 5, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100706, 41, 6, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100707, 41, 7, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100708, 41, 8, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100709, 41, 9, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100710, 41, 10, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100711, 41, 11, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100712, 41, 12, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100713, 41, 13, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100714, 41, 14, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100715, 41, 15, 'ELT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100716, 42, 1, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100717, 42, 2, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100718, 42, 3, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100719, 42, 4, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100720, 42, 5, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100721, 42, 6, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100722, 42, 7, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100723, 42, 8, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100724, 42, 9, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100725, 42, 10, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100726, 42, 11, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100727, 42, 12, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100728, 42, 13, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100729, 42, 14, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100730, 42, 15, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100731, 42, 16, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100732, 42, 17, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100733, 42, 18, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100734, 42, 19, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100735, 42, 20, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100736, 42, 21, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100737, 42, 22, 'ELCT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100738, 43, 1, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100739, 43, 2, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100740, 43, 3, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100741, 43, 4, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100742, 43, 5, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100743, 43, 6, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100744, 43, 7, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100745, 43, 8, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100746, 43, 9, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100747, 43, 10, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100748, 43, 11, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100749, 43, 12, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100750, 43, 13, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100751, 43, 14, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100752, 43, 15, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100753, 43, 16, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100754, 43, 17, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100755, 43, 18, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100756, 43, 19, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100757, 43, 20, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100758, 43, 21, 'TRCT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100759, 44, 1, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100760, 44, 2, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100761, 44, 3, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100762, 44, 4, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100763, 44, 5, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100764, 44, 6, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100765, 44, 7, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100766, 44, 8, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100767, 44, 9, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100768, 44, 10, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100769, 44, 11, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100770, 44, 12, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100771, 44, 13, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100772, 44, 14, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100773, 44, 15, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100774, 44, 16, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100775, 44, 17, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100776, 44, 18, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100777, 44, 19, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100778, 44, 20, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100779, 44, 21, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100780, 44, 22, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100781, 44, 23, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100782, 44, 24, 'BET');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100783, 45, 1, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100784, 45, 2, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100785, 45, 3, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100786, 45, 4, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100787, 45, 5, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100788, 45, 6, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100789, 45, 7, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100790, 45, 8, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100791, 45, 9, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100792, 45, 10, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100793, 45, 11, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100794, 45, 12, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100795, 45, 13, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100796, 45, 14, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100797, 45, 15, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100798, 45, 16, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100799, 45, 17, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100800, 45, 18, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100801, 45, 19, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100802, 45, 20, 'ELT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100803, 50, 12, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100804, 50, 24, 'BET');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100805, 100, 1, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100806, 100, 2, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100807, 100, 3, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100808, 100, 4, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100809, 100, 5, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100810, 100, 6, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100811, 100, 7, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100812, 100, 8, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100813, 100, 9, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100814, 100, 10, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100815, 100, 11, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100816, 100, 12, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100817, 100, 13, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100818, 100, 14, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100819, 100, 15, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100820, 100, 16, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100821, 100, 17, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100822, 100, 18, 'BET');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100823, 101, 1, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100824, 101, 2, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100825, 101, 3, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100826, 101, 4, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100827, 101, 5, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100828, 101, 6, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100829, 101, 7, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100830, 101, 8, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100831, 101, 9, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100832, 101, 10, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100833, 101, 11, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100834, 101, 12, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100835, 101, 13, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100836, 101, 14, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100837, 101, 15, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100838, 101, 16, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100839, 101, 17, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100840, 101, 18, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100841, 101, 19, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100842, 101, 20, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100843, 101, 21, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100844, 101, 22, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100845, 101, 23, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100846, 101, 24, 'ELCT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100847, 102, 1, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100848, 102, 2, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100849, 102, 3, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100850, 102, 4, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100851, 102, 5, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100852, 102, 6, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100853, 102, 7, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100854, 102, 8, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100855, 102, 9, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100856, 102, 10, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100857, 102, 11, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100858, 102, 12, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100859, 102, 13, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100860, 102, 14, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100861, 102, 15, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100862, 102, 16, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100863, 102, 17, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100864, 102, 18, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100865, 102, 19, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100866, 102, 20, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100867, 102, 21, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100868, 102, 22, 'ELT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100869, 103, 1, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100870, 103, 2, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100871, 103, 3, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100872, 103, 4, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100873, 103, 5, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100874, 103, 6, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100875, 103, 7, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100876, 103, 8, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100877, 103, 9, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100878, 103, 10, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100879, 103, 11, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100880, 103, 12, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100881, 103, 13, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100882, 103, 14, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100883, 103, 15, 'ELCT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100884, 104, 1, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100885, 104, 2, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100886, 104, 3, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100887, 104, 4, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100888, 104, 5, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100889, 104, 6, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100890, 104, 7, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100891, 104, 8, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100892, 104, 9, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100893, 104, 10, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100894, 104, 11, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100895, 104, 12, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100896, 104, 13, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100897, 104, 14, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100898, 104, 15, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100899, 104, 16, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100900, 104, 17, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100901, 104, 18, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100902, 104, 19, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100903, 104, 20, 'ELCT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100904, 105, 1, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100905, 105, 2, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100906, 105, 3, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100907, 105, 4, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100908, 105, 5, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100909, 105, 6, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100910, 105, 7, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100911, 105, 8, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100912, 105, 9, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100913, 105, 10, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100914, 105, 11, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100915, 105, 12, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100916, 105, 13, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100917, 105, 14, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100918, 105, 15, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100919, 105, 16, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100920, 105, 17, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100921, 105, 18, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100922, 105, 19, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100923, 105, 20, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100924, 105, 21, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100925, 105, 22, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100926, 105, 23, 'ELT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100927, 106, 1, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100928, 106, 2, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100929, 106, 3, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100930, 106, 4, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100931, 106, 5, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100932, 106, 6, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100933, 106, 7, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100934, 106, 8, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100935, 106, 9, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100936, 106, 10, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100937, 106, 11, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100938, 106, 12, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100939, 106, 13, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100940, 106, 14, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100941, 106, 15, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100942, 106, 16, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100943, 106, 17, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100944, 106, 18, 'ELCT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100945, 107, 1, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100946, 107, 2, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100947, 107, 3, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100948, 107, 4, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100949, 107, 5, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100950, 107, 6, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100951, 107, 7, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100952, 107, 8, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100953, 107, 9, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100954, 107, 10, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100955, 107, 11, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100956, 107, 12, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100957, 107, 13, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100958, 107, 14, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100959, 107, 15, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100960, 107, 16, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100961, 107, 17, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100962, 107, 18, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100963, 107, 19, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100964, 107, 20, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100965, 107, 21, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100966, 107, 22, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100967, 107, 23, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100968, 107, 24, 'ELCT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100969, 108, 1, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100970, 108, 2, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100971, 108, 3, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100972, 108, 4, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100973, 108, 5, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100974, 108, 6, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100975, 108, 7, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100976, 108, 8, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100977, 108, 9, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100978, 108, 10, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100979, 108, 11, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100980, 108, 12, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100981, 108, 13, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100982, 108, 14, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100983, 108, 15, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100984, 108, 16, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100985, 108, 17, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100986, 108, 18, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100987, 108, 19, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100988, 108, 20, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100989, 108, 21, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100990, 108, 22, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100991, 108, 23, 'ELCT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100992, 109, 1, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100993, 109, 2, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100994, 109, 3, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100995, 109, 4, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100996, 109, 5, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100997, 109, 6, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100998, 109, 7, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (100999, 109, 8, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101000, 109, 9, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101001, 109, 10, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101002, 109, 11, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101003, 109, 12, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101004, 109, 13, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101005, 109, 14, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101006, 109, 15, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101007, 109, 16, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101008, 109, 17, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101009, 109, 18, 'ELT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101010, 110, 1, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101011, 110, 2, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101012, 110, 3, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101013, 110, 4, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101014, 110, 5, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101015, 110, 6, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101016, 110, 7, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101017, 110, 8, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101018, 110, 9, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101019, 110, 10, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101020, 110, 11, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101021, 110, 12, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101022, 110, 13, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101023, 110, 14, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101024, 110, 15, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101025, 110, 16, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101026, 110, 17, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101027, 110, 18, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101028, 110, 19, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101029, 110, 20, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101030, 110, 21, 'ELCT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101031, 111, 1, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101032, 111, 2, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101033, 111, 3, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101034, 111, 4, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101035, 111, 5, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101036, 111, 6, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101037, 111, 7, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101038, 111, 8, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101039, 111, 9, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101040, 111, 10, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101041, 111, 11, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101042, 111, 12, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101043, 111, 13, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101044, 111, 14, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101045, 111, 15, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101046, 111, 16, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101047, 111, 17, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101048, 111, 18, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101049, 111, 19, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101050, 111, 20, 'ELT');

INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101051, 112, 1, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101052, 112, 2, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101053, 112, 3, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101054, 112, 4, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101055, 112, 5, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101056, 112, 6, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101057, 112, 7, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101058, 112, 8, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101059, 112, 9, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101060, 112, 10, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101061, 112, 11, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101062, 112, 12, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101063, 112, 13, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101064, 112, 14, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101065, 112, 15, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101066, 112, 16, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101067, 112, 17, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101068, 112, 18, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101069, 112, 19, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101070, 112, 20, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101071, 112, 21, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101072, 112, 22, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101073, 112, 23, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101074, 112, 24, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101101, 113, 1, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101102, 113, 2, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101103, 113, 3, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101104, 113, 4, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101105, 113, 5, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101106, 113, 6, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101107, 113, 7, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101108, 113, 8, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101109, 113, 9, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101110, 113, 10, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101111, 113, 11, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101112, 113, 12, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101113, 113, 13, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101114, 113, 14, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101115, 113, 15, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101116, 113, 16, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101131, 114, 1, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101132, 114, 2, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101133, 114, 3, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101134, 114, 4, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101135, 114, 5, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101136, 114, 6, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101137, 114, 7, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101138, 114, 8, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101139, 114, 9, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101140, 114, 10, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101141, 114, 11, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101142, 114, 12, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101143, 114, 13, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101144, 114, 14, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101145, 114, 15, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101146, 114, 16, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101161, 115, 1, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101162, 115, 2, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101163, 115, 3, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101164, 115, 4, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101165, 115, 5, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101166, 115, 6, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101167, 115, 7, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101168, 115, 8, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101169, 115, 9, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101170, 115, 10, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101171, 115, 11, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101172, 115, 12, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101173, 115, 13, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101174, 115, 14, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101175, 115, 15, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101176, 115, 16, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101191, 116, 1, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101192, 116, 2, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101193, 116, 3, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101194, 116, 4, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101195, 116, 5, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101196, 116, 6, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101197, 116, 7, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101198, 116, 8, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101199, 116, 9, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101200, 116, 10, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101201, 116, 11, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101202, 116, 12, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101203, 116, 13, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101204, 116, 14, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101205, 116, 15, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101206, 116, 16, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101221, 117, 1, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101222, 117, 2, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101223, 117, 3, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101224, 117, 4, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101225, 117, 5, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101226, 117, 6, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101227, 117, 7, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101228, 117, 8, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101229, 117, 9, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101230, 117, 10, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101231, 117, 11, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101232, 117, 12, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101233, 117, 13, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101234, 117, 14, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101235, 117, 15, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101236, 117, 16, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101251, 118, 1, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101252, 118, 2, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101253, 118, 3, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101254, 118, 4, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101255, 118, 5, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101256, 118, 6, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101257, 118, 7, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101258, 118, 8, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101259, 118, 9, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101260, 118, 10, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101261, 118, 11, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101262, 118, 12, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101263, 118, 13, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101264, 118, 14, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101265, 118, 15, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101266, 118, 16, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101281, 119, 1, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101282, 119, 2, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101283, 119, 3, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101284, 119, 4, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101285, 119, 5, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101286, 119, 6, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101287, 119, 7, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101288, 119, 8, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101289, 119, 9, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101290, 119, 10, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101291, 119, 11, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101292, 119, 12, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101293, 119, 13, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101294, 119, 14, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101295, 119, 15, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101296, 119, 16, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101311, 120, 1, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101312, 120, 2, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101313, 120, 3, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101314, 120, 4, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101315, 120, 5, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101316, 120, 6, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101317, 120, 7, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101318, 120, 8, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101319, 120, 9, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101320, 120, 10, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101321, 120, 11, 'TRCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101322, 120, 12, 'BDCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101323, 120, 13, 'ELT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101324, 120, 14, 'BET');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101325, 120, 15, 'ELCT');
INSERT INTO runde (id_runda, id_instanta, numar_runda, cod_rezultat) VALUES (101326, 120, 16, 'TRCT');
COMMIT;


REM inseram date in tabelele de preferinte si contracte aditionale
PROMPT *** populating additional relationship data

-- sponsorizari aditionale
INSERT INTO sponsorizari (id_echipa, id_sponsor, data_inceput, data_sfarsit, suma_contract)
VALUES ((SELECT id_echipa FROM echipe WHERE nume_echipa = 'Natus Vincere'), (SELECT id_sponsor FROM sponsori WHERE nume_sponsor = 'Intel'), TO_DATE('01-01-2023', 'DD-MM-YYYY'), NULL, 1500000);
INSERT INTO sponsorizari (id_echipa, id_sponsor, data_inceput, data_sfarsit, suma_contract)
VALUES ((SELECT id_echipa FROM echipe WHERE nume_echipa = 'FaZe Clan'), (SELECT id_sponsor FROM sponsori WHERE nume_sponsor = 'HyperX'), TO_DATE('01-06-2022', 'DD-MM-YYYY'), NULL, 3000000);

INSERT INTO utilizatori (id_user, email, parola_hash, username, tip_user, data_creare, este_activ)
    VALUES (1, 'admin@qltv.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'admin', 'ADMIN', SYSDATE, 1);
INSERT INTO utilizatori (id_user, email, parola_hash, username, tip_user, data_creare, este_activ)
    VALUES (2, 'user2@qltv.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'alex_cs', 'STANDARD', SYSDATE, 1);
INSERT INTO utilizatori (id_user, email, parola_hash, username, tip_user, data_creare, este_activ)
    VALUES (3, 'user3@qltv.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'gamer_girl99', 'STANDARD', SYSDATE, 1);
INSERT INTO utilizatori (id_user, email, parola_hash, username, tip_user, data_creare, este_activ)
    VALUES (4, 'user4@qltv.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'frag_master', 'STANDARD', SYSDATE, 1);
INSERT INTO utilizatori (id_user, email, parola_hash, username, tip_user, data_creare, este_activ)
    VALUES (5, 'user5@qltv.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'strat_lord', 'STANDARD', SYSDATE, 1);
INSERT INTO utilizatori (id_user, email, parola_hash, username, tip_user, data_creare, este_activ)
    VALUES (6, 'user6@qltv.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'eco_rounder', 'STANDARD', SYSDATE, 1);
INSERT INTO utilizatori (id_user, email, parola_hash, username, tip_user, data_creare, este_activ)
    VALUES (7, 'user1@qltv.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'user1', 'STANDARD', SYSDATE, 1);

INSERT INTO user_echipe_fav (id_user, id_echipa) VALUES (1, 100000); -- NAVI
INSERT INTO user_echipe_fav (id_user, id_echipa) VALUES (1, 100001); -- FaZe
INSERT INTO user_membri_fav (id_user, id_membru) VALUES (1, 1);    -- s1mple
INSERT INTO user_membri_fav (id_user, id_membru) VALUES (1, 2);    -- iM

INSERT INTO user_echipe_fav (id_user, id_echipa) VALUES (7, 100002); -- Team Spirit
INSERT INTO user_membri_fav (id_user, id_membru) VALUES (7, 7);    -- donk

-- noutati
INSERT INTO noutati (id_noutate, titlu_noutate, continut_noutate, data_postare)
    VALUES (1, 'NAVI wins PGL Major Copenhagen 2024!', 'In a thrilling final, Natus Vincere defeated FaZe Clan to claim the trophy.', SYSDATE - 10);
INSERT INTO noutati (id_noutate, titlu_noutate, continut_noutate, data_postare)
    VALUES (2, 'Roster Shuffle: s1mple returns to active play?', 'Rumors are circulating that the GOAT might be coming back sooner than expected.', SYSDATE - 2);
INSERT INTO noutati (id_noutate, titlu_noutate, continut_noutate, data_postare)
    VALUES (3, 'Intel Extreme Masters Cologne 2024 Announced', 'The Cathedral of Counter-Strike awaits. Tickets go on sale next week.', SYSDATE - 5);
INSERT INTO noutati (id_noutate, titlu_noutate, continut_noutate, data_postare)
    VALUES (4, 'New Patch Notes: Inferno Adjustments', 'Valve has released a new update focusing on site adjustments for Inferno and general bug fixes.', SYSDATE);

-- comentarii
-- root comments on news 1
INSERT INTO comentarii (id_comentariu, id_noutate, id_user, id_parinte, continut, data_postare)
    VALUES (1, 1, 2, NULL, 'What a game! iM played out of his mind on the last map.', SYSDATE - 9);
INSERT INTO comentarii (id_comentariu, id_noutate, id_user, id_parinte, continut, data_postare)
    VALUES (2, 1, 1, NULL, 'FaZe looked tired, but NAVI definitely deserved it.', SYSDATE - 9);

-- replies to comment 1
INSERT INTO comentarii (id_comentariu, id_noutate, id_user, id_parinte, continut, data_postare)
    VALUES (3, 1, 3, 1, 'Agreed, his impact was crucial in the mid-round.', SYSDATE - 8);
INSERT INTO comentarii (id_comentariu, id_noutate, id_user, id_parinte, continut, data_postare)
    VALUES (4, 1, 4, 3, 'Exactly! People keep doubting him, but he proves them wrong in big games.', SYSDATE - 8);
INSERT INTO comentarii (id_comentariu, id_noutate, id_user, id_parinte, continut, data_postare)
    VALUES (7, 1, 5, 1, 'I think jL was the real MVP though.', SYSDATE - 8);

-- reply to comment 2
INSERT INTO comentarii (id_comentariu, id_noutate, id_user, id_parinte, continut, data_postare)
    VALUES (5, 1, 6, 2, 'FaZe will be back. Grand Slam is still the goal.', SYSDATE - 8);

-- root comment on News 2
INSERT INTO comentarii (id_comentariu, id_noutate, id_user, id_parinte, continut, data_postare)
    VALUES (6, 2, 7, NULL, 'We need him back. The scene is not the same without s1mple.', SYSDATE - 1);
INSERT INTO comentarii (id_comentariu, id_noutate, id_user, id_parinte, continut, data_postare)
    VALUES (8, 2, 5, 6, 'But where would he even go? NAVI is doing fine now.', SYSDATE - 1);

-- root comment on News 4
INSERT INTO comentarii (id_comentariu, id_noutate, id_user, id_parinte, continut, data_postare)
    VALUES (9, 4, 3, NULL, 'Finally they fixed the boiler smoke!', SYSDATE);

COMMIT;

SELECT * FROM ECHIPE;
