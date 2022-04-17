<%
	def canonicalPathFor = { String path ->
		def canonicalPath = path
		if (canonicalPath.endsWith('/index.html')) {
			canonicalPath = canonicalPath.substring(0, canonicalPath.lastIndexOf('/') + 1)
		} else if (canonicalPath == 'index.html') {
			canonicalPath = ''
		}
		return "${config.site_host}/${canonicalPath}"
	}

	def canonicalLink = canonicalPathFor(content.uri)
%>
<meta property="og:url" content="${canonicalLink}">

<%
	def indexOfLastSlash = content.uri.lastIndexOf('/')
	def permalink = ''
	if (indexOfLastSlash != -1) {
		permalink = content.uri.substring(0, content.uri.lastIndexOf('/') + 1)
	}

	if (permalink == 'index.html') {
		permalink = ''
	}
%>
<% // og:url configuration is in fragment-meta-canonical.gsp %>
<meta property="og:site_name" content="Nokee">
<meta property="og:title" content="${content.title}">
<%if (content.description) {%><meta name="og:description" content="${content.description}"><%}%>
<%if (content.leadimage) {%><meta name="og:image" content="${config.site_host}/${permalink}${content.leadimage}"><%}%>
