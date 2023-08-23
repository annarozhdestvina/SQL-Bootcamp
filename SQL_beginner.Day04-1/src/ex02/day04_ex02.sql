CREATE VIEW v_generated_dates AS
SELECT generate_series(timestamp '2022-01-01', '2022-01-31', '1 day') 
:: DATE AS generated_date
order by generated_date;

select * from v_generated_dates;