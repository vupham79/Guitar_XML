<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:s="http://vuph.vn/schema/store"
                xmlns="http://vuph.vn/schema/store"
                version="1.0">
    <xsl:output method="xml" omit-xml-declaration="yes" indent="yes" encoding="UTF-8"/>
    <xsl:template match="s:store" xmlns="http://vuph.vn/schema/store">
        <xsl:element name="store">
            <xsl:element name="name">
                <xsl:value-of select="'Đức Thương'"/>
            </xsl:element>
            <xsl:element name="logo">
                <xsl:value-of select="'ducthuong.png'"/>
            </xsl:element>
            <xsl:element name="categories" xmlns="http://vuph.vn/schema/categories">
                <xsl:element name="category" xmlns="http://vuph.vn/schema/category">
                    <xsl:attribute name="categoryName">
                        <xsl:value-of select="'Classic Guitar'"/>
                    </xsl:attribute>
                    <xsl:call-template name="instrumentList">
                        <xsl:with-param name="href" select="document(@link_ducthuong_classic_guitar)"/>
                    </xsl:call-template>
                    <xsl:call-template name="instrumentList">
                        <xsl:with-param name="href" select="document(@link_ducthuong_acoustic_guitar)"/>
                    </xsl:call-template>
                    <xsl:call-template name="instrumentList">
                        <xsl:with-param name="href" select="document(@link_ducthuong_ukulele)"/>
                    </xsl:call-template>
                </xsl:element>
                <xsl:element name="category" xmlns="http://vuph.vn/schema/category">
                    <xsl:attribute name="categoryName">
                        <xsl:value-of select="'Electric Guitar'"/>
                    </xsl:attribute>
                    <xsl:call-template name="instrumentList">
                        <xsl:with-param name="href" select="document(@link_ducthuong_electric_guitar)"/>
                    </xsl:call-template>
                </xsl:element>
                <xsl:element name="category" xmlns="http://vuph.vn/schema/category">
                    <xsl:attribute name="categoryName">
                        <xsl:value-of select="'Piano'"/>
                    </xsl:attribute>
                    <xsl:call-template name="instrumentList">
                        <xsl:with-param name="href" select="document(@link_ducthuong_piano)"/>
                    </xsl:call-template>
                </xsl:element>
                <xsl:element name="category" xmlns="http://vuph.vn/schema/category">
                    <xsl:attribute name="categoryName">
                        <xsl:value-of select="'Organ'"/>
                    </xsl:attribute>
                    <xsl:call-template name="instrumentList">
                        <xsl:with-param name="href" select="document(@link_ducthuong_organ)"/>
                    </xsl:call-template>
                </xsl:element>
                <xsl:element name="category" xmlns="http://vuph.vn/schema/category">
                    <xsl:attribute name="categoryName">
                        <xsl:value-of select="'Drum'"/>
                    </xsl:attribute>
                    <xsl:call-template name="instrumentList">
                        <xsl:with-param name="href" select="document(@link_ducthuong_drum)"/>
                    </xsl:call-template>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="instrumentList">
        <xsl:param name="href"/>
        <xsl:for-each select="$href//div[@class='item_pro_cat']">
            <xsl:if test=".//p[@class='price' and text()[normalize-space()!='0 đ']]">
                <xsl:call-template name="instrumentTemplate">
                    <xsl:with-param name="name" select=".//div[@class='name']//h4/text()"/>
                    <xsl:with-param name="price" select=".//p[@class='price']/text()"/>
                    <xsl:with-param name="imageUrl" select=".//div[@class='image']//img/@src"/>
                    <xsl:with-param name="url" select=".//div[@class='name']//a/@href"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:for-each>
        <xsl:if test="($href//div[@class='panagi']//li[@class='active']/following-sibling::*)[1]">
            <xsl:call-template name="instrumentList">
                <xsl:with-param name="href" select="document(($href//div[@class='panagi']//li[@class='active']/following-sibling::*)[1]//a/@href)"/>
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
                <xsl:value-of select="translate($price,'. đ','')"/>
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
