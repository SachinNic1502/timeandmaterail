
<%@page import="com.liferay.portal.kernel.portlet.LiferayWindowState"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="p" %>
<%@page import="javax.portlet.PortletURL"%>
 
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<%@page import="java.util.List" %>
<%@page import="com.liferay.sample.model.TimeAndMaterialTable"%>
<%@page import="com.liferay.sample.service.TimeAndMaterialTableLocalServiceUtil"%>


<%-- <portlet:actionURL var="Quoteform" name="QuoteformSample"></portlet:actionURL> --%>
<portlet:actionURL var="Quoteform" name="Quoteform"/>
<p:renderURL var="homepage">
 		<p:param name="name" value="devkaran"></p:param>
		<p:param name="jspPage" value="/html/timeandmaterial/homepage.jsp"></p:param>
		</p:renderURL> 
<head>
 <script src="https://unpkg.com/dropzone@6.0.0-beta.1/dist/dropzone-min.js"></script>
        <link href="https://unpkg.com/dropzone@6.0.0-beta.1/dist/dropzone.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<style>
.a *{
font-size:14px;
font-family:'Segoe UI' !important;
}
.t1{
    margin:0 0 0 60px;
     width:90%;
}
.t1 tbody{

    border-color: inherit;
}
.t1 tr td {
	vertical-align: baseline;
	width:fit-content;
    margin-top:10px;
    padding-top:10px;
}
td{
vertical-align: baseline;
}

.desc {
	text-align: end;
	
 padding-right: 15px !important;
}


.ta {
	/* resize:none; */
}
.aui .ta{
 width: 75%;
 height: 50px; 
}


.t3 td{
padding-top: 10px;
  padding-bottom: 10px;
}
.bi-chat-dots{
margin-left:2px;
cursor:pointer;
}
.text{
color: #478fca;
}

  .t1{
border-collapse: separate;
  border-spacing: 50px 0;
}
 .t1 td{
  padding: 10px 0;
 /*  background: #ccc;  */
}  

.t4 th,td{
 text-align:start;
 vertical-align:center;
}
.t4 td{
padding:10px 0;

}






   .drop {
     width:96%;

      overflow: hidden;
    position: relative;
      font-family: "Open Sans", sans-serif;
      font-weight: 300;
      /* background: #f3f4f5; */
      color: #646c7f;
      text-rendering: optimizeLegibility;
     display: flex;
     justify-content:space-between;
    flex-direction: row;
    align-items: center;
      border: 1px solid gray;
      padding:0 5px;
    }
    
    .drop .items1{
      width:45%;
      margin: 15px 20px;
      padding:2px;
      display:flex;
      flex-direction: column;
      overflow-y:wrap;
      overflow-x:hidden;
    }
    .items2{
    width:55%;
    }
    .frm1{
     border-top:none;
      border-bottom:none;
      border-radius:none !important;
    }
    .drop .cntrl{
    /*   border:1px solid black; */
     
      width:70%;  
      display:flex;
      justify-content:center;
      text-align:center;
    }
    
    .browsebtn{
        background:#fff;
        text-align:center;
        color:#146da9;
         border:1px solid #146da9; 
        border-radius:5px;
        font-weight:bold;
        font-size:20px;
        padding:5px;
        cursor:pointer;
    }
   .drop #btns{
        display:flex;
        flex-direction:column;
       
        margin:0 10px;
    }
    
    .dz-filename{
		    overflow: hidden;
		    white-space: nowrap;
		    text-overflow: ellipsis;
		    max-width: 85%;
    }
    .dz-message{
        height:100%;
       
        margin-top:0px !important;
        
    }
</style>
<script>
$(document).ready(function() {
	var todayDate = new Date(Date.now()).toLocaleString().split(',')[0];
	/* alert("Date"+new Date(Date.now()).toLocaleString().split(',')[0]); */
	  
      $("#qso").val();
	  //1 date field
	  $("#qso").datepicker({dateFormat: 'dd/mm/yy',numberOfMonths: 3, showCurrentAtPos:0,minDate: 0});
  	  	$('#calender').click(function() {
  	  
  	    $("#qso").focus();
  	  	});
      
});

	
	<%-- 
	 function seterror(tagname,errormsg) {
           tagname.style.border="1px solid red";
       /*   alert(tagname.parentElement); */
         /* tagname.parentElement.parentElement.querySelector(".desc").style.color="red"; */
          /*  tagname.focus();
           alert(errormsg);
            setTimeout(function(){
          	 tagname.style.border="";
          	}, 3000);  */
		/* tagname.querySelector('.error').innerHTML=errormsg; */
		
     }
	 
	 function removeError(tagname){
		 tagname.style.border="1px solid #cbcbcb";
	 }
	
	 function validate(){
			/* var date = document.getElementById("<portlet:namespace/>demo").value; */
		  event.preventDefault();
		validQuoteNo=true;
		ValidProjectName=true;
		validCustomer=true;
		validcAddress=true;
		 validpCode = true;
		validsmType=true;
		validsName=true;
		validProductSpec=true;
		validLocation=true;
		validWorkDesc=true;
		validEndUser=true;
		
		validConName=true;
		validMobile=true;
		validEmail=true;
		
		validBidStartDate=true;
		validpStartDate=true;
		validpEndDate=true;
		validAODate=true;
		
		validQuote=true;
		validProjectCost=true;
		validDate=true;
		validProjectsell=true;
		validTimeDuration=true;
		returval=true;
		var todayDate =new Date(Date.now()).toLocaleString().split(',')[0];
				var quoteNo = document.forms["<portlet:namespace/>myfrm"]["<portlet:namespace/>qrn"];
				 var projectName=document.getElementById("pname");
				 var customer=document.getElementById("cname");
				    var cAddress=document.getElementById("cadd");
				    var pCode=document.getElementById("pcode");
				    
				    var chek1=document.forms["<portlet:namespace/>myfrm"]["<portlet:namespace/>chek1"];
				    var smType=document.getElementById("smType");
				    var sName=document.getElementById("sna");
				    var lsName=document.getElementById("ls");
				    var lsData=document.getElementById("lscd");
				    var pType=document.getElementById("ptype");
				    var loc=document.getElementById("loc");
				    var wDesc=document.getElementById("pds");
				    var eUser=document.getElementById("una");
				    
				    var conName=document.forms["<portlet:namespace/>myfrm"]["<portlet:namespace/>conName"];
				    var phNO=document.forms["<portlet:namespace/>myfrm"]["<portlet:namespace/>ph"];
				    var mail=document.forms["<portlet:namespace/>myfrm"]["<portlet:namespace/>email"];
			    
				    var bidStart=document.getElementById("bidP");
					   /*  var bid=document.forms["<portlet:namespace/>myfrm"]["<portlet:namespace/>bidSp"]; */
					    var ppStart=document.getElementById("pp1");
					    
					    var ppEnd=document.getElementById("pp2");
					    var ppDuration=document.getElementById("pp3");
					   
					    var aoDate=document.getElementById("aod"); 
					    
			   
			     
			    
				  var qof=document.getElementById("qof");
				 var opc=document.getElementById("opc");
				 var dsq=document.getElementById("dsq");
				 var ops=document.getElementById("ops");
		         var comments=document.getElementById("comments");
		          var rea=document.getElementById("<portlet:namespace/>rea");
		          if( quoteNo.value=="" || quoteNo.value==null){
				    	/*  alert("enter number only.."); */ 
				    	  seterror(quoteNo,"Enter valid Quote Ref Number");
				    	 returnval = false;
				    	 validQuoteNo = false;
				     }else{
				    	 removeError(quoteNo);
				     }
				      if(!(isNaN(projectName.value)) || projectName.value=="" || projectName.value==null ){
					    	/*  alert("enter number only.."); */	 
					    	 seterror(projectName,"Enter Valid Project Name");
					    	 returnval = false;
					    	 ValidProjectName = false;
					     }else{
					    	 removeError(projectName);
					     }
				       if(!(isNaN(customer.value))|| customer.value=="" || customer.value==null){
				    	  seterror(customer,"Enter Valid Customer Name");
					    	 returnval = false;
				    	  validCustomer = false;
				      }else{
					    	 removeError(customer);
					     }
				       if(cAddress.value=="" || cAddress.value==null || !(isNaN(cAddress.value))){
				    	  seterror(cAddress,"Enter Customer Address Valid Address");
					    	 returnval = false;
				    	  validcAddress = false;
				      }else{
					    	 removeError(cAddress);
					     }
				      if(pCode.value==null || pCode.value=="" || !(pCode.value.match('^([A-Z][A-HJ-Y]?[0-9][A-Z0-9]? ?[0-9][A-Z]{2}|GIR ?0A{2})$'))){
				    	  seterror(pCode,"Enter Valid pinCode of 6 digits");
					    	 returnval = false;
					    	 validpCode = false;
				      }else{
					    	 removeError(pCode);
					     }
				      if(smType.value=="select"){
				    	  seterror(smType,"Choose Valid Option in Small Work Type");
					    	 returnval = false;
				    	  validsmType = false;
				      }else{
					    	 removeError(smType);
					     }
				       if(sName.value=="" || sName.value==null || !(isNaN(sName.value))==true){
				    	  seterror(sName,"Enter Valid Small Work Name");
					    	 returnval = false;
				    	  validsName = false;
				      }else{
					    	 removeError(sName);
					     }
				       if(pType.value=="select" || pType.value=="" || pType.value==null){
				    	  console.log("pstype:"+pType.value);
				    	  seterror(pType,"Choose Valid Option in ProductSpecification Field");
					    	 returnval = false;
				    	  validProductSpec = false;
				      }else{
					    	 removeError(pType);
					     }
				       if(loc.value=="select"){
				    	  console.log("loctype:"+loc.value);
				    	  seterror(loc,"Choose Valid Location");
					    	 returnval = false;
				    	  validLocation= false;
				      }else{
					    	 removeError(loc);
					     }
				      if(wDesc.value=="" || wDesc.value==null || !(isNaN(wDesc.value))){
				    	  seterror(wDesc,"Enter Valid Work Description");
					    	 returnval = false;
				    	  validWorkDesc = false;
				      }else{
					    	 removeError(wDesc);
					     }
				      if(eUser.value=="" || eUser.value==null || !(isNaN(eUser.value))){
				    	  seterror(eUser,"Enter Valid End User Name");
					    	 returnval = false;
				    	  validEndUser = false;
				      }else{
					    	 removeError(eUser);
					     }
				      
				      
				      /* contactDetails Validation */
				      if(conName.value=="" || conName.value==null || !(conName.value.match(/^[A-Za-z\s]+$/)) ){
				    	  console.log("nsme:"+conName.value);
				    	  seterror(conName,"Enter Valid Conatact Name");
					    	 returnval = false;
				    	  validConName = false;
				      }else{
					    	 removeError(conName);
					     }
				      if(phNO.value=="" || phNO.value==null || !(phNO.value.match(/^[6789][0-9]{9}$/))){
				    	  console.log(phNO.value)
				    	  seterror(phNO,"Enter valid phone Number");
				    	  returnval = false;
				    	  validMobile = false;
				      } else{
				    	  removeError(phNO);
				      }
				     if(mail.value=="" || mail.value==null || !(mail.value.match(/^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/))){
				    	  seterror(mail,"Enter valid Email");
				    	  returnval = false;
				    	  validEmail = false;
				      } else{
					    	 removeError(mail);
					     }
				      
				      if(bidStart.value=="" ||  bidStart.value==null){
				    	 console.log("date:"+bidStart.value);
				    	  seterror(bidStart,"Choose valid Bid Start date");
				    	  returnval = false;
				    	  validBidStartDate=false;
				      }else{
					    	 removeError(bidStart);
					     }
				     if(bidStart.value<todayDate){
				    	  seterror(bidStart," Bid Start Date Connot be Before than Today's Date");
				    	  returnval = false;
				    	  validBidStartDate=false;
				      }else{
					    	 removeError(bidStart);
					     }
				      if( ppStart.value=="" ||  ppStart.value==null){
				    	  seterror(ppStart,"Choose valid Project Start Date date");
				    	  returnval = false;
				    	  validpStartDate=false;
				      }else{
					    	 removeError(ppStart);
					     }
				      if(ppStart.value<todayDate){
				    	  seterror(ppStart," Project Start Date Connot be Before than Today's Date");
				    	  returnval = false;
				    	  validpStartDate=false;
				    	  
				      }else{
					    	 removeError(ppStart);
					     }
				       if( ppEnd.value=="" ||  ppEnd.value==null){
				    	  seterror(ppEnd,"Choose valid Project End date");
				    	  returnval = false;
				    	  validpEndDate=false;
				      }else{
					    	 removeError(ppEnd);
					     }
				       if(ppDuration.value=="" || ppDuration.value==null || ppDuration.value<0){
				    	  seterror(ppDuration,"Choose valid Date Ranges of Project Start-End");
				    	  returnval = false;
				    	  validTimeDuration=false;
				      }else{
					    	 removeError(ppDuration);
					     }
				      if( aoDate.value=="" ||  aoDate.value==null){
				    	  seterror(aoDate,"Choose valid Anticipated Order Date");
				    	  returnval = false;
				    	  validAODate=false;
				      }else{
					    	 removeError(aoDate);
					     }
				       if(aoDate.value<todayDate){
				    	  seterror(aoDate,"Anticipated Order Date Connot be Before than Today's Date");
				    	  returnval = false;
				    	  validAODate=false;
				      }else{
					    	 removeError(aoDate);
					     }

				       if(qof.value==="select"){
				    	  seterror(qof,"Please Specify Valid option in Quote Format");
				    	  returnval = false;
				    	  validQuote=false;
				      }else{
					    	 removeError(qof);
					     }
				       if(opc.value=="" || opc.value==null || isNaN(opc.value) || opc.value<0){
				    	  seterror(opc,"enter valid Project Cost Amount");
				    	  returnval = false;
				    	  validProjectCost=false;
				      }else{
					    	 removeError(opc);
					     }
				       if(dsq.value=="" || dsq==null){
				    	  seterror(dsq,"Choose valid Option in Date shown Quote field");
				    	  returnval = false;
				    	  validDate=false;
				      }else{
					    	 removeError(dsq);
					     }
				      if(ops.value=="" || ops.value==null || ops.value<0){
				    	  seterror(ops,"enter valid Project Sell Amount");
				    	  returnval = false;
				    	  validProjectsell=false;
				      }else{
					    	 removeError(ops);
					     }
				      
				       if(validQuoteNo==true && ValidProjectName==true && validCustomer==true && validcAddress==true && validpCode==true && validsmType==true && validsName==true && validProductSpec==true && validLocation==true && validWorkDesc==true && validEndUser==true && validConName==true && validMobile==true && validEmail==true && validBidStartDate==true && validpStartDate==true && validpEndDate==true && validTimeDuration==true && validAODate==true && validQuote==true && validProjectCost==true && validDate==true && validProjectsell==true){
	 					 
	 					  
	 					 AUI().use('aui-io-request', function(A){
	 						A.io.request('<%=Quoteform.toString()%>', {
	 						    method: 'post',
	 						    data:{
	 						    	"demo":2213,
	 						    	"qno":quoteNo.value,
	 						    	"pname":projectName.value,
	 						    	"cname":customer.value,
	 						    	"caddr":cAddress.value,
	 						    	"pcode":pCode.value,
	 						    	
	 						    	 "ch1":chek1.value,
	 						    	 "smType":smType.value,
	 						    	"sName":sName.value,
	 						    	"lsname":lsName.value,
	 						    	"lsData":lsData.value,
	 						    	
	 						    	"pType":pType.value,
	 						    	"loc":loc.value,
	 						    	"pdesc":wDesc.value,
	 						    	"eUser":eUser.value,
	 						    	
	 						    	"contactName":conName.value,
	 						    	"phNum":phNO.value,
	 						    	"mail":mail.value,
	 						    	 
	 						       "biStart":bidStart.value, 
	 						    	"ppStart":ppStart.value,
	 						    	"ppEnd":ppEnd.value,
	 						    	"ppDuration":ppDuration.value,
	 						    	"aod":aoDate.value,
	 						    	
	 						    	 "qof":qof.value,
	 						    	"opc":opc.value,
	 						    	"dsq":dsq.value,
	 						    	"ops":ops.value,
	 						    	"comments":comments.value,
	 						    	"rea":rea.value
	 						 
	 						    },
	 						   
	 						    on : {
	 						    success: function() {
	 						    alert("success");
	 						   /*  alert("date:"+bidStart.value+"-"+ppStart.value); */
/* 	 						    console.log("date:"+bidStart.value+"-"+ppStart.value); */
	 						    window.location.reload();
	 						    },
	 						    error: function () {
	 			                      alert("Unable to  order...pls try agian After Some time");
	 			               	      }
	 						    }
	 						    });
	 						    }); 
	 			      
						  
	 				  }else{
	 					  returnval=false;
	 					  event.preventDefault();
	 					 alert("Please fix the errors which are marked in red");
	 					  /* alert("Enter valid Data in Below Red bodered Fields...") */
	 				  }
				    	 
		
		
		  };
		
		  
		   --%>
		  
		  
		  
		
</script>
</head>
<body>
<%-- <% List<TimeAndMaterialTable> tablelist = TimeAndMaterialTableLocalServiceUtil.getTimeAndMaterialTables(-1,-1);
int numRecords = tablelist.size()-1;


	TimeAndMaterialTable tam = tablelist.get(numRecords);

%> --%>
<%
int id=Integer.parseInt( request.getParameter("currentId"));
TimeAndMaterialTable tam=TimeAndMaterialTableLocalServiceUtil.getTimeAndMaterialTable(id);
String cname=tam.getFormname();
%>
 <div class="container-fluid a" >
			<aui:form id="fm" name="fm" >
 <liferay-ui:panel-container id="panel-container-1" extended="true"
		accordion="true">
		<liferay-ui:panel id="panel-c1" title="Quote Form" collapsible="true" extended="true" >

	
					<liferay-ui:panel id="panel-c2" title="Project Info"
						collapsible="true" extended="true">
						 
						<table class="t1">
				
							<tr>
							 <!-- <sub  class='far'>&#xf4ad;</sub> -->
								<td class="desc">Requester Name<b style="color:red">*</b></td>
								<td><lable><%=tam.getCustomer_name() %></lable>
								
								</td>
								<td></td>
								<td></td>
								<td ></td>
								<td class="desc" style="margin-right:350px">Request Date
													<b style="color:red">*</b></td>
								<td><lable>27/03/2023</lable> <i class="bi bi-chat-dots"></i></td>
							</tr>
							<tr>
								<td class="desc">Project Name<b style="color:red">*</b></td>

								<td colspan="2"><%=tam.getProject_Name() %></td>
								<td></td>
								<td > <input type="text" name="formId"  id="formId"  value="<%=request.getParameter("currentId") %>"/></td>
								
								<td class="desc">Customer<b style="color:red">*</b></td>
								<td><input type="text" name="pcode"  id="pcode" disabled="disabled" value="<%=tam.getCustomer_name() %>"/>
								
								<i class="bi bi-chat-dots"></i></td>
							</tr>
							
							<tr>
								<td class="desc">Customer Address</td>
								<td colspan="2">
								<textarea rows="3" cols="4" readonly><%=tam.getCustomerAddress() %></textarea>
								</td>
								<td></td>
								<td ></td>
								<td class="desc">Postal Code<b style="color:red">*</b></td>
								<td><input type="text" name="pcode"  id="pcode" disabled="disabled" value="<%=tam.getPincode() %>"/><i class="bi bi-chat-dots"></i></td>
							</tr>
							
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td ></td>
								<td class="desc">Time & Material<b style="color:red">*</b></td>
								<td>
									<input type="text" name="" disabled="disabled" value="<%=tam.getWorktype() %>"/>
									</td>
							</tr>
							<tr>
								<td class="desc">Site Name</td>
								<td><input type="text" value="<%=tam.getSiteName() %>" disabled="disabled"> <i class="bi bi-chat-dots"></i></td>
								<td></td>
								<td></td>
								<td></td>
								<td class="desc">Product Specified</td>
								<td>
								<input type="text" value="<%=tam.getProduct() %>" disabled="disabled">
								<i class="bi bi-chat-dots"></i></td>
							</tr>
							<tr>
								<td class="desc">Lead Source</td>
								<td>
								<input type="text" value="<%=tam.getLeadsource() %>" disabled="disabled">
								<%-- <select name="<portlet:namespace/>ptype"  id="ptype">
										<option disabled selected value="select">Select</option>
										<option value="Trend">Trend</option>
										<option value="Centra Line">Centra Line</option>
										<option value="Tyrrell">Tyrrell</option>
										<option value="Schneider">Schneider</option>
										<option value="Delta">Delta</option>
										<option value="ALC(Automated Logic)">ALC(Automated Logic)</option>
										<option value="Open">Open</option>
										<option value="Tridium">Tridium</option>
										<option value="North">North</option>
										<option value="Easy i/o">Easy i/o</option>
								</select> --%><i class="bi bi-chat-dots"></i></td>
								<td></td>
								<td></td>
								<td></td>
								<td class="desc">Lead Source Contextual Data<b style="color:red">*</b></td>
								<td>
								<textarea
										name="pds" class="ta"  id="pds" readonly><%=tam.getLeaddata() %></textarea>
								<i class="bi bi-chat-dots"></i></td>
							</tr>
							<tr>
								<td class="desc">Description of Works<b style="color:red">*</b></td>
								<td colspan="2"><textarea
										name="pds" class="ta"  id="pds" readonly><%=tam.getDescOfWork() %></textarea><i class="bi bi-chat-dots"></i></td>
								<td></td>
								<td></td>
								<td class="desc">End User<b style="color:red">*</b></td>
								<td><input type="text" name="una"  id="una" value="<%=tam.getEndUser() %>" disabled="disabled"/><i class="bi bi-chat-dots"></i></td>
							</tr>
						</table>


						<fieldset style="border:1px solid #cbcbcb;width:96%;margin:0 auto;">
						
							<legend style="width: fit-content; margin: 9px; border: none;color: #478fca">Contact
								Details</legend>
							<div class="" >
								<aui:column columnWidth="70" first="true">
								
																		<table class="" style="margin:0 0 0 130px;">
										<tr>
											<td class="desc">Contact Name<b style="color:red">*</b></td>
											<td><input name="conName"  type="text" value="<%=tam.getContactName() %>" id="conName"
													readonly/></td>
										</tr>
										<tr>
											<td class="desc">Phone<b style="color:red">*</b></td>
											<td><input name="ph" type="text" id="ph" value="<%=tam.getPhone() %>" maxlength="10" readonly></input></td>
										</tr>
									</table>

								</aui:column>

								<aui:column columnWidth="30" first="true" class="second" >
								
									<aui:input inlineLabel="true" name="email" id="email" value="<%=tam.getEmail() %>" disabled="true" label='Email<span style="color:red">*</span>' />
							
								</aui:column>
							</div>
							
						</fieldset>

						<div style="display: flex; width: 100%;">
							<fieldset
								style="border: 1px solid #cbcbcb; width: 100%; margin-right: 5px; padding: 0 30px;">
								<legend
									style="width: fit-content; margin: 9px; border: none; color: #478fca">Estimated</legend>
								<div style="margin: 12px;">
									<table style="padding: 0 120px" class="t4">
										<thead>
											<tr>
												<th></th>
												<th>Start Date</th>
												<th style="padding: 0 50px;">End Date</th>
												<th>Weeks</th>
											</tr>
										</thead>
										<tbody>
										
											<tr>
												<td class="desc">Bid Programme<b style="color: red">*</b></td>
												<td></td>
												<td style="padding: 0 50px;"><input type="text"
													name="bidP" class="dt input-mini" id="bidP"
													autocomplete="off" value="<%=tam.getBidEnd() %>" disabled="true"/><!-- <span id="calender"
													style="cursor: pointer">&#128197;</span> --></td>
												<td></td>
											</tr>
											<tr>
												<td class="desc">Project Programme<b style="color: red">*</b></td>
												<td><input type="text" name="pp1" id="pp1"	class="dt input-mini" value="<%=tam.getProjStart() %>" disabled="true"/>
													<!-- <span id="2" style="cursor: pointer">&#128197;</span >--></td>
												<td style="padding: 0 50px;"><input type="text"
													name="pp2" id="pp2" class="dt input-mini" value="<%=tam.getProjEnd() %>"
													 disabled="true"/><!-- <span id="3"
													style="cursor: pointer">&#128197;</span> --></td>
												<td><input name="pp3" type="text" id="pp3"
													style="width: 30px" readonly /><i class="bi bi-chat-dots"></i>
												</td>
											</tr>
											<tr>
												<td class="desc">Anticipated Order Date<b
													style="color: red">*</b></td>
												<td><label><%=tam.getAnticipateDate() %></label> </td>
												<td style="padding: 0 50px;"></td>
												<td></td>
											</tr>
											
										</tbody>
									</table>
								</div>
							</fieldset>

							
						</div>


					</liferay-ui:panel>
					<liferay-ui:panel id="panel-c3" title="Quote Info"
						collapsible="true" extended="true">
						
									<table style="width:100%;" class="t3">
									<tbody style="">
								<tr>
									<td width="19%" style="text-align: end;padding-right: 15px">Quotation on Our Format<b style="color:red">*</b></td>
									<td width="26%">
											<lable>Yes</lable>
									</select></td>
									<td width="16%" style="text-align: end;padding-right: 15px">Quote Reference Number<b style="color:red">*</b></td>
									<td><lable>QS08649</lable></td>
								</tr>
								<tr >
									<td width="19%" style="text-align: end;padding-right: 15px">OverAll Project Cost(<span>&#163;</span>)<b style="color:red">*</b></td>
									<td width="26%">
									<lable>400</lable>
									</td>
									<td width="16%" style="text-align: end;padding-right: 15px">OverAll Project Sell(<span>&#163;</span>)<b style="color:red">*</b></td>
									<td>
										<lable>400</lable>
									</td>
								</tr>
                                 </tbody>
							</table>
							
                            
					</liferay-ui:panel>
				
				

		</liferay-ui:panel>
	</liferay-ui:panel-container>
	<liferay-ui:panel id="panel-c4" title="Submit Form" collapsible="true"
			extended="true" >
			<table class="" style="margin:0 0 0 130px;">
										<tr>
											<td class="desc">Quote Submitted On<b style="color:red">*</b></td>
											<td><input type="text"
													name="qso" class="dt" id="qso"
													autocomplete="off" /><span id="calender"
													style="cursor: pointer">&#128197;</span></td>
										</tr>
										<tr>
											<td class="desc">% Win Probability<b style="color:red">*</b></td>
											<td><aui:input name="winp" label="" type="text" id="winp" ></aui:input></td>
										</tr>
									</table>

	
					
	</liferay-ui:panel>
	<liferay-ui:panel id="panel-c5" title="Comments History" collapsible="true"
			extended="true" >
			

	
					
	</liferay-ui:panel>
	
				<div style="display: grid; float: right; text-align: end;">
					
					<div>

						<aui:button-row>
							<aui:button cssClass="btn btn-primary" type="button"
								id="mySubButton" onclick="generate()" name="saveButton" value="save" />
							<aui:button cssClass="btn btn-warning" id="Button1" type="button" onclick=" window.location.reload()" value="Reset" />
							 <%-- <aui:button cssClass="btn btn-success" id="submitBtn" type="submit" value="Submit" onclick="validate()"/>  --%>
							<aui:button cssClass="btn btn-success" id="submitBtn" type="submit" value="Submit" />
							<aui:button cssClass="btn btn-danger" id="myCanButton" onclick="pop()" type="button" value="Cancel" />
						</aui:button-row>
					</div>
				</div>
			</aui:form>
 </div>
<aui:script use="aui-io-request,aui-node" >
Liferay.provide(window,'submitForm',
 function() {
  var A = AUI();
  A.io.request('${Quoteform}',{
  method: 'POST',
  form: { id: '<portlet:namespace />fm' },
  on: {
  success: function(){
  window.location.href = "${homepage}";
  
       }
     }
    });
  });

</aui:script >
</body>