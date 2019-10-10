<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : instrument_jsp.xsl
    Created on : October 10, 2019, 3:16 PM
    Author     : VuPH
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ns1="http://vuph.vn/schema/instrument"
                xmlns:ns2="http://vuph.vn/schema/category"
                xmlns:ns3="http://vuph.vn/schema/categories"
                version="1.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:template match="/">
        <html>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="ns3:categories">
        <xsl:for-each select="ns2:category">
            <div class="item_pro_cat">
                <div class="product-thumb">
                    <div class="image">
                        <a href="https://ducthuong.com.vn/fender-villager-sce-12-day.html">
                            <img src="https://ducthuong.com.vn/image/cache/catalog/GUITAR/Fender/Fender Villager Sce 12 Dây-780x720.jpg" alt=" Fender Villager Sce 12 Dây" title=" Fender Villager Sce 12 Dây" class="img-responsive"/>
                        </a>
                    </div>
                    <div class="caption">
                        <div class="name">
                            <a href="https://ducthuong.com.vn/fender-villager-sce-12-day.html">
                                <h4> Fender Villager Sce 12 Dây</h4>
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
                            10.880.000 đ                 
                        </p>
                        <span class="readmore">
                            <a href="https://ducthuong.com.vn/fender-villager-sce-12-day.html">xem thêm</a>
                        </span>
                    </div>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
