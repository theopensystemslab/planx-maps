#!/bin/bash
mkdir gmls;
for f in zips/*.zip; do unzip -p "$f" Land_Registry_Cadastral_Parcels.gml > "gmls/${f%.zip}.gml"; done
