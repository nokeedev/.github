/**
 * @param card  the card type, any of 'summary' (see summary), 'summary_large_image' or 'player'
 * @param creator  @username of content creator, defaults to {@literal @nokeedev}
 * @param title  the title of content (max 70 characters)
 * @param description  the description of content (max 200 characters)
 * @param image  the summary image, required when {@code card == 'summary_large_image'}
 * @param image.url  the summary image URL
 * @param image.alt  the summary image alt-text
 */
assert card : "twitter card must be any of 'summary', 'summary_large_image', or 'player'"
assert title : "twitter title must be defined"
assert title.size() <= 70 : "twitter title must be at most 70 characters"
assert !title.trim().empty : "twitter title cannot be empty"
assert description : "twitter description must be defined"
assert description.size() <= 200 : "twitter description must be at most 200 characters"
assert !description.trim().empty : "twitter description cannot be empty"
if (creator) {
	assert creator.startsWith('@') : "twitter creator handle must start with '@' sign: '${creator}'"
}
if (card == 'summary_large_image') {
	assert image : "Twitter image information must be defined for 'summary_large_image' card"
	assert image.url : "Twitter image URL must be defined"
	assert !image.url.startsWith('http://') : "Twitter image URL should use secured protocol"
	assert image.url.startsWith('https://') : "Twitter image URL should use 'https' protocol: '${url}'"
	assert image.alt : "Twitter image alt-text must be defined"
	assert !image.alt.trim().empty : "Twitter image alt-text cannot be empty"
}

newLine()
meta(name: 'twitter:card', content: card) newLine()
meta(name: 'twitter:site', content: '@nokeedev') newLine()
meta(name: 'twitter:creator', content: creator ? creator : '@nokeedev') newLine()
meta(name: 'twitter:title', content: title) newLine()
meta(name: 'twitter:description', content: description) newLine()
if (card == 'summary_large_image') {
	meta(name: 'twitter:image', content: image.url) newLine()
	meta(name: 'twitter:image:alt', content: image.alt) newLine()
}