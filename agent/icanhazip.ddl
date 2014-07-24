# vim:syntax=ruby:
metadata :name        => 'icanhazip',
         :description => 'IP address reporting agent for MCollective',
         :author      => 'Romain Tartière',
         :license     => 'MIT',
         :version     => '1.0',
         :url         => 'https://github.com/sante-link/mcollective-icanhazip',
         :timeout     => 10

action "ip", :description => 'Echos the IP address of the host' do
  display :always
  output :address,
         :description => 'The IP address of the host',
         :display_as  => 'IP address'
end

[ 'ipv4', 'ipv6' ].each do |version|
  action version, :description => "Echos the IP#{version[2..3]} address of the host" do
    display :always
    output :address,
           :description => "The IP#{version[2..3]} address of the host",
           :display_as  => "IP#{version[2..3]} address"
  end
end
