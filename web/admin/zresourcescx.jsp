﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@page import="java.io.InputStream"%>
<%@page import="org.apache.ibatis.io.Resources"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.io.IOException"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactoryBuilder"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<%@page import="java.io.InputStream"%> 
<%@page import="java.io.IOException"%>  
<%@page import="util.PageManager"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
HashMap user = Info.getUser(request);
String uname = user.get("uname").toString();
String utype = user.get("utype").toString();
String userid = user.get("id").toString();
 %> 

<jsp:include page="/itivtmgr/toadmintop.do"></jsp:include>

<form name="f1" autocomplete="off"  action="/itivtmgr/zresources/zresourcescx.do"  method="post" style="display: inline;font-size: 14px">
<div class="ms-panel">
	<div class="ms-panel-header">
		<h6>站内资讯</h6>
	</div>
	<div class="ms-panel-body">

		<div class="table-responsive">
			<table class="table table-bordered thead-primary">

                <tr>
				  <td colspan=6 style="padding: 12px">   
				  
				   &nbsp;


 标题 
: 
<input type=text class=''  size=15 name='ntitle' />
&nbsp; 
类别 
 : 
${btypeselect}&nbsp; 


 发布人 
: 
<input type=text class=''  size=15 name='uname' />
&nbsp; 

 
发布时间  : 
 
<input type=text class=''  size=9 name='startsavetime' onclick='WdatePicker();' />
 至 

<input type=text class=''  size=9 name='endsavetime' onclick='WdatePicker();' />
&nbsp; 

<table><tr><td style='border: 0px;height: 1px;padding: 7px'></td></tr></table>&nbsp;

<input type=hidden  name='zdycol' id='zdycol' />
  
<input type=submit class='"+showbuttoncss+"' value=' 查询信息 ' />&nbsp;&nbsp;


  
<input type=button   class='' value=' 添加信息 ' onclick="window.location.replace('/itivtmgr/zresources/tozresourcestj.do')" />&nbsp;&nbsp; 
 
<input type=button   class='' value=' 批量删除 ' onclick="batchDelete()" />&nbsp;&nbsp;

 </td> 
				</tr> 
                <tr> 
					<th scope="col" width='3%'><input type="checkbox" value='' id='aplids' onclick='ckplids();' /></th>
<th scope="col">标题</th>
<th scope="col">类别</th>
<th scope="col">发布人</th>
<th scope="col">发布时间</th>
<th scope="col">操作</th> 
				</tr> 
				
<c:forEach items="${slist}" var="sdata" varStatus="sta">
<tr>
 
					<td scope="col" width='3%' >
<input type='checkbox' value='${sdata.id}' name='plids' />
          </td>
 
					<td scope="col">${sdata.ntitle}</td> 
					<td scope="col">${sdata.btype}</td> 
					<td scope="col">${sdata.uname}</td> 
					<td scope="col">${sdata.savetime}</td> 
					<td scope="col">
<!--
<a href="/itivtmgr/zresources/customUpdate.do?surl=zresourcescx&author=有效&id=${sdata.id}">有效</a>
 | 
<a href="/itivtmgr/zresources/customUpdate.do?surl=zresourcescx&author=无效&id=${sdata.id}">无效</a>
 | 
--><a href="/itivtmgr/zresources/tozresourcesxg.do?id=${sdata.id}">修改</a>
 | 
<a onclick="return confirm('确定要删除这条记录吗?')" href="/itivtmgr/zresources/delete.do?plids=${sdata.id}&surl=zresourcescx">删除</a>
</td>
</tr>
</c:forEach> 
				<tr> 
					<td colspan=6 align="center">${page.info}</td> 
				</tr>
		 
 

			</table>
		</div>
	</div>
</div>
</form>

<jsp:include page="/itivtmgr/toadminfoot.do"></jsp:include>


<c:if test="${!empty sessionScope.suc}">
<c:remove var="suc" scope="session" />
<script type="text/javascript"> 
alert("操作成功"); 
</script>
<c:remove var="suc" scope="session" />
</c:if> 
            
<script language=javascript src='/itivtmgr/js/ajax.js'></script>
${fillForm} 
<script language=javascript >  
 
</script>  
${fillForm} 
<script language=javascript src='/itivtmgr/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/itivtmgr/js/popup.js'></script>
<script language=javascript> 
function update(no){ 
pop('zresourcesxg.jsp?id='+no,'信息修改',550,'100%') 
}
</script> 
<script language=javascript> 
function add(){ 
pop('zresourcestj.jsp','信息添加',550,'100%') 
}
</script> 
<script language=javascript> 
function batchUpdate(col,cvalue,id){ 
if(countplids()) { 
f1.action='/itivtmgr/zresources/customUpdate.do?surl=zresourcescx&col='+col+''; 
f1.zdycol.value=cvalue; 
f1.submit(); 
}
}
</script> 
<script language=javascript> 
function batchDelete(){ 
if(confirm('是否确认删除？')){ 
if(countplids()) { 
f1.action='/itivtmgr/zresources/delete.do?surl=zresourcescx'; 
f1.submit(); 
}
}
}
</script> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
