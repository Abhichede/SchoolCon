$("form").ready(function () {
    $("form.question").validate({
        debug: true,
        // Specify validation rules
        rules: {
            // The key name on the left side is the name attribute
            // of an input field. Validation rules are defined
            // on the right side
            "question[standard_id]": {required: true},
            "question[division_id]": {required: true},
            "question[subject_id]": {required: true},
            "question[teacher_id]": {required: true},
            "question[question]": {required: true},
            "question[answer]": {required: true},
            "question[marks]": {
                required: true,
                pattern: /^[1-9]\d*(\.\d+)?$/
            }
        },
        // Specify validation error messages
        messages: {
            "question[marks]": {
                pattern: 'only number starting with 1-9 allowed with an optional decimal point.'
            }
        },
        // Make sure the form is submitted to the destination defined
        // in the "action" attribute of the form when valid
        submitHandler: function(form) {
            form.submit();
        }
    });
});