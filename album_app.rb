require 'csv'
class AlbumApp

	def call(env)
		response_body = "<h1>Top 100 Albums of All Time</h1>"
    # Read the data from the file.
    # albums = ['fee', 'fi', 'fo', 'funk']


    albums = CSV.read('top_100_albums.csv')

    for album in albums
    	response_body << "
    	<div class=\"name\" style=\"background-color: silver; display: inline-block; width:90%;\">
    	"+album[0]+"</div>"
    	response_body << "
    	<div class=\"year\" style=\"background-color: silver; display: inline-block; width:90%;\">
    	"+album[1]+"</div>"
    end
    # Append it to the response body.
    response_body << albums.to_s
    # Send the response
    [200, {'Content-Type' => 'text/html'}, [response_body.to_s]]
end

end