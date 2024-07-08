# Tippecanoe
Tippecanoe is tool for creating vector tiles set from Geojson. Developed by Mapbox. For original source and commands see: https://github.com/mapbox/tippecanoe.

## Build
```
docker build . -t tools/tippecanoe
```
You can also change tools/tippecanoe with another name

## Run example generate vector tiles
```
docker run --rm -v ./data:/data tools/tippecanoe -o output/test.mbtiles /data/example.geojson
```
* Remember that tools/tippecanoe is the name of the tippecanoe image.

## Run with different output directory
docker run --rm -v ./data:/data -v ./output:/output tools/tippecanoe -o /output/test.mbtiles /data/example.geojson