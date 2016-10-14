<?php
function get_url(){
    return 'http://localhost/connected/';
}

function get_head(){ ?>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="<?php echo get_url(); ?>assets/css/template.css">
    <link rel="stylesheet" href="<?php echo get_url(); ?>assets/css/style.css">
</head>

<?php
}

function get_header(){ ?>

    <header class="row header">
        <div class="col-3 full-height font-white header-items-center">
            fdsafdsa
        </div>
        <div class="col-6 full-height font-white position-relative">
            <div class="position-absolute bottom-aligned">
                fdasfds
            </div>
        </div>
        <div class="col-3 full-height font-white position-relative">
            <div class="position-absolute bottom-aligned">
                fdasfds
            </div>
        </div>
    </header>

    <?php
}