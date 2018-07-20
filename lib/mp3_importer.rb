require 'pry'

class MP3Importer
  attr_accessor :path, :list_of_files

  def initialize(path)
    @path = path
    @list_of_files = []
  end

  def files
    list_of_filenames = Dir["#{@path}/*.mp3"]
    list_of_filenames.each do |filename|
      filename_arr = filename.split("").reverse
      last_slash_index = filename_arr.index{|x|x=="/"}
      last_slash = filename_arr.length - last_slash_index
      @list_of_files << filename.slice(last_slash, filename.length)
    end
    return @list_of_files
  end

  def import
    self.files.map {|file| Song.new_by_filename(file) }
    end


end
