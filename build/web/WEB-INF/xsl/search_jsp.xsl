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
    <xsl:param name="search"/>
    <xsl:template match="/">
        <xsl:if test="not(//*[local-name()='instrument'][contains(*[local-name()='name'], $search) or *[local-name()='name']=$search])">
            <div class="cont_html_top">
                <div class="tit_html_top">Không tìm thấy sản phẩm phù hợp</div>
            </div>
        </xsl:if>
        <xsl:if test="//*[local-name()='instrument'][contains(*[local-name()='name'], $search)]">
            <div class="cont_html_top">
                <div class="tit_html_top">About 1,234 results (0.69 seconds) </div>
            </div>
        </xsl:if>
        <xsl:for-each select="//*[local-name()='instrument'][contains(*[local-name()='name'], $search)]">
            <div class="item_pro_cat">
                <div class="product-thumb">
                    <div class="image">
                        <a>
                            <xsl:attribute name="href">
                                <xsl:value-of select=".//*[local-name()='url']/text()"/>
                            </xsl:attribute>
                            <xsl:attribute name="target">
                                <xsl:value-of select="'_blank'"/>
                            </xsl:attribute>
                            <img>
                                <xsl:attribute name="src">  
                                    <xsl:variable name="imageUrl" select=".//*[local-name()='imageUrl']"/>
                                    <xsl:if test="$imageUrl">
                                        <xsl:value-of select="$imageUrl"/>
                                    </xsl:if>
                                    <xsl:if test="$imageUrl=''">
                                        <xsl:value-of select="'img\noimage.png'"/>
                                    </xsl:if>        
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
                            <xsl:value-of select="format-number((.//*[local-name()='price']/text()), '###,### đ')"/>                 
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
</xsl:stylesheet>
