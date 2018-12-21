<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

		<script type="text/javascript">
		$(function () {


            $("#albumshow").treegrid({
                fitColumns: true,

                url: "${pageContext.request.contextPath }/album/showAllAlbum?time=" + new Date().getTime(),

                toolbar: "#albumshowtool",
                striped: true,

                singleSelect: true,
                title: "成员",
                iconCls: "icon-man",
                pagination: true,
                pageSize: 2,
                pageList: [2, 1, 10, 20],
                pageNumber: 1,
                idField: 'id',
                treeField: 'title'
            });


            /*添加  */
            $("#addalbumwindow").dialog({
                title: "添加",
                width: 400,
                height: 200,
                toolbar: "#addalbumbtn",
                closed: true,
                href: "${pageContext.request.contextPath }/main/addbanner.jsp",
                modal: true,
                cache: false,
                iconCls: "icon-man"
            });

            $("#aaddbtn").linkbutton({
                iconCls: "icon-add",
                onClick: function () {

                    $("#addalbumwindow").dialog("open");
                }
            });
            $("#aclosebtn").linkbutton({
                iconCls: "icon-no",
                onClick: function () {
                    $("#addalbumwindow").dialog("close");
                }
            });
            //查看详情


            $("#ashowmessagebtn").linkbutton({
                iconCls: "icon-more",
                onClick: function () {

                    var row = $("#albumshow").treegrid("getSelected");
                    if (row != null) {
                        var lever = $("#albumshow").treegrid("getLevel", row.id);

                        if (lever != 1) {
                            alert("请选择专辑而非章节");
                        } else {
                            $("#ashowmessagewindow").dialog({
                                title: "添加",
                                width: 400,
                                height: 200,
                                resizable: true,
                                closed: true,
                                modal: true,
                                cache: false,
                                iconCls: "icon-man",
                                onBeforeOpen: function () {
                                    $("#messagetable").empty();
                                    $("#messagetable").append("<tr style='background-color:lightblue; height: 150px; width: 520px' >" +
                                        "<td rowspan=4 style='border:2'><img src='${pageContext.request.contextPath }/main/zhuanji/" + row.cover_img + "' style='height:100px;''></td>" +
                                        "<td style='border:2'>" +
                                        "<p>|  专辑标题: " + row.title + "</p>" +
                                        "<p>|  集数: " + row.count + "</p>" +
                                        "<p>|  发布日期: " + row.pub_date + "</p>" +
                                        "</td>" +
                                        "<td style='border:2'>" +
                                        "<p>|  作者: " + row.author + "</p>" +
                                        "<p>|  播音: " + row.broadcast + "</p>" +
                                        "<p>|  分数: " + row.score + "</p>" +
                                        "</td>" +
                                        "<td style='border:2'>" +
                                        "<p>|  简介: " + row.brief + "</p>" +
                                        "</td>" +
                                        "</tr>");
                                }

                            });
                            $("#ashowmessagewindow").dialog("open");
                        }
                    } else {
                        alert("请选中一行");

                    }


                }
            });


        });

        function status(value, row, index) {
            if (value) {
                return "轮播中";
            } else {
                return "未轮播";
            }

        }
		

			

		</script>

   
  <div>
    <table class="table" id="albumshow">
  
    				<thead>
						<tr class="table_header">

							<th data-options="field:'title',width:1">章节名</th>
							<th data-options="field:'size',width:1 ">大小</th>
							<th data-options="field:'url',width:1 ">文件名</th>
							<th data-options="field:'upload_date',width:1 ">上传日期</th>
							<th data-options="field:'duration',width:1 ">持续时间</th>
						</tr>
						</thead>
					</table>
					</div>

					<div id="albumshowtool">
						<a id="ashowmessagebtn">查看详情</a>
						<a id="aaddbtn">添加</a>

					</div>
				<div id="addalbum">	
						<div id="addalbumwindow"></div>
						<div id="addalbumbtn">
						<a id="aclosebtn">关闭</a>
						</div>
    			</div>
				<div id="ashowmessage">
						<div id="ashowmessagewindow">

								<table id="messagetable">

									</table>



						</div>
				</div>

