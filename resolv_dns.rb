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
require "em-resolv-replace"
$dns = Resolv::DNS.new
#$dns.each_address('yahoo.com'){|adress| puts adress}
$dns.each_resource("yahoo.com",Resolv::DNS::Resource::IN::MX) do |mail_servers|
	puts mail_servers.exchange
end
$dns.each_resource("yahoo.com",Resolv::DNS::Resource::IN::A) do |mail_servers|
	puts mail_servers
end
$dns.each_resource("yahoo.com",Resolv::DNS::Resource::IN::NS) do |mail_servers|
	puts mail_servers.name
end