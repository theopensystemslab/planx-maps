`yarn`

`node src/get_inspire_polygons`

(wait for urls.csv)

`./src/download`

(wait for /zips to fill with archives)

`./src/extract`

(wait for /gmls to fill with GML files)

`./src/convert`

(wait for /geojsons to fill with GeoJSON files)

---

Option 1.

`./src/tiles`

(wait for /geojsons to fill with GeoJSON files)

Option 2.

`cd geojsons && tippecanoe -zg -o inspire-polygons.mbtiles -l inspire-polygons --coalesce-densest-as-needed --extend-zooms-if-still-dropping *.geojson`
