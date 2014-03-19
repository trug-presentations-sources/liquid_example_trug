class MenuTag < Liquid::Tag
  def render(context)
    Liquid::Template.parse(template.content).render(attributes).html_safe
  end

  def attributes
  	{
  	  'home_path' => url.root_path,
  	  'templates_path' => url.templates_path,
  	  'posts_path' => url.posts_path
  	}
  end

  def template
  	@template ||= ::Template.where(name: '_menu').first_or_initialize
  end

  def url
    Rails.application.routes.url_helpers
  end
end

Liquid::Template.register_tag('menu', MenuTag)
