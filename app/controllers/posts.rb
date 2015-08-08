get '/posts' do
  @posts = Post.all_by_score
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
