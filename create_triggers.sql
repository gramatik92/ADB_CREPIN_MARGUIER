DROP TRIGGER travel_cost;
DROP TRIGGER ticket_cost;
DROP TRIGGER booking_username;


CREATE TRIGGER travel_cost
BEFORE UPDATE on Representation -- avant mise à jour
  FOR EACH ROW  -- pour chaque ligne
Declare
  produces_t NUMBER(10);
  produces_p NUMBER(10);
Begin
  SELECT t.company_id INTO produces_t FROM Theater t
  WHERE
  t.theater_id=theater_id;

  SELECT p.company_id INTO produces_p FROM Produces_cost p
  where
  p.show_id=show_id;

  if(produces_p = produces_t) then
      :new.travel_costs:=0;
  end if;
End ;
/
------------------------------------------
-- selectionner un siège si il est disponible ou non
------------------------------------------
CREATE TRIGGER ticket_cost
BEFORE CREATE on Ticket

Declare
seat boolean;
Begin
 where exists (
  select seat_number INTO seat FROM All_performance_seats
   then 1
    else 0
    end  into result
  from dual;

   if result = 1
     then
       DBMS_OUTPUT.put_line('SEAT AVAILABLE');
     else
       DBMS_OUTPUT.put_line('SEAT ALREADY TAKEN');
     end if;
------------------------------------------
-- Ajout d'un utilisateur la table
------------------------------------------
CREATE TRIGGER booking_username
AFTER INSERT
    ON Customers
    FOR EACH ROW

DECLARE
        v_username varchar2(10);
     BEGIN

        -- Find username of person performing INSERT into table
        SELECT user INTO v_username
        FROM dual;

        -- Update create_date field to current system date
        :new.create_date := date;

        -- Update created_by field to the username of the person performing the INSERT
        :new.created_by := v_username;

     END;
/

---------------------------------------

create trigger chk_reference_rate
before insert on Ticket
for each row
begin
    if ((:new.reference_rate!='normal') or  (:new.reference_rate!='reduced')) then
        dbms_output.put_line('ERROR');
    end if;
end;
/
