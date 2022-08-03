assert content : "use Asciidoc content"
assert config : "please pass config"

def canonicalPathFor = { String path ->
	def canonicalPath = path
	if (canonicalPath.endsWith('/index.html')) {
		canonicalPath = canonicalPath.substring(0, canonicalPath.lastIndexOf('/'))
	} else if (canonicalPath == 'index.html') {
		canonicalPath = ''
	}
	return "${config.site_host}/${canonicalPath}"
}

def headerContents = headerContents
if (!headerContents) {
	headerContents = contents {
		h1(content.title) newLine()
	}
}

def pageContents = pageContents
if (!pageContents) {
	pageContents = contents {
		yieldUnescaped(content.body)
	}
}

def headContents = headContents
if (!headContents) {
	headContents = contents {
		link(rel: 'stylesheet', href: '/css/blog-layout.css') newLine()
	}
}

def twitter = [
		card: 'summary',
		title: content.title,
		url: "${canonicalPathFor(content.uri)}/",
		description: content.description,
		image: [
			url: content?.leadimage ? "${canonicalPathFor(content.uri)}/${content.leadimage}" : null,
			alt: content?.leadimagealt
		]
]
if (content.twitter) twitter.putAll(content.twitter)

def openGraph = [
	title: content.title,
	url: "${canonicalPathFor(content.uri)}/",
	description: content.description,
	image: [
		url: content?.leadimage ? "${canonicalPathFor(content.uri)}/${content.leadimage}" : null,
		alt: content?.leadimagealt,
	]
]

def pageInfo = [
	author: 'Nokee',
	url: "${canonicalPathFor(content.uri)}/",
	description: content.description,
	keywords: content.tags,
]

def bodyContents = bodyContents
if (!bodyContents) {
	bodyContents = contents {
		layout 'fragment-main-content.tpl', bodyContents: {
			layout 'fragment-chapter.tpl',
				headerContents: headerContents,
				bodyContents: pageContents
		}

		if (footerContents) {
			div(id: 'push') {}
			footerContents()
		}

		layout 'fragment-copyright.tpl', ignored: false
	}
}

layout 'layout-main.tpl',
	components: components,
	title: content.title,
	encoding: content.encoding,
	headContents: headContents,
	twitter: twitter,
	openGraph: openGraph,
	pageInfo: pageInfo,
	logoUrl: config.menu_logoUrl ? config.menu_logoUrl : config.site_host,
	bodyContents: bodyContents
