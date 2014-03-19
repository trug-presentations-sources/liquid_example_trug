module TemplatesHelper
  def render_template(name)
    Liquid::Template.
      parse(current_template(name).content).
      render(template_attributes).html_safe
  end

  def current_template(name)
  	@current_template ||= ::Template.where(name: name).first_or_initialize
  end

  def template_attributes
  	template_attributes = {
  	  'title' => 'LiquidExample Title',
      'flash' => {
        'notice' => flash[:notice],
        'alert' => flash[:alert]
      }
  	}

    if @attributes && @attributes.is_a?(Hash)
      template_attributes.merge!(@attributes)
    end

    template_attributes
  end
end
