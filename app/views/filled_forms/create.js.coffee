$('#user_filled_forms').html("<%= escape_javascript(render :partial => 'shared/user_filled_forms') %>")
set_to_use_buttons '#user_filled_forms'