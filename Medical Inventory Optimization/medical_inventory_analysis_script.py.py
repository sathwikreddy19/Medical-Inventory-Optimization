import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Optional: Plot settings
sns.set(style="whitegrid")
## Load Dataset
# Update path if different
file_path = "Cleaned_Medical_Inventory_Data (1).xlsx"
df = pd.read_excel(file_path)
df.head()
## Generate Data Dictionary
data_dict = pd.DataFrame({
    "Column Name": df.columns,
    "Data Type": [str(df[col].dtype) for col in df.columns],
    "Non-Null Count": [df[col].notnull().sum() for col in df.columns],
    "Null Count": [df[col].isnull().sum() for col in df.columns],
    "Unique Values": [df[col].nunique() for col in df.columns]
})

data_dict.to_excel("Data_Dictionary_Output.xlsx", index=False)
data_dict
## Basic EDA Summary
df.describe(include="all").T
## Sales by Department
plt.figure(figsize=(12, 6))
sns.barplot(data=df, x='Department', y='Total_Amount', estimator=sum, ci=None)
plt.xticks(rotation=45)
plt.title('Total Sales by Department')
plt.ylabel("Total Sales (₹)")
plt.tight_layout()
plt.show()
## Monthly Sales Trend
df['Bill_Date'] = pd.to_datetime(df['Bill_Date'])
df['Month'] = df['Bill_Date'].dt.to_period('M').astype(str)

monthly_sales = df.groupby('Month')['Total_Amount'].sum().reset_index()

plt.figure(figsize=(12, 6))
sns.lineplot(data=monthly_sales, x='Month', y='Total_Amount', marker="o")
plt.xticks(rotation=45)
plt.title("Monthly Sales Trend")
plt.ylabel("Total Sales (₹)")
plt.tight_layout()
plt.show()
