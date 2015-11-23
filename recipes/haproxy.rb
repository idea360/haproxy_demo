#####
# Installs our HAProxy server from an apt package and all dependencies
#####
package 'haproxy' do
  action :install
end

#####
# configure /etc/default/haproxy so we can manage haproxy with init script.
#####
cookbook_file '/etc/default/haproxy' do
  source 'haproxy'
end

#####
# Manage our haproxy service
#####
service 'haproxy' do
  supports :status => true, :restart => true, :reload => true
end

#####
# Setup our HAProxy configuration
####
template '/etc/haproxy/haproxy.cfg' do
  source 'haproxy.cfg.erb'
  variables({
    :port     => node['haproxy_demo']['haproxy']['port'],
    :frontend => node['haproxy_demo']['haproxy']['frontend'],
    :backend  => node['haproxy_demo']['haproxy']['backend'],
    :lb_mode  => node['haproxy_demo']['haproxy']['lb_mode'],
    :mode     => node['haproxy_demo']['haproxy']['mode'],
    :websrvs  => node['haproxy_demo']['haproxy']['webservers']
  })

  # Reload our HAProxy after changes to the config.
  notifies :restart, 'service[haproxy]', :delayed
end
