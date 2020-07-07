# PlanX-Maps

Some utilities for working with gov.uk's [INSPIRE Index Polygons](https://www.gov.uk/government/collections/download-inspire-index-polygons)

## How to use

First install the dependencies

`yarn`

(Optional) Download a list of all of the regions and list their archive URLs in a file called urls.csv

`node src/get_inspire_polygons`

Download all of the files listed in `./urls.csv`, into a directory called `./zips`

`./src/download`

Extract all of the `.gml` files and move them into a directory called `./gmls`

`./src/extract`

Convert all of `.gml` files into `.geojson` files, using the WGS84 Coordinate system. Add them all into `./geojsons`

`./src/convert`

Now, either convert all of the `.geojson` files into individual `.mbtiles` files using `./src/tiles` OR combine them all into a single `.mbtiles` file (this will probably take forever and eventually crash out of the process) `cd geojsons && tippecanoe -zg -o inspire-polygons.mbtiles -l inspire-polygons --coalesce-densest-as-needed --extend-zooms-if-still-dropping *.geojson`
