<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>



		<script type="text/javascript">
		$(function () {
            //下拉列表

            //验证框
            $("#addchaptertitle").textbox({
                required: true,
                validType: "maxLength[20]"
            });


            $("#addchaptersize").textbox({
                required: true,
                validType: "maxLength[50]"
            });

            $("#addchapterduration").textbox({
                required: true,
                validType: "maxLength[20]"
            });

            $("#addchapterauthor").textbox({
                required: true,
                validType: "maxLength[20]"
            });

            $("#addchapterbroadcast").textbox({
                required: true,
                validType: "maxLength[20]"
            });
            $("#addchapterBtn").linkbutton({
                onClick: function () {

                    $("#addchapterform").form("submit", {
                        url: "${pageContext.request.contextPath }/album/addChapter",
                        queryParams: {"album_id":${param.id}},
                        onSubmit: function () {

                            return $("#addchapterform").form("validate");
                        },
                        success: function () {
                            $("#addchapterwindow").dialog("close");
                            $("#albumshow").treegrid("reload");

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

		<form id="addchapterform" method="post" enctype="multipart/form-data">
			章节标题：<input id="addchaptertitle" name="title"/><br/>

			选择音频：<input type="file" name="ch"/><br/>



			
			<a id="addchapterBtn">添加</a>
			<a id="resetBtn">重置</a>
		
		
		</form>
		</div>
		
		
	