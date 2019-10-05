<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : instrument.xsl
    Created on : October 1, 2019, 8:40 PM
    Author     : VuPH
    Description:
        Purpose of transformation follows.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">    
    <xsl:template name="instrumentTemplate">        
        <xsl:param name="name"/>
        <xsl:param name="price"/>
        <xsl:param name="imageUrl"/>
        <xsl:param name="url"/>
        <xsl:param name="storeName"/>
        <xsl:param name="storeLogo"/>
        <xsl:element name="instrument" xmlns="http://vuph.vn/schema/instrument">            
            <xsl:element name="name">
                <xsl:value-of select="$name"/>
            </xsl:element>         
            <xsl:element name="price">
                <xsl:value-of select="$price"/>
            </xsl:element>
            <xsl:element name="imageUrl">
                <xsl:value-of select="$imageUrl"/>
            </xsl:element>
            <xsl:element name="url">
                <xsl:value-of select="$url"/>
            </xsl:element>
            <xsl:element name="storeName">
                <xsl:value-of select="$storeName"/>
            </xsl:element>
            <xsl:element name="storeLogo">
                <xsl:value-of select="$storeLogo"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>