--Create the table
CREATE TABLE driverStatus (
	driver char(3)
	,statusEvent TEXT
	,statusTime INT
	)

--Insert some events
insert into driverStatus(driver, statusEvent, statusTime) 
	values('ltu','arriveStore',1000)
		,('jcu','arriveStore',1005)
		,('ltu','enroute',1010)
		,('jju','arriveStore',1020)

insert into driverStatus values('ltu','tripEnded',1030)

-- The query
with cte_events as (
			select driver
				, case when statusEvent = 'arriveStore' then statusTime else null end as arrived
				, case when statusEvent = 'enroute' then statusTime else null end as enroute
				, case when statusEvent = 'tripEnded' then statusTime else null end as tripComplete
			from driverStatus	)
	, cte_aggregate as (
			select driver
				, max(arrived) as arrived
				, max(enroute) as enroute
				, max(tripComplete) as tripComplete
				from cte_events
				group by driver)
	select *, tripcomplete - arrived as tripDuration  from cte_aggregate