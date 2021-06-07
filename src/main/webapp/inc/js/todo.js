window.onload = function () {
    bootlint.showLintReportForCurrentDocument([], {
        hasProblems: false,
        problemFree: false
    });

    $('[data-toggle="tooltip"]').tooltip();

    function formatDate(date) {
        return (
             date.getFullYear()+
            "-" +
            (date.getMonth() + 1) +
            "-" +
            date.getDate()
            
        );
    }

    var currentDate = formatDate(new Date());

    $(".due-date-button").datepicker({
        format: "dd mmmm yyyy",
        autoclose: true,
        todayHighlight: true,
        startDate: currentDate,
        orientation: "bottom right"
    });

    $(".due-date-button").on("click", function (event) {
        $(".due-date-button")
            .datepicker("show")
            .on("changeDate", function (dateChangeEvent) {
                $(".due-date-button").datepicker("hide");
                $(".due-date-label").text(formatDate(dateChangeEvent.date));
                $(".date-input").attr("value",formatDate(dateChangeEvent.date));
            });
    });
};