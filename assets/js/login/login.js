(function () {
    'use strict';

    $("form[name='login-form']").validate({
        errorClass: 'has-error',
        rules: {
            email: {
                required: true,
                email: true
            },
            password: {
                required: true
            }
        },
        messages: {
            password: "Please provide a password",
            email: "Please enter a valid email address"
        },
        submitHandler: function(form) {
            form.submit();
        }
    });

})();