<?php

if ( !is_null(get_logged_user( )) ){
    header("Location: ".get_url());
    exit;
}

if ( isset( $_POST["submit-login"] ) ){
    $email = null;
    $password = null;
    if ( isset( $_POST['email'] ) && isset( $_POST['password'] ) ){
        if ( $_POST['email'] != "" && $_POST['password'] != "" ){
            $email = $_POST['email'];
            $password = md5( $_POST['password'] );
        } else {
            login_custom_message( 'Please provide the email and the password.' );
        }
    } else {
        login_custom_message( 'Please provide the email and the password.' );
    }
    if ( !is_null( $email ) && !is_null( $password ) ){
        $result = $db->select('call auth_user("'.$email.'","'.$password.'")');
        if ( sizeof( $result ) == 1 ){
            $result = $result[0];
            set_logged_user( $result );
            header("Location: ".get_url());
            exit;
        } else {
            login_custom_message( "The email and the password do not meet with any record." );
        }
    } else {
        login_custom_message( 'Please provide the email and the password.' );
    }
} else {
    login_custom_message();
}

function login_custom_message($message = null){
    get_head();
    ?>
    <html>
    <body class="body">
    <?php get_header(); ?>
    <div class="home-container">
        <div class="login-container">
            <div class="row">
                <h1 class="border-bottom">Login</h1>
            </div>
            <div class="row">
                <div class="col-10 float-center-imp">
                    <div class="col-9 float-center-imp">
                        <form action="<?php echo get_url(); ?>login/" method="POST" id="login-form" name="login-form">
                            <div class="form-group">
                                <label for="email" class="full-width display-block">Email Address</label>
                                <input type="email" maxlength="200" class="full-width display-block" name="email" id="email" placeholder="Email Address">
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" maxlength="200" class="full-width display-block" name="password" id="password" placeholder="Password">
                            </div>
                            <div class="form-group text-right">
                                <button class="button-sm" type="submit" name="submit-login">Login</button>
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