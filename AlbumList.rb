class AlbumList
	
	@highlighted_rank = []

	def initialize(album_list)
		@album_list = album_list
	end
	
	def get_album_list
		return @album_list
	end

	def print_album_list(string, rank_to_highlight)
		@album_list.each do | album |
			album_rank = album.get_rank
			if album_rank == rank_to_highlight
				string += "<p style = \"background-color:yellow\">" + album.get_rank.to_s + " " + album.get_name + " " + album.get_year + "</p>"
			else
				string += "<p>" + album.get_rank.to_s + " " + album.get_name + " " + album.get_year + "</p>"
			end
		end
		return string
	end
	
	def get_highlighted_rank
		return @highlighted_rank
	end
	
	def sort_by_year
		@album_list.sort_by{ |album| album.get_year}
	end

	def sort_by_name
		@album_list.sort_by!{ |album| album.get_name}
	end
	
	def sort_by_rank
		@album_list.sort_by{ |album| album.get_rank}
	end
	
	def highlight_rank(rank_to_highlight)
		@highlighted_rank = rank_to_highlight
	end
	
end
