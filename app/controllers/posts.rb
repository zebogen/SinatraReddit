get '/posts' do
  @posts = top_posts_and_links
  erb :"posts/index"
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :"posts/show"
end

get '/posts/new' do
  @post = Post.new
  erb :"posts/new"
end

post '/posts' do
  @post = Post.new(params[:post])
  if @post.save
    redirect "/posts/#{@post.id}"
  else
    erb :"posts/new"
  end
end

def top_posts_and_links
  (Post.all + Link.all).sort { |a, b| b.score <=> a.score }
end
