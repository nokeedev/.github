<#macro menu>
<#-- TODO: parameterize the menu -->
	<nav class="navigation" aria-labelledby="primary-navigation">
		<a href="${logoUrl!config.site_host}" class="logo">
			<#include "logo-nokee.svg" />
		</a>
		<input class="navigation-hamburger" type="checkbox" id="navigation-hamburger"/>
		<label class="menu-icon" for="navigation-hamburger">
			<span class="navicon"></span>
		</label>
		<ul class="navigation-items">
			<li><a href="https://docs.nokee.dev">Docs</a></li>
			<li><a href="https://blog.nokee.dev">Blog</a></li>
			<li><a href="https://nokee.dev/services/consulting.html">Services</a></li>
			<li>
				<ul class="navigation-socials">
					<li class="navigation-twitter">
						<a href="https://twitter.com/nokeedev" title="Nokee on Twitter">
							<#include "logo-twitter.svg" />
						</a>
					</li>
					<li class="navigation-github">
						<a href="https://github.com/nokeedev" title="Nokee on GitHub">
							<#include "logo-github.svg" />
						</a>
					</li>
				</ul>
			</li>
		</ul>
	</nav>
</#macro>
