
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<style>
.desc {
	text-align: end;
	
 padding-right: 15px !important;
}

</style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <script>
    
//this function code  for the  datecalender jqeary code

    $(document).ready(function() 
    	{
    	
    		$('#datepicker4').hide();
  			$('#calender').hide();
  			$('#appt-time').hide();
  			$('#mAPM').hide(); 
    	/* $('#appt-time').hide(); */
    	  $("#datepicker4").datepicker();
    	  $('#calender').click(function() {
    	    $("#datepicker4").focus();
    	  });
    	  
    	  // this  code for disable  when  the  any  user click on the not  to set  metting
    	  
    	  $('#meet').change(function(event){
  	    	console.log($('#meet').val());
  	    	
  	    	if ($('#meet').val() == 'No'){
  	    		
  	    		$('#datepicker4').attr("disabled", true);
  	    		$('#calender').attr("disabled", true);
  	    		$('#appt-time').attr("disabled", true);
  	    		$('#mAPM').attr("disabled", true);
  	    		/* $('#datepicker4').addClass('hidden');
  	    		$('#appt-time').addClass('hidden');
  	    		 $('#calender').addClass('hidden');
  	    		 $('#mAPM').addClass('hidden'); */
  	    		
  	    		  $('#datepicker4').hide();
  	    		$('#calender').hide();
  	    		$('#appt-time').hide();
  	    		$('#mAPM').hide(); 
  	    		  
  	    		 
  	    		 /*  $("#datepicker4").val(""); 
                  $("#calender").val("No"); 
                  $("#appt-time").val("");
                  $("#mAPM").val(""); */
  	    	}
  	    	 
  	    		
  	    	
  	    	else{
  	    		$('#datepicker4').attr("disabled", false);
  	    		$('#calender').attr("disabled", false);
  	    		$('#appt-time').attr("disabled", false);
  	    		$('#mAPM').attr("disabled", false);
  	    		/* $('#datepicker4').addClass('nohidden');
  	    		$('#appt-time').addClass('nohidden');
  	    		 $('#calender').addClass('nohidden');
  	    		 $('#mAPM').addClass('nohidden'); */
  	    		/*  $('#datepicker4').addClass('hidden');
   	    		$('#appt-time').addClass('hidden');
   	    		 $('#calender').addClass('hidden');
   	    		 $('#mAPM').addClass('hidden'); */ 
  	    		  $('#datepicker4').show();
  	    		$('#calender').show();
  	    		$('#appt-time').show();
  	    		$('#mAPM').show();   
  	    		 $("#datepicker4").val("02/2/2023"); 
   	    	   $("#appt-time").val("00:03"); 
   	    	   $('#mAPM').val("AM");
   	    	   
  	    		
  	    	}
  	    	
  	    	
  	    	
  	    }); 
    	  $('#save').click(function(event){
		    	 var y = $("#cbox").val();
		    	 var x = $("#Jfile").val();
		    	 var select =$('#meet').val();
		  	    		
		    	if (y == "" || x==""){
	  		    	
	  		    	if(y==""){
	  		    		alert("Please Fill the required  filed");
	  		    	document.getElementById("cbox").style.border = ' 1px solid red';
	  		    	event.preventDefault();
	  		    	}
		    	else{
		    		document.getElementById("cbox").style.border = ' 1px solid #eaeaea';
		    	}
	  		    	if(x==""){
	  		    	document.getElementById("Jfile").style.border = ' 1px solid red';
	  		    	
	  		    	}
	  		    	else{
			    		document.getElementById("Jfile").style.border = ' 1px solid #eaeaea';
			    	}
	  		    	if(select == "select"){
	  		    		alert("please select yes or no");
		  	    		event.preventDefault();
	  		    	}
	  		    	else{
			    		alert('ok');
			    	}
	  		    }
		    	else{
		    		document.getElementById("cbox").style.border = ' 1px solid #eaeaea';
		    		document.getElementById("Jfile").style.border = ' 1px solid #eaeaea';
		    	}
		    });     
    	  $("#save").click(function(event){

    		  if( $("#meet option:selected").val()==''){

    		  /* alert("Please select one option at least"); */

    		    /* $("#message").html("Select At least one option"); */
  		    	$('#meet').css("border-color", "red");

    		    event.preventDefault();

    		  }
    		  else{
		    		
		    		document.getElementById("meet").style.border = ' 1px solid #eaeaea';
		    	}


    		  });
  	  
  	    	
  	    	
  	  $('#checkbox').click(function(e) {
  		    if (this.checked) {
  		    	$('#Jfile').attr("disabled", true);
  		    	 $("#datepicker4").val("No"); 
  		        $('#Jfile').hide(); // If checked enable item 
  		      $('#path').hide();
  		    $('#Jfile').removeAttr('required'); 
  		   

  		    } else {
  		    	$('#Jfile').attr("disabled", false);
  		    	 $("#datepicker4").val(""); 
  		    	$('#Jfile').show(); // If checked disable item 
  		    	$('#path').show();
  		    	
  		    	/*  $('#save').click(function(event){
  		    		
  		    	 var x = $("#Jfile").val();
  		    	if (x == "" || x == null){
  	  		    	alert("Please Fill the  job file path in server");
  	  		    document.getElementById("Jfile").style.border = ' 1px solid red';
  	  		    	event.preventDefault();
  	  		    }
  		    	else{
  		    	  document.getElementById("Jfile").style.border = ' 1px solid #eaeaea';
  		    		
  		    		
  		    	}
  		    });  */    
  		    }
  		   
  		});
  	    
  	});
    	// this   function  code  for the togle the  comment  history block

        $(document).ready(function () {
        	 $('.para').hide();
            $(".name").click(function () {
                $(".para").slideToggle();
            });
        });
    	
       /*  function validateForm() {
        	  var x = document.forms["myForm"]["Jfile"].value;
        	  if (x == "" || x == null) {
        		  
        	    alert("Name must be filled out");
        	    return false;
        	  }
        	} */
    
    	//this  code   for  validation  for  job pathe  the  ob path is  onlye  i naming character onlye  not  extra charcter
    	
    </script>
  <div class="bodydemo"> 
<aui:form>
	<liferay-ui:panel id="panel-c4" title="Sales to Operations Handover" collapsible="true"
			extended="true" >
<div>
            <p style="padding-left: 1%; padding-top: 24px;" >Instruction - Please upload any further relevant documentation for the Project Lead. If there is nothing to upload - leave blank</p>
        </div>
    <div class="wrapper" style="font-size: 13px;padding-left: 60px;"><label style="font-size: 12px;">
    Has the job file set up on the server?<span class = "required2" >*</span></label><label class="switch" >
<input type="checkbox" id="checkbox"  title="This check-box is reqired">
  <span class="slider round">
  
  </span>
</label>

 <label for="Jfile"></label>
 <span id="path">job file path in server</span>  &nbsp;&nbsp; <input  type="text" id="Jfile"  name="<portlet:namespace/>JobPath"  required  ><br>
   <span style="color:red; margin-left:28%" id ="e"></span>
  </div>

	     <table class="tableb">
    
            <tr class="tr2" style="background: white;">
                <td> <label style = "margin-bottom: 10%;margin-top: 10%;font-size: 13px;padding-left: 129px;">
        schedule meting with operatonal<span class = "required2">*</span>
        <select  name="<portlet:namespace/>MettingSchedul" id="meet" style = "width:29%;"  onkeyup="validatemeet">
          <option value="" selected >-select-</option>
          <option value="yes" >Yes</option>
          <option value="No" >No</option>
        </select>
      </label></td>
     
              
                <td> <input  name="<portlet:namespace/>Meeting_date"  type="text"  id="datepicker4" style = " margin-left: 10%; margin-top: 1%;width: 32%;display: inline-block;"  > 
                 <span id="calender">&#128197; </span></td>
                 
                 

                <td>
                    <label
                     for="appt-time">
                    <select  name="<portlet:namespace/>Meeting_time"   id="appt-time" type="text" name="appt-time" style= "   margin-left: -126%;margin-top: 6.5%; width: 100%;" >
                           
              
                          <option >01:00</option>
                          <option >02:00</option>
                          <option selected value="03:00">03:00</option>
                          <option >04:00</option>
                           <option >05:00</option>
                          <option >06:00</option>
                          <option >07:00</option>
                           <option >08:00</option>
                          <option >09:00</option>
                          <option >10:00</option>
                           <option >11:00</option>
                           <option >12:00</option>
                           
                          
                        </select>
                     </label>
                     </td>
                <td>
                    <label>
                        <select   name="<portlet:namespace/>Meridiem" id="mAPM" style = "width: 100%; margin-left: -135%; margin-top: -2%; display: inline-block; " >
                   
                          <option value="Am" selected >Am</option>
                          <option >Pm</option>
                        </select>
                      </label>

                </td>
                 
            </tr>
           
           
           
            
            
		 <tr class="tr2" style="background: white;">
                <td> <label style=" margin-left: 3%; font-size: 13px;margin-top: -6%; " >
                    Deligating outstanding final Agreement task to project <br>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;leader <span class = "required2">*</span>
                     <label>
                        <select   name="<portlet:namespace/>Final_agreement" style = "width: 17%;margin-left: 80%; margin-top: -13%;" required>
                          <option></option>
                          <option value="yes"  selected>Yes </option>
                          <option value="No" >No</option>
                        </select>
                      </label>
                  </label>
               </td>
               </tr>
   </table>
					
	</liferay-ui:panel>
	<liferay-ui:panel id="panel-c5" title="Comments History" collapsible="true"
			extended="true" >
			

	
					
	</liferay-ui:panel>
	
				<div style="display: grid; float: right; text-align: end;">
					
					<div>

<input type="submit" class="" style="background-color : #6fb3e0 ;padding : 10px 25px; color : white; border: none; margin-bottom: 7px;
    margin-top: 6px;"  Value="Save">
	<input type="button" class="" style="background-color : #87b87f ;padding : 10px 25px; color : white; border: none;" onClick="validate()" value="Submit">
    <input type="reset" class="" style="background-color : #d15b47 ;padding : 10px 25px; color : white; border: none;" Value="Cancel">
	<a type="button" id="quotecall" href="${homepage}" class="btn btn-sm btn-warning"></a>
					</div>
				</div>
			</aui:form>
			</div> 