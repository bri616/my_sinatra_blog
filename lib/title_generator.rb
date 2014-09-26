class TitleGenerator
  attr_accessor :words, :title
  def initialize(n=2, filepath="public/beer.txt")
    @words = File.read(filepath).split.collect {|a| a[/\w+/]}
    @title = words.sample(n).collect(&:capitalize).join(" ")
  end
  # want to read some beer-related website and return two words
  # read from a file of beer ipsum for now, public/beer.txt
  # read file as string, make array of words, randomly sample two words in a row

end
