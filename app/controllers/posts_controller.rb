class PostsController < ApplicationController
  def index
    @attributes = {
      'posts' => Post.all.map{ |post| PostDrop.new(post) }
    }
  end

  def show
    @attributes = {
      'post' => PostDrop.new(load_post)
    }
  end

  def new
    @post = Post.new
  end

  def edit
    @post = load_post
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @post = load_post
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @post = load_post
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  def load_post
    Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
