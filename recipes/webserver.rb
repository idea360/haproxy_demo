#####
# Install nginx which will serve up our web content.
#####
package 'nginx' do
  action :install
end

#####
# Manage our nginx service
#####
service 'nginx' do
    supports :status => true, :restart => true, :reload => true
end

#####
# Remove our default website.
#####
file "#{node['haproxy_demo']['webserver']['nginx_root']}/sites-enabled/default" do
  action :delete
end

#####
# Create our new webserver site.
#####
template "#{node['haproxy_demo']['webserver']['nginx_root']}/sites-enabled/webserver" do
  source 'webserver.erb'
  variables({
    :port => node['haproxy_demo']['webserver']['port'],
    :root_dir => node['haproxy_demo']['webserver']['root_dir']
  })

  #On file created or changed then reload nginx.
  #Delayed reload after our Chef run finishes
  #to make sure all of files are in place.
  notifies :reload, 'service[nginx]', :delayed
end

#####
# Create a directory to store our web content in.
#####
directory node['haproxy_demo']['webserver']['root_dir'] do
  action :create
  owner node['haproxy_demo']['webserver']['owner']
  group node['haproxy_demo']['webserver']['group']
  mode  node['haproxy_demo']['webserver']['mode']
end

#####
# Create our web site (Content)
#####
template "#{node['haproxy_demo']['webserver']['root_dir']}/index.html" do
  source 'index.html.erb'
  owner node['haproxy_demo']['webserver']['owner']
  group node['haproxy_demo']['webserver']['group']
  mode  node['haproxy_demo']['webserver']['mode']
end
