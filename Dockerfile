# Starting from Ubuntu Trusty
FROM ubuntu:trusty

# We need wget to download the custom version of Firefox, xvfb to have a virtual screen and Firefox so all necessary libraries are installed.
RUN apt-get update && apt-get install -y wget xvfb firefox

# Setting the Firefox version and installation directory through environment variables.
ENV FIREFOX_VERSION 40.0
ENV FIREFOX_DIR $HOME/firefox
ENV FIREFOX_FILENAME $FIREFOX_DIR/firefox.tar.bz2

# Create the Firefox directory, download the custom Firefox version from Mozilla and untar it.
RUN mkdir $FIREFOX_DIR
RUN wget -q --continue --output-document $FIREFOX_FILENAME "https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${FIREFOX_VERSION}/linux-x86_64/en-US/firefox-${FIREFOX_VERSION}.tar.bz2"
RUN tar -xaf "$FIREFOX_FILENAME" --strip-components=1 --directory "$FIREFOX_DIR"

# Setting the PATH so our customer Firefox version will be used first
ENV PATH $FIREFOX_DIR:$PATH
