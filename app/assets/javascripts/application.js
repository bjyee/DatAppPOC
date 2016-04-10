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
		},
		setSearchResultPosition : function(){
			var left = $("#searchForGroupsEvents").position().left;
			var top = $("#searchForGroupsEvents").position().top;
			top = top + $("#searchForGroupsEvents").outerHeight();
			$("#searchResultsBox").css({
				top : top,
				left : left,
				width : $("#searchForGroupsEvents").outerWidth()
			});
		},
		updateSearchResults : function(data){
			if(data.group.length > 0){
				for(var x = 0; x < data.group.length; x++){
					var groupString = "<div class='hoverHeader'>";
					groupString += "<a href='groups/"+data.group[x].id+"' class='noStyleLink header'>";
					groupString += "<div>"+data.group[x].name+"</div>";
					groupString += "<small><div>"+data.group[x].category+"</div></small>";
					groupString += "</a>";
					groupString += "</div>";
				}
				$("#searchResultsGroups").empty().append(groupString);
			}else{
				$("#searchResultsGroups").empty().append("<small style='color:#AAA'>No Groups Found</small>");
			}
			
			if(data.event.length > 0){
				for(var x = 0; x < data.event.length; x++){
					var eventString = "<div class='hoverHeader'>";
					eventString += "<a href='events/"+data.event[x].id+"' class='noStyleLink'>";
					eventString += "<div>"+data.event[x].name+"</div>";
					eventString += "<div>"+data.event[x].when+"</div>";
					eventString += "</a>";
					eventString += "</div>";
				}
				$("#searchResultsEvents").empty().append(eventString);
			}else{
				$("#searchResultsEvents").empty().append("<small style='color:#AAA'>No Events Found</small>");
			}
		}
	},
	ctl : {
		eventBinding : function(){
// 			on keyup of search box, show and populate search results
			$("#searchForGroupsEvents").on("keyup", function(e){
				var val = $("#searchForGroupsEvents").val();
				if(val.length > 0){
					theme.ctl.getSearchResults(val);
					theme.ui.setSearchResultPosition();
					$("#searchResultsBox").show();
				}else{
					$("#searchResultsBox").hide();
				}
			});
		},
		getSearchResults : function(val){
			var obj = {"search" : val};
			$.ajax({
				url: "/searchGroupEvent",
				type: "GET",
				data: obj,
				dataType: "JSON",
				success : function(data){
					theme.ui.updateSearchResults(data);
				}
			});
		},
		resizeBodyHeight : function(){
	      	$(window).resize(function(){
				theme.ui.setBodyHeight();	     
	      	});
		}
	},
	init : function(){
		theme.ui.setBodyHeight();	
		theme.ctl.resizeBodyHeight();	
		theme.ctl.eventBinding();
	}
};
