<% if @group.errors.any? %>
  errs = "Errors: "
  <% @group.errors.full_messages.each do |msg| %>
  errs += '<%= msg %>'
  <% end %>
  alert errs
<% else %>
  alert 'Succesfully added group: ' + '<%= @group.name %>'
<% end %>
