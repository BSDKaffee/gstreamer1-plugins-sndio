BSD_INSTALL_LIB?=	install -s -m 444
MKDIR?=	mkdir -p

GST_CFLAGS!=	pkg-config --cflags gstreamer-plugins-base-1.0 gstreamer-audio-1.0
GST_LIBS!=	pkg-config --libs gstreamer-plugins-base-1.0 gstreamer-audio-1.0
GST_PLUGINDIR!=	pkg-config --variable=pluginsdir gstreamer-plugins-base-1.0

CFLAGS+=	-DHAVE_CONFIG_H -fPIC ${GST_CFLAGS}

LDFLAGS+=	-Wl,--as-needed

OBJS=	gstsndio.o \
	sndiosink.o \
	sndiosrc.o

all: libgstsndio.so

libgstsndio.so: ${OBJS}
	${CC} ${LDFLAGS} -shared -o libgstsndio.so ${OBJS} ${GST_LIBS} -lsndio

clean:
	rm -f libgstsndio.so ${OBJS}

install:
	${MKDIR} ${DESTDIR}${GST_PLUGINDIR}
	${BSD_INSTALL_LIB} libgstsndio.so ${DESTDIR}${GST_PLUGINDIR}
