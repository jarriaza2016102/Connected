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
                $('#login-tab').show("slow");
                $('#register-tab').hide("slow");
            } else {
                $('#login-tab').hide("slow");
                $('#register-tab').show("slow");
            }
        }
    }

})();