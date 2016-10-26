<script type="text/javascript">
$(document).ready( function(){
	$('#iderror_login').hide();
	$('#idsuccess_logout').hide();
	$('#status').hide();
	if($('#status').text()== "true")
		{
		$('#idsuccess_logout').show();
		}
	});
	
	function loginFunction() {
		var userName = document.getElementById("userid").value;
		var password = document.getElementById("password").value;
		
		$.ajax({
			url : "dashboard",
			type : "GET",		
			/* data : 'userName='+userName+'&password='+password, */
			/* dataType : 'json', */

			success : function(data) {
 						if(data=="false"){
 							$("#status").val("");
 							$('#idsuccess_logout').hide();
 							$('#iderror_login').show();
 						}else {
 							window.location.href="dashboard";  
		    			}
		    		}
		});
	}
	
	
</script>

<%
String status= request.getParameter("status");
%>
<div id="status"><%= status%></div>
<div class="alert alert-error" id="iderror_login">Invalid user
	name or password!</div>
<div class="alert alert-success" id="idsuccess_logout">Successfully
	signed out!</div>

<div class="form-signin">
	<img src="resources/images/mtslogo.jpg" width="330">

	<p class="text-left" style="margin-bottom: 10px; margin-top: 15px;">Sign
		in </p>

	<input type="text" class="input-block-level" placeholder="User Name"
		id="userid"> <input type="password" class="input-block-level"
		placeholder="Password" id="password">

	<button class="btn btn-primary" style="width: 100%;"
		onclick="loginFunction();">Sign in</button>

	<div class="checkbox">
		<input type="checkbox" value="remember-me" class="checkbox"
			id="remember_me">Remember me
	</div>

	<a id="forgot_password" class="cursor" onclick="forgotPassword();">Forgot
		Password?</a>
</div>
