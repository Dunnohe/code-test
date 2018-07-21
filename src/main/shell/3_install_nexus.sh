#!/usr/bin/env bash
wget http://download.sonatype.com/nexus/3/latest-unix.tar.gz
tar -zxvf nexus-3.12.1-01-unix.tar.gz -C /usr/local/
cd /data/nexus/bin
nexus start


#