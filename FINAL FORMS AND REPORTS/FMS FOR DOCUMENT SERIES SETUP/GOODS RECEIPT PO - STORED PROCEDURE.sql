		IF 
			(SELECT LEFT(T0.U_DocSeries, 6)  FROM OPDN T0
			WHERE T0.[DocNum]=@list_of_cols_val_tab_del) 
			<>
			(SELECT DISTINCT LEFT(T0.WhsCode, 6)  FROM PDN1 T0
			WHERE T0.Docentry=@list_of_cols_val_tab_del)
				BEGIN
					SET @error=201
					SET @error_message ='Series Store & Document Warehouse does not Match.'
				END
		IF (SELECT LEFT(T0.U_DocSeries, 6)  FROM OPDN T0 WHERE T0.[DocNum]=@list_of_cols_val_tab_del) IS NULL
			BEGIN
				SET @error=202
				SET @error_message ='Empty Series Number not Allowed'
			END
		IF EXISTS (SELECT T0.U_DOCSERIES FROM OPDN T0 WHERE T0.DocNum=@list_of_cols_val_tab_del AND T0.U_DocSeries IN (SELECT U_DocSeries FROM OPDN WHERE DocNum<>@list_of_cols_val_tab_del))
			BEGIN
				SET @error=203
				SET @error_message ='Series Number Already Exists!'