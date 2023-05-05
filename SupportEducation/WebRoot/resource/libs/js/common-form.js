var minDocumentHeight = 400;//默认最小高度600
var documentHeight = 400;//页面高度
var documentWidth = 0;//页面宽度
var tableIds = [];
var tableOffHeigth = 275;
var contentOffHeight = 190;
documentHeight = $(window).height()
var tableHeight = documentHeight - tableOffHeigth;
console.log("dcomentHegiht:" + documentHeight);
documentWidth = $(document).width();
//设置表格高度偏移量
function tableOffHeigthSet(value) {
    tableOffHeigth = value;
    tableHeight = documentHeight - tableOffHeigth;
    $.each(tableIds, function (item, value) {
        //tableHeight = documentHeight - tableOffHeigth;
        //console.log(" tableHeight:" + tableHeight);
        $(value).bootstrapTable("resetView", { height: tableHeight });
    });
}
//table 加载方法。重置数据
function tableLoad(id, data) {
    console.log(data);
    if (data == null) {
        return;
    }
    $(id).bootstrapTable("load", { total: data.total, rows: data.rows });
}