#!/bin/bash
mkdir gmls;
cd zips;
for f in *.zip; do unzip -p "$f" Land_Registry_Cadastral_Parcels.gml > "../gmls/${f%.zip}.gml"; done
cd ..;
