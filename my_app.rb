require 'sinatra'
require './lib/readposts'

class MyApp < Sinatra::Base
  get "/" do #defining a place to go - this would be the homepage
    myposts = ReadPosts.new("/posts")
    myposts.sort_by_time
    postnames = myposts.getfilenames
    erb :index, :locals => {:filenames => postnames}
  end

  get "/about-me" do
    erb :about_me
  end

  get %r{/hello/([\w]+)} do |c|
    erb :hello, :locals => {:c => c}
  end

  get "/posts/:post_name" do
    erb ("/posts/"+params[:post_name]).to_sym
  end

end
