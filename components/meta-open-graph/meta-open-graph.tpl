/**
 * @param title  the title of your object as it should appear within the graph, e.g., "The Rock"
 * @param type  the <a href="https://ogp.me/#types">type</a> of your object, e.g., "video.movie"
 * @param url  the canonical URL of your object that will be used as its permanent ID in the graph, e.g., "https://www.imdb.com/title/tt0117500/"
 * @param description  a one to two sentence description of your object
 * @param image  an image which should represent your object within the graph
 * @param image.url  the image URL
 * @param image.alt  the image alt-text
 */
//assert type : "Open Graph type must be any of 'summary', 'summary_large_image', or 'player'"
assert title : "Open Graph title must be defined"
assert !title.trim().empty : "Open Graph title cannot be empty"
assert description : "Open Graph description must be defined"
assert !description.trim().empty : "Open Graph description cannot be empty"
assert url : "Open Graph canonical URL must be defined"
assert !url.trim().empty : "Open Graph canonical URL cannot be empty"
assert !url.startsWith('http://') : "Open Graph canonical URL should use secured protocol"
assert url.startsWith('https://') : "Open Graph canonical URL should use 'https' protocol: '${url}'"
if (image && image.url) {
    assert !image.url.startsWith('http://') : "Open Graph image URL should use secured protocol"
    assert image.url.startsWith('https://') : "Open Graph image URL should use 'https' protocol: '${url}'"
    assert image.alt : "Open Graph image alt-text must be defined"
    assert !image.alt.trim().empty : "Open Graph image alt-text cannot be empty"
}

newLine()
meta(property: 'og:url', content: url) newLine()
meta(property: 'og:site_name', content: 'Nokee') newLine()
meta(property: 'og:title', content: title) newLine()
meta(property: 'og:description', content: description) newLine()
if (image && image.url) {
    meta(property: 'og:image', content: image.url) newLine()
    meta(property: 'og:image:alt', content: image.alt) newLine()
}