<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="btn-group">
        <button type="button" class="btn btn-info"><a style="color: white; text-decoration: none" href="#list-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                                                                                                             default="Skip to content&hellip;"/></a></button>
        <button type="button" class="btn btn-secondary"><a style="color: white; text-decoration: none" class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></button>
        <button type="button" class="btn btn-warning"><g:link style="color: white; text-decoration: none" class="create" action="create"><g:message code="default.new.label"
                                                                                                                                                    args="[entityName]"/></g:link></button>
    </div> <br> <br>
        <div id="show-annonce" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table class="table table-hover">
                <tbody>
                <tr>
                    <td>Title</td>
                    <td>${annonce.title}</td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td>${annonce.description}</td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td>${annonce.price}</td>
                </tr>
                <tr>
                    <td>Ref</td>
                    <td>${annonce.ref}</td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td>${annonce.status}</td>
                </tr>
                <tr>
                    <td>Illustrations</td>
                    <td>
                        <ul>
                        <g:each in="${annonce.illustrations}" var="illustration">
                            <li>
                                <g:img dir="images" file="${illustration.filename}" alt="illustration"/>
                            </li>
                        </g:each>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>Author</td>
                    <td><g:link controller="user" action="show" id="${annonce.author.id}">${annonce.author.username}</g:link></td>
                </tr>
                </tbody>
            </table>
            <br> <br>
            <g:form resource="${this.annonce}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="btn btn-warning" action="edit" resource="${this.annonce}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="btn btn-danger" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
