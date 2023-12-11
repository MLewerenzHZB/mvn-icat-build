FROM rkrahl/python-test:42.3

USER root

COPY setuptool-prereq /home/abuild/.setuptool-prereq
COPY prereq /home/abuild/.install-prereq
COPY env /home/abuild/.env
COPY bin/icatsh /home/abuild/bin/icatsh
COPY bin/run-test /home/abuild/bin/run-test
COPY bin/run-test-all /home/abuild/bin/run-test-all

RUN mkdir -p /home/abuild/.config/icat && \
    chmod -R go-rwx /home/abuild/.config && \
    chown -R abuild:abuild /home/abuild

USER abuild

RUN allpip install -r .setuptool-prereq && \
    allpip install -r .install-prereq
