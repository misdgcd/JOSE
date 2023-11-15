-- GET Warehouse
DECLARE @whse VARCHAR(30)

	SELECT
		@whse = LEFT($[$38.24.0] , 6) 

--GET MAX SERIES BASED ON TENDER TYPE -- 
	DECLARE @docSeries INT,	@col VARCHAR(100)	
	
	IF EXISTS(SELECT * FROM OPRR WHERE U_DocSeries LIKE '%'+@whse+'%') 
		BEGIN
			SELECT @docSeries = (SELECT COUNT(*) + 1 FROM OPRR TA WHERE LEFT(TA.U_DocSeries, CHARINDEX('-', TA.U_DocSeries) - 1) = @whse)
		END 
	ELSE 
		BEGIN
			SELECT @docSeries = 1
		END
-- RETURN FINAL OUTPUT --
SELECT @whse + '-' + FORMAT(@docSeries,'000000000')


		--To Match Whse details to Series number
		IF 
			(SELECT LEFT(T0.U_DocSeries, 6)  FROM OPRR T0
			WHERE T0.[DocNum]=@list_of_cols_val_tab_del) 
			<>
			(SELECT DISTINCT LEFT(T0.WhsCode, 6)  FROM PRR1 T0
			WHERE T0.Docentry=@list_of_cols_val_tab_del)
				BEGIN
					SET @error=10
					SET @error_message ='Series Store & Document Warehouse does not Match.'
				END
		IF (SELECT LEFT(T0.U_DocSeries, 6)  FROM OPRR T0 WHERE T0.[DocNum]=@list_of_cols_val_tab_del) IS NULL
			BEGIN
				SET @error=059
				SET @error_message ='Empty Series Number not Allowed'
			END
		--//To Match Whse details to Series number
