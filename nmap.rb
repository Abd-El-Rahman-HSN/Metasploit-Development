#!/usr/bin/ruby
=begin
ruby-nmap
-------------------
require 'nmap/program'
Nmap::Program.scan do |var|
	syn_scan = true or false
	service_scan = true or false
	os_fingerprint = true or false
	xml = 'file.xml'
	verbose = true or false
	ports = []
	targets = ""
	end
=end
require 'nmap/program'
Nmap::Program.scan do |nmap|
	nmap.syn_scan = true
	nmap.service_scan = true
	nmap.os_fingerprint = true
	nmap.xml = 'scan.xml'
	nmap.ports = [21,25]
	nmap.targets = '192.168.1.*'
end