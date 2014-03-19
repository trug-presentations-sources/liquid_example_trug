class NewPostPathTag < Liquid::Tag
  def render(context)
  	Rails.application.routes.url_helpers.new_post_path
  end
end

Liquid::Template.register_tag('new_post_path', NewPostPathTag)
