import pandas as pd

clients = pd.read_csv("clients.csv")
transactions = pd.read_csv("transactions.csv")
countries_risk = pd.read_csv("countries_risk.csv")

# Join tables
df = transactions.merge(clients, on="client_id")
df = df.merge(countries_risk, on="country", how="left")

# Define rules
suspicious = df[
    (df['is_pep'] == True) |
    (df['is_sanctioned'] == True) |
    (df['risk_level'] == 'High') |
    (df['amount'] > 40000)
]

suspicious.to_csv("flagged_transactions.csv", index=False)
print("Suspicious transactions saved to flagged_transactions.csv")
