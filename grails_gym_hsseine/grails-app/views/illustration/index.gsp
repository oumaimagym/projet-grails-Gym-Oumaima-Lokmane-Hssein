<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'illustration.label', default: 'Illustration')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="btn-group">
    <button type="button" class="btn btn-info"><a style="color: white; text-decoration: none" href="#list-illustration" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a></button>
    <button type="button" class="btn btn-secondary"><a style="color: white; text-decoration: none" class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></button>
    <button type="button" class="btn btn-warning"><g:link style="color: white; text-decoration: none" class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></button>

</div>
<br> <br>

<div id="list-illustration" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <div class="row">
        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <p class="card-title">Les illustartions</p>

                    <div class="row">
                        <div class="col-12">
                            <div class="table-responsive">
                                <table id="illustrations" class="display expandable-table" style="width:100%">
                                    <thead>
                                    <tr>
                                        <th>Image</th>
                                        <th>Publication</th>
                                        <th>Publié par</th>
                                        <th>Date de publication</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <g:each in="${illustrationList}">
                                        <tr>
                                            <td><g:img file="${it.filename}"/></td>
                                            <td><g:link controller="annonce" action="show"
                                                        id="${it.annonce.id}">${it.annonce.title}</g:link></td>
                                            <td><g:link controller="user" action="show"
                                                        id="${it.annonce.author.id}">${it.annonce.author.username}</g:link></td>
                                            <td>${it.annonce.dateCreated}</td>
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
        <g:paginate total="${illustrationCount ?: 0}"/>
    </div>
</div>
</body>
</html>