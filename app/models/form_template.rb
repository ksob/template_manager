class FormTemplate < ActiveRecord::Base

  def filled_forms(options={})
    FilledForm.all({:conditions => {:form_template_id => self.id}}.merge(options))
  end



end
