#! /bin/bash

cd /home/maposmatic/styles

git clone https://github.com/mapbox/osm-bright.git

cd osm-bright

ln -s /home/maposmatic/shapefiles shp

cp /vagrant/files/osmbright-configure.py .

./make.py

cd OSMBright
sed '/"name":/d' < project.mml > osm.mml
carto osm.mml  > osm.xml

cat <<EOF >> /home/maposmatic/ocitysmap/ocitysmap.styledefs
[osmbright]
name: OsmBright
description: Mapbox OSM Bright style
path: /home/maposmatic/styles/osm-bright/OSMBright/osm.xml

EOF

echo "  osmbright," >> /home/maposmatic/ocitysmap/ocitysmap.styles

