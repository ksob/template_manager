class FormTemplatesController < ApplicationController
  include FormProcessing

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

    if not @form_template.ror_contents
      @form_template.ror_contents = raw_form_to_ror_form(@form_template.contents)
      @form_template.save
      # TODO: refresh ror_contents when the contents changes meaning the form changed
      # TODO: but make sure to not discard old version when there are pending filled_forms for the old one
    end

    @filled_form = @form_template.filled_forms.build

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @form_template }
    end
  end

end
