require 'pry'

class MP3Importer
  attr_reader :path, :files

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir["#{@path}/*.mp3"]
    @files.map do |file_name|
      File.basename(file_name)
    end
  end

  def import
    files.each do |file_name|
      Song.new_by_filename(file_name)
    end
  end
end
