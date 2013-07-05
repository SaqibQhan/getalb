$ ->
  $(document).ready ->
    $("#ga-create-album").validate
      rules:
        "album[title]":
          minlength: 3
          required: true
      errorClass: "error"
      validClass: "success"
      errorElement: "span"
      highlight: (element, errorClass, validClass) ->
        $(element).parents("div[class='clearfix']").addClass(errorClass).removeClass validClass

      unhighlight: (element, errorClass, validClass) ->
        $(element).parents(".error").removeClass(errorClass).addClass validClass


