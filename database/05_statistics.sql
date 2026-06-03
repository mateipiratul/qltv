-- 05_statistics.sql
SET VERIFY OFF
ALTER SESSION SET NLS_LANGUAGE=American;

PROMPT *** populating STATISTICI_INDIVIDUALE table with deterministic data

DECLARE
    TYPE t_echipa_jucatori IS VARRAY(5) OF NUMBER;
    v_ct_team     t_echipa_jucatori := t_echipa_jucatori();
    v_t_team      t_echipa_jucatori := t_echipa_jucatori();
    v_winner_team t_echipa_jucatori := t_echipa_jucatori();
    v_loser_team  t_echipa_jucatori := t_echipa_jucatori();
    v_win_type    VARCHAR2(10);
    v_current_kills   INTEGER;
    v_current_assists INTEGER;
    v_current_damage  INTEGER;
    v_current_hs      INTEGER;
    v_current_flash   INTEGER;
    v_current_died    INTEGER;
    v_total_kills_round  INTEGER := 0;
    v_total_deaths_round INTEGER := 0;
    v_kills_remaining    INTEGER;
    v_time_of_death      VARCHAR2(8);
    TYPE t_stats_array IS TABLE OF INTEGER INDEX BY PLS_INTEGER;
    v_winner_kills t_stats_array;
    v_loser_deaths t_stats_array;
BEGIN
    -- Instance 1
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 1 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        ELSE
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 2
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 2 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        ELSE
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 3
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 3 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        ELSE
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 4
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 4 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        ELSE
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 5
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 5 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        ELSE
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 6
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 6 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        ELSE
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 7
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 7 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        ELSE
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 8
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 8 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        ELSE
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 9
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 9 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        ELSE
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 10
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 10 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        ELSE
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 11
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 11 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        ELSE
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 12
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 12 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        ELSE
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 13
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 13 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        ELSE
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 14
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 14 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        ELSE
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 15
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 15 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        ELSE
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 16
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 16 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        ELSE
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 17
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 17 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        ELSE
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 18
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 18 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        ELSE
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 19
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 19 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        ELSE
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 20
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 20 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        ELSE
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 21
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 21 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        ELSE
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 22
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 22 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        ELSE
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 23
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 23 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        ELSE
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 24
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 24 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        ELSE
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 25
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 25 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        ELSE
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 26
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 26 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        ELSE
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 27
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 27 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        ELSE
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 28
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 28 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        ELSE
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 29
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 29 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        ELSE
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 30
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 30 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        ELSE
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 31
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 31 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        ELSE
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 32
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 32 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        ELSE
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 40
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 40 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        ELSE
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 41
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 41 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        ELSE
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 42
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 42 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        ELSE
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 43
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 43 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        ELSE
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 44
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 44 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        ELSE
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 45
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 45 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        ELSE
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 50
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 50 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        ELSE
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 100
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 100 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        ELSE
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 101
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 101 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        ELSE
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 102
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 102 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        ELSE
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 103
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 103 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        ELSE
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 104
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 104 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        ELSE
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 105
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 105 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        ELSE
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 106
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 106 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        ELSE
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 107
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 107 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        ELSE
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 108
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 108 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        ELSE
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 109
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 109 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        ELSE
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 110
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 110 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        ELSE
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 111
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 111 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        ELSE
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 112
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 112 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        ELSE
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 113
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 113 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        ELSE
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 114
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 114 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        ELSE
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 115
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 115 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        ELSE
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 116
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 116 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        ELSE
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 117
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 117 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        ELSE
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 118
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 118 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(5,8,10,9,84);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        ELSE
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(5,8,10,9,84);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 119
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 119 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(18,38,39,68,69);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        ELSE
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(18,38,39,68,69);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    -- Instance 120
    FOR r IN (SELECT id_runda, numar_runda, cod_rezultat FROM runde WHERE id_instanta = 120 ORDER BY numar_runda) LOOP
        IF r.numar_runda <= 12 THEN
            v_ct_team := t_echipa_jucatori(86,114,115,116,117);
            v_t_team := t_echipa_jucatori(1,11,2,42,12);
        ELSE
            v_ct_team := t_echipa_jucatori(1,11,2,42,12);
            v_t_team := t_echipa_jucatori(86,114,115,116,117);
        END IF;
        IF r.cod_rezultat LIKE '%CT' THEN
            v_winner_team := v_ct_team; v_loser_team := v_t_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 2);
        ELSE
            v_winner_team := v_t_team; v_loser_team := v_ct_team;
            v_win_type := SUBSTR(r.cod_rezultat, 1, LENGTH(r.cod_rezultat) - 1);
        END IF;
        v_total_kills_round := 0;
        v_total_deaths_round := 0;
        FOR i IN 1..5 LOOP
            IF v_win_type = 'EL' THEN
                v_loser_deaths(i) := 1;
            ELSIF v_win_type IN ('BD', 'BE') THEN
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(3,5)) THEN 1 ELSE 0 END;
            ELSE
                v_loser_deaths(i) := CASE WHEN i <= ROUND(DBMS_RANDOM.VALUE(1,3)) THEN 1 ELSE 0 END;
            END IF;
            v_total_deaths_round := v_total_deaths_round + v_loser_deaths(i);
        END LOOP;
        v_kills_remaining := v_total_deaths_round;
        FOR i IN 1..5 LOOP
            IF v_kills_remaining > 0 THEN
                v_current_kills := LEAST(v_kills_remaining, ROUND(DBMS_RANDOM.VALUE(0, 3)));
                IF i = 5 THEN v_current_kills := v_kills_remaining; END IF;
                v_kills_remaining := v_kills_remaining - v_current_kills;
            ELSE
                v_current_kills := 0;
            END IF;
            v_winner_kills(i) := v_current_kills;
            v_total_kills_round := v_total_kills_round + v_current_kills;
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_kills := v_winner_kills(i);
            v_current_assists := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, 1)) ELSE 0 END;
            v_current_damage  := (v_current_kills * 90) + ROUND(DBMS_RANDOM.VALUE(0, 50));
            v_current_hs      := CASE WHEN v_current_kills > 0 THEN ROUND(DBMS_RANDOM.VALUE(0, v_current_kills)) ELSE 0 END;
            v_current_flash   := ROUND(DBMS_RANDOM.VALUE(0, 1));
            v_current_died := 0;
            v_time_of_death := NULL;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_winner_team(i), v_current_kills, v_current_assists, v_current_damage, v_current_hs, v_current_flash, v_current_died, v_time_of_death);
        END LOOP;
        FOR i IN 1..5 LOOP
            v_current_died := v_loser_deaths(i);
            v_current_kills := 0;
            v_current_damage := ROUND(DBMS_RANDOM.VALUE(0, 50));
            IF v_current_died = 1 THEN
                v_time_of_death := '00:' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 1))), 2, '0') || ':' || LPAD(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 59))), 2, '0');
            ELSE
                v_time_of_death := NULL;
            END IF;
            INSERT INTO statistici_individuale (id_runda, id_jucator, kills, assists, damage, headshots, flash_assists, died, time_of_death)
            VALUES (r.id_runda, v_loser_team(i), v_current_kills, 0, v_current_damage, 0, 0, v_current_died, v_time_of_death);
        END LOOP;
    END LOOP;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('succes: statistici generate');
END;
/
