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

CREATE TRIGGER age
BEFORE
