/**
 * @param title  the title of your object as it should appear within the graph, e.g., "The Rock"
 * @param type  the <a href="https://ogp.me/#types">type</a> of your object, e.g., "video.movie"
 * @param url  the canonical URL of your object that will be used as its permanent ID in the graph, e.g., "https://www.imdb.com/title/tt0117500/"
 * @param description  a one to two sentence description of your object
 */
//assert type : "Open Graph type must be any of 'summary', 'summary_large_image', or 'player'"
assert title : "Open Graph title must be defined"
assert !title.trim().empty : "Open Graph title cannot be empty"
assert description : "Open Graph description must be defined"
assert !description.trim().empty : "Open Graph description cannot be empty"
assert url && !url.trim().empty : "Open Graph canonical URL must be defined"
assert url.startsWith('https://') : "Open Graph canonical URL should starts with 'https://': '${url}'"

newLine()
meta(property: 'og:url', content: url) newLine()
meta(property: 'og:site_name', content: 'Nokee') newLine()
meta(property: 'og:title', content: title) newLine()
meta(property: 'og:description', content: description) newLine()
//if (contentLeadImage) {
//	meta(property: 'og:image', content: "${config.site_host}/${permalink}${content.leadimage}")
//	newLine()
//}
