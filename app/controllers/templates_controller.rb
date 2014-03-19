class TemplatesController < ApplicationController
  def index
    @templates = Template.all
  end

  def show
    @template = load_template
  end

  def new
    @template = Template.new
  end

  def edit
    @template = load_template
  end

  def create
    @template = Template.new(template_params)
    if @template.save
      redirect_to @template, notice: 'Template was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @template = load_template
    if @template.update(template_params)
      redirect_to @template, notice: 'Template was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @template.destroy
    redirect_to templates_url, notice: 'Template was successfully destroyed.'
  end

  private

  def load_template
    @template = Template.find(params[:id])
  end

  def template_params
    params.require(:template).permit(:layout, :partial, :name, :content)
  end
end
