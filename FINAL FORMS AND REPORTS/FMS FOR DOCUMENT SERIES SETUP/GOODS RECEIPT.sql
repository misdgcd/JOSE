-- GET Warehouse
DECLARE @whse VARCHAR(30)
	SELECT @whse = LEFT($[$13.15.0] , 6) 
	DECLARE @docSeries INT,	@col VARCHAR(100)	
	
		IF $[$1.0.0] = 'Add'
			BEGIN  
				SELECT @docSeries = (SELECT COUNT(*) + 1 FROM OIGN TA WHERE LEFT(TA.U_DocSeries, CHARINDEX('-', TA.U_DocSeries) - 1) = @whse)
				SELECT @whse + '-' + FORMAT(@docSeries,'000000000')
			END
		ELSE 
			BEGIN
				SELECT $[$U_DocSeries.0.0]		
			END 
-- RETURN FINAL OUTPUT --
SELECT @whse + '-' + FORMAT(@docSeries,'000000000')

		--- match series with whse
			IF 
			(SELECT LEFT(T0.U_DocSeries, 6)  FROM OIGN T0 WHERE T0.[DocNum]=@list_of_cols_val_tab_del) 
			<>
			(SELECT DISTINCT LEFT(T0.WhsCode, 6)  FROM IGN1 T0 WHERE T0.Docentry=@list_of_cols_val_tab_del)
				BEGIN
					SET @error=5901
					SET @error_message ='Series Store & Document Warehouse does not Match.'
				END
			IF (SELECT LEFT(T0.U_DocSeries, 6)  FROM OIGN T0 WHERE T0.[DocNum]=@list_of_cols_val_tab_del) IS NULL
			BEGIN
				SET @error=5902
				SET @error_message ='Empty Series Number not Allowed'
			END

	 		IF EXISTS (SELECT T0.U_DOCSERIES FROM OIGN T0 WHERE T0.DocNum=@list_of_cols_val_tab_del AND T0.U_DocSeries IN (SELECT U_DocSeries FROM OIGN WHERE DocNum<>@list_of_cols_val_tab_del))
			BEGIN
				SET @error=5903
				SET @error_message ='Series Number Already Exists!'
			END