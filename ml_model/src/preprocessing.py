import pandas as pd
from sklearn.preprocessing import StandardScaler, LabelEncoder
from loggger import get_logger
class PreProcessedData:
    @staticmethod
    def pre_process():
        logg= get_logger(__name__)
        try:
            data = pd.read_parquet("ml_model//data//combined_dataset.parquet")
            data = data.dropna()
            label= data["Label"].unique()
            nLabel= data["Label"].nunique()
            data=data.drop(columns=["Flow ID1", "Src IP", "Dst IP", "Src Port", "Dst Port", "Timestamp"],errors='ignore')
            print(data.columns)
            logg.info("helllo2")
            return data
        except Exception as e:
            logg.error("An error occurred",e)
pre=PreProcessedData.pre_process()

