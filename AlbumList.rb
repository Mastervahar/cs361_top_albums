class AlbumList

	def initialize(album_list)
		@album_list = album_list
	end

	# def sort_by_rank
		# @albums_list.sort_by! do |album|
			# album.get_rank
		# end
	# end
	def print_album_list(string)
		@album_list.each do | album |
			string += album.get_name + " " + album.get_year + "<br/>"
		end
		return string
	end
	
	def sort_by_year
		@albums_list.sort_by! do |album|
			album[:year]
		end
	end

end
