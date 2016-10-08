<html>
    <?php get_head(); ?>
    <body>
        <?php get_header(); ?>

        <div class="home-container">
            <div class="login-container">
                <div class="row">
                    <h1 class="border-bottom">Connected</h1>
                </div>
                <div class="row">
                    <div class="col-6">
                        <p class="content-19 bold">
                            Welcome to our world!
                        </p>
                        <p class="content-17">
                            Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto.
                            Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500,
                            cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de
                            textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió
                            500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedand
                            esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset",
                            las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por
                            ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.
                        </p>
                    </div>
                    <div class="col-6">
                        <div class="login-register-form">
                            <div class="row tabs">
                                <div class="tab-item selected cursor-pointer" id="login">Login</div>
                                <div class="tab-item cursor-pointer" id="register">Register</div>
                            </div>
                            <div class="row tab-content">
                                <div id="login-tab" class="tabs-content">
                                    <form action="login/" method="POST">
                                        <div class="form-group">
                                            <label for="email" class="full-width display-block">Email Address</label>
                                            <input type="text" class="full-width display-block" name="email" placeholder="Email Address">
                                        </div>
                                        <div class="form-group">
                                            <label for="password">Password</label>
                                            <input type="password" class="full-width display-block" name="password" placeholder="Password">
                                        </div>
                                        <button type="submit" name="submit-login">Login</button>
                                    </form>
                                </div>
                                <div id="register-tab" class="hidden tabs-content">
                                    <form action="login/" method="POST">
                                        <div class="form-group">
                                            <label for="email" class="full-width display-block">Email Address</label>
                                            <input type="text" class="full-width display-block" name="email" placeholder="Email Address">
                                        </div>
                                        <div class="form-group">
                                            <label for="password">Password</label>
                                            <input type="password" class="full-width display-block" name="password" placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <label for="password2">Password 2</label>
                                            <input type="password" class="full-width display-block" name="password2" placeholder="Password 2">
                                        </div>
                                        <button type="submit" name="submit-login">Login</button>
                                    </form>
                                </div>
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