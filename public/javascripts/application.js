// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


jQuery(document).ready(function(){
    jQuery("#cost_grades").hide();
    jQuery("#tech_grades").hide();
    jQuery("#development_grades").hide();
    jQuery("#legal_grades").hide();
    jQuery("#risk_grades").hide();
    jQuery("#opportunities_grades").hide();  

    jQuery("#cost_icon").live('click',function(){
	element = jQuery("#cost_grades");
	if(element.is(":visible"))
	    element.hide(300);
	else
	    element.show(300);
    });

    jQuery("#tech_icon").live('click',function(){
	element = jQuery("#tech_grades");
	if(element.is(":visible"))
	    element.hide(300);
	else
	    element.show(300);
    });
    jQuery("#development_icon").live('click',function(){
	element = jQuery("#development_grades");
	if(element.is(":visible"))
	    element.hide(300);
	else
	    element.show(300);
    });
    jQuery("#legal_icon").live('click',function(){
	element = jQuery("#legal_grades");
	if(element.is(":visible"))
	    element.hide(300);
	else
	    element.show(300);
    });
    jQuery("#risk_icon").live('click',function(){
	element = jQuery("#risk_grades");
	if(element.is(":visible"))
	    element.hide(300);
	else
	    element.show(300);
    });
    jQuery("#opportunities_icon").live('click',function(){
	element = jQuery("#opportunities_grades");
	if(element.is(":visible"))
	    element.hide(300);
	else
	    element.show(300);
    });
});