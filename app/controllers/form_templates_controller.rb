class FormTemplatesController < ApplicationController
  # GET /form_templates
  # GET /form_templates.json
  def index
    @form_templates = FormTemplate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @form_templates }
    end
  end

  # GET /form_templates/1
  # GET /form_templates/1.json
  def show
    @form_template = FormTemplate.find(params[:id])
    @filled_form = FilledForm.new(:form_template=>@form_template)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @form_template }
    end
  end

end
