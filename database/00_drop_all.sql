-- 00_drop_all.sql
-- This script completely wipes the current schema (tables, constraints, triggers, and packages)
-- so you can cleanly run 01 through 04 without any conflicts.

SET SERVEROUTPUT ON;

-- 1. Drop the schema protection trigger first so we are allowed to drop tables!
BEGIN
   EXECUTE IMMEDIATE 'DROP TRIGGER trg_protectie_schema';
EXCEPTION WHEN OTHERS THEN NULL; -- Ignore if it doesn't exist
END;
/

-- 2. Drop all tables with CASCADE CONSTRAINTS
BEGIN
   FOR t IN (SELECT table_name FROM user_tables) LOOP
      EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS';
      DBMS_OUTPUT.PUT_LINE('Dropped table: ' || t.table_name);
   END LOOP;
END;
/

-- 3. Drop all remaining sequences (Oracle automatically creates sequences for IDENTITY columns, but just to be safe)
BEGIN
   FOR s IN (SELECT sequence_name FROM user_sequences) LOOP
      EXECUTE IMMEDIATE 'DROP SEQUENCE ' || s.sequence_name;
   END LOOP;
END;
/

-- 4. Drop the PL/SQL Package
BEGIN
    EXECUTE IMMEDIATE 'DROP PACKAGE pkg_hltv';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

PROMPT "Schema cleanup complete! You can now run 01, 02, 03, and 04."