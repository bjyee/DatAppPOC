gn = {
	pg : {
		members : []
	},
	ui : {
		loadMembers : function(){
			gn.pg.members = $("#membersHidden").val().split(",");
			for(var i = 0; i < gn.pg.members.length; i++){
				var elem = $(".memCheck[value='"+gn.pg.members[i]+"']")[0];
				if(typeof elem != "undefined"){
					elem.checked = true;
				}
			}
		}
	},
	ctl : {
		eventBinding : function(){
			$("#memberSelect").off("click").on("click", function(e){
				e.preventDefault();
        		var target = $(e.target);	
			    var className = target[0].className;		
			    var parentClassName = target[0].parentNode.className;
// 			    Need to decide if its the parent or not
				var decision = null;
				
				if(className.indexOf("indMem") != -1){
					decision = 	target[0];
				}	
				
				if(parentClassName.indexOf("indMem") != -1){
					decision = target[0].parentNode;
				}
// 				if clicked on a checkbox, remove or add the user to the list
				if(typeof className != "undefined" && decision != null){
					var input = $(decision).children('input')[0];
					if(!input.checked){
						gn.ctl.addToList(input);
					}else{
						gn.ctl.removeFromList(input);
					}
					input.checked = !input.checked;
				}
				$("#membersHidden").val(gn.pg.members);
			});
			
			$(".memCheck").on("click",function(e){
				e.stopPropagation();
			});
		},
		addToList : function(input){
			gn.pg.members.push(input.value);
		},
		removeFromList : function(input){
			var index = gn.pg.members.indexOf(input.value);
			if(index !== -1){
				gn.pg.members.splice(index,1);
			}
		}
	},
	init : function(){
		gn.ctl.eventBinding();
	}
};

$(function(){
	gn.init();
});
