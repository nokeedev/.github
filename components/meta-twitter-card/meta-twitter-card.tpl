/**
 * @param card  the card type, any of 'summary' (see summary), 'summary_large_image' or 'player'
 * @param creator  @username of content creator, defaults to {@literal @nokeedev}
 * @param title  the title of content (max 70 characters)
 * @param description  the description of content (max 200 characters)
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

newLine()
meta(name: 'twitter:card', content: card) newLine()
meta(name: 'twitter:site', content: '@nokeedev') newLine()
meta(name: 'twitter:creator', content: creator ? creator : '@nokeedev') newLine()
meta(name: 'twitter:title', content: title) newLine()
meta(name: 'twitter:description', content: description) newLine()
//<%if (twitterCard == 'summary_large_image') {%>
//<%if (content.leadimage) {%><meta name="twitter:image" content="${config.site_host}/${permalink}/${content.leadimage}"><%}%>
//<%if (content.leadimagealt) {%><meta name="twitter:image:alt" content="${content.leadimagealt}"><%}%>
//<%}%>
