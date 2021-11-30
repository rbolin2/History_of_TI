<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="tei" version="2.0">
    
    <xsl:output method="html" indent="yes" encoding="iso-8859-1" omit-xml-declaration="yes"/>
    
    
    
    <xsl:template match="/"> <!-- NOTICE THE SLASH THERE. In XPath this means root node (which in a TEI XML file is <TEI>).  I USE THIS TO ORGANIZE THE BASIC STRUCTURE  OF THE OUTPUT DOCUMENT. SO IT WILL INCLUDE BASIC DOCUMENT STRUCTURE TAGS AND ANY PULLING/REORGANIZING OF INFORMATION FROM THE ORIGINAL.-->
        <html>
        	<head>
        		<link rel="stylesheet"  href="CSSTemplate.css"/>
        	</head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    
    
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    
    
    <xsl:template match="tei:head">
        <h3>
            <xsl:apply-templates/>
        </h3>
        </xsl:template>
    
    
    
    <xsl:template match="tei:lg">
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    
    
    <xsl:template match="tei:l">
        <xsl:apply-templates/><br/>
    </xsl:template>    
    
    
    
    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>
    
    
    
    <xsl:template match="tei:hi[@rend='italic']">
        <em>        </em>
    </xsl:template>
    
    
    
    <xsl:template match="tei:note[@type='editorial']">
        <p class="editorial">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    
    <xsl:template match="tei:ref">
        <a>
            <xsl:attribute name="href">
                <xsl:apply-templates select="@target"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    
    
    
    <xsl:template match="tei:list">
        <ul><!-- <ul> is an unordered list, <ol> is ordered list -->
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    
    
    <xsl:template match="tei:item">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    
    
    
    <xsl:template match="tei:choice"> 
        <xsl:choose>
            <xsl:when test="tei:orig">
                <xsl:apply-templates select="child::tei:orig"/> [<xsl:value-of select="child::tei:reg"/>]
            </xsl:when>
            <xsl:when test="tei:sic">
                <xsl:apply-templates select="child::tei:sic"/> [<xsl:value-of select="child::tei:corr"/>]
            </xsl:when>
            <xsl:when test="tei:abbr">
                <xsl:apply-templates select="child::tei:abbr"/> [<xsl:value-of select="child::tei:expan"/>]
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:back//tei:bibl">
    	<p class="gloss"><xsl:apply-templates/></p>
     </xsl:template>
  
<xsl:template match="tei:back//tei:bibl/tei:title[@type='short']"/>
 
	
<xsl:template match="tei:back//tei:bibl/tei:title[@type='main']">
    	<h4><xsl:apply-templates/></h4>
     </xsl:template>
	

    <xsl:template match="tei:teiHeader"/><!-- NOTICE THAT THIS ONE IS EMPTY. WE WILL TALK ABOUT WHAT THAT DOES. -->
   
  <xsl:template match="tei:orth">  
   	<span class="orth"><xsl:apply-templates/></span><br/>
   </xsl:template>
  
  <xsl:template match="tei:def">  
   	<span class="def"><xsl:apply-templates/></span>
   </xsl:template>
    
</xsl:stylesheet>
