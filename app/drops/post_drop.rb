class PostDrop < Liquid::Drop
  def initialize(post)
    @post = post
  end

  def id
    @post.id
  end

  def title
    @post.title
  end

  def content
    @post.content
 end

  def edit_path
  	url.edit_post_path(@post)
  end

  def path
  	url.post_path(@post)
  end

  def index_path
    url.posts_path
  end

  private

  def url
  	Rails.application.routes.url_helpers
  end
end