gn = {
	pg : {
		members : []
	},
	ui : {
		emptySearchWell : function(){
			$("#membersSearched").empty();
			// also going to hide the division line
			$("#membersSearched").hide();
		},
		drawMemberSelectItem : function(data){
			var mem = '<label class="indMem col-lg-3">\n';
				mem += '<input class="memCheck" type="checkbox" value="'+data.id+'"/>\n';
				mem += '<img width="36" height="36" src="https://www.junkfreejune.org.nz/themes/base/production/images/default-profile.png"/>\n';
				mem += '<span>'+data.firstname+' '+data.lastname+'</span>\n';
				mem += '</label>';
			return mem;
		},
		loadSearchedMembers : function(data){
			var well = $("#membersSearched");
// 			need to empty the well before adding to it
			gn.ui.emptySearchWell();
			for(var i = 0; i < data.length; i++){
				well.append(gn.ui.drawMemberSelectItem(data[i]));
			}
			if(data.length > 0){
				well.show();
			}
		},
		loadSelectedMembers : function(){
			gn.ui.checkEmptyMsg();
			if($("#membersHidden").val().length > 0){
				gn.pg.members = $("#membersHidden").val().split(",");
			}
			for(var i = 0; i < gn.pg.members.length; i++){
				var elem = $(".memCheck[value='"+gn.pg.members[i]+"']")[0];
				if(typeof elem != "undefined"){
					elem.checked = true;
				}
			}
			
		},
		addToSelected : function(val){
			var elem = $(".memCheck[value='"+val+"']")[0].parentNode;
			$(elem).appendTo("#membersAdded");
			$("#membersHidden").val(gn.pg.members);
			gn.ui.checkSearchBox();
		},
		removeFromSelected : function(val){
			$(".memCheck[value='"+val+"']")[0].parentNode.remove();
			gn.ui.checkEmptyMsg();
		},
		checkEmptyMsg : function(){
			if(gn.pg.members.length > 0){
				$("#membersEmpty").hide();
			}else{
				$("#membersEmpty").show();	
			}
		},
		checkSearchBox : function(){
			var box = $("#membersSearched");
			if(box.has("input").length > 0){
				box.show();
			}else{
				box.hide();
				gn.ui.searchResultsMsg(0,"");
			}
		},
		searchResultsMsg : function(length, keyword){
			if(length > 0){
				$("#searchResultsSpan").show().html("Search for '"+keyword+"' returned "+length+" members");
			}else{
				$("#searchResultsSpan").hide();
			}
		}
		
	},
	ctl : {
		eventBinding : function(){
			$("#memberSelect").off("click").on("click", function(e){
				e.preventDefault();
        		var target = $(e.target);
// 			    Need to decide if its the parent or not
				var decision = null;
				if(target[0].className.indexOf("indMem") != -1){
					decision = 	target[0];
				}
				if(target[0].parentNode.className.indexOf("indMem") != -1){
					decision = target[0].parentNode;
				}
// 				if clicked on a checkbox, remove or add the user to the list
				if(decision != null){
					var input = $(decision).children('input')[0];
					if(!input.checked){
						gn.ctl.addToList(input);
					}else{
						gn.ctl.removeFromList(input);
					}
					input.checked = !input.checked;
				}
			});
			
			$(".memCheck").on("click",function(e){
				e.stopPropagation();
			});
			
			$("#searchInput").on("keyup", function(e){
				var path = $("#membersPath").val();
				var keyword = $("#searchInput").val();
				if(keyword.length > 0){
					gn.ctl.getMembersByKeyword(path,keyword);
				}else{
					gn.ui.emptySearchWell();
					gn.ui.searchResultsMsg(0,"");
				}			
			});
		},
		addToList : function(input){
			gn.pg.members.push(input.value);
			gn.ui.checkEmptyMsg();
			gn.ui.addToSelected(input.value);
		},
		getMembersByKeyword : function(path, keyword){
			var obj = {"search" : keyword};
			$.ajax({
				url: path,
				type: "GET",
				data: obj,
				dataType: "JSON",
				success : function(data){
					gn.ui.loadSearchedMembers(data);
					gn.ui.searchResultsMsg(data.length, keyword);
				}
			});
		},
		removeFromList : function(input){
			var index = gn.pg.members.indexOf(input.value);
			if(index !== -1){
				gn.pg.members.splice(index,1);
				gn.ui.removeFromSelected(input.value);
				gn.ui.checkEmptyMsg();
			}
		}
	},
	init : function(){
		gn.ctl.eventBinding();
		gn.ui.loadSelectedMembers();
	}
};
