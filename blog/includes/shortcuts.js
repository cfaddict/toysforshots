var hObj;
hObj = {};
hObj[0] = {openTag:'<p>', closeTag:'<\/p>', shortCut:'ctrl+p', hint:'',autowire:true};
hObj[1] = {openTag:'<strong>', closeTag:'<\/strong>', shortCut:'ctrl+b', hint:'',autowire:true};
hObj[2] = {openTag:'<em>', closeTag:'<\/em>', shortCut:'ctrl+i', hint:'',autowire:true};
hObj[3] = {openTag:'<br \/>', closeTag:'', shortCut:'ctrl+return', hint:'',autowire:true};
hObj[4] = {openTag:'<blockquote>', closeTag:'<\/blockquote>', shortCut:'ctrl+q', hint:'',autowire:true};
hObj[5] = {openTag:'<ul>', closeTag:'<\/ul>', shortCut:'ctrl+u', hint:'',autowire:true};
hObj[6] = {openTag:'<a href="" target="_blank">', closeTag:'<\/a>', shortCut:'ctrl+k', hint:'',autowire:true};
hObj[7] = {openTag:'<li>', closeTag:'<\/li>', shortCut:'ctrl+l', hint:'',autowire:true};
hObj[8] = {openTag:'<textarea class="brush: coldfusion">', closeTag:'<\/textarea>', shortCut:'ctrl+shift+c', hint:'',autowire:true};
hObj[9] = {openTag:'<more/>', closeTag:'', shortCut:'ctrl+m', hint:'',autowire:true};
hObj[10] = {openTag:'', closeTag:'', shortCut:'shift+return', hint:'Break To Newline',autowire:false};

var bodyHasFocus = false;

$(document).ready(function(){
	$('#body').focus(function(){bodyHasFocus=true;}).blur(function(){bodyHasFocus=false;});
	
	$(document).bind('keydown','ctrl+h', function(e){help(e); return false;});
	
	jQuery.each(hObj,function(i, val) {
		var shortcut = val.shortCut;
		var autowire = val.autowire;
		if(autowire){
			$(document).bind('keydown',shortcut,function(e){insertTag(shortcut); return false});
		}
	});
	
	console.log('shortcuts run');
	
});

function insertTag(c){
	if(bodyHasFocus){
		var sTag,eTag;
		var range = $('#body').getSelection();
		var t = range.text;
		var inputOb = document.getElementById('body');
		var newT;
		var s,e;
		var top = $('#body').scrollTop();
		
		for(var key in hObj){
			if(c == hObj[key].shortCut){
				sTag = hObj[key].openTag;
				eTag = hObj[key].closeTag;
				break;
			}
		}
		if(sTag != undefined){
			newT = sTag + t + eTag;
			s = range.start + sTag.length;
			e = s + range.length;
			$('#body').replaceSelection(newT, true);
			var insideStartTag = $('#body').val().indexOf('>', range.start)+1;
			
			//set the cursor to the middle of the tag if empty, or highlight the contents of the new tag
			if(range.length > 0){
				setCaretPos(inputOb, s, e);
			}
			else{
				setCaretPos(inputOb, insideStartTag, insideStartTag);
			}
		}
		if(c == 'shift+return'){
			newline();
		}
	}
	
	fixScroll(top);
}

function newline(){
	var range = $('#body').getSelection();
	var eol = $('#body').val().indexOf('\n',range.start);
	var s = eol != -1 ? eol : $('#body').val().length;
	s += 1;
	var inputOb = document.getElementById('body');
	var top = $('#body').scrollTop();
	setCaretPos(inputOb,s,s);
	//$('#body').replaceSelection('\n', true);
	fixScroll(top);
}

function fixScroll(t){
	$('#body').scrollTop(t);
}
function help(){
	var msg = ''; //<strong>You may use the following shortcuts:<\/strong><br />
	var i;
	for(var key in hObj){
		i = hObj[key];
		msg += '<p><strong>' + i.shortCut + '<\/strong>: ' + htmlEditFormat(i.openTag) + htmlEditFormat(i.closeTag) + ' ' + i.hint + '<\/p>';
	}
	
	$.modaldialog.prompt(msg,{
  		title: 'Keyboard Shortcut Help',
		width: 300
  	});
}
function htmlEditFormat(h){
	return h.split("&").join("&amp;").split( "<").join("&lt;").split(">").join("&gt;");
}
function setCaretPos(input,start,end){
	if(input.createTextRange){
		var range = input.createTextRange();
		range.collapse(true);
		range.moveEnd('character',end);
		range.moveStart('character',start)
		range.select()
	}
	else if(input.setSelectionRange){
		input.focus();
		input.setSelectionRange(start, end);
	}
}