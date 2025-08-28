from preprocessing import PreProcessedData
processedData=PreProcessedData()
pdata=processedData.pre_process()
numeric_cols=pdata.select_dtypes(include=["int64",'float64']).columns
print(pdata.dtypes.value_counts())