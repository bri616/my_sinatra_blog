require 'sinatra'
require './lib/post'
require './lib/title_generator'

class MyApp < Sinatra::Base

  before do
    # You can put assignments here to apply to all route handlers
    @recent_posts = Post.most_recent(5)
    @posts = Post.most_recent(5)
    # @title = TitleGenerator.new.title
  end

  get "/" do #defining a place to go - this would be the homepage
    @number = 2
    erb :index
  end

  post "/" do
    # do stuff here to add something to a database
    puts params.inspect
    # add input to database
    redirect to("/")
  end

  get "/about-me" do
    erb :about_me
  end

  get %r{/hello/([\w]+)} do |c|
    erb :hello, :locals => {:c => c}
  end

  get "/posts/:post_date/:file_name" do
    @posts = Post.by_url("/posts/#{params[:post_date]}/#{params[:file_name]}")
    erb :index
  end

  get "/page/:number" do
    # call the function that returns the right blog posts for the page
    # also, new number = number+1 (instead of 2)
    number = params[:number].to_i
    @posts = Post.get_range((number-1)*5+1,number*5)
    @number = number+1
    erb :index
  end

end
