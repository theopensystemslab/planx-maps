#!/bin/bash
cat urls.csv | xargs -n 1 -P 5 wget -q --directory-prefix zips
