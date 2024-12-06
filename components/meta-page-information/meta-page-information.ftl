<#macro metaPageInfo author="" keywords=[] description="" url="">
	<#if author?has_content>
		<meta name="author" content="${author}" />
	</#if>

	<#if keywords?has_content>
		<meta name="keywords" content="${keywords?join(", ")}" />
	</#if>

	<#if description?has_content>
		<meta name="description" content="${description}" />
	</#if>

	<#if url?has_content>
		<link rel="canonical" href="${url}" />
	</#if>
</#macro>
