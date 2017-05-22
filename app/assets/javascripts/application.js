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

  var messages = $('#conversation-body');
  let messages_to_bottom = () => messages.scrollTop(messages.prop("scrollHeight"));

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

  $('.sendmessage').on('click', function(){
    location.reload();
  })


  $('.pledge-convo').click(function(e){
    e.preventDefault();
    $.ajax({
      url:'/personal_messages/new',
      method: 'GET',
      data: {
        receiver_id: $(this).attr('data-receiver-id')
      }
    }).done(function(data){
      console.log(data);
      $('.chat-content').html(data);
      $('.sendmessage > input').addClass('campaign-submit');
      $('.sendmessage').removeClass('sendmessage');
      $('#conversation-body').scrollTop($('#conversation-body').prop("scrollHeight"));

      var hidden = $('.messager');
      hidden.show().animate({right:"0px"}).addClass('visible');
    })
  })

  $('body').delegate('.campaign-submit', 'click', function(e){
    console.log('clicking');
    e.preventDefault();
    var messageSubmit = $('<div>', {class: 'campaign-message-submit', text: "Your message has successfully been sent!"});
    var message = $('.new_personal_message textarea').val();

    $.ajax({
      url:'/personal_messages',
      method: "POST",
      data:{
        body: message,
        receiver_id: $('.pledge-convo').attr('data-receiver-id')
      }
    }).done(function(data){
      $('.new_personal_message textarea').val('');
      $.ajax({
        url:'/personal_messages/new',
        method: 'GET',
        data: {
          receiver_id: $('.pledge-convo').attr('data-receiver-id')
        }
      }).done(function(data){
        $('.chat-content').html(data);
        $('.sendmessage > input').addClass('campaign-submit');
        $('.sendmessage').removeClass('sendmessage');
        $('#conversation-body').scrollTop($('#conversation-body').prop("scrollHeight"));
      })
    })

    $('body').append(messageSubmit);
    setTimeout(function(){
      $(messageSubmit).slideUp();
    }, 2000);
  })

  $('body').delegate('.close-chat', 'click', function(){
    $('.messager').animate({right:"-1000px"}).removeClass('visible');
  })
});
