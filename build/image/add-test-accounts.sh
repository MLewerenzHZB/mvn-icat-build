#! /bin/sh
#
# Popukate authn.db adding username / password pairs needed for ICAT
# component tests.

mysql icat_authn_db <<EOF
INSERT INTO PASSWD VALUES ('notroot','password');
INSERT INTO PASSWD VALUES ('piOne','piOne');
INSERT INTO PASSWD VALUES ('piTwo','piTwo');
INSERT INTO PASSWD VALUES ('root','password');
INSERT INTO PASSWD VALUES ('guest','guess');
INSERT INTO PASSWD VALUES ('CIC','password');
INSERT INTO PASSWD VALUES ('reader','readerpw');
INSERT INTO PASSWD VALUES ('idsreader','uRuB9HoiSa1U');
INSERT INTO PASSWD VALUES ('useroffice','iyei4eegoNg3');
INSERT INTO PASSWD VALUES ('dataingest','Aj1oep9lachu');
INSERT INTO PASSWD VALUES ('pubreader','Raemaj4iong4');
INSERT INTO PASSWD VALUES ('acord','pwacord');
INSERT INTO PASSWD VALUES ('ahau','pwahau');
INSERT INTO PASSWD VALUES ('jbotu','pwjbotu');
INSERT INTO PASSWD VALUES ('jdoe','pwjdoe');
INSERT INTO PASSWD VALUES ('nbour','pwnbour');
INSERT INTO PASSWD VALUES ('rbeck','pwrbeck');
EOF
