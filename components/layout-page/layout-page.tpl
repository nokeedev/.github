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

def bodyContents = bodyContents
if (!bodyContents) {
	bodyContents = contents {
		yieldUnescaped(content.body)
	}
}

def twitter = [:]
if (content.twitter) twitter.putAll(content.twitter)
twitter.put('image', [
		url: content?.leadimage ? "${canonicalPathFor(content.uri)}/${content.leadimage}" : null,
		alt: content?.leadimagealt
])

layout 'layout-main.tpl',
	title: content.title,
	description: content.description,
	encoding: content.encoding,
	keywords: content.tags,
	url: "${canonicalPathFor(content.uri)}/",
	headContents: headContents,
	twitter: twitter,
	logoUrl: config.menu_logoUrl ? config.menu_logoUrl : config.site_host,
	bodyContents: contents {
		main(class: 'main-content') {
			div(class: 'chapter') {
				div(class: 'header') {
					headerContents()
				}

				newLine()

				div(class: 'content') {
					bodyContents()
				}
			}
		}
	}
