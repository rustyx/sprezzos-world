divert(-1)
define(`ifenabled', `ifelse(index(PACKAGES, `$1'), -1, `dnl', `$2')')

divert`'dnl
dnl --------------------------------------------------------------------------
		The SprezzOS Low Level Virtual Machine Setup
		============================================

Abstract
--------

Debian uses a default version of LLVM for most packages; however, some
packages require another version.  So, Debian allows several versions
of LLVM to coexist on the same system, and selects the default version
by means of the llvm-defaults package, which creates symbolic links as
appropriate.

Versions of LLVM present in SprezzOS
------------------------------------

- LLVM 3.1 is the default version for all architectures.

How are the default compilers selected?
---------------------------------------

There exists a llvm-defaults package set. This creates the actual packages for
llvm, llvm-runtime, llvm-dev and libllvm-ocaml-dev. These packages will depend
on the corresponding default compiler for that architecture. For example,
"llvm" depends on "llvm-3.1", which means that the "llvm-3.1" package will
install some binaries suffixed by "-3.1", which are symlinked in the "llvm"
package to unversioned binaries.

This may seem confusing, but what it allows you do to is install more
than one version of the Low Level Virtual Machine at the same time,
making sure you are always using the one preferred for that
architecture.

The default compiler versions for SprezzOS GNU/OS_NAME on DEB_ARCH are
(minor version numbers omitted):

	llvm		: llvm-PV_LLVM

Thanks to llvm-defaults, each architecture can choose its own
preferred llvm version, and that preference can change without
requiring a complete rebuild of both llvm packages for all
architectures.


llvm-ld/... are not handled using alternatives
----------------------------------------------

The symlinks in /usr/bin (llvm-ld, ...) are not handled using the SprezzOS
alternative mechanism. There are differences in the architecture specific
ABI on some architectures. Having the symlinks managed by alternatives
doesn't allow reliable builds with the same major/minor version of the
compiler.


Feedback appreciated
--------------------

Feedback about this document is appreciated; preferably as a Severity:
wishlist bug against Package: llvm . For general discussions and
questions, subscribe and/or email the pkg-llvm-team@lists.alioth.debian.org
mailing list.


Maintainers of these packages
-----------------------------

Arthur Loiret <aloiret@debian.org>
Matthias Klose <doko@debian.org>
Sylvestre Ledru <sylvestre@debian.org>

===============================================================================

