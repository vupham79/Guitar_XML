<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : instrumentFO.xsl
    Created on : October 11, 2019, 10:16 PM
    Author     : VuPH
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" version="1.0" indent="yes" encoding="UTF-8"/>
    <xsl:param name="pathFile" select="'pdf'"/>
    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format" font-family="Arial">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="x" page-height="8.5in"
                                       page-width="12in" margin-top="0.5in" margin-bottom="0.5in"
                                       margin-left="1in" margin-right="1in">
                    <fo:region-body margin-top="0.5in"/>
                    <fo:region-before extent="1in"/>
                    <fo:region-after extent=".75in"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="x">
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block font-size="14pt" font-family="sans-serif"
                              line-height="24pt" background-color="#ffe000"
                              space-after.optimum="15pt" text-align="center"
                              padding-top="3pt">
                        Instruments PDF
                    </fo:block>
                </fo:static-content>
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block font-size="18pt" font-family="sans-serif"
                              line-height="24pt" space-after.optimum="15pt"
                              text-align="center" padding-top="3pt">
                    </fo:block>
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body">
                    <fo:block>
                        <fo:table border-collapse="separate" table-layout="fixed">
                            <fo:table-column column-width="2cm"/>
                            <fo:table-column column-width="7cm"/>
                            <fo:table-column column-width="4cm"/>
                            <fo:table-column column-width="4cm"/>
                            <fo:table-column column-width="6cm"/>
                            <fo:table-column column-width="2cm"/>
                            
                            <fo:table-body>
                                <fo:table-row>
                                    <fo:table-cell border-color="black"
                                                   border-width="0.5pt"
                                                   border-style="solid">
                                        <fo:block text-align="center">Id</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border-color="black"
                                                   border-width="0.5pt"
                                                   border-style="solid">
                                        <fo:block text-align="center">Name</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border-color="black"
                                                   border-width="0.5pt"
                                                   border-style="solid">
                                        <fo:block text-align="center">Price</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border-color="black"
                                                   border-width="0.5pt"
                                                   border-style="solid">
                                        <fo:block text-align="center">Category</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border-color="black"
                                                   border-width="0.5pt"
                                                   border-style="solid">
                                        <fo:block text-align="center">Store</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border-color="black"
                                                   border-width="0.5pt"
                                                   border-style="solid">
                                        <fo:block text-align="center">View</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <xsl:for-each select="//*[local-name()='instrument']">
                                    <fo:table-row>
                                        <fo:table-cell border-color="black"
                                                       border-width="0.5pt" border-style="solid">
                                            <fo:block text-align="center">
                                                <xsl:value-of select="./@id"/>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border-color="black"
                                                       border-width="0.5pt" border-style="solid">
                                            <fo:block text-align="center">
                                                <xsl:value-of select=".//*[local-name()='name']/text()"/>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border-color="black"
                                                       border-width="0.5pt" border-style="solid">
                                            <fo:block text-align="center">
                                                <xsl:value-of select="format-number((.//*[local-name()='price']/text()), '###,### đ')"/>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border-color="black"
                                                       border-width="0.5pt" border-style="solid">
                                            <fo:block text-align="center">
                                                <xsl:value-of select=".//../@categoryName"/>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border-color="black"
                                                       border-width="0.5pt" border-style="solid">
                                            <fo:block text-align="center">
                                                <xsl:value-of select=".//@storeName"/>
                                            </fo:block>
                                            <fo:block>
                                                <fo:external-graphic inline-progression-dimension.maximum="100%" 
                                                                     content-height="scale-down-to-fit" 
                                                                     content-width="scale-down-to-fit">
                                                    <xsl:attribute name="src">
                                                        <xsl:value-of select=".//@storeLogo"/>
                                                    </xsl:attribute>
                                                </fo:external-graphic>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border-color="black"
                                                       border-width="0.5pt" border-style="solid">
                                            <fo:block text-align="center">
                                                <xsl:value-of select=".//@viewNo"/>
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </xsl:for-each>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>
