require 'nokogiri'
require 'net/http'
require 'net/https'
$site = ARGV[0]
$site_info = URI.parse($site)
$parse = Net::HTTP.new($site_info.host,$site_info.port)
$parse.use_ssl = true
$parse.verify_mode = OpenSSl::SSL::VERIFY_NONE
$data = $parse.get(ARGV[1])
$html = $data.body
$parser = Nokogiri::HTML($html)
$file = ARGV[4]
if $file != nil then
	$mkfile = File.new(ARGV[4],'w')
end
$parser.xpath(ARGV[2]).each do |d|
	$option = ARGV[3]
	if $option == nil then
		puts d
		if $file != nil then
			$mkfile.write(d)
		end
	end
	else
		puts d[$option]
		if $file != nil then
			$mkfile.write(d[$option])
		end
	end
end
if $file != nil then
	puts "the file is saved as #{$file}"
end