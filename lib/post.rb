class Post
  # Access posts, which are files within views/posts
  # Attributes: title, url, filename, (content?)

  # Read my list of post files
  # Create an array of Post objects
  # with the attributes set
  # Post.all = [<post>, <post>, <post>]
  attr_accessor :title, :url, :mod_time, :post_date, :post_time, :content, :filepath
  def initialize(array, mtime)
    @filepath = array.join("/")
    @title = array[-1].split(".")[0]
    @post_date = array[-2]
    @url = "/posts/#{@post_date}/#{@title}"
    @mod_time = mtime
    @post_time = mtime.strftime "%Y-%m-%d %H:%M"
    @content = File.read(@filepath)
  end

  def self.all
    Dir.glob("views/posts/**/*.erb").collect do |filepath|
      a = filepath.split("/")
      mtime = File.mtime(filepath)
      new(a,mtime)
    end
  end

  def self.most_recent(n)
    all.sort_by(&:mod_time).last(n).reverse
  end

  def self.get_range(j,k)
    all.sort_by(&:mod_time).reverse[j..k]
  end
end
