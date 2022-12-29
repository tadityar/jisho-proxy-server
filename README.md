# Jisho Proxy Server

Barebone proxy server for jisho.org's API.

Due to Cross-Origin Resource Sharing (CORS) policy of jisho.org, client-side applications can't make requests
directly to jisho.org. This proxy server acts as a middleman that does server-side request to jisho.org so
your client-side application can make requets to the proxy server instead.
