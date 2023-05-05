function getPage(pageSize, pageIndex, totalCount, pages){
    $("#pageIndex").html(pageIndex == 1 ? 1 : pageIndex * pageSize - pageSize);
    $("#pageSize").html(pageIndex * pageSize >= totalCount ? totalCount : pageIndex * pageSize);
    $("#totalCount").html(totalCount);
    var option = {
        currentPage: pageIndex,
        totalPages: pages,
        size: "normal",
        bootstrapMajorVersion: 3,
        alignment: "right",
        numberOfPages: 5,
        useBootstrapTooltip: true,//是否显示tip提示框
        itemTexts: function (type, page, current) {
            switch (type) {
                case "first":
                    return "首页";
                case "prev":
                    return "上一页";
                case "next":
                    return "下一页";
                case "last":
                    return "末页";
                case "page":
                    return page;
            }
        },
        onPageClicked: function (event, originalEvent, type, page) {
            app.pageIndex = page;
            app.initialize();
        }
    }
    $('#pageLimit').bootstrapPaginator(option)
}