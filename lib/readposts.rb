class ReadPosts
  attr_reader :longfilenames, :thefiles, :path
  def initialize(path)
    @path = "./views"+path
    @longfilenames = Dir[@path+"/*"]
  end

  def getfilenames
    @longfilenames.collect { |filename| filename.split("/")[-1].split(".")[0]}
  end

  def sort_by_time
    @longfilenames = Dir[@path+"/*"].sort_by{ |f| File.mtime(f) }
  end

end
