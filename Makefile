# simple Makefile for env_init setup - you might want to package this using FPM

DESTDIR?=
copyjob=components.d conf.d README.md
etcdir=/etc
project=env_init
profile_dir=/etc/profile.d

all: install
install:
	test -d $(DESTDIR)$(etcdir)/$(project) || mkdir -p $(DESTDIR)$(etcdir)/$(project)
	test -d $(DESTDIR)$(profile_dir) || mkdir -p $(DESTDIR)$(profile_dir)
	for copy in $(copyjob); do \
		cp -R $$copy $(DESTDIR)$(etcdir)/$(project) ; \
		chmod 755 $$copy $(DESTDIR)$(etcdir)/$(project) ; \
	done
	install -m 755 bin/env_init.sh $(DESTDIR)$(profile_dir)/env_init.sh
	install bin/modules.sh $(DESTDIR)$(profile_dir)/modules.sh

clean:
	rm -rf $(DESTDIR)$(etcdir)/$(project) $(DESTDIR)$(profile_dir)/env_init.sh
	unlink $(DESTDIR)$(profile_dir)/modules.sh
