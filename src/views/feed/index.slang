.row
  .col-sm-11
    h1 New Feed
    == render(partial: "_form.slang")
  .col-sm-1
.table-responsive
  table.table.table-striped
    thead
      tr
        th Actions
    tbody
      - feeds.each do |feed|
        tr
          td
            span
              == link_to("delete", "/feeds/#{ feed.id }?_csrf=#{csrf_token}", "data-method": "delete", class: "btn btn-danger btn-sm")
          td
            span
              == feed.created_at
