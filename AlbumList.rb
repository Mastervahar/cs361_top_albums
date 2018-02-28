class AlbumList

	def initialize(album_list)
		@album_list = album_list
	end

	def get_album_list
		return @album_list
	end

	def print_album_list(string)
		@album_list.each do | album |
			string += album.get_rank.to_s + " " + album.get_name + " " + album.get_year + "<br/>"
		end
		return string
	end

	def sort_by_year
		album_list = self.get_album_list
		sorted_album_list = album_list.sort_by{ |album| album.get_year}
		return sorted_album_list
	end

	def sort_by_name
		album_list = self.get_album_list
		sorted_album_list = album_list.sort_by{ |album| album.get_name}
		return sorted_album_list
	end

	def sort_by_rank
		album_list = self.get_album_list
		sorted_album_list = album_list.sort_by{ |album| album.get_rank}
		return sorted_album_list
	end

end
