GENCCODE_ASSEMBLY_TYPE=-a gcc
SO=so
SOBJ=so
A=a
LIBPREFIX=lib
LIB_EXT_ORDER=.50.1
COMPILE=armv6j-hardfloat-linux-gnueabi-gcc -D_REENTRANT   -DU_DISABLE_RENAMING=1 -DU_ATTRIBUTE_DEPRECATED= -O2 -pipe -march=armv6j -mfpu=vfp -mfloat-abi=hard -fomit-frame-pointer -Wall -std=c99 -pedantic -Wshadow -Wpointer-arith -Wmissing-prototypes -Wwrite-strings  -c
LIBFLAGS=-I/usr/include -DPIC -fPIC
GENLIB=armv6j-hardfloat-linux-gnueabi-gcc -O2 -pipe -march=armv6j -mfpu=vfp -mfloat-abi=hard -fomit-frame-pointer -Wall -std=c99 -pedantic -Wshadow -Wpointer-arith -Wmissing-prototypes -Wwrite-strings  -Wl,-O1 -Wl,--as-needed  -shared -Wl,-Bsymbolic
LDICUDTFLAGS=
LD_SONAME=-Wl,-soname -Wl,
RPATH_FLAGS=
BIR_LDFLAGS=-Wl,-Bsymbolic
AR=armv6j-hardfloat-linux-gnueabi-ar
ARFLAGS=r
RANLIB=armv6j-hardfloat-linux-gnueabi-ranlib
INSTALL_CMD=/usr/bin/install -c
