CONF_REPO = git@github.com:icatproject-contrib/icat-config.git
SUDS = community

install: build/apps build/src

build: env cert
	sudo docker-compose pull
	sudo docker-compose build --pull
	sudo docker-compose -f pytest.yaml build --pull

up: env
	sudo docker-compose up -d

down: env
	sudo docker-compose down -v
	bash -c '. .env && rm -rf $$BUILDHOME'

run: env up
	sudo docker-compose exec build bash

run-pytest: #fix-perms 
	sudo docker-compose -f pytest.yaml run --rm pytest-$(SUDS)

fix-perms: pytest/test
	sudo chgrp -R '800' pytest/icat-config
	sudo chmod -R 'g+r,g-w,o-rwx' pytest/icat-config
	sudo chown '1000:100' pytest/icat.cfg
	sudo chmod '0600' pytest/icat.cfg
	sudo chown -R '1000:100' pytest/test client/tmp

pytest/test:
	mkdir -p $@

env:
	bin/mkenv

cert: env build/image/certs/cert.pem

build/image/certs/cert.pem:
	bin/mkcert

build/apps:
	git clone --branch testing/mvn-icat-build/payara6 $(CONF_REPO) $@
	$(MAKE) -C $@ unpack

build/src:
	mkdir $@

.PHONY: install build up down run env cert
