# Sndio GStreamer plugin

The plugin provides an audio sink and source for GStreamer 1.  When it
is installed GStreamer prefers it over the OSS or PulseAudio plugins.

This comes directly from OpenBSD's [multimedia/gstreamer1/plugins-base
port][obsdport].

## Installation

### Ubuntu

```
apt-get install build-essential libsndio-dev libgstreamer-plugins-base1.0-dev
make
make install
```

### FreeBSD

Use the [FreeBSD port][fbsdport] which will take care of everything,
or install the package:

```
pkg install gstreamer1-plugins-sndio
```

[fbsdport]: https://www.freshports.org/audio/gstreamer1-plugins-sndio
[obsdport]: http://cvsweb.openbsd.org/cgi-bin/cvsweb/ports/multimedia/gstreamer1/plugins-base/