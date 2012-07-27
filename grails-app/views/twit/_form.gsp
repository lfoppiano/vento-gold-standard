<%@ page import="vento.reports.Twit" %>



<div class="fieldcontain ${hasErrors(bean: twitInstance, field: 'createdAt', 'error')} ">
	<label for="createdAt">
		<g:message code="twit.createdAt.label" default="Created At" />
		
	</label>
	<g:textField name="createdAt" value="${twitInstance?.createdAt}" />
</div>

<div class="fieldcontain ${hasErrors(bean: twitInstance, field: 'fromUser', 'error')} ">
	<label for="fromUser">
		<g:message code="twit.fromUser.label" default="From User" />
		
	</label>
	<g:textField name="fromUser" value="${twitInstance?.fromUser}" />
</div>

<div class="fieldcontain ${hasErrors(bean: twitInstance, field: 'fromUserIdStr', 'error')} ">
	<label for="fromUserIdStr">
		<g:message code="twit.fromUserIdStr.label" default="From User Id Str" />
		
	</label>
	<g:textField name="fromUserIdStr" value="${twitInstance?.fromUserIdStr}" />
</div>

<div class="fieldcontain ${hasErrors(bean: twitInstance, field: 'geo', 'error')} ">
	<label for="geo">
		<g:message code="twit.geo.label" default="Geo" />
		
	</label>
	<g:textField name="geo" value="${twitInstance?.geo}" />
</div>

<div class="fieldcontain ${hasErrors(bean: twitInstance, field: 'isoLanguageCode', 'error')} ">
	<label for="isoLanguageCode">
		<g:message code="twit.isoLanguageCode.label" default="Iso Language Code" />
		
	</label>
	<g:textField name="isoLanguageCode" value="${twitInstance?.isoLanguageCode}" />
</div>

<div class="fieldcontain ${hasErrors(bean: twitInstance, field: 'query', 'error')} ">
	<label for="query">
		<g:message code="twit.query.label" default="Query" />
		
	</label>
	<g:textField name="query" value="${twitInstance?.query}" />
</div>

<div class="fieldcontain ${hasErrors(bean: twitInstance, field: 'referenceScore', 'error')} ">
	<label for="referenceScore">
		<g:message code="twit.referenceScore.label" default="Reference Score" />
		
	</label>
	<g:textField name="referenceScore" value="${twitInstance?.referenceScore}" />
</div>

<div class="fieldcontain ${hasErrors(bean: twitInstance, field: 'score', 'error')} ">
	<label for="score">
		<g:message code="twit.score.label" default="Score" />
		
	</label>
	<g:textField name="score" value="${twitInstance?.score}" />
</div>

<div class="fieldcontain ${hasErrors(bean: twitInstance, field: 'source', 'error')} ">
	<label for="source">
		<g:message code="twit.source.label" default="Source" />
		
	</label>
	<g:textField name="source" value="${twitInstance?.source}" />
</div>

<div class="fieldcontain ${hasErrors(bean: twitInstance, field: 'text', 'error')} ">
	<label for="text">
		<g:message code="twit.text.label" default="Text" />
		
	</label>
	<g:textField name="text" value="${twitInstance?.text}" />
</div>

<div class="fieldcontain ${hasErrors(bean: twitInstance, field: 'toUserIdStr', 'error')} ">
	<label for="toUserIdStr">
		<g:message code="twit.toUserIdStr.label" default="To User Id Str" />
		
	</label>
	<g:textField name="toUserIdStr" value="${twitInstance?.toUserIdStr}" />
</div>

