require 'mechanize'

class Vent_Status

	# Public Methods
	def self.players(hostname, port)
		agent = Mechanize.new

		url = "http://www.ventrilo.com/status.php?hostname=" + hostname + "&port=" + port + ""
		vent_page = agent.get(url)

		get_player_info(vent_page)
	end

	def self.server(hostname, port)
		agent = Mechanize.new

		url = "http://www.ventrilo.com/status.php?hostname=" + hostname + "&port=" + port + ""
		vent_page = agent.get(url)

		get_server_info(vent_page)
	end

	def self.full_status(hostname, port)

		agent = Mechanize.new

		url = "http://www.ventrilo.com/status.php?hostname=" + hostname + "&port=" + port + ""

		vent_page = agent.get(url)

		online_offline(vent_page)
		get_server_info(vent_page)
		get_player_info(vent_page)

	end

	#Private Methods
	# Creates an page array of all server information on the ventrilo server
	def self.get_server_info(page)

		server_rows = page.parser.xpath("//td[@class='contentmiddle']/table/tr/td/center[2]/table/tr")

		#puts server_rows.to_xml
		#puts server_rows.text

		temp_server_array = server_rows.xpath('td').map { |td| td.text }
		#pp temp_server_array
		server_array = temp_server_array.each_slice(2).to_a

		print "Server Info: \n"
		# Server Array is an array of arrays that holds the servewr information provided by ventrilo server status
		# 
		# Index 0: Label
		# Index 1: Info
		# 
		# Ex server_array[0][1] will get name of server
		# puts server_array[0][1] 
		pp server_array

	end

	# Creates an player array of all online players on the ventrilo server
	def self.get_player_info(page)
		
		# Get User Info rows
		player_rows =  page.parser.xpath("//td[@class='contentmiddle']/table/tr/td/center[3]/table/tr")
		player_headers = player_rows.shift
		#puts player_headers.text
		#puts player_rows.to_xml
		#puts player_rows.text

		temp_player_array = player_rows.xpath('td').map { |td| td.text }
		#pp temp_player_array
		player_array = temp_player_array.each_slice(7).to_a


		print "Players Online: \n"
		# Player Array is an array of arrays that holds list of players and other information provided by ventrilo server status
		# 
		# Index 0: Flags
		# Index 1: UID
		# Index 2: CID
		# Index 3: Sec
		# Index 4: Ping
		# Index 5: Name
		# Index 6: Comment
		# 
		# Ex player_array[0][5] Will get first players name in array
		# puts player_array[0][5]
		pp player_array

	end

	def self.online_offline(page)

		code = page.code.to_i

		# get status. Need to fix with better searching for the error text
		status = page.parser.css('strong').text

		if status.include?('PHP: Unable to resolve the target hostname') || status.include?('Invalid port.')
			print "Didn't Find Vent Server\n"
		else
			print "Found Vent Server\n"
		end


		print "Page URL: " + page.uri.to_s + "\n"
		print "Page Code: " + code.to_s + "\n"

	end

	private_class_method :online_offline, :get_player_info, :get_server_info

end

