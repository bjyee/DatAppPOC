gn = {
	pg : {
		members : []
	},
	ui : {
		
	},
	ctl : {
		eventBinding : function(){
			$("#memberSelect").off("click").on("click", function(e){
				e.preventDefault();
        		var target = $(e.target);	
			    var className = target[0].className;		
// 				if clicked on a checkbox, remove or add the user to the list
				if(typeof className != "undefined" && className.indexOf("indMem") != -1){
					var input = $(target[0]).children('input')[0];
					console.log(input.value);
					console.log(input.checked);
					if(!input.checked){
						gn.ctl.addToList(input);
						input.checked = true;
					}else{
						gn.ctl.removeFromList(input);
						input.checked = false;
					}
				}
				$("#membersHidden").value = gn.pg.members.toString;
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
