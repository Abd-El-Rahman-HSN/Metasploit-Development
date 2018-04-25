=begin 
--------------------
tty-progressbar
-----------------------------
object = TTY::ProgressBar.new("process_name[:bar] :byte_rate/s")
total
width
complete
object.advance(number)
object.finish
------------------------------------
open-uri


require "tty-progressbar"
$par = TTY::ProgressBar.new("Downloding [:bar] :byte_rate/s", :total => 100 , :width => 100)
100.times do 
	sleep(0.1)
	$par.advance(1)
end
#http://cs.uccs.edu/~cs591/metasploit/users_guide3_1.pdf
$url = "http://cs.uccs.edu/~cs591/metasploit/users_guide3_1.pdf"
$url_site = $url.split("/")[0]+"//"+$url.split("/")[2]+"/"
$file_path = "/"+$url.split("/")[3..-1].join("/")
$file_name = $url.split("/")[-1]
=end
require "net/http"
require "net/https"
require "tty-progressbar"
$url = ARGV[0]
$url_site = $url.split("/")[0]+"//"+$url.split("/")[2]+"/"
$file_path = "/"+$url.split("/")[3..-1].join("/")
$file_name = $url.split("/")[-1]
$url_info = URI.parse($url_site)
$op_site = Net::HTTP.new($url_info.host,$url_info.port)
if $url_info.port == 443 then
	$op_site.use_ssl = true
	$op_site.verify_mode = OpenSSL::SSL::VERIFY_NONE
end
$op_site.start do |http|
	$res = http.request_head($file_path)
	$file_size = $res.header["Content-Lenght"]
	$par = TTY::ProgressBar.new("#{$file_name} [:bar] :byte_rate/s", :total => $file_size.to_i , :width => 100)
	File.open($file_name,'w') do |f|
		http.get($file_path) do |str|
			f.write(str)
			$par.advance(str.length)
		end
	end
end