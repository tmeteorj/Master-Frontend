var refresh = 0;
var menuid = 0;
//XMLHttpRequest 

var xmlhttp = false;

if (window.XMLHttpRequest)
{// code for all new browsers
xmlhttp=new XMLHttpRequest();
}
else if (window.ActiveXObject)
{// code for IE5 and IE6
xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
}


function evet(){
	$(".tree_div").mouseover(function(){
		$("#tree_bg").show();
		var offset = $(this).offset();
		var offset3 = $("#tree_box").offset();
		var y = offset.top - offset3.top+2;
		$("#tree_bg").css({"top":y+'px',"*top":(y+2)+'px'});
	});
	$(".tree_div").mouseout(function(){$("#tree_bg").hide();});
	$(".tree_div").click(function(){
		$("#tree_bj").css("height","0px");
		$("#tree_bg").hide();
		var offset = $(this).offset();
		var offset3 = $("#tree_box").offset();
		var y = offset.top - offset3.top+2;
		$("#tree_click").show();
		$("#tree_click").css("top",y+"px");
	});
}

$(document).ready(function(){
	$(".menu").click(function(){
	$("#tree_click").hide();
	$("#tree_bg").hide();
	$("#menu_name").html($(this).attr('alt'));
	$(".menu").removeClass("selected");
	$(this).addClass("selected");});
});

function get_menu(id,obj,islen){
	if(islen==0)
	{
		$("#tree_box").css('top', 0);
	}
	if (islen==0)
	{
		menuid = id;
	}
	//$('#position').load($('#upurl').val()+id);
	$("#"+obj).html('<img src="'+site_url+'images/loading.gif" width="16" height="16" border="0" />');
	var touimg_src = '';
	var img_src = '';
	var mleft = 's';
	var regexp = /(.*)images\/elbow-end-plus/;
	if ($("#tree_"+id).css("display")=='none'){
		if (regexp.test($("#touimg_"+id).attr("src")))
		{
			touimg_src = 'elbow-end-minus.gif';
			mleft = 'ss';
		}else{
			touimg_src = 'elbow-minus.gif';
		}
		img_src = "folder-open.gif";
		$("#tree_"+id).show();
	}else{
		if (regexp.test($("#touimg_"+id).attr("src")))
		{
			touimg_src = 'elbow-end-plus.gif';
		}else{
			touimg_src = 'elbow-plus.gif';
		}
		img_src = "folder.gif";
		$("#tree_"+id).hide();
	}
	$("#touimg_"+id).attr('src',site_url+'images/'+touimg_src);
	$("#img_"+id).attr('src',site_url+'images/'+img_src);
	
	xmlhttp.open("GET",$('#menulisturl').val()+id, true);
	xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlhttp.send(null);
	xmlhttp.onreadystatechange=function(){
		if (4==xmlhttp.readyState){
			if (200==xmlhttp.status || xmlhttp.status == 0){
				//alert(xmlhttp.responseText);
			    var json = eval("("+xmlhttp.responseText+")");
				var htmls="";
				var isend ="tree_line";
				var open = new Array();
					$.each(json,function(i,n){
						if (n.name != undefined)
						{
							var click,img,touimg='';
							if(n.isfolder==true){
								if(n.isopen == true){
									open.push(n.menuid);
								}
								img = "folder.gif";
								click = " get_menu("+n.menuid+",'tree_"+n.menuid+"',"+(islen+1)+");";
								if(n.url !== '') click += 'document.getElementById(\''+n.target+'\').src=\''+n.url+'\';';
								if(n.menuid == json.max){
									touimg = "elbow-end-plus.gif";
									isend = "end";
								}else{
									touimg = "elbow-plus.gif";
								}
							}else{
								img = "leaf.gif";
								if(n.url !== '') click = 'document.getElementById(\''+n.target+'\').src=\''+n.url+'\';';
								if (n.menuid == json.max)
								{
									touimg = 'elbow-end.gif';
								}else{
									touimg = 'elbow.gif';
								}
								if(n.isopen == true){
									$('#'+n.target).attr("src",n.url);
								}
							}
							htmls += "<div class='tree_div' onclick=\""+click+"\" id='tree_div_"+n.menuid+"'>";
							var width = islen*16;
							htmls += '<span class="tree_img"><img src="'+site_url+'images/'+touimg+'" id="touimg_'+n.menuid+'" width="16" height="18" border="0" /><img src="'+site_url+'images/'+img+'" id="img_'+n.menuid+'" width="16" height="16" border="0" /></span><span class="tree_text">'+n.name+'</span></div>';
							if(n.isfolder==1){htmls +='<div id="tree_'+n.menuid+'" class="'+isend+'" style="display:none;"></div>';}
						}
					});
					if (htmls)
					{
						$("#"+obj).html(htmls);
					}else{
						$("#tree_"+id).hide();
					}
					if(open)
					{
						$.each(open,function(i,n){get_menu(n,'tree_'+n,1);});
					}
					evet();
			}else{
				alert("error!");
			}
		}
	};
}

function menu_refresh()
{
	if (refresh==1)
	{
		refresh = 0;
		$('#menurefresh').attr('title', '�������Ϊˢ��״̬');
		$('#menurefresh').attr('alt', '�������Ϊˢ��״̬');
		$('#menurefresh').attr('src', 'admin/skin/images/refresh.gif');
	}
	else
	{
		refresh = 1;
		$('#menurefresh').attr('title', '�������Ϊ����״̬');
		$('#menurefresh').attr('alt', '�������Ϊ����״̬');
		$('#menurefresh').attr('src', 'admin/skin/images/refreshed.gif');		
		get_menu(menuid, 'tree', 0);
		setTimeout(menu_refresh, 30000);	
	}
}