all: geoserver logic db web docs api

build: all

geoserver:
	echo "[Building] GeoServer OGC-Compliant Server."
	cd lfmc-geoserver && make

logic:
	echo "[Building] LFMC Pipeline (Node-RED)."
	cd lfmc-pipeline && make

db:
	echo "[Building] LFMC MongoDB (NoSQL Database)."
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