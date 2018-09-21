- if feed.errors
  ul.errors
    - feed.errors.each do |error|
      li = error.to_s

== form(action: "/feeds/", method: :post) do
  == csrf_tag
  - if (current_user = context.current_user)
    == hidden_field(name: "user_id", value: current_user.id)
  == submit("Submit", class: "btn btn-primary btn-sm")
