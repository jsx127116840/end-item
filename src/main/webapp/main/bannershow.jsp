<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

		<script type="text/javascript">
		$(function () {


            $("#bannershow").edatagrid({

                fitColumns: true,

                url: "${pageContext.request.contextPath }/banner/showBanner?time=" + new Date().getTime(),
                updateUrl: "${pageContext.request.contextPath }/banner/updateBanner?time=" + new Date().getTime(),
                toolbar: "#bannershowtool",
                striped: true,
                rownumbers: true,
                singleSelect: true,
                title: "成员",
                iconCls: "icon-man",
                pagination: true,
                pageSize: 2,
                pageList: [2, 1, 10, 20],
                pageNumber: 1,
                view: detailview,
                detailFormatter: function (rowIndex, rowData) {
                    var status;
                    if (rowData.status) {
                        status = "轮播中";
                    } else {
                        status = "已下架";
                    }

                    return "<div style='background-color:lightblue'><table ><tr>" +
                        "<td rowspan=4 style='border:2'><img src='${pageContext.request.contextPath }/main/shouye/" + rowData.img_path + "' style='height:100px;''></td>" +
                        "<td style='border:2'>" +
                        "<p>|  图片标题: " + rowData.title + "</p>" +
                        "<p>|  状态: " + status + "</p>" +
                        "<p>|  发布日期: " + rowData.pub_date + "</p>" +
                        "</td>" +
                        "<td style='border:2'>" +
                        "<p>|  描述: " + rowData.description + "</p>" +

                        "</td>" +
                        "</tr></table></div>";
                }

            });


            /*添加  */
            $("#addbannerwindow").dialog({
                title: "添加",
                width: 400,
                height: 200,
                toolbar: "#addbannerbtn",
                closed: true,
                href: "${pageContext.request.contextPath }/main/addbanner.jsp",
                modal: true,
                cache: false,
                iconCls: "icon-man"
            });

            $("#baddbtn").linkbutton({
                iconCls: "icon-add",
                onClick: function () {

                    $("#addbannerwindow").dialog("open");
                }
            });
            $("#bclosebtn").linkbutton({
                iconCls: "icon-no",
                onClick: function () {
                    $("#addbannerwindow").dialog("close");
                }
            });
            //修改
            $("#bupdatebtn").linkbutton({
                iconCls: "icon-edit",
                onClick: function () {

                    var row = $("#bannershow").edatagrid("getSelected");

                    if (row != null) {

                        var index = $("#bannershow").edatagrid("getRowIndex", row);
                        $("#bannershow").edatagrid("editRow", index);

                    } else {
                        alert("请选中一行");

                    }

                }
            });
            //删除
            $("#bdelbtn").linkbutton({
                iconCls: "icon-remove",
                onClick: function () {
                    var row = $("#bannershow").edatagrid("getSelected");
                    $.ajax({
                        type: "GET",//请求⽅式
                        url: "${pageContext.request.contextPath }/banner/deleteBanner?time=" + new Date().getTime(),//请求路径
                        data: "id=" + row.id,//请求参数
                        dataType: "JSON",//预期服务器的响应格式
                        success: function (result) {
                            $("#bannershow").edatagrid("reload");
                        }
                    })

                }
            });
            //保存
            $("#bsavebtn").linkbutton({
                iconCls: "icon-save",
                onClick: function () {
                    var row = $("#bannershow").edatagrid("getSelected");
                    $("#bannershow").edatagrid("saveRow");
                    $("#bannershow").edatagrid("reload");


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
    <table class="table" id="bannershow">

    				<thead>
						<tr class="table_header">
							<th data-options="field:'id',width:1">ID</th>
							<th data-options="field:'title',width:1">图片名</th>
							<th data-options="field:'pub_date',width:1 ">发布时间</th>
							<th data-options="field:'status',width:1,formatter:status"
                                editor="{type:'text',options:{required:true}}">当前状态</th>

						</tr>
						</thead>
					</table>
					</div>

					<div id="bannershowtool">
						<a id="baddbtn">添加</a>
						<a id="bupdatebtn">修改</a>
						<a id="bdelbtn">删除</a>
						<a id="bsavebtn">保存</a>
					</div>
				<div id="addbanner">
						<div id="addbannerwindow"></div>
						<div id="addbannerbtn">
						<a id="bclosebtn">关闭</a>
						</div>
    			</div>

