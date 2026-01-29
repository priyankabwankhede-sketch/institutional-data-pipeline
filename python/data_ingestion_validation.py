
#Load CSV file

from google.colab import files

uploaded = files.upload()  # choose all 3 CSV files

import pandas as pd

# Load enrollment dataset
df = pd.read_csv("enrollment_raw.csv")

# Validation results list
validation_results = []

# 1️Null check
null_counts = df.isnull().sum()
validation_results.append(("Null Check", null_counts.to_dict()))

# 2️Duplicate check
dupes = df.duplicated().sum()
validation_results.append(("Duplicate Rows", dupes))

# 3️Range check (credits should be 0–6)
invalid_credits = df[(df["credits"] < 0) | (df["credits"] > 6)]
validation_results.append(("Invalid Credits", len(invalid_credits)))

# Print validation summary
print("Validation Results:")
for check, result in validation_results:
    print(f"{check}: {result}")

# Clean dataset
df_clean = df[(df["credits"] >= 0) & (df["credits"] <= 6)]
df_clean.to_csv("enrollment_processed.csv", index=False)
print("Cleaned dataset saved as enrollment_processed.csv")

# Download cleaned dataset
files.download("enrollment_processed.csv")


