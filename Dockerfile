FROM nginx:stable
RUN apt-get update -qq && apt-get install -y geoip-database wget

RUN wget -N http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz
RUN gunzip GeoLite2-City.mmdb.gz
RUN wget -N http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.mmdb.gz
RUN gunzip GeoLite2-Country.mmdb.gz

RUN mkdir /usr/local/share/GeoIP/
RUN mv GeoLite2-City.mmdb /usr/local/share/GeoIP/
RUN mv GeoLite2-Country.mmdb /usr/local/share/GeoIP/

# Add configuration files
COPY image-files/ /


