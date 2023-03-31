
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<style>
.desc {
	text-align: end;
	
 padding-right: 15px !important;
}

</style>
<portlet:defineObjects />
<portlet:actionURL var="formsubmissionURL" name="formsubmissionURL"/>
<aui:form id="fm" name="fm">
	<liferay-ui:panel id="panel-c4" title="Appoint Key Staff" collapsible="true"
			extended="true" >
			<table class="" style="margin:0 0 0 130px;">
										<tr>
											<td class="desc">Project Lead<b style="color:red">*</b></td>
											<td><select name="plead"  id="plead">
										<option disabled selected value="select">Select</option>
										<option value="Devkaran">Devkaran</option>
										<option value="Scahin">Scahin</option>
										<option value="Abhijit">Abhijit</option>
										<option value="Schneider">Schneider</option>
										<option value="Delta">Delta</option>
										<option value="ALC(Automated Logic)">ALC(Automated Logic)</option>
										<option value="Open">Open</option>
										<option value="Tridium">Tridium</option>
										<option value="North">North</option>
										<option value="Easy i/o">Easy i/o</option>
								</select></td>
								<td><input  style="background-color : #6fb3e0 ;margin-left: 10px;
    padding: 4px 11px; color : white; border: none; margin-bottom: 7px;
    margin-top: 6px;" type="button"
								 name="view Workload" value="view Workload" /></td>
										</tr>
										<tr>
											<td class="desc" >Job Reference<b style="color:red">*</b></td>
											<td><aui:input name="winp" label="" type="text" id="winp"  ></aui:input></td>
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
			<aui:script use="aui-io-request,aui-node" >
Liferay.provide(window,'submitForm',
 function() {
  var A = AUI();
  A.io.request('${formsubmissionURL}',{
  method: 'POST',
  form: { id: '<portlet:namespace />fm' },
  on: {
  success: function(){
  
  
       }
     }
    });
  });

</aui:script >