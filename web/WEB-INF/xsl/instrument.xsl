<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">    
    <xsl:template name="instrumentTemplate">        
        <xsl:param name="id"/>
        <xsl:param name="name"/>
        <xsl:param name="price"/>
        <xsl:param name="imageUrl"/>
        <xsl:param name="url"/>
        <xsl:param name="click"/>
        <xsl:element name="instrument" xmlns="http://vuph.vn/schema/instrument">            
            <xsl:attribute name="id">
                <xsl:value-of select="$id"/>
            </xsl:attribute>
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
            <xsl:element name="click">
                <xsl:value-of select="$click"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>