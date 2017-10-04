$(document).ready(function(){
	// $("input[list='moneys']").focus(function(){
	// 	if (($("input[name='pos1']").val()!="")&&($("input[name='pos2']").val()!="")&($("input[name='pos3']").val()!="")&&($("input[name='pos4']").val()!="")){
	// 		$("#check").removeAttr('disabled');
	// 	}
	// });
	$(document).click(function(){
		if (($("input[name='pos1']").val()!="")&&($("input[name='pos2']").val()!="")&($("input[name='pos3']").val()!="")&&($("input[name='pos4']").val()!="")){
			$("#check").removeAttr('disabled');
		}
	});
});