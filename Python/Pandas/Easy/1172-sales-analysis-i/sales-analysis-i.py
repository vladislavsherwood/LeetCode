import pandas as pd

def sales_analysis(product: pd.DataFrame, sales: pd.DataFrame) -> pd.DataFrame:
    df = sales
    grouped = df.groupby("seller_id")["price"].sum().reset_index()
    best_seller = grouped[grouped["price"] == grouped["price"].max()][["seller_id"]]
    return best_seller
