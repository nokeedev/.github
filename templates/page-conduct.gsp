<!DOCTYPE html>
<html lang="en" prefix="og: https://ogp.me/ns#">
<head>
	<% include 'component-title.head.gsp' %>
	<meta charset="${content.encoding}">
	<% include 'component-favicon.head.gsp' %>
	<% include 'component-menu.head.gsp' %>

	<% include 'component-meta-page-information.head.gsp' %>
</head>
<body>
<% include 'component-menu.body.gsp' %>
	<main class="main-content">

	<h1>${content.title}</h1>

	<p>${content.body}</p>

	</main>
</body>
</html>
