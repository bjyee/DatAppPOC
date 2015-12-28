// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

theme = {
	pg : {
		
	},
	ui : {
		setBodyHeight: function(){
// 			need to get footer height and the page height
			var pageH = $(window).height();
			var footerH = $("#footer").height();
			var minHeight = pageH - footerH;
// 			now set the body height of the content to this.
			$("#applicationBody").css("min-height", minHeight+"px");
		}
	},
	ctl : {
		resizeBodyHeight : function(){
	      	$(window).resize(function(){
				theme.ui.setBodyHeight();	     
	      	});
		}
	},
	init : function(){
		theme.ui.setBodyHeight();	
		theme.ctl.resizeBodyHeight();	
	}
}
