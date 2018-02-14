require 'csv'
class AlbumApp

	def call(env)

		req = Rack::Request.new(env)


		albums = CSV.read('top_100_albums.txt')
		list_size = albums.length

		response_body = "
		<h1>Top 100 Albums of All Time</h1>
		<div class=\"wrapper\" style=\"display:flex;\">
		<div class=\"name\"style=\" margin-left: 30px;\">
		<a href=\"name\">Sort By Name</a>
		</div>
		<div class=\"year\" style=\"margin-left: 30px;\">
		<a href=\"year\">Sort By Year</a>
		</div>
		<select>
		<option style=\"margin-left: 50px;\" value=\"0\">choose</option>"

		j = 1
		albums.each do |album|
			response_body << "<option value=\"#{j}\">#{j}</option>"
			j += 1
		end

		response_body << "</select></div><ol>"


    	# Read the data from the file.
    	# albums = ['fee', 'fi', 'fo', 'funk']

    	if req.path_info == "/name"
    		albums = albums.sort_by {|album| album[0]}
    	elsif req.path_info == "/year"
    		albums = albums.sort_by {|album| album[1]}
    	end

		# Append it to the response body.
		i = 1
		albums.each do |album|
			response_body << "
			<div class=\"#{i}\" style=\"margin: 5px 0;background-color: silver; display: inline-block; width:90%;\"><li> 
			#{album[0]}-----#{album[1]}</li>
			</div>"
			i += 1
		end

		response_body << "</ol>"


    # Send the response
    [200, {'Content-Type' => 'text/html'}, [response_body.to_s]]
end

end
