<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="btn-group">
        <button type="button" class="btn btn-info"><a style="color: white; text-decoration: none" href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a></button>
        <button type="button" class="btn btn-secondary"><a style="color: white; text-decoration: none" class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></button>
        <button type="button" class="btn btn-warning"><g:link style="color: white; text-decoration: none" class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></button>

    </div>
    <br> <br>

        <div id="list-user" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <p class="card-title">Les annonces</p>

                            <div class="row">
                                <div class="col-12">
                                    <div class="table-responsive">
                                        <table id="annonces" class="display expandable-table" style="width:100%">
                                            <thead>
                                            <tr>
                                                <th>Username</th>
                                                <th>Annonces</th>
                                                <th>Compte activé</th>
                                                <th>Compte expiré</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <g:each in="${userList}">
                                                <tr>
                                                    <td><g:link controller="annonce" action="show" id="${it.id}">${it.username}</g:link></td>
                                                    <td>
                                                        <g:each in="${it.annonces}" var="ann">
                                                            <g:link controller="annonce" action="show" id="${ann.id}"> ${ann.title} <br/></g:link>
                                                        </g:each>
                                                    </td>
                                                    <td>${it.enabled}</td>
                                                    <td>${it.accountExpired}</td>
                                                </tr>
                                            </g:each>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="pagination">
                <g:paginate total="${userCount ?: 0}" />
            </div>
        </div>
    </body>
</html>