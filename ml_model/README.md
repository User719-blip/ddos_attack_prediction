# 📄 README

**📅 Date:** 27/08/25  

---

### 📂 Step 1: Dataset  
At first I saved the Kaggle data of **DDoS attack** in: ...ml_model\data\combined_dataset.parquet


---

### 📝 Step 2: Files Created  
In the second step I made **logger file** and **preprocessor.py** file in the `src` directory.  

- ⚙️ **Logger file** → helps to debug the code easily (as suggested by Mr. Aryan).  
- 🧹 **Preprocessor file** → helps us to process data by:  
  - 📥 Loading it from the data directory  
  - 🗑️ Dropping null values  
  - 🏷️ Defining attributes like:  
    - **labels** → how many types of attacks are in the dataset  
    - **n_labels** → number of these labels (may be used later)  
  - ✂️ Dropping columns that would not contribute to model training:  
    ```
    ["Flow ID", "Src IP", "Dst IP", "Src Port", "Dst Port", "Timestamp"]
    ```
    *(They may still be useful later for heatmaps or other analysis.)*  
  - 📨 Finally, logging and returning data to the **log file** and **model.py** file respectively.  

---

✅ This forms the **initial setup of the project**:  
- Data is cleaned  
- Attributes are defined  
- Unnecessary columns are removed  
- The whole process is logged for debugging and reference  


