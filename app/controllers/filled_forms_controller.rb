class FilledFormsController < ApplicationController
  # GET /filled_forms
  # GET /filled_forms.json
  def index
    @filled_forms = FilledForm.all

    @user_filled_forms = FormTemplate.get_user_filled_forms

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @filled_forms }
    end
  end

  # GET /filled_forms/1
  # GET /filled_forms/1.json
  def show
    @filled_form = FilledForm.find(params[:id])

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
  end

  # POST /filled_forms
  # POST /filled_forms.json
  def create
    @form_template = FormTemplate.find(params[:form_template_id])
    @filled_form = @form_template.filled_forms.create(params[:filled_form])

    @user_filled_forms = FormTemplate.get_user_filled_forms

    respond_to do |format|
      if @filled_form.save
        format.html { redirect_to :back, notice: 'Filled form was successfully created.' }
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

    respond_to do |format|
      if @filled_form.update_attributes(params[:filled_form])
        format.html { redirect_to @filled_form, notice: 'Filled form was successfully updated.' }
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
      format.html { redirect_to filled_forms_url }
      format.json { head :ok }
    end
  end
end
