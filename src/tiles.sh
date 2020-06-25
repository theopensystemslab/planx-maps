#!/bin/bash
mkdir -p mbtiles;
cd geojsons;
for f in *.geojson; do tippecanoe -zg -o ../mbtiles/${f%.geojson}.mbtiles --drop-densest-as-needed ${f}; done
cd ..;
