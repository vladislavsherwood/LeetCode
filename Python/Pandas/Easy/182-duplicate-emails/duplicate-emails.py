import pandas as pd

def duplicate_emails(person: pd.DataFrame) -> pd.DataFrame:
    df = person.groupby("email")["id"].count().reset_index()
    duplicates = df[df["id"] > 1][["email"]]
    return duplicates
