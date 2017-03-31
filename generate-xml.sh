#!/bin/bash

# https://github.com/gregrs-uk/gb-leisure-carto/

COLOUR_FNAME=gb-leisure.xml
COLOUR_MML=project.mml
MONO_FNAME=gb-leisure-mono.xml
MONO_MML=project-mono.mml

if [ -f $COLOUR_FNAME ]
then
    mv $COLOUR_FNAME ${COLOUR_FNAME}.xml
fi

if [ -f $MONO_FNAME ]
then
    mv $MONO_FNAME ${MONO_FNAME}.xml
fi

echo "Generating Colour stylesheet"
carto ${COLOUR_MML} > ${COLOUR_FNAME} &&
#if [ -f gb-leisure-old.xml ]
#then
#rm gb-leisure-old.xml
#fi

echo "Replacing SRS with OSGB one"
sed -i 's/srs="+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0.0 +k=1.0 +units=m +nadgrids=@null +wktext +no_defs +over"/srs="+init=epsg:27700"/g' ${COLOUR_FNAME} &&
echo "Done"

echo "Generating Mono stylesheet"
carto $MONO_MML > $MONO_FNAME &&


echo "Replacing SRS with OSGB one"
sed -i 's/srs="+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0.0 +k=1.0 +units=m +nadgrids=@null +wktext +no_defs +over"/srs="+init=epsg:27700"/g' $MONO_FNAME &&
echo "Done"


