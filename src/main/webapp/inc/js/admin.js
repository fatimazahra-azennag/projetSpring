function openCity(evt, cityName) {
    // Declare all variables
    var i, tabcontent, tablinks;
  
    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
      tabcontent[i].style.display = "none";
    }
  
    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
  
    // Show the current tab, and add an "active" class to the button that opened the tab
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
  }
  $("#cmodule").on("change",function() {
  	var elm_id = $(this).val();
  	$(".modules").each((index)=>{
		
			if($(".elm_id").eq(index).text()===elm_id){
				$("#nv_module").attr("value",$(".elm_module").eq(index).text());
                $("#elmModule").attr("value",$(".elm_module").eq(index).text());
				$("#nv_dscModule").attr("value",$(".elm_description").eq(index).text());
				$("#nv_dscModule").text($(".elm_description").eq(index).text());
				 $('#nv_annee').find('option').each(function(i,e){
        			if($(e).val() == $(".elm_annee").eq(index).text() ){
            		$('#nv_annee').prop('selectedIndex',i);
        		}
        		$(".filiere_cb").each( ()=>{
        		     var value = $(this).val()
                    console.log("Before" + value)
                    var cb =this
                    $(".filieres").eq(index).find(".filiere").each( (i)=>{
                            if($(this).text() == value){
                                $(cb).setAttributeNode("value","on")
                                console.log(value)
                            }
                        }
                    )
                    }

                )
          });
        		$('#nv_semestre').find('option').each(function(i,e){
        			if($(e).val() == $(".elm_semester").eq(index).text() ){
            		$('#nv_semestre').prop('selectedIndex',i);
        }
    });
				
			}
	});
});