var tab = new Ext.TabPanel({
    region: 'center',
    id: 'j_managerFrame',
    deferredRender: false,
    activeTab: 0,
    resizeTabs: true, // turn on tab resizing
    minTabWidth: 115,
    tabWidth: 135,
    
    enableTabScroll: true
});


var treeStore = Ext.create('Ext.data.TreeStore', {
    proxy: {
        type: 'ajax',
        url: '/ashx/menu.ashx',
        reader: {
            type: 'json'
        }
    }

    //菜单的数据形态c参见根目录下： menu.json /ashx/menu.ashx

});


Ext.onReady(function () {
    var viewport = new Ext.Viewport({
        width: 1280,
        height: 760,
        layout: 'border', // border布局
        items: [{
            region: 'north', // 必须用region参数指定位置
            xtype: 'panel',
            height: 50,
            frame: true,
            split: false, // split属性是设置除了center区域外是否可调节大小
            html: "<div style='text-align:center;line-height:45px;font-size:24px;'>后台管理系统</b>",
            margins: '0 0 0 0'
            // title: 'South Region is collapsible', //要想设置折叠必须设置title
            // collapsible: true
        }, {
            title: 'West Region is collapsible',
            region: 'west',
            xtype: 'panel',
            width: 200,
            collapsible: true, // 设置可折叠
            id: 'west-region-container',
            layout: 'fit',
            margins: '0 0 0 0',
            title: '后台管理系统',
            items: [{
                xtype: 'treepanel',
                title: '',
                rootVisible: false,
                expanded: false,
                listeners: {
                    itemclick: function (view, record, item, index, e, eOpts) {

                        if (record.get('leaf')) { //叶子节点
                            var id = record.get('id');
                            if (Ext.getCmp(id)) {
                                tab.setActiveTab(id);
                            }
                            else {
                                tab.add({
                                    title: record.get('text'),
                                    //html: 'tab内容--' + record.get('text'),
                                    html: "<iframe id='j_"+id+"Iframe' scrolling='auto' frameborder='0' width='100%' height='100%' src='" + record.get('dataUrl') + "'></iframe>",
                                    closable: true,
                                    id: id
                                });
                                console.log(record.get('dataUrl'));
                                tab.setActiveTab(id); /*激活新的选项卡*/
                            }
                        }
                    }
                },
                containerScroll: true,
                store: treeStore,
                viewConfig: {
                }
            }]
        },
        tab// 初始标签页
        ]
    });
});