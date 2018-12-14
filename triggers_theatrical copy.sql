REM ***********************************************************************
PROMPT ************************ Creation des Triggers **********************
REM ***********************************************************************
PROMPT
drop trigger chk_travel_cost;
drop trigger chk_reference_rate;
drop trigger chk_discount;
drop trigger chk_town_council;
drop trigger chk_sponsor;
drop trigger budget_production_costs;
drop trigger budget_travel_costs;
drop trigger balance_theater;

-- ======================================================================
PROMPT ******************** Trigger: chk_travel_cost ******************************                                            
-- ======================================================================
PROMPT
-- Trigger to test that the travel cost = 0 if the theater where the show will be performed belongs to the company --
create trigger chk_travel_cost
before insert on represented
for each row
begin
    for x in (select t.company_id from theater t where t.theater_id=:new.theater_id)
    loop
        if (:new.company_id = x.company_id) then 
            :new.travel_costs:=0;
        end if;
    end loop;
end;
/

PROMPT
pause Tapez sur Enter...
PROMPT

-- ======================================================================
PROMPT ******************** Trigger: chk_reference_rate ******************************                                            
-- ======================================================================
PROMPT
-- Trigger to test that the reference_rate is "normal" or "reduced" --

create trigger chk_reference_rate
before insert on Ticket
for each row
begin
    if (:new.reference_rate='normal') then
        dbms_output.put_line('normal price');
    else
        if (:new.reference_rate='reduced') then
            dbms_output.put_line('reduced price !');
            :new.price:=:new.price-(:new.price*0.5);
        else
            :new.reference_rate:='???';
        end if;
    end if;
end;
/

PROMPT
pause Tapez sur Enter...
PROMPT

-- ======================================================================
PROMPT ******************** Trigger: chk_discount ******************************                                            
-- ======================================================================
PROMPT
-- Trigger to set the discount price --
-- whether the room is filled with less than 50%,  ? more preferably, a 50% discount if the room is filled with less than 30%. --

create trigger chk_discount
after update on dates
for each row
begin
    update ticket t
        set t.price = case
            when t.dates-dates=0 and (select count(*) from ticket t2 where t2.show_id=t.show_id)/(select th.fixed_capacity from theater th where th.theater_id=t.theater_id)<0.3 then t.price-(t.price*0.5)
            when t.dates-dates=0 and (select count(*) from ticket t2 where t2.show_id=t.show_id)/(select th.fixed_capacity from theater th where th.theater_id=t.theater_id)<0.5 then t.price-(t.price*0.3)
            when t.dates-dates<15 then t.price-(t.price*0.2)
        end;
end;
/

PROMPT
pause Tapez sur Enter...
PROMPT

-- ======================================================================
PROMPT ******************** Trigger: chk_town_council ******************************                                            
-- ======================================================================
PROMPT
-- Trigger to check if the town council is giving for a duration over than 5 years --
-- town council is engaged to give a certain amount every month over 5 years --
-- to do EVERY MONTH --

create trigger chk_town_council
before insert on grants
for each row
begin
    if (:new.agency='town council') then
        if (:new.durations<5) then
            :new.durations:=5;
        end if;
        if (:new.n_don<60) then
            :new.n_don:=60;
        end if;
    end if;        
end;
/

PROMPT
pause Tapez sur Enter...
PROMPT

-- ======================================================================
PROMPT ******************** Trigger: chk_sponsor ******************************                                            
-- ======================================================================
PROMPT
-- Trigger to check if the Sponsor is only giving 1 donation --

create trigger chk_sponsor
before insert on grants
for each row
begin
    if (:new.agency='sponsor') then
        :new.durations:=0;
        if (:new.n_don>1) then
            :new.n_don:=1;
        end if;
    end if;
end;
/

PROMPT
pause Tapez sur Enter...
PROMPT

-- ======================================================================
PROMPT ******************** Trigger: budget_production_costs ******************************                                            
-- ======================================================================
PROMPT
-- When there is a productions_costs calculate the company budget --

create trigger budget_production_costs
after insert on produces
for each row
begin
    update company c set c.budget = c.budget-:new.production_costs where c.company_id=:new.company_id;
    -- update company c set c.budget = c.budget-(select sum(p.production_costs) from produces p where p.company_id=c.company_id); --
end;
/

PROMPT
pause Tapez sur Enter...
PROMPT

-- ======================================================================
PROMPT ******************** Trigger: budget_travel_costs ******************************                                            
-- ======================================================================
PROMPT
-- When there is a travel_costs, calculate the company budget --

create trigger budget_travel_costs
after insert on represented
for each row
begin
    update company c set c.budget = c.budget-:new.travel_costs where c.company_id in (select p.company_id from produces p where p.show_id=show_id);
    -- update company c set c.budget = c.budget-(select sum(r.travel_costs) from represented r where r.show_id=show_id);  --
end;
/

PROMPT
pause Tapez sur Enter...
PROMPT

-- ======================================================================
PROMPT ******************** Trigger: balance_theater ******************************                                            
-- ======================================================================
PROMPT
-- Calculate the balance of each theater every month --

create trigger balance_theater
before update on dates
for each row
begin
    -- On supposera que chaque mois = 30 jours
    if (MOD(:new.dates,30) = 0) then
        -- t.balance + ticket revenues - price of hosting show --
        update theater t set t.balance = t.balance + (select sum(ti.price) from ticket ti where ti.theater_id=t.theater_id) - (select sum(h.global_price) from hosts h where h.theater_id=t.theater_id);
    end if;
end;
/

PROMPT
pause Tapez sur Enter...
PROMPT


REM **************************************************************************

REM **************************************************************************
        
COMMIT;
