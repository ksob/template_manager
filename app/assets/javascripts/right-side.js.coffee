@set_to_use_buttons = (container) -> $("input:submit, a, button", container).button()

$(document).ready ->
  set_to_use_buttons ''
