all: geoserver logic nosql web docs api

pull:
	docker pull anthonyrawlinsuom/lfmc-api
	docker pull anthonyrawlinsuom/lfmc-geoserver
	docker pull anthonyrawlinsuom/lfmc-staging
	docker pull anthonyrawlinsuom/lfmc-pipeline
	docker pull anthonyrawlinsuom/lfmc-docs
	docker pull anthonyrawlinsuom/lfmc-mongodb

build: all

geoserver:
	echo "[Building] GeoServer OGC-Compliant Server."
	# if [[ "${LFMC_GEOSERVER_DATA_DIR}" = ""]]; then \
	# 	printf "Using %s as Data directory." "$(readlink -e ${LFMC_GEOSERVER_DATA_DIR})" \
	# else \
	# 	echo "Setting default location for LFMC_GEOSERVER_DATA_DIR..." \
	# 	export LFMC_GEOSERVER_DATA_DIR=$(readlink -e ./Spatial/geoserver_data) \
	# 	printf "LFMC_GEOSERVER_DATA_DIR is set to: %s\n" "${LFMC_GEOSERVER_DATA_DIR}" \
	# fi;
	cd lfmc-geoserver && make

logic:
	echo "[Building] LFMC Pipeline (Node-RED)."
	cd lfmc-pipeline && make

nosql:
	echo "[Building] LFMC MongoDB (NoSQL Database)."
	# if [[ "${LFMC_MONGODB_DATA_DIR}" = ""]]; then \
	# 	printf "Using %s as Data directory." "$(readlink -e ${LFMC_MONGODB_DATA_DIR})" \
	# else \
	# 	echo "Setting default location for LFMC_MONGODB_DATA_DIR..." \
	# 	export LFMC_MONGODB_DATA_DIR=$(readlink -e ./Index/mongodb) \
	# 	printf "LFMC_MONGODB_DATA_DIR is set to: %s\n" "${LFMC_MONGODB_DATA_DIR}" \
	# fi;
	cd lfmc-mongodb && make

web:
	echo "[Building] LFMC Staging (Web Server)."
	cd lfmc-staging && make

docs:
	echo "[Building] LFMC Documentation (readthedocs.io)."
	cd lfmc-docs && make

api:
	echo "[Building] LFMC API (WSGI RESTful)."
	cd lfmc-api && make

pull:
	echo "[Pulling from Docker.io] LFMC Project."
	cd lfmc-geoserver && make pull
	cd lfmc-pipeline && make pull
	cd lfmc-mongodb && make pull
	cd lfmc-staging && make pull
	cd lfmc-docs && make pull
	cd lfmc-api && make pull
	echo "[OK] Ready to Run with 'kompose up'."
	
install:
	echo "[Pushing to Docker] LFMC Project."
	cd lfmc-geoserver && make install
	cd lfmc-pipeline && make install
	cd lfmc-mongodb && make install
	cd lfmc-staging && make install
	cd lfmc-docs && make install
	cd lfmc-api && make install
	echo "[OK] Ready to Run with 'docker-compose up'."
	
clean:
#	docker-compose down
#	docker stop anthonyrawlinsuom/lfmc-api
#	docker stop anthonyrawlinsuom/lfmc-mongodb
#	docker stop anthonyrawlinsuom/lfmc-pipeline
#	docker stop anthonyrawlinsuom/lfmc-staging
#	docker stop anthonyrawlinsuom/lfmc-docs
#	docker stop anthonyrawlinsuom/lfmc-geoserver
	cd lfmc-api && make clean
	cd lfmc-docs && make clean
	cd lfmc-staging && make clean
	cd lfmc-mongodb && make clean
	cd lfmc-pipeline && make clean
	cd lfmc-geoserver && make clean