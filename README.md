# Cluster Environment Initialization Scripts

## AUTHORS:
* Aaron <azet@azet.org> Zauner
* Petar <pfo@ptmx.org>  Forai

## INFO:
see: env_init-description.pdf

## INSTALL:
### manual
    make install

### packaged
    mkdir -p /tmp/env_init-installdir
    make install DESTDIR=/tmp/env_init-installdir
    cd /tmp
    fpm -s dir -t rpm -n env_init -v 0.1_el6 -C /tmp/env_init-installdir etc # or deb in case of ubuntu

## LICENSE/REDISTRIBUTION:
MIT License (http://opensource.org/licenses/MIT)
