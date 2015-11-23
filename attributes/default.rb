#####
# HAPRoxy Server attributes
#####
default['haproxy_demo']['haproxy']['port'] = 80
default['haproxy_demo']['haproxy']['frontend'] = 'haproxy_demo'
default['haproxy_demo']['haproxy']['backend'] = 'demo_http'
default['haproxy_demo']['haproxy']['lb_mode'] = 'roundrobin'
default['haproxy_demo']['haproxy']['mode'] = 'http'
default['haproxy_demo']['haproxy']['webservers'] = {
                                                      webserver01: '192.168.1.3:80',
                                                      webserver02: '192.168.1.4:80',
                                                      webserver03: '192.168.1.5:80'
                                                    }

#####
# Webserver attributes
#####
default['haproxy_demo']['webserver']['root_dir'] = '/opt/www'
default['haproxy_demo']['webserver']['owner'] = 'www-data'
default['haproxy_demo']['webserver']['group'] = 'www-data'
default['haproxy_demo']['webserver']['mode'] = '0755'
default['haproxy_demo']['webserver']['nginx_root'] = '/etc/nginx'
default['haproxy_demo']['webserver']['port'] = '80'
