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

  // var messages = $('#conversation-body');
  // let messages_to_bottom = () => messages.scrollTop(messages.prop("scrollHeight"));

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

  $('.pledge-search-submit').on('click', function(e){
    e.preventDefault();
    $.ajax({
      url:'/campaigns',
      method: 'GET',
      dataType: 'json',
      data:{
        search: $('.pledge-search > input').val()
      }
    }).done(function(data){
      $('.pledge-search-results').html('');
      $('.pledge-search-results').append($('<h5>').html('Click on the desired user'));
      $.each(data, function( j, i){
        $('.pledge-search-results').append(
          $('<div>', {
            text: ''+ i['full_name'] + ' | ' + i['studio_name'] + '',
            id: i['id'],
            class: 'allocation-searched-user'
            }
          )
        );
      })
  })
})

$('body').delegate('.allocation-searched-user', 'click', function(){
  $(this).css('text-decoration', 'underline red').addClass('selected');
  var name = $(this).html();
  $('.allocate-name').val(name);
})

$('.submit-shares').on('click', function(e){
  e.preventDefault();
  $.ajax({
    url:'/pledges',
    method: "POST",
    data:{ pledge:{
      reward_id: $('.allocation').attr('data-reward-id'),
      percentage_pledged: $('#allocate-percentage').val(),
      user_id: $('.selected').attr('id')
    }}
  }).done(function(){
    $('.buy-trade').append('<br><br>').append($('<div>',{
      text: 'The shares have been successfully allocated',
      class: 'allocation-success'
    }))

    setTimeout(function(){
      $('.allocation-success').slideUp()
    }, 2000)

    $('#chart_div').html('');
    drawChart();

    $('.pledge-search > input').val('');
    $('.pledge-search-results').html('');
    $('#allocate-percentage').val('');
    $('.allocate-name').val('');
    $('.allocation').fadeOut('slow');
  }).fail(function(){
    $('.allocation').append('<br>').append($('<div>',{
      text: 'Oops! Something went wrong. Please try again with all the fields correctly completed',
      class: 'allocation-failure'
    }))

    setTimeout(function(){
      $('.allocation-failure').slideUp()
    }, 2000)
  })
})

  $('.allocate').on('click', function(){
    $('.allocation').fadeIn('100').attr('data-reward-id', ($(this).parent().attr('data-reward-id')));

  })
})
