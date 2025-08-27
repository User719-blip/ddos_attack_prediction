import pandas as pd
from sklearn.preprocessing import StandardScaler, LabelEncoder
from loggger import get_logger
class PreProcessedData:
    def __init__(self):
        self.data = None
        self.columns_data = None
        self.labels = None
        self.n_labels = None
        self.logg = get_logger(__name__)

    def pre_process(self):   
        try:
            # data reading and droping null values
            self.data = pd.read_parquet("ml_model//data//combined_dataset.parquet")
            self.data = self.data.dropna()
            # attributes
            self.labels = self.data["Label"].unique()
            self.n_labels = self.data["Label"].nunique()
            self.columns_data = self.data.columns
            #data drop columns
            self.data = self.data.drop(
                columns=["Flow ID1", "Src IP", "Dst IP", "Src Port", "Dst Port", "Timestamp"],
                errors="ignore"
            )

            #logging
            self.logg.info("Preprocessing completed successfully.")
            print("Logged -Preprocessing completed successfully.")
            return self.data

        except Exception as e:
            self.logg.error("An error occurred while preprocessing the data: %s", e)
            return None
