import pickle

class Predictor:
    def __init__(self, model_path):
        with open(model_path, 'rb') as f:
            self.model = pickle.load(f)

    def predict(self, features):
        # features: dict of feature_name: value
        # Adjust this to match your model's expected input
        feature_values = [features[k] for k in sorted(features.keys())]
        return int(self.model.predict([feature_values])[0])