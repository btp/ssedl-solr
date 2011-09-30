#!/usr/bin/env bash
FN=$1
curl http://localhost:8983/solr/update -H \
      'Content-type:text/xml; charset=utf-8' --data-binary @$FN
curl http://localhost:8983/solr/update -F stream.body=' <commit />'
curl http://localhost:8983/solr/update -F stream.body=' <optimize />'
