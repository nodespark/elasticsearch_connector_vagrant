#!/bin/bash

# Reconfigure locales in order to fix issue caused by ASCII characters in the php-fpm.conf file preventing proper vagrant provision.
sudo dpkg-reconfigure locales
