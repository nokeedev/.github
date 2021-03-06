import java.nio.charset.Charset

/**
 * @param encoding  the charset of the page, e.g., "UTF-8" (default)
 * @param author  the author of the page, e.g., "John Smith", defaults to @nokeedev
 * @param keywords  the keywords of the page, e.g., "Gradle, Nokee, C++"
 * @param description  the description of the page
 * @param url  the canonical URL, e.g. https://nokee.dev/support/
 */
if (encoding) Charset.forName(encoding) // validate encoding
assert description : "HTML description must be defined"
assert !description.trim().empty : "HTML description cannot be empty"
assert url : "HTML canonical URL must be defined"
assert !url.trim().empty : "HTML canonical URL cannot be empty"
assert !url.startsWith('http://') : "HTML canonical URL should use secured protocol"
assert url.startsWith('https://') : "HTML canonical URL should use 'https' protocol: '${url}'"

newLine()
meta(charset: encoding ? encoding : 'UTF-8') newLine()
meta(name: 'author', content: author ? author : '@nokeedev') newLine()
meta(name: 'keywords', content: keywords.join(', ')) newLine()
meta(name: 'description', content: description) newLine()
meta(name: 'viewport', content: 'width=device-width, initial-scale=1.0') newLine()
link(rel: 'canonical', href: url) newLine()
