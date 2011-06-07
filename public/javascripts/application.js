// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
    $("#cost_grades").hide();
    $("#tech_grades").hide();
    $("#development_grades").hide();
    $("#legal_grades").hide();
    $("#risk_grades").hide();
    $("#opportunities_grades").hide();  

    $("#cost_icon").live('click',function(){
	element = $("#cost_grades");
	if(element.is(":visible"))
	    element.hide(300);
	else
	    element.show(300);
    });

    $("#tech_icon").live('click',function(){
	element = $("#tech_grades");
	if(element.is(":visible"))
	    element.hide(300);
	else
	    element.show(300);
    });
    $("#development_icon").live('click',function(){
	element = $("#development_grades");
	if(element.is(":visible"))
	    element.hide(300);
	else
	    element.show(300);
    });
    $("#legal_icon").live('click',function(){
	element = $("#legal_grades");
	if(element.is(":visible"))
	    element.hide(300);
	else
	    element.show(300);
    });
    $("#risk_icon").live('click',function(){
	element = $("#risk_grades");
	if(element.is(":visible"))
	    element.hide(300);
	else
	    element.show(300);
    });
    $("#opportunities_icon").live('click',function(){
	element = $("#opportunities_grades");
	if(element.is(":visible"))
	    element.hide(300);
	else
	    element.show(300);
    });
});