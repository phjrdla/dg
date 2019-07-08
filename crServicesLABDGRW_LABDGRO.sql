-- Creation
begin
--  dbms_service.delete_service(service_name => 'LABDGRW' );
--  dbms_service.delete_service(service_name => 'LABDGRO' );
  dbms_service.create_service( service_name     => 'LABDGRW'
                              ,network_name     => 'LABDGRW'
                              ,failover_method  => dbms_service.FAILOVER_METHOD_BASIC
                              ,failover_type    => dbms_service.FAILOVER_TYPE_SELECT
                              ,failover_retries => 30
                              ,failover_delay   => 2
 );

  dbms_service.create_service( service_name     => 'LABDGRO'
                              ,network_name     => 'LABDGRO'
                              ,failover_method  => dbms_service.FAILOVER_METHOD_BASIC
                              ,failover_type    => dbms_service.FAILOVER_TYPE_SELECT
                              ,failover_retries => 30
                              ,failover_delay   => 2
 );
end;
/
-- Activation 
Begin
   dbms_service.start_service('LABDGRW');
   dbms_service.start_service('LABDGRO');
end;
/
-- Trigger managing the services
create or replace trigger set_services_prm_stby after db_role_change on database
declare
  db_role varchar2(16);
  db_mode varchar2(20);
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
end;
/


