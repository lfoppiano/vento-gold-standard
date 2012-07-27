
<%@ page import="vento.reports.Twit" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'twit.label', default: 'Twit')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-twit" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-twit" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list twit">
			
				<g:if test="${twitInstance?.createdAt}">
				<li class="fieldcontain">
					<span id="createdAt-label" class="property-label"><g:message code="twit.createdAt.label" default="Created At" /></span>
					
						<span class="property-value" aria-labelledby="createdAt-label"><g:fieldValue bean="${twitInstance}" field="createdAt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitInstance?.fromUser}">
				<li class="fieldcontain">
					<span id="fromUser-label" class="property-label"><g:message code="twit.fromUser.label" default="From User" /></span>
					
						<span class="property-value" aria-labelledby="fromUser-label"><g:fieldValue bean="${twitInstance}" field="fromUser"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitInstance?.fromUserIdStr}">
				<li class="fieldcontain">
					<span id="fromUserIdStr-label" class="property-label"><g:message code="twit.fromUserIdStr.label" default="From User Id Str" /></span>
					
						<span class="property-value" aria-labelledby="fromUserIdStr-label"><g:fieldValue bean="${twitInstance}" field="fromUserIdStr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitInstance?.geo}">
				<li class="fieldcontain">
					<span id="geo-label" class="property-label"><g:message code="twit.geo.label" default="Geo" /></span>
					
						<span class="property-value" aria-labelledby="geo-label"><g:fieldValue bean="${twitInstance}" field="geo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitInstance?.isoLanguageCode}">
				<li class="fieldcontain">
					<span id="isoLanguageCode-label" class="property-label"><g:message code="twit.isoLanguageCode.label" default="Iso Language Code" /></span>
					
						<span class="property-value" aria-labelledby="isoLanguageCode-label"><g:fieldValue bean="${twitInstance}" field="isoLanguageCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitInstance?.query}">
				<li class="fieldcontain">
					<span id="query-label" class="property-label"><g:message code="twit.query.label" default="Query" /></span>
					
						<span class="property-value" aria-labelledby="query-label"><g:fieldValue bean="${twitInstance}" field="query"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitInstance?.referenceScore}">
				<li class="fieldcontain">
					<span id="referenceScore-label" class="property-label"><g:message code="twit.referenceScore.label" default="Reference Score" /></span>
					
						<span class="property-value" aria-labelledby="referenceScore-label"><g:fieldValue bean="${twitInstance}" field="referenceScore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitInstance?.score}">
				<li class="fieldcontain">
					<span id="score-label" class="property-label"><g:message code="twit.score.label" default="Score" /></span>
					
						<span class="property-value" aria-labelledby="score-label"><g:fieldValue bean="${twitInstance}" field="score"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitInstance?.source}">
				<li class="fieldcontain">
					<span id="source-label" class="property-label"><g:message code="twit.source.label" default="Source" /></span>
					
						<span class="property-value" aria-labelledby="source-label"><g:fieldValue bean="${twitInstance}" field="source"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitInstance?.text}">
				<li class="fieldcontain">
					<span id="text-label" class="property-label"><g:message code="twit.text.label" default="Text" /></span>
					
						<span class="property-value" aria-labelledby="text-label"><g:fieldValue bean="${twitInstance}" field="text"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${twitInstance?.toUserIdStr}">
				<li class="fieldcontain">
					<span id="toUserIdStr-label" class="property-label"><g:message code="twit.toUserIdStr.label" default="To User Id Str" /></span>
					
						<span class="property-value" aria-labelledby="toUserIdStr-label"><g:fieldValue bean="${twitInstance}" field="toUserIdStr"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${twitInstance?.id}" />
					<g:link class="edit" action="edit" id="${twitInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
