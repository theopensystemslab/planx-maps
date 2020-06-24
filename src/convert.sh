#!/bin/bash
mkdir geojsons;
cd gmls;
for f in *.gml; do ogr2ogr -f "GeoJSON" "geojsons/${f%.gml}.geojson" ${f} -s_srs EPSG:27700 -t_srs EPSG:4326; done
cd ..;
