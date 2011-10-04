class FilledForm
  include Mongoid::Document
  include Mongoid::Timestamps

  field :form_template_id, type: Integer
  field :user_id, type: Integer

  def form_template
    FormTemplate.find_by_id(self.form_template_id)
  end

  def form_template=(ft)
    self.form_template_id = ft.id
  end

  def user
    User.find_by_id(self.user_id)
  end

  def user=(user)
    self.user_id = user.id
  end

end
