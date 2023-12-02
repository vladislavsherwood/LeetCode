import pandas as pd

def sales_person(SalesPerson: pd.DataFrame, Company: pd.DataFrame, Orders: pd.DataFrame) -> pd.DataFrame:
    red_company_ids = Company[Company["name"] == "RED"]["com_id"].tolist()
    red_sales_ids = Orders[Orders["com_id"].isin(red_company_ids)]["sales_id"].tolist()
    merged = pd.merge(SalesPerson,Orders,on="sales_id",how="outer")
    not_red = merged[~merged["sales_id"].isin(red_sales_ids)][["name"]].drop_duplicates()
    return not_red
