<%@ page import="vento.reports.Twit" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'twit.label', default: 'Twit')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-twit" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-twit" class="content scaffold-list" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>


    <table>
        <tbody>
        <tr>
            <td>
                <g:link action="list">show all the entries</g:link>
            </td>
        </tr>
        <tr>
        <g:each in="${twitQueryList}" status="i" var="twitQuery">
            <td class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <g:link action="list" params="[query: twitQuery]">${twitQuery}</g:link>
            </td>
        %{--When I have 5 elements I create a new row--}%
            <g:if test="${((i + 1) % 5) == 0}">
                </tr>
                <tr>
            </g:if>
        </g:each>
        </tr>
        </tbody>
    </table>

</div>
</body>
</html>
