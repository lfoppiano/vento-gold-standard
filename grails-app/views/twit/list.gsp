
<%@ page import="vento.reports.Twit" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'twit.label', default: 'Twit')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-twit" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-twit" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="query" title="${message(code: 'twit.query.label', default: 'Query')}" />
						<g:sortableColumn property="text" title="${message(code: 'twit.text.label', default: 'Text')}" />
						<g:sortableColumn property="score" title="${message(code: 'twit.score.label', default: 'Score')}" />
						<g:sortableColumn property="referenceScore" title="${message(code: 'twit.referenceScore.label', default: 'Reference Score')}" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${twitInstanceList}" status="i" var="twitInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td><g:link action="show" id="${twitInstance.id}">${fieldValue(bean: twitInstance, field: "query")}</g:link></td>
                        <td>${fieldValue(bean: twitInstance, field: "text")}</td>
                        <td>${fieldValue(bean: twitInstance, field: "score")}</td>
                        <td>${fieldValue(bean: twitInstance, field: "referenceScore")}</td>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${twitInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
