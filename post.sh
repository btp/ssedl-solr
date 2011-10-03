#!/usr/bin/env bash
IN_FN=$1
OUT_FN=`echo $1 | sed "s/\.xml/solr.xml/"`
saxonb-xslt -xsl:ddi-to-solr.xsl -s:$IN_FN -o:$OUT_FN
curl http://localhost:8983/solr/update -H \
      'Content-type:text/xml; charset=utf-8' --data-binary @$OUT_FN
curl http://localhost:8983/solr/update -F stream.body=' <commit />'
curl http://localhost:8983/solr/update -F stream.body=' <optimize />'
