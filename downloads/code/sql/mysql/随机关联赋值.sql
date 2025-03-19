drop function if exists randUpdateJoin_A0111B_A0114B;
CREATE  FUNCTION     randUpdateJoin_A0111B_A0114B()
returns text
begin
    DECLARE alla00  longtext;
    DECLARE v_a00  text;
    DECLARE res  text;
    select group_concat(a00) into alla00 from a01;
    while alla00 !='' do
        set v_a00 = SUBSTRING_INDEX(alla00,',',1);
        set alla00 =substr(alla00,length(v_a00)+2);
				update a01 set A0111B=(SELECT dmcod FROM ZB01 where YESPRV = 1 and ISCANUSE = 1 ORDER BY RAND() LIMIT 1) where  A0111B is not null and a00=v_a00;
				update a01 set A0114B=(SELECT dmcod FROM ZB01 where YESPRV = 1 and ISCANUSE = 1 ORDER BY RAND() LIMIT 1) where  A0114B is not null and a00=v_a00;
    end while;
return res;
end;


select randUpdateJoin_A0111B_A0114B();

commit;