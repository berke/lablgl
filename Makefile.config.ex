#	LablGL and Togl configuration file
#
# Please have a look at the config/Makefile in the Objective Caml distribution,
# or at the labltklink script to get the information needed here
#

##### Adjust these always

# Where to put the lablgl, lablgllink and lablglopt scripts
BINDIR = /usr/local/bin

# The Objective Label library directory (obtain it by ocamlc -v)
LIBDIR = /usr/local/lib/ocaml

# Where to find Tcl/Tk headers
TKINCLUDES=-I/usr/local/include

# Where to find OpenGL/Mesa headers and libraries
GLINCLUDES=
GLLIBS=-lGL -lGLU

# Where to find X headers and libraries
XINCLUDES=-I/usr/X11R6/include
XLIBS=-L/usr/X11R6/lib -lX11 -lXext -lXmu

# How to index a library
RANLIB= ranlib

##### Adjust these if non standard

# Where is LablTk (standard)
LABLTKDIR = $(LIBDIR)/labltk

# Where to put LablGL (standard)
INSTALLDIR = $(LIBDIR)/lablGL

# Where is Togl (default)
TOGLDIR = Togl

# The C compiler
CC = cc

# Compiler options:
COPTS = -c -O

###### No need to change these

# Where to find tcl.h, tk.h, OpenGL/Mesa headers, etc:
INCLUDES = $(TKINCLUDES) $(GLINCLUDES) $(XINCLUDES)

# Libraries to link with (-ldl for Linux only?):
LIBS = $(GLLIBS) $(XLIBS)

# Leave this empty
LIBDIRS =
