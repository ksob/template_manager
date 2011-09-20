module ApplicationHelper
  # Return the user_filled_forms on a per-user basis.
  # TODO: add memoization of this method because it is being called twice in the view
  def user_filled_forms
    FormTemplate.get_user_filled_forms
  end
end
