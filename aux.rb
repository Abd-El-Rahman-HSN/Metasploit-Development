require "msf/core"
class MetasploitModule < Msf::Auxiliary
	include Msf::Auxiliary::Report
	def initialize(info = {})
		super(update_info(info,
				'Name' => 'my frist aux',
				'Description' => %q{
					my frist auxiliary
				},
				'Author' => ['Abd El Rahman HSN <abdelrahmanhsn1@gmail.com>'],
				'License' => MSF_LICENSE,
				'Version' => '1.0'))
		register_options(
			[
				Optstring.new('NAME',[true,'your name']),
				Optstring.new('AGE',[true, 'your afe'])
			],self.class)
	end
	def run
		puts datastore['Name']
		puts datastore['Age']
	end

end
