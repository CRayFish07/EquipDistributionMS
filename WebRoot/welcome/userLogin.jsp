<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<head>
		<meta charset="UTF-8">
		<title>上海电信机房设备管理系统/用户登录</title>
		<link rel="stylesheet" href="../css/style.css" /> 
		<link rel="stylesheet" type="text/css" href="../js/easyui/themes/default/easyui.css">   
		<link rel="stylesheet" type="text/css" href="../js/easyui/themes/icon.css">  
		<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
		<style type="text/css">
			.code{width:72px;height:24px;margin-right:6px;cursor:pointer;border:1px solid #e3e3e3}
		</style>
		<script type="text/javascript" src="../js/easyui/jquery.min.js"></script>   
		<script type="text/javascript" src="../js/easyui/jquery.easyui.min.js"></script> 
		<script type="text/javascript" src="../js/bootstrap.min.js"></script>
		<script type="text/javascript">
			function formSub() {
				//return $("#jvForm").form("validate");
				$("#jvForm").submit();
			}
			function showMsg(){
				$("#winMsg").dialog("open");
			}
			
			function changeCode(){
				$('.code').attr("src","<%=path %>/getSecurityCode.action?timestap="+new Date().getTime());
			}
			
			</script>
	</head>
		<body >  
			<div id="cc" class="easyui-layout" style="width:1000px;height:750px;overflow:hidden;margin: 0 auto;" >   
			<div data-options="region:'north'" style="height:50px;" border="false" ></div>   
			<div data-options="region:'center'" style="padding:0px;background:#eee;" >
				
				 		 <div class="easyui-layout" fit="true" border="false">
				 		 	<!--
                              	描述：左边 图和文字
                              -->
				 		 	 <div data-options="region:'west'" style="width:570px;text-align:center;" border="false">
				 		 	 	<div class="easyui-layout" fit="true" border="false">
				 		 	 		<div region="north" style="height:50px;" border="false"> </div>
	                               <div region="west" border="false" style="width:300px;height:90px;background:url(../img/timg.png);background-repeat: no-repeat;">
	                               </div>
	                               <div region="center" style="font-family:'微软雅黑';" border="false">
	                                    <p style="position: relative;margin-top:80px;padding-left:20px;">
	                                        <span style="font-size:28px;font-weight:600;">上海电信<br />机房设备分布<br />管理系统</span><br/>
	                                        <span>Shanghai Telecom Room Equipment Distribution Management System</span>
	                                    </p>
	                               </div>
	                           </div>
				 		 	 </div>   <!--左边 end-->
				 		 	<div region="center" border="false">
                            <div class="easyui-layout" fit="true" border="false" >
                                <div data-options="region:'north'" style="height:50px;" border="false">
                                	
                                </div>
                                <div region="west" style="width:50px;position: relative;" border="false">
                                    <img src="../img/split.png" style="position:absolute;left:0px;top:80px;"/>
                                </div>
                                <div region="center"  border="false">
                                    <div class="easyui-panel" title="欢迎登录"  iconCls="icon-user"
                                         style="text-align: center;width:300px;height:300px;padding-top:20px;">
                                        <form id="jvForm" action="<%=path %>/user/login.action"  method="post">
                                           <%--  <ul class="uls form">
                                            <li id="errorName" class="errorTip" <c:if test="${empty error }">style="display:none"</c:if> >${error}</li>
											</ul> --%>
                                            <div>
                                                <input class="easyui-textbox" id="userName" name="userName" 
                                                       data-options="iconCls:'icon-man',prompt:'请输入用户名'"
                                                       style="width:240px;height:30px;"/>
                                            </div>
                                            <div style="margin-top: 20px;">
                                                <input class="easyui-textbox" type="password" id="password" name="password"
                                                       data-options="iconCls:'icon-lock',prompt:'请输入密码'"
                                                       style="width:240px;height:30px;"/>
                                            </div>
                                             <div style="margin-top: 10px;">
					                               <input class="easyui-textbox" type="text" id="captcha" name="captcha" 
					                                      data-options="iconCls:'icon-application_lightning',prompt:'请输入验证码'"
					                                      style="width:130px;height:30px;"/>
					                                <img src="<%=path %>/getSecurityCode.action" onclick="changeCode()" class="code" alt="换一张" />
						                            <a href="javascript:void(0)" onclick="changeCode()" class="easyui-linkbutton" iconCls="icon-reload" title="换一张"></a>
					                         </div>
                                            <c:if test="${!empty error}">
                                             <div style="margin-top: 10px;">
                                            	<ul class="uls form">
													<li id="errorName" class="errorTip" >${error}</li>
												</ul>
                                            </div>
                                            </c:if>
                                            <div style="margin-top: 50px;">
                                                <p>
                                                    <a href="javascript:void(0)" onclick="formSub()" style="width:160px;height:30px;" class="easyui-linkbutton" iconCls="icon-accept">登录</a>
                                                    <a style="margin-left:10px;width:80px;height:30px;"  href="<%=path %>/jspRef/forgetPwd.jsp"  >忘记密码?</a>
                                                </p>
                                            </div>
                                           
                                        </form>
                                    </div>
                                </div>
                                <!-- 忘记密码友情提醒！ -->
                                <div id="winMsg" class="easyui-window" data-options="modal: true"  title="忘记密码" closed="true" style="width:300px;height:200px;padding:5px;">
										<!-- <ul class="uls form">
											<li id="errorName" class="errorTip" >1.通过邮箱找回</li>
											<li id="errorName" class="errorTip" >2.人工找回[联系公司系统管理员，请求密码重置]</li>
										</ul> -->
										<div class="uls form">
											<h5>1.快速找回</h5><br>
											<a class="errorTip" >通过邮箱找回</a>
											<h5>2.人工找回</h5><br>
											<font class="errorTip" >联系公司系统管理员，请求密码重置</font>
										</div>
									
								</div>
                                <!-- 友情提醒end -->
                                <div region="east" style="width:20px;" border="false">
                                </div>
                                <div region="south" style="height:10px;" border="false">
                                	
                                </div>
                            </div>
                       </div>

				 		 	  
						 </div>
	   
			</div>   
			<div data-options="region:'south',split:false" style="height:30px;text-align: center;" border="false">
				版权所有@上海电信机房设备分布管理系统  Copyright 2016-2017
			</div> 
			</div>
		</body>
</html>
