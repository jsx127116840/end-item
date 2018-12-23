<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>



		<script type="text/javascript">
		$(function () {
            //下拉列表

            //验证框
            $("#addAlbumtitle").textbox({
                required: true,
                validType: "maxLength[20]"
            });


            $("#addAlbumbrief").textbox({
                required: true,
                validType: "maxLength[50]"
            });

            $("#addAlbumscore").textbox({
                required: true,
                validType: "maxLength[1]"
            });

            $("#addAlbumauthor").textbox({
                required: true,
                validType: "maxLength[20]"
            });

            $("#addAlbumbroadcast").textbox({
                required: true,
                validType: "maxLength[20]"
            });
            $("#addAlbumBtn").linkbutton({
                onClick: function () {

                    $("#addAlbumform").form("submit", {
                        url: "${pageContext.request.contextPath }/album/addAlbum",

                        onSubmit: function () {

                            return $("#addAlbumform").form("validate");
                        },
                        success: function () {
                            $("#addalbumwindow").dialog("close");
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

		<form id="addAlbumform" method="post" enctype="multipart/form-data">
			专辑标题：<input id="addAlbumtitle" name="title"/><br/>
			简介：<input id="addAlbumbrief" name="brief"/><br/>
			选择封面：<input type="file" name="al"/><br/>
			打分（1-5）：<input id="addAlbumscore" name="score"/><br/>
			作者：<input id="addAlbumauthor" name="author"/><br/>
			播音：<input id="addAlbumbroadcast" name="broadcast"/><br/>

			
			<a id="addAlbumBtn">添加</a>
			<a id="resetBtn">重置</a>
		
		
		</form>
		</div>
		
		
	