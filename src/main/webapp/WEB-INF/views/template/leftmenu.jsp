<!-- <script type="text/javascript">
 	$(document).ready(function(){
	
	 	var role= $("#role").val();
		$.ajax({
		url : "accessActionGetMenusList.action",
		type : "GET",
		data: 'role='+role,
		dataType : 'json',

		success : function(data) {
			$.each(data, function (key, value) {
				var menuid=value.menus.menuTitle;
				menuid=menuid.replace(/ +/g, '');
				$('#idmenus').append('<li id="'+menuid+'"><a href="'+value.menus.menuUrl+'"><i class="'+value.menus.menuIcon+'"></i><i class="icon-chevron-right"></i>'+value.menus.menuTitle+'</a></li>');
		     });
		} 
	});  
		
		 $.ajax({
			url : "accessActiongetMenusList.action",
			type : "GET",
			data: 'role='+sessionValue,
			dataType : 'json',

			success : function(data) {
				var obj = JSON.parse(data.jsonString);
				
				$.each(obj, function (key, value) {
					
					 $.each(value, function (key, value) {
						 var menutitle=null;
						 var menulink=null;
						 var menuicon=null;
						 
						 if(key=="menus"){
							 $.each(value, function (key, value) {
								 if(key=="menuTitle"){
									 menutitle=value;
								 }
								 if(key=="menuUrl"){
									 menulink=value;
								 }
								 if(key=="menuIcon"){
									 menuicon=value;
								 }
				    		});
							 var menuid=menutitle;
							 menuid=menuid.replace(/ +/g, '');
							 $('#idmenus').append('<li id="'+menuid+'"><a href="'+menulink+'"><i class="'+menuicon+'"></i><i class="icon-chevron-right"></i>'+menutitle+'</a></li>');
						 }
					 });
			    	
			     });
			}
		}); 
	});
</script>
 -->
<div class="span3 bs-docs-sidebar">
	<ul class="nav nav-list bs-docs-sidenav" id="idmenus">
		<li class="active"><a style="cursor: default;"><b>Menus</b></a></li>
		
		<li id="1"><a href="dashboard.html"><i class="icon-home"></i>
		<i class="icon-chevron-right"></i>Home</a></li>
		
		<!-- <li id="1"><a href="creategatepass.html"><i class="icon-pencil"></i>
		<i class="icon-chevron-right"></i>Create Gate Pass</a></li>
		
		<li id="1"><a href="searchgatepass.html"><i class="icon-search"></i>
		<i class="icon-chevron-right"></i>Search Gate Pass</a></li>
		
		<li id="1"><a href="searchgatepass.html"><i class="icon-search"></i>
		<i class="icon-chevron-right"></i>Todays Gate Pass</a></li>
		
		<li id="1"><a href="listgatepass.html"><i class="icon-list"></i>
		<i class="icon-chevron-right"></i>List Gate Pass</a></li> -->
		
	</ul>
	<input type="hidden" value=${sessionScope.role } id="role">
</div>


