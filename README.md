# Cluster Environment Initialization Scripts

## INFO:
see: env_init-description.pdf (internal documentation!)

## INSTALL:
### manual
    make install

### packaged
    mkdir -p /tmp/env_init-installdir
    make install DESTDIR=/tmp/env_init-installdir
    cd /tmp
    fpm -s dir -t rpm -n env_init -v 0.1_el6 -C /tmp/env_init-installdir etc # or deb in case of ubuntu
    

## AUTHORS:
* Aaron <azet@azet.org> Zauner
* Petar <pfo@ptmx.org>  Forai

## LICENSE/REDISTRIBUTION:
MIT License (http://opensource.org/licenses/MIT)

```
The MIT License (MIT)

Copyright (c) 2013 Gregor Mendel Institute of Molecular Plant Biology GmbH

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```
