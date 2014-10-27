set -e ### exit if occured error

status()
{
	echo -e "\e[94m"$*"\e[0m"
}

error()
{
	echo -e "\e[91m"$*"\e[0m"
	exit 1
}

if [[ -z "${TOP}" ]]; then
	error "Error: TOP env var not set."
fi

####################
# helpers
####################

run_clone()
{
	if [[ -z "${PACKAGE}" ]]; then
		error "Error: PACKAGE var not set."
	fi

	git clone $* ${TOP}/src/${PACKAGE}
}

cd_package()
{
	if [[ -z "${PACKAGE}" ]]; then
		error "Error: PACKAGE var not set."
	fi

	cd ${TOP}/src/${PACKAGE}
}

run_autogen()
{
	./autogen.sh --prefix=${TOP} $*
}

run_configure()
{
	if [[ ! -f ./configure ]]; then
		autoreconf -i
	fi

	./configure --prefix=${TOP} $*
}

run_make()
{
	make $*
}

package_success()
{
	status "succeeded building $PACKAGE"
}

####################
# env var
####################

export LD_LIBRARY_PATH=${TOP}/lib
export PKG_CONFIG_PATH=${TOP}/lib/pkgconfig/:${TOP}/share/pkgconfig/
export PATH=${TOP}/bin:${PATH}

export ACLOCAL_PATH=${TOP}/share/aclocal
export ACLOCAL="aclocal -I ${ACLOCAL_PATH}"
mkdir -p ${ACLOCAL_PATH}

