class FormTemplatesController < ApplicationController
  before_filter :authenticate_user!
  include FormProcessing

  # GET /form_templates
  # GET /form_templates.json
  def index
    @form_templates = FormTemplate.where(:is_current => true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @form_templates }
    end
  end

  # GET /form_templates/1
  # GET /form_templates/1.json
  def show
    @form_template = FormTemplate.find(params[:id])

    # Preserve previous form templates' contents when they are edited
    # So that the previously filled forms relying on them will not be broken
    if !@form_template.ror_contents or
        @form_template.ror_contents != raw_form_to_ror_form(@form_template.contents)

      if not (@form_template.filled_forms.nil? or @form_template.filled_forms.empty?)
        @form_template.update_attributes(:is_current => false)
        @form_template = FormTemplate.new(@form_template.attributes)
        @form_template[:created_at] = nil
        @form_template[:updated_at] = nil
        @form_template[:is_current] = true
      end

      @form_template.ror_contents = raw_form_to_ror_form(@form_template.contents)
      @form_template.save
    end

    @filled_form = @form_template.filled_forms.build

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @form_template }
    end
  end

end
