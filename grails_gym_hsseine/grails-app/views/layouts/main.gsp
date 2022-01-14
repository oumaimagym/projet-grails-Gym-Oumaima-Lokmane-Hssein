<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>
    <g:layoutTitle default="Grails"/>
    </title>
    <asset:stylesheet src="feather.css"/>
    <asset:stylesheet src="themify-icons.css"/>
    <asset:stylesheet src="vendor.bundle.base.css"/>
    <asset:stylesheet src="dataTables.bootstrap4.css"/>
    <asset:stylesheet src="vendors/ti-icons/css/themify-icons.css"/>
    <asset:stylesheet src="select.dataTables.min.css"/>
    <asset:stylesheet src="style.css"/>
    <g:layoutHead/>
</head>

<body>
<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
            <a class="navbar-brand brand-logo mr-5" href="index.html"><img style="height: 60px; width: 60px" src="https://png.pngtree.com/template/20190530/ourlarge/pngtree-letter-c-logo-vector-image_204408.jpg" class="mr-2"
                                                                           alt="logo"/></a>
            <a class="navbar-brand brand-logo-mini" href="index.html"><img style="height: 60px; width: 60px" src="https://png.pngtree.com/template/20190530/ourlarge/pngtree-letter-c-logo-vector-image_204408.jpg" class="mr-2"
                                                                           alt="logo"/></a>
        </div>

        <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
            <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                <i class="fas fa-bars"></i>
            </button>
            <ul class="navbar-nav mr-lg-2">
                <li class="nav-item nav-search d-none d-lg-block">
                    <div class="input-group">
                        <div class="input-group-prepend hover-cursor" id="navbar-search-icon">
                            <span class="input-group-text" id="search">
                                <i class="fas fa-search"></i>
                            </span>
                        </div>
                        <input type="text" class="form-control" id="navbar-search-input" placeholder="Search now"
                               aria-label="search" aria-describedby="search">
                    </div>
                </li>
            </ul>
            <ul class="navbar-nav navbar-nav-right">
                <sec:ifNotLoggedIn>
                    <li class="nav-item">
                        <g:link controller='login' action='auth' class="nav-link">Login</g:link>
                    </li>
                </sec:ifNotLoggedIn>
                <sec:ifLoggedIn>
                    <li class="nav-item nav-profile dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
                            <sec:loggedInUserInfo field='username'/>
                        </a>

                        <div class="dropdown-menu dropdown-menu-right navbar-dropdown"
                             aria-labelledby="profileDropdown">
                            <a class="dropdown-item">
                                <g:link controller='user' action='show' id='${sec.loggedInUserInfo(field: 'id')}'
                                        class="dropdown-item">Mon compte</g:link>
                            </a>
                            <a class="dropdown-item" href="/logout">
                                Logout
                            </a>
                        </div>
                    </li>
                </sec:ifLoggedIn>
            </ul>
            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button"
                    data-toggle="offcanvas">
                <span class="icon-menu"></span>
            </button>
        </div>
    </nav>
    <div class="container-fluid page-body-wrapper">
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
            <ul class="nav">
                <li class="nav-item">
                    <a class="nav-link" href="/">
                        <i class="fas fa-home"></i>
                        <span class="menu-title">&nbsp;&nbsp;Page d'accueil</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#annonces" aria-expanded="false"
                       aria-controls="ui-basic">
                        <i class="fas fa-scroll"></i>
                        <span class="menu-title">&nbsp;&nbsp;Annonces&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        <i class="fas fa-chevron-down"></i>
                    </a>

                    <div class="collapse" id="annonces">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"><a class="nav-link" href="/annonce">Voir les annonces</a></li>
                            <li class="nav-item"><a class="nav-link" href="/annonce/create">Ajouter une annonce</a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#illustrations" aria-expanded="false"
                       aria-controls="ui-basic">
                        <i class="fas fa-images"></i>
                        <span class="menu-title">&nbsp;&nbsp;Illustrations&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        <i class="fas fa-chevron-down"></i>
                    </a>

                    <div class="collapse" id="illustrations">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"><a class="nav-link" href="/illustration">Voir les Illustrations</a></li>
                            <li class="nav-item"><a class="nav-link" href="/illustration/create">Ajouter des illustrations</a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#users" aria-expanded="false"
                       aria-controls="ui-basic">
                        <i class="fas fa-users"></i>
                        <span class="menu-title">&nbsp;&nbsp;Utilisateurs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        <i class="fas fa-chevron-down"></i>
                    </a>

                    <div class="collapse" id="users">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"><a class="nav-link" href="/user">Voir les utilisateurs</a>
                            </li>
                            <li class="nav-item"><a class="nav-link"
                                                    href="/user/create">Ajouter un utilisateur</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </nav>
        <div class="main-panel">
            <div class="content-wrapper">
                <g:layoutBody/>
            </div>
        </div>
    </div>
</div>
<asset:javascript src="vendor.bundle.base.js"/>
<asset:javascript src="Chart.min.js"/>
<asset:javascript src="jquery.dataTables.js"/>
<asset:javascript src="dataTables.bootstrap4.js"/>
<asset:javascript src="dataTables.select.min.js"/>
<asset:javascript src="off-canvas.js"/>
<asset:javascript src="hoverable-collapse.js"/>
<asset:javascript src="template.js"/>
<asset:javascript src="settings.js"/>
<asset:javascript src="todolist.js"/>
<asset:javascript src="dashboard.js"/>
<asset:javascript src="Chart.roundedBarCharts.js"/>
<script src="https://kit.fontawesome.com/26924b2044.js" crossorigin="anonymous"></script>
</body>

</html>