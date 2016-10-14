<?php

if ( !is_null(get_logged_user( )) ){
    header("Location: ".get_url());
    exit;
}

if ( isset( $_POST["submit-register"] ) ){
    $email = null;
    $password = null;
    $password2 = null;
    $firstname = null;
    $lastname = null;
    if ( isset( $_POST['emailreg'] ) && isset( $_POST['passwordreg']  ) && isset( $_POST['password2'] )
        && isset( $_POST['firstname'] ) && isset( $_POST['lastname'] ) ){
        if ( $_POST['emailreg'] != "" && $_POST['passwordreg'] != "" && $_POST['password2'] != ""
            && $_POST['firstname'] != "" && $_POST['lastname'] != "" ){
            $email = $_POST['emailreg'];
            $password = md5( $_POST['passwordreg'] ) ;
            $password2 = md5( $_POST['password2'] ) ;
            $firstname = $_POST['firstname'] ;
            $lastname = $_POST['lastname'] ;
            if( $password != $password2 ){
                register_custom_message( "The password doesn't match." );
                exit;
            }
        } else {
            register_custom_message( 'Please fill the form correctly.' );
            exit;
        }
    } else {
        register_custom_message( 'Please fill the form correctly.' );
        exit;
    }
    if ( !is_null( $email ) && !is_null( $password ) && !is_null( $password2 )
        && !is_null( $firstname ) && !is_null( $lastname ) ){
        $result = $db->select('call verify_user("'.$email.'")')[0];
        if ( $result['number'] == 0 ){
            $reg_user = $db->select('call reg_user("'.$email.'","'.$password.'","'.$firstname.'","'.$lastname.'")')[0];
            print_r( $reg_user );
        } else {
            register_custom_message( 'This email is already registerd.' );
            exit;
        }
    } else {
        register_custom_message( 'Please fill the form correctly.' );
        exit;
    }
} else {
    register_custom_message();
    exit;
}

function register_custom_message($message = null){
    get_head();
    ?>
    <html>
    <body class="body">
    <?php get_header(); ?>
    <div class="home-container">
        <div class="login-container">
            <div class="row">
                <h1 class="border-bottom">Register</h1>
            </div>
            <div class="row">
                <div class="col-10 float-center-imp">
                    <div class="col-9 float-center-imp">
                        <form action="<?php echo get_url(); ?>register/" method="POST" id="register-form" name="register-form">
                            <div class="form-group">
                                <label for="firstname" class="full-width display-block" data-required>First Name</label>
                                <input type="text" maxlength="75" class="full-width display-block" name="firstname" id="firstname" placeholder="First Name">
                            </div>
                            <div class="form-group">
                                <label for="lastname" class="full-width display-block">Last Name</label>
                                <input type="text" maxlength="75" class="full-width display-block" name="lastname" id="lastname" placeholder="Last Name">
                            </div>
                            <div class="form-group">
                                <label for="emailreg" class="full-width display-block">Email Address</label>
                                <input type="email" maxlength="200" class="full-width display-block" name="emailreg" id="emailreg" placeholder="Email Address">
                            </div>
                            <div class="form-group">
                                <label for="passwordreg">Password</label>
                                <input type="password" maxlength="200" class="full-width display-block" name="passwordreg" id="passwordreg" placeholder="Password">
                            </div>
                            <div class="form-group">
                                <label for="password2">Repeat your password</label>
                                <input type="password" maxlength="200" class="full-width display-block" name="password2" id="password2" placeholder="Repeat your password">
                            </div>
                            <div class="form-group text-right">
                                <button class="button-sm" type="submit" name="submit-register">Register</button>
                            </div>
                        </form>
                        <div class="danger-text">
                            <?php
                            if ( !is_null( $message ) ){
                                echo "<p class='bold site-font-size'>ERRORS:</p>";
                                echo "<p class='danger-font-size'>".$message."</p>";
                            }
                            ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </body>
    <?php get_scripts(); ?>
    </html>
    <?php
}

?>