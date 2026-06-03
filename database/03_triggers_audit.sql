-- 03_triggers_audit.sql

REM *** trigger SPONSORIZARI insert **************
REM un sponsor nu poate avea mai multe contracte *
REM care isi suprapun intervalele cu o echipa    *
REM **********************************************

CREATE OR REPLACE TRIGGER trg_sponsorizari_insert
    FOR INSERT ON sponsorizari
    COMPOUND TRIGGER

    TYPE t_linie_noua IS RECORD (
        v_id_echipa  sponsorizari.id_echipa%TYPE,
        v_id_sponsor sponsorizari.id_sponsor%TYPE,
        v_start      DATE,
        v_end        DATE,
        v_rowid      UROWID
    );

    TYPE t_lista_linii IS TABLE OF t_linie_noua INDEX BY PLS_INTEGER;
    v_linii_de_procesat t_lista_linii;

    AFTER EACH ROW IS
        v_idx PLS_INTEGER;
BEGIN
        v_idx := v_linii_de_procesat.COUNT + 1;
        v_linii_de_procesat(v_idx).v_id_echipa  := :NEW.id_echipa;
        v_linii_de_procesat(v_idx).v_id_sponsor := :NEW.id_sponsor;
        v_linii_de_procesat(v_idx).v_start      := :NEW.data_inceput;
        v_linii_de_procesat(v_idx).v_end        := :NEW.data_sfarsit;
        v_linii_de_procesat(v_idx).v_rowid      := :NEW.ROWID;
END AFTER EACH ROW;

    AFTER STATEMENT IS
        v_cnt NUMBER;
        c_inf CONSTANT DATE := TO_DATE('31-12-9999', 'DD-MM-YYYY');
BEGIN
FOR i IN 1..v_linii_de_procesat.COUNT LOOP
SELECT COUNT(*) INTO v_cnt
FROM sponsorizari
WHERE id_echipa = v_linii_de_procesat(i).v_id_echipa
  AND id_sponsor = v_linii_de_procesat(i).v_id_sponsor
  AND ROWID != v_linii_de_procesat(i).v_rowid
                AND v_linii_de_procesat(i).v_start < NVL(data_sfarsit, c_inf)
                AND data_inceput < NVL(v_linii_de_procesat(i).v_end, c_inf);

IF v_cnt > 0 THEN
                RAISE_APPLICATION_ERROR(-20010, 'eroare integritate: exista deja un contract activ sau care se suprapune pentru echipa cu id ' ||
                v_linii_de_procesat(i).v_id_echipa || ' si sponsorul cu id ' || v_linii_de_procesat(i).v_id_sponsor);
END IF;
END LOOP;

        v_linii_de_procesat.DELETE;
END AFTER STATEMENT;
END;
/


REM *** trigger SPONSORIZARI update **************
REM un sponsor nu poate avea mai multe contracte *
REM care isi suprapun intervalele cu o echipa    *
REM data_inceput a sponsorizarii nu se modifica  *
REM data_sfarsit se poate modifica daca e NULL   *
REM **********************************************

CREATE OR REPLACE TRIGGER trg_sponsorizari_update
BEFORE UPDATE OF data_inceput, data_sfarsit ON sponsorizari
    FOR EACH ROW
BEGIN
    IF :NEW.data_inceput != :OLD.data_inceput THEN
        RAISE_APPLICATION_ERROR(-20011, 'eroare: nu se poate modifica data de inceput a unei sponsorizari deja salvate');
END IF;

    IF :NEW.data_sfarsit != :OLD.data_sfarsit AND :OLD.data_sfarsit IS NOT NULL THEN
        RAISE_APPLICATION_ERROR(-20012, 'eroare: nu se poate modifica data de sfarsit nenula (' ||
        :OLD.data_sfarsit || ') a unei sponsorizari deja salvate');
END IF;

    IF :NEW.data_sfarsit IS NOT NULL AND :NEW.data_sfarsit < :NEW.data_inceput THEN
        RAISE_APPLICATION_ERROR(-20013, 'eroare: data de sfarsit nu poate fi anterioara datei de inceput');
END IF;
END;
/


REM *** trigger ISTORIC_CONTRACTE insert *******************
REM un membru nu poate avea decat un singur contract activ *
REM ********************************************************

CREATE OR REPLACE TRIGGER trg_istoric_contracte_insert
    FOR INSERT ON istoric_contracte
    COMPOUND TRIGGER

    TYPE t_linie_noua IS RECORD (
        v_id_membru istoric_contracte.id_membru%TYPE,
        v_id_echipa istoric_contracte.id_echipa%TYPE,
        v_start     DATE,
        v_end       DATE,
        v_rowid     UROWID
    );

    TYPE t_lista_linii IS TABLE OF t_linie_noua INDEX BY PLS_INTEGER;
    v_linii_de_procesat t_lista_linii;

    AFTER EACH ROW IS
        v_idx PLS_INTEGER;
BEGIN
        v_idx := v_linii_de_procesat.COUNT + 1;
        v_linii_de_procesat(v_idx).v_id_membru := :NEW.id_membru;
        v_linii_de_procesat(v_idx).v_id_echipa := :NEW.id_echipa;
        v_linii_de_procesat(v_idx).v_start     := :NEW.data_inceput;
        v_linii_de_procesat(v_idx).v_end       := :NEW.data_sfarsit;
        v_linii_de_procesat(v_idx).v_rowid     := :NEW.ROWID;
END AFTER EACH ROW;

    AFTER STATEMENT IS
        v_cnt NUMBER;
        c_inf CONSTANT DATE := TO_DATE('31-12-9999', 'DD-MM-YYYY');
BEGIN
FOR i IN 1..v_linii_de_procesat.COUNT LOOP
SELECT COUNT(*) INTO v_cnt
FROM istoric_contracte
WHERE id_membru = v_linii_de_procesat(i).v_id_membru
  AND ROWID != v_linii_de_procesat(i).v_rowid
                AND v_linii_de_procesat(i).v_start < NVL(data_sfarsit, c_inf)
                AND data_inceput < NVL(v_linii_de_procesat(i).v_end, c_inf);

IF v_cnt > 0 THEN
                RAISE_APPLICATION_ERROR(-20014, 'eroare contract: jucatorul cu id ' || v_linii_de_procesat(i).v_id_membru ||
                ' are deja un contract activ cu echipa ' || v_linii_de_procesat(i).v_id_echipa ||
                ' care se suprapune cu perioada selectata (' || TO_CHAR(v_linii_de_procesat(i).v_start) || ')');
END IF;
END LOOP;

        v_linii_de_procesat.DELETE;
END AFTER STATEMENT;
END;
/


REM *** trigger ISTORIC_CONTRACTE update *******************
REM un membru nu poate avea decat un singur contract activ *
REM data_inceput a sponsorizarii nu se modifica            *
REM data_sfarsit se poate modifica daca e NULL             *
REM ********************************************************

CREATE OR REPLACE TRIGGER trg_istoric_contracte_update
BEFORE UPDATE OF data_inceput, data_sfarsit ON istoric_contracte
    FOR EACH ROW
BEGIN
    IF :NEW.data_inceput != :OLD.data_inceput THEN
        RAISE_APPLICATION_ERROR(-20015, 'eroare: nu se poate modifica data de inceput a unui contract deja salvat');
END IF;

    IF :NEW.data_sfarsit != :OLD.data_sfarsit AND :OLD.data_sfarsit IS NOT NULL THEN
        RAISE_APPLICATION_ERROR(-20016, 'eroare: nu se poate modifica data de sfarsit nenula (' ||
        :OLD.data_sfarsit || ') a unui contract deja salvat');
END IF;

    IF :NEW.data_sfarsit IS NOT NULL AND :NEW.data_sfarsit < :NEW.data_inceput THEN
        RAISE_APPLICATION_ERROR(-20013, 'eroare: data de sfarsit nu poate fi anterioara datei de inceput');
END IF;
END;
/


REM *** trigger ISTORIC_CONTRACTE limit players ************
REM o echipa nu poate avea mai mult de 7 contracte active  *
REM cu jucatori (membri care apar in tabelul JUCATORI)     *
REM ********************************************************

CREATE OR REPLACE TRIGGER trg_limit_team_players
    FOR INSERT OR UPDATE OF id_echipa, id_membru, data_sfarsit ON istoric_contracte
    COMPOUND TRIGGER

    TYPE t_team_id IS TABLE OF istoric_contracte.id_echipa%TYPE INDEX BY PLS_INTEGER;
    v_teams_to_check t_team_id;

    AFTER EACH ROW IS
BEGIN
        IF :NEW.data_sfarsit IS NULL THEN
            v_teams_to_check(v_teams_to_check.COUNT + 1) := :NEW.id_echipa;
END IF;
END AFTER EACH ROW;

    AFTER STATEMENT IS
        v_player_count NUMBER;
BEGIN
FOR i IN 1..v_teams_to_check.COUNT LOOP
SELECT COUNT(*) INTO v_player_count
FROM istoric_contracte ic
WHERE ic.id_echipa = v_teams_to_check(i)
  AND ic.data_sfarsit IS NULL
                AND EXISTS (SELECT 1 FROM jucatori j WHERE j.id_jucator = ic.id_membru);

IF v_player_count > 7 THEN
                RAISE_APPLICATION_ERROR(-20040, 'eroare componenta: echipa cu id ' || v_teams_to_check(i) || 
                ' nu poate avea mai mult de 7 jucatori activi simultan (actual: ' || v_player_count || ')');
END IF;
END LOOP;

        v_teams_to_check.DELETE;
END AFTER STATEMENT;
END;
/


REM *********************************************************
REM un meci nu poate avea data in care a fost jucat in      *
REM afara perioadei desfasurarii turneului de care apartine *
REM *********************************************************

CREATE OR REPLACE TRIGGER trg_turnee_meciuri_insert
BEFORE INSERT OR UPDATE ON meciuri
                            FOR EACH ROW
DECLARE
v_data_start DATE;
    v_data_final DATE;
BEGIN
    IF :NEW.data_ora IS NOT NULL AND (
        INSERTING OR
        (:NEW.data_ora != :OLD.data_ora) OR
        (:NEW.id_turneu != :OLD.id_turneu)
    ) THEN
SELECT data_inceput, data_sfarsit
INTO v_data_start, v_data_final
FROM turnee
WHERE id_turneu = :NEW.id_turneu;

IF :NEW.data_ora < TRUNC(v_data_start) OR :NEW.data_ora >= (v_data_final + 1) THEN
            RAISE_APPLICATION_ERROR(-20014, 'eroare: data meciului (' || TO_CHAR(:NEW.data_ora, 'DD-MM-YYYY') ||
            ') este in afara perioadei turneului (' || TO_CHAR(v_data_start, 'DD-MM-YYYY') || ' - ' ||
            TO_CHAR(v_data_final, 'DD-MM-YYYY') || ')');
END IF;
END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20015, 'eroare: turneul asociat acestui meci nu a fost gasit');
END;
/


REM *** trigger TURNEE - MECIURI update *********************
REM un meci nu poate avea data in care a fost jucat in      *
REM afara perioadei desfasurarii turneului de care apartine *
REM sunt mutate toate meciurile afectate la noua data       *
REM *********************************************************

CREATE OR REPLACE TRIGGER trg_turnee_meciuri_update
AFTER UPDATE OF data_inceput, data_sfarsit ON turnee
    FOR EACH ROW
BEGIN
    IF :NEW.data_inceput > :OLD.data_inceput THEN
UPDATE MECIURI
SET data_ora = :NEW.data_inceput
WHERE id_turneu = :NEW.id_turneu
  AND data_ora < :NEW.data_inceput;

DBMS_OUTPUT.PUT_LINE('avertisment: data de inceput a turneului a fost modificata, si implicit toate meciurile afectate au fost mutate pe ' || :NEW.data_inceput);
END IF;

    IF :NEW.data_sfarsit < :OLD.data_sfarsit THEN
UPDATE MECIURI
SET data_ora = :NEW.data_sfarsit
WHERE id_turneu = :NEW.id_turneu
  AND data_ora > :NEW.data_sfarsit;

DBMS_OUTPUT.PUT_LINE('avertisment: data de sfarsit a turneului a fost modificata, si implicit toate meciurile afectate au fost mutate pe ' || :NEW.data_sfarsit);
END IF;
END;
/


REM *** trigger MECIURI - INSTANTE_MECI_HARTA insert **************
REM respectarea formatului meciului: un meci cu un anumit format  *
REM nu poate avea mai multe harti decat numarul indicator asignat *
REM ***************************************************************

CREATE OR REPLACE TRIGGER trg_meciuri_instante_insert
BEFORE INSERT ON instante_meci_harta
FOR EACH ROW
DECLARE
v_format   meciuri.format_meci%TYPE;
    v_cnt    NUMBER;
    v_max_maps NUMBER;
BEGIN
SELECT format_meci INTO v_format
FROM meciuri
WHERE id_meci = :NEW.id_meci;

IF v_format = 'BO1' THEN v_max_maps := 1;
    ELSIF v_format = 'BO3' THEN v_max_maps := 3;
    ELSIF v_format = 'BO5' THEN v_max_maps := 5;
ELSE v_max_maps := 1;
END IF;

SELECT COUNT(*) INTO v_cnt
FROM instante_meci_harta
WHERE id_meci = :NEW.id_meci;

IF v_cnt >= v_max_maps THEN
        RAISE_APPLICATION_ERROR(-20016, 'eroare: nu se pot adauga mai multe harti, meciul are format ' || v_format);
END IF;
END;
/

REM *** trigger MECIURI - INSTANTE_MECI_HARTA update **************
REM respectarea formatului meciului: un meci cu un anumit format  *
REM nu poate avea mai multe harti decat numarul indicator asignat *
REM nu se poate modifica atributul format_meci al unei intrari    *
REM ***************************************************************

CREATE OR REPLACE TRIGGER trg_meciuri_instante_update
BEFORE UPDATE OF format_meci ON meciuri
    FOR EACH ROW
BEGIN
    IF :NEW.format_meci != :OLD.format_meci THEN
        RAISE_APPLICATION_ERROR(-20017, 'eroare: nu se poate modifica formatul unui meci deja salvat');
END IF;
END;
/


REM *** trigger HARTI - INSTANTE_MECI_HARTA insert ***********
REM unicitatea hartii intr-un meci: o anumita harta nu poate *
REM fi jucata decat o singura data in cadrul unui meci       *
REM **********************************************************

CREATE OR REPLACE TRIGGER trg_harti_instante_insert
    FOR INSERT ON instante_meci_harta
    COMPOUND TRIGGER

    TYPE t_linie_noua IS RECORD (
        v_id_meci  instante_meci_harta.id_meci%TYPE,
        v_id_harta instante_meci_harta.id_harta%TYPE,
        v_rowid    UROWID
    );

    TYPE t_lista_linii IS TABLE OF t_linie_noua INDEX BY PLS_INTEGER;
    v_linii_de_procesat t_lista_linii;

    AFTER EACH ROW IS
        v_idx PLS_INTEGER;
BEGIN
        v_idx := v_linii_de_procesat.COUNT + 1;
        v_linii_de_procesat(v_idx).v_id_meci  := :NEW.id_meci;
        v_linii_de_procesat(v_idx).v_id_harta := :NEW.id_harta;
        v_linii_de_procesat(v_idx).v_rowid    := :NEW.ROWID;
END AFTER EACH ROW;

    AFTER STATEMENT IS
        v_cnt NUMBER;
BEGIN
FOR i IN 1..v_linii_de_procesat.COUNT LOOP
SELECT COUNT(*) INTO v_cnt
FROM instante_meci_harta
WHERE id_meci = v_linii_de_procesat(i).v_id_meci
  AND id_harta = v_linii_de_procesat(i).v_id_harta
  AND ROWID != v_linii_de_procesat(i).v_rowid;

IF v_cnt > 0 THEN
                RAISE_APPLICATION_ERROR(-20018, 'eroare unicitate: harta cu id ' || v_linii_de_procesat(i).v_id_harta ||
                ' este deja jucata in meciul ' || v_linii_de_procesat(i).v_id_meci);
END IF;
END LOOP;

        v_linii_de_procesat.DELETE;
END AFTER STATEMENT;
END;
/


REM *** trigger HARTI - INSTANTE_MECI_HARTA update ***********
REM unicitatea hartii intr-un meci: o anumita harta nu poate *
REM fi jucata decat o singura data in cadrul unui meci       *
REM cheia straina harta a unei instante nu se poate modifica *
REM **********************************************************

CREATE OR REPLACE TRIGGER trg_harti_instante_update
BEFORE UPDATE OF id_harta ON instante_meci_harta
    FOR EACH ROW
BEGIN
    IF :NEW.id_harta != :OLD.id_harta THEN
        RAISE_APPLICATION_ERROR(-20019, 'eroare: nu se poate modifica harta unei instante deja salvate');
END IF;
END;
/


REM *** trigger INSTANTE_MECI_HARTA timing ************
REM nu se pot introduce detalii despre desfasurarea   *
REM unui meci inainte ca meciul sa fi inceput oficial *
REM ***************************************************

CREATE OR REPLACE TRIGGER trg_instante_meci_timing
BEFORE INSERT ON instante_meci_harta
FOR EACH ROW
DECLARE
v_data_meci DATE;
BEGIN
SELECT data_ora INTO v_data_meci
FROM meciuri
WHERE id_meci = :NEW.id_meci;

IF v_data_meci IS NOT NULL THEN
        IF SYSDATE < v_data_meci THEN
            RAISE_APPLICATION_ERROR(-20020,
                'eroare cronologica: nu se pot introduce date pentru meciul ' || :NEW.id_meci ||
                ', fiind programat pe ' || TO_CHAR(v_data_meci, 'DD-MM-YYYY HH24:MI') ||
                ', iar acum este ' || TO_CHAR(SYSDATE, 'DD-MM-YYYY HH24:MI'));
END IF;
END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20021, 'Eroare: Meciul asociat nu exista.');
END;
/


REM *** trigger STATISTICI_INDIVIDUALE insert ************
REM in cadrul unei runde, ar trebui sa existe statistici *
REM cumulate doar de la maxim 2 echipe, iar fiecare      *
REM echipa sa aiba maxim 5 intrari diferite de jucatori  *
REM ******************************************************

CREATE OR REPLACE TRIGGER trg_statistici_individuale_insert
    FOR INSERT ON statistici_individuale
    COMPOUND TRIGGER

    TYPE t_linie_noua IS RECORD (
        v_id_runda   statistici_individuale.id_runda%TYPE,
        v_id_jucator statistici_individuale.id_jucator%TYPE,
        v_rowid      UROWID
    );

    TYPE t_lista_linii IS TABLE OF t_linie_noua INDEX BY PLS_INTEGER;
    v_linii_de_procesat t_lista_linii;

    AFTER EACH ROW IS
        v_idx PLS_INTEGER;
BEGIN
        v_idx := v_linii_de_procesat.COUNT + 1;
        v_linii_de_procesat(v_idx).v_id_runda   := :NEW.id_runda;
        v_linii_de_procesat(v_idx).v_id_jucator := :NEW.id_jucator;
        v_linii_de_procesat(v_idx).v_rowid      := :NEW.ROWID;
END AFTER EACH ROW;

    AFTER STATEMENT IS
        c_inf CONSTANT DATE := TO_DATE('31-12-9999', 'DD-MM-YYYY');
        v_id_echipa_curenta NUMBER;
        v_cnt_echipe        NUMBER;
        v_cnt_jucatori      NUMBER;
        v_data_meci         DATE;
BEGIN
FOR i IN 1..v_linii_de_procesat.COUNT LOOP
BEGIN
SELECT m.data_ora INTO v_data_meci
FROM runde r
         JOIN instante_meci_harta i ON r.id_instanta = i.id_instanta
         JOIN meciuri m ON i.id_meci = m.id_meci
WHERE r.id_runda = v_linii_de_procesat(i).v_id_runda;
EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    RAISE_APPLICATION_ERROR(-20022, 'eroare sistem: runda '||
                    v_linii_de_procesat(i).v_id_runda ||' nu este asociata unui meci valid');
END;

BEGIN
SELECT id_echipa INTO v_id_echipa_curenta
FROM istoric_contracte
WHERE id_membru = v_linii_de_procesat(i).v_id_jucator
  AND data_inceput <= v_data_meci
  AND v_data_meci <= NVL(data_sfarsit, c_inf);
EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    RAISE_APPLICATION_ERROR(-20023, 'eroare: jucatorul ' || v_linii_de_procesat(i).v_id_jucator ||
                    ' nu avea niciun contract valabil la data meciului (' || TO_CHAR(v_data_meci, 'DD-MM-YYYY') || ')');

WHEN TOO_MANY_ROWS THEN
                    RAISE_APPLICATION_ERROR(-20024, 'eroare integritate: jucatorul apare cu mai multe contracte active simultan la data ' ||
                    TO_CHAR(v_data_meci, 'DD-MM-YYYY'));
END;

SELECT COUNT(DISTINCT i.id_echipa) INTO v_cnt_echipe
FROM statistici_individuale s
         JOIN istoric_contracte i ON s.id_jucator = i.id_membru
WHERE s.id_runda = v_linii_de_procesat(i).v_id_runda
  AND i.data_inceput <= v_data_meci
  AND v_data_meci <= NVL(i.data_sfarsit, c_inf);

IF v_cnt_echipe > 2 THEN
                RAISE_APPLICATION_ERROR(-20025, 'eroare runda: in runda ' || v_linii_de_procesat(i).v_id_runda ||
                ' exista deja statistici pentru mai mult de 2 echipe');
END IF;

SELECT COUNT(*) INTO v_cnt_jucatori
FROM statistici_individuale s
         JOIN istoric_contracte i ON s.id_jucator = i.id_membru
WHERE s.id_runda = v_linii_de_procesat(i).v_id_runda
  AND i.id_echipa = v_id_echipa_curenta
  AND i.data_inceput <= v_data_meci
  AND v_data_meci <= NVL(i.data_sfarsit, c_inf);

IF v_cnt_jucatori > 5 THEN
                RAISE_APPLICATION_ERROR(-20026, 'eroare echipa: echipa ' || v_id_echipa_curenta ||
                ' are deja 5 jucatori inregistrati in runda ' || v_linii_de_procesat(i).v_id_runda);
END IF;
END LOOP;

        v_linii_de_procesat.DELETE;
END AFTER STATEMENT;
END;
/


REM *** trigger STATISTICI_INDIVIDUALE update ************
REM in cadrul unei runde, ar trebui sa existe statistici *
REM cumulate doar de la maxim 2 echipe, iar fiecare      *
REM echipa sa aiba maxim 5 intrari diferite de jucatori  *
REM ******************************************************

CREATE OR REPLACE TRIGGER trg_statistici_individuale_update
BEFORE UPDATE ON statistici_individuale
                  FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20027, 'eroare: nu este permisa modificarea datelor unei statistici deja salvate');
END;
/


REM *** trigger STATISTICI_INDIVIDUALE consistenta **********
REM row level: headshots <= kills                           *
REM statement level: suma kills <= suma deaths, daca exista *
REM intrari pentru toti cei 10 jucatori                     *
REM *********************************************************

CREATE OR REPLACE TRIGGER trg_statistici_individuale_consistenta_insert
    FOR INSERT ON statistici_individuale
    COMPOUND TRIGGER

    TYPE t_runde_afectate IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    v_runde t_runde_afectate;

    AFTER EACH ROW IS
        v_idx PLS_INTEGER;
BEGIN
        IF :NEW.headshots > :NEW.kills THEN
            RAISE_APPLICATION_ERROR(-20028, 'eroare logica joc: numarul de headshot-uri (' || :NEW.headshots ||
            ') nu poate fi mai mare decat numarul de kill-uri (' || :NEW.kills || ')');
END IF;

        IF :NEW.kills > 0 AND :NEW.damage = 0 THEN
            RAISE_APPLICATION_ERROR(-20029, 'eroare logica joc: jucatorul are ' || :NEW.kills ||
            ' kill-uri, dar nu are damage inregistrat');
END IF;

        v_idx := v_runde.COUNT + 1;
        v_runde(v_idx) := :NEW.id_runda;
END AFTER EACH ROW;

    AFTER STATEMENT IS
        v_total_kills  NUMBER;
        v_total_deaths NUMBER;
        v_player_count NUMBER;
BEGIN
        IF v_runde.COUNT > 0 THEN
            FOR i IN 1..v_runde.COUNT LOOP
SELECT COUNT(*) INTO v_player_count
FROM statistici_individuale
WHERE id_runda = v_runde(i);

IF v_player_count = 10 THEN
SELECT SUM(kills), SUM(died)
INTO v_total_kills, v_total_deaths
FROM statistici_individuale
WHERE id_runda = v_runde(i);

IF v_total_kills > v_total_deaths THEN
                        RAISE_APPLICATION_ERROR(-20030, 'eroare consistenta runda ' || v_runde(i) || ': totalul de kill-uri ' ||
                        v_total_kills || ' il depaseste pe cel al death-urilor ' || v_total_deaths);
END IF;
END IF;
END LOOP;
END IF;

        v_runde.DELETE;
END AFTER STATEMENT;
END;
/


REM *** trigger MEMBRI insert/update varsta **********
REM un membru trebuie sa aiba minim 16 ani impliniti *
REM la momentul inregistrarii in baza de date        *
REM **************************************************

CREATE OR REPLACE TRIGGER trg_membri_insert
BEFORE INSERT OR UPDATE OF data_nastere ON membri
    FOR EACH ROW
BEGIN
    IF :NEW.data_nastere IS NOT NULL THEN
        IF ADD_MONTHS(:NEW.data_nastere, 16 * 12) > TRUNC(SYSDATE) THEN
            RAISE_APPLICATION_ERROR(-20031, 'eroare varsta: membrul trebuie sa aiba minim 16 ani impliniti, data ' ||
            TO_CHAR(:NEW.data_nastere, 'DD-MM-YYYY') || ' este invalida');
END IF;

        IF :NEW.data_nastere > TRUNC(SYSDATE) THEN
             RAISE_APPLICATION_ERROR(-20032, 'eroare logica: data nasterii nu poate fi in viitor');
END IF;
END IF;
END;
/


REM *** trigger LMD la nivel de comanda *********************
REM sunt inregistrate interventiile asupra tabelului ECHIPE *
REM *********************************************************

CREATE OR REPLACE TRIGGER trg_audit_echipe
AFTER INSERT OR UPDATE OR DELETE ON echipe
DECLARE
v_tip_op VARCHAR2(20);
BEGIN
    IF INSERTING THEN
        v_tip_op := 'INSERT';
    ELSIF UPDATING THEN
        v_tip_op := 'UPDATE';
    ELSIF DELETING THEN
        v_tip_op := 'DELETE';
END IF;

INSERT INTO log_audit_echipe (utilizator, data_actiune, tip_operatie)
VALUES (NVL(SYS_CONTEXT('USERENV', 'CLIENT_IDENTIFIER'), USER), SYSDATE, v_tip_op);
END;
/


REM *** trigger LDD *******************************************************
REM pastrarea integritatii schemei: nu sunt permise modificari pe anumite *
REM tabele critice toate modificarile (si incercarile de modificari)      *
REM sunt inregistrate in tabelul ISTORIC_MOD_SCHEMA                       *
REM ***********************************************************************

CREATE OR REPLACE TRIGGER trg_protectie_schema
BEFORE DDL ON SCHEMA
DECLARE
v_operatie  VARCHAR2(30);
    v_obiect    VARCHAR2(30);
    v_tip       VARCHAR2(30);
BEGIN
    v_operatie := ora_sysevent;
    v_obiect   := ora_dict_obj_name;
    v_tip      := ora_dict_obj_type;

    IF v_obiect IN ('ECHIPE', 'MEMBRI', 'MECIURI', 'ISTORIC_CONTRACTE', 'INSTANTE_MECI_HARTA') THEN
        IF v_operatie = 'DROP' THEN
            RAISE_APPLICATION_ERROR(-20005, 'acces interzis: nu se poate sterge tabelul critic ' || v_obiect);
        ELSIF v_operatie IN ('ALTER', 'TRUNCATE') THEN
            RAISE_APPLICATION_ERROR(-20006, 'acces interzis: nu se poate modifica tabelul critic' || v_obiect);
END IF;
END IF;

INSERT INTO istoric_mod_schema (user_oracle, data_eveniment, tip_eveniment, nume_obiect, tip_obiect)
VALUES (USER, SYSDATE, v_operatie, v_obiect, v_tip);
END;
/
