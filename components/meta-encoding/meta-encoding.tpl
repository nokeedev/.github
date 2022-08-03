import java.nio.charset.Charset

/**
 * @param encoding  the charset of the page, e.g., "UTF-8" (default)
 */
if (encoding) Charset.forName(encoding) // validate encoding

newLine()
meta(charset: encoding ?: 'UTF-8') newLine()