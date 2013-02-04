# Native packages (those containing their own source)
.PHONY: adduser
adduser:$(ADDUSER)_$(ARCH).deb
$(ADDUSER): $(SPREZZ)/adduser/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf adduser_$(adduser_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: anna
anna:$(ANNA)_$(ARCH).udeb
$(ANNA): $(SPREZZ)/anna/debian/changelog
	cp -r $(<D)/.. $@

#.PHONY: aptitude
#aptitude: $(APTITUDE)_$(ARCH).deb
#$(APTITUDE): $(SPREZZ)/aptitude/debian/changelog
#	git clone git://git.debian.org/git/aptitude/aptitude.git $@
#	rm -rfv $@/debian
#	tar cjf $(APTITUDEORIG) $@ --exclude-vcs
#	cp -rv $(<D) $@/

.PHONY: apt
apt:$(APT)_$(ARCH).deb
$(APT): $(SPREZZ)/apt/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf apt_$(apt_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: aptitude
aptitude:$(APTITUDE)_$(ARCH).deb
$(APTITUDE): $(SPREZZ)/aptitude/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf aptitude_$(aptitude_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: apt-listchanges
apt-listchanges:$(APTLISTCHANGES)_$(ARCH).deb
$(APTLISTCHANGES): $(SPREZZ)/apt-listchanges/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf $(APTLISTCHANGES).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: base-files
base-files:$(BASEFILES)_$(ARCH).deb
$(BASEFILES): $(SPREZZ)/base-files/debian/changelog
	cp -r $(<D)/.. $@
	tar cJvf base-files_$(base-files_UPVER).orig.tar.xz $@ --exclude-vcs --exclude=debian

.PHONY: base-installer
base-installer:$(BASEINSTALLER)_$(ARCH).deb
$(BASEINSTALLER): $(SPREZZ)/base-installer/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf base-installer_$(base-installer_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: base-passwd
base-passwd:$(BASEPASSWD)_$(ARCH).deb
$(BASEPASSWD): $(SPREZZ)/base-passwd/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	tar cJvf base-passwd_$(base-passwd_UPVER).orig.tar.xz $@ --exclude-vcs --exclude=debian

.PHONY: cdebconf
cdebconf:$(CDEBCONF)_$(ARCH).deb
$(CDEBCONF): $(SPREZZ)/cdebconf/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	tar cJvf cdebconf_$(cdebconf_UPVER).orig.tar.xz $@ --exclude-vcs --exclude=debian

.PHONY: choose-mirror
choose-mirror:$(CHOOSEMIRROR)_$(ARCH).deb
$(CHOOSEMIRROR): $(SPREZZ)/choose-mirror/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf choose-mirror_$(choose-mirror_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: console-setup
console-setup:$(CONSOLESETUP)_$(ARCH).deb
$(CONSOLESETUP): $(SPREZZ)/console-setup/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	tar cJvf console-setup_$(console-setup_UPVER).orig.tar.xz $@ --exclude-vcs --exclude=debian

.PHONY: debian-cd
debian-cd:$(DEBIANCD)_$(ARCH).deb
$(DEBIANCD): $(SPREZZ)/debian-cd/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf debian-cd-$(debian-cd_UPVER).tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: debootstrap
debootstrap:$(DEBOOTSTRAP)_$(ARCH).deb
$(DEBOOTSTRAP): $(SPREZZ)/debootstrap/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf debootstrap_$(debootstrap_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: dpkg
.PHONY: desktop-base
desktop-base:$(DESKTOPBASE)_$(ARCH).deb
$(DESKTOPBASE): $(SPREZZ)/desktop-base/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf desktop-base_$(desktop-base_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: devscripts
devscripts:$(DEVSCRIPTS)_$(ARCH).deb
$(DEVSCRIPTS): $(SPREZZ)/devscripts/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf devscripts_$(devscripts_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: dpkg
dpkg:$(DPKG)_$(ARCH).deb
$(DPKG): $(SPREZZ)/dpkg/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf dpkg_$(dpkg_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: firmware-all
firmware-all:$(FIRMWAREALL)_$(ARCH).deb
$(FIRMWAREALL): $(SPREZZ)/firmware-all/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf firmware-all_$(firmware-all_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: gcc-defaults
gcc-defaults:$(GCCDEFAULTS)_$(ARCH).deb
$(GCCDEFAULTS): $(SPREZZ)/gcc-defaults/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf gcc-defaults_$(gcc-defaults_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: git-annex
git-annex:$(GITANNEX)_$(ARCH).deb
$(GITANNEX): $(SPREZZ)/git-annex/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf git-annex_$(git-annex_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: haskell-devscripts
haskell-devscripts:$(HASKELLDEVSCRIPTS)_$(ARCH).deb
$(HASKELLDEVSCRIPTS): $(SPREZZ)/haskell-devscripts/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf haskell-devscripts_$(haskell-devscripts_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: hostname
hostname:$(HOSTNAME)_$(ARCH).deb
$(HOSTNAME): $(SPREZZ)/hostname/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf hostname_$(hostname_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: initramfs-tools
initramfs-tools:$(INITRAMFSTOOLS)_$(ARCH).deb
$(INITRAMFSTOOLS): $(SPREZZ)/initramfs-tools/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf initramfs-tools_$(initramfs-tools_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: libapt-pkg-perl
libapt-pkg-perl:$(LIBAPTPKGPERL)_$(ARCH).deb
$(LIBAPTPKGPERL): $(SPREZZ)/libapt-pkg-perl/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf libapt-pkg-perl_$(libapt-pkg-perl_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: libept
libept:$(LIBEPT)_$(ARCH).deb
$(LIBEPT): $(SPREZZ)/libept/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf libept_$(libept_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: lsb
lsb:$(LSB)_$(ARCH).deb
$(LSB): $(SPREZZ)/lsb/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf lsb_$(lsb_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: mediawiki-extensions
mediawiki-extensions:$(MEDIAWIKIEXTENSIONS)_$(ARCH).deb
$(MEDIAWIKIEXTENSIONS): $(SPREZZ)/mediawiki-extensions/debian/changelog
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf mediawiki-extensions_$(mediawiki-extensions_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: meta-gnome
meta-gnome:$(METAGNOME)_$(ARCH).deb
$(METAGNOME): $(SPREZZ)/meta-gnome/debian/changelog
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf meta-gnome_$(meta-gnome_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: meta-kde
meta-kde:$(metakde)_$(ARCH).deb
$(metakde): $(SPREZZ)/meta-kde/debian/changelog
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf meta-kde_$(meta-kde_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: mime-support
mime-support:$(MIMESUPPORT)_$(ARCH).deb
$(MIMESUPPORT): $(SPREZZ)/mime-support/debian/changelog
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf mime-support_$(mime-support_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: moreutils
moreutils:$(MOREUTILS)_$(ARCH).deb
$(MOREUTILS): $(SPREZZ)/moreutils/debian/changelog
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf moreutils_$(moreutils_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: mozilla-devscripts
mozilla-devscripts:$(MOZILLADEVSCRIPTS)_$(ARCH).deb
$(MOZILLADEVSCRIPTS): $(SPREZZ)/mozilla-devscripts/debian/changelog
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf mozilla-devscripts_$(mozilla-devscripts_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: netbase
netbase:$(NETBASE)_$(ARCH).deb
$(NETBASE): $(SPREZZ)/netbase/debian/changelog
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf netbase_$(netbase_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: nvidia-support
nvidia-support:$(NVIDIASUPPORT)_$(ARCH).deb
$(NVIDIASUPPORT): $(SPREZZ)/nvidia-support/debian/changelog
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf nvidia-support_$(nvidia-support_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: python-apt
python-apt:$(PYTHONAPT)_$(ARCH).deb
$(PYTHONAPT): $(SPREZZ)/python-apt/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf python-apt_$(python-apt_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: python-central
python-central:$(PYTHONCENTRAL)_$(ARCH).deb
$(PYTHONCENTRAL): $(SPREZZ)/python-central/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf python-central_$(python-central_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: python-support
python-support:$(PYTHONSUPPORT)_$(ARCH).deb
$(PYTHONSUPPORT): $(SPREZZ)/python-support/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf python-support_$(python-support_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: ruby-defaults
ruby-defaults:$(RUBYDEFAULTS)_$(ARCH).deb
$(RUBYDEFAULTS): $(SPREZZ)/ruby-defaults/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf ruby-defaults_$(ruby-defaults_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: sensible-utils
sensible-utils:$(SENSIBLEUTILS)_$(ARCH).deb
$(SENSIBLEUTILS): $(SPREZZ)/sensible-utils/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf sensible-utils_$(sensible-utils_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: simple-cdd
simple-cdd:$(SIMPLECDD)_$(ARCH).deb
$(SIMPLECDD): $(SPREZZ)/simple-cdd/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf simple-cdd_$(simple-cdd_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: tasksel
tasksel:$(TASKSEL)_$(ARCH).deb
$(TASKSEL): $(SPREZZ)/tasksel/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	rm -rf $@/debian
	tar cJvf tasksel_$(tasksel_UPVER).orig.tar.xz $@ --exclude-vcs
	cp -r $(<D) $@

.PHONY: udpkg
udpkg:$(UDPKG)_$(ARCH).deb
$(UDPKG): $(SPREZZ)/udpkg/debian/changelog
	@[ ! -e $@ ] || { echo "Removing $@..." && rm -rf $@ ; }
	cp -r $(<D)/.. $@
	tar cJvf udpkg_$(udpkg_UPVER).orig.tar.xz $@ --exclude-vcs --exclude=debian
