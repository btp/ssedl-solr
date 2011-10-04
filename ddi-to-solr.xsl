<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:template match="/">
   <add allowDups="false">
      <doc>
         <field name="id"><xsl:value-of select="codeBook/@ID"/></field>
         <field name="study_search"><xsl:value-of select="codeBook/stdyDscr/citation"/> 
            <xsl:value-of select="codeBook/stdyDscr/stdyInfo/abstract"/>
            <xsl:value-of select="codeBook/stdyDscr/stdyInfo/sumDscr/universe"/>
            <xsl:value-of select="codeBook/stdyDscr/method/dataColl"/>
         </field>
         <field name="format">Study</field>
         <field name="archive_facet"><xsl:value-of select="codeBook/docDscr/citation/prodStmt/producer"/></field>
         <field name="archive_code"><xsl:value-of select="codeBook/docDscr/citation/prodStmt/producer/@abbr"/></field>
         <field name="archive_display">
            &lt;a href="/catalog/<xsl:value-of select="lower-case(codeBook/docDscr/citation/prodStmt/producer/@abbr)"/>"&gt;<xsl:value-of select="codeBook/docDscr/citation/prodStmt/producer"/>&lt;/a&gt;
         </field>
         <field name="title_display"><xsl:value-of select="codeBook/stdyDscr/citation/titlStmt/titl"/></field>
         <field name="study_title_display"><xsl:value-of select="codeBook/stdyDscr/citation/titlStmt/titl"/></field>
         <field name="abbr_display"><xsl:value-of select="codeBook/stdyDscr/citation/titlStmt/altTitl"/></field>
         <xsl:for-each select="codeBook/otherMat">
            <xsl:if test="contains(labl,'User')">
               <field name="download_use_display">
                  &lt;a class="download" href="/download/<xsl:value-of select="/codeBook/@ID"/>/<xsl:value-of select="/codeBook/@ID"/>use.zip"&gt;Download User's Guide&lt;/a&gt;
               </field>
            </xsl:if>
            <xsl:if test="contains(labl,'Study')">
               <field name="download_study_display">
                  &lt;a class="download" href="/download/<xsl:value-of select="/codeBook/@ID"/>/<xsl:value-of select="/codeBook/@ID"/>.zip"&gt;Download Study&lt;/a&gt;
               </field>
            </xsl:if>
            <xsl:if test="contains(labl,'Instrument')">
               <field name="download_ins_display">
                  &lt;a class="download" href="/download/<xsl:value-of select="/codeBook/@ID"/>/<xsl:value-of select="/codeBook/@ID"/>ins.zip"&gt;Download Instrument(s)&lt;/a&gt;
               </field>
            </xsl:if>
            <xsl:if test="contains(labl,'Supplementary')">
               <field name="download_sup_display">
                  &lt;a class="download" href="/download/<xsl:value-of select="/codeBook/@ID"/>/<xsl:value-of select="/codeBook/@ID"/>sup.zip"&gt;Download Supplementary Materials&lt;/a&gt;
               </field>
            </xsl:if>
         </xsl:for-each>
         <field name="download_ddi2-1_display">
            &lt;a class="download" href="/download/<xsl:value-of select="codeBook/@ID"/>/<xsl:value-of select="codeBook/@ID"/>.xml"&gt;Download &lt;abbr title="Data Documentation Initiative"&gt;DDI&lt;/abbr&gt; 2.1 Codebook&lt;/a&gt;
         </field>
         <xsl:for-each select="codeBook/stdyDscr/citation/rspStmt/AuthEnty">
            <field name="investigator_facet"><xsl:value-of select="."/></field>
         </xsl:for-each>
         <xsl:for-each select="codeBook/stdyDscr/citation/prodStmt/fundAg">
            <field name="funder_display"><xsl:value-of select="."/></field>
         </xsl:for-each>
         <xsl:for-each select="codeBook/stdyDscr/method/dataColl/dataCollector">
            <field name="collector_display"><xsl:value-of select="."/></field>
         </xsl:for-each>
         <xsl:for-each select="codeBook/stdyDscr/stdyInfo/sumDscr/nation">
            <field name="nation_facet"><xsl:value-of select="."/></field>
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
                           &lt;/ol&gt;&lt;br/&gt;
                        </xsl:when>
                        <xsl:otherwise>
                           &lt;ul&gt;
                           <xsl:for-each select="itm">
                              &lt;li&gt;
                              <xsl:value-of select="."/>
                              &lt;/li&gt;
                           </xsl:for-each>
                           &lt;/ul&gt;&lt;br/&gt;
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
                           &lt;/ol&gt;&lt;br/&gt;
                        </xsl:when>
                        <xsl:otherwise>
                           &lt;ul&gt;
                           <xsl:for-each select="itm">
                              &lt;li&gt;
                              <xsl:value-of select="."/>
                              &lt;/li&gt;
                           </xsl:for-each>
                           &lt;/ul&gt;&lt;br/&gt;
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
                           &lt;/ol&gt;&lt;br/&gt;
                        </xsl:when>
                        <xsl:otherwise>
                           &lt;ul&gt;
                           <xsl:for-each select="itm">
                              &lt;li&gt;
                              <xsl:value-of select="."/>
                              &lt;/li&gt;
                           </xsl:for-each>
                           &lt;/ul&gt;&lt;br/&gt;
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
                           &lt;/ol&gt;&lt;br/&gt;
                        </xsl:when>
                        <xsl:otherwise>
                           &lt;ul&gt;
                           <xsl:for-each select="itm">
                              &lt;li&gt;
                              <xsl:value-of select="."/>
                              &lt;/li&gt;
                           </xsl:for-each>
                           &lt;/ul&gt;&lt;br/&gt;
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
         <xsl:if test="codeBook/stdyDscr/method/anlyInfo/respRate">
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
                              &lt;/ol&gt;&lt;br/&gt;
                           </xsl:when>
                           <xsl:otherwise>
                              &lt;ul&gt;
                              <xsl:for-each select="itm">
                                 &lt;li&gt;
                                 <xsl:value-of select="."/>
                                 &lt;/li&gt;
                              </xsl:for-each>
                              &lt;/ul&gt;&lt;br/&gt;
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
         </xsl:if>
         <xsl:for-each select="codeBook/stdyDscr/stdyInfo/sumDscr/collDate/@date">
            <field name="date"><xsl:value-of select="." /></field>
         </xsl:for-each>
      </doc>
      <xsl:for-each select="codeBook/dataDscr/var">
         <doc>
            <field name="id"><xsl:value-of select="../../@ID" />_<xsl:value-of select="@name"/></field>
            <field name="var_search"><xsl:value-of select="." /></field>
            <field name="var_name_display"><xsl:value-of select="@name"/></field>
            <field name="format">Variable</field>
            <field name="archive_facet"><xsl:value-of select="../../docDscr/citation/prodStmt/producer"/></field>
            <field name="archive_code"><xsl:value-of select="../../docDscr/citation/prodStmt/producer/@abbr"/></field>
            <field name="archive_display">
               &lt;a href="/catalog/<xsl:value-of select="lower-case(../../docDscr/citation/prodStmt/producer/@abbr)"/>"&gt;<xsl:value-of select="../../docDscr/citation/prodStmt/producer"/>&lt;/a&gt;
            </field>
            <field name="study_title_display">
               &lt;a href="/catalog/<xsl:value-of select="../../@ID"/>"&gt;<xsl:value-of select="../../stdyDscr/citation/titlStmt/titl"/>&lt;/a&gt;
            </field>
            <field name="abbr_display"><xsl:value-of select="../../stdyDscr/citation/titlStmt/altTitl"/></field>
            <field name="title_display"><xsl:value-of select="labl"/></field>
            <field name="var_label_display"><xsl:value-of select="labl"/></field>
            <xsl:variable name="topic" select="substring(@ID,1,2)"/>
            <xsl:variable name="type" select="substring(@ID,3,1)"/>
            <xsl:choose>
               <xsl:when test="$topic = 'AC'">
                  <field name="var_topic_facet">Agency Characteristics</field>
                  <field name="var_topic_code">AC</field>
               </xsl:when>
               <xsl:when test="$topic = 'MM'">
                  <field name="var_topic_facet">Mood Disorders</field>
                  <field name="var_topic_code">MM</field>
               </xsl:when>
               <xsl:when test="$topic = 'AD'">
                  <field name="var_topic_facet">Adoption/Foster Care</field>
                  <field name="var_topic_code">AD</field>
               </xsl:when>
               <xsl:when test="$topic = 'MO'">
                  <field name="var_topic_facet">Residential Mobility</field>
                  <field name="var_topic_code">MO</field>
               </xsl:when>
               <xsl:when test="$topic = 'AG'">
                  <field name="var_topic_facet">Age</field>
                  <field name="var_topic_code">AG</field>
               </xsl:when>
               <xsl:when test="$topic = 'MP'">
                  <field name="var_topic_facet">Psychoactive Substance-Use Disorder</field>
                  <field name="var_topic_code">MP</field>
               </xsl:when>
               <xsl:when test="$topic = 'BC'">
                  <field name="var_topic_facet">Board &amp; Care/Residential Care</field>
                  <field name="var_topic_code">BC</field>
			</xsl:when>
			<xsl:when test="$topic = 'MS'">
				<field name="var_topic_facet">Somatoform Disorders</field>
                  <field name="var_topic_code">MS</field>
			</xsl:when>
			<xsl:when test="$topic = 'BF'">
				<field name="var_topic_facet">Biological Function/Effects of Aging</field>
                  <field name="var_topic_code">BF</field>
			</xsl:when>
			<xsl:when test="$topic = 'MZ'">
				<field name="var_topic_facet">Schizophrenia</field>
                  <field name="var_topic_code">MZ</field>
			</xsl:when>
			<xsl:when test="$topic = 'CB'">
				<field name="var_topic_facet">Childbearing/Pregnancy</field>
                  <field name="var_topic_code">CB</field>
			</xsl:when>
			<xsl:when test="$topic = 'NC'">
				<field name="var_topic_facet">Neighborhood/Community</field>
                  <field name="var_topic_code">NC</field>
			</xsl:when>
			<xsl:when test="$topic = 'CC'">
				<field name="var_topic_facet">Caregiving/Child Care</field>
                  <field name="var_topic_code">CC</field>
			</xsl:when>
			<xsl:when test="$topic = 'NH'">
				<field name="var_topic_facet">Nursing Home</field>
                  <field name="var_topic_code">NH</field>
			</xsl:when>
			<xsl:when test="$topic = 'CI'">
				<field name="var_topic_facet">Crime/Delinquency/Behavior Problems</field>
                  <field name="var_topic_code">CI</field>
			</xsl:when>
			<xsl:when test="$topic = 'NK'">
				<field name="var_topic_facet">Relationships with Non-Kin</field>
                  <field name="var_topic_code">NK</field>
			</xsl:when>
			<xsl:when test="$topic = 'CL'">
				<field name="var_topic_facet">Clinical Activities</field>
                  <field name="var_topic_code">CL</field>
			</xsl:when>
			<xsl:when test="$topic = 'NU'">
				<field name="var_topic_facet">Nutrition</field>
                  <field name="var_topic_code">NU</field>
			</xsl:when>
			<xsl:when test="$topic = 'CO'">
				<field name="var_topic_facet">Cohabitation</field>
                  <field name="var_topic_code">CO</field>
			</xsl:when>
			<xsl:when test="$topic = 'OC'">
				<field name="var_topic_facet">Occupation/Employment/Retirement</field>
                  <field name="var_topic_code">OC</field>
			</xsl:when>
			<xsl:when test="$topic = 'CP'">
				<field name="var_topic_facet">Civic/Political Activities</field>
                  <field name="var_topic_code">CP</field>
			</xsl:when>
			<xsl:when test="$topic = 'OT'">
				<field name="var_topic_facet">Other</field>
                  <field name="var_topic_code">OT</field>
			</xsl:when>
			<xsl:when test="$topic = 'DC'">
				<field name="var_topic_facet">Dating/Courtship</field>
                  <field name="var_topic_code">DC</field>
			</xsl:when>
			<xsl:when test="$topic = 'PC'">
				<field name="var_topic_facet">Parent-Child Relationships</field>
                  <field name="var_topic_code">PC</field>
			</xsl:when>
			<xsl:when test="$topic = 'DW'">
				<field name="var_topic_facet">Dwelling</field>
                  <field name="var_topic_code">DW</field>
			</xsl:when>
			<xsl:when test="$topic = 'PE'">
				<field name="var_topic_facet">Personality</field>
                  <field name="var_topic_code">PE</field>
			</xsl:when>
			<xsl:when test="$topic = 'ED'">
				<field name="var_topic_facet">Education</field>
                  <field name="var_topic_code">ED</field>
			</xsl:when>
			<xsl:when test="$topic = 'PF'">
				<field name="var_topic_facet">Psychological Functioning/Development</field>
                  <field name="var_topic_code">PF</field>
			</xsl:when>
			<xsl:when test="$topic = 'FS'">
				<field name="var_topic_facet">Friends/Social Activities/Social Support</field>
                  <field name="var_topic_code">FS</field>
			</xsl:when>
			<xsl:when test="$topic = 'PP'">
				<field name="var_topic_facet">Inter-Partner Relationships</field>
                  <field name="var_topic_code">PP</field>
			</xsl:when>
			<xsl:when test="$topic = 'GC'">
				<field name="var_topic_facet">Guidance/Counseling</field>
                  <field name="var_topic_code">GC</field>
			</xsl:when>
			<xsl:when test="$topic = 'PS'">
				<field name="var_topic_facet">Psychiatric Hospitals</field>
                  <field name="var_topic_code">PS</field>
			</xsl:when>
			<xsl:when test="$topic = 'GR'">
				<field name="var_topic_facet">Gender/Gender Role</field>
                  <field name="var_topic_code">GR</field>
			</xsl:when>
			<xsl:when test="$topic = 'RA'">
				<field name="var_topic_facet">Race/Ethnicity</field>
                  <field name="var_topic_code">RA</field>
			</xsl:when>
			<xsl:when test="$topic = 'HC'">
				<field name="var_topic_facet">Inter-Other Family/Household Characteristics</field>
                  <field name="var_topic_code">HC</field>
			</xsl:when>
			<xsl:when test="$topic = 'RB'">
				<field name="var_topic_facet">Reproductive Behavior</field>
                  <field name="var_topic_code">RB</field>
			</xsl:when>
			<xsl:when test="$topic = 'HL'">
				<field name="var_topic_facet">Physical Health/Disease/Function</field>
                  <field name="var_topic_code">HL</field>
			</xsl:when>
			<xsl:when test="$topic = 'RC'">
				<field name="var_topic_facet">Recreation</field>
                  <field name="var_topic_code">RC</field>
			</xsl:when>
			<xsl:when test="$topic = 'HO'">
				<field name="var_topic_facet">Hospital/Inpatient Acute Care</field>
                  <field name="var_topic_code">HO</field>
			</xsl:when>
			<xsl:when test="$topic = 'RE'">
				<field name="var_topic_facet">Region/State</field>
                  <field name="var_topic_code">RE</field>
			</xsl:when>
			<xsl:when test="$topic = 'HS'">
				<field name="var_topic_facet">Family/Household Structure/Composition</field>
                  <field name="var_topic_code">HS</field>
			</xsl:when>
			<xsl:when test="$topic = 'RL'">
				<field name="var_topic_facet">Religion/Ethics</field>
                  <field name="var_topic_code">RL</field>
			</xsl:when>
			<xsl:when test="$topic = 'IN'">
				<field name="var_topic_facet">Intellectual Function</field>
                  <field name="var_topic_code">IN</field>
			</xsl:when>
			<xsl:when test="$topic = 'RS'">
				<field name="var_topic_facet">Receipt of Health, Mental Health, Social Services</field>
                  <field name="var_topic_code">RS</field>
			</xsl:when>
			<xsl:when test="$topic = 'IS'">
				<field name="var_topic_facet">Institutions, Not Specified</field>
                  <field name="var_topic_code">IS</field>
			</xsl:when>
			<xsl:when test="$topic = 'SA'">
				<field name="var_topic_facet">Substance Use</field>
                  <field name="var_topic_code">SA</field>
			</xsl:when>
			<xsl:when test="$topic = 'IV'">
				<field name="var_topic_facet">Interview</field>
                  <field name="var_topic_code">IV</field>
			</xsl:when>
			<xsl:when test="$topic = 'SD'">
				<field name="var_topic_facet">Sexually Transmitted Disease</field>
                  <field name="var_topic_code">SD</field>
			</xsl:when>
			<xsl:when test="$topic = 'KR'">
				<field name="var_topic_facet">Relationships with Other Kin</field>
                  <field name="var_topic_code">KR</field>
			</xsl:when>
			<xsl:when test="$topic = 'SE'">
				<field name="var_topic_facet">Sex Education</field>
                  <field name="var_topic_code">SE</field>
			</xsl:when>
			<xsl:when test="$topic = 'MA'">
				<field name="var_topic_facet">Anxiety Disorders</field>
                  <field name="var_topic_code">MA</field>
			</xsl:when>
			<xsl:when test="$topic = 'SH'">
				<field name="var_topic_facet">State Hospital</field>
                  <field name="var_topic_code">SH</field>
			</xsl:when>
			<xsl:when test="$topic = 'MD'">
				<field name="var_topic_facet">Marriage/Cohabitation Patterns</field>
                  <field name="var_topic_code">MD</field>
			</xsl:when>
			<xsl:when test="$topic = 'SS'">
				<field name="var_topic_facet">Inter-sibling Relationships</field>
                  <field name="var_topic_code">SS</field>
			</xsl:when>
			<xsl:when test="$topic = 'ME'">
				<field name="var_topic_facet">Meta Level</field>
                  <field name="var_topic_code">ME</field>
			</xsl:when>
			<xsl:when test="$topic = 'SX'">
				<field name="var_topic_facet">Sexuality</field>
                  <field name="var_topic_code">SX</field>
			</xsl:when>
			<xsl:when test="$topic = 'MG'">
				<field name="var_topic_facet">Organic Mental Syndromes</field>
                  <field name="var_topic_code">MG</field>
			</xsl:when>
			<xsl:when test="$topic = 'TP'">
				<field name="var_topic_facet">Transfer Payments</field>
                  <field name="var_topic_code">TP</field>
			</xsl:when>
			<xsl:when test="$topic = 'MH'">
				<field name="var_topic_facet">Other Mental Health Disorders</field>
                  <field name="var_topic_code">MH</field>
			</xsl:when>
			<xsl:when test="$topic = 'UN'">
				<field name="var_topic_facet">Undocumented</field>
                  <field name="var_topic_code">UN</field>
			</xsl:when>
			<xsl:when test="$topic = 'MI'">
				<field name="var_topic_facet">Mental Institutions</field>
                  <field name="var_topic_code">MI</field>
			</xsl:when>
			<xsl:when test="$topic = 'WF'">
				<field name="var_topic_facet">Wealth/Finances/Material Things</field>
                  <field name="var_topic_code">WF</field>
			</xsl:when>
			<xsl:otherwise>
				<field name="var_topic_facet">No Value</field>				
			</xsl:otherwise>
		</xsl:choose>
				<xsl:choose>
			<xsl:when test="$type = 'A'">
				<field name="var_type_facet">Attitudes/Values</field>
                  <field name="var_type_code">A</field>
			</xsl:when>
			<xsl:when test="$type = 'B'">
				<field name="var_type_facet">Behavior</field>
                  <field name="var_type_code">B</field>
			</xsl:when>
			<xsl:when test="$type = 'C'">
				<field name="var_type_facet">Cognition</field>
                  <field name="var_type_code">C</field>
			</xsl:when>
			<xsl:when test="$type = 'E'">
				<field name="var_type_facet">Emotion</field>
                  <field name="var_type_code">E</field>
			</xsl:when>
			<xsl:when test="$type = 'H'">
				<field name="var_type_facet">History</field>
                  <field name="var_type_code">H</field>
			</xsl:when>
			<xsl:when test="$type = 'I'">
				<field name="var_type_facet">Intention</field>
                  <field name="var_type_code">I</field>
			</xsl:when>
			<xsl:when test="$type = 'M'">
				<field name="var_type_facet">Motivation</field>
                  <field name="var_type_code">M</field>
			</xsl:when>
			<xsl:when test="$type = 'O'">
				<field name="var_type_facet">Other</field>
                  <field name="var_type_code">O</field>
			</xsl:when>
			<xsl:when test="$type = 'P'">
				<field name="var_type_facet">Program/Policy</field>
                  <field name="var_type_code">P</field>
			</xsl:when>
			<xsl:when test="$type = 'R'">
				<field name="var_type_facet">Reason</field>
                  <field name="var_type_code">R</field>
			</xsl:when>
			<xsl:when test="$type = 'S'">
				<field name="var_type_facet">Status</field>
                  <field name="var_type_code">S</field>
			</xsl:when>
			<xsl:when test="$type = 'T'">
				<field name="var_type_facet">Personality Trait</field>
                  <field name="var_type_code">T</field>
			</xsl:when>
			<xsl:when test="$type = 'U'">
				<field name="var_type_facet">Undocumented</field>
                  <field name="var_type_code">U</field>
			</xsl:when>
			<xsl:when test="$type = 'V'">
				<field name="var_type_facet">Time Use</field>
                  <field name="var_type_code">V</field>
			</xsl:when>
			<xsl:when test="$type = 'X'">
				<field name="var_type_facet">Meta</field>
                  <field name="var_type_code">X</field>
			</xsl:when>
			<xsl:when test="$type = 'Y'">
				<field name="var_type_facet">Aggregate/Incidence/Prevalence</field>
                  <field name="var_type_code">Y</field>
			</xsl:when>
			<xsl:when test="$type = 'Z'">
				<field name="var_type_facet">Household</field>
                  <field name="var_type_code">Z</field>
			</xsl:when>
			<xsl:otherwise>
				<field name="var_type_facet">No Value</field>				
			</xsl:otherwise>
		</xsl:choose>
		<field name="var_alphanum_facet"><xsl:value-of select="varFormat/@type"/></field>
                <field name="val_display">
                &lt;p&gt;Summary Statistics:&lt;/p&gt;
                &lt;ul&gt;
                   <xsl:if test="valrng">
                      &lt;li&gt;Range: <xsl:value-of select="valrng/range/@min"/> to <xsl:value-of select="valrng/range/@max"/>&lt;/li&gt;
                   </xsl:if>
                   &lt;li&gt;Total Responses: <xsl:value-of select="sum(sumStat[@type='vald'],sumStat[@type='invd'])"/>&lt;/li&gt;
                   &lt;li&gt;Valid: <xsl:value-of select="sumStat[@type='vald']"/>&lt;/li&gt;
                   &lt;li&gt;Invalid: <xsl:value-of select="sumStat[@type='invd']"/>&lt;/li&gt;
                   <xsl:if test="sumStat[@type='min']">
                      &lt;li&gt;Minimum: <xsl:value-of select="sumStat[@type='min']"/>&lt;/li&gt;
                   </xsl:if>
                   <xsl:if test="sumStat[@type='max']">
                      &lt;li&gt;Maximum: <xsl:value-of select="sumStat[@type='max']"/>&lt;/li&gt;
                   </xsl:if>
                   <xsl:if test="sumStat[@type='mean']">
                      &lt;li&gt;Mean: <xsl:value-of select="sumStat[@type='mean']"/>&lt;/li&gt;
                   </xsl:if>
                   <xsl:if test="sumStat[@type='stdev']">
                      &lt;li&gt;Standard Deviation: <xsl:value-of select="sumStat[@type='stdev']"/>&lt;/li&gt;
                   </xsl:if>
                   &lt;/ul&gt;&lt;br/&gt;
                <xsl:if test="catgry">
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
                                  <xsl:value-of select="catValu"/>
                                  <![CDATA[
                               </th>
                               <td>
                                  ]]>
                                  <xsl:value-of select="labl"/>
                                  <![CDATA[
                               </td>
                               <td style="text-align: right;">
                                  ]]>
                                  <xsl:value-of select="catStat[@type='freq']"/>
                                  <![CDATA[
                               </td>
                            </tr>
                                  ]]>
	                 </xsl:for-each>
	           <![CDATA[
	                    <tr>
                               <th>Total</th>
                               <td> </td>
                               <td style="text-align: right;">
                   ]]>
                   <xsl:value-of select="sum(sumStat[@type='vald'],sumStat[@type='invd'])"/>
                   <![CDATA[
                              </td>
                           </tr>
                      </tbody>
                   </table>
                   ]]>
                   </xsl:if>
                </field>
	</doc>
	</xsl:for-each>			
  </add>
</xsl:template>
</xsl:stylesheet>
