<%@ page import="vento.reports.Twit" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'twit.label', default: 'Twit')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>

    <jqDT:resources/>
    <g:javascript>
        var oTable;
        var selected =  new Array();

         $(document).ready(function() {

            var query = '${params.query}';

            oTable = $('#twits').dataTable({
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
                    /* Text */  null, //{"sClass": "editable" },     //to be fixed also how the controller handle the update, by defaul assume that the 'value' is the score...
                    /* Score */ {"sClass": "editable" },
                    /* Ref SCore */ {bVisible: false},
                    /* Date */ null
               ],

               "fnRowCallback": function( nRow, aData, iDisplayIndex ) {
                    $('#twits tbody tr').each( function () {
                        if (jQuery.inArray(aData[0], selected)!=-1) {
                            $(this).addClass('row_selected');
                        }
                    });
                    return nRow;
                },

                "fnDrawCallback": function ( oSettings ) {

                    //edit of cells
                    $('td.editable').editable(
                        '${request.contextPath + '/twit/update'}',
                        {

                        "callback": function( sValue, y ) {
                            //false to disable the resorting of the table
                            oTable.fnDraw(false);
                        },
                        "submitdata": function ( value, settings ) {
                            //console.log(oTable.fnGetPosition(this))
                            return {
                                "id": oTable.fnGetData(this.parentNode)[0],
				                "column": oTable.fnGetPosition( this )[2]
                            };
                        },
                        "height": "14px"
                    } );

                    //select of cells
                    $('#twits tbody tr').each( function () {
                        var iPos = oTable.fnGetPosition( this );
                        if (iPos!=null) {
                            var aData = oTable.fnGetData( iPos );
                            if (jQuery.inArray(aData[0], selected)!=-1)
                                $(this).addClass('row_selected');
                        }
                        $(this).click( function () {
                            var iPos = oTable.fnGetPosition( this );
                            var aData = oTable.fnGetData( iPos );
                            var iId = aData[0];
                            is_in_array = jQuery.inArray(iId, selected);
                            if (is_in_array==-1) {
                                selected[selected.length]=iId;
                            }
                            else {
                                selected = jQuery.grep(selected, function(value) {
                                    return value != iId;
                                });
                            }
                            if ( $(this).hasClass('row_selected') ) {
                                $(this).removeClass('row_selected');
                            }
                            else {
                                $(this).addClass('row_selected');
                            }
                        });
                    });
                }

            }).fnFilterOnReturn();

            $('#toTestDataButton').live('click', function() {

                var parameters = {
                    'id[]': [selected]
                    //'twits': selected

                }
                $.post('${createLink(controller: 'twit', action: 'testData')}', parameters , function(data, status) {
                    var result = $(data)
                }).success(function(){
                    console.log("successs")
                    selected = new Array()
                    oTable.fnDraw(false)
                });
            });

            $('#toTrainingDataButton').live('click', function() {

                var parameters = {
                    'id[]': [selected]
                    //'twits': selected

                }
                $.post('${createLink(controller: 'twit', action: 'testData')}', parameters , function(data, status) {
                    var result = $(data)
                }).success(function(){
                    selected = new Array()
                    oTable.fnDraw(false)
                });
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
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <fieldset class="buttons">
        <g:submitButton id="toTrainingDataButton" name="toTrainingDataButton" class="save"
                        value="${message(code: 'default.button.toTraining.label', default: 'Send to training data')}"/>
        <g:submitButton id="toTestDataButton" name="toTestDataButton" class="save"
                        value="${message(code: 'default.button.toTest.label', default: 'Send to test data')}"/>
    </fieldset>

    <table id="twits">
        <thead>
        <tr>
            <th>id</th>
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
