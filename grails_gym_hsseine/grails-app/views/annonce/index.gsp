<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="btn-group">
    <button type="button" class="btn btn-info"><a style="color: white; text-decoration: none" href="#list-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                                                             default="Skip to content&hellip;"/></a></button>
    <button type="button" class="btn btn-secondary"><a style="color: white; text-decoration: none" class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></button>
    <button type="button" class="btn btn-warning"><g:link style="color: white; text-decoration: none" class="create" action="create"><g:message code="default.new.label"
                                                                                                    args="[entityName]"/></g:link></button>
</div>
<br><br>
<div id="list-annonce" class="content scaffold-list" role="main">
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
                                        <th>#Ref</th>
                                        <th>Illustrations</th>
                                        <th>Titre</th>
                                        <th>Description</th>
                                        <th>Date de publication</th>
                                        <th>Publié par</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <g:each in="${annonceList}">
                                        <tr>
                                            <td>${it.ref}</td>
                                            <td>
                                                <g:each in="${it.illustrations}" var="ill">
                                                <g:img file="${ill.filename}" />
                                                </g:each>
                                            </td>
                                            <td><g:link controller="annonce" action="show" id="${it.id}">${it.title}</g:link></td>
                                            <td>${it.description}</td>
                                            <td>${it.dateCreated}</td>
                                            <td><g:link controller="user" action="show" id="${it.author.id}">${it.author.username}</g:link></td>
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
</div>

<div class="pagination">
    <g:paginate total="${annonceCount ?: 0}"/>
</div>
</div>
</body>
</html>