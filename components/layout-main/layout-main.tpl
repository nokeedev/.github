/**
 * @param title
 * @param encoding
 */
assert logoUrl && !logoUrl.trim().empty : "no logo url"

def components = components ?: []

def twitter = [
	enabled: twitter != null,
	card: twitter?.card ? twitter.card : 'summary',
	title: twitter?.title,
	description: twitter?.description,
	creator: twitter?.creator,
	image: [
		url: twitter?.image?.url?.toString(),
		alt: twitter?.image?.alt,
	]
]

def openGraph = [
	enabled: openGraph != null,
	title: openGraph?.title,
	description: openGraph?.description,
	url: openGraph?.url?.toString(),
	image: [
		url: openGraph?.image?.url?.toString(),
		alt: openGraph?.image?.alt,
	]
]

def pageInfo = [
	enabled: pageInfo != null,
	author: pageInfo?.author,
	keywords: pageInfo?.keywords,
	description: pageInfo?.description,
	url: pageInfo?.url?.toString(),
]

yieldUnescaped '<!DOCTYPE html>'
html(lang:'en', prefix:'og: https://ogp.me/ns#') {
	head {
		title(title) newLine()

		// Nokee font
		link(href: 'https://fonts.googleapis.com/css2?family=IBM+Plex+Sans&family=Rajdhani', rel: 'stylesheet') newLine()
		link(href: 'https://fonts.googleapis.com/css?family=Lato&display=swap', rel: 'stylesheet') newLine()

		// Required by asciidoc font configuration
		link(href: 'https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css', rel: 'stylesheet') newLine()

		// Ordering is important here
		link(href: '/component-asciidoctor.css', rel: 'stylesheet') newLine()
		link(href: '/component-asciidoctor-override.css', rel: 'stylesheet') newLine()
		link(href: '/component-asciidoctor-color-override.css', rel: 'stylesheet') newLine()

		link(href: '/css/docs-base.css', rel: 'stylesheet') newLine()

		if (headContents) headContents()

		link(href: '/css/normalize-8.0.1.css', rel: 'stylesheet')
		link(href: '/css/prettify.css', rel: 'stylesheet')

		if (twitter.enabled) layout 'meta-twitter-card.tpl', *:twitter
		if (openGraph.enabled) layout 'meta-open-graph.tpl', *:openGraph
		layout 'meta-encoding.tpl', encoding: encoding ?: 'UTF-8'
		meta(name: 'viewport', content: 'width=device-width, initial-scale=1.0') newLine()
		if (pageInfo.enabled) layout 'meta-page-information.tpl', *:pageInfo

		link(href: '/component-menu.css', rel: 'stylesheet') newLine()
		if (colorScheme && colorScheme == 'dark') {
			link(href: '/component-menu-dark.css', rel: 'stylesheet') newLine()
		} else {
			link(href: '/component-menu-light.css', rel: 'stylesheet') newLine()
		}

		layout 'meta-favicon.tpl', ignored: false

		components.forEach { component ->
			if (component.stylesheetUrl) {
				link(href: component.stylesheetUrl, rel: 'stylesheet') newLine()
			}
		}
	}

	newLine()

	body(onload: 'prettyPrint()') {
		nav(class: 'navigation', 'aria-labelledby': 'primary-navigation') {
			a(href: logoUrl, class: 'logo') {
				include unescaped: 'logo-nokee.svg'
			}
			input(class: 'navigation-hamburger', type: 'checkbox', id: 'navigation-hamburger')
			label(class: 'menu-icon', for: 'navigation-hamburger') {
				span(class: 'navicon') {}
			}
			ul(class: 'navigation-items') {
				li() { a(href: 'https://docs.nokee.dev', 'Docs') }
				li() { a(href: 'https://blog.nokee.dev', 'Blog') }
				li() { a(href: 'https://nokee.dev/services/consulting.html', 'Services') }
				li() {
					ul(class: 'navigation-socials') {
						li(class: 'navigation-twitter') {
							a(href: 'https://twitter.com/nokeedev', title: 'Nokee on Twitter') {
								include unescaped: 'logo-twitter.svg'
							}
						}
						li(class: 'navigation-github') {
							a(href: 'https://github.com/nokeedev', title: 'Nokee on GitHub') {
								include unescaped: 'logo-github.svg'
							}
						}
					}
				}
			}
		}

		bodyContents()

		// Post scripts to load for speed
		script(src: '/js/prettify.js') {}
		components.forEach { component ->
			if (component.scriptUrl) {
				script(src: component.scriptUrl) {} newLine()
			}
		}
	}
}
newLine()
