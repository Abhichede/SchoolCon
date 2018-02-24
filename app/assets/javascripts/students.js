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

   $("#admitted_students_table").dataTable();
   $("#enquired_students_table").dataTable();

   $('form.student').validate({
       debug: true,
       // Specify validation rules
       rules: {
           // The key name on the left side is the name attribute
           // of an input field. Validation rules are defined
           // on the right side
           "student[first_name]": {required: true},
           "student[last_name]": {required: true},
           "student[date_of_birth]":{required: true},
           "student[residential_address_one]":{required: true},
           "student[residential_city]":{required: true},
           "student[residential_state]":{required: true},
           "student[residential_pincode]":{
               required: true,
               pattern: /^[1-9][0-9]{5}$/,
               minlength: 6,
               maxlength: 6
           },
           "student[permanent_address_one]":{required: true},
           "student[permanent_city]":{required: true},
           "student[permanent_state]":{required: true},
           "student[permanent_pincode]":{
               required: true,
               pattern: /^[1-9][0-9]{5}$/,
               minlength: 6,
               maxlength: 6
           },
           "student[father_first_name]":{required: true},
           "student[father_last_name]":{required: true},
           "student[mother_first_name]":{required: true},
           "student[mother_last_name]":{required: true},
           "student[father_mobile]":{
               required: true,
               pattern: /^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[789]\d{9}$/
           },
           "student[standard_id]":{required: true},
           "student[division_id]":{required: true},
           "student[roll_no]":{required: true},
           "student[student_mobile]": {
               required: true,
               pattern: /^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[789]\d{9}$/
           },
           "student[student_email]": {
               pattern: /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
           },
           "student[father_email]": {
               pattern: /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
           },
           "student[mother_email]": {
               pattern: /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
           }
       },
       // Specify validation error messages
       messages: {
           "student[student_mobile]":{
            pattern: "It seems invalid mobile number"
           },
           "student[father_mobile]": {
               pattern: "It seems invalid mobile number"
           },
           "student[residential_pincode]": {
               pattern: "It seems invalid PIN code"
           },
           "student[permanent_pincode]": {
               pattern: "It seems invalid PIN code"
           },
           "student[student_email]": {
               pattern: "It seems invalid Email"
           },
           "student[father_email]": {
               pattern: "It seems invalid Email"
           },
           "student[mother_email]": {
               pattern: "It seems invalid Email"
           }


           },
       // Make sure the form is submitted to the destination defined
       // in the "action" attribute of the form when valid
       submitHandler: function(form) {
           form.submit();
       }
   });
});