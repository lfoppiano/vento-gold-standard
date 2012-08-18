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
            var query = '${params.query}';

            $('#twits').dataTable({
               sScrollY: '70%',
               bProcessing: true,
               bServerSide: true,
               sAjaxSource: '${request.contextPath + '/twit/data.json'}' ,
               "fnServerData": function ( sSource, aoData, fnCallback ) {
                    aoData.push( {name: 'query', value: query } );

                    $.getJSON( sSource, aoData, function (json) {
                        fnCallback(json);
                    });
                },
                /*
                    To be used when datatables plugin version > 1.8.2
                "fnServerParams": function ( aoData ) {
                    aoData.push( { name: 'query', value: query } );
                },*/
               sPaginationType: "full_numbers",
               aoColumns: [
                    /* Id */ {bSortable: false, bVisible: false},
                    /* Query */ null,
                    /* Text */  null,
                    /* Score */ null,
                    /* Ref SCore */ null,
                    /* Date */ null
               ]

            }).fnFilterOnReturn();
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
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <table id="twits">
        <thead>
        <tr>
            <th>Id</th>
            <th>Query</th>
            <th>Text</th>
            <th>Score</th>
            <th>Ref Score</th>
            <th>Date</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>
