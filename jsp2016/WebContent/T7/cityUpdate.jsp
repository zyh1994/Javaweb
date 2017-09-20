<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="bean.CityVo"%>
<%@page import="bean.ProvinceVo"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改城市资料</title>
    <script type="text/javascript">
    	function check(){
    		if(form1.cityName.value==""){
    			alert("请输入城市名称");
    			form1.cityName.focus();
    			return false;
    		}
    		return true;
    	}
    </script>
  </head>
  
  <body>
    <h1 align="center">修改城市资料</h1>
    <hr/>
    <form name="form1" action="<%=basePath%>CityServlet?action=updateSave" method="post" onsubmit="return check();">
    	<%
    		CityVo city = (CityVo)request.getAttribute("city");
    	%>
    	<input type="hidden" name="cityId" value="<%=city.getCityId() %>">
    	<table align="center" border="1" cellpadding="1" cellspacing="1" width="500">
		<tr height="40">
			<td align="right">省份名称：</td>
			<td>
				<select name="provinceId" style="width:155px">
				<%
					//获取request变量provList;
					List<ProvinceVo> provList = (List<ProvinceVo>)request.getAttribute("provList");
					if(provList!=null){
						for(int i=0;i<provList.size();i++){
							ProvinceVo p=provList.get(i);
							if(p.getProvinceId()==city.getProvinceId()){
								%>
								<!-- 如果要修改城市则选中省份名称 -->
								<option value="<%=p.getProvinceId() %>" selected="selected"><%=p.getProvinceName() %></option>
								<%
							}else{
							%>
								<!-- 如果不修改城市则不选中省份名称 -->
								<option value="<%=p.getProvinceId() %>"><%=p.getProvinceName() %></option>
							<%
							}
						}
					}
				 %>
				</select>
			</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td align="right">城市名称</td>
			<td><input type="text" name="cityName"  style="width:155px" value="<%=city.getCityName() %>"></td>
			<td><font size="2" color="red">*必填</font></td>
		</tr>
		<tr height="40">
			<td colspan="3" align="center"><input type="submit" value=" 保 存 "></td>
		</tr>
	</table>
    </form>
  </body>
</html>
