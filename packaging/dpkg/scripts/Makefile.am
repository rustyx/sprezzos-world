## Process this file with automake to produce Makefile.in

SUBDIRS = mk po

bin_SCRIPTS = \
	dpkg-architecture \
	dpkg-buildflags \
	dpkg-buildpackage \
	dpkg-checkbuilddeps \
	dpkg-distaddfile \
	dpkg-genchanges \
	dpkg-gencontrol \
	dpkg-gensymbols \
	dpkg-maintscript-helper \
	dpkg-mergechangelogs \
	dpkg-name \
	dpkg-parsechangelog \
	dpkg-scanpackages \
	dpkg-scansources \
	dpkg-shlibdeps \
	dpkg-source \
	dpkg-vendor

changelogdir = $(pkglibdir)/parsechangelog
changelog_SCRIPTS = \
	changelog/debian

EXTRA_DIST = \
	dpkg-architecture.pl \
	dpkg-buildflags.pl \
	dpkg-buildpackage.pl \
	dpkg-checkbuilddeps.pl \
	dpkg-distaddfile.pl \
	dpkg-genchanges.pl \
	dpkg-gencontrol.pl \
	dpkg-gensymbols.pl \
	dpkg-maintscript-helper.sh \
	dpkg-mergechangelogs.pl \
	dpkg-name.pl \
	dpkg-parsechangelog.pl \
	dpkg-scanpackages.pl \
	dpkg-scansources.pl \
	dpkg-shlibdeps.pl \
	dpkg-source.pl \
	dpkg-vendor.pl \
	changelog/debian.pl \
	$(test_cases) \
	$(test_data)


CLEANFILES = \
	$(test_data_objects) \
	$(bin_SCRIPTS) $(changelog_SCRIPTS)

perllibdir = $(PERL_LIBDIR)
nobase_dist_perllib_DATA = \
	Dpkg/Arch.pm \
	Dpkg/BuildEnv.pm \
	Dpkg/BuildFlags.pm \
	Dpkg/BuildOptions.pm \
	Dpkg/Changelog.pm \
	Dpkg/Changelog/Debian.pm \
	Dpkg/Changelog/Entry.pm \
	Dpkg/Changelog/Entry/Debian.pm \
	Dpkg/Changelog/Parse.pm \
	Dpkg/Checksums.pm \
	Dpkg/Compression.pm \
	Dpkg/Compression/FileHandle.pm \
	Dpkg/Compression/Process.pm \
	Dpkg/Conf.pm \
	Dpkg/Control.pm \
	Dpkg/Control/Changelog.pm \
	Dpkg/Control/Fields.pm \
	Dpkg/Control/Info.pm \
	Dpkg/Control/Hash.pm \
	Dpkg/Control/Types.pm \
	Dpkg/Deps.pm \
	Dpkg/ErrorHandling.pm \
	Dpkg/Exit.pm \
	Dpkg/File.pm \
	Dpkg/Gettext.pm \
	Dpkg/Index.pm \
	Dpkg/Interface/Storable.pm \
	Dpkg/IPC.pm \
	Dpkg/Package.pm \
	Dpkg/Path.pm \
	Dpkg/Shlibs.pm \
	Dpkg/Shlibs/Objdump.pm \
	Dpkg/Shlibs/Symbol.pm \
	Dpkg/Shlibs/SymbolFile.pm \
	Dpkg/Shlibs/Cppfilt.pm \
	Dpkg/Source/Archive.pm \
	Dpkg/Source/Functions.pm \
	Dpkg/Source/Package.pm \
	Dpkg/Source/Package/V1.pm \
	Dpkg/Source/Package/V2.pm \
	Dpkg/Source/Package/V3/bzr.pm \
	Dpkg/Source/Package/V3/custom.pm \
	Dpkg/Source/Package/V3/native.pm \
	Dpkg/Source/Package/V3/git.pm \
	Dpkg/Source/Package/V3/quilt.pm \
	Dpkg/Source/Patch.pm \
	Dpkg/Source/Quilt.pm \
	Dpkg/Substvars.pm \
	Dpkg/Vars.pm \
	Dpkg/Vendor.pm \
	Dpkg/Vendor/Debian.pm \
	Dpkg/Vendor/Default.pm \
	Dpkg/Vendor/Ubuntu.pm \
	Dpkg/Version.pm \
	Dpkg.pm

# Keep it even if empty to have man3dir correctly set
man3_MANS =

do_perl_subst = $(AM_V_GEN) \
		sed -e "s:^\#![[:space:]]*/usr/bin/perl:\#!$(PERL):" \
		    -e "s:\$$dpkglibdir[[:space:]]*=[[:space:]]*['\"][^'\"]*['\"]:\$$dpkglibdir=\"$(pkglibdir)\":" \
		    -e "s:\$$pkgdatadir[[:space:]]*=[[:space:]]*['\"][^'\"]*['\"]:\$$pkgdatadir=\"$(pkgdatadir)\":" \
		    -e "s:\$$admindir[[:space:]]*=[[:space:]]*['\"][^'\"]*['\"]:\$$admindir=\"$(admindir)\":" \
		    -e "s:\$$version[[:space:]]*=[[:space:]]*['\"][^'\"]*[\"']:\$$version=\"$(PACKAGE_VERSION)\":"

do_shell_subst = $(AM_V_GEN) \
		 sed -e "s:^version[[:space:]]*=[[:space:]]*['\"][^'\"]*[\"']:version=\"$(PACKAGE_VERSION)\":"

%: %.pl Makefile
	@test -d `dirname $@` || $(MKDIR_P) `dirname $@`
	$(do_perl_subst) <$< >$@
	$(AM_V_at) chmod +x $@

%: %.sh Makefile
	@test -d `dirname $@` || $(MKDIR_P) `dirname $@`
	$(do_shell_subst) <$< >$@
	$(AM_V_at) chmod +x $@

install-data-local:
if BUILD_POD_DOC
# Install manual pages for perl modules manually as make can't deal
# properly with filenames containing colons
# Remove empty manual pages (perl modules not documented)
	$(MKDIR_P) $(DESTDIR)$(man3dir)
	for module in $(nobase_dist_perllib_DATA); do \
	    name=`echo $$module | sed -e 's|/|::|g' -e 's/\.pm$$//'`; \
	    $(POD2MAN) --utf8 --center=libdpkg-perl --release=$(VERSION) \
		--name="$$name"	--section=3 $(srcdir)/$$module \
		>$(DESTDIR)$(man3dir)/$$name.3; \
	    test -s $(DESTDIR)$(man3dir)/$$name.3 || \
		rm -f $(DESTDIR)$(man3dir)/$$name.3; \
	done
endif

# Ideally we'd use 'sed -i', but unfortunately that's not portable.
install-data-hook:
	cp -p $(DESTDIR)$(perllibdir)/Dpkg.pm \
	      $(DESTDIR)$(perllibdir)/Dpkg.pm.tmp
	$(do_perl_subst) <$(DESTDIR)$(perllibdir)/Dpkg.pm.tmp \
	                 >$(DESTDIR)$(perllibdir)/Dpkg.pm
	rm $(DESTDIR)$(perllibdir)/Dpkg.pm.tmp

uninstall-local:
if BUILD_POD_DOC
	for module in $(nobase_dist_perllib_DATA); do \
	    rm -f $(DESTDIR)$(man3dir)/`echo $$module | sed -e 's|/|::|g' -e 's/\.pm$$/.3/'`; \
	done
endif

coverage: check
	$(PERL_COVER) -silent \
	  -ignore_re '^t/.*\.t' \
	  -outputdir $(top_builddir)/doc/coverage/scripts

coverage-clean:
	rm -rf cover_db

TEST_VERBOSE= 0
TEST_ENV_VARS = \
	DPKG_DATADIR=$(srcdir)/.. \
	DPKG_ORIGINS_DIR=$(srcdir)/t/origins
TEST_COVERAGE = $(PERL_COVERAGE)

test_tmpdir = t.tmp

test_cases = \
	t/000_pod.t \
	t/100_Dpkg_Version.t \
	t/150_Dpkg_Package.t \
	t/190_Dpkg_Shlibs_Cppfilt.t \
	t/200_Dpkg_Shlibs.t \
	t/300_Dpkg_BuildOptions.t \
	t/400_Dpkg_Deps.t \
	t/500_Dpkg_Path.t \
	t/600_Dpkg_Changelog.t \
	t/600_Dpkg_Changelog_Ubuntu.t \
	t/700_Dpkg_Control.t \
	t/750_Dpkg_Substvars.t \
	t/800_Dpkg_IPC.t \
	t/850_Dpkg_Compression.t \
	t/910_merge_changelogs.t

test_data = \
	t/200_Dpkg_Shlibs/symbols.fake-1 \
	t/200_Dpkg_Shlibs/symbols.fake-2 \
	t/200_Dpkg_Shlibs/symbols.fake-3 \
	t/200_Dpkg_Shlibs/symbols.include-1 \
	t/200_Dpkg_Shlibs/symbols.include-2 \
	t/200_Dpkg_Shlibs/symbols.include-3 \
	t/200_Dpkg_Shlibs/basictags.symbols \
	t/200_Dpkg_Shlibs/basictags.c \
	t/200_Dpkg_Shlibs/patterns.symbols \
	t/200_Dpkg_Shlibs/patterns.cpp \
	t/200_Dpkg_Shlibs/patterns.map \
	t/200_Dpkg_Shlibs/ld.so.conf \
	t/200_Dpkg_Shlibs/ld.so.conf_2 \
	t/200_Dpkg_Shlibs/ld.so.conf.d/normal.conf \
	t/200_Dpkg_Shlibs/ld.so.conf.d/inf_recurse.conf \
	t/200_Dpkg_Shlibs/ld.so.conf.d/recursive.conf \
	t/200_Dpkg_Shlibs/objdump.space \
	t/200_Dpkg_Shlibs/objdump.basictags-amd64 \
	t/200_Dpkg_Shlibs/objdump.basictags-i386 \
	t/200_Dpkg_Shlibs/objdump.patterns \
	t/200_Dpkg_Shlibs/objdump.glib-ia64 \
	t/200_Dpkg_Shlibs/objdump.libc6-2.3 \
	t/200_Dpkg_Shlibs/objdump.libc6-2.6 \
	t/200_Dpkg_Shlibs/objdump.dbd-pg \
	t/200_Dpkg_Shlibs/objdump.ls \
	t/600_Dpkg_Changelog/countme \
	t/600_Dpkg_Changelog/fields \
	t/600_Dpkg_Changelog/misplaced-tz \
	t/600_Dpkg_Changelog/regressions \
	t/600_Dpkg_Changelog/shadow \
	t/700_Dpkg_Control/control-1 \
	t/750_Dpkg_Substvars/substvars1 \
	t/910_merge_changelogs/ch-old \
	t/910_merge_changelogs/ch-a \
	t/910_merge_changelogs/ch-b \
	t/910_merge_changelogs/ch-badver-a \
	t/910_merge_changelogs/ch-badver-b \
	t/910_merge_changelogs/ch-badver-merged \
	t/910_merge_changelogs/ch-badver-old \
	t/910_merge_changelogs/ch-merged \
	t/910_merge_changelogs/ch-merged-basic \
	t/910_merge_changelogs/ch-merged-pr \
	t/910_merge_changelogs/ch-merged-pr-basic \
	t/origins/debian \
	t/origins/default \
	t/origins/ubuntu

test_data_objects = \
	t/200_Dpkg_Shlibs/libobjdump.basictags-amd64.so \
	t/200_Dpkg_Shlibs/libobjdump.basictags-i386.so \
	t/200_Dpkg_Shlibs/libobjdump.patterns.so

$(srcdir)/t/200_Dpkg_Shlibs/libobjdump.basictags-amd64.so: $(srcdir)/t/200_Dpkg_Shlibs/basictags.c
	$(CC) $(CFLAGS) -shared -fPIC -Wl,-soname -Wl,libbasictags.so.1 $< \
	  -DAMD64 -o $@

$(srcdir)/t/200_Dpkg_Shlibs/libobjdump.basictags-i386.so: $(srcdir)/t/200_Dpkg_Shlibs/basictags.c
	$(CC) $(CFLAGS) -shared -fPIC -Wl,-soname -Wl,libbasictags.so.1 $< \
	  -o $@

$(srcdir)/t/200_Dpkg_Shlibs/libobjdump.patterns.so: $(srcdir)/t/200_Dpkg_Shlibs/patterns.cpp $(srcdir)/t/200_Dpkg_Shlibs/patterns.map
	$(CXX) $(CXXFLAGS) -shared -fPIC -Wl,-soname -Wl,libpatterns.so.1 \
	    -Wl,--version-script=$(srcdir)/t/200_Dpkg_Shlibs/patterns.map $< \
	    -o $@

.PHONY: refresh-test-data

OBJDUMP = objdump -w -f -p -T -R

refresh-test-data: $(test_data_objects)
	$(OBJDUMP) $(srcdir)/t/200_Dpkg_Shlibs/libobjdump.basictags-amd64.so \
	  >$(srcdir)/t/200_Dpkg_Shlibs/objdump.basictags-amd64
	$(OBJDUMP) $(srcdir)/t/200_Dpkg_Shlibs/libobjdump.basictags-i386.so \
	  >$(srcdir)/t/200_Dpkg_Shlibs/objdump.basictags-i386
	$(OBJDUMP) $(srcdir)/t/200_Dpkg_Shlibs/libobjdump.patterns.so \
	  >$(srcdir)/t/200_Dpkg_Shlibs/objdump.patterns
	$(OBJDUMP) `which ls` >$(srcdir)/t/200_Dpkg_Shlibs/objdump.ls

include $(top_srcdir)/Makecheck.am

clean-local: check-clean coverage-clean
	rm -fr man
