# haproxy_demo-cookbook
Tools: Chef, Vagrant, and Berkshelf.

Cookbook to test and play with HAProxy.

Prerequisites:
  1) Install Vagrant
  2) Install Chef Development Kit
  3) Vagrant plugin for Berkshelf: ‘vagrant plugin install vagrant-berkshelf’
  4) Virtual Box
  5) 'cd' to the git directory and run 'vagrant up'

This will converge 3 nodes:
    1) Main HAProxy instance.
    2) First web server.
    3) Second web server.

    To test functionality, use curl:
    ~/git/haproxy_demo: curl 192.168.1.2
    <h1>webserver01</h1>
    ~/git/haproxy_demo: curl 192.168.1.2
    <h1>webserver02</h1>

## Supported Platforms

* Ubuntu 14.04.3 LTS

## Attributes
* node['haproxy_demo']['haproxy']['port'] - default port HAProxy listens on.

* node['haproxy_demo']['haproxy']['frontend'] - name of frontend.

* node['haproxy_demo']['haproxy']['backend'] - name of backend.

* node['haproxy_demo']['haproxy']['lb_mode'] - Balance Mode. roundrobin, static-rr, leastconn, first, etc...

* node['haproxy_demo']['haproxy']['mode'] - http, tcp, etc...

* node['haproxy_demo']['haproxy']['webservers'] - list of your backend servers in ruby has format.

* node['haproxy_demo']['webserver']['root_dir'] - root of your webserver.

* node['haproxy_demo']['webserver']['owner'] - user that your webserver is running as.

* node['haproxy_demo']['webserver']['group'] - group that your webserver is runnin as.

* node['haproxy_demo']['webserver']['mode'] - file mode.

* node['haproxy_demo']['webserver']['nginx_root'] - webserver's config root.

* node['haproxy_demo']['webserver']['port'] - port your webserver is running on.

## Usage

`cd` to the cloned repository and run `vagrant up`

### haproxy_demo::default

Include `haproxy_demo::haproxy` in your HAProxy's `run_list`
Include `haproxy_demo::webserver` in all your webserver's `run_list`

## License and Authors

Author:: chris
