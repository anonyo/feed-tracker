- active = context.request.path == "/" ? "active" : ""
a class="nav-item #{active}" href="/" Home
- active = context.request.path == "/feeds" ? "active" : ""
a class="nav-item #{active}" href="/feeds" Feeds
