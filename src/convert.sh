#!/bin/bash
sudo apt install gdal-bin -y;
mkdir -p geojsons;
cd gmls;
wget https://raw.githubusercontent.com/johnrees/Land-Registry-INSPIRE-Index-Polygons-tools/master/Land_Registry_Cadastral_Parcels.gfs;
export GML_GFS_TEMPLATE=Land_Registry_Cadastral_Parcels.gfs;
for f in *.gml; do ogr2ogr -f "GeoJSON" "../geojsons/${f%.gml}.geojson" ${f} -s_srs EPSG:27700 -t_srs EPSG:4326; done
cd ..;
