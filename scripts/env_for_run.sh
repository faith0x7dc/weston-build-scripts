set -e ### exit if occured error

####################
# env var for run
####################

export TOP=${PWD}
export LD_LIBRARY_PATH=${TOP}/lib
export PKG_CONFIG_PATH=${TOP}/lib/pkgconfig/:${TOP}/share/pkgconfig/
export PATH=${TOP}/bin:${PATH}

export ACLOCAL_PATH=${TOP}/share/aclocal
export ACLOCAL="aclocal -I ${ACLOCAL_PATH}"
mkdir -p ${ACLOCAL_PATH}

# Needed by wayland for socket:
if test -z "${XDG_RUNTIME_DIR}"; then
    export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
    if [[ ! -d "${XDG_RUNTIME_DIR}" ]]; then
        mkdir -p "${XDG_RUNTIME_DIR}"
        chmod 0700 "${XDG_RUNTIME_DIR}"
    fi
fi

