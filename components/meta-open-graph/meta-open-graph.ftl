<#macro metaOpenGraph description title url="">
	<#if url?? && url?has_content>
<#--		<#if url?starts_with("http://")>-->
<#--			<#stop "Open Graph canonical URL should use 'https' protocol: '${url}'">-->
<#--		</#if>-->

		<meta property="og:url" content="${url}" />
	</#if>

	<meta property="og:site_name" content="Nokee" />

	<#if title?? && title?has_content>
		<meta property="og:title" content="${title}" />
	</#if>

	<#if description?? && description?has_content>
		<meta property="og:description" content="${description}" />
	</#if>
<#--	if (image && image.url) {-->
<#--	meta(property: 'og:image', content: image.url) newLine()-->
<#--	meta(property: 'og:image:alt', content: image.alt) newLine()-->
<#--	}-->
	<#-- TODO -->
</#macro>
