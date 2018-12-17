-----------------------------------------------------------
--        Script - Advanced Database
--  Made by Paul William CREPIN and Timothée Marguier
-------------------------------------------------------------
DROP TRIGGER Capacity_space; ok
DROP TRIGGER discount_add; ok
DROP TRIGGER Showcosts; ok
DROP TRIGGER budget_production_costs;

-------------------------------------------------------------
-- Trigger Capacity_space
-------------------------------------------------------------
-- Dès que l'on a un nouvelle achat de ticket, nous avons une place en moins dans notre capacité du théatre
CREATE OR REPLACE TRIGGER Capacity_space
AFTER INSERT ON Customers
FOR EACH ROW
BEGIN
    UPDATE Theater t set t.fixed_capacity = t.fixed_capacity-1;
    DBMS_OUTPUT.put_line('Un siège en moins');
    -- Dès que nous avons un nouvelle acheteur la capacité du théatre diminue
END;

---------------------------------------
-- Si un ticket possède reduced_reference_rate avec un de ces critères, il aura une réduction de 20%
---------------------------------------
CREATE OR REPLACE TRIGGER discount_add
BEFORE INSERT on Ticket
FOR EACH ROW
BEGIN
    if ((:new.reduced_reference_rate='children') OR (:t.reduced_reference_rate='student') THEN
        :new.price:=:new.price-(:new.price*0.5);
        ELSE
        dbms_output.put_line('Price with reduction');
    if ((:new.reduced_reference_rate='normal') THEN
      dbms_output.put_line('Prix normal')
    END if;
END;

-------------------------------------------------------------
-- Trigger : Grants benefice
-------------------------------------------------------------
-- Si nous avons un nouveau Grants
CREATE OR REPLACE TRIGGER Showscosts
AFTER INSERT ON Grants g
FOR EACH ROW
BEGIN
    update Company c set new.budget = c.budget - new.amount
      dbms_output.put_line('Nouveau budget, merci au sponsor');
END;


-------------------------------------------------------------
-- Trigger: budget_production_costs
-------------------------------------------------------------
-- Calcul du budget de la company en fonction des coûts
CREATE OR REPLACE TRIGGER Producition_costs_budgets
AFTER INSERT ON Produces_cost
FOR EACH ROW
BEGIN
    UPDATE Company c set c.budget = c.budget-:new.production_cost where c.company_id=:new.company_id;
END;
