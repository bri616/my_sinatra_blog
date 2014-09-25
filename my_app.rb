require 'sinatra'
require './lib/post'

class MyApp < Sinatra::Base

  before do
    # You can put assignmenets here to apply to all route handlers
  end

  get "/" do #defining a place to go - this would be the homepage
    @posts = Post.most_recent(5)
    erb :index
  end

  get "/about-me" do
    erb :about_me
  end

  get %r{/hello/([\w]+)} do |c|
    erb :hello, :locals => {:c => c}
  end

  get "/posts/:post_name" do
    erb "posts/#{params[:post_name]}".to_sym
  end

end
