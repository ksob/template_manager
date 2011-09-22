class FilledFormsController < ApplicationController
  include FormProcessing

  # GET /filled_forms
  # GET /filled_forms.json
  def index
    @filled_forms = FilledForm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @filled_forms }
    end
  end

  # GET /filled_forms/1
  # GET /filled_forms/1.json
  def show
    @filled_form = FilledForm.find(params[:id])
    @form_template = FormTemplate.find(@filled_form.form_template_id)

    @prefilled_ror_contents = prefill_ror_form @form_template.ror_contents, @filled_form.attributes

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @filled_form }
    end
  end

  # GET /filled_forms/new
  # GET /filled_forms/new.json
  def new
    @filled_form = FilledForm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @filled_form }
    end
  end

  # GET /filled_forms/1/edit
  def edit
    @filled_form = FilledForm.find(params[:id])
    @form_template = FormTemplate.find(@filled_form.form_template_id)

    @prefilled_ror_contents = prefill_ror_form @form_template.ror_contents, @filled_form.attributes
  end

  # POST /filled_forms
  # POST /filled_forms.json
  def create
    @form_template = FormTemplate.find(params[:form_template_id])
    @filled_form = @form_template.filled_forms.create(params[:filled_form])

    respond_to do |format|
      if @filled_form.save
        format.html { redirect_to :back, notice: 'Filled form was successfully created.' }
        format.js { @current_form_template = @form_template; @current_filled_form = @filled_form }
        format.json { render json: @filled_form, status: :created, location: @filled_form }
      else
        format.html { render action: "new" }
        format.json { render json: @filled_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /filled_forms/1
  # PUT /filled_forms/1.json
  def update
    @filled_form = FilledForm.find(params[:id])
    @form_template = FormTemplate.find(@filled_form.form_template_id)

    respond_to do |format|
      if @filled_form.update_attributes(params[:filled_form])
        format.html { redirect_to form_template_filled_form_path(@filled_form.form_template_id, params[:id]), notice: 'Filled form was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @filled_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /filled_forms/1
  # DELETE /filled_forms/1.json
  def destroy
    @filled_form = FilledForm.find(params[:id])
    @filled_form.destroy

    respond_to do |format|
      format.html { redirect_to form_templates_path }
      format.json { head :ok }
    end
  end
end
