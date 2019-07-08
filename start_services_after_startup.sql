-- Trigger managing the services
create or replace trigger start_services_prm_stby after startup on database
declare
  db_role varchar2(16);
  db_mode varchar2(20);
  v_code  number;
  v_errm  varchar2(64);
begin
--
-- primary database           LABDGRW
-- standby database read only LABDGRO
--
  select database_role, open_mode into db_role, db_mode from v$database;
  if db_role = 'PRIMARY' then
    dbms_service.start_service('LABDGRW');
    dbms_service.stop_service('LABDGRO');
  elsif (db_role = 'PHYSICAL STANDBY') and (db_mode = 'READ ONLY') then
    dbms_service.start_service('LABDGRO');
    dbms_service.stop_service('LABDGRW');
  else
    dbms_service.stop_service('LABDGRW');
    dbms_service.stop_service('LABDGRO');
  end if;

  exception
    when others then
      v_code := SQLCODE;
      v_errm := SUBSTR(SQLERRM, 1, 64);
      DBMS_OUTPUT.PUT_LINE('Error code ' || v_code || ': ' || v_errm);
      raise;
end;
/
