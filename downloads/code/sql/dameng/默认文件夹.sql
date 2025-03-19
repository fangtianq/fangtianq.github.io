create or replace FUNCTION createDefaultPersonDir (A00 varchar2(100))
return varchar2
is
    A00_res varchar2(100);
    file_recordid  varchar(100);
    re_recordid  varchar(100);
    time_str  varchar(100);
    v_name  varchar(100);
begin

    file_recordid :=concat(substr(GET_UUID(),1,24),'defaultdirry');
    re_recordid=concat(substr(GET_UUID(),1,24),'defaultdirry');
    v_name := '工作实绩';
    time_str := '2022-03-24 00:00:00';
    INSERT INTO DEPTANDPERSONFILE(RECORDID, FID, GROUPID, FNAME, NAMEEXT, FILEPATH, UPLOADUSERID, UPLOADUSERNAME, ISFOLDER, UPLOADTIME, UPDATETIME, DATATYPE, FILESIZE, SECRETLEVEL) VALUES
    (file_recordid, A00, '00000000-0000-0000-0000-000000000000', v_name, null, concat('\\resources\\attachment\\ResourceFile\\PersonFile\\',A00,'\\',v_name), '4F4B3367-39D5-4636-8FDE-E038C010DCC5', '管理员', 1, time_str, time_str, 1, null, null);
    INSERT INTO DeptAndPersonFile_Relation(RECORDID, FRECID, PARENTFRECID) VALUES
    (re_recordid, file_recordid, A00);
  return A00_res;
end;


create or replace FUNCTION     deleteDefaultPersonDir (A00 varchar(100))
return varchar2
is
begin
    delete from DeptAndPersonFile_Relation where PARENTFRECID=A00 and RECORDID like '%defaultdirry%';
    delete from DEPTANDPERSONFILE where FID=A00 and RECORDID like '%defaultdirry%';
    return A00;
end;


create or replace FUNCTION    createDefaultPersonDirAll
return varchar2
is
    num number := 1;
    alla00num  number;
    v_a00  varchar2(200);
    res  LONG;
begin
    select count(1) into alla00num from a01;

    while num < alla00num
    loop
        select a00 into v_a00
          from (select t.a00, rownum as rn
            from a01 t
           order by a00 desc)
         where rn = num;
        createDefaultPersonDir(v_a00);
    num := num + 1;
    end loop;
return res;
end;

create or replace FUNCTION     deleteDefaultPersonDirAll
return varchar2
is
begin
    delete from DEPTANDPERSONFILE where RECORDID like '%defaultdirry%';
return 'success';
end;



begin
   -- createDefaultPersonDir('7739731E-4106-568D-22CE-8583FAF0B462');
--    deleteDefaultPersonDir('7739731E-4106-568D-22CE-8583FAF0B462');
     createDefaultPersonDirAll();
--    deleteDefaultPersonDirAll();
end;

commit;


