import pandas as pd

def find_customers(customers: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:
    merged_df = pd.merge(customers, orders, how='left', left_on='id', right_on='customerId')
    customers_without_orders = merged_df[merged_df['customerId'].isna()].rename(columns={"name" : "Customers"})
    res = customers_without_orders[['Customers']]
    return res
