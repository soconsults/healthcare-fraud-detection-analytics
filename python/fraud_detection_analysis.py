import pandas as pd

# Load data
df = pd.read_csv('../data/claims_data.csv')

# Identify suspicious claims
threshold = df['claim_amount'].mean() * 2

suspicious_claims = df[df['claim_amount'] > threshold]

print("Suspicious Claims:")
print(suspicious_claims)

# Provider risk scoring
provider_risk = df.groupby('provider_id')['claim_amount'].agg(['count','sum','mean'])

provider_risk['risk_score'] = provider_risk['sum'] / provider_risk['count']

print("\nProvider Risk Scores:")
print(provider_risk.sort_values('risk_score', ascending=False))
