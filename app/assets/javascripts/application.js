// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require cocoon
//= require cable

$(document).ready(function(){

  $('.subscribe').on('click', function(){
    $.ajax({
      url: '/subscriptions',
      type: 'POST',
      data:{ subscription: { subscribed_to_id: $('.subscription_data').attr('data-subscribed-to-id'),
        subscribee_id: $('.subscription_data').attr('data-subscribee-id')}
      }
    }).done(function(){
      if($('.subscribe').html().trim() === 'SUBSCRIBE'){
        $('.subscribe').html('SUBSCRIBED!');
      }
      else{
        $('.subscribe').html('SUBSCRIBE')
      }
    })
  });

  setTimeout(function() {
    $('#flash').slideUp();
  }, 3000);

  setTimeout(function() {
    $('#notice').slideUp();
  }, 2000);

  var messager = $('<div>').addClass('messager').css('display', 'none');
  $('body').append(messager);

  $('.pledge-convo').click(function(e){
    e.preventDefault();
    $.ajax({
      url:'/personal_messages/new',
      method: 'GET',
      data: {
        receiver_id: $(this).attr('data-receiver-id')
      }
    }).done(function(data){
      $('.messager').html(data);

      var hidden = $('.messager');
    if (hidden.hasClass('visible')){
      console.log('if');
        hidden.animate({left:"-1000px"}).removeClass('visible');
    } else {
      console.log('else');
        hidden.show().animate({left:"0px"}).addClass('visible');
    }
    })
  })
});
