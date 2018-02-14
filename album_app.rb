require 'csv'
class AlbumApp

	def call(env)

		req = Rack::Request.new(env)


		response_body = "
		<h1>Top 100 Albums of All Time</h1>
		<div class=\"wrapper\" style=\"display:flex;\">
		<div class=\"name\">
		<a href=\"#\">Sort By Name</a>
		</div>
		<div class=\"year\">
		<a href=\"#\">Sort By Year</a>
		</div>
		</div>
		"


    	# Read the data from the file.
    	# albums = ['fee', 'fi', 'fo', 'funk']
    	albums = CSV.read('top_100_albums.txt')

    	# if req.path_info == "/name"
    	albums = albums.sort_by {|album| album[0]}
    	# elsif req.path_info == "/year"
			# albums = albums.sort_by {|album| album[1]}
		# else
			# do something else
		# end

		# Append it to the response body.
		for album in albums
			response_body << "
			<div class=\"name\" style=\"background-color: silver; display: inline-block; width:90%;\">
			"+album[0]+"-----"+album[1]+"
			</div>"
		end

    # Send the response
    [200, {'Content-Type' => 'text/html'}, [response_body.to_s]]
end

end
