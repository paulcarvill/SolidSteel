// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


var bigSlide;

newTrack = function(){

	//create new panel
	var div = $('<div id="new"></div>');

	//position offscreen
	div.css( {
      	'height': '22px',
      	'width' : '100%',
      	'right' : '-100%',
      	'position': 'relative',
      	'-webkit-transition': 'right 300ms ease',
      	'-moz-transition': 'right 300ms ease',
      	'-ms-transition': 'right 300ms ease',
      	'-o-transition': 'right 300ms ease',
      	'transition': 'right 300ms ease',
      	'height': '0'
    })

    div.append('<div class="play"></div>');

    div.insertAfter($('#play'));

	// animate current screen out
	$(this).css('left', '-100%');

	window.setTimeout(function(){
		$('#play').removeData();
		$('#play').remove();
		$('#new').attr('id', 'play');
		$('#play').unbind().click(newTrack);
	}, 500);

	// animate in
	window.setTimeout(function(){
		$('#new').css('height', '22px').css('right', '0%');
		$('#playDetails p').text('THIS IS THE NEXT MIXNAME ' + Math.random()*1000);
	}, 50);
}



$(document).ready(function() {


    bigSlide = $('#timeline .year').bigSlide({
    	'side' : 'right',
    	'menuWidth' : '20%',
    	'easyClose' : true
    });

    searchBigSlide = $('.foo').bigSlide({
    	'menu' : '#search-menu',
    	'side' : 'right',
    	'menuWidth' : '20%',
    	'easyClose' : true
    });

    $('#home').click(function(){
    	searchBigSlide.toggleClose();
    	bigSlide.toggleClose();
    	$('#search-timeline').css('-webkit-transform','scaleY(0)');
    	$('#search-form').css('-webkit-transform','scaleY(0)');
    	$('#play').css('-webkit-transform','scaleY(0)');
    	$('#timeline').css('display','block');
    	$('#playDetails').hide();

    	window.setTimeout(function(){
    		$('#search-timeline').css('display','none');
			$('#search-form').css('display', 'none');
			$('#play').css('display', 'none');
			$('#timeline').css('-webkit-transform','scaleY(1)');
		}, 300);
    });

    $('#playing').click(function(){
    	searchBigSlide.toggleClose();
    	bigSlide.toggleClose();
    	$('#timeline').css('-webkit-transform','scaleY(0)');
    	$('#search-timeline').css('-webkit-transform','scaleY(0)');
    	$('#search-form').css('-webkit-transform','scaleY(0)');
        $('#play').css('display','block');

    	window.setTimeout(function(){
    		$('#search-timeline').css('display','none');
			$('#search-form').css('display', 'none');
			$('#timeline').css('display','none');

			$('#play').css('-webkit-transform','scaleY(1)');
	    	$('#playDetails').show();

		}, 300);
    });

    var timelineStyle = 'vert';

    $('#vm').click(function(){

        $('#social').css({
            'position' : 'absolute',
            'bottom' : '0',
            'width' : 'auto'
        });

        if(timelineStyle == 'vert') {
            $('#timeline').addClass('alt-timeline');
            timelineStyle = 'horiz';
        } else {
            $('#timeline').removeClass('alt-timeline');
            timelineStyle = 'vert';
        }
    })

    // $('.year').click(function(){
    // 	searchBigSlide.toggleClose();
    // });

    $('#play').unbind().click(newTrack);

    $('#search').unbind().click(function(){
    	$('#timeline').css('-webkit-transform','scaleY(0)');
    	$('#search-timeline').css('-webkit-transform','scaleY(0)');
    	$('#play').css('-webkit-transform','scaleY(0)');
    	$('#playDetails').hide();
        bigSlide.toggleClose();
    	searchBigSlide.toggleClose();

    	window.setTimeout(function(){
    		$('#search-timeline').css('display','none');
			$('#search-form').css('display', 'block').css('-webkit-transform','scaleY(1)');
			$('#timeline').css('display','none');
		}, 300);

    })

    $('form').submit(function(e){
    	e.preventDefault();

        $('#search-form span').addClass('animate');
        
    	window.setTimeout(function(){
            $('#search-form').css('-webkit-transform','scaleY(0)');
            $('#search-timeline').css('display', 'block');
		}, 900);

		window.setTimeout(function(){
            $('form')[0].reset();
            $('#search-form').css('display', 'none');
            $('#search-form span').removeClass('animate');
			$('#search-timeline').css('-webkit-transform','scaleY(1)');
			searchBigSlide.toggleOpen();
		}, 1000);
    })

});



function play() {
	$('#timeline').css('-webkit-transform','scaleY(0)');
	$('#search-timeline').css('-webkit-transform','scaleY(0)');
	searchBigSlide.toggleClose();

	window.setTimeout(function(){
		$('#play').css('display', 'block').css('-webkit-transform','scaleY(1)');
		$('#timeline').css('display','none');
		$('#search-timeline').css('display','none');
		$('#playDetails').css('display', 'block');
		}, 300);

	bigSlide.toggleClose();
    $('#playButton').fadeOut();
	$('#pauseButton').fadeIn();
}