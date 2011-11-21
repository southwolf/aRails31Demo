jQuery ->
  $(".section:last").after "<a href=\"#\">Add another section<a/><br/>"
  $("a[href=#]").click ->
    $(this).before $(".section:last").clone()
    $(".section:last label").each ->
      labelFor = $(this).attr("for")
      $(this).attr "for", labelFor + "1"

    $(".section:last input, .section:last textarea, .section:last select").each ->
      inputID = $(this).attr("id")
      inputName = $(this).attr("name")
      splitName = inputName.split(/\]\[/)
      splitName[1] = parseInt(splitName[1], 10) + 1
      $(this).attr "name", splitName.join("][")
      $(this).attr "id", inputID + "1"
      if $(this).is("input")
        $(this).removeAttr "value"
      else $(this).html ""  if $(this).is("textarea")

    $(".section:last input[type=hidden]").remove()
    false