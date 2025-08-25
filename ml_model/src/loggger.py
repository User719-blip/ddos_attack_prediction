import logging

logging.basicConfig(
    level=logging.DEBUG,
    format="%(asctime)s %(levelname)s %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
    filename="ml_model\\logs\\ML_model_logs.log",
    filemode='a'
)
def get_logger(name: str):
    return logging.getLogger(name) 