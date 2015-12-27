dat_landing = {
  pg : {

  },
  ui : {
    resizeDiv : function(win){
      $(".introSection").each(function(){
        $(this).css({
          "min-height" : win+"px"
        });
      });
    },
    checkMin : function(){
      //check to see if window is too small. if too small dont resize smaller
      var h = $(window).height();
      if(h <= 600){
        //min size
        dat_landing.ui.resizeDiv(815);
      }else{
        dat_landing.ui.resizeDiv(h);
      }
    },
    scrollToSignup : function(){
      var targetPos = $("#intro_signup").offset().top;
      $('html, body').animate({scrollTop:targetPos}, 'slow');
    },
    changeHeaderWhite : function(){
      $("#headerBar").css({
        "color" : "#FFF",
      });
    },
    changeHeaderBlack : function(){
      $("#headerBar").css({
        "color" : "#000",
      });
    },
    fadeColors : function(s,e,p){
      var d = e - s;
      var np = p - s;
      var hex = Math.round(255 * (np/d));
      $("#headerBar").css({
        "color" : "rgb("+hex+","+hex+","+hex+")",
      });
    },
    openLogin : function(){
      //show overlay
      $("#login_overlay").show();
    },
    closeLogin : function(){
      //hide overlay
      $("#login_overlay").hide();
      //enable scrolling
      $("body").removeAttr("style");
    },
    hideAlert : function(){
      setTimeout(function(){
        $(".alert").fadeOut("slow");
      },3000);
    }
  },
  ctl : {
    bindEvents : function(){
      $(window).resize(function(){
        dat_landing.ui.checkMin();
      });

      $(window).on("scroll", function(){
        var buffer = 50;
        var start = $("#intro_welcome").height() - $("#headerBar").height() - buffer;
        var end = $("#intro_welcome").height() + buffer;
        var position = $(document).scrollTop();
        if(start < position && position < end){
          dat_landing.ui.fadeColors(start, end, position);
        }else if(position >= end){
          dat_landing.ui.changeHeaderWhite();
        }else{
          dat_landing.ui.changeHeaderBlack();
        }
      });

      $("#headerBar").on("click", function(e){
        e.preventDefault();
        var target = $(e.target);
        var className = "";
        if(typeof target.attr("class") != "undefined"){
          className = target.attr("class");
        }

/*
        //if sign in, open overlay
        if(className.indexOf("signin-btn") != -1){
          dat_landing.ui.openLogin();
        }*/

        
        // login
        if(className.indexOf("submit-btn") != -1){
          dat_landing.ctl.submitLogin();
        }
      });

      $("#login_overlay").on("click", function(e){
        e.preventDefault();
        var target = $(e.target);
        var className = "";
        if(typeof target.attr("class") != "undefined"){
          className = target.attr("class");
        }
        //if sign up button, scroll down to sign up div
        if(className.indexOf("signup-btn") != -1){
          dat_landing.ui.closeLogin();
          dat_landing.ui.scrollToSignup();
        }

        // login
        if(className.indexOf("submit-btn") != -1){
          dat_landing.ctl.submitLogin();
        }

        //if exit button, well... exit
        if(className.indexOf("close_login") != -1){
          dat_landing.ui.closeLogin();
        }
      });
    },

    submitLogin : function (){
      var data = $("form[name=login_form]").serialize();
      $.ajax({
        url : "/sessions",
        type : "POST",
        data : data,
        success : function(value){
          if(value.indexOf("http") != -1){
            window.location.href = value;
          }else{
            // not really success. If this pops up, it means it failed
            $("#login_error").show();
            $("#login_error").html(value);
            dat_landing.ui.hideAlert();
          }

        }
      });
    },

    submitSignup : function(){

    }
  },
  init : function(){
    dat_landing.ui.checkMin();
    dat_landing.ctl.bindEvents();
  }
};
