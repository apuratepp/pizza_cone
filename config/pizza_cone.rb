# use files from fixtures for tests
PizzaCone.configure do |config|
  config.define_instance_hostname_block do |instance|
    "#{instance.hostname} #{instance.stack_name}-#{instance.hostname}"
  end

  config.define_proxy_command_block do |instance|
    "ProxyCommand ssh -q #{instance.proxy_hostname} nc -q0 #{instance.private_ip} 22"
  end

  config.proxy_map = {
    /.*?-testing-123bc\z/ => "broker-testing",
    /.*?-production-345xf\z/ => "broker-production"
  }
end
