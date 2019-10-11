<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : instrument_jsp.xsl
    Created on : October 10, 2019, 3:16 PM
    Author     : VuPH
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://vuph.vn/schema/instrument"
                xmlns:ns2="http://vuph.vn/schema/category"
                xmlns:ns3="http://vuph.vn/schema/categories"
                version="1.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:template match="//*[local-name()='category'][@categoryName='Flute']">
        <xsl:for-each select=".//*[local-name()='instrument']">
            <div class="item_pro_cat">
                <div class="product-thumb">
                    <div class="image">
                        <a>
                            <xsl:attribute name="href">
                                <xsl:value-of select=".//*[local-name()='url']/text()"/>
                            </xsl:attribute>
                            <img>
                                <xsl:attribute name="src">                                    
                                    <xsl:value-of select=".//*[local-name()='imageUrl']/text()"/>
                                </xsl:attribute>
                            </img> 
                        </a>
                    </div>
                    <div class="caption">
                        <div class="name">
                            <a href="">
                                <h4> 
                                    <xsl:value-of select=".//*[local-name()='name']/text()"/>
                                </h4>
                            </a>
                        </div>
                        <div class="rating">
                            <span class="fa fa-stack">
                                <i class="fa fa-star fa-stack-2x"></i>
                                <i class="fa fa-star-o fa-stack-2x"></i>
                            </span>
                            <span class="fa fa-stack">
                                <i class="fa fa-star fa-stack-2x"></i>
                                <i class="fa fa-star-o fa-stack-2x"></i>
                            </span>
                            <span class="fa fa-stack">
                                <i class="fa fa-star fa-stack-2x"></i>
                                <i class="fa fa-star-o fa-stack-2x"></i>
                            </span>
                            <span class="fa fa-stack">
                                <i class="fa fa-star fa-stack-2x"></i>
                                <i class="fa fa-star-o fa-stack-2x"></i>
                            </span>
                            <span class="fa fa-stack">
                                <i class="fa fa-star fa-stack-2x"></i>
                                <i class="fa fa-star-o fa-stack-2x"></i>
                            </span>
                        </div>
                        <p class="price">
                            <xsl:value-of select="format-number(((.//*[local-name()='price'])[last()]/text()), '###,### đ')"/>                 
                        </p>
                        <span class="readmore">
                            <a>
                                <xsl:attribute name="href">
                                    <xsl:value-of select=".//*[local-name()='url']/text()"/>
                                </xsl:attribute>
                                <xsl:attribute name="target">
                                    <xsl:value-of select="'_blank'"/>
                                </xsl:attribute>
                                BUY
                            </a>
                        </span>
                    </div>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="*[local-name()='category'][@categoryName='Cajon']">
    </xsl:template>
    <xsl:template match="*[local-name()='category'][@categoryName='Organ']">
    </xsl:template>
    <xsl:template match="*[local-name()='category'][@categoryName='Piano']">
    </xsl:template>
    <xsl:template match="*[local-name()='category'][@categoryName='Guitar']">
    </xsl:template>
    <xsl:template match="*[local-name()='category'][@categoryName='Drum']">
    </xsl:template>
    <xsl:template match="*[local-name()='category'][@categoryName='Harmonica']">
    </xsl:template>
</xsl:stylesheet>
