require 'sinatra'
require './lib/readposts'

class MyApp < Sinatra::Base
  get "/" do #defining a place to go - this would be the homepage
    myposts = ReadPosts.new("/posts")
    # find the most recent folder
    postnames = myposts.most_recent_files(5)
    erb :index, :locals => {:filenames => postnames}
  end

  get "/about-me" do
    erb :about_me
  end

  get %r{/hello/([\w]+)} do |c|
    erb :hello, :locals => {:c => c}
  end

  get "/posts/:date/:post_name" do
    erb ("/posts/"+params[:date]+"/"+params[:post_name]).to_sym
  end

end
