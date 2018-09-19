- if feed.errors
  ul.errors
    - feed.errors.each do |error|
      li = error.to_s

== form(action: "/feeds/", method: :post) do
  == csrf_tag
  == submit("Submit", class: "btn btn-primary btn-sm")
