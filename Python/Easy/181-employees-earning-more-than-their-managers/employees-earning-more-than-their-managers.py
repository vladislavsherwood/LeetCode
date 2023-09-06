import pandas as pd

def find_employees(employee: pd.DataFrame) -> pd.DataFrame:
    merged = pd.merge(employee, employee, left_on="managerId",right_on="id")
    filtered = merged[merged["salary_x"] > merged["salary_y"]]["name_x"]
    return pd.DataFrame ({'Employee': filtered})
    
