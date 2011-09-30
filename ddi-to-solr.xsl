<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:template match="/">
  <add allowDups="false">
  		
  		
	<doc>
		<field name="id"><xsl:value-of select="codeBook/@ID" /></field>
		<field name="study_search"><xsl:value-of select="codeBook/stdyDscr/citation" /> 
			<xsl:value-of select="codeBook/stdyDscr/stdyInfo/abstract" />
			<xsl:value-of select="codeBook/stdyDscr/stdyInfo/sumDscr/universe" />
			<xsl:value-of select="codeBook/stdyDscr/method/dataColl" />
		</field>
		<field name="format">Study</field>
		<field name="archive_facet"><xsl:value-of select="codeBook/docDscr/citation/prodStmt/producer" /></field>
		<field name="title_display"><xsl:value-of select="codeBook/stdyDscr/citation/titlStmt/titl" /></field>
		<field name="study_title_display"><xsl:value-of select="codeBook/stdyDscr/citation/titlStmt/titl" /></field>
		<field name="abbr_display"><xsl:value-of select="codeBook/stdyDscr/citation/titlStmt/altTitl" /></field>
		<xsl:for-each select="codeBook/stdyDscr/citation/rspStmt/AuthEnty">
			<field name="investigator_facet"><xsl:value-of select="." /></field>
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
                <field name="abstract_display">
                   <xsl:for-each select="codeBook/stdyDscr/stdyInfo/abstract/*">
                      <xsl:choose>
                         <xsl:when test="name() = 'list'">
                            <xsl:choose>
                               <xsl:when test="@type = 'ordered'">
                                  &lt;ol&gt;
                                  <xsl:for-each select="itm">
                                     &lt;li&gt;
                                     <xsl:value-of select="."/>
                                     &lt;/li&gt;
                                  </xsl:for-each>
                                  &lt;/ol&gt;
                               </xsl:when>
                               <xsl:otherwise>
                                  &lt;ul&gt;
                                  <xsl:for-each select="itm">
                                     &lt;li&gt;
                                     <xsl:value-of select="."/>
                                     &lt;/li&gt;
                                  </xsl:for-each>
                                  &lt;/ul&gt;
                               </xsl:otherwise>
                            </xsl:choose>
                         </xsl:when>
                         <xsl:otherwise>
                            &lt;p&gt;
                            <xsl:value-of select="."/>
                            &lt;/p&gt;
                         </xsl:otherwise>
                      </xsl:choose>
                   </xsl:for-each>
                   <xsl:if test="not(codeBook/stdyDscr/stdyInfo/abstract/*)">
                      &lt;p&gt;
                      <xsl:value-of select="codeBook/stdyDscr/stdyInfo/abstract"/>
                      &lt;/p&gt;
                   </xsl:if>
                </field>
                <field name="universe_display">
                   <xsl:for-each select="codeBook/stdyDscr/stdyInfo/sumDscr/universe/*">
                      <xsl:choose>
                         <xsl:when test="name() = 'list'">
                            <xsl:choose>
                               <xsl:when test="@type = 'ordered'">
                                  &lt;ol&gt;
                                  <xsl:for-each select="itm">
                                     &lt;li&gt;
                                     <xsl:value-of select="."/>
                                     &lt;/li&gt;
                                  </xsl:for-each>
                                  &lt;/ol&gt;
                               </xsl:when>
                               <xsl:otherwise>
                                  &lt;ul&gt;
                                  <xsl:for-each select="itm">
                                     &lt;li&gt;
                                     <xsl:value-of select="."/>
                                     &lt;/li&gt;
                                  </xsl:for-each>
                                  &lt;/ul&gt;
                               </xsl:otherwise>
                            </xsl:choose>
                         </xsl:when>
                         <xsl:otherwise>
                            &lt;p&gt;
                            <xsl:value-of select="."/>
                            &lt;/p&gt;
                         </xsl:otherwise>
                      </xsl:choose>
                   </xsl:for-each>
                   <xsl:if test="not(codeBook/stdyDscr/stdyInfo/sumDscr/universe/*)">
                      &lt;p&gt;
                      <xsl:value-of select="codeBook/stdyDscr/stdyInfo/sumDscr/universe"/>
                      &lt;/p&gt;
                   </xsl:if>
                </field>
                <field name="sampling_display">
                   <xsl:for-each select="codeBook/stdyDscr/method/dataColl/sampProc/*">
                      <xsl:choose>
                         <xsl:when test="name() = 'list'">
                            <xsl:choose>
                               <xsl:when test="@type = 'ordered'">
                                  &lt;ol&gt;
                                  <xsl:for-each select="itm">
                                     &lt;li&gt;
                                     <xsl:value-of select="."/>
                                     &lt;/li&gt;
                                  </xsl:for-each>
                                  &lt;/ol&gt;
                               </xsl:when>
                               <xsl:otherwise>
                                  &lt;ul&gt;
                                  <xsl:for-each select="itm">
                                     &lt;li&gt;
                                     <xsl:value-of select="."/>
                                     &lt;/li&gt;
                                  </xsl:for-each>
                                  &lt;/ul&gt;
                               </xsl:otherwise>
                            </xsl:choose>
                         </xsl:when>
                         <xsl:otherwise>
                            &lt;p&gt;
                            <xsl:value-of select="."/>
                            &lt;/p&gt;
                         </xsl:otherwise>
                      </xsl:choose>
                   </xsl:for-each>
                   <xsl:if test="not(codeBook/stdyDscr/method/dataColl/sampProc/*)">
                      &lt;p&gt;
                      <xsl:value-of select="codeBook/stdyDscr/method/dataColl/sampProc"/>
                      &lt;/p&gt;
                   </xsl:if>
                </field>
                <field name="instrument_display">
                   <xsl:for-each select="codeBook/stdyDscr/method/dataColl/resInstru/*">
                      <xsl:choose>
                         <xsl:when test="name() = 'list'">
                            <xsl:choose>
                               <xsl:when test="@type = 'ordered'">
                                  &lt;ol&gt;
                                  <xsl:for-each select="itm">
                                     &lt;li&gt;
                                     <xsl:value-of select="."/>
                                     &lt;/li&gt;
                                  </xsl:for-each>
                                  &lt;/ol&gt;
                               </xsl:when>
                               <xsl:otherwise>
                                  &lt;ul&gt;
                                  <xsl:for-each select="itm">
                                     &lt;li&gt;
                                     <xsl:value-of select="."/>
                                     &lt;/li&gt;
                                  </xsl:for-each>
                                  &lt;/ul&gt;
                               </xsl:otherwise>
                            </xsl:choose>
                         </xsl:when>
                         <xsl:otherwise>
                            &lt;p&gt;
                            <xsl:value-of select="."/>
                            &lt;/p&gt;
                         </xsl:otherwise>
                      </xsl:choose>
                   </xsl:for-each>
                   <xsl:if test="not(codeBook/stdyDscr/method/dataColl/resInstru/*)">
                      &lt;p&gt;
                      <xsl:value-of select="codeBook/stdyDscr/method/dataColl/resInstru"/>
                      &lt;/p&gt;
                   </xsl:if>
                </field>
                <field name="response_display">
                   <xsl:for-each select="codeBook/stdyDscr/method/anlyInfo/respRate/*">
                      <xsl:choose>
                         <xsl:when test="name() = 'list'">
                            <xsl:choose>
                               <xsl:when test="@type = 'ordered'">
                                  &lt;ol&gt;
                                  <xsl:for-each select="itm">
                                     &lt;li&gt;
                                     <xsl:value-of select="."/>
                                     &lt;/li&gt;
                                  </xsl:for-each>
                                  &lt;/ol&gt;
                               </xsl:when>
                               <xsl:otherwise>
                                  &lt;ul&gt;
                                  <xsl:for-each select="itm">
                                     &lt;li&gt;
                                     <xsl:value-of select="."/>
                                     &lt;/li&gt;
                                  </xsl:for-each>
                                  &lt;/ul&gt;
                               </xsl:otherwise>
                            </xsl:choose>
                         </xsl:when>
                         <xsl:otherwise>
                            &lt;p&gt;
                            <xsl:value-of select="."/>
                            &lt;/p&gt;
                         </xsl:otherwise>
                      </xsl:choose>
                   </xsl:for-each>
                   <xsl:if test="not(codeBook/stdyDscr/method/anlyInfo/respRate/*)">
                      &lt;p&gt;
                      <xsl:value-of select="codeBook/stdyDscr/method/anlyInfo/respRate"/>
                      &lt;/p&gt;
                   </xsl:if>
                </field>
		<xsl:for-each select="codeBook/stdyDscr/stdyInfo/sumDscr/collDate/@date">
			<field name="date"><xsl:value-of select="." /></field>
		</xsl:for-each>
	</doc>
	<xsl:for-each select="codeBook/dataDscr/var">
	<doc>
		<field name="id"><xsl:value-of select="../../@ID" />_<xsl:value-of select="@name" /></field>
		<field name="var_search"><xsl:value-of select="." /></field>
 
		<field name="var_name_display"><xsl:value-of select="@name" /></field>
		<field name="format">Variable</field>	
                <field name="archive_facet"><xsl:value-of select="../../docDscr/citation/prodStmt/producer" /></field>
		<field name="study_title_display"><xsl:value-of select="../../stdyDscr/citation/titlStmt/titl" /></field>
		<field name="abbr_display"><xsl:value-of select="../../stdyDscr/citation/titlStmt/altTitl" /></field>
		<field name="title_display"><xsl:value-of select="labl" /></field>
		<field name="var_label_display"><xsl:value-of select="labl" /></field>
		<xsl:variable name="topic" select="substring(@ID,1,2)" />
		<xsl:variable name="type" select="substring(@ID,3,1)" />
		<xsl:choose>
			<xsl:when test="$topic = 'AC'">
				<field name="var_topic_facet">Agency Characteristics</field>
			</xsl:when>
			<xsl:when test="$topic = 'MM'">
				<field name="var_topic_facet">Mood Disorders</field>
			</xsl:when>
			<xsl:when test="$topic = 'AD'">
				<field name="var_topic_facet">Adoption/Foster Care</field>
			</xsl:when>
			<xsl:when test="$topic = 'MO'">
				<field name="var_topic_facet">Residential Mobilityl</field>
			</xsl:when>
			<xsl:when test="$topic = 'AG'">
				<field name="var_topic_facet">Age</field>
			</xsl:when>
			<xsl:when test="$topic = 'MP'">
				<field name="var_topic_facet">Psychoactive Substance-Use Disorder</field>
			</xsl:when>
			<xsl:when test="$topic = 'BC'">
				<field name="var_topic_facet">Board &amp; Care/Residential Care</field>
			</xsl:when>
			<xsl:when test="$topic = 'MS'">
				<field name="var_topic_facet">Somatoform Disorders</field>
			</xsl:when>
			<xsl:when test="$topic = 'BF'">
				<field name="var_topic_facet">Biological Function/Effects of Aging</field>
			</xsl:when>
			<xsl:when test="$topic = 'MZ'">
				<field name="var_topic_facet">Schizophrenia</field>
			</xsl:when>
			<xsl:when test="$topic = 'CB'">
				<field name="var_topic_facet">Childbearing/Pregnancy</field>
			</xsl:when>
			<xsl:when test="$topic = 'NC'">
				<field name="var_topic_facet">Neighborhood/Community</field>
			</xsl:when>
			<xsl:when test="$topic = 'CC'">
				<field name="var_topic_facet">Caregiving/Child Care</field>
			</xsl:when>
			<xsl:when test="$topic = 'NH'">
				<field name="var_topic_facet">Nursing Home</field>
			</xsl:when>
			<xsl:when test="$topic = 'CI'">
				<field name="var_topic_facet">Crime/Delinquency/Behavior Problems</field>
			</xsl:when>
			<xsl:when test="$topic = 'NK'">
				<field name="var_topic_facet">Relationships with Non-Kin</field>
			</xsl:when>
			<xsl:when test="$topic = 'CL'">
				<field name="var_topic_facet">Clinical Activities</field>
			</xsl:when>
			<xsl:when test="$topic = 'NU'">
				<field name="var_topic_facet">Nutrition</field>
			</xsl:when>
			<xsl:when test="$topic = 'CO'">
				<field name="var_topic_facet">Cohabitation</field>
			</xsl:when>
			<xsl:when test="$topic = 'OC'">
				<field name="var_topic_facet">Occupation/Employment/Retirement</field>
			</xsl:when>
			<xsl:when test="$topic = 'CP'">
				<field name="var_topic_facet">Civic/Political Activities</field>
			</xsl:when>
			<xsl:when test="$topic = 'OT'">
				<field name="var_topic_facet">Other</field>
			</xsl:when>
			<xsl:when test="$topic = 'DC'">
				<field name="var_topic_facet">Dating/Courtship</field>
			</xsl:when>
			<xsl:when test="$topic = 'PC'">
				<field name="var_topic_facet">Parent-Child Relationships</field>
			</xsl:when>
			<xsl:when test="$topic = 'DW'">
				<field name="var_topic_facet">Dwelling</field>
			</xsl:when>
			<xsl:when test="$topic = 'PE'">
				<field name="var_topic_facet">Personality</field>
			</xsl:when>
			<xsl:when test="$topic = 'ED'">
				<field name="var_topic_facet">Education</field>
			</xsl:when>
			<xsl:when test="$topic = 'PF'">
				<field name="var_topic_facet">Psychological Functioning/Development</field>
			</xsl:when>
			<xsl:when test="$topic = 'FS'">
				<field name="var_topic_facet">Friends/Social Activities/Social Support</field>
			</xsl:when>
			<xsl:when test="$topic = 'PP'">
				<field name="var_topic_facet">Inter-Partner Relationships</field>
			</xsl:when>
			<xsl:when test="$topic = 'GC'">
				<field name="var_topic_facet">Guidance/Counseling</field>
			</xsl:when>
			<xsl:when test="$topic = 'PS'">
				<field name="var_topic_facet">Psychiatric Hospitals</field>
			</xsl:when>
			<xsl:when test="$topic = 'GR'">
				<field name="var_topic_facet">Gender/Gender Role</field>
			</xsl:when>
			<xsl:when test="$topic = 'RA'">
				<field name="var_topic_facet">Race/Ethnicity</field>
			</xsl:when>
			<xsl:when test="$topic = 'HC'">
				<field name="var_topic_facet">Inter-Other Family/Household Characteristics</field>
			</xsl:when>
			<xsl:when test="$topic = 'RB'">
				<field name="var_topic_facet">Reproductive Behavior</field>
			</xsl:when>
			<xsl:when test="$topic = 'HL'">
				<field name="var_topic_facet">Physical Health/Disease/Function</field>
			</xsl:when>
			<xsl:when test="$topic = 'RC'">
				<field name="var_topic_facet">Recreation</field>
			</xsl:when>
			<xsl:when test="$topic = 'HO'">
				<field name="var_topic_facet">Hospital/Inpatient Acute Care</field>
			</xsl:when>
			<xsl:when test="$topic = 'RE'">
				<field name="var_topic_facet">Region/State</field>
			</xsl:when>
			<xsl:when test="$topic = 'HS'">
				<field name="var_topic_facet">Family/Household Structure/Composition</field>
			</xsl:when>
			<xsl:when test="$topic = 'RL'">
				<field name="var_topic_facet">Religion/Ethics</field>
			</xsl:when>
			<xsl:when test="$topic = 'IN'">
				<field name="var_topic_facet">Intellectual Function</field>
			</xsl:when>
			<xsl:when test="$topic = 'RS'">
				<field name="var_topic_facet">Receipt of Health, Mental Health, Social Services</field>
			</xsl:when>
			<xsl:when test="$topic = 'IS'">
				<field name="var_topic_facet">Institutions, not specified</field>
			</xsl:when>
			<xsl:when test="$topic = 'SA'">
				<field name="var_topic_facet">Substance Use</field>
			</xsl:when>
			<xsl:when test="$topic = 'IV'">
				<field name="var_topic_facet">Interview</field>
			</xsl:when>
			<xsl:when test="$topic = 'SD'">
				<field name="var_topic_facet">Sexually Transmitted Disease</field>
			</xsl:when>
			<xsl:when test="$topic = 'KR'">
				<field name="var_topic_facet">Relationships with Other Kin</field>
			</xsl:when>
			<xsl:when test="$topic = 'SE'">
				<field name="var_topic_facet">Sex Education</field>
			</xsl:when>
			<xsl:when test="$topic = 'MA'">
				<field name="var_topic_facet">Anxiety Disorders</field>
			</xsl:when>
			<xsl:when test="$topic = 'SH'">
				<field name="var_topic_facet">State Hospital</field>
			</xsl:when>
			<xsl:when test="$topic = 'MD'">
				<field name="var_topic_facet">Marriage/Cohabitation Patterns</field>
			</xsl:when>
			<xsl:when test="$topic = 'SS'">
				<field name="var_topic_facet">Inter-sibling Relationships</field>
			</xsl:when>
			<xsl:when test="$topic = 'ME'">
				<field name="var_topic_facet">Meta Level</field>
			</xsl:when>
			<xsl:when test="$topic = 'SX'">
				<field name="var_topic_facet">Sexuality</field>
			</xsl:when>
			<xsl:when test="$topic = 'MG'">
				<field name="var_topic_facet">Organic Mental Syndromes</field>
			</xsl:when>
			<xsl:when test="$topic = 'TP'">
				<field name="var_topic_facet">Transfer Payments</field>
			</xsl:when>
			<xsl:when test="$topic = 'MH'">
				<field name="var_topic_facet">Other Mental Health Disorders</field>
			</xsl:when>
			<xsl:when test="$topic = 'UN'">
				<field name="var_topic_facet">Undocumented</field>
			</xsl:when>
			<xsl:when test="$topic = 'MI'">
				<field name="var_topic_facet">Mental Institutions</field>
			</xsl:when>
			<xsl:when test="$topic = 'WF'">
				<field name="var_topic_facet">Wealth/Finances/Material Things</field>
			</xsl:when>
			<xsl:otherwise>
				<field name="var_topic_facet">No Value</field>				
			</xsl:otherwise>
		</xsl:choose>
				<xsl:choose>
			<xsl:when test="$type = 'A'">
				<field name="var_type_facet">Attitudes/Values</field>
			</xsl:when>
			<xsl:when test="$type = 'B'">
				<field name="var_type_facet">Behavior</field>
			</xsl:when>
			<xsl:when test="$type = 'C'">
				<field name="var_type_facet">Cognition</field>
			</xsl:when>
			<xsl:when test="$type = 'E'">
				<field name="var_type_facet">Emotion</field>
			</xsl:when>
			<xsl:when test="$type = 'H'">
				<field name="var_type_facet">History</field>
			</xsl:when>
			<xsl:when test="$type = 'I'">
				<field name="var_type_facet">Intention</field>
			</xsl:when>
			<xsl:when test="$type = 'M'">
				<field name="var_type_facet">Motivation</field>
			</xsl:when>
			<xsl:when test="$type = 'O'">
				<field name="var_type_facet">Other</field>
			</xsl:when>
			<xsl:when test="$type = 'P'">
				<field name="var_type_facet">Program/Policy</field>
			</xsl:when>
			<xsl:when test="$type = 'R'">
				<field name="var_type_facet">Reason</field>
			</xsl:when>
			<xsl:when test="$type = 'S'">
				<field name="var_type_facet">Status</field>
			</xsl:when>
			<xsl:when test="$type = 'T'">
				<field name="var_type_facet">Personality Trait</field>
			</xsl:when>
			<xsl:when test="$type = 'U'">
				<field name="var_type_facet">Undocumented</field>
			</xsl:when>
			<xsl:when test="$type = 'V'">
				<field name="var_type_facet">Time Use</field>
			</xsl:when>
			<xsl:when test="$type = 'X'">
				<field name="var_type_facet">Meta</field>
			</xsl:when>
			<xsl:when test="$type = 'Y'">
				<field name="var_type_facet">Aggregate/Incidence/Prevalence</field>
			</xsl:when>
			<xsl:when test="$type = 'Z'">
				<field name="var_type_facet">Household</field>
			</xsl:when>
			<xsl:otherwise>
				<field name="var_type_facet">No Value</field>				
			</xsl:otherwise>
		</xsl:choose>
		<field name="var_alphanum_facet"><xsl:value-of select="varFormat/@type" /></field>
                <field name="val_display">
                   <![CDATA[
                   <table border="1">
                      <tbody>
                         <tr><th>Value</th><th>Label</th><th>Frequency</th></tr>
                         ]]>
                         <xsl:for-each select="catgry">
                         <![CDATA[
                            <tr>
                               <th>
                         ]]>
                                  <xsl:value-of select="catValu" />
                                  <![CDATA[
                               </th>
                               <td>
                                  ]]>
                                  <xsl:value-of select="labl" />
                                  <![CDATA[
                               </td>
                               <td>
                                  ]]>
                                  <xsl:value-of select="catStat[@type='freq']" />
                                  <![CDATA[
                               </td>
                            </tr>
                                  ]]>
	                 </xsl:for-each>
	           <![CDATA[
                      </tbody>
                   </table>
                   ]]>
                   </field>
	</doc>
	</xsl:for-each>			
  </add>
</xsl:template>
</xsl:stylesheet>
