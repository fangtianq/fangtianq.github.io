
drop function if exists createDefaultPersonDir;
CREATE  FUNCTION     createDefaultPersonDir (A00 varchar(100))
returns text
begin
  DECLARE file_recordid  varchar(100);
  DECLARE re_recordid  varchar(100);
  DECLARE time_str  varchar(100);
  DECLARE v_name  varchar(100);
  set file_recordid=concat(left(GET_UUID(),24),'defaultdirry');
  set re_recordid=concat(left(GET_UUID(),24),'defaultdirry');
  set v_name = '工作实绩';
  set time_str = '2022-03-24 00:00:00';
    INSERT INTO Dept() VALUES
    ();
  return A00;
end;


drop function if exists deleteDefaultPersonDir;
CREATE  FUNCTION     deleteDefaultPersonDir (A00 varchar(100))
returns text
begin
    delete from Dept where FID=A00 and RECORDID like '%defaultdirry%';
    return A00;
end;

drop function if exists createDefaultPersonDirAll;
CREATE  FUNCTION     createDefaultPersonDirAll ()
returns text
begin
    DECLARE alla00  longtext;
    DECLARE v_a00  text;
    DECLARE res  text;
    select group_concat(a00) into alla00 from a01;
    while alla00 !='' do
        set v_a00 = SUBSTRING_INDEX(alla00,',',1);
        set alla00 =substr(alla00,length(v_a00)+2);
        select createDefaultPersonDir(v_a00) into res;
    end while;
return res;
end;

drop function if exists deleteDefaultPersonDirAll;
CREATE  FUNCTION     deleteDefaultPersonDirAll ()
returns text
begin
    delete from Dept where RECORDID like '%defaultdirry%';
return 'success';
end;


select createDefaultPersonDirAll();


commit;


/**

测试：

select createDefaultPersonDir('E0F13F71');
select deleteDefaultPersonDir('E0F13F71');
-- select createDefaultPersonDirAll();
-- select deleteDefaultPersonDirAll();


**/