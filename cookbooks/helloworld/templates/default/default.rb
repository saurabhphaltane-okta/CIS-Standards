# This file is managed by Chef
# Any changes made by hand will be overwritten
 
Hello <%= node['helloworld']['place'] %>!
 
This computer has <%= node['cpu']['total'] %> CPUs!
 
<% if node['helloworld']['encore'] == false -%>
There will be no encore
<% end -%>
