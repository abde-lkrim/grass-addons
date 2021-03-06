#!/bin/sh
# functions to remove raster map entries to the grass sql database 

### setup enviro vars ###
eval `g.gisenv`
: ${GISBASE?} ${GISDBASE?} ${LOCATION_NAME?} ${MAPSET?}

source ${GISBASE}/etc/r.rast4d/globals/defines.sh

remove_raster_map () 
{
MAPNAME=$1
GROUP_TABLE="${GRASTER_GROUP_TABLE_PREFIX}_${MAPNAME}"
REFERENCE_TABLE="${GRASTER_REFERENCE_TABLE_PREFIX}_${MAPNAME}"
METADATA_TABLE="${GRASTER_METADATA_TABLE_PREFIX}_${MAPNAME}"
CATEGORY_TABLE="${GRASTER_CATEGORY_TABLE_PREFIX}_${MAPNAME}"
TEMPORAL_TABLE="${GRASTER_TEMPORAL_TABLE_PREFIX}_${MAPNAME}"

#$DBM $DATABASE "DROP TABLE $REFERENCE_TABLE"
#$DBM $DATABASE "DROP TABLE $METADATA_TABLE"
#$DBM $DATABASE "DROP TABLE $GROUP_TABLE"
#$DBM $DATABASE "DROP TABLE $CATEGORY_TABLE"
#$DBM $DATABASE "DROP TABLE $TEMPORAL_TABLE"

echo "REMOVE $MAPNAME FROM $GRASTER_TABLE_NAME"
echo "DELETE FROM $GRASTER_TABLE_NAME  WHERE name='$MAPNAME';" | $GRAST4D_DBM $GRAST4D_DATABASE 

}

remove_raster_map_metadata ()
{
MAPNAME=$1
echo "REMOVE $MAPNAME FROM $GRASTER_METADATA_TABLE_NAME"
echo "DELETE FROM $GRASTER_METADATA_TABLE_NAME  WHERE name='$MAPNAME';" | $GRAST4D_DBM $GRAST4D_DATABASE 
}

remove_raster_map_time () 
{
MAPNAME=$1
echo "REMOVE $MAPNAME FROM $GRASTER_TIME_TABLE_NAME"
echo "DELETE FROM $GRASTER_TIME_TABLE_NAME  WHERE name='$MAPNAME';" | $GRAST4D_DBM $GRAST4D_DATABASE 
}
