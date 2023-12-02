import pandas as pd

def sales_analysis(sales: pd.DataFrame, product: pd.DataFrame) -> pd.DataFrame:
    df = sales.groupby("product_id")["quantity"].sum().reset_index() .rename(columns={"quantity": "total_quantity"})
    return df
