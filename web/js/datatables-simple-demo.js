window.addEventListener('DOMContentLoaded', event => {
    if (typeof simpleDatatables !== 'undefined') {
        const datatablesSimple = document.getElementById('datatablesSimple');
        
        if (datatablesSimple) {
            new simpleDatatables.DataTable(datatablesSimple);
        }
        
        // Xóa phần gán giá trị không sử dụng
    }
});
