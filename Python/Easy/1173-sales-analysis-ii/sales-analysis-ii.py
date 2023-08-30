import pandas as pd

def sales_analysis(product: pd.DataFrame, sales: pd.DataFrame) -> pd.DataFrame:
    df = pd.merge(product, sales, on="product_id")
    iphone = df[df["product_name"] == "iPhone"]["buyer_id"].unique()
    S8 = df[(df["product_name"] == "S8") & (~df["buyer_id"].isin(iphone))]["buyer_id"].unique()
    result = pd.DataFrame({"buyer_id": S8})
    return result
