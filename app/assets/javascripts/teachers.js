$(function() {
    $('.multiselect').multiselect();

    $('form.teacher').validate({
        debug: true,
        // Specify validation rules
        rules: {
            // The key name on the left side is the name attribute
            // of an input field. Validation rules are defined
            // on the right side
            "teacher[first_name]": {
                required: true,
                pattern: /^[A-Z][a-zA-Z]*$/
            },
            "teacher[middle_name]": {
                pattern: /^[A-Z][a-zA-Z]*$/
            },
            "teacher[last_name]": {
                required: true,
                pattern: /^[A-Z][a-zA-Z]*$/
            },
            "teacher[contact]": {
                required: true,
                pattern: /^[7-9][0-9]{9}$/
            },
            "teacher[email]": {
                required: true,
                pattern: /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
            }
        },
        // Specify validation error messages
        messages: {
            "teacher[contact]":{
                pattern: "It seems invalid mobile number, number should not contain +91 or 0 at start"
            },
            "teacher[email]": {
                pattern: "It seems invalid Email"
            },
            "teacher[first_name]":{
                pattern: 'Name should be start with Capital letter and can only contains letters'
            },
            "teacher[middle_name]": {
                pattern: 'Name should be start with Capital letter and can only contains letters'
            },
            "teacher[last_name]":{
                pattern: 'Name should be start with Capital letter and can only contains letters'
            }
        },
        // Make sure the form is submitted to the destination defined
        // in the "action" attribute of the form when valid
        submitHandler: function(form) {
            form.submit();
        }
    });
});