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
                treeField: 'title',
                onDblClickRow: function (row) {

                    var lever = $("#albumshow").treegrid("getLevel", row.id);

                    if (lever != 1) {

                        $("#audio").prop("src", "${pageContext.request.contextPath}/main/yinpin/" + row.url);

                    } else {
                        alert("请双击章节而非专辑");
                    }
                }
            });


            /*添加专辑  */
            $("#addalbumwindow").dialog({
                title: "添加",
                width: 400,
                height: 200,
                toolbar: "#addalbumbtn",
                closed: true,
                href: "${pageContext.request.contextPath }/main/addalbum.jsp",
                modal: true,
                cache: false,
                iconCls: "icon-man"
            });

            $("#aaddalbumbtn").linkbutton({
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

            //添加章节


            $("#aaddchapterbtn").linkbutton({
                iconCls: "icon-add",
                onClick: function () {
                    var row = $("#albumshow").treegrid("getSelected");
                    if (row != null) {
                        var lever = $("#albumshow").treegrid("getLevel", row.id);

                        if (lever != 1) {
                            alert("请选择专辑而非章节");
                        } else {
                            $("#addchapterwindow").dialog({
                                title: "添加",
                                width: 400,
                                height: 200,
                                toolbar: "#addchapterbtn",
                                closed: true,
                                href: "${pageContext.request.contextPath }/main/addchapter.jsp",
                                modal: true,
                                cache: false,
                                iconCls: "icon-man",
                                queryParams: {"id": row.id}
                            });
                            $("#addchapterwindow").dialog("open");
                        }
                    } else {
                        alert("请选中一行");

                    }
                }
            });
            $("#cclosebtn").linkbutton({
                iconCls: "icon-no",
                onClick: function () {
                    $("#addchapterwindow").dialog("close");
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

            //下载
            $("#downloadchapterbtn").linkbutton({
                iconCls: "icon-no",
                onClick: function () {
                    var row = $("#albumshow").treegrid("getSelected");
                    if (row != null) {
                        var lever = $("#albumshow").treegrid("getLevel", row.id);

                        if (lever != 1) {

                            $("#downloadchapterbtn").prop("href", "${pageContext.request.contextPath }/file/download?fname=" + row.url);

                        } else {
                            alert("请选择章节而非专辑");
                        }
                    } else {
                        alert("请选中章节");

                    }


                }
            });



        });

        function size(value, row, index) {

            if (value / 1024 > 1) {
                if ((value / 1024) / 1024 > 1) {
                    return "" + (value / 1024) / 1024 + "MB"
                } else {
                    return "" + value / 1024 + "kb"
                }

            } else if (value / 1024 < 1) {
                return value + "B";
            } else {
                return "";
            }

        }
		

			

		</script>

   
  <div>
    <table class="table" id="albumshow">
                    <audio id="audio" controls="controls" style="width: 80%"></audio>
    				<thead>
						<tr class="table_header">

							<th data-options="field:'title',width:1">章节名</th>
							<th data-options="field:'size',width:1,formatter:size ">大小</th>
							<th data-options="field:'url',width:1 ">文件名</th>
							<th data-options="field:'upload_date',width:1 ">上传日期</th>
							<th data-options="field:'duration',width:1 ">持续时间</th>
						</tr>
						</thead>
					</table>
					</div>

					<div id="albumshowtool">
						<a id="ashowmessagebtn">查看详情</a>
						<a id="aaddalbumbtn">添加专辑</a>
                        <a id="aaddchapterbtn">添加章节</a>
						<a id="downloadchapterbtn" href="">下载章节</a>
					</div>
				<div id="addalbum">	
						<div id="addalbumwindow"></div>
						<div id="addalbumbtn">
						<a id="aclosebtn">关闭</a>
						</div>
    			</div>
                <div id="addchapter">
						<div id="addchapterwindow"></div>
						<div id="addchapterbtn">

						</div>
    			</div>
				<div id="ashowmessage">
						<div id="ashowmessagewindow">

								<table id="messagetable">

									</table>



						</div>
				</div>

