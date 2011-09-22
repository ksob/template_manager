module ApplicationHelper
  def menu
    user_filled_forms.inject([]) do |primary_res, filled_form_grp|
      primary = {}

      primary[:key] = :primary1
      primary[:name] = filled_form_grp[:form_template][:name]
      primary[:url] = root_path

      primary[:items] = filled_form_grp[:filled_forms].inject([]) do |items, filled_form|
        item = {}
        item[:key] = :sub1
        item[:name] = filled_form['updated_at']
        item[:url] = form_template_filled_form_path(filled_form_grp[:form_template][:id], filled_form['id'].to_s)
        items << item
      end

      if @current_form_template and @current_form_template.id == filled_form_grp[:form_template][:id]
        primary[:options] = {:expand => true}
      end

      primary_res << primary
    end
  end

  # Return the user_filled_forms on a per-user basis.
  # TODO: add memoization of this method because it is being called twice in the view
  def user_filled_forms
    FormTemplate.get_user_filled_forms
  end

end
