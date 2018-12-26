$(function () {
   $('select#report_for').on('change', function () {
      var selected_item = $(this).val();

       $('#student_report_gender_select').attr('style', 'display: none;');
       $('#student_report_category_select').attr('style', 'display: none;');
       $('#student_report_blood_group_select').attr('style', 'display: none;');
       $('#student_report_religion_select').attr('style', 'display: none;');
       $('#student_report_caste_select').attr('style', 'display: none;');
       $('#student_report_certificate_select').attr('style', 'display: none;');
       $('#student_report_'+ selected_item +'_select').attr('style', '' +
           '' +
           'visibility: visible;' +
           'opacity: 1;' +
           'transition: opacity 2s linear;');
   });

   $('#students_report_form').bind('ajax:success', function () {
      console.log('success');
   });
});