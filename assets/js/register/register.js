(function () {
    'use strict';

    $("form[name='register-form']").validate({
        errorClass: 'has-error',
        rules: {
            firstname: "required",
            lastname: "required",
            emailreg: {
                required: true,
                email: true
            },
            passwordreg: {
                required: true,
                minlength: 5
            },
            password2: {
                required: true,
                equalTo : '#passwordreg'
            }
        },
        messages: {
            firstname: "Please enter your firstname.",
            lastname: "Please enter your lastname",
            passwordreg: {
                required: "Please provide a password",
                minlength: "Your password must be at least 5 characters long"
            },
            password2: {
                required: "Please repeat the password",
                equalTo : "Password doesn't match"
            },
            emailreg: "Please enter a valid email address"
        },
        submitHandler: function(form) {
            form.submit();
        }
    });

})();