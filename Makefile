all: geoserver pipeline db web docs api

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


push:
	echo "[Pushing to Docker] LFMC Project."
	docker push anthonyrawlinsuom/lfmc-api:latest
	docker push anthonyrawlinsuom/lfmc-mongodb:latest
	docker push anthonyrawlinsuom/lfmc-pipeline:latest
	docker push anthonyrawlinsuom/lfmc-staging:latest
	docker push anthonyrawlinsuom/lfmc-docs:latest
	docker push anthonyrawlinsuom/lfmc-geoserver:latest
	echo "[OK] Ready to Run with 'docker-compose up'."
	
clean:
	cd lfmc-api && make clean
	cd lfmc-docs && make clean
	cd lfmc-staging && make clean
	cd lfmc-mongodb && make clean
	cd lfmc-pipeline && make clean
	cd lfmc-geoserver && make clean