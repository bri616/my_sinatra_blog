require 'sinatra'
require './lib/post'
require './lib/title_generator'

class MyApp < Sinatra::Base

  before do
    # You can put assignments here to apply to all route handlers
    @N = 5
    @recent_posts = Post.most_recent(@N)
    @posts = Post.most_recent(@N)
    @total_posts = Post.all.length
    @number_of_pages = @total_posts % @N == 0 ? (@total_posts/@N).to_i : (@total_posts/@N).to_i + 1
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
    erb :one_post
  end

  get "/page/:number" do
    # call the function that returns the right blog posts for the page
    # also, new number = number+1 (instead of 2)
    number = params[:number].to_i
    @posts = Post.get_range((number-1)*@N,number*@N-1)
    @number = number+1
    erb :index
  end

end
