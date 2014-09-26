require 'sinatra'
require './lib/post'

class MyApp < Sinatra::Base

  before do
    # You can put assignments here to apply to all route handlers
    @posts = Post.most_recent(5)
  end

  get "/" do #defining a place to go - this would be the homepage
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

  get "/posts/:post_date/:post_name" do
    erb "posts/#{params[:post_date]}/#{params[:post_name]}".to_sym
  end

end
