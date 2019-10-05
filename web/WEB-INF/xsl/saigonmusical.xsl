<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : saigonmusical.xsl
    Created on : October 2, 2019, 12:35 PM
    Author     : VuPH
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:xh="http://www.w3.org/1999/xhtml"
                xmlns:t="http://vuph.vn/schema/categories"
                xmlns="http://vuph.vn/schema/categories"
                version="1.0">
    <xsl:output method="xml" omit-xml-declaration="yes" indent="yes"/>
    <xsl:template match="t:categories" xmlns="http://vuph.vn/schema/categories">
        <xsl:element name="categories">
            <xsl:variable name="guitarDoc" select="document(@link_saigonmusical_guitar)"/>
            <xsl:element name="category" xmlns="http://vuph.vn/schema/category">
                <xsl:attribute name="categoryName">
                    <xsl:value-of select="'Guitar'"/>
                </xsl:attribute>
                <xsl:for-each select="$guitarDoc//div[contains(@class,'product-wrapper')]">
                    <xsl:if test=".//span[@class='woocommerce-Price-amount amount']">
                        <xsl:call-template name="instrumentTemplate">
                            <xsl:with-param name="name" select=".//h3[contains(@class,'product-title')]/a/text()"/>
                            <xsl:with-param name="price" select="(.//span[@class='woocommerce-Price-amount amount'])[last()]/text()"/>
                            <xsl:with-param name="imageUrl" select=".//a[@class='product-image-link']/img/@data-src"/>
                            <xsl:with-param name="url" select=".//h3[contains(@class,'product-title')]/a/@href"/>
                            <xsl:with-param name="storeName" select="'Sài Gòn Musical'"/>
                            <xsl:with-param name="storeLogo" select="'saigonmusical.png'"/>
                        </xsl:call-template>
                    </xsl:if>
                </xsl:for-each>
            </xsl:element>
            <xsl:variable name="pianoDoc" select="document(@link_saigonmusical_piano)"/>
            <xsl:element name="category" xmlns="http://vuph.vn/schema/category">
                <xsl:attribute name="categoryName">
                    <xsl:value-of select="'Piano'"/>
                </xsl:attribute>
                <xsl:for-each select="$pianoDoc//div[contains(@class,'product-wrapper')]">
                    <xsl:if test=".//span[@class='woocommerce-Price-amount amount']">
                        <xsl:call-template name="instrumentTemplate">
                            <xsl:with-param name="name" select=".//h3[contains(@class,'product-title')]/a/text()"/>
                            <xsl:with-param name="price" select="(.//span[@class='woocommerce-Price-amount amount'])[last()]/text()"/>
                            <xsl:with-param name="imageUrl" select=".//a[@class='product-image-link']/img/@data-src"/>
                            <xsl:with-param name="url" select=".//h3[contains(@class,'product-title')]/a/@href"/>
                            <xsl:with-param name="storeName" select="'Sài Gòn Musical'"/>
                            <xsl:with-param name="storeLogo" select="'saigonmusical.png'"/>
                        </xsl:call-template>
                    </xsl:if>
                </xsl:for-each>
            </xsl:element>
            <xsl:variable name="organDoc" select="document(@link_saigonmusical_organ)"/>
            <xsl:element name="category" xmlns="http://vuph.vn/schema/category">
                <xsl:attribute name="categoryName">
                    <xsl:value-of select="'Organ'"/>
                </xsl:attribute>
                <xsl:for-each select="$organDoc//div[contains(@class,'product-wrapper')]">
                    <xsl:if test=".//span[@class='woocommerce-Price-amount amount']">
                        <xsl:call-template name="instrumentTemplate">
                            <xsl:with-param name="name" select=".//h3[contains(@class,'product-title')]/a/text()"/>
                            <xsl:with-param name="price" select="(.//span[@class='woocommerce-Price-amount amount'])[last()]/text()"/>
                            <xsl:with-param name="imageUrl" select=".//a[@class='product-image-link']/img/@data-src"/>
                            <xsl:with-param name="url" select=".//h3[contains(@class,'product-title')]/a/@href"/>
                            <xsl:with-param name="storeName" select="'Sài Gòn Musical'"/>
                            <xsl:with-param name="storeLogo" select="'saigonmusical.png'"/>
                        </xsl:call-template>
                    </xsl:if>
                </xsl:for-each>
            </xsl:element>
            <xsl:variable name="drumDoc" select="document(@link_saigonmusical_drum)"/>
            <xsl:element name="category" xmlns="http://vuph.vn/schema/category">
                <xsl:attribute name="categoryName">
                    <xsl:value-of select="'Drum'"/>
                </xsl:attribute>
                <xsl:for-each select="$drumDoc//div[contains(@class,'product-wrapper')]">
                    <xsl:if test=".//span[@class='woocommerce-Price-amount amount']">
                        <xsl:call-template name="instrumentTemplate">
                            <xsl:with-param name="name" select=".//h3[contains(@class,'product-title')]/a/text()"/>
                            <xsl:with-param name="price" select="(.//span[@class='woocommerce-Price-amount amount'])[last()]/text()"/>
                            <xsl:with-param name="imageUrl" select=".//a[@class='product-image-link']/img/@data-src"/>
                            <xsl:with-param name="url" select=".//h3[contains(@class,'product-title')]/a/@href"/>
                            <xsl:with-param name="storeName" select="'Sài Gòn Musical'"/>
                            <xsl:with-param name="storeLogo" select="'saigonmusical.png'"/>
                        </xsl:call-template>
                    </xsl:if>
                </xsl:for-each>
            </xsl:element>
            <xsl:variable name="fluteDoc" select="document(@link_saigonmusical_sao)"/>
            <xsl:element name="category" xmlns="http://vuph.vn/schema/category">
                <xsl:attribute name="categoryName">
                    <xsl:value-of select="'Flute'"/>
                </xsl:attribute>
                <xsl:for-each select="$fluteDoc//div[contains(@class,'product-wrapper')]">
                    <xsl:if test=".//span[@class='woocommerce-Price-amount amount']">
                        <xsl:call-template name="instrumentTemplate">
                            <xsl:with-param name="name" select=".//h3[contains(@class,'product-title')]/a/text()"/>
                            <xsl:with-param name="price" select="(.//span[@class='woocommerce-Price-amount amount'])[last()]/text()"/>
                            <xsl:with-param name="imageUrl" select=".//a[@class='product-image-link']/img/@data-src"/>
                            <xsl:with-param name="url" select=".//h3[contains(@class,'product-title')]/a/@href"/>
                            <xsl:with-param name="storeName" select="'Sài Gòn Musical'"/>
                            <xsl:with-param name="storeLogo" select="'saigonmusical.png'"/>
                        </xsl:call-template>
                    </xsl:if>
                </xsl:for-each>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="iterate">
        <xsl:param name="length" select="6"/>
        <xsl:param name="i" select="1"/>
        <xsl:if test="$length > 1">
            <xsl:call-template name="iterate">
                <xsl:with-param name="length" select="$length - 1"/>
                <xsl:with-param name="i" select="$i + 1"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
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