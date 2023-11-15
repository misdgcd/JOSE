DECLARE @whse VARCHAR(30)
SELECT @whse = LEFT($[$13.15.0] , 6) 
DECLARE @docSeries INT
DECLARE @col VARCHAR(100)	
	IF $[$1.0.0] = 'Add'
		BEGIN  
			SELECT @docSeries = (SELECT COUNT(*) + 1 FROM OIGE TA WHERE LEFT(TA.U_DocSeries, CHARINDEX('-', TA.U_DocSeries) - 1) = @whse)
			SELECT @whse + '-' + FORMAT(@docSeries,'000000000')
		END
	ELSE IF($[$1.0.0] = 'Update' OR $[$1.0.0] = 'Ok')
		BEGIN
			SELECT $[$U_DocSeries.0.0]		
		END

--		TRIGGERS
----		REMARKS 
----		REASON CODE