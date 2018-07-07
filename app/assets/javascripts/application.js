// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
// require rails-ujs
//= require jquery
//= require jquery_ujs
// require jquery-ui
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require twitter/bootstrap
//= require bootstrap-multiselect
//= require moment
//= require bootstrap-datetimepicker
//= require fullcalendar
//= require chartkick
// require toastr
// require turbolinks
//= require_tree .

var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
};

function on() {
    $("#overlay").css('display', 'block');
}

function off() {
    $("#overlay").css('display', "none");
}

var codesList = function (context) {
    var ui = $.summernote.ui;

    var codes = [
        '#{institute_name}',
        '#{institute_logo}',
        '#{institute_address}',
        '#{institute_contact}',
        '#{institute_gst_no}',
        '#{institute_registration_no}',
        '#{student_name}',
        '#{student_contact}',
        '#{student_standard}',
        '#{student_division}',
        '#{student_father_name}',
        '#{student_mother_name}',
        '#{student_admission_year}',
        '#{academic_year}',
        '#{student_dob}',
        '#{student_id}',
        '#{amount}',
        '#{payment_mode}',
        '#{payment_date}',
        '#{amount_in_words}',
        '#{balance_amount}',
        '#{receipt_no}',
        '#{receipt_date}',
        '#{fee_details}',
        '#{fee_summary}',
        '#{date}'
    ];

    var list = "";
    for (i = 0; i < codes.length; i++) {
        list += '<li> <a href="#" data-value="'+codes[i]+'">'+ codes[i] +'</a></li>';
    }

    var $codeList = ui.buttonGroup([
        ui.button({
            className: 'dropdown-toggle',
            contents: 'Default Codes <span class="caret"></span>',
            tooltip: "to get data from database",
            data: {
                toggle: 'dropdown'
            },
            click: function () {
                context.invoke('editor.saveRange');
            }
        }),
        ui.dropdown({
            className: 'dropdown-style codes-list',
            //items: emojis, // list of style tag
            contents: list,
            callback: function ($dropdown) {
                $dropdown.find('li').each(function () {
                    console.log($(this));
                    $(this).click(function () {
                        context.invoke('editor.insertText', $(this).find('a').data('value'));
                    });
                });
            }
        })
    ]).render();
    return $codeList;

};

$(document).ready(function () {

    /***
     * login start
     */

    $('input[type="password"]').on('focus', function () {
        $('*').addClass('password');
    }).on('focusout', function () {
        $('*').removeClass('password');
    });
    /***
     *  end login
     */

    /**
     * Start spinner
     */

     off();

    $("form").on('submit', function () {
        if($(this).valid()){
            on();
        }else {
            off();
        }

    });

     $('.btn-primary, .btn-success, .fc-content, btn-spinner').on('click', function () {
         on();
     });
    /**
     * END Spinner
     */

});
