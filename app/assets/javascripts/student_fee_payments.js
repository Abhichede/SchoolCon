$("form").ready(function () {
    $("form.student_fee_payment").validate({
        debug: true,
        // Specify validation rules
        rules: {
            // The key name on the left side is the name attribute
            // of an input field. Validation rules are defined
            // on the right side
            "student_fee_payment[amount]": {
                required: true,
                pattern: /^[1-9]\d*(\.\d+)?$/
            }
        },
        // Specify validation error messages
        messages: {
            "student_fee_payment[amount]": {
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