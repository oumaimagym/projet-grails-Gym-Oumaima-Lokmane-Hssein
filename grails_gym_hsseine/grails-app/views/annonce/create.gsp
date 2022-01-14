<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="btn-group">
        <button type="button" class="btn btn-info"><a style="color: white; text-decoration: none" href="#create-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a></button>
        <button type="button" class="btn btn-secondary"><a style="color: white; text-decoration: none" class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></button>
        <button type="button" class="btn btn-warning"><g:link style="color: white; text-decoration: none" class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></button>

    </div>
    <br> <br>
    <div id="create-annonce" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.annonce}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.annonce}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.annonce}" method="POST" enctype="multipart/form-data">
                <fieldset class="form">
                    <input type="file" name="image">
                    <f:all bean="annonce"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="btn btn-success btn-block save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
