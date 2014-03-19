class PostsTag < Liquid::Tag
  def render(context)
    Liquid::Template.parse('').render(attributes).html_safe
  end

  def attributes
    Post.all.map{ |post| Ppost::Drop.new(post) }
  end
end

Liquid::Template.register_tag('posts', PostsTag)
