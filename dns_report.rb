#!/usr/bin/ruby
=begin 
DNS LOOKKUP LIB:
em-resolv-replace
eventmachine
-------------------------->
Resolv::DNS.new
--------------------------->
dnsobject.each_resource(domain,) do |var|
	MX >> exchange
	MS >> name
	end
Resolv::DNS::Resource::IN::MX >> for mail server
Resolv::DNS::Resource::IN::A >> ip address
Resolv::DNS::Resource::IN::NS >> name server
------------------------------------------------------------------
Metasploit Rank >>>>>>
NormalRanking
GoodRanking
GreatRanking
EXcellentRanking
AverageRanking
LowRabking
ManualRanding
=end
require "msf/core"
require "em-resolv-replace"
class MetasploitModule < Msf::Auxiliary
	include Msf::Auxiliary::Report
	Rank = GreatRanking
	def initialize(info = {})
		super(update_info(info,

				'Name' => 'DNS LOOKUP COLECTER',
				'Description' => %q{
					DNS LOOKUP information gathering Auxiliary
				},
				'Author' => ['Abd El Rahman HSN <abdelrahmanhsn1@gmail.com>'],
				'License' => MSF_LICENSE,
				'Version' => '1.0'))
		register_options(
			[

				OptString.new('DOMAIN',[true,'target domain']),


			],self.class)
	end
	def run
		$domain = datastore['DOMAIN']
		$dns = Resolv::DNS.new
		print_status("starting gather dns information")
		print_good("IP address")
		$dns.each_address($domain) do |address|
			puts address
		end
		print_good("Mail Servers")
		$dns.each_resource($domain,Resolv::DNS::Resource::IN::MX) do |mail_servers|
			puts mail_servers.exchange
		end
		print_good("Name Servers")
		$dns.each_resource($domain,Resolv::DNS::Resource::IN::NS) do |name_servers|
			puts name_servers.name
		end
	end
end
