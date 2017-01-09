BSD_INSTALL_LIB?=	install -s -m 444
MKDIR?=	mkdir -p

GST_CFLAGS!=	pkg-config --cflags gstreamer-plugins-base-1.0 gstreamer-audio-1.0
GST_LIBS!=	pkg-config --libs gstreamer-plugins-base-1.0 gstreamer-audio-1.0
GST_PLUGINDIR!=	pkg-config --variable=pluginsdir gstreamer-plugins-base-1.0

CFLAGS+=	-fPIC ${GST_CFLAGS}
LDFLAGS+=	${GST_LIBS}

# These come from multimedia/gstreamer1-plugins' config.h
# Their values don't matter much but they have to be defined
CFLAGS+=	-DGST_LICENSE='"LGPL"'
CFLAGS+=	-DGST_PACKAGE_NAME='"GStreamer Base Plug-ins source release"'
CFLAGS+=	-DGST_PACKAGE_ORIGIN='"Unknown package origin"'
CFLAGS+= 	-DGST_PACKAGE_RELEASE_DATETIME='"2016-03-24"'
CFLAGS+=	-DPACKAGE='"gst-plugins-base"' -DVERSION='"1.8.0"'

OBJS=	gstsndio.o \
	sndiosink.o \
	sndiosrc.o

all: libgstsndio.so

libgstsndio.so: ${OBJS}
	${CC} -shared -o libgstsndio.so ${OBJS} ${GST_LIBS} -lsndio

clean:
	rm -f libgstsndio.so ${OBJS}

install:
	${MKDIR} ${DESTDIR}${GST_PLUGINDIR}
	${BSD_INSTALL_LIB} libgstsndio.so ${DESTDIR}${GST_PLUGINDIR}
