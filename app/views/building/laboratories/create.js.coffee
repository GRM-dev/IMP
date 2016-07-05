<% if  @lab.errors.any? %>
  errs = "Errors: "
  <% @lab.errors.full_messages.each do |msg| %>
  errs += '<%= msg %>'
  <% end %>
  alert errs
<% else %>
  alert 'Succesfully added lab: ' + '<%= @lab.name %>'
<% end %>
