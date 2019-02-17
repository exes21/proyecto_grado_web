// This is a manifest file that'll be compiled into application, which will include all the files
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
//= require rails-ujs
//= require activestorage
//= require turbolinks

//Templates JS
//= require jquery
//= require jquery.cookie
//= require bootstrap
//= require handlebars
//= require typeahead.bundle
//= require jquery.nicescroll
//= require jquery.sparkline.min
//= require jquery.easing.1.3
//= require ion.sound
//= require bootbox
//= require bootstrap-session-timeout
//= require jquery.flot
//= require jquery.flot.spline.min
//= require jquery.flot.categories
//= require jquery.flot.tooltip.min
//= require jquery.flot.resize
//= require jquery.flot.pie
//= require dropzone
//= require jquery.gritter
//= require skycons
//= require waypoints
//= require jquery.counterup
//= require bootstrap-tour
//= require retina
//= require jquery.cubeportfolio
//= require moment
//= require daterangepicker
//= require datatables/js/jquery.dataTables.min
//= require datatables/extentions/dataTables.select.min
//= require datatables/extentions/dataTables.buttons.min
//= require datatables/extentions/jszip.min
//= require datatables/extentions/pdfmake.min
//= require datatables/extentions/vfs_fonts
//= require datatables/extentions/buttons.html5.min
//= require datatables/extentions/buttons.print.min
//= require datatables/extentions/full_numbers_no_ellipses
//= require datatables/extentions/dataTables.bootstrap
//= require datatables/extentions/datatables.responsive
//= require jquery.mockjax
//= require jquery.gritter
//= require raphael
//= require morris

//= require apps
//= require pages/blankon.dashboard
//= require demo

//= require gmaps


$(document).ready(function(){
  var map = new GMaps({
    el: '#map',
    lat:  19.4743005,
    lng: -70.6653768
  });
});
