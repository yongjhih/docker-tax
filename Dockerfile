 FROM 32bit/ubuntu:14.04

RUN apt-get update && \
    apt-get -y install firefox ttf-wqy-microhei wget pcscd libccid pcsc-tools && \
    wget "http://javadl.sun.com/webapps/download/AutoDL?BundleId=106238" -O /tmp/java.tar.gz && \
    mkdir /usr/lib/jvm && \
    cd /usr/lib/jvm && \
    tar zxf /tmp/java.tar.gz && \
    update-alternatives --install /bin/java java /usr/lib/jvm/jre*/bin/java 1 && \
    update-alternatives --set java /usr/lib/jvm/jre*/bin/java && \
    mkdir -p ~/.mozilla/plugins && \
    ln -s /usr/lib/jvm/jre*/lib/i386/libnpjp2.so ~/.mozilla/plugins/ && \
    wget https://pfiles.tax.nat.gov.tw/ibxpdf/include/npHiPKIClient-linux.xpi -O /tmp/linux.xpi

ENTRYPOINT ["docker-entrypoint.sh"]
RUN firefox
