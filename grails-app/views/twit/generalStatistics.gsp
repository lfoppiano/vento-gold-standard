<%@ page import="vento.reports.Twit" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'twit.label', default: 'Twit')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>

    <jqDT:resources/>
    <g:javascript>
         $(document).ready(function() {
            $('#people').dataTable({
               sScrollY: '70%',
               bProcessing: true,
               bServerSide: true,
               sAjaxSource: '${request.contextPath + '/people/dataTablesData'}' ,
               sPaginationType: "full_numbers",
               aLengthMenu: [[100, 500, 1000, 5000, -1], [100, 500, 1000, 5000, "All"]],
               iDisplayLength: 500
            });
         });
    </g:javascript>

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
    <h1>Twitter general statistics</h1>

    <table>
        <tr>
            <td>Total ${totalElements}</td>
            <td>Total queries: ${totalQueries}</td>
        </tr>
    </table>



    %{--<table>
        <thead>
        <tr>
            <g:sortableColumn params="${params}" property="query"
                              title="${message(code: 'twit.query.label', default: 'Query')}"/>
            <g:sortableColumn params="${params}" property="totalElements"
                              title="${message(code: 'twit.text.label', default: 'Total')}"/>
            <g:sortableColumn params="${params}" property="totalPositive"
                              title="${message(code: 'twit.score.label', default: 'Positive')}"/>
            <g:sortableColumn params="${params}" property="totalNegative"
                              title="${message(code: 'twit.referenceScore.label', default: 'Negative')}"/>
            <g:sortableColumn params="${params}" property="totalNeutral"
                              title="${message(code: 'twit.score.label', default: 'Neutral')}"/>
            <g:sortableColumn params="${params}" property="totalRefMismatches"
                              title="${message(code: 'twit.score.label', default: 'Reference mismatches')}"/>
            <g:sortableColumn params="${params}" property="totalRefMatches"
                              title="${message(code: 'twit.score.label', default: 'Reference matches')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${statisticList}" status="i" var="row">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td>${fieldValue(bean: row, field: "query")}</td>
                <td>${fieldValue(bean: row, field: "totalElements")}</td>
                <td>${fieldValue(bean: row, field: "totalPositive")}</td>
                <td>${fieldValue(bean: row, field: "totalNegative")}</td>
                <td>${fieldValue(bean: row, field: "totalNeutral")}</td>
                <td>${fieldValue(bean: row, field: "totalRefMismatches")}</td>
                <td>${fieldValue(bean: row, field: "totalRefMatches")}</td>
            </tr>
        </g:each>
        </tbody>
    </table>--}%

    <div class="pagination">
        <g:paginate total="${statisticList.size()}" params="${params}"/>
    </div>
</div>
</body>
</html>
