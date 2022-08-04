assert content : "use Asciidoc content"
assert config : "please pass config"

final class CanonicalUrl {
	private String canonicalUrl

	private CanonicalUrl(String canonicalUrl) {
		this.canonicalUrl = canonicalUrl
	}

	static CanonicalUrl forPath(String path) {
		if (path.endsWith('/index.html')) {
			return new CanonicalUrl(path.substring(0, path.lastIndexOf('/') + 1))
		} else {
			return new CanonicalUrl(path)
		}
	}

	URL resolve(String path) {
		assert canonicalUrl.endsWith("/")
		return new URL("${canonicalUrl}${path}")
	}

	String toString() {
		return canonicalUrl
	}
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
		url: CanonicalUrl.forPath("${config.site_host}/${content.uri}"),
		description: content.description,
		image: [
			url: content?.leadimage ? CanonicalUrl.forPath("${config.site_host}/${content.uri}").resolve(content.leadimage) : null,
			alt: content?.leadimagealt
		]
]
if (content.twitter) twitter.putAll(content.twitter)

def openGraph = [
	title: content.title,
	url: CanonicalUrl.forPath("${config.site_host}/${content.uri}"),
	description: content.description,
	image: [
		url: content?.leadimage ? CanonicalUrl.forPath("${config.site_host}/${content.uri}").resolve(content.leadimage) : null,
		alt: content?.leadimagealt,
	]
]

def pageInfo = [
	author: 'Nokee',
	url: CanonicalUrl.forPath("${config.site_host}/${content.uri}"),
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
