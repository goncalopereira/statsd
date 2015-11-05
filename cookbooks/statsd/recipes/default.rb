#### official statsd package

execute 'wget -qO - https://deb.packager.io/key | sudo apt-key add -'
execute 'echo "deb https://deb.packager.io/gh/pkgr/statsd trusty pkgr" | sudo tee /etc/apt/sources.list.d/statsd.list'
execute 'sudo apt-get update'
package 'statsd'

template '/etc/statsd/config.js' do
	source 'config.js.erb'
	notifies :restart, 'service[statsd]', :delayed
end

service 'statsd' do
	action [:enable, :start]
end

package 'python-pip'
execute 'pip install whisper'
execute 'pip install build-essential'
execute 'pip install twisted'
execute 'pip install carbon'
execute 'pip install graphite-web'