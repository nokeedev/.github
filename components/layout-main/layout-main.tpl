/**
 * @param title
 * @param encoding
 * @param description
 * @param canonicalUrl
 */
assert logoUrl && !logoUrl.trim().empty : "no logo url"

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
		link(href: '/css/blog-layout.css', rel: 'stylesheet') newLine()

		if (headContents) headContents()

		link(href: '/css/normalize-8.0.1.css', rel: 'stylesheet')
		link(href: '/css/prettify.css', rel: 'stylesheet')

		layout 'meta-twitter-card.tpl',
			card: twitter?.card ? twitter.card : 'summary',
			title: title,
			description: description,
			creator: twitter?.creator,
			image: twitter?.image

		layout 'meta-open-graph.tpl',
			title: title,
			description: description,
			url: url

		layout 'meta-page-information.tpl',
			encoding: encoding,
			keywords: keywords,
			description: description,
			url: url

		link(href: '/component-menu.css', rel: 'stylesheet') newLine()
		if (colorScheme && colorScheme == 'dark') {
			link(href: '/component-menu-dark.css', rel: 'stylesheet') newLine()
		} else {
			link(href: '/component-menu-light.css', rel: 'stylesheet') newLine()
		}

		layout 'meta-favicon.tpl', ignored: false

		if (multiLanguageSampleEnabled) {
			link(href: '/component-multi-language-sample.css', rel: 'stylesheet') newLine()
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
		newLine()

		div(id: 'push') {}

		div(id: 'footer') {
			div(class: 'container') {
				p(class: 'muted credit', '&copy; 2020')
			}
		}

		// Post scripts to load for speed
		script(src: '/js/prettify.js') {}
		if (multiLanguageSampleEnabled) {
			script(src: '/component-multi-language-sample.js') {} newLine()
		}
	}
}
newLine()
