#!/bin/bash

cd gmls;
# # if GDAL 2.x installed...
# apt remove gdal-bin
# apt install ppa-purge
# ppa-purge ppa:ubuntugis/ppa

# we want GDAL 3.x so use unstable ppa
add-apt-repository ppa:ubuntugis/ubuntugis-unstable -y
apt update -y
apt install gdal-bin -y

wget https://raw.githubusercontent.com/johnrees/Land-Registry-INSPIRE-Index-Polygons-tools/import/Land_Registry_Cadastral_Parcels.gfs;
export GML_GFS_TEMPLATE=Land_Registry_Cadastral_Parcels.gfs;
for f in *.gml; do ogr2ogr --config PG_USE_COPY YES -f "PostgreSQL" PG:"host=LOCALHOST user=USER dbname=DBNAME password=PASSWORD port=PORT" "${f}" -geomfield wkb_geometry -lco FID=inspireid; done

# this will create table called predefined

# inspireid | integer | Primary Key
# gml_id | varchar
# wkb_geometry | geometry(Polygon,27700) | GIST Index

cd ..;
