Weston build scripts
======================

Downloading scripts
---------------------

   $ mkdir wayland
   $ cd wayland
   $ git clone https://github.com/faith0x7dc/weston-build-scripts.git

Compiling Weston and dependencies
------------------------------------

Before run script, set the TOP env var.

   $ export TOP=$PWD

You can build all package needed by weston to run below.

   $ ./scripts/build-all

Running Weston
----------------

You must set env vars such as PATH, LD_LIBRARY_PATH, etc.

Below is script to set those env var.

   scripts/env_for_run.sh

Below is exapmle command to run weston.

   $ sudo su
   # source ./scripts/env_for_run.sh
   # weston

or

   $ source ./scripts/env_for_run.sh
   $ weston-launch

For details, see below.

  http://wayland.freedesktop.org/building.html

Enjoy Wayland life!

