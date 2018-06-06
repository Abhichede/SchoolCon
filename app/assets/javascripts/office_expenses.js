$("form").ready(function () {
    $("form.office_expense").validate({
        debug: true,
        // Specify validation rules
        rules: {
            // The key name on the left side is the name attribute
            // of an input field. Validation rules are defined
            // on the right side
            "office_expense[amount]": {
                required: true,
                pattern: /^[1-9]\d*(\.\d+)?$/
            },
            "office_expense[date]": {required: true}
        },
        // Specify validation error messages
        messages: {
            "office_expense[amount]": {
                required: "Please enter standard Name",
                pattern: "only number starting with 1-9 allowed with an optional decimal point."
            }
        },
        // Make sure the form is submitted to the destination defined
        // in the "action" attribute of the form when valid
        submitHandler: function(form) {
            form.submit();
        }
    });
});