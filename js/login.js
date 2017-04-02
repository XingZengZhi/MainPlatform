/*
 * 维修工登录页JS
 * 
 * */
$(function(){
	$("input").prop("autocomplete","off");
	$("input[type='text']").val("");
	var per = $("input[name='permissions']");
	var showPer = $("#permissions");
	per.click(function(){
		showPer.animate({
			right:"1%"
		},500);
	});
	
	var p = $("#permissions p");
	p.click(function(){
		per.prop("value",$(this).text());
		showPer.animate({
			right:"-10%"
		},500);
	});
	
	$("input[type='submit']").click(function(){
		if(per.val() == "")return false;
	});
});
