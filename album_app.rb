require 'csv'
class AlbumApp

	def call(env)

		req = Rack::Request.new(env)


		response_body = "
		<h1>Top 100 Albums of All Time</h1>
		<div class=\"wrapper\" style=\"display:flex;\">
		<div class=\"name\"style=\" margin-left: 30px;\">
		<a href=\"name\">Sort By Name</a>
		</div>
		<div class=\"year\" style=\"margin-left: 30px;\">
		<a href=\"year\">Sort By Year</a>
		</div>
		</div>
		"


    	# Read the data from the file.
    	# albums = ['fee', 'fi', 'fo', 'funk']
    	albums = CSV.read('top_100_albums.txt')

    	if req.path_info == "/name"
    		albums = albums.sort_by {|album| album[0]}
    	elsif req.path_info == "/year"
    		albums = albums.sort_by {|album| album[1]}
    	else
			# do something else
		end

		# Append it to the response body.
		i = 1
		albums.each do |album|
			response_body << "
			<div class=\"#{i}\" style=\"background-color: silver; display: inline-block; width:90%;\">#{i}: 
			#{album[0]}-----#{album[1]}
			</div>"
			i += 1
		end


    # Send the response
    [200, {'Content-Type' => 'text/html'}, [response_body.to_s]]
end

end
