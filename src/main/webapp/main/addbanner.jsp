<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>



		<script type="text/javascript">
		$(function () {
            //下拉列表

            //验证框
            $("#addBannertitle").textbox({
                required: true,
                validType: "maxLength[20]"
            });


            $("#addBannerdescription").textbox({
                required: true,
                validType: "maxLength[50]"
            });


            $("#addBannerBtn").linkbutton({
                onClick: function () {

                    $("#addBannerform").form("submit", {
                        url: "${pageContext.request.contextPath }/banner/addBanner",

                        onSubmit: function () {

                            return $("#addBannerform").form("validate");
                        },
                        success: function () {
                            $("#addwindow").dialog("close");
                            $("#bannershow").datagrid("reload");

                            $.messager.show({
                                title: "添加",
                                msg: "添加成功！"
                            });
                        },

                    });
                }

            });

            $("#resetBtn").linkbutton({
                onClick: function () {

                    $("input").textbox("clear");
                }

            });


            $.extend($.fn.validatebox.defaults.rules, {
                minLength: {
                    validator: function (val, par) {
                        return val.length >= par[0];
                    },
                    message: "at least {0} charaters"
                },
                maxLength: {
                    validator: function (val, par) {
                        return val.length <= par[0];
                    },
                    message: "max {0} charaters"
                },
                minEmailLength: {
                    validator: function (val, par) {
                        return val.length >= par[0];
                    },
                    message: "at least {0} charaters"
                },
                maxEmailLength: {
                    validator: function (val, par) {
                        return val.length <= par[0];
                    },
                    message: "max {0} charaters"
                }
            });


        });
		</script>
		<div style="background-color:lightblue; height: 150px; width: 380px">

		<form id="addBannerform" method="post" enctype="multipart/form-data">
			图片标题：<input id="addBannertitle" name="title"/><br/>
			描述：<input id="addBannerdescription" name="description"/><br/>

			选择图片：<input type="file" name="mf"/><br/>4
			是否立即轮播：<input type="radio" id="upstatus" name="status" value="true" checked="checked"/>轮播<input type="radio"
                                                                                                            id="updstatus"
                                                                                                            name="status"
                                                                                                            value="false"/>暂不<br/>
			
			<a id="addBannerBtn">添加</a>
			<a id="resetBtn">重置</a>
		
		
		</form>
		</div>
		
		
	