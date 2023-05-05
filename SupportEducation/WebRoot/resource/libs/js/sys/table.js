function tableLoad(id, data) {
    console.log(data)
    if (data == null) {
        return;
    }
    $(id).bootstrapTable("load", { total: data.totalCount, rows: data.records });
}