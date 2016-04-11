us = {
	pg : {
		
	},
	ui : {
		showForm : function(index){
			$("#readOnly"+index).hide();
			$("#edit"+index+"Link").hide();
			$("#updateUser"+index).show();
		},
		hideForm : function(index){
			$("#readOnly"+index).show();
			$("#edit"+index+"Link").show();
			$("#updateUser"+index).hide();
			
// 			need to reset form
			var inputs = $("#updateUser"+index).find("INPUT");
			$.each(inputs, function(key,value){
				$(value).val($(value).attr("value"));
			});	

		}
	},
	ctl : {
		eventBinding : function(){
			$("#profileDetails").on("click", function(e){
				e.preventDefault();
				var target = $(e.target);
				if(target.attr("class").indexOf("edit-lnk") != -1){
					us.ui.showForm(target.attr("data-edit-name"));
				}
				if(target.attr("class").indexOf("cancel-btn") != -1){
					us.ui.hideForm(target.attr("data-cancel-name"));
				}
				if(target.attr("class").indexOf("submit-btn") != -1){
					us.ctl.updateUser(target.attr("data-submit-name"));
				}
			});
		},
		updateUser : function(index){
			var inputs = $("#updateUser"+index).find("INPUT");
			var obj = {
				user : {}
			};
			$.each(inputs, function(key,value){
				obj.user[$(value).attr("name")] = $(value).val();
			});
			obj["authenticity_token"] = $('meta[name=csrf-token]').attr('content');
			obj["id"] = $("#hiddenUserId").val();
			
			$.ajax({
				url: "/update_profile",
				type: "POST",
				data: obj,
				success : function(data){
					location.reload();
				}
			});
		}
	},
	init : function(){
		us.ctl.eventBinding();
	}
};
