import numpy as np
import os
import pandas as pd
from sklearn.model_selection import train_test_split


# Load data
file_name = os.path.join('yoochoose-data', 'yoochoose-buys.dat')
names = ['Session ID', 'Timestamp', 'Item ID', 'Category', 'Quantity']
dtypes = {'Session ID': 'float32', 'Timestamp': 'str',
          'Item ID': 'float32', 'Category': 'str'}
buys_df = pd.read_csv(file_name, names=names, dtype=dtypes)

# Aggregate to session and item level
ids = ['Session ID', 'Item ID']
buys_df_agg= buys_df[ids + ['Quantity']].groupby(ids).sum()
buys_df_agg = buys_df_agg.reset_index().sort_values(ids)

# Process columns from float to int
buys_df_agg = buys_df_agg.astype(np.int)

# Inspect data
print(buys_df_agg.head())

# Set random seed and split data
np.random.seed(42)
X_train, X_test = train_test_split(buys_df_agg, test_size=0.20)

# Write data
X_train.to_csv(os.path.join('yoochoose-data', 'train.txt'), sep='\t',
               header=False, index=False)
X_test.to_csv(os.path.join('yoochoose-data', 'test.txt'), sep='\t',
              header=False, index=False)
