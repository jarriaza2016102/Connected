(function () {
    'use strict';

    $(".tab-item").click(function (e) {
        tab_item_click(this);
    });

    function tab_item_click(e) {
        var id = $(e).attr("id");
        var has_class = $(e).hasClass("selected");
        if ( !has_class ){
            $('.tab-item').removeClass("selected");
            $(e).addClass("selected");
            if( id == 'login' ){
                $('#'+id+"-tab").removeClass("hidden");
                $('#register-tab').addClass("hidden");
            } else {
                $('#'+id+"-tab").removeClass("hidden");
                $('#login-tab').addClass("hidden");
            }
        }
    }

})();