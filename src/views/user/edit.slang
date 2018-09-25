h1 Edit Profile

- if user.errors
  ul.errors
  - user.errors.each do |error|
    li = error.to_s

== form(action: "/profile", method: :patch) do
  == csrf_tag
  .form-group
    == text_field(name: "email", value: user.email)
    .br
    == text_field(name: "pushover_token", value: user.pushover_token)
  == submit("Update", class: "btn btn-primary btn-sm")
  == link_to("profile", "/profile", class: "btn btn-light btn-sm")
