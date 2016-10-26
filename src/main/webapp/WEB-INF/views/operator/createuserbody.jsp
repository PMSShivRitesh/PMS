<style>
#CreateUser {
    background-color: #eeeeee;
    color: #333333;
    font-weight: bold;
} 
</style>

<script type="text/javascript">
var validEmailId="false";
var validEmpId="false";

$(function() {
	$(".datepicker").datepicker({
		changeYear : true,
		changeMonth : true,
		yearRange : '1970:2025'
	});
});

$(document).ready(function(){
	clearForm();
	$('#idsuccess').hide();
	$('#iderror').hide();
	$('#idwarning').hide();
	$("#idavailstatus").hide();
	$("#idavailstatus1").hide();
	
	$(".close").click(function(){
		$('#idsuccess').hide();
		$('#iderror').hide();
		$('#idwarning').hide();
	})
	
	$.getJSON("userActionCountryList.action", function (data) {
		 $.each(data, function (key, value) {
		    var div_data="<option value="+value.countryId+">"+value.countryName+"</option>";
	    	$(div_data).appendTo('#idcountry'); 
	    	});
		  });

	$("#idcountry").change(function(){
		if($('#idcountry :selected').val()==""||$('#idcountry :selected').val()=="Select"){
			$("#idstate").empty();
			$("#idstate").append('<option>Select</option>');
			$("#iddistrict").empty();
			$("#iddistrict").append('<option>Select</option>');
		}else{
			$("#idstate").empty();
			$("#idstate").append('<option>Select</option>');
			var countryid = $('#idcountry :selected').val();
			$.getJSON("userActionStateList.action?countryId="+countryid+"", function (data) {
		   	  $.each(data, function (key, value) {
		    		 var div_data="<option value="+value.stateId+">"+value.stateName+"</option>";
	    			 $(div_data).appendTo('#idstate'); 
	    			 });
		   	  });
			}
		});	
	
	$("#idstate").change(function(){
		if($('#idstate :selected').val()==""||$('#idstate :selected').val()=="Select"){
			$("#iddistrict").empty();
			$("#iddistrict").append('<option>Select</option>');
		}else{
			$("#iddistrict").empty();
			$("#iddistrict").append('<option>Select</option>');
			var stateid=$("#idstate :selected").val();
			$.getJSON("userActionDistrictList.action?stateId="+stateid+"", function (data) {
		     $.each(data, function (key, value) {
		    	 var div_data="<option value="+value.districtId+">"+value.districtName+"</option>";
	    		 $(div_data).appendTo('#iddistrict'); 
	    		 });
		     });
		}
	});
	
	$("#idusertype").change(function(){
		if($('#idusertype :selected').val()==""||$('#idusertype :selected').val()=="3"){
			$("#idempid").attr('readonly', true);
			$("#idempid").val("");
			}else if($('#idusertype :selected').val()=="2"){
				$("#idempid").attr('readonly', false);
			}
	});
	
	$("#idempid").focusout(function(){
		var empId=$("#idempid").val();
		if(!(empId==""||empId==null)){
			$.ajax({
				url:"userActionUserInfoWithEmpId.action",
				type:"GET",
				data:"users.empId="+empId,
				datatype:"json",
				success:function(data){	
					if(data.empId==null){
						$("#idmsg").hide();
						$("#idavailstatus1").show();
						$("#idavailstatus1").text("");
						$("#idavailstatus1").html("<font color='Green'>Employee id is available to use!</font>");
						validEmpId="true";
						$("#idempid").css({'background-color': '#edffeb'});
					}else{
						validEmpId="false";
						$("#idmsg1").hide();
						$("#idavailstatus1").show();
						$("#idavailstatus1").text("");
						$("#idavailstatus1").html("<font color='Red'>Employee id is already used!</font>");
						$("#idempid").css({'background-color': '#ffeadc'});
					}
				}
			})
		}
	});
	
	$("#idemail").focusout(function(){
		var email=$("#idemail").val();
		if(!(email==""||email==null)){
			$.ajax({
				url:"userActionUserInfo.action",
				type:"GET",
				data:"users.userId="+email,
				datatype:"json",
				success:function(data){	
					if(data.userId==null){
						$("#idmsg").hide();
						$("#idavailstatus").show();
						$("#idavailstatus").text("");
						$("#idavailstatus").html("<font color='Green'>Email id is available to use!</font>");
						validEmailId="true";
						$("#idemail").css({'background-color': '#edffeb'});
					}else{
						validEmailId="false";
						$("#idmsg").hide();
						$("#idavailstatus").show();
						$("#idavailstatus").text("");
						$("#idavailstatus").html("<font color='Red'>Email id is already registered!</font>");
						$("#idemail").css({'background-color': '#ffeadc'});
					}
				}
			})
		}
	});
});

function createUser(){
	var valStatus=validateForm();
	if(valStatus==true){
		var userType=$("#idusertype").val();
		var name=$("#idname").val();
		var empId=$("#idempid").val();
		var gender=$("#idgender").val();
		var birthDate=$("#idbirthdate").val();
		var email=$("#idemail").val();
		var contactNo=$("#idcontact").val();
		var company=$("#idcompanyname").val();
		var pan=$("#idpan").val();
		var country=$("#idcountry :selected").text();
		var state=$("#idstate :selected").text();
		var district=$("#iddistrict :selected").text();
		var localAdd=$("#idlocaladd").val();
		var tempPass=$("#idtemppass").val();
		
			$.ajax({
			url : "userActionCreateUser.action",
			type : "GET",
			data : 'users.userTypes.userTypeId='+userType+'&users.empName='+name+'&users.empId='+empId+'&users.gender='+gender+'&users.DOB='+
					birthDate+'&users.emailId='+email+'&users.contactNo='+contactNo+'&users.companyName='+company+'&users.PAN='+pan+
					'&users.address.country='+country+'&users.address.state='+state+'&users.address.district='+district+
					'&users.address.localAddress='+localAdd+'&systems.password='+tempPass+'&systems.emailId='+email,
			dataType : 'json',
			success : function(data) {
				if(data="true"){
					$("#idsuccess").show();
					$('#idwarning').hide();
					$('#iderror').hide();
					$("#btnsave").hide();
					$("#btnclear").hide();
					$("#idavailstatus").hide();
					
					$("#idusertype").attr('readonly', true);
					$("#idname").attr('readonly', true);
					$("#idempid").attr('readonly', true);
					$("#idgender").attr('readonly', true);
					$("#idbirthdate").attr('readonly', true);
					$("#idemail").attr('readonly', true);
					$("#idcontact").attr('readonly', true);
					$("#idcompanyname").attr('readonly', true);
					$("#idpan").attr('readonly', true);
					$("#idcountry").attr('readonly', true);
					$("#idstate").attr('readonly', true);
					$("#iddistrict").attr('readonly', true);
					$("#idlocaladd").attr('readonly', true);
					$("#idtemppass").attr('readonly', true);
					
				}else{
					$("#iderror").show();
					$('#idsuccess').hide();
					$('#idwarning').hide();
				}
				}
			});
			}else{	
			}
		}	
				
function clearForm(){
			$("#idusertype > option").attr("selected",false);
			$("#idname").val("");
			$("#idempid").val("");
			$("#idbirthdate").val("");
			$("#idemail").val("");
			$("#idcontact").val("");
			$("#idcompanyname").val("");
			$("#idpan").val("");
			$("#idlocaladd").val("");
			$("#idtemppass").val("");
			$("#idsuccess").hide();
			$("#idwarning").hide();
			$("#iderror").hide();
		}
		
function validateForm(){
	$("#idwarning").hide();
	$('#idsuccess').hide();
	$('#iderror').hide();
	var errorString="";
	
	if($('#idusertype :selected').val()==""||$('#idusertype :selected').val()=="Select"){
		errorString=errorString+"<li>Please select user type";
		}

	var name = /^\s*[a-zA-Z,\s]+\s*$/;
	if($("#idname").val()==""||$("#idname").val()==null){
		errorString=errorString+"<li>Please fill name field";
	}else if(!name.test($("#idname").val())){
		errorString=errorString+"<li>Number or special characters are not allowed in name field";
		}
	
	if($('#idusertype :selected').val()=="2" && $("#idempid").val()==""){
		errorString=errorString+"<li>Please insert employee id";
		}
	
	var email = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,6})?$/;
	if($("#idemail").val()==""||$("#idemail").val()==null){
		errorString=errorString+"<li>Please fill email id field";
	}else if(email.test($("#idemail").val())==false){
			errorString=errorString+"<li>Please correct your email id";
			}
	
	var mobileNumber = /^\s*(?:[0-9]{10})\s*$/;
	if($("#idcontact").val()==""||$("#idcontact").val()==null){
		errorString=errorString+"<li>Please fill contact no filed";
	}else if(!mobileNumber.test($("#idcontact").val())){
			errorString=errorString+"<li>Be sure your contact no in format [1234567890]";
			}
	
	if($("#idcompanyname").val()==""||$("#idcompanyname").val()==null){
		errorString=errorString+"<li>Please fill company name";
		}
	
	var pan=/^([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}?$/;
	if($("#idpan").val()==""||$("#idpan").val()==null){
		errorString=errorString+"<li>Please fill PAN";
	}else if(!pan.test($("#idpan").val())){
		errorString=errorString+"<li>Be sure you PAN in format [XXXXX1234X]";
		}
	
	if($("#idtemppass").val()==""||$("#idtemppass").val()==null){
		errorString=errorString+"<li>Please set temporary password!";
		}
	
	if(!(errorString=="")){
		$("#idwarningmsg").empty();
		$("#idwarningmsg").html(errorString);
		$("#idwarning").show();
		return false;
		}
	
	if(validEmailId=="false"){
		return false;
		}
	
	if(validEmpId=="false" && $("#idusertype").val()==2){
		return false;
		}
	
	return true;
}
</script>

<fieldset class="fieldset-style">
	<div class="alert alert-success" id="idsuccess">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<i class="icon-thumbs-up"></i>User account created successfully!
	</div>

	<div class="alert alert-warning" id="idwarning">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<i class="icon-warning-sign"></i><div id="idwarningmsg"></div>
	</div>
	
	<div class="alert alert-error" id="iderror">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<i class="icon-remove"></i>Problem occured while creating user account!
	</div>

	<!-- <form action="userActionCreateUser" method="post" class="form-horizontal"> -->
	<div class="form-horizontal">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="container-fluid header-padding">
					<div class="row-fluid">
						<div class="span10" align="left">New user</div>
						<div class="span2" align="right">
							<button class="btn-save" title="Save" onclick="createUser();" id="btnsave"></button>
							<!-- <button class="btn-save" title="Save" type="submit"></button> -->
							<div class="btn" title="Cancel" onclick="clearForm();" id="btnclear">
								<i class="icon-trash"></i>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="container-fluid panel-body">
				<div class="row-fluid search-align">
					<div class="firstquad">
						<!-- <div class="control-group">
							<label class="control-label">User Type</label>
							<div class="controls">
								<select id="idusertype" name="users.userTypes.userTypeId">
									<option value="">Select</option>
									<option value="2">Employee</option>
									<option value="3">Client</option>
								</select>
							</div>
						</div> -->
						<div class="control-group">
							<label class="control-label">Name</label>
							<div class="controls">
								<input type="Text" id="idname" name="users.empName">
							</div>
						</div>
						<!-- <div class="control-group">
							<label class="control-label">Employee id</label>
							<div class="controls">
								<input type="Text" id="idempid" name="users.empId" readonly><br>
								<div style="width:220px">
								<div style="color: #006dcc; font-size:11px; width: 200px;" id="idmsg1">(Only for employee user type)</div>
								<div style="width: 200px; font-size: 11px;" id="idavailstatus1"></div>
								</div>
							</div>
						</div> -->
						<div class="control-group">
							<label class="control-label">Gender</label>
							<div class="controls">
								<div class="radio-inline">
								<label class="radio">
								<input type="radio" id="idgender" value="Male" name="gender" checked>Male
								</label>
								</div>
								<div class="radio-inline">
								<label class="radio">
								<input type="radio" id="idgender" value="Female" name="gender">Female
								</label>
								</div>
								
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">Birth Date</label>
							<div class="controls">
								<input type="text" id="idbirthdate" class="datepicker" name="users.DOB" readonly>
							</div>
						</div>
						</div>
						
					<div class="firstquad">
						<div class="control-group">
							<label class="control-label">Email id</label>
							<div class="controls">
								<input type="Text" id="idemail" name="users.emailId">
								<div style="width:220px">
								<div style="color: #006dcc; font-size:11px; width: 200px;" id="idmsg">(This would be user's login id)</div>
								<div style="width: 200px; font-size: 11px;" id="idavailstatus"></div>
								</div>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label">Contact No</label>
							<div class="controls">
								<input type="Text" id="idcontact" name="users.contactNo">
							</div>
						</div>

						<!-- <div class="control-group">
							<label class="control-label">Company Name</label>
							<div class="controls">
								<input type="Text" id="idcompanyname" name="users.companyName">
							</div>
						</div> -->
						<!-- <div class="control-group">
							<label class="control-label">PAN</label>
							<div class="controls">
								<input type="Text" id="idpan" name="users.pan">
							</div>
						</div> -->
						<div class="control-group">
							<label class="control-label">Country</label>
							<div class="controls">
								<select id="idcountry" name="users.address.country">
									<option>Select</option>
								</select>
							</div>
						</div>
						</div>
						
					<div class="firstquad">
						<div class="control-group">
							<label class="control-label">State</label>
							<div class="controls">
								<select id="idstate" name="users.address.state">
									<option>Select</option>
								</select>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">District</label>
							<div class="controls">
								<select id="iddistrict" name="users.address.district">
								<option>Select</option>
								</select>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">Local Address</label>
							<div class="controls">
								<textarea style="width: 207px; height: 60px;" id="idlocaladd" name="users.address.localAddress" spellcheck="false"></textarea>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">Temporary Password</label>
							<div class="controls">
								<input type="text" id="idtemppass" name="systems.password">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- </form> -->
	</div>
</fieldset>