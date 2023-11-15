DECLARE @whse VARCHAR(30)
SELECT @whse = LEFT($[$38.24.0] , 6) 
DECLARE @docSeries INT,	@col VARCHAR(100)	

		IF ($[$1.0.0] <> 'Update' and $[$1.0.0] <> 'Ok')
			BEGIN  
				SELECT @docSeries = (SELECT COUNT(*) + 1 FROM OPDN TA WHERE LEFT(TA.U_DocSeries, CHARINDEX('-', TA.U_DocSeries) - 1) = @whse)
				SELECT @whse + '-' + FORMAT(@docSeries,'000000000')
			END
		ELSE 
			BEGIN
				SELECT $[$U_DocSeries.0.0]		
			END

--		TRIGGERS
----		REMARKS
----		ACTUAL LOCATION RECEIVED
----		GOODS RETURN REQUEST DOC. NO.