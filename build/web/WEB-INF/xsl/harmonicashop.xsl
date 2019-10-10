<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:s="http://vuph.vn/schema/store"
                xmlns="http://vuph.vn/schema/store"
                version="1.0">
    <xsl:output method="xml" omit-xml-declaration="yes" indent="yes" encoding="UTF-8"/>
    <xsl:template match="s:store" xmlns="http://vuph.vn/schema/store">
        <xsl:element name="store">
            <xsl:element name="name">
                <xsl:value-of select="'HarmonicaShop'"/>
            </xsl:element>
            <xsl:element name="logo">
                <xsl:value-of select="'harmonicashop.jpg'"/>
            </xsl:element>
            <xsl:element name="categories" xmlns="http://vuph.vn/schema/categories">
                <xsl:element name="category" xmlns="http://vuph.vn/schema/category">
                    <xsl:attribute name="categoryName">
                        <xsl:value-of select="'Harmonica'"/>
                    </xsl:attribute>
                    <xsl:call-template name="instrumentList">
                        <xsl:with-param name="href" select="document(@link_harmonicashop)"/>
                    </xsl:call-template>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="instrumentList">
        <xsl:param name="href"/>
        <xsl:for-each select="$href//div[@class='ochua100']">
            <xsl:if test=".//h2[@class='tieude']//a[not(strong)]">
                <xsl:call-template name="instrumentTemplate">
                    <xsl:with-param name="name" select=".//h2[@class='tieude']/a/text()"/>
                    <xsl:with-param name="price" select=".//p[@class='gia']/strong/text()"/>
                    <xsl:with-param name="imageUrl" select=".//p[@class='anh hvrshrinkeffects']//img/@src"/>
                    <xsl:with-param name="url" select=".//h2[@class='tieude']/a/@href"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:for-each>
        <xsl:if test="($href//a[@class='link_dang_chon']/following-sibling::*)[1]">
            <xsl:variable name="link1" select="($href//a[@class='link_dang_chon']/following-sibling::*)[1]/@href"/>
            <xsl:variable name="link" select="concat('https://harmonicashop.net/',$link1)"/>
            <xsl:call-template name="instrumentList">
                <xsl:with-param name="href" select="document($link)"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="instrumentTemplate">        
        <xsl:param name="name"/>
        <xsl:param name="price"/>
        <xsl:param name="imageUrl"/>
        <xsl:param name="url"/>
        <xsl:element name="instrument" xmlns="http://vuph.vn/schema/instrument">            
            <xsl:element name="name">
                <xsl:value-of select="$name"/>
            </xsl:element>         
            <xsl:element name="price">
                <xsl:value-of select="translate($price,'.','')"/>
            </xsl:element>
            <xsl:element name="imageUrl">
                <xsl:value-of select="concat('https://harmonicashop.net/',$imageUrl)"/>
            </xsl:element>
            <xsl:element name="url">
                <xsl:value-of select="concat('https://harmonicashop.net/',$url)"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
