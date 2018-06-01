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

$("form").on('submit', function () {
    if($(this).valid()){
        on();
    }else {
        off();
    }

});

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

     $('.btn-primary, .btn-success, .btn-default, .fc-content, btn-spinner').on('click', function () {
         on();
     });
    /**
     * END Spinner
     */

});
