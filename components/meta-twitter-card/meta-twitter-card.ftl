<#macro metaTwitter description creator title card>
	<meta name="twitter:site" content="@nokeedev" />
	<#if creator?has_content>
		<meta name="twitter:creator" content="${creator?ensure_starts_with("@")}" />
	</#if>

	<#if title?has_content>
		<meta name="twitter:title" content="${title}" />
	</#if>

	<#if description?has_content>
		<meta name="twitter:description" content="${description}" />
	</#if>

<#--	<#if card??>-->
<#--		<#if !card.type??><#stop "card without a type"></#if>-->
<#--	</#if>-->

<#--	meta(name: 'twitter:card', content: card) newLine()-->
<#--	if (card == 'summary_large_image') {-->
<#--	meta(name: 'twitter:image', content: image.url) newLine()-->
<#--	meta(name: 'twitter:image:alt', content: image.alt) newLine()-->
<#--	}-->


	<#-- TODO -->
</#macro>
