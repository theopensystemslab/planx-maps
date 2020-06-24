#!/bin/bash
mkdir gml;
for f in zips/*.zip; do unzip -p "$f" Land_Registry_Cadastral_Parcels.gml > "gml/${f%.zip}.gml"; done
