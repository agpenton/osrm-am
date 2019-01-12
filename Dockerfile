FROM osrm/osrm-backend:v5.20.0
LABEL maintainer="Asdrubal Gonzalez" description="osrm image for the Armenia Map"
ENV pbf=armenia-latest.osm.pbf osrm=armenia-latest.osrm
VOLUME [ "./:/data" ]
WORKDIR /data
RUN wget http://download.geofabrik.de/asia/${pbf} \
&& osrm-extract -p /opt/car.lua /data/${pbf} \
&& osrm-partition /data/${osrm} \
&& osrm-customize /data/${osrm}
# && osrm-routed --algorithm mld /data/${osrm}
# EXPOSE 5000:5000
