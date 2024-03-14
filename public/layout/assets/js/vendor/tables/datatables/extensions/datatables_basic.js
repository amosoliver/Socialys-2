const DatatableBasic = function() {

    // Setup module components
    const _componentDatatableBasic = function() {
        if (!$().DataTable) {
            console.warn('Warning - datatables.min.js não carregado.');
            return;
        }

        // Setting datatable defaults
        $.extend($.fn.dataTable.defaults, {
            autoWidth: false,
            columnDefs: [{
                orderable: false,
                width: 100,
                targets: [5]
            }],
            dom: '<"datatable-header"fl><"datatable-scroll"t><"datatable-footer"ip>',
            language: {
                search: '<span class="me-3">Filter:</span> <div class="form-control-feedback form-control-feedback-end flex-fill">_INPUT_<div class="form-control-feedback-icon"><i class="ph-magnifying-glass opacity-50"></i></div></div>',
                searchPlaceholder: 'Type to filter...',
                lengthMenu: '<span class="me-3">Show:</span> _MENU_',
                paginate: {
                    'first': 'First',
                    'last': 'Last',
                    'next': document.dir == "rtl" ? '&larr;' : '&rarr;',
                    'previous': document.dir == "rtl" ? '&rarr;' : '&larr;'
                }
            }
        });

        // Initialize DataTable on elements with class .datatable-basic if not initialized already
        $('.datatable-basic:not(.dataTable)').DataTable({
            responsive: true // Example option
        });

        // Alternative pagination
        $('.datatable-pagination:not(.dataTable)').DataTable({
            pagingType: "simple",
            language: {
                paginate: {
                    'next': document.dir == "rtl" ? 'Next &larr;' : 'Next &rarr;',
                    'previous': document.dir == "rtl" ? '&rarr; Prev' : '&larr; Prev'
                }
            }
        });

        // Initialize DataTable with saving state if not initialized already
        $('.datatable-save-state:not(.dataTable)').DataTable({
            stateSave: true
        });

        // Scrollable datatable
        const table = $('.datatable-scroll-y:not(.dataTable)').DataTable({
            autoWidth: true,
            scrollY: 300
        });

        // Resize scrollable table when sidebar width changes
        $('.sidebar-control').on('click', function() {
            table.columns.adjust().draw();
        });
    };

    return {
        init: function() {
            _componentDatatableBasic();
        }
    }
}();

document.addEventListener('DOMContentLoaded', function() {
    DatatableBasic.init();
});
