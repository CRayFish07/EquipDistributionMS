<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%-- <%@ page language="java" import="com.guanghua.ywgl.util.SessionUtil"%> --%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>板卡信息</title>
    <jsp:include page="../../../jspRef/MainFrameworkRef.jsp"></jsp:include>
  </head>
  
  <body style="padding:5px;">
  	<div class="easyui-layout" fit="true" border="false">
		    <div region="center" border="false">
					<div class="SearchCondition" id="tbar">
						<!--查找条件：这里到时可以替换 -->
						 	<jsp:include page="../../../jspRef/divSearch.jsp"></jsp:include>
						 <!--查找条件：这里到时可以替换 end -->
							<form id="ff" action="">
								<table class="SearchCondition" >
						    		 <tr>
										<td>局站：<input class="easyui-combobox" id="juZhan" name="juZhan" style="width:175px"></input></td>
										<td>机房：<input class="easyui-combobox" id="jiFang" name="jiFang"  style="width:175px"></td>
										<td>机柜：<input class="easyui-combobox" id="cabinetId" name="cabinetId"  style="width:150px"></input></td>
						    		 </tr>
						   		 	 <tr>
						   		 	 	<td>网元编号：<input id="gridId" placeHolder="请输入网元编号.." name="gridId"  style="width:150px"></input></td>
										<td>设备名称：<input id="equipmentName" placeHolder="请输入设备名称.." name="equipmentName"  style="width:150px"></input></td>
						    		 </tr>
									<tr>
										<td colspan="8">
											<div style="text-align:center;padding:5px">
										    	<input type="button" class="button" id="btnSearch" value="查询" onclick="javascript:bkxxQuery();"/>
										    	<input type="button" class="button" id="btnClearForm" value="重置" onclick="javascript:resert();"/>
							    				<input type="button" class="button" id="btnClearForm" value="批量导入" onclick="javascript:inserts();"/>
							    			</div>
										</td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
						    	</table>
						    </form>
					</div>
		<table style="width:1050px;" id="lstResult" class="easyui-datagrid" title="板卡-列表" iconCls="icon-comment_edit" pageSize="20" url="" rownumbers="true" 
			striped="true" remoteSort="true" fit="true" pagination="true" singleSelect="false" toolbar="#tbar">
		</table>
	</div>
	 </div>
	
	
  </body>
  
  <script type="text/javascript">
	function exc(){
		var rows = $('#lstResult').datagrid('getRows');
 		if (!rows || rows.length == 0) {
			$.messager.alert('提示信息','没有可供导出的数据');
			return false; 
		}
		var strUrl = '<%=path%>/jgxx/initJgxxListPage.do?';
		window.location.href=strUrl;
	}
    
  	
	$('#juZhan').combobox({
		url:'<%=path%>/jgxx/juzhan_list_search.action',
	    valueField:'REGION_ID',
	    textField:'REGION_NAME',
	    method:'get',
	    
	    onChange : function(){//局站添加onChange事件。
            var regionId = $("#juZhan").combobox("getValue") ;           
            //1.清空原来的机房combobox中的选项
            $("#jiFang").combobox("clear");     
            
            //2.动态添加"机房"的下拉列表框的option                    
            if( regionId != null && regionId != '' ){//2
            	//alert("rek====="+regionId);
            	$('#jiFang').combobox({
            		url:"<%=path%>/jgxx/jifang_list_search.action?regionId="+regionId,
            		
            	    valueField:'ROOM_ID',
            	    textField:'ROOM_NO',
             	    method:'get',
             	    //Onchange
             	    	onChange : function(){//局站添加onChange事件。
             	            var roomId = $("#jiFang").combobox("getValue") ;           
             	            //1.清空原来的机柜combobox中的选项
             	            $("#cabinetId").combobox("clear");     
             	            
             	            //2.动态添加"机柜"的下拉列表框的option                    
             	            if( roomId != null && roomId != '' ){//2
             	            	//alert("rek====="+regionId);
             	            	$('#cabinetId').combobox({
             	            		url:"<%=path%>/sbxx/cabinet_list_search.action?roomId="+roomId,
             	            		
             	            	    valueField:'CABINET_ID',
             	            	    textField:'CABINET_NAME',
             	             	    method:'get'
             	            	});
             	            }//-2
             			   }//onchange 结束
             	    //onchange end
            	});
            }//-2
		   }//onchange 结束
	    });
	
	function resert(){
		$("#jiFang").combobox("clear"); 
		$("#cabinetId").combobox("clear"); 
		$("#juZhan").combobox("setValue","");
		$("#jiFang").combobox("setValue","");
		$("#cabinetId").combobox("setValue","");
		$("#gridId").val("");
		$("#equipmentName").val("");
	}
	
	//批量导入进入选 择文件页面
	function inserts(){
		var cabinetId=$("#cabinetId").combobox("getValue");
		if(cabinetId==null||cabinetId==""){
			alert("请选择一个机柜！");
			return ;
		}
		$.ajax({
			async:false,
			dataType:"json",
			url:'<%=path%>/bkxx/equipment_list_judge.action?cabinetId='+cabinetId,
			success:(function(data){
				//var flag=eval(data.d);
				if(data[0].msg=="yes"){
					window.open('<%=path%>/jspRef/importCardList.jsp?cabinetId='+cabinetId,'newwindow','resizable=yes,scrollbars=yes,height=650,width=600,top=200,left=200');
				}else{
					alert('此机柜无设备无法导入！');
					return;
				}
			})
		});
			}
	
	
	function bkxxQuery(){
		$('#lstResult').datagrid('loadData', { total: 0, rows: [] });
		var juZhan=$("#juZhan").combobox("getValue");
		var jiFang=$("#jiFang").combobox("getValue");
		var cabinetId=$("#cabinetId").combobox("getValue");
		var gridId=document.getElementById("gridId").value; 
		var equipmentName=document.getElementById("equipmentName").value;
		
		$('#lstResult').datagrid({
				pageNumber:1,
				pageSize: 20,//每页显示的记录条数，默认为10  
                pageList: [10, 20,50,100, 200],//可以设置每页记录条数的列表 //   ywgl/ziChanGrid_list_seach.do
		        url:'<%=path%>/bkxx/bkxxListQuery.action', 
		         queryParams: {  		
		        	 juZhan:juZhan, 	
		        	 jiFang:jiFang,
		        	 cabinetId:cabinetId,
		        	 gridId:gridId,
		        	 equipmentName:equipmentName
				  },
		        columns:[[
		             {title:'板卡ID',field:'CARD_ID',width:'60',align:'left',hidden:true}, 
		             {title:'机房名称',field:'ROOM_NO',width:'160',align:'left'},
		             {title:'机柜编号',field:'CABINET_NUM',width:'60',align:'left'},
		             {title:'机柜面',field:'CABINET_SURFACE',width:'80',align:'left'},
		             {title:'网元编号',field:'NU_NUM',width:'180',align:'left'},
		             
		             {title:'设备名称',field:'EQUIP_NAME',width:'160',align:'left'},
		             {title:'板卡生产厂商',field:'MANUFACTURER',width:'130',align:'left'},
		             {title:'板卡类型',field:'CATEGORY',width:'150',align:'left'},
		             
		             {title:'板卡型号',field:'MODEL',width:'100',align:'left'},
		             {title:'板卡用途',field:'PURPOSE',width:'100',align:'left'},
		             {title:'板卡位置数',field:'POS_X',width:'80',align:'left'},
		             {title:'子框标志',field:'LABEL',width:'70',align:'left'},
		             
		             {title:'子框数量',field:'SUB_RACK_COUNT',width:'100',align:'left'}
				   	]],
		        method:'post'
		    });
	}
    
  </script>
</html>
