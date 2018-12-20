<%@ page pageEncoding="utf-8" %>

[
	{
		"text":"功能菜单",
		"children":[
			{
				"text":"主页",
				"attributes":{
					"aaa":"xxx",
					"mypath":"${pageContext.request.contextPath}/index.jsp"
				}
			},{
				"text":"通讯录管理",
				"attributes":{
					"aaa":"bbb",
					"mypath":"${pageContext.request.contextPath}/queryByPage.jsp"
				}
			}
		]
	}
]