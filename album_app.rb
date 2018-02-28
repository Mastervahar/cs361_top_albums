require 'csv'
require 'sinatra'
require_relative 'AlbumList'
require_relative 'Album'

data = CSV.open("top_100_albums.txt")

albums = data.map.with_index { |row, i| Album.new(i + 1, row[0], row[1]) }
album_list_object = AlbumList.new(albums)

# NOTE: I could never figure out how to get this to work
# set :album_list_object, AlbumList.new(albums)
# settings.album_list_object.sort_by_year

string = ""

get '/' do
	
	@albums = albums
	@albums_sorted_by_rank = album_list_object.sort_by_rank
	@album_list_sorted_by_rank = AlbumList.new(@albums_sorted_by_rank)
	@string = @album_list_sorted_by_rank.print_album_list(string)
	
	erb :index
	
end

get '/year' do
	
	# settings.album_list_object.sort_by_year
	# @string = settings.album_list_object.print_album_list(string)
	
	@albums = albums
	@albums_sorted_by_year = album_list_object.sort_by_year
	@album_list_sorted_by_year = AlbumList.new(@albums_sorted_by_year)
	@string = @album_list_sorted_by_year.print_album_list(string)
	
	erb :index
	
end

get '/name' do
	
	@albums = albums
	@albums_sorted_by_name = album_list_object.sort_by_name
	@album_list_sorted_by_name = AlbumList.new(@albums_sorted_by_name)
	@string = @album_list_sorted_by_name.print_album_list(string)
	
	erb :index
	
end