class Post
  # Access posts, which are files within views/posts
  # Attributes: title, url, filename, (content?)

  # Read my list of post files
  # Create an array of Post objects
  # with the attributes set
  # Post.all = [<post>, <post>, <post>]
  attr_accessor :title, :url, :creation_time, :post_date
  def initialize(array, ctime)
    @title = array[-1].split(".")[0]
    @url = "/posts/#{@title}"
    @creation_time = ctime
    @post_date = ctime.strftime "%Y-%m-%d %H:%M"
  end

  def self.all
    Dir.glob("views/posts/*.erb").collect do |filepath|
      a = filepath.split("/")
      ctime = File.ctime(filepath)
      new(a,ctime)
    end
  end

  def self.most_recent(n)
    all.sort_by(&:creation_time).last(n).reverse
  end
end
