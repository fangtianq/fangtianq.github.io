create or replace FUNCTION    randUpdateJoin_A0111B_A0114B
return varchar2
is
    num number := 1;
    alla00num  number;
    v_a00  varchar2(200);
    res  number;
begin
    select count(1) into alla00num from a01;

    while num < alla00num
    loop
        select a00 into v_a00
          from (select t.a00, rownum as rn
            from a01 t
           order by a00 desc)
         where rn = num;
        update a01 set A0111B=(SELECT dmcod FROM ZB01 where YESPRV = 1 and ISCANUSE = 1 ORDER BY sys_guid_name() LIMIT 1) where  A0111B is not NULL AND a00=v_a00;
		update a01 set A0114B=(SELECT dmcod FROM ZB01 where YESPRV = 1 and ISCANUSE = 1 ORDER BY sys_guid_name() LIMIT 1) where  A0114B is not NULL AND a00=v_a00;
    num := num + 1;
    end loop;
return res;
end;

select randUpdateJoin_A0111B_A0114B();

commit;