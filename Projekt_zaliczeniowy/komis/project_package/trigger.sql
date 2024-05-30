
--Trigger przed wstawieniem nowego rekordu do tabeli faktura, 
--który automatycznie oblicza kwotę po uwzględnieniu rabatu.

CREATE OR REPLACE FUNCTION apply_discount()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.rabat IS NOT NULL THEN
        NEW.kwota := NEW.kwota - (NEW.kwota * NEW.rabat / 100);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_faktura
BEFORE INSERT ON faktura
FOR EACH ROW
EXECUTE FUNCTION apply_discount();


--Trigger przed wstawieniem nowego rekordu do tabeli kartoteka_transakcji, 
--który sprawdza, czy samochód jest gotowy do sprzedaży. Jeśli nie, wstawienie rekordu zostanie zablokowane.

CREATE OR REPLACE FUNCTION check_car_ready_for_sale()
RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT gotowy_do_sprzedaży FROM samochod WHERE id_samochod = NEW.id_samochod) = FALSE THEN
        RAISE EXCEPTION 'Samochód nie jest gotowy do sprzedaży';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_kartoteka_transakcji
BEFORE INSERT ON kartoteka_transakcji
FOR EACH ROW
EXECUTE FUNCTION check_car_ready_for_sale();
