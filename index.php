<html>
    <?php get_head(); ?>
    <body class="body">
        <?php get_header(); ?>

        <div class="home-container">
            <?php
            if( is_null( get_logged_user() ) ){
                require 'templates/home/principal.php';
            } else {
                require 'templates/home/logged.php';
            }
            ?>
        </div>

    </body>
    <?php get_scripts(); ?>
</html>