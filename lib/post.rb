class Post
  # Access posts, which are files within views/posts
  # Attributes: title, url, filename, (content?)

  # Read my list of post files
  # Create an array of Post objects
  # with the attributes set
  # Post.all = [<post>, <post>, <post>]
  attr_accessor :title, :url, :mod_time, :post_date, :post_time, :content, :filepath
  def initialize(array)
    @filepath = array.join("/")
    @title = array[-1].split(".")[0]
    @post_date = array[-2]
    @url = "/posts/#{@post_date}/#{@title}"
    # @mod_time = mtime
    @content = File.read(@filepath)
    @mod_time = get_mod_time
    @post_time = @mod_time.strftime "%Y-%m-%d %H:%M"
  end

  def self.all
    Dir.glob("views/posts/**/*.erb").collect do |filepath|
      a = filepath.split("/")
      new(a)
    end
  end

  def self.by_url(url)
    all.select { |post| post.url == url }
  end

  def self.most_recent(n)
    all.sort_by(&:mod_time).last(n).reverse
  end

  def self.get_range(j,k)
    all.sort_by(&:mod_time).reverse[j..k]
  end

  def get_mod_time
    # http://rubular.com/r/TwmTVvsga4
    startmatch = (/datetime=/ =~ @content)
    Time.parse(@content[startmatch..-1].match(/\d{4}-\d{2}-\d{2} \d{2}:\d{2}/).to_s)
  end
end
