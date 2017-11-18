$(function () {

    var activeCategories;
    //	fill array of active categories
    getActiveCategoryList();

    // Filter comics when user clicks on checkbox
    $('.filters-toggle > input').change(function () {
        var checkedBool = this.checked;
        var $this = $(this);
        var category = $this.parent('.filters-toggle').data('category');
        //	toggle active class for filter element and refresh array with active buttons
        $this.parent('.filters-toggle').toggleClass('active');
        getActiveCategoryList();

        //	toggle hidden class
        $('.category[data-category="' + category + '"]').toggleClass('hidden');

        //loop through activeCategories and display those with the class 'active'
        for (var i = 0; i < activeCategories.length; i++) {
            $('.category[data-category="' + activeCategories[i] + '"]').removeClass('hidden');
        }
    });

    function getActiveCategoryList() {
        //	get an array with names of currently selected categories
        activeCategories = [];
        $('.filters-toggle.active').each(function () {
            activeCategories.push($(this).text())
        });
    }

});