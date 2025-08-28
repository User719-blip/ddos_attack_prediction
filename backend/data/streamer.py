import pandas as pd

class DataStreamer:
    def __init__(self, csv_path):
        self.df = pd.read_csv(csv_path)
        self.index = 0

    def get_next(self):
        if self.index < len(self.df):
            row = self.df.iloc[self.index].to_dict()
            self.index += 1
            return row
        return None