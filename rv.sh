#!/bin/bash
set -x

json_out=`pwd`/errors.json
report_out=`pwd`/report

apt install -y autoconf automake autopoint gettext gperf flex texinfo libtool shtool pkg-config libgnutls-dev
./bootstrap
./configure --disable-threads CC=kcc LD=kcc CFLAGS="-fissue-report=$json_out"
make -j`nproc`

./a.out https://www.google.com

touch $json_out && rv-html-report $json_out -o $report_out
rv-upload-report $report_out
