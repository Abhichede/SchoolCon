$(function () {
   $('input#same_as_residential').on('change', function () {
       var self = $('input#same_as_residential');
       if(self.is(':checked')){
           $('#student_permanent_address_one').val($('#student_residential_address_one').val());
           $('#student_permanent_address_two').val($('#student_residential_address_two').val());
           $('#student_permanent_city').val($('#student_residential_city').val());
           $('#student_permanent_state').val($('#student_residential_state').val());
           $('#student_permanent_pincode').val($('#student_residential_pincode').val());
       }else{
           $('#student_permanent_address_one').val('');
           $('#student_permanent_address_two').val('');
           $('#student_permanent_city').val('');
           $('#student_permanent_state').val('');
           $('#student_permanent_pincode').val('');
       }
   }) ;


   $('form.student').validate({
       debug: true,
       // Specify validation rules
       rules: {
           // The key name on the left side is the name attribute
           // of an input field. Validation rules are defined
           // on the right side
           "student[first_name]": {required: true},
           "student[middle_name]": {required: true},
           "student[last_name]": {required: true},
           "student[student_mobile]": {
               required: true,
               pattern: /^(\+?\d{1,4}[\s-])?(?!0+\s+,?$)\d{10}\s*,?$/,
               minlength: 1,
               maxlength: 10
           }
       },
       // Specify validation error messages
       messages: {
           "student[first_name]": "Please enter Student's first Name",
           "student[middle_name]": "Please enter Student's Middle Name",
           "student[last_name]": "Please enter Student's Last Name",
           "student[student_mobile]":{
            required: "Please enter Student's mobile number",
            pattern: "It seems invalid mobile number"
           }


       },
       // Make sure the form is submitted to the destination defined
       // in the "action" attribute of the form when valid
       submitHandler: function(form) {
           form.submit();
       }
   });
});