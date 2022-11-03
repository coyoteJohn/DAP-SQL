CREATE TABLE planInformation (
	Id INTEGER PRIMARY KEY
	,contractId char(5)
	,planId char(3)
	,segmentId char(3)
	,contractName TEXT
	,planName TEXT
	,formularyId char(8)
	,premium decimal(12,4)
	,deductible decimal(12,4)
	,icl decimal(12,4)
	,snp char(1)
	,pharmacyDataSupressed char(1)
	)