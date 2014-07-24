require 'net/http'

module MCollective
  module Agent
    class Icanhazip < RPC::Agent
      action 'ip' do
        reply[:address] = Net::HTTP.get(URI('http://icanhazip.com/')).chomp
      end
      [ 'ipv4', 'ipv6' ].each do |version|
        action version do
          reply[:address] = Net::HTTP.get(URI("http://#{version}.icanhazip.com/")).chomp
        end
      end
    end
  end
end
