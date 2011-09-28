<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:template match="/">
  <add allowDups="false">
	<doc>
		<field name="id"><xsl:value-of select="codeBook/@ID" /></field>
		<field name="format">Study</field>
		<field name="archive_facet"><xsl:value-of select="codeBook/docDscr/citation/prodStmt/producer" /></field>
		<field name="title_display"><xsl:value-of select="codeBook/stdyDscr/citation/titlStmt/titl" /></field>
		<field name="abbr_display"><xsl:value-of select="codeBook/stdyDscr/citation/titlStmt/altTitl" /></field>
		<xsl:for-each select="codeBook/stdyDscr/citation/rspStmt/AuthEnty">
			<field name="investigator_display"><xsl:value-of select="." /></field>
		</xsl:for-each>
		<xsl:for-each select="codeBook/stdyDscr/citation/prodStmt/fundAg">
			<field name="funder_display"><xsl:value-of select="." /></field>
		</xsl:for-each>
		<xsl:for-each select="codeBook/stdyDscr/method/dataColl/dataCollector">
			<field name="collector_display"><xsl:value-of select="." /></field>
		</xsl:for-each>
		<xsl:for-each select="codeBook/stdyDscr/stdyInfo/sumDscr/nation">
		        <field name="nation_facet"><xsl:value-of select="." /></field>
		</xsl:for-each>
		<field name="abstract_display"><xsl:value-of select="codeBook/stdyDscr/stdyInfo/abstract" /></field>
		<field name="universe_display"><xsl:value-of select="codeBook/stdyDscr/stdyInfo/sumDscr/universe" /></field>
		<field name="sampling_display"><xsl:value-of select="codeBook/stdyDscr/method/dataColl/sampProc" /></field>
		<field name="instrument_display"><xsl:value-of select="codeBook/stdyDscr/method/dataColl/resInstru" /></field>
<!-- There is only one entry for this field.  No multiple entry.  There are multiple elements inside this element.  Do you want to include them in a separate tag?   -->
		<field name="response_display"><xsl:value-of select="codeBook/stdyDscr/method/anlyInfo/respRate" /></field>
		<xsl:for-each select="codeBook/stdyDscr/stdyInfo/sumDscr/collDate/@date">
			<field name="date"><xsl:value-of select="." /></field>
		</xsl:for-each>
	</doc>
	<xsl:for-each select="codeBook/dataDscr/var">
	<doc>
		<field name="id"><xsl:value-of select="../../@ID" />_<xsl:value-of select="@ID" /></field>
		<field name="format">Variable</field>	
                <field name="archive_facet"><xsl:value-of select="../../docDscr/citation/prodStmt/producer" /></field>
		<field name="title_display"><xsl:value-of select="../../stdyDscr/citation/titlStmt/titl" /></field>
		<field name="abbr_display"><xsl:value-of select="../../stdyDscr/citation/titlStmt/altTitl" /></field>
		<field name="var_label_display"><xsl:value-of select="labl" /></field>
		<field name="var_topic_facet"><xsl:value-of select="substring(@ID,1,2)" /></field>
		<field name="var_type_facet"><xsl:value-of select="substring(@ID,3,1)" /></field>
		<field name="var_alphanum_facet"><xsl:value-of select="varFormat/@type" /></field>
		<xsl:for-each select="catgry/labl">
			<field name="var_value_display"><xsl:value-of select="." /></field>
		</xsl:for-each>
	</doc>
	</xsl:for-each>			
  </add>
</xsl:template>
</xsl:stylesheet>
