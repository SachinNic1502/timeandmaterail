
<%@page import="java.util.List" %>
<%@page import="com.liferay.sample.model.TimeAndMaterialTable"%>
<%@page import="com.liferay.sample.service.TimeAndMaterialTableLocalServiceUtil"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="p"%>
<style>
table{
border: 1px solid #E1ECF7;
border-radius: 5px;
}
      th{
        background: #E1ECF7;
      }
  #quotecall {
  background: none!important;
	color: #0af !important;
	border: none!important;
	padding: 0!important;
	font: inherit!important;
	cursor: pointer!important;
	outline: inherit!important;
  
  }    
</style>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-1.12.3.js"></script>
<%-- <p:renderURL var="Quoteform">
 		<p:param name="name" value="devkaran"></p:param>
		<p:param name="jspPage" value="/html/timeandmaterial/Quoteform.jsp"></p:param>
</p:renderURL> --%> 
<body>
<div></div>
     <% List<TimeAndMaterialTable> tablelist = TimeAndMaterialTableLocalServiceUtil.getTimeAndMaterialTables(-1,-1); %>
      
<table id="MyTable" class="display" cellspacing="0" width="100%">  
        <thead>  
            <tr>  
                <th >Quote Ref</th>  
                <th>Job Reference</th>  
                <th>Customer</th>  
                <th>Site Name</th>  
                <th>Project</th>  
                <th>Task</th>
                <th>Anticipated Date Order</th>
                <th>Receipt Date</th>
                <th>Type</th>
                <th>Action</th>
            </tr>  
        </thead>   
        <tbody>  
        <%for(TimeAndMaterialTable form : tablelist)
      {%>
            <tr>  
                <td><%=form.getQuoteno() %></td>  
                <td>-</td>  
                <td><%=form.getCustomer_name() %></td>  
                <td><%=form.getSiteName() %></td>  
                <td><%=form.getProject_Name()%>
                
                </td>  
                 
  					<%if(form.getFormname().equals("Quoteform"))
								{%>						
							<td>
								<p:renderURL var="submitQuote">
								 <p:param name="currentId" value="<%=String.valueOf(form.getFormId())%>"></p:param>
								<p:param name="jspPage" value="/html/tmdemo/Quoteform.jsp"></p:param>
							   </p:renderURL> 
							<a href="${submitQuote }">Submit  Quote</a></td>
							<%}  
					
  					else if(form.getFormname().equals("SubmitQuote"))
								{%>						
							<td>
								<p:renderURL var="submitQuote1">
								 <p:param name="currentId" value="<%=String.valueOf(form.getFormId())%>"></p:param>
								<p:param name="jspPage" value="/html/tmdemo/StatusofSubmittedQuote.jsp"></p:param>
							   </p:renderURL> 
							<a href="${submitQuote1 }">Submit  Quote</a></td>
							<%} 
  					else if(form.getFormname().equals("Quote"))
					{%>						
				<td>
					<p:renderURL var="submitQuo">
					 <p:param name="currentId" value="<%=String.valueOf(form.getFormId())%>"></p:param>
					<p:param name="jspPage" value="/html/tmdemo/StatusofSubmittedQuote.jsp"></p:param>
				   </p:renderURL> 
				<a href="${submitQuo }">Submit  Quote</a></td>
				<%} %> 
							
							
							
                <td><%=form.getAnticipateDate() %></td>  
                <td>-</td>  
                <td><img title="Time &amp; Material" src="https://rcc-test.econsys.io/ace-theme/images/icons/t-and-m-icon.png"></td>  
                <td><%=form.getFormId() %></td>  
            </tr> 
            <%} %>             
        </tbody>  
    </table>  
    </body>	
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.3.js"></script>  
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<script>
$(document).ready(function() {  
    $('#MyTable').DataTable( {  
        initComplete: function () {  
            this.api().columns().every( function () {  
                var column = this;  
                var select = $('<select><option value=""></option></select>')  
                    .appendTo( $(column.footer()).empty() )  
                    .on( 'change', function () {  
                        var val = $.fn.dataTable.util.escapeRegex(  
                            $(this).val()  
                        );  
                //to select and search from grid  
                        column  
                            .search( val ? '^'+val+'$' : '', true, false )  
                            .draw();  
                    } );  
   
                column.data().unique().sort().each( function ( d, j ) {  
                    select.append( '<option value="'+d+'">'+d+'</option>' )  
                } );  
            } );  
        }  ,
    scrollY: '50vh',
    scrollCollapse: true
    } );  
} ); 
</script>
