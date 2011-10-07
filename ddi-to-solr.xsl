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
         <xsl:variable name="archive" select="codeBook/docDscr/citation/prodStmt/producer/@abbr"/>
         <field name="archive_code">
            <xsl:choose>
               <xsl:when test="$archive='AIDS-PETRA'">
                  AIDS
               </xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="codeBook/docDscr/citation/prodStmt/producer/@abbr"/>
               </xsl:otherwise>
            </xsl:choose>
         </field>
         <field name="archive_facet">
            <xsl:choose>
               <xsl:when test="$archive='AFDA'">
                  American Family Data Archive
               </xsl:when>
               <xsl:when test="$archive='AIDS' or 'AIDS-PETRA">
                  AIDS/STI Data Archive
               </xsl:when>
               <xsl:when test="$archive='CWP'">
                  Child Well-Being and Poverty Data Archive
               </xsl:when>
               <xsl:when test="$archive='CAMDA'">
                  Complementary and Alternative Medicine Data Archive
               </xsl:when>
               <xsl:when test="$archive='CDA'">
                  Contextual Data Archive
               </xsl:when>
               <xsl:when test="$archive='DASRA'">
                  Data Archive of Social Research on Aging
               </xsl:when>
               <xsl:when test="$archive='DAAPPP'">
                  Data Archive on Adolescent Pregnancy and Pregnancy Prevention
               </xsl:when>
               <xsl:when test="$archive='MDA'">
                  Maternal Drug Abuse Data Archive
               </xsl:when>
               <xsl:when test="$archive='RADIUS'">
                  Research Archive on Disability in the U.S.
               </xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="codeBook/docDscr/citation/prodStmt/producer"/>
               </xsl:otherwise>
            </xsl:choose>
         </field>
         <field name="archive_display">
            &lt;a href="/catalog/<xsl:value-of select="lower-case(codeBook/docDscr/citation/prodStmt/producer/@abbr)"/>"&gt;<xsl:value-of select="codeBook/docDscr/citation/prodStmt/producer"/>&lt;/a&gt;
         </field>
         <field name="title_display"><xsl:value-of select="codeBook/stdyDscr/citation/titlStmt/titl"/></field>
         <field name="study_title_display"><xsl:value-of select="codeBook/stdyDscr/citation/titlStmt/titl"/></field>
         <field name="abbr_display"><xsl:value-of select="codeBook/stdyDscr/citation/titlStmt/altTitl"/></field>
         <field name="download_display">
            &lt;h2&gt;Downloads&lt;/h2&gt;
            <xsl:for-each select="codeBook/otherMat">
               <xsl:if test="contains(labl,'Study')">
                  &lt;h3&gt;&lt;a class="download" href="/download/<xsl:value-of select="/codeBook/@ID"/>/<xsl:value-of select="/codeBook/@ID"/>.zip"&gt;Dataset Package&lt;/a&gt;&lt;br/&gt;&lt;/h3&gt;
               </xsl:if>
               <xsl:if test="contains(labl,'User')">
                  &lt;h3&gt;&lt;a href="/download/<xsl:value-of select="/codeBook/@ID"/>/<xsl:value-of select="/codeBook/@ID"/>use.pdf"&gt;User's Guide&lt;/a&gt;&lt;br/&gt;&lt;/h3&gt;
               </xsl:if>
               <xsl:if test="contains(labl,'Instrument')">
                  &lt;h3&gt;&lt;a class="download" href="/download/<xsl:value-of select="/codeBook/@ID"/>/<xsl:value-of select="/codeBook/@ID"/>ins.zip"&gt;Instrument(s)&lt;/a&gt;&lt;br/&gt;&lt;/h3&gt;
               </xsl:if>
               <xsl:if test="contains(labl,'Supplementary')">
                  &lt;h3&gt;&lt;a class="download" href="/download/<xsl:value-of select="/codeBook/@ID"/>/<xsl:value-of select="/codeBook/@ID"/>sup.zip"&gt;Supplementary Materials&lt;/a&gt;&lt;br/&gt;&lt;/h3&gt;
               </xsl:if>
            </xsl:for-each>
            &lt;h3&gt;&lt;a class="download" href="/download/<xsl:value-of select="codeBook/@ID"/>/<xsl:value-of select="codeBook/@ID"/>.xml"&gt;&lt;acronym title="Data Documentation Initiative"&gt;DDI&lt;/acronym&gt; Codebook&lt;/a&gt;&lt;/h3&gt;
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
            <xsl:variable name="archive" select="../../docDscr/citation/prodStmt/producer/@abbr"/>
            <field name="archive_code">
               <xsl:choose>
                  <xsl:when test="$archive='AIDS-PETRA'">
                     AIDS
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="../../docDscr/citation/prodStmt/producer/@abbr"/>
                  </xsl:otherwise>
               </xsl:choose>
            </field>
            <field name="archive_facet">
               <xsl:choose>
                  <xsl:when test="$archive='AFDA'">
                     American Family Data Archive
                  </xsl:when>
                  <xsl:when test="$archive='AIDS' or 'AIDS-PETRA">
                     AIDS/STI Data Archive
                  </xsl:when>
                  <xsl:when test="$archive='CWP'">
                     Child Well-Being and Poverty Data Archive
                  </xsl:when>
                  <xsl:when test="$archive='CAMDA'">
                     Complementary and Alternative Medicine Data Archive
                  </xsl:when>
                  <xsl:when test="$archive='CDA'">
                     Contextual Data Archive
                  </xsl:when>
                  <xsl:when test="$archive='DASRA'">
                     Data Archive of Social Research on Aging
                  </xsl:when>
                  <xsl:when test="$archive='DAAPPP'">
                     Data Archive on Adolescent Pregnancy and Pregnancy Prevention
                  </xsl:when>
                  <xsl:when test="$archive='MDA'">
                     Maternal Drug Abuse Data Archive
                  </xsl:when>
                  <xsl:when test="$archive='RADIUS'">
                     Research Archive on Disability in the U.S.
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="../../docDscr/citation/prodStmt/producer"/>
                  </xsl:otherwise>
               </xsl:choose>
            </field>
            <field name="archive_display">
               &lt;a href="/catalog/<xsl:value-of select="lower-case(../../docDscr/citation/prodStmt/producer/@abbr)"/>"&gt;<xsl:value-of select="../../docDscr/citation/prodStmt/producer"/>&lt;/a&gt;
            </field>
            <field name="study_title_display">
               &lt;a href="/catalog/<xsl:value-of select="../../@ID"/>"&gt;<xsl:value-of select="../../stdyDscr/citation/titlStmt/titl"/>&lt;/a&gt;
            </field>
            <field name="abbr_display"><xsl:value-of select="../../stdyDscr/citation/titlStmt/altTitl"/></field>
            <field name="title_display"><xsl:value-of select="labl"/></field>
            <field name="var_label_display"><xsl:value-of select="labl"/></field>
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
            <xsl:variable name="topic" select="substring(@ID,1,2)"/>
            <xsl:variable name="type" select="substring(@ID,3,1)"/>
            <xsl:choose>
               <xsl:when test="$archive='AFDA'">
                  <xsl:choose>
                     <xsl:when test="$topic = 'AB'">
                        <field name="var_topic_facet">Abortion</field>
                        <field name="var_topic_code">AB</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'AC'">
                        <field name="var_topic_facet">Agency Characteristics</field>
                        <field name="var_topic_code">AC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'AD'">
                        <field name="var_topic_facet">Adoption/Foster Care</field>
                        <field name="var_topic_code">AD</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'AG'">
                        <field name="var_topic_facet">Age</field>
                        <field name="var_topic_code">AG</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'BF'">
                        <field name="var_topic_facet">Biological Functioning/Development</field>
                        <field name="var_topic_code">BF</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CB'">
                        <field name="var_topic_facet">Childbearing/Pregnancy</field>
                        <field name="var_topic_code">CB</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CC'">
                        <field name="var_topic_facet">Caregiving/Child Care</field>
                        <field name="var_topic_code">CC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CI'">
                        <field name="var_topic_facet">Crime/Victimization/Behavior Problems</field>
                        <field name="var_topic_code">CI</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CL'">
                        <field name="var_topic_facet">Clinical Activities</field>
                        <field name="var_topic_code">CL</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CN'">
                        <field name="var_topic_facet">Contraception/Prophylaxis</field>
                        <field name="var_topic_code">CN</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CO'">
                        <field name="var_topic_facet">Cohabitation</field>
                        <field name="var_topic_code">CO</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CP'">
                        <field name="var_topic_facet">Civic/Political Activities</field>
                        <field name="var_topic_code">CP</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'DC'">
                        <field name="var_topic_facet">Dating/Courtship</field>
                        <field name="var_topic_code">DC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'DW'">
                        <field name="var_topic_facet">Dwelling</field>
                        <field name="var_topic_code">DW</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'ED'">
                        <field name="var_topic_facet">Education</field>
                        <field name="var_topic_code">ED</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'FS'">
                        <field name="var_topic_facet">Friends/Social Activities/Social Support</field>
                        <field name="var_topic_code">FS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'GC'">
                        <field name="var_topic_facet">Guidance/Counseling</field>
                        <field name="var_topic_code">GC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'GR'">
                        <field name="var_topic_facet">Gender/Gender Role</field>
                        <field name="var_topic_code">GR</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'HC'">
                        <field name="var_topic_facet">Family/Household Characteristics</field>
                        <field name="var_topic_code">HC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'HL'">
                        <field name="var_topic_facet">Physical Health/Disease/Functioning</field>
                        <field name="var_topic_code">HL</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'HS'">
                        <field name="var_topic_facet">Family/Household Structure/Composition</field>
                        <field name="var_topic_code">HS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'IN'">
                        <field name="var_topic_facet">Intellectual Functioning</field>
                        <field name="var_topic_code">IN</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'IV'">
                        <field name="var_topic_facet">Interview</field>
                        <field name="var_topic_code">IV</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'KR'">
                        <field name="var_topic_facet">Relationships with Other Kin</field>
                        <field name="var_topic_code">KR</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MD'">
                        <field name="var_topic_facet">Marriage/Cohabitation</field>
                        <field name="var_topic_code">MD</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'ME'">
                        <field name="var_topic_facet">Meta Level</field>
                        <field name="var_topic_code">ME</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MH'">
                        <field name="var_topic_facet">Mental Health</field>
                        <field name="var_topic_code">MH</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MO'">
                        <field name="var_topic_facet">Residential Mobility</field>
                        <field name="var_topic_code">MO</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'NC'">
                        <field name="var_topic_facet">Neighborhood/Community</field>
                        <field name="var_topic_code">NC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'NK'">
                        <field name="var_topic_facet">Relationships with Non-Kin</field>
                        <field name="var_topic_code">NK</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'NU'">
                        <field name="var_topic_facet">Nutrition</field>
                        <field name="var_topic_code">NU</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'OC'">
                        <field name="var_topic_facet">Occupation/Employment</field>
                        <field name="var_topic_code">OC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'OT'">
                        <field name="var_topic_facet">Other</field>
                        <field name="var_topic_code">OT</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'OW'">
                        <field name="var_topic_facet">Out-of-Wedlock Pregnancy/Parenthood</field>
                        <field name="var_topic_code">OW</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PC'">
                        <field name="var_topic_facet">Parent-Child Relationships</field>
                        <field name="var_topic_code">PC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PE'">
                        <field name="var_topic_facet">Personality</field>
                        <field name="var_topic_code">PE</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PF'">
                        <field name="var_topic_facet">Psychological Functioning/Development</field>
                        <field name="var_topic_code">PF</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PP'">
                        <field name="var_topic_facet">Inter-Partner Relationships</field>
                        <field name="var_topic_code">PP</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RA'">
                        <field name="var_topic_facet">Race/Ethnicity/Heritage</field>
                        <field name="var_topic_code">RA</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RC'">
                        <field name="var_topic_facet">Recreation</field>
                        <field name="var_topic_code">RC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RE'">
                        <field name="var_topic_facet">Region/State</field>
                        <field name="var_topic_code">RE</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RL'">
                        <field name="var_topic_facet">Religion/Ethics</field>
                        <field name="var_topic_code">RL</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RS'">
                        <field name="var_topic_facet">Receipt of Health, Mental Health, Social Services</field>
                        <field name="var_topic_code">RS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SA'">
                        <field name="var_topic_facet">Substance Use</field>
                        <field name="var_topic_code">SA</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SD'">
                        <field name="var_topic_facet">Sexually Transmitted Disease</field>
                        <field name="var_topic_code">SD</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SE'">
                        <field name="var_topic_facet">Sex Education</field>
                        <field name="var_topic_code">SE</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SS'">
                        <field name="var_topic_facet">Inter-Sibling Relationships</field>
                        <field name="var_topic_code">SS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SX'">
                        <field name="var_topic_facet">Sexuality</field>
                        <field name="var_topic_code">SX</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'UN'">
                        <field name="var_topic_facet">Undocumented</field>
                        <field name="var_topic_code">UN</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'WF'">
                        <field name="var_topic_facet">Wealth/Finances/Poverty/Income</field>
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
                        <field name="var_type_facet">Aggregate</field>
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
               </xsl:when>
               <xsl:when test="$archive='AIDS' or $archive='AIDS-PETRA'">
                  <xsl:choose>
                     <xsl:when test="$topic = 'AB'">
                        <field name="var_topic_facet">Abortion</field>
                        <field name="var_topic_code">AB</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'AC'">
                        <field name="var_topic_facet">Agency Characteristics</field>
                        <field name="var_topic_code">AC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'AD'">
                        <field name="var_topic_facet">Adoption/Foster Care</field>
                        <field name="var_topic_code">AD</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'AE'">
                        <field name="var_topic_facet">Abstinence</field>
                        <field name="var_topic_code">AE</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'AG'">
                        <field name="var_topic_facet">Age</field>
                        <field name="var_topic_code">AG</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'AI'">
                        <field name="var_topic_facet">Anal Intercourse</field>
                        <field name="var_topic_code">AI</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'BF'">
                        <field name="var_topic_facet">Biological Functioning/Development</field>
                        <field name="var_topic_code">BF</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CB'">
                        <field name="var_topic_facet">Childbearing/Pregnancy</field>
                        <field name="var_topic_code">CB</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CC'">
                        <field name="var_topic_facet">Caregiving/Child Care</field>
                        <field name="var_topic_code">CC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CH'">
                        <field name="var_topic_facet">Chlamydia</field>
                        <field name="var_topic_code">CH</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CI'">
                        <field name="var_topic_facet">Crime/Victimization/Behavior Problems</field>
                        <field name="var_topic_code">CI</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CL'">
                        <field name="var_topic_facet">Clinical Activities</field>
                        <field name="var_topic_code">CL</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CN'">
                        <field name="var_topic_facet">Contraception/Prophylaxis</field>
                        <field name="var_topic_code">CN</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CO'">
                        <field name="var_topic_facet">Cohabitation</field>
                        <field name="var_topic_code">CO</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CP'">
                        <field name="var_topic_facet">Civic/Political Activities</field>
                        <field name="var_topic_code">CP</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'DC'">
                        <field name="var_topic_facet">Dating/Courtship</field>
                        <field name="var_topic_code">DC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'DW'">
                        <field name="var_topic_facet">Dwelling</field>
                        <field name="var_topic_code">DW</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'ED'">
                        <field name="var_topic_facet">Education</field>
                        <field name="var_topic_code">ED</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'FS'">
                        <field name="var_topic_facet">Friends/Social Activities/Social Support</field>
                        <field name="var_topic_code">FS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'GC'">
                        <field name="var_topic_facet">Guidance/Counseling</field>
                        <field name="var_topic_code">GC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'GN'">
                        <field name="var_topic_facet">Gonorrhea</field>
                        <field name="var_topic_code">GN</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'GR'">
                        <field name="var_topic_facet">Gender/Gender Role</field>
                        <field name="var_topic_code">GR</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'HC'">
                        <field name="var_topic_facet">Family/Household Characteristics</field>
                        <field name="var_topic_code">HC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'HL'">
                        <field name="var_topic_facet">Physical Health/Disease/Functioning</field>
                        <field name="var_topic_code">HL</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'HS'">
                        <field name="var_topic_facet">Family/Household Structure/Composition</field>
                        <field name="var_topic_code">HS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'HV'">
                        <field name="var_topic_facet">HIV/AIDS</field>
                        <field name="var_topic_code">HV</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'ID'">
                        <field name="var_topic_facet">Intervention</field>
                        <field name="var_topic_code">ID</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'IN'">
                        <field name="var_topic_facet">Intellectual Functioning</field>
                        <field name="var_topic_code">IN</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'IV'">
                        <field name="var_topic_facet">Interview</field>
                        <field name="var_topic_code">IV</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'KR'">
                        <field name="var_topic_facet">Relationships with Other Kin</field>
                        <field name="var_topic_code">KR</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MD'">
                        <field name="var_topic_facet">Marriage/Cohabitation</field>
                        <field name="var_topic_code">MD</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'ME'">
                        <field name="var_topic_facet">Meta Level</field>
                        <field name="var_topic_code">ME</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MH'">
                        <field name="var_topic_facet">Mental Health</field>
                        <field name="var_topic_code">MH</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MO'">
                        <field name="var_topic_facet">Residential Mobility</field>
                        <field name="var_topic_code">MO</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'NC'">
                        <field name="var_topic_facet">Neighborhood/Community</field>
                        <field name="var_topic_code">NC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'NK'">
                        <field name="var_topic_facet">Relationships with Non-Kin</field>
                        <field name="var_topic_code">NK</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'NP'">
                        <field name="var_topic_facet">Non-Penetrative Sexual Activity</field>
                        <field name="var_topic_code">NP</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'NU'">
                        <field name="var_topic_facet">Nutrition</field>
                        <field name="var_topic_code">NU</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'OC'">
                        <field name="var_topic_facet">Occupation/Employment</field>
                        <field name="var_topic_code">OC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'OG'">
                        <field name="var_topic_facet">Oral-Genital/Oral-Anal Contact</field>
                        <field name="var_topic_code">OG</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'OT'">
                        <field name="var_topic_facet">Other</field>
                        <field name="var_topic_code">OT</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'OW'">
                        <field name="var_topic_facet">Out-of-Wedlock Pregnancy/Parenthood</field>
                        <field name="var_topic_code">OW</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PC'">
                        <field name="var_topic_facet">Parent-Child Relationships</field>
                        <field name="var_topic_code">PC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PE'">
                        <field name="var_topic_facet">Personality</field>
                        <field name="var_topic_code">PE</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PF'">
                        <field name="var_topic_facet">Psychological Functioning/Development</field>
                        <field name="var_topic_code">PF</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PP'">
                        <field name="var_topic_facet">Inter-Partner Relationships</field>
                        <field name="var_topic_code">PP</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PR'">
                        <field name="var_topic_facet">Prostitution</field>
                        <field name="var_topic_code">PR</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RA'">
                        <field name="var_topic_facet">Race/Ethnicity/Heritage</field>
                        <field name="var_topic_code">RA</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RC'">
                        <field name="var_topic_facet">Recreation</field>
                        <field name="var_topic_code">RC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RE'">
                        <field name="var_topic_facet">Region/State</field>
                        <field name="var_topic_code">RE</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RL'">
                        <field name="var_topic_facet">Religion/Ethics</field>
                        <field name="var_topic_code">RL</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RS'">
                        <field name="var_topic_facet">Receipt of Health, Mental Health, Social Services</field>
                        <field name="var_topic_code">RS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SA'">
                        <field name="var_topic_facet">Substance Use</field>
                        <field name="var_topic_code">SA</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SD'">
                        <field name="var_topic_facet">Sexually Transmitted Disease</field>
                        <field name="var_topic_code">SD</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SE'">
                        <field name="var_topic_facet">Sex Education</field>
                        <field name="var_topic_code">SE</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SS'">
                        <field name="var_topic_facet">Inter-Sibling Relationships</field>
                        <field name="var_topic_code">SS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SX'">
                        <field name="var_topic_facet">Sexuality</field>
                        <field name="var_topic_code">SX</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SY'">
                        <field name="var_topic_facet">Syphilis</field>
                        <field name="var_topic_code">SY</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'UN'">
                        <field name="var_topic_facet">Undocumented</field>
                        <field name="var_topic_code">UN</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'VI'">
                        <field name="var_topic_facet">Vaginal Intercourse</field>
                        <field name="var_topic_code">VI</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'WF'">
                        <field name="var_topic_facet">Wealth/Finances/Poverty/Income</field>
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
                     <xsl:when test="$type = 'F'">
                        <field name="var_type_facet">Past Clinical Diagnosis</field>
                        <field name="var_type_code">F</field>
                     </xsl:when>
                     <xsl:when test="$type = 'G'">
                        <field name="var_type_facet">Past Laboratory Test/Biological Marker</field>
                        <field name="var_type_code">G</field>
                     </xsl:when>
                     <xsl:when test="$type = 'H'">
                        <field name="var_type_facet">History</field>
                        <field name="var_type_code">H</field>
                     </xsl:when>
                     <xsl:when test="$type = 'I'">
                        <field name="var_type_facet">Intention</field>
                        <field name="var_type_code">I</field>
                     </xsl:when>
                     <xsl:when test="$type = 'K'">
                        <field name="var_type_facet">Current Clinical Diagnosis</field>
                        <field name="var_type_code">K</field>
                     </xsl:when>
                     <xsl:when test="$type = 'L'">
                        <field name="var_type_facet">Current Laboratory Test/Biological Marker</field>
                        <field name="var_type_code">K</field>
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
                        <field name="var_type_facet">Aggregate</field>
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
               </xsl:when>
               <xsl:when test="$archive='CAMDA'">
                  <xsl:choose>
                     <xsl:when test="$topic = 'AC'">
                        <field name="var_topic_facet">Agency Characteristics</field>
                        <field name="var_topic_code">AC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'AG'">
                        <field name="var_topic_facet">Age</field>
                        <field name="var_topic_code">AG</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'AH'">
                        <field name="var_topic_facet">Homeopathy, Naturopathy</field>
                        <field name="var_topic_code">AH</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'AM'">
                        <field name="var_topic_facet">Alternative Medical Systems</field>
                        <field name="var_topic_code">AM</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'AP'">
                        <field name="var_topic_facet">Accupuncture</field>
                        <field name="var_topic_code">AP</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'AT'">
                        <field name="var_topic_facet">Traditional Chinese Medicine</field>
                        <field name="var_topic_code">AT</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'AY'">
                        <field name="var_topic_facet">Ayurveda</field>
                        <field name="var_topic_code">AY</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'BB'">
                        <field name="var_topic_facet">Biologically-Based Methods</field>
                        <field name="var_topic_code">BB</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'BF'">
                        <field name="var_topic_facet">Biological Functioning/Development</field>
                        <field name="var_topic_code">BF</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'BP'">
                        <field name="var_topic_facet">Phytotherapy, Herbal Therapy</field>
                        <field name="var_topic_code">BP</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'BV'">
                        <field name="var_topic_facet">Supplements &amp; Vitamins</field>
                        <field name="var_topic_code">BV</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CA'">
                        <field name="var_topic_facet">CAM Therapies</field>
                        <field name="var_topic_code">CA</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CT'">
                        <field name="var_topic_facet">Conventional Therapies</field>
                        <field name="var_topic_code">CT</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'DW'">
                        <field name="var_topic_facet">Dwelling</field>
                        <field name="var_topic_code">DW</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'EB'">
                        <field name="var_topic_facet">Bioelectromagnetic</field>
                        <field name="var_topic_code">EB</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'ED'">
                        <field name="var_topic_facet">Education</field>
                        <field name="var_topic_code">ED</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'EQ'">
                        <field name="var_topic_facet">Qi Gong</field>
                        <field name="var_topic_code">EQ</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'ER'">
                        <field name="var_topic_facet">Reiki</field>
                        <field name="var_topic_code">ER</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'ET'">
                        <field name="var_topic_facet">Energy Therapies</field>
                        <field name="var_topic_code">ET</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'FS'">
                        <field name="var_topic_facet">Friends/Social Activities/Social Support</field>
                        <field name="var_topic_code">FS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'GC'">
                        <field name="var_topic_facet">Guidance/Counseling</field>
                        <field name="var_topic_code">GC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'GR'">
                        <field name="var_topic_facet">Gender/Gender Role</field>
                        <field name="var_topic_code">GR</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'HC'">
                        <field name="var_topic_facet">Health Care</field>
                        <field name="var_topic_code">HC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'IV'">
                        <field name="var_topic_facet">Interview</field>
                        <field name="var_topic_code">IV</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MB'">
                        <field name="var_topic_facet">Mind-Body Interventions</field>
                        <field name="var_topic_code">MB</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MC'">
                        <field name="var_topic_facet">Chiropractic</field>
                        <field name="var_topic_code">MC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MD'">
                        <field name="var_topic_facet">Meditation, Yoga, Relaxation</field>
                        <field name="var_topic_code">MD</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'ME'">
                        <field name="var_topic_facet">Meta Level</field>
                        <field name="var_topic_code">ME</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MF'">
                        <field name="var_topic_facet">Marriage/Family Characteristics</field>
                        <field name="var_topic_code">MF</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MH'">
                        <field name="var_topic_facet">Mental Health</field>
                        <field name="var_topic_code">MH</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MM'">
                        <field name="var_topic_facet">Manipulative &amp; Body-Based Methods</field>
                        <field name="var_topic_code">MM</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MO'">
                        <field name="var_topic_facet">Osteopathic</field>
                        <field name="var_topic_code">MO</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MP'">
                        <field name="var_topic_facet">Prayer</field>
                        <field name="var_topic_code">MP</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MS'">
                        <field name="var_topic_facet">Massage</field>
                        <field name="var_topic_code">MS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MT'">
                        <field name="var_topic_facet">Mental Healing</field>
                        <field name="var_topic_code">MT</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MX'">
                        <field name="var_topic_facet">Reflexology</field>
                        <field name="var_topic_code">MX</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'NU'">
                        <field name="var_topic_facet">Nutrition</field>
                        <field name="var_topic_code">NU</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'OC'">
                        <field name="var_topic_facet">Occupation/Employment</field>
                        <field name="var_topic_code">OC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'OT'">
                        <field name="var_topic_facet">Other</field>
                        <field name="var_topic_code">OT</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PD'">
                        <field name="var_topic_facet">Physical Health/Disease/Functioning</field>
                        <field name="var_topic_code">PD</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PF'">
                        <field name="var_topic_facet">Psychological Functioning/Development</field>
                        <field name="var_topic_code">PF</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'QL'">
                        <field name="var_topic_facet">Quality of Life &amp; General Health</field>
                        <field name="var_topic_code">QL</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RA'">
                        <field name="var_topic_facet">Race/Ethnicity/Heritage</field>
                        <field name="var_topic_code">RA</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RE'">
                        <field name="var_topic_facet">Region/State</field>
                        <field name="var_topic_code">RE</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RL'">
                        <field name="var_topic_facet">Religion/Ethics</field>
                        <field name="var_topic_code">RL</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RX'">
                        <field name="var_topic_facet">Medicines, Chemicals, Drugs, Substances</field>
                        <field name="var_topic_code">RX</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'TT'">
                        <field name="var_topic_facet">Therapeutic Touch</field>
                        <field name="var_topic_code">TT</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'UN'">
                        <field name="var_topic_facet">Undocumented</field>
                        <field name="var_topic_code">UN</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'WF'">
                        <field name="var_topic_facet">Wealth/Finances/Poverty/Income</field>
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
                     <xsl:when test="$type = 'K'">
                        <field name="var_type_facet">Clinical Diagnosis</field>
                        <field name="var_type_code">K</field>
                     </xsl:when>
                     <xsl:when test="$type = 'L'">
                        <field name="var_type_facet">Laboratory Test/Biological Marker</field>
                        <field name="var_type_code">L</field>
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
                     <xsl:when test="$type = 'Q'">
                        <field name="var_type_facet">Scale or Composite Measure</field>
                        <field name="var_type_code">Q</field>
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
                        <field name="var_type_facet">Aggregate</field>
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
               </xsl:when>
               <xsl:when test="$archive='CDA'">
                  <xsl:choose>
                     <xsl:when test="$topic = 'AG'">
                        <field name="var_topic_facet">Age</field>
                        <field name="var_topic_code">AG</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CI'">
                        <field name="var_topic_facet">Crime/Victimization/Behavior Problems</field>
                        <field name="var_topic_code">CI</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CP'">
                        <field name="var_topic_facet">Civic/Political Activities</field>
                        <field name="var_topic_code">CP</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CR'">
                        <field name="var_topic_facet">Childrearing/Child Care/Adoption</field>
                        <field name="var_topic_code">CR</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'ED'">
                        <field name="var_topic_facet">Education</field>
                        <field name="var_topic_code">ED</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'FG'">
                        <field name="var_topic_facet">Federal Government</field>
                        <field name="var_topic_code">FG</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'FH'">
                        <field name="var_topic_facet">Family/Household Structure/Composition</field>
                        <field name="var_topic_code">FH</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'FT'">
                        <field name="var_topic_facet">Fertility</field>
                        <field name="var_topic_code">FT</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'GE'">
                        <field name="var_topic_facet">Geography &amp; Environment/Urban/Rural</field>
                        <field name="var_topic_code">GE</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'GR'">
                        <field name="var_topic_facet">Gender/Gender Role</field>
                        <field name="var_topic_code">GR</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'HC'">
                        <field name="var_topic_facet">Health Care Resources &amp; Utilization</field>
                        <field name="var_topic_code">HC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'HO'">
                        <field name="var_topic_facet">Housing</field>
                        <field name="var_topic_code">HO</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'IT'">
                        <field name="var_topic_facet">Industry, Banking, &amp; Trade</field>
                        <field name="var_topic_code">IT</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'LA'">
                        <field name="var_topic_facet">Language</field>
                        <field name="var_topic_code">LA</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'LE'">
                        <field name="var_topic_facet">Law Enforcement, Courts &amp; Prisons</field>
                        <field name="var_topic_code">LE</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'LF'">
                        <field name="var_topic_facet">Labor Force/Employment</field>
                        <field name="var_topic_code">LF</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MD'">
                        <field name="var_topic_facet">Marriage/Cohabitation</field>
                        <field name="var_topic_code">MD</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'ME'">
                        <field name="var_topic_facet">Meta Level</field>
                        <field name="var_topic_code">ME</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MH'">
                        <field name="var_topic_facet">Mental Health</field>
                        <field name="var_topic_code">MH</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MM'">
                        <field name="var_topic_facet">Migration &amp; Mobility</field>
                        <field name="var_topic_code">MM</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MT'">
                        <field name="var_topic_facet">Mortality/Life Expectancy</field>
                        <field name="var_topic_code">MT</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'OT'">
                        <field name="var_topic_facet">Other</field>
                        <field name="var_topic_code">OT</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PH'">
                        <field name="var_topic_facet">Health &amp; Nutrition/Mobidity/STDs</field>
                        <field name="var_topic_code">PH</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PO'">
                        <field name="var_topic_facet">Population</field>
                        <field name="var_topic_code">PO</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RA'">
                        <field name="var_topic_facet">Race/Ethnicity/Heritage</field>
                        <field name="var_topic_code">RA</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RL'">
                        <field name="var_topic_facet">Religion/Ethics</field>
                        <field name="var_topic_code">RL</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RP'">
                        <field name="var_topic_facet">Recreation</field>
                        <field name="var_topic_code">RP</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SG'">
                        <field name="var_topic_facet">State &amp; Local Governments</field>
                        <field name="var_topic_code">SG</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SS'">
                        <field name="var_topic_facet">Social Services &amp; Insurance/Public Policy</field>
                        <field name="var_topic_code">SS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SX'">
                        <field name="var_topic_facet">Sexuality</field>
                        <field name="var_topic_code">SX</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'TE'">
                        <field name="var_topic_facet">Technology/Research/Energy</field>
                        <field name="var_topic_code">TE</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'TR'">
                        <field name="var_topic_facet">Transporation</field>
                        <field name="var_topic_code">TR</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'UN'">
                        <field name="var_topic_facet">Undocumented</field>
                        <field name="var_topic_code">UN</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'WF'">
                        <field name="var_topic_facet">Wealth/Finances/Poverty/Income</field>
                        <field name="var_topic_code">WF</field>
                     </xsl:when>
                     <xsl:otherwise>
                        <field name="var_topic_facet">No Value</field>
                     </xsl:otherwise>
	          </xsl:choose>
                  <xsl:choose>
                     <xsl:when test="$type = 'C'">
                        <field name="var_type_facet">Change Score</field>
                        <field name="var_type_code">C</field>
                     </xsl:when>
                     <xsl:when test="$type = 'D'">
                        <field name="var_type_facet">Dollar Amounts</field>
                        <field name="var_type_code">D</field>
                     </xsl:when>
                     <xsl:when test="$type = 'G'">
                        <field name="var_type_facet">Geographic Identifier</field>
                        <field name="var_type_code">G</field>
                     </xsl:when>
                     <xsl:when test="$type = 'M'">
                        <field name="var_type_facet">Central Tendency</field>
                        <field name="var_type_code">M</field>
                     </xsl:when>
                     <xsl:when test="$type = 'N'">
                        <field name="var_type_facet">Number</field>
                        <field name="var_type_code">N</field>
                     </xsl:when>
                     <xsl:when test="$type = 'O'">
                        <field name="var_type_facet">Other</field>
                        <field name="var_type_code">O</field>
                     </xsl:when>
                     <xsl:when test="$type = 'R'">
                        <field name="var_type_facet">Ratio</field>
                        <field name="var_type_code">R</field>
                     </xsl:when>
                     <xsl:when test="$type = 'S'">
                        <field name="var_type_facet">Status</field>
                        <field name="var_type_code">S</field>
                     </xsl:when>
                     <xsl:when test="$type = 'T'">
                        <field name="var_type_facet">Time</field>
                        <field name="var_type_code">T</field>
                     </xsl:when>
                     <xsl:when test="$type = 'U'">
                        <field name="var_type_facet">Undocumented</field>
                        <field name="var_type_code">U</field>
                     </xsl:when>
                     <xsl:when test="$type = 'V'">
                        <field name="var_type_facet">Variation</field>
                        <field name="var_type_code">V</field>
                     </xsl:when>
                     <xsl:when test="$type = 'X'">
                        <field name="var_type_facet">Index</field>
                        <field name="var_type_code">X</field>
                     </xsl:when>
                     <xsl:when test="$type = 'Z'">
                        <field name="var_type_facet">Meta</field>
                        <field name="var_type_code">Z</field>
                     </xsl:when>
                     <xsl:otherwise>
                        <field name="var_type_facet">No Value</field>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:when>
               <xsl:when test="$archive='CWP'">
                  <xsl:choose>
                     <xsl:when test="$topic = 'AB'">
                        <field name="var_topic_facet">Abortion</field>
                        <field name="var_topic_code">AB</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'AC'">
                        <field name="var_topic_facet">Agency Characteristics</field>
                        <field name="var_topic_code">AC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'AD'">
                        <field name="var_topic_facet">Adoption/Foster Care</field>
                        <field name="var_topic_code">AD</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'AG'">
                        <field name="var_topic_facet">Age</field>
                        <field name="var_topic_code">AG</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'BF'">
                        <field name="var_topic_facet">Biological Functioning/Development</field>
                        <field name="var_topic_code">BF</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CB'">
                        <field name="var_topic_facet">Childbearing/Pregnancy</field>
                        <field name="var_topic_code">CB</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CC'">
                        <field name="var_topic_facet">Caregiving/Child Care</field>
                        <field name="var_topic_code">CC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CI'">
                        <field name="var_topic_facet">Crime/Victimization/Behavior Problems</field>
                        <field name="var_topic_code">CI</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CL'">
                        <field name="var_topic_facet">Clinical Activities</field>
                        <field name="var_topic_code">CL</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CO'">
                        <field name="var_topic_facet">Cohabitation</field>
                        <field name="var_topic_code">CO</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CP'">
                        <field name="var_topic_facet">Civic/Political Activities</field>
                        <field name="var_topic_code">CP</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'DC'">
                        <field name="var_topic_facet">Dating/Courtship</field>
                        <field name="var_topic_code">DC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'DW'">
                        <field name="var_topic_facet">Dwelling</field>
                        <field name="var_topic_code">DW</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'ED'">
                        <field name="var_topic_facet">Education</field>
                        <field name="var_topic_code">ED</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'FS'">
                        <field name="var_topic_facet">Friends/Social Activities/Social Support</field>
                        <field name="var_topic_code">FS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'GC'">
                        <field name="var_topic_facet">Guidance/Counseling</field>
                        <field name="var_topic_code">GC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'GR'">
                        <field name="var_topic_facet">Gender/Gender Role</field>
                        <field name="var_topic_code">GR</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'HC'">
                        <field name="var_topic_facet">Family/Household Characteristics</field>
                        <field name="var_topic_code">HC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'HL'">
                        <field name="var_topic_facet">Physical Health/Disease/Functioning</field>
                        <field name="var_topic_code">HL</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'HS'">
                        <field name="var_topic_facet">Family/Household Structure/Composition</field>
                        <field name="var_topic_code">HS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'IN'">
                        <field name="var_topic_facet">Intellectual Functioning</field>
                        <field name="var_topic_code">IN</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'IV'">
                        <field name="var_topic_facet">Interview</field>
                        <field name="var_topic_code">IV</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'KR'">
                        <field name="var_topic_facet">Relationships with Other Kin</field>
                        <field name="var_topic_code">KR</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MD'">
                        <field name="var_topic_facet">Marriage/Cohabitation</field>
                        <field name="var_topic_code">MD</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'ME'">
                        <field name="var_topic_facet">Meta Level</field>
                        <field name="var_topic_code">ME</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MH'">
                        <field name="var_topic_facet">Mental Health</field>
                        <field name="var_topic_code">MH</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MO'">
                        <field name="var_topic_facet">Residential Mobility</field>
                        <field name="var_topic_code">MO</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'NC'">
                        <field name="var_topic_facet">Neighborhood/Community</field>
                        <field name="var_topic_code">NC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'NK'">
                        <field name="var_topic_facet">Relationships with Non-Kin</field>
                        <field name="var_topic_code">NK</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'NU'">
                        <field name="var_topic_facet">Nutrition</field>
                        <field name="var_topic_code">NU</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'OC'">
                        <field name="var_topic_facet">Occupation/Employment</field>
                        <field name="var_topic_code">OC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'OT'">
                        <field name="var_topic_facet">Other</field>
                        <field name="var_topic_code">OT</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PC'">
                        <field name="var_topic_facet">Parent-Child Relationships</field>
                        <field name="var_topic_code">PC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PE'">
                        <field name="var_topic_facet">Personality</field>
                        <field name="var_topic_code">PE</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PF'">
                        <field name="var_topic_facet">Psychological Functioning/Development</field>
                        <field name="var_topic_code">PF</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PP'">
                        <field name="var_topic_facet">Inter-Partner Relationships</field>
                        <field name="var_topic_code">PP</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RA'">
                        <field name="var_topic_facet">Race/Ethnicity/Heritage</field>
                        <field name="var_topic_code">RA</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RC'">
                        <field name="var_topic_facet">Recreation</field>
                        <field name="var_topic_code">RC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RE'">
                        <field name="var_topic_facet">Region/State</field>
                        <field name="var_topic_code">RE</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RL'">
                        <field name="var_topic_facet">Religion/Ethics</field>
                        <field name="var_topic_code">RL</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RS'">
                        <field name="var_topic_facet">Receipt of Health, Mental Health, Social Services</field>
                        <field name="var_topic_code">RS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SA'">
                        <field name="var_topic_facet">Substance Use</field>
                        <field name="var_topic_code">SA</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SD'">
                        <field name="var_topic_facet">Sexually Transmitted Disease</field>
                        <field name="var_topic_code">SD</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SX'">
                        <field name="var_topic_facet">Sexuality</field>
                        <field name="var_topic_code">SX</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'TP'">
                        <field name="var_topic_facet">Government Transfer Payments</field>
                        <field name="var_topic_code">TP</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'UN'">
                        <field name="var_topic_facet">Undocumented</field>
                        <field name="var_topic_code">UN</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'WF'">
                        <field name="var_topic_facet">Wealth/Finances/Poverty/Income</field>
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
                        <field name="var_type_facet">Aggregate</field>
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
               </xsl:when>
               <xsl:when test="$archive='DAAPPP'">
                  <xsl:choose>
                     <xsl:when test="$topic = 'AB'">
                        <field name="var_topic_facet">Abortion</field>
                        <field name="var_topic_code">AB</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'AC'">
                        <field name="var_topic_facet">Agency Characteristics</field>
                        <field name="var_topic_code">AC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'AD'">
                        <field name="var_topic_facet">Adoption/Foster Care</field>
                        <field name="var_topic_code">AD</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'AG'">
                        <field name="var_topic_facet">Age</field>
                        <field name="var_topic_code">AG</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'BF'">
                        <field name="var_topic_facet">Biological Functioning/Development</field>
                        <field name="var_topic_code">BF</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CB'">
                        <field name="var_topic_facet">Childbearing/Pregnancy</field>
                        <field name="var_topic_code">CB</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CC'">
                        <field name="var_topic_facet">Caregiving/Child Care</field>
                        <field name="var_topic_code">CC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CI'">
                        <field name="var_topic_facet">Crime/Victimization/Behavior Problems</field>
                        <field name="var_topic_code">CI</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CL'">
                        <field name="var_topic_facet">Clinical Activities</field>
                        <field name="var_topic_code">CL</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CM'">
                        <field name="var_topic_facet">Communication</field>
                        <field name="var_topic_code">CM</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CN'">
                        <field name="var_topic_facet">Contraception/Prophylaxis</field>
                        <field name="var_topic_code">CN</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CP'">
                        <field name="var_topic_facet">Civic/Political Activities</field>
                        <field name="var_topic_code">CP</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CR'">
                        <field name="var_topic_facet">Childrearing</field>
                        <field name="var_topic_code">CR</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'ED'">
                        <field name="var_topic_facet">Education</field>
                        <field name="var_topic_code">ED</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'FH'">
                        <field name="var_topic_facet">Family/Household Characteristics</field>
                        <field name="var_topic_code">FH</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'FS'">
                        <field name="var_topic_facet">Friends/Social Activities/Social Support</field>
                        <field name="var_topic_code">FS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'GC'">
                        <field name="var_topic_facet">Guidance/Counseling</field>
                        <field name="var_topic_code">GC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'GR'">
                        <field name="var_topic_facet">Gender/Gender Role</field>
                        <field name="var_topic_code">GR</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'HL'">
                        <field name="var_topic_facet">Physical Health/Disease/Functioning</field>
                        <field name="var_topic_code">HL</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'IN'">
                        <field name="var_topic_facet">Intellectual Functioning</field>
                        <field name="var_topic_code">IN</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'IV'">
                        <field name="var_topic_facet">Interview</field>
                        <field name="var_topic_code">IV</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'ME'">
                        <field name="var_topic_facet">Meta Level</field>
                        <field name="var_topic_code">ME</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MH'">
                        <field name="var_topic_facet">Mental Health</field>
                        <field name="var_topic_code">MH</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MP'">
                        <field name="var_topic_facet">Marriage/Cohabitation</field>
                        <field name="var_topic_code">MP</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'NU'">
                        <field name="var_topic_facet">Nutrition</field>
                        <field name="var_topic_code">NU</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'OC'">
                        <field name="var_topic_facet">Occupation/Employment</field>
                        <field name="var_topic_code">OC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'OT'">
                        <field name="var_topic_facet">Other</field>
                        <field name="var_topic_code">OT</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'OW'">
                        <field name="var_topic_facet">Out-of-Wedlock Pregnancy/Parenthood</field>
                        <field name="var_topic_code">OW</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PE'">
                        <field name="var_topic_facet">Personality</field>
                        <field name="var_topic_code">PE</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RA'">
                        <field name="var_topic_facet">Race/Ethnicity/Heritage</field>
                        <field name="var_topic_code">RA</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RC'">
                        <field name="var_topic_facet">Recreation</field>
                        <field name="var_topic_code">RC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RL'">
                        <field name="var_topic_facet">Religion/Ethics</field>
                        <field name="var_topic_code">RL</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RS'">
                        <field name="var_topic_facet">Residence/Location</field>
                        <field name="var_topic_code">RS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SA'">
                        <field name="var_topic_facet">Substance Use</field>
                        <field name="var_topic_code">SA</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SD'">
                        <field name="var_topic_facet">Sexually Transmitted Disease</field>
                        <field name="var_topic_code">SD</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SX'">
                        <field name="var_topic_facet">Sexuality</field>
                        <field name="var_topic_code">SX</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'UN'">
                        <field name="var_topic_facet">Undocumented</field>
                        <field name="var_topic_code">UN</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'WF'">
                        <field name="var_topic_facet">Wealth/Finances/Poverty/Income</field>
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
                     <xsl:when test="$type = 'X'">
                        <field name="var_type_facet">Meta</field>
                        <field name="var_type_code">X</field>
                     </xsl:when>
                     <xsl:when test="$type = 'Y'">
                        <field name="var_type_facet">Aggregate</field>
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
               </xsl:when>
               <xsl:when test="$archive='DASRA'">
                  <xsl:choose>
                     <xsl:when test="$topic = 'AC'">
                        <field name="var_topic_facet">Agency Characteristics</field>
                        <field name="var_topic_code">AC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'AD'">
                        <field name="var_topic_facet">Adoption/Foster Care</field>
                        <field name="var_topic_code">AD</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'AG'">
                        <field name="var_topic_facet">Age</field>
                        <field name="var_topic_code">AG</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'BC'">
                        <field name="var_topic_facet">Board &amp; Care/Residential Care</field>
                        <field name="var_topic_code">BC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'BF'">
                        <field name="var_topic_facet">Biological Functioning/Development</field>
                        <field name="var_topic_code">BF</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CB'">
                        <field name="var_topic_facet">Childbearing/Pregnancy</field>
                        <field name="var_topic_code">CB</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CC'">
                        <field name="var_topic_facet">Caregiving/Child Care</field>
                        <field name="var_topic_code">CC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CI'">
                        <field name="var_topic_facet">Crime/Victimization/Behavior Problems</field>
                        <field name="var_topic_code">CI</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CL'">
                        <field name="var_topic_facet">Clinical Activities</field>
                        <field name="var_topic_code">CL</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CO'">
                        <field name="var_topic_facet">Cohabitation</field>
                        <field name="var_topic_code">CO</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CP'">
                        <field name="var_topic_facet">Civic/Political Activities</field>
                        <field name="var_topic_code">CP</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'DC'">
                        <field name="var_topic_facet">Dating/Courtship</field>
                        <field name="var_topic_code">DC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'DW'">
                        <field name="var_topic_facet">Dwelling</field>
                        <field name="var_topic_code">DW</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'ED'">
                        <field name="var_topic_facet">Education</field>
                        <field name="var_topic_code">ED</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'FS'">
                        <field name="var_topic_facet">Friends/Social Activities/Social Support</field>
                        <field name="var_topic_code">FS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'GC'">
                        <field name="var_topic_facet">Guidance/Counseling</field>
                        <field name="var_topic_code">GC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'GR'">
                        <field name="var_topic_facet">Gender/Gender Role</field>
                        <field name="var_topic_code">GR</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'HC'">
                        <field name="var_topic_facet">Family/Household Characteristics</field>
                        <field name="var_topic_code">HC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'HL'">
                        <field name="var_topic_facet">Physical Health/Disease/Functioning</field>
                        <field name="var_topic_code">HL</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'HO'">
                        <field name="var_topic_facet">Hospital/Inpatient Acute Care</field>
                        <field name="var_topic_code">HO</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'HS'">
                        <field name="var_topic_facet">Family/Household Structure/Composition</field>
                        <field name="var_topic_code">HS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'IN'">
                        <field name="var_topic_facet">Intellectual Functioning</field>
                        <field name="var_topic_code">IN</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'IS'">
                        <field name="var_topic_facet">Institutions, Not Specified</field>
                        <field name="var_topic_code">IS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'IV'">
                        <field name="var_topic_facet">Interview</field>
                        <field name="var_topic_code">IV</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'KR'">
                        <field name="var_topic_facet">Relationships with Other Kin</field>
                        <field name="var_topic_code">KR</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MA'">
                        <field name="var_topic_facet">Anxiety Disorders</field>
                        <field name="var_topic_code">MA</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MD'">
                        <field name="var_topic_facet">Marriage/Cohabitation</field>
                        <field name="var_topic_code">MD</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'ME'">
                        <field name="var_topic_facet">Meta Level</field>
                        <field name="var_topic_code">ME</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MG'">
                        <field name="var_topic_facet">Organic Mental Syndromes</field>
                        <field name="var_topic_code">MG</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MH'">
                        <field name="var_topic_facet">Mental Health</field>
                        <field name="var_topic_code">MH</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MI'">
                        <field name="var_topic_facet">Mental Institutions</field>
                        <field name="var_topic_code">MI</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MM'">
                        <field name="var_topic_facet">Mood Disorders</field>
                        <field name="var_topic_code">MM</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MO'">
                        <field name="var_topic_facet">Residential Mobility</field>
                        <field name="var_topic_code">MO</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MP'">
                        <field name="var_topic_facet">Psychoactive Substance-Use Disorder</field>
                        <field name="var_topic_code">MP</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MS'">
                        <field name="var_topic_facet">Somatoform Disorders</field>
                        <field name="var_topic_code">MS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MZ'">
                        <field name="var_topic_facet">Schizophrenia</field>
                        <field name="var_topic_code">MZ</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'NC'">
                        <field name="var_topic_facet">Neighborhood/Community</field>
                        <field name="var_topic_code">NC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'NH'">
                        <field name="var_topic_facet">Nursing Home</field>
                        <field name="var_topic_code">NH</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'NK'">
                        <field name="var_topic_facet">Relationships with Non-Kin</field>
                        <field name="var_topic_code">NK</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'NU'">
                        <field name="var_topic_facet">Nutrition</field>
                        <field name="var_topic_code">NU</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'OC'">
                        <field name="var_topic_facet">Occupation/Employment</field>
                        <field name="var_topic_code">OC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'OT'">
                        <field name="var_topic_facet">Other</field>
                        <field name="var_topic_code">OT</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PC'">
                        <field name="var_topic_facet">Parent-Child Relationships</field>
                        <field name="var_topic_code">PC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PE'">
                        <field name="var_topic_facet">Personality</field>
                        <field name="var_topic_code">PE</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PF'">
                        <field name="var_topic_facet">Psychological Functioning/Development</field>
                        <field name="var_topic_code">PF</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PP'">
                        <field name="var_topic_facet">Inter-Partner Relationships</field>
                        <field name="var_topic_code">PP</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PS'">
                        <field name="var_topic_facet">Psychiatric Hospitals</field>
                        <field name="var_topic_code">PS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RA'">
                        <field name="var_topic_facet">Race/Ethnicity/Heritage</field>
                        <field name="var_topic_code">RA</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RB'">
                        <field name="var_topic_facet">Reproductive Behavior</field>
                        <field name="var_topic_code">RB</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RC'">
                        <field name="var_topic_facet">Recreation</field>
                        <field name="var_topic_code">RC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RE'">
                        <field name="var_topic_facet">Region/State</field>
                        <field name="var_topic_code">RE</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RL'">
                        <field name="var_topic_facet">Religion/Ethics</field>
                        <field name="var_topic_code">RL</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RS'">
                        <field name="var_topic_facet">Receipt of Health, Mental Health, Social Services</field>
                        <field name="var_topic_code">RS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SA'">
                        <field name="var_topic_facet">Substance Use</field>
                        <field name="var_topic_code">SA</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SD'">
                        <field name="var_topic_facet">Sexually Transmitted Disease</field>
                        <field name="var_topic_code">SD</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SE'">
                        <field name="var_topic_facet">Sex Education</field>
                        <field name="var_topic_code">SE</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SH'">
                        <field name="var_topic_facet">State Hospital</field>
                        <field name="var_topic_code">SH</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SS'">
                        <field name="var_topic_facet">Inter-Sibling Relationships</field>
                        <field name="var_topic_code">SS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SX'">
                        <field name="var_topic_facet">Sexuality</field>
                        <field name="var_topic_code">SX</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'TP'">
                        <field name="var_topic_facet">Government Transfer Payments</field>
                        <field name="var_topic_code">TP</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'UN'">
                        <field name="var_topic_facet">Undocumented</field>
                        <field name="var_topic_code">UN</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'WF'">
                        <field name="var_topic_facet">Wealth/Finances/Poverty/Income</field>
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
                        <field name="var_type_facet">Aggregate</field>
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
               </xsl:when>
               <xsl:when test="$archive='MDA'">
                  <xsl:choose>
                     <xsl:when test="$topic = 'AB'">
                        <field name="var_topic_facet">Abortion</field>
                        <field name="var_topic_code">AB</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'AC'">
                        <field name="var_topic_facet">Agency Characteristics</field>
                        <field name="var_topic_code">AC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'AD'">
                        <field name="var_topic_facet">Adoption/Foster Care</field>
                        <field name="var_topic_code">AD</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'AG'">
                        <field name="var_topic_facet">Age</field>
                        <field name="var_topic_code">AG</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'AL'">
                        <field name="var_topic_facet">Alcohol Use</field>
                        <field name="var_topic_code">AL</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'BB'">
                        <field name="var_topic_facet">Barbiturate/Benzodiazepine Use</field>
                        <field name="var_topic_code">BB</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'BF'">
                        <field name="var_topic_facet">Biological Functioning/Development</field>
                        <field name="var_topic_code">BF</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CB'">
                        <field name="var_topic_facet">Childbearing/Pregnancy</field>
                        <field name="var_topic_code">CB</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CC'">
                        <field name="var_topic_facet">Caregiving/Child Care</field>
                        <field name="var_topic_code">CC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CF'">
                        <field name="var_topic_facet">Caffeine Use</field>
                        <field name="var_topic_code">CF</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CI'">
                        <field name="var_topic_facet">Crime/Victimization/Behavior Problems</field>
                        <field name="var_topic_code">CI</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CK'">
                        <field name="var_topic_facet">Cocaine Use</field>
                        <field name="var_topic_code">CK</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CL'">
                        <field name="var_topic_facet">Clinical Activities</field>
                        <field name="var_topic_code">CL</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CN'">
                        <field name="var_topic_facet">Contraception/Prophylaxis</field>
                        <field name="var_topic_code">CN</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CO'">
                        <field name="var_topic_facet">Cohabitation</field>
                        <field name="var_topic_code">CO</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CP'">
                        <field name="var_topic_facet">Civic/Political Activities</field>
                        <field name="var_topic_code">CP</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'DC'">
                        <field name="var_topic_facet">Dating/Courtship</field>
                        <field name="var_topic_code">DC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'DW'">
                        <field name="var_topic_facet">Dwelling</field>
                        <field name="var_topic_code">DW</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'ED'">
                        <field name="var_topic_facet">Education</field>
                        <field name="var_topic_code">ED</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'EX'">
                        <field name="var_topic_facet">MDMA Use</field>
                        <field name="var_topic_code">EX</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'FS'">
                        <field name="var_topic_facet">Friends/Social Activities/Social Support</field>
                        <field name="var_topic_code">FS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'GC'">
                        <field name="var_topic_facet">Guidance/Counseling</field>
                        <field name="var_topic_code">GC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'GR'">
                        <field name="var_topic_facet">Gender/Gender Role</field>
                        <field name="var_topic_code">GR</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'HC'">
                        <field name="var_topic_facet">Family/Household Characteristics</field>
                        <field name="var_topic_code">HC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'HL'">
                        <field name="var_topic_facet">Physical Health/Disease/Functioning</field>
                        <field name="var_topic_code">HL</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'HN'">
                        <field name="var_topic_facet">Hallucinogen Use</field>
                        <field name="var_topic_code">HN</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'HS'">
                        <field name="var_topic_facet">Family/Household Structure/Composition</field>
                        <field name="var_topic_code">HS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'ID'">
                        <field name="var_topic_facet">Intervention/Treatment</field>
                        <field name="var_topic_code">ID</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'IN'">
                        <field name="var_topic_facet">Intellectual Functioning</field>
                        <field name="var_topic_code">IN</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'IV'">
                        <field name="var_topic_facet">Interview</field>
                        <field name="var_topic_code">IV</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'KR'">
                        <field name="var_topic_facet">Relationships with Other</field>
                        <field name="var_topic_code">OT</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'OW'">
                        <field name="var_topic_facet">Out-of-Wedlock Pregnancy/Parenthood</field>
                        <field name="var_topic_code">OW</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PC'">
                        <field name="var_topic_facet">Parent-Child Relationships</field>
                        <field name="var_topic_code">PC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PE'">
                        <field name="var_topic_facet">Personality</field>
                        <field name="var_topic_code">PE</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PF'">
                        <field name="var_topic_facet">Psychological Functioning/Development</field>
                        <field name="var_topic_code">PF</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PN'">
                        <field name="var_topic_facet">PCP Use</field>
                        <field name="var_topic_code">PN</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PP'">
                        <field name="var_topic_facet">Inter-Partner Relationships</field>
                        <field name="var_topic_code">PP</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RA'">
                        <field name="var_topic_facet">Race/Ethnicity/Heritage</field>
                        <field name="var_topic_code">RA</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RC'">
                        <field name="var_topic_facet">Recreation</field>
                        <field name="var_topic_code">RC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RE'">
                        <field name="var_topic_facet">Region/State</field>
                        <field name="var_topic_code">RE</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RL'">
                        <field name="var_topic_facet">Religion/Ethics</field>
                        <field name="var_topic_code">RL</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RS'">
                        <field name="var_topic_facet">Receipt of Health, Mental Health, Social Services</field>
                        <field name="var_topic_code">RS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SD'">
                        <field name="var_topic_facet">Sexually Transmitted Disease</field>
                        <field name="var_topic_code">SD</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SE'">
                        <field name="var_topic_facet">Sex Education</field>
                        <field name="var_topic_code">SE</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SS'">
                        <field name="var_topic_facet">Inter-Sibling Relationships</field>
                        <field name="var_topic_code">SS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SU'">
                        <field name="var_topic_facet">Psychoactive Substance Use</field>
                        <field name="var_topic_code">SU</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SX'">
                        <field name="var_topic_facet">Sexuality</field>
                        <field name="var_topic_code">SX</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'TB'">
                        <field name="var_topic_facet">Tobacco Use</field>
                        <field name="var_topic_code">TB</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'UN'">
                        <field name="var_topic_facet">Undocumented</field>
                        <field name="var_topic_code">UN</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'WF'">
                        <field name="var_topic_facet">Wealth/Finances/Poverty/Income</field>
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
                        <field name="var_type_facet">Aggregate</field>
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
               </xsl:when>
               <xsl:when test="$archive='RADIUS'">
                  <xsl:choose>
                     <xsl:when test="$topic = 'AC'">
                        <field name="var_topic_facet">Agency Characteristics</field>
                        <field name="var_topic_code">AC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'AD'">
                        <field name="var_topic_facet">Adoption/Foster Care</field>
                        <field name="var_topic_code">AD</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'AG'">
                        <field name="var_topic_facet">Age</field>
                        <field name="var_topic_code">AG</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'BC'">
                        <field name="var_topic_facet">Board &amp; Care/Residential Care</field>
                        <field name="var_topic_code">BC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'BF'">
                        <field name="var_topic_facet">Biological Functioning/Development</field>
                        <field name="var_topic_code">BF</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CB'">
                        <field name="var_topic_facet">Childbearing/Pregnancy</field>
                        <field name="var_topic_code">CB</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CC'">
                        <field name="var_topic_facet">Caregiving/Child Care</field>
                        <field name="var_topic_code">CC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CI'">
                        <field name="var_topic_facet">Crime/Victimization/Behavior Problems</field>
                        <field name="var_topic_code">CI</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CL'">
                        <field name="var_topic_facet">Clinical Activities</field>
                        <field name="var_topic_code">CL</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CO'">
                        <field name="var_topic_facet">Cohabitation</field>
                        <field name="var_topic_code">CO</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'CP'">
                        <field name="var_topic_facet">Civic/Political Activities</field>
                        <field name="var_topic_code">CP</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'DC'">
                        <field name="var_topic_facet">Dating/Courtship</field>
                        <field name="var_topic_code">DC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'DS'">
                        <field name="var_topic_facet">Disability (Superordinate/Multiple)</field>
                        <field name="var_topic_code">DS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'DW'">
                        <field name="var_topic_facet">Dwelling</field>
                        <field name="var_topic_code">DW</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'ED'">
                        <field name="var_topic_facet">Education</field>
                        <field name="var_topic_code">ED</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'FS'">
                        <field name="var_topic_facet">Friends/Social Activities/Social Support</field>
                        <field name="var_topic_code">FS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'GC'">
                        <field name="var_topic_facet">Guidance/Counseling</field>
                        <field name="var_topic_code">GC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'GR'">
                        <field name="var_topic_facet">Gender/Gender Role</field>
                        <field name="var_topic_code">GR</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'HL'">
                        <field name="var_topic_facet">Physical Health/Disease/Functioning</field>
                        <field name="var_topic_code">HL</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'HO'">
                        <field name="var_topic_facet">Hospital/Inpatient Acute Care</field>
                        <field name="var_topic_code">HO</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'HS'">
                        <field name="var_topic_facet">Family/Household Structure/Composition</field>
                        <field name="var_topic_code">HS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'IA'">
                        <field name="var_topic_facet">Intellectual Impairment</field>
                        <field name="var_topic_code">IA</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'IB'">
                        <field name="var_topic_facet">Psychological Impairment</field>
                        <field name="var_topic_code">IB</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'IC'">
                        <field name="var_topic_facet">Language Impairment</field>
                        <field name="var_topic_code">IC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'ID'">
                        <field name="var_topic_facet">Aural Impairment</field>
                        <field name="var_topic_code">ID</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'IE'">
                        <field name="var_topic_facet">Ocular Impairment</field>
                        <field name="var_topic_code">IE</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'IF'">
                        <field name="var_topic_facet">Visceral Impairment</field>
                        <field name="var_topic_code">IF</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'IG'">
                        <field name="var_topic_facet">Skeletal Impairment</field>
                        <field name="var_topic_code">IG</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'IH'">
                        <field name="var_topic_facet">Disfiguring Impairment</field>
                        <field name="var_topic_code">IH</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'II'">
                        <field name="var_topic_facet">General/Sensory/Other Impairment</field>
                        <field name="var_topic_code">II</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'IN'">
                        <field name="var_topic_facet">Intellectual Functioning</field>
                        <field name="var_topic_code">IN</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'IV'">
                        <field name="var_topic_facet">Interview</field>
                        <field name="var_topic_code">IV</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'IZ'">
                        <field name="var_topic_facet">Impairment (Superordinate)</field>
                        <field name="var_topic_code">IZ</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'JA'">
                        <field name="var_topic_facet">Behavior Limitation</field>
                        <field name="var_topic_code">JA</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'JB'">
                        <field name="var_topic_facet">Communication Limitation</field>
                        <field name="var_topic_code">JB</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'JC'">
                        <field name="var_topic_facet">Personal Care Limitation</field>
                        <field name="var_topic_code">JC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'JD'">
                        <field name="var_topic_facet">Locomotor Limitation</field>
                        <field name="var_topic_code">JD</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'JE'">
                        <field name="var_topic_facet">Body Disposition Limitation</field>
                        <field name="var_topic_code">JE</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'JF'">
                        <field name="var_topic_facet">Dexterity Limitation</field>
                        <field name="var_topic_code">JF</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'JG'">
                        <field name="var_topic_facet">Situational Limitation</field>
                        <field name="var_topic_code">JG</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'JH'">
                        <field name="var_topic_facet">Particular Skill Limitation</field>
                        <field name="var_topic_code">JH</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'JI'">
                        <field name="var_topic_facet">Other Activity Limitation</field>
                        <field name="var_topic_code">JI</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'JZ'">
                        <field name="var_topic_facet">Functional Limitation (Superordinate)</field>
                        <field name="var_topic_code">JZ</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'KR'">
                        <field name="var_topic_facet">Relationships with Other Kin</field>
                        <field name="var_topic_code">KR</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MD'">
                        <field name="var_topic_facet">Marriage/Cohabitation</field>
                        <field name="var_topic_code">MD</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'ME'">
                        <field name="var_topic_facet">Meta Level</field>
                        <field name="var_topic_code">ME</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'MO'">
                        <field name="var_topic_facet">Residential Mobility</field>
                        <field name="var_topic_code">MO</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'NC'">
                        <field name="var_topic_facet">Neighborhood/Community</field>
                        <field name="var_topic_code">NC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'NK'">
                        <field name="var_topic_facet">Relationships with Non-Kin</field>
                        <field name="var_topic_code">NK</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'OC'">
                        <field name="var_topic_facet">Occupation/Employment</field>
                        <field name="var_topic_code">OC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'OT'">
                        <field name="var_topic_facet">Other</field>
                        <field name="var_topic_code">OT</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PC'">
                        <field name="var_topic_facet">Parent-Child Relationships</field>
                        <field name="var_topic_code">PC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PE'">
                        <field name="var_topic_facet">Personality</field>
                        <field name="var_topic_code">PE</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PF'">
                        <field name="var_topic_facet">Psychological Functioning/Development</field>
                        <field name="var_topic_code">PF</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PO'">
                        <field name="var_topic_facet">Prosthetics/Orthotics/Assistive Devices</field>
                        <field name="var_topic_code">PO</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'PP'">
                        <field name="var_topic_facet">Inter-Partner Relationships</field>
                        <field name="var_topic_code">PP</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RA'">
                        <field name="var_topic_facet">Race/Ethnicity/Heritage</field>
                        <field name="var_topic_code">RA</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RC'">
                        <field name="var_topic_facet">Recreation</field>
                        <field name="var_topic_code">RC</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RE'">
                        <field name="var_topic_facet">Region/State</field>
                        <field name="var_topic_code">RE</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RH'">
                        <field name="var_topic_facet">Rehabilitation</field>
                        <field name="var_topic_code">RH</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RL'">
                        <field name="var_topic_facet">Religion/Ethics</field>
                        <field name="var_topic_code">RL</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'RS'">
                        <field name="var_topic_facet">Receipt of Health, Mental Health, Social Services</field>
                        <field name="var_topic_code">RS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SA'">
                        <field name="var_topic_facet">Substance Use</field>
                        <field name="var_topic_code">SA</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SD'">
                        <field name="var_topic_facet">Sexually Transmitted Disease</field>
                        <field name="var_topic_code">SD</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SE'">
                        <field name="var_topic_facet">Sex Education</field>
                        <field name="var_topic_code">SE</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SL'">
                        <field name="var_topic_facet">Societal Limitation (Superordinate/Multiple)</field>
                        <field name="var_topic_code">SL</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SS'">
                        <field name="var_topic_facet">Inter-Sibling Relationships</field>
                        <field name="var_topic_code">SS</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'SX'">
                        <field name="var_topic_facet">Sexuality</field>
                        <field name="var_topic_code">SX</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'TP'">
                        <field name="var_topic_facet">Government Transfer Payments</field>
                        <field name="var_topic_code">TP</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'UN'">
                        <field name="var_topic_facet">Undocumented</field>
                        <field name="var_topic_code">UN</field>
                     </xsl:when>
                     <xsl:when test="$topic = 'WF'">
                        <field name="var_topic_facet">Wealth/Finances/Poverty/Income</field>
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
                        <field name="var_type_facet">Aggregate</field>
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
               </xsl:when>
            </xsl:choose>
         </doc>
      </xsl:for-each>			
  </add>
</xsl:template>
</xsl:stylesheet>
