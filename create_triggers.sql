-----------------------------------------------------------
--        Script - Advanced Database
--  Made by Paul William CREPIN and Timothée Marguier
-------------------------------------------------------------

-------------------------------------------------------------
-- Création de 5 triggers
-- Pour ajouter une réduction
-- Vérifier la promotion
-- coup du ticket si les sièges sont disponibles
-- coup de déplacement, si on a un cout ou non
-- Nom de la personne
-------------------------------------------------------------
DROP TRIGGER discount_add;
DROP TRIGGER discount_verif;
DROP TRIGGER ticket_cost;
DROP TRIGGER cout_travel;
DROP TRIGGER booking_username;

---------------------------------------
-- Si un ticket possède reduced_reference_rate avec un de ces critères, il aura une réduction de 20%
---------------------------------------
CREATE TRIGGER discount_add
before insert on Ticket
for each row
begin
    SELECT t.reduced_reference_rate FROM Ticket t
    if ((:t.reduced_reference_rate!='children') or  (:t.reduced_reference_rate!='students') or (:t.reduced_reference_rate!='unemployed') or (:new.reduced_reference_rate!='elderly')) then
-- permet de générer une ligne entière dans le tampon. Un caractère fin de ligne est automatiquement ajouté en fin de ligne
        t.price = t.price-(1*20/100)*t.price;
        dbms_output.put_line('Price reducted');
    end if;
end;
/

---------------------------------------
-- Si les discounts sont différentes de nos critères alors ça retourne une érreure
---------------------------------------
CREATE TRIGGER discount_verif
Declare
Select * From Ticket
before insert on Ticket

FOR EACH ROW
BEGIN
    if ((t.reduced_reference_rate ='children') or  (reduced_reference_rate='students') or (reduced_reference_rate='unemployed') or (reduced_reference_rate ='elderly')) then
-- permet de générer une ligne entière dans le tampon. Un caractère fin de ligne est automatiquement ajouté en fin de ligne
        dbms_output.put_line('erreur');
    end if;
end;
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
  select seat_number INTO seat FROM Performance_Seat
   then 1
    else 0
    end  into result
  from dual;

   if result = 1
     then
     --- Si c'est disponible, un message est renvoyé possible
       DBMS_OUTPUT.put_line('SEAT AVAILABLE');
     else
          --- Si c'est indisponible, un message est renvoyé
       DBMS_OUTPUT.put_line('SEAT ALREADY TAKEN');
     end if;

---------------------------------------
-- Vérification cout de travel
---------------------------------------

CREATE TRIGGER cout_travel
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
