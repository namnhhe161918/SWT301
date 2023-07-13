window.addEventListener('DOMContentLoaded', event => {
    if (typeof simpleDatatables !== 'undefined') {
        const datatablesSimple = document.getElementById('datatablesSimple');
        let myDataTable = null;
        
        if (datatablesSimple) {
            myDataTable = new simpleDatatables.DataTable(datatablesSimple);
        }
        
        // Sử dụng myDataTable cho các hoạt động liên quan đến bảng dữ liệu
        // Ví dụ: myDataTable.configure({ ... }), myDataTable.destroy(), myDataTable.update(), v.v.
    }
});
