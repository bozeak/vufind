<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:php="http://php.net/xsl"
                xmlns:ac="http://biblstandard.dk/ac/namespace/"
                xmlns:dc="http://purl.org/dc/elements/1.1/"
                xmlns:dkabm="http://biblstandard.dk/abm/namespace/dkabm/"
>
    <xsl:template match="object">
        <add>
            <doc>
                <field name="id">
                    <xsl:value-of select="//identifier"/>
                </field>

                <!-- TITLE -->
                <xsl:if test="//dc:title[normalize-space()]">
                    <field name="title">
                        <xsl:value-of select="//dc:title[normalize-space()]"/>
                    </field>
                    <field name="title_short">
                        <xsl:value-of select="//dc:title[normalize-space()]"/>
                    </field>
                    <field name="title_full">
                        <xsl:value-of select="//dc:title[normalize-space()]"/>
                    </field>
                    <field name="title_sort">
                        <xsl:value-of select="php:function('VuFind::stripArticles', string(//dc:title[normalize-space()]))"/>
                    </field>
                </xsl:if>

                <!-- DESCRIPTION -->
                <xsl:if test="//dc:description">
                    <field name="description">
                        <xsl:value-of select="//dc:description[normalize-space()]" />
                    </field>
                </xsl:if>

                <!-- SUBJECT -->
                <xsl:if test="//dc:subject">
                    <xsl:for-each select="//dc:subject">
                        <xsl:if test="string-length() > 0">
                            <field name="topic">
                                <xsl:value-of select="php:function('VuFind::mapString', normalize-space(string(.)), 'language_map.properties')"/>
                            </field>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>

                <!-- CREATOR -->
                <xsl:if test="//dc:creator">
                    <xsl:for-each select="//dc:creator">
                        <xsl:if test="string-length() > 0">
                            <field name="author">
                                <xsl:value-of select="php:function('VuFind::mapString', normalize-space(string(.)), 'language_map.properties')"/>
                            </field>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>

                <!-- PUBLISHER -->
                <xsl:if test="//dc:publisher">
                    <xsl:for-each select="//dc:publisher">
                        <xsl:if test="string-length() > 0">
                            <field name="publisher">
                                <xsl:value-of select="php:function('VuFind::mapString', normalize-space(string(.)), 'language_map.properties')"/>
                            </field>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>

                <!-- CONTRIBUTOR -->
                <xsl:if test="//dc:contributor">
                    <xsl:for-each select="//dc:contributor">
                        <xsl:if test="string-length() > 0">
                            <field name="author2">
                                <xsl:value-of select="php:function('VuFind::mapString', normalize-space(string(.)), 'language_map.properties')"/>
                            </field>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>

                <!-- PUBLISHDATE -->
                <xsl:if test="//dc:date">
                    <field name="publishDate">
                        <xsl:value-of select="substring(//dc:date, 1, 4)"/>
                    </field>
                    <field name="publishDateSort">
                        <xsl:value-of select="substring(//dc:date, 1, 4)"/>
                    </field>
                </xsl:if>

                <!-- TYPE -->
                <xsl:if test="//dc:type">
                    <field name="format">
                        <xsl:value-of select="//dc:type" />
                    </field>
                </xsl:if>
            </doc>
        </add>
    </xsl:template>
</xsl:stylesheet>
