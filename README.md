Vim 64-bit build for Windows
============================

64-bit Vim for 64-bit Windows, with 64-bit Python 2.7 and 3.4 support, 64-bit
Lua 5.2 support, and 64-bit Ruby 2.0.0 support. Compiled with HUGE feature set
and full optimizations for speed with Visual Studio 2013. Both the GUI and
console executables are included.

Updated approximately every week. Latest versions can always be downloaded
[here] (https://bintray.com/veegee/generic/vim_x64)

If you would like support for a feature that's not enabled, please email me at
veegee@veegee.org and I will add it in.

Installing
============

* Simply run the installer to install.
* If you would like a portable installation, "extract" the installer using
  [7-zip] (http://7-zip.org).

Enabling Optional Features
==========================

Python
------

python27.dll and python34.dll must be in your PATH if you would like to make use
of the respective Python features. This is done for you by default if you
installed Python via the standard Windows installers.

Ruby
----

x64-msvcrt-ruby200.dll must be in your PATH to enable Ruby support. [Ruby
installer] (http://rubyinstaller.org/) provides this dll. If you used the
default settings during install, ensure you have "C:\\Ruby200-x64\\bin" added to
your PATH.

Lua
---

lua52.dll must be in your PATH if you would like to enable support for Lua.

<!-- vim: set tw=80 nospell: -->
