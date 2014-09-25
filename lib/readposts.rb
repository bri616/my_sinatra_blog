class ReadPosts
  attr_reader :longfilenames, :thefiles, :path
  def initialize(path)
    @path = "views"+path
    # @dirsinpath = Dir[@path+"/*"]
    @longfilenames = Dir[@path+"/*"]
  end

  def most_recent_files(num)
    num_most_rec = Dir[@path+"/*/*"].sort_by {|d| File.mtime(d)}[0..num]
    thehash = {}
    num_most_rec.each do |filename|
      date = filename.split("/")[-2]
      thename = filename,split("/")[-1].split(".")[0]
      if thehash.keys.include? date
        thehash[date] << thename
      else
        thehash[date] = [thename]
      end
      thehash
    end
  end

  def getfilenames
    @longfilenames.collect { |filename| filename.split("/")[-1].split(".")[0]}
  end

  def sort_by_time
    @longfilenames = Dir[@path+"/*"].sort_by{ |f| File.mtime(f) }
  end

end
