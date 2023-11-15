-- GET Warehouse
DECLARE @whse VARCHAR(30)
	SELECT
		@whse = LEFT($[$23.5.0] , 6) 
--GET MAX SERIES BASED ON TENDER TYPE -- 
	DECLARE @docSeries INT,	@col VARCHAR(100)	
	
	IF EXISTS(SELECT * FROM OWTQ WHERE U_DocSeries LIKE '%'+@whse+'%') 
		BEGIN
			SELECT @docSeries = (SELECT COUNT(*) + 1 FROM OWTQ TA WHERE LEFT(TA.U_DocSeries, CHARINDEX('-', TA.U_DocSeries) - 1) = @whse)
		END 
	ELSE 
		BEGIN
			SELECT @docSeries = 1
		END
-- RETURN FINAL OUTPUT --
SELECT @whse + '-' + FORMAT(@docSeries,'000000000')