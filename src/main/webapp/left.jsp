<%@ page pageEncoding="UTF-8" %>

<script type="text/javascript">
$(function () {
    $.ajax({
        type: 'POST',

        dataType: "json",
        url: '${pageContext.request.contextPath}/menu/getFatherMenu',//获取菜单
        success: function (data) {
            $.each(data, function (i, n) { //加载父类节点即一级菜单
                var id = n.id;
                var text1 = n.title;
                if (i == 0) { //显示第一个一级菜单下的二级菜单
                    $('#layout_west_accordion').accordion('add', {
                        title: n.title,
                        iconCls: n.iconcls,
                        selected: true,
                        //可在这加HTML代码，改变布局
                        content: '<div style="padding:10px 0px"><ul id="tree' + id + '"></ul></div>',
                    });
                } else {
                    $('#layout_west_accordion').accordion('add', {
                        title: n.title,
                        iconCls: n.iconcls,
                        selected: false,
                        content: '<div style="padding:10px 0px"><ul id="tree' + id + '"></ul></div>',
                    });
                }

                $.ajax({
                    type: 'POST',
                    async: false,
                    dataType: "json",
                    url: '${pageContext.request.contextPath}/menu/getSonMenuByParent_id?parent_id=' + id,
                    success: function (data) {
                        $("#tree" + id).tree({
                            data: data,
                            animate: true,
                            //iconCls: icon-blank,
                            //在树节点加图片
                            formatter: function (node) {
                                return '<img src="images/admin.gif"/>' + node.title;
                            },
                            //lines: true, //显示虚线效果
                            onClick: function (node) { // 在用户点击一个子节点即二级菜单时触发addTab()方法,用于添加tabs
                                //if(node.url){//判断url是否存在，存在则创建tabs
                                if (node) {
                                    addTab(node);
                                }
                            }

                        });
                    }

                });
            })
        }

    });
});


//添加标签页/选项卡（相当于一个父tabs，其他的都是添加在这个之上，没有这个下面添加不起tabs）

// add a new tab panel
function addTab(node) {
    //var t=$.trim(t);
    var tabExitOrNot = $('#tt').tabs('exists', node.title);//判断此选项卡是否已存在
    if (tabExitOrNot == true) {
        $('#mt-tabs').tabs('select', node.title);
        return;
    }
    //添加选项卡
    $('#tt').tabs('add', {
        title: node.title,
        //content: '<iframe scrolling="auto" frameborder="0" src="${pageContext.request.contextPath}'+ node.url +'" style="width:100%;height:600px;"></iframe>',
        closable: true,
        tools: [{
            iconCls: 'icon-mini-refresh',
            handler: function () {
                alert('refresh');
            }
        }]

    });
}



</script>


<div id="layout_west_accordion" class="easyui-accordion"
     data-options="fit:true,border:false,nimate:true,lines:true"></div>
</div>