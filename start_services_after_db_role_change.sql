-- Trigger managing the services
create or replace trigger start_services_after_db_role_change after db_role_change on database
declare
  db_role varchar2(16);
  db_mode varchar2(20);
  v_code  number;
  v_errm  varchar2(64);
  cnt     number;
  srvname varchar2(20);
begin
--
-- Depending on database role starts relevant services
--
  select database_role, open_mode into db_role, db_mode from v$database;

  if db_role = 'PRIMARY' then
    srvname := 'LABDGRW';
    select count(1) into cnt from v_$active_services where NETWORK_NAME = srvname;
    if cnt = 0 then
      sys.dbms_system.ksdwrt(3,'Starting service '||srvname);
      dbms_service.start_service(srvname);
    end if;

    srvname := 'LABDGRO';
    select count(1) into cnt from v_$active_services where NETWORK_NAME = srvname;
    if cnt = 1 then
      sys.dbms_system.ksdwrt(3,'Stopping service '||srvname);
      dbms_service.stop_service(srvname);
    end if;

  elsif (db_role = 'PHYSICAL STANDBY') and (db_mode = 'READ ONLY') then
    srvname := 'LABDGRO';
    select count(1) into cnt from v_$active_services where NETWORK_NAME = srvname;
    if cnt = 0 then
      sys.dbms_system.ksdwrt(3,'Starting service '||srvname);
      dbms_service.start_service(srvname);
    end if;

    srvname := 'LABDGRW';
    select count(1) into cnt from v_$active_services where NETWORK_NAME = srvname;
    if cnt = 1 then
      sys.dbms_system.ksdwrt(3,'Stopping service '||srvname);
      dbms_service.stop_service(srvname);
    end if;
  else
    sys.dbms_system.ksdwrt(3,'DATABASE_ROLE is '||db_role);
  end if;

  exception
    when others then
      v_code := SQLCODE;
      v_errm := SUBSTR(SQLERRM, 1, 64);
      DBMS_OUTPUT.PUT_LINE('Error code ' || v_code || ': ' || v_errm);
      raise;
end;
/
