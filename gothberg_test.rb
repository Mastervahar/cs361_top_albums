require 'csv'
require 'sinatra'
require_relative 'AlbumList'
require_relative 'Album'

data = CSV.open("top_100_albums.txt")

top_100 = data.map.with_index(1) { |row, i| Album.new(i, row[0], row[1]) }

top_100.sort_by! do |row|
  row.get_name
end

top_100.each.with_index(1) do |row, i|
  print "#{i} = #{row.get_name}, #{row.get_year}, #{row.get_rank} / 100\n"
end
