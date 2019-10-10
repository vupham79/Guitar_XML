<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:s="http://vuph.vn/schema/store"
                xmlns="http://vuph.vn/schema/store"
                version="1.0">
    <xsl:output method="xml" omit-xml-declaration="yes" indent="yes" encoding="UTF-8"/>
    <xsl:template match="s:store" xmlns="http://vuph.vn/schema/store">
        <xsl:element name="store">
            <xsl:element name="name">
                <xsl:value-of select="'Nhạc Cụ Đồng Nai'"/>
            </xsl:element>
            <xsl:element name="logo">
                <xsl:value-of select="'nhaccudongnai.png'"/>
            </xsl:element>
            <xsl:element name="categories" xmlns="http://vuph.vn/schema/categories">
                <xsl:element name="category" xmlns="http://vuph.vn/schema/category">
                    <xsl:attribute name="categoryName">
                        <xsl:value-of select="'Guitar'"/>
                    </xsl:attribute>
                    <xsl:call-template name="instrumentList">
                        <xsl:with-param name="href" select="document(@link_nhaccudongnai_guitar)"/>
                    </xsl:call-template>
                </xsl:element>
                <xsl:element name="category" xmlns="http://vuph.vn/schema/category">
                    <xsl:attribute name="categoryName">
                        <xsl:value-of select="'Flute'"/>
                    </xsl:attribute>
                    <xsl:call-template name="instrumentList">
                        <xsl:with-param name="href" select="document(@link_nhaccudongnai_sao)"/>
                    </xsl:call-template>
                </xsl:element>
                <xsl:element name="category" xmlns="http://vuph.vn/schema/category">
                    <xsl:attribute name="categoryName">
                        <xsl:value-of select="'Cajon'"/>
                    </xsl:attribute>
                    <xsl:call-template name="instrumentList">
                        <xsl:with-param name="href" select="document(@link_nhaccudongnai_cajon)"/>
                    </xsl:call-template>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="instrumentList">
        <xsl:param name="href"/>
        <xsl:for-each select="$href//div[@class='product-small box ']">
            <xsl:if test=".//div[contains(@class,'price-wrapper')]/span[@class='price']">
                <xsl:call-template name="instrumentTemplate">
                    <xsl:with-param name="name" select=".//p[contains(@class,'product-title')]/a/text()"/>
                    <xsl:with-param name="price" select="(.//span[@class='woocommerce-Price-amount amount'])[last()]/text()"/>
                    <xsl:with-param name="imageUrl" select=".//div[contains(@class,'box-image')]//img/@src"/>
                    <xsl:with-param name="url" select=".//p[contains(@class,'product-title')]/a/@href"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:for-each>
        <xsl:if test="($href//li[span[@class='page-number current']]/following-sibling::*)[1]">
            <xsl:call-template name="instrumentList">
                <xsl:with-param name="href" select="document(($href//li[span[@class='page-number current']]/following-sibling::*)[1]/a/@href)"/>
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
                <xsl:value-of select="translate($price,',','')"/>
            </xsl:element>
            <xsl:element name="imageUrl">
                <xsl:value-of select="$imageUrl"/>
            </xsl:element>
            <xsl:element name="url">
                <xsl:value-of select="$url"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
