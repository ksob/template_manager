class FilledForm
  include Mongoid::Document
  include Mongoid::Timestamps

  def form_template
    FormTemplate.find_by_id(self.form_template_id)
  end

  def form_template=(ft)
    self.form_template_id = ft.id
  end
end
