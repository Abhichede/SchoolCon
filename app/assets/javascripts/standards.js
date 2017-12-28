$("form").ready(function () {
    $("form.standard").validate({
        debug: true,
        // Specify validation rules
        rules: {
            // The key name on the left side is the name attribute
            // of an input field. Validation rules are defined
            // on the right side
            "standard[name]": {required: true},
            "standard[no_of_divisions]": {
                required: true,
                pattern: /^[1-9][0-9]*$/
            }
        },
        // Specify validation error messages
        messages: {
            "standard[name]": "Please enter standard Name",
            "standard[no_of_divisions]": "Please enter valid number for division"
        },
        // Make sure the form is submitted to the destination defined
        // in the "action" attribute of the form when valid
        submitHandler: function(form) {
            form.submit();
        }
    });
});