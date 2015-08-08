get '/' do
  @posts = top_posts_and_links
  erb :index
end

def top_posts_and_links
  (Post.all + Link.all).sort { |a, b| b.score <=> a.score }
end
