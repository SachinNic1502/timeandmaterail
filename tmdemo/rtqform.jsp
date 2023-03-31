
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="p"%>
<portlet:defineObjects />
<%-- <portlet:actionURL var="action" name="actionSample"></portlet:actionURL>
 --%>
 <portlet:resourceURL var="timeAndMaterialUrl"></portlet:resourceURL>
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
	$('#quotecall').click();
/* 	$("#coustomerCommitee").hide(); */
	var todayDate = new Date(Date.now()).toLocaleString().split(',')[0];
	/* alert("Date"+new Date(Date.now()).toLocaleString().split(',')[0]); */
	  $("#bidP").val(todayDate);
	  $("#pp1").val(todayDate);
      $("#pp2").val(todayDate);
	  //1 date field
      $("#bidP").datepicker({dateFormat: 'dd/mm/yy',numberOfMonths: 3, showCurrentAtPos:0,minDate: 0});
  	  	$('#calender').click(function() {
  	  
  	    $("#bidP").focus();
  	  	});
      //2,3 dateField
      /* $("#pp1").val($('#bidP').val());
      $("#pp2").val($('#bidP').val()); */
      
      $("#pp1").datepicker({dateFormat: 'dd/mm/yy',numberOfMonths: 3, showCurrentAtPos:0,minDate: 0});
      $('#2').click(function() {
      	  
    	    $("#pp1").focus();
    	  	});
      
      $("#pp2").datepicker({dateFormat: 'dd/mm/yy',numberOfMonths: 3, showCurrentAtPos:0,minDate: 0});
      $('#3').click(function() {
      	  
  	    $("#pp2").focus();
  	  	});
      
      $("#bidP").change(function(){
    	  
    	  $("#pp1").val($("#bidP").val());
          $("#pp2").val($("#bidP").val());
    	  
    	  /* 
           var d1=$("#bidP").val();
     	 var dt1=d1.match(/^(\d{1,2})\/(\d{1,2})\/(\d{4})$/);
     	   console.log("date:"+new Date(dt1[3],dt1[2]-1,dt1[1]));
     	   diffDays=((new Date(dt1[3],dt1[2]-1,dt1[1]).getTime())-(new Date(todayDate).getTime()))/(1000 * 60 * 60 * 24);
     	   console.log("days:"+diffDays);
     	   $("#pp1").datepicker({min:[dt1[3],dt1[2],dt1[1]]}); 
     	    */
     	   
      });
      //4date Field
      $('#aod').datepicker({dateFormat: 'dd/mm/yy',numberOfMonths: 3, showCurrentAtPos:0,minDate: 0});
      $('#4').click(function() {
      	  
    	    $("#aod").focus();
    	  	});
      //5date Field
      $('#dsq').datepicker({dateFormat: 'dd/mm/yy',numberOfMonths: 3, showCurrentAtPos:0,minDate: 0});
      $('#5').click(function() {
      	  
  	    $("#dsq").focus();
  	  	});
     
      
      
      
      //toDAY S UPDATE
    /*  $('.bi-chat-dots').click(function(){
    	  this.parentElement.parentElement.querySelector(".desc").style.color="red";
      }); */
});
Window.onload =setTimeout(function(){
		countWeek();
	},2000);
//it will generate random text based on parameter 
function generateChar1(len){
	var digits='0123456789';
	var chars='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
	let char1='';
	for(i=0;i<len;i++){
		char1+=chars[Math.floor(Math.random()*10)];
	}
	return char1;
	}
	//Generate Quote reference number
	function generate() {
		var A = new AUI();
		var pObject = A.one("#qrn");
		var button=document.getElementById("btn1")
		 var projectName=document.getElementById("pname");
		if(!(isNaN(projectName.value)) || projectName.value=="" || projectName.value==null ){
			 alert("pls...enter project Details...");
			 seterror(projectName,"Enter Valid Project Name");
			 setTimeout(function(){
				 removeError(projectName);
	          	}, 3000);
		}else{
		/* pObject.get("value"); */
		/* pObject.set("value", Math.floor(Math.random() * 100) + 1000);
		pObject.setAttribute('readonly', true);
		button.style.display = "none"; */
		
		/* pObject.set("value",generateChar1(2)+(Math.floor(Math.random() * 100) + 1000)+"-"+generateChar1(1)); */
		pObject.set("value","TM"+(Math.floor(Math.random() * 100) + 1000)+"-"+generateChar1(1));
		pObject.setAttribute('readonly', true);
		button.style.display = "none";
		/* button.disabled=true; */
		}

	}
	function pop() {
		/* var qno = document.getElementById("<portlet:namespace/>demo").value;
		alert(qno) */
		 let text = "Are you sure want to cancel the process..!"+"\n"+"You will not able Recover Previously filled Data";
		  if (confirm(text) == true) {
		    window.location.reload();
		  }else{
			  alert("Your Data Still Presents in Form");
		  }
	}
	
	function countWeek(){
		var ppStart=document.getElementById("pp1").value;
	    var ppEnd=document.getElementById("pp2").value;
	    var ppDuration=document.getElementById("pp3");
	    
	    var date1 = new Date(ppStart.split('/')[2],ppStart.split('/')[1],ppStart.split('/')[0]);
        var date2 = new Date(ppEnd.split('/')[2],ppEnd.split('/')[1],ppEnd.split('/')[0]);
        var time_difference = date2.getTime() - date1.getTime();
       /*  var result = ((time_difference / (1000 * 60 * 60 * 24))/7).toFixed(1); */
        var result = Math.ceil(time_difference / (1000 * 60 * 60 * 24*7));
	    /* alert("date:"+ppDuration.value); */
	    ppDuration.setAttribute("value", result); 
	    /* console.log("time1:"+date1.getTime()+"time2:"+date2.getTime()+"Time:"+time_difference);
	    console.log("val:"+result);
	    console.log("d1:"+date1+"-"+ppEnd); */
	}
	
	
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
				/* var quoteNo = document.forms["<portlet:namespace/>myfrm"]["<portlet:namespace/>qrn"]; */
				var quoteNo = document.getElementById("qrn");
				 var projectName=document.getElementById("pname");
				 var customer=document.getElementById("cname");
				    var cAddress=document.getElementById("cadd");
				    var pCode=document.getElementById("pcode");
				    
				   /*  var chek1=document.forms["<portlet:namespace/>myfrm"]["<portlet:namespace/>chek1"]; */
				   var chek1=document.getElementById("chek1");
				    var smType=document.getElementById("smType");
				    var sName=document.getElementById("sna");
				    var lsName=document.getElementById("ls");
				    var lsData=document.getElementById("lscd");
				    var pType=document.getElementById("ptype");
				    var loc=document.getElementById("loc");
				    var wDesc=document.getElementById("pds");
				    var eUser=document.getElementById("una");
				    
/* 				    var conName=document.forms["<portlet:namespace/>myfrm"]["<portlet:namespace/>conName"];
				    var phNO=document.forms["<portlet:namespace/>myfrm"]["<portlet:namespace/>ph"];
				    var mail=document.forms["<portlet:namespace/>myfrm"]["<portlet:namespace/>email"]; */
				    var conName=document.getElementById("conName");
				    var phNO=document.getElementById("ph");
				    var mail=document.getElementById("email");
				    
				    
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
		          var rea=document.getElementById("rea");
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
				      /*  if(ops.value<opc.value){
				    	  seterror(ops,"Project Sell Amount Must be Higher Than Project Cost");
				    	  returnval = false;
				    	  validProjectsell=false;
				      }else{
					    	 removeError(ops);
					     } */
				     /*  if(returnval!=true){
				    	  event.preventDefault();
				          alert("Please fix the errors which are marked in red");
				      }
				      */
				       if(validQuoteNo==true && ValidProjectName==true && validCustomer==true && validcAddress==true && validpCode==true && validsmType==true && validsName==true && validProductSpec==true && validLocation==true && validWorkDesc==true && validEndUser==true && validConName==true && validMobile==true && validEmail==true && validBidStartDate==true && validpStartDate==true && validpEndDate==true && validTimeDuration==true && validAODate==true && validQuote==true && validProjectCost==true && validDate==true && validProjectsell==true){
	 					 
	 					  
	 					 AUI().use('aui-io-request', function(A){
	 						A.io.request('<%=timeAndMaterialUrl.toString()%>', {
	 						    method: 'post',
/* 	 						     data:{
	 						    	
	 						    	"qrn":quoteNo.value,
	 						    	"pname":projectName.value,
	 						    	"cname":customer.value,
	 						    	"cadd":cAddress.value,
	 						    	"pcode":pCode.value,
	 						    	
	 						    	 "chek1":chek1.value,
	 						    	 "smType":smType.value,
	 						    	"sna":sName.value,
	 						    	"ls":lsName.value,
	 						    	"lsd":lsData.value,
	 						    	
	 						    	"pType":pType.value,
	 						    	"loc":loc.value,
	 						    	"pds":wDesc.value,
	 						    	"una":eUser.value,
	 						    	
	 						    	"conName":conName.value,
	 						    	"ph":phNO.value,
	 						    	"email":mail.value,
	 						    	 
	 						       "bidP":bidStart.value, 
	 						    	"pp1":ppStart.value,
	 						    	"pp2":ppEnd.value,
	 						    	"pp3":ppDuration.value,
	 						    	"aod":aoDate.value,
	 						    	
	 						    	 "qof":qof.value,
	 						    	"opc":opc.value,
	 						    	"dsq":dsq.value,
	 						    	"ops":ops.value,
	 						    	"comments":comments.value,
	 						    	"rea":rea.value
	 						 
	 						    }, */ 
	 						   form: {
	 					    		id: 'frm'
	 					   	 },
	 						    on : {
	 						    success: function() {
	 						    alert("success");
	 						   window.location.href = "${homepage}";
	 						     /* $("#quotecall").click(); */
	 						   /*  alert("date:"+bidStart.value+"-"+ppStart.value); */
/* 	 						    console.log("date:"+bidStart.value+"-"+ppStart.value); */
	 						      
/* 	 						    $("#quoteform").hide();
	 						    $("#coustomerCommitee").show(); */
	 						   console.log("qno : "+quoteNo );
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
		
		  
		  
		  
		  
		
</script>
</head>
<body>
 <div class="container-fluid a" id="quoteform">
			<form id="frm">
 <liferay-ui:panel-container id="panel-container-1" extended="true"
		accordion="true">
		<liferay-ui:panel id="panel-c1" title="Quote Form" collapsible="true"
			extended="true" >

	
					<liferay-ui:panel id="panel-c2" title="Project Info"
						collapsible="true" extended="true">
						 <div class="alert">
						  <strong> Click SAVE to generate Quote Reference Number</strong>
						</div>
						<table class="t1">
							<tr>
								<td class="desc">Quote Reference Number<b style="color:red">*</b></td>
								<td><input name="qrn" id="qrn" type="text" cssClass="ips" readonly="true"></input>
								      <small class="error" ></small></td>
								<td><input type="button"  name="Qbutton" class=""
										id="btn1" style="border: none;color:white;background-color: #6fb3e0;display: inline-block;height: 27px;padding: 0px 7px;margin-bottom: 10px;" onclick="generate()" value="Generate Quote Number"/></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
							 <!-- <sub  class='far'>&#xf4ad;</sub> -->
								<td class="desc">Project Name<b style="color:red">*</b></td>
								<td><input type="text" name="pname"  id="pname" class="ips"/><i class="bi bi-chat-dots"></i>
								</td>
								<td></td>
								<td></td>
								<td ></td>
								<td class="desc" style="margin-right:350px">Customer<b style="color:red">*</b></td>
								<td><input type="text" name="cname"  id="cname"/><i class="bi bi-chat-dots"></i></td>
							</tr>
							<tr>
								<td class="desc">Customer Address<b style="color:red">*</b></td>
								<td colspan="2"><textarea  name="cadd" class="ta" id="cadd"></textarea><i class="bi bi-chat-dots"></i></td>
								<td></td>
								<td ></td>
								<td class="desc">Postal Code<b style="color:red">*</b></td>
								<td><input type="text" name="pcode"  id="pcode" min="0"/><i class="bi bi-chat-dots"></i></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td colspan="2"></td>
								<td class="desc">Add this Project to My WatchList</td>
								<td><input name="chek1" type="checkbox" id="chek1"></input></td>
							</tr>
							<tr>
								<td class="desc">Time & Material<b style="color:red">*</b></td>
								<td><%-- <aui:select title="Select" name="Request" label="" inlineField="true" required="true">
										<aui:option value="">Select</aui:option>
										<aui:option value="Yes">Yes</aui:option>
										<aui:option value="No">No</aui:option>		
									</aui:select> --%>
									<select name="smType" id="smType" required>
									<option value="Select">Select</option>
									 <option value="Labour Only">Labour Only</option> 
									 <option value="Supply Only">Supply Only</option> 
									 <option value="Supply and Labour">Supply and Labour</option>
									  <option value="Supply, Sub Contract and Labour">Supply, Sub Contract and Labour</option> 
									  <option value="Sub Contract Only">Sub Contract Only</option> </select>
									<!-- <select name="smType" id="smType" required>
										<option disabled selected value="select">Select</option>
										<option value="New Build Fitout">New Build Fitout</option>
										<option value="New Build S&C">New Build S&C</option>
										<option value="Other">Other</option>
										<option value="Refit">Refit</option>
										<option value="Supply Only">Supply Only</option>
										<option value="Survey">Survey</option>
										<option value="Supply & Install">Supply & Install</option>
										<option value="Validation Works">Validation Works</option>
								</select> -->
								<i class="bi bi-chat-dots"></i></td>
								<td></td>
								<td></td>
								<td ></td>
								<td class="desc">Site Name<b style="color:red">*</b></td>
								<td><input type="text" name="sna" id="sna"/><i class="bi bi-chat-dots"></i></td>
							</tr>
							<tr>
								<td class="desc">Lead Source</td>
								<td><select name="<portlet:namespace/>ls" id="ls">
										<option disabled selected>Select</option>
										<option value="Sales Relationship">Sales Relationship</option>
										<option value="Existing Contract">Existing Contract</option>
										<option value="Cold Call">Cold Call</option>
										<option value="Ad-Hoc Enquiry">Ad-Hoc Enquiry</option>
										<option value="Online Portal">Online Portal</option>
										<option value="Sub Contractor">Sub Contractor</option>
										<option value="On Site Contact">On Site Contact</option>
										<option value="Word of month">Word of month</option>
										<option value="Search Engine">Search Engine</option>
										<option value="Email Marketing">Email Marketing</option>
										<option value="Press Articles">Press Articles</option>
										<option value="Conference / Trade Show">Conference /
											Trade Show</option>
										<option value="Networking Event">Networking Event</option>
										<%-- <%
											FormData fd = new FormData();
															List<Name> lis = fd.namesList();

											if (lis.size() > 0) {
																for (Name n : lis) {
										%>
										<!-- <option value="Yes">Yes</option>
										<option value="No">No</option> -->
										<option value="<%=n.getName()%>"><%=n.getName()%></option>
										<%
											}	}else{
										%>
										<option value="Default">Default</option>
										<%} %> --%>
								</select><i class="bi bi-chat-dots"></i></td>
								<td></td>
								<td></td>
								<td></td>
								<td class="desc">Lead Source Contextual Data</td>
								<td><textarea rows="3" name="lscd" style="width:80%" class="ta" id="lscd"></textarea><i
									class="bi bi-chat-dots"></i></td>
							</tr>
							<tr>
								<td class="desc">Product Specified<b style="color:red">*</b></td>
								<td><select name="ptype"  id="ptype">
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
								</select><i class="bi bi-chat-dots"></i></td>
								<td></td>
								<td></td>
								<td></td>
								<td class="desc">Location<b style="color:red">*</b></td>
								<td><select name="<portlet:namespace/>loc" id="loc" >
										<option disabled selected value="select">Select</option>
										<option value="Inside M25">Inside M25</option>
										<option value="Other">Other</option>
										<option value="South East">South East</option>
										<option value="Leeds">Leeds</option>
										<%-- <%  fd.getConnection();
										List<Country> list = fd.countriesList();

										if (lis.size() > 0) {
															for (Country n : list) {
									%>
									<!-- <option value="Yes">Yes</option>
									<option value="No">No</option> -->
									<option value="<%=n.getName()%>"><%=n.getName()%></option>
									<%
										}	}else{
									%>
									<option value="Default">Default</option>
									<%} %> --%>
										
								</select><i class="bi bi-chat-dots"></i></td>
							</tr>
							<tr>
								<td class="desc">Description of Works<b style="color:red">*</b></td>
								<td colspan="2"><textarea
										name="pds" class="ta"  id="pds"></textarea><i class="bi bi-chat-dots"></i></td>
								<td></td>
								<td></td>
								<td class="desc">End User<b style="color:red">*</b></td>
								<td><input type="text" name="una"  id="una"/><i class="bi bi-chat-dots"></i></td>
							</tr>
						</table>


						<fieldset style="border:1px solid #cbcbcb;width:96%;margin:0 auto;">
							<legend style="font-size: 16px; width: fit-content; margin: 9px; border: none;color: #478fca">Contact
								Details</legend>
							<div class="" >
								<aui:column columnWidth="70" first="true">
									<table class="" style="margin:0 0 0 130px;">
										<tr>
											<td class="desc">Contact Name<b style="color:red">*</b></td>
											<td><input name="conName"  type="text"  id="conName"
													/></td>
										</tr>
										<tr>
											<td class="desc">Phone<b style="color:red">*</b></td>
											<td><input name="ph" type="text" id="ph" maxlength="10"></input></td>
										</tr>
									</table>

								</aui:column>

								<aui:column columnWidth="30" first="true" class="second" >
								<td class="desc">Email<b style="color:red">*</b></td>
									<td><input  name="email" type="text" id="email" ></td>
								</aui:column>
							</div>
							
						</fieldset>

						<div style="display: flex; width: 100%;">
							<fieldset
								style="border: 1px solid #cbcbcb; width: 55%; margin-right: 5px; padding: 0 30px;">
								<legend
									style=" font-size: 16px; width: fit-content; margin: 9px; border: none; color: #478fca">Estimated</legend>
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
													name="bidP" style="width: 80px;" class="dt input-mini" id="bidP"
													autocomplete="off" /><span id="calender"
													style="cursor: pointer">&#128197;</span></td>
												<td></td>
											</tr>
											<tr>
												<td class="desc">Project Programme<b style="color: red">*</b></td>
												<td><input type="text" style="width: 80px;" name="pp1" id="pp1"
													class="dt input-mini" onchange="countWeek()" /><span id="2"
													style="cursor: pointer">&#128197;</span></td>
												<td style="padding: 0 50px;"><input type="text"
													name="pp2" id="pp2" style="width: 80px;" class="dt input-mini"
													onchange="countWeek()" /><span id="3"
													style="cursor: pointer">&#128197;</span></td>
												<td><input name="pp3" type="text" id="pp3"
													style="width: 30px" readonly /><i class="bi bi-chat-dots"></i>
												</td>
											</tr>
											<tr>
												<td class="desc">Anticipated Order Date<b
													style="color: red">*</b></td>
												<td><input type="text" name="aod" id="aod"
													style="width: 80px;" class="dt input-mini" autocomplete="off" /><span id="4"
													style="cursor: pointer">&#128197;</span><i
													class="bi bi-chat-dots"></i></td>
												<td style="padding: 0 50px;"></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
							</fieldset>

							<fieldset style="border: 1px solid #cbcbcb; width: 45%;display:flex;justify-content:center">
								<legend
									style=" font-size: 16px;width: fit-content; margin: 9px; border: none; color: #478fca">Upload
									RTQ Document</legend>
								<div class="drop">
		<div class="items1" id="items"></div>
		<div class="items2">
			<div style="display: flex; flex-direction: row; align-items: center">
				<div class="cntrl">
					<div class="frm1 dropzone needsclick"
						id="zone">

						<div class="dz-message">
							<span class="btn btn-link"><i class="bi bi-cloud-upload"
								style="font-size: 45px"></i></span><br> <span class="note ">Drop
								Files Here</span><br> <strong>OR</strong><br>
							<div class="browsebtn" style="width: 95%">Browse</div>
						</div>
					</div>
				</div>
				<div class="btns" id="btns">
					<div class="btn "
						style="margin-bottom: 5px; background: rgb(134, 62, 134); font-weight: bold; color: #fff; cursor: pointer">Link
						to File</div>
					<div class="btn "
						style="margin-top: 15px; background: rgb(134, 62, 134); font-weight: bold; color: #fff; cursor: pointer">Link
						to DropBox</div>

					<div class="btn "
						style="margin-top: 15px; background: rgb(134, 62, 134); font-weight: bold; color: #fff; cursor: pointer">
						Upload</div>
				</div>
			</div>
		</div>

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
									<td width="26%"><select name="qof" id="qof">
											<option value="select" disabled selected>Select</option>
											<option value="Yes">Yes</option>
											<option value="No">No</option>
									</select></td>
									<td width="16%" style="text-align: end;padding-right: 15px">Date Shown on Quote<b style="color:red">*</b></td>
									<td><input name="<portlet:namespace/>dsq"  type="text" autocomplete="off" id="dsq"></input><span id="5" style="cursor:pointer">&#128197;</span></td>
								</tr>
								<tr >
									<td width="19%" style="text-align: end;padding-right: 15px">OverAll Project Cost(<span>&#163;</span>)<b style="color:red">*</b></td>
									<td width="26%"><input name="<portlet:namespace/>opc" type="number"
										id="opc" min="0"></input></td>
									<td width="16%" style="text-align: end;padding-right: 15px">OverAll Project Sell(<span>&#163;</span>)<b style="color:red">*</b></td>
									<td><input name="<portlet:namespace/>ops" type="number"
										id="ops" min="0"></input></td>
								</tr>
                                 </tbody>
							</table>
							
                            
					</liferay-ui:panel>
				
				

		</liferay-ui:panel>
	</liferay-ui:panel-container>
	<div>
					<span>Comments</span><br>
					<textarea class="ta" name="comments" id="comments" style="width:100%" ></textarea>
					
				</div>
				<div style="display: grid; float: right; text-align: end;">
				<div style="display: flex;text-align: end;">
				<label>Request for Explicit Approvals At Approvals to Submit Quote</label>
					<select title="Select" name="rea" id="rea">
						<option disabled selected value="">Select</option>
						<option value="Yes">Yes</option>
						<option value="No">No</option>
					</select>
					</div>
					<div>

						<%-- <aui:button-row>
							<aui:button cssClass="btn btn-primary" type="button"
								id="mySubButton" onclick="generate()" name="saveButton" value="save" />
							<aui:button cssClass="btn btn-warning" id="Button1"
								type="button" onclick=" window.location.reload()" value="Reset" />
							<aui:button cssClass="btn btn-success" id="submitBtn"
								type="button" value="Submit" onclick="validate()"/>
							<aui:button cssClass="btn btn-danger" id="myCanButton"
								onclick="pop()" type="button" value="Cancel" />
						</aui:button-row> --%>
						<input type="submit" class="" style="background-color : #6fb3e0 ;padding : 10px 25px; color : white; border: none; margin-bottom: 7px;
    margin-top: 6px;"  Value="Save">
	<input type="reset" class="" style="background-color : #ffb752 ;padding : 10px 25px; color : white; border: none;" Value="Reset">
	<input type="button" class="" style="background-color : #87b87f ;padding : 10px 25px; color : white; border: none;" onClick="validate()" value="Submit">
    <input type="reset" class="" style="background-color : #d15b47 ;padding : 10px 25px; color : white; border: none;" Value="Cancel">
	<a type="button" id="quotecall" href="${homepage}" class="btn btn-sm btn-warning"></a>
					</div>
				</div>
			</form>
 </div>
<script>


Dropzone.autoDiscover = false;

	function setup(id) {
		let options = {
            url:"/upload",
			maxFilesize : 500 / 1024,
			maxFiles : 1,
			dictResponseError : "Server not Configured",
			dictFileTooBig : "File too big ({{filesize}}MB). Must be less than {{maxFilesize}}MB.",
			dictCancelUpload : "",
			// DragEvent:function(){
			//   document.getElementById('btns').style.backgroundColor="green";
			//   console.log("dragging..");
			// },
			acceptedFiles : ".txt,.xlsx,.xls",
			init : function() {
				var self = this;
				//New file added
				self.on("addedfile", function(file) {
					console.log("new file added ", file);
					
				});
				// Send file starts
				self.on("sending", function(file) {

					console.log("upload started", file);
				});

				self.on("complete", function(file, response) {
					if (file.name !== "442343.jpg") {
						//this.removeFile(file);
					}
					//else{
					//   alert("uploaded Successfully");
					// }

				});

				self.on("maxfilesreached", function(file, response) {
					//alert("too big");
				});

				self.on("maxfilesexceeded", function(file, response) {
					this.removeFile(file);
				});

				// self.on("addedfile", function(file) {
				//   const pattern = /\d{6}(\.)(jpg|jpeg|png)/;

				//   if (!pattern.test(file.name)) {
				//     //   this.removeFile(file);
				//   }
				// });

				

				self.on("sendingmultiple", function() {
					alert("files submitted..");
					// Gets triggered when the form is actually being sent.
					// Hide the success button or the complete form.
				});
			},
			accept : function(file, done) {
				// alert("file added successfully");
				console.log("one file is added");
				 var reader = new FileReader();
			        reader.addEventListener("loadend", function(event) { console.log("data1"+event.target.result);});
			       reader.readAsText(file);
				// const pattern = /\d{6}(\.)/;

				// if (pattern.test(file.name)) {
				//   done();
				// } else {
				//   done("File name not a valid admission number");
				//   return false;
				// }
			},

			previewsContainer : '#items',
			previewTemplate : '<div class="dz-preview dz-file-preview">'
					+ '<div class="" style="display:flex;justify-content:space-between;padding:0 5px;width:75%">'
					+ '<div class="dz-filename"><span data-dz-name></span></div>'
					+ '<div class="dz-remove">'
					+ '<a href="javascript:undefined;" data-dz-remove=""><i class="bi bi-trash" style="color:black"></i></a>'
					+ '</div></div>'
					+ '<div class="dz-error-message" style="color:red"><i class="fa fa-warning">&nbsp;</i><span data-dz-errormessage></span></div>'
					+ '<div class="dz-progress">'
					+ '<span class="dz-upload" data-dz-uploadprogress></span></div></div>'

		};

		var myDropzone = new Dropzone('#' + id, options);
	}
	//calling a function by passing form id
	
	Window.onload =setTimeout(function(){
	setup('zone');

	},2000);
</script>
</body>