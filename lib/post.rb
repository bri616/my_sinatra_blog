class Post
  # Access posts, which are files within views/posts
  # Attributes: title, url, filename, (content?)

  # Read my list of post files
  # Create an array of Post objects
  # with the attributes set
  # Post.all = [<post>, <post>, <post>]

  def initialize(array)
    @filename = array[-1].split(".")[0]
    @url = array[1]+"/"+@filename
  end

  def self.all
    Dir.glob("views/posts/*.erb").collect do |filepath|
      a = filepath.split("/")
      new(a)
    end
  end
end
