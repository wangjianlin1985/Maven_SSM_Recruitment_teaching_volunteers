function tableLoad(id, data) {
    if (data == null) {
        return;
    }
    $(id).bootstrapTable("load", { total: data.totalCount, rows: data.items });
}