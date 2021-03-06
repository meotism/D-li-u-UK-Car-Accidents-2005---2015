# -*- coding: utf-8 -*-
"""Visualize acidents

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1PvMDUKTtA8xNkFex8lzrpWlyUlDfqAyL
"""

# Commented out IPython magic to ensure Python compatibility.
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
# %matplotlib inline
import seaborn as sns

from google.colab import files
uploaded = files.upload()

# import dataset
accidents = pd.read_csv("Accidents0515.csv")

# take a look at first entries
accidents.head()

# Prepare the data
accidents2 = accidents[accidents['Longitude'] != 999]

from sklearn.utils import shuffle

# shuffle the data
accidents2 = shuffle(accidents2)

import shapefile

# read the shapefile
data_in_shapefile = shapefile.Reader('Areas')
print(data_in_shapefile.numRecords)

from shapely.geometry import shape

# Obtain the attributes and the geometry for each record.
attributes, geometry = [], []
field_names = [field[0] for field in data_in_shapefile.fields[1:]]  
for row in data_in_shapefile.shapeRecords():  
    geometry.append(shape(row.shape.__geo_interface__))  
    attributes.append(dict(zip(field_names, row.record))) 
print (attributes)

import geopandas as gpd

# populate a geopandas dataframe
gdf = gpd.GeoDataFrame(data = attributes, geometry = geometry)
gdf.head()

!pip install --upgrade pyshp
!pip install --upgrade shapely
!pip install --upgrade descartes
!pip install --upgrade geopandas
import geopandas as gpd

# populate a geopandas dataframe
gdf = gpd.GeoDataFrame(data = attributes, geometry = geometry)
gdf.head()

from shapely.geometry import Point

# create a function to map the accidents coordinates
def map_accidents_to_areas(longitude, latitude):       
        point = (float(longitude),float(latitude))
        for i in range(len(gdf.geometry)):            
            if Point(point).within(gdf.geometry.loc[i]):
                return gdf.name[i]

import time

start = time.clock()
acc = accidents2.iloc[1:300000,:]
acc['Area'] = acc.apply(lambda x: map_accidents_to_areas(x['Longitude'], x['Latitude']), axis=1)
end = time.clock()
print ("%.2gs" % (end-start))

# create a new dataframe by grouping by 'Area' and counting the number of accidents
acc_by_area = pd.DataFrame({'Total_accidents' : accidents.groupby( ["Area"] ).size()}).reset_index()

# create a lookup function
def find_total_accidents(area_name):
    for i in range(len(acc_by_area.Area)):
        if area_name == acc_by_area.Area.loc[i]:
                return acc_by_area.Total_accidents[i]

# add a new column to the geopandas dataframe
gdf['Total_accidents'] = gdf.name.apply(find_total_accidents)

import matplotlib.cm
from matplotlib.colors import Normalize

vmin, vmax = gdf['Total_accidents'].min(), gdf['Total_accidents'].max()

# create a Choropleth map (map where the color of each shape is based on the value of an associated variable)
ax = gdf.plot(column='Total_accidents', cmap='OrRd', edgecolor='black', figsize=(12,12), linewidth=1)
fig = ax.get_figure()
# create a ScalarMappable object and use the set_array() function to add the accidents counts to it
sm = matplotlib.cm.ScalarMappable(cmap='OrRd', norm=Normalize(vmin=vmin, vmax=vmax))
sm.set_array(gdf['Total_accidents'])
# Then pass it to the colorbar() function and set the shrink argument to 0.4 in order to make the colorbar smaller than the map
fig.colorbar(sm, shrink=0.4)