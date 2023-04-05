function search() {
    var query = $('#search-input').val();
    $.getJSON('/search', {query: query}, function(data) {
        var html = '';
        $.each(data, function(index, result) {
            html += '<div class="search-result">';
            html += '<ul class="list-group">';
            html += '<li class="list-group-item">';
            html += '<a href="/' + result.id + '">' + result.title + '</a><p>Director: '+ result.director +'</p>';
            html += '</li></ul></div>';
        });
        $('#search-results').html(html);
    }).fail(function() {
        console.log("An error occurred while processing the search request.");
    });
}

$(document).ready(function(){
    $('#search-input').on('input', function(event) {
        event.preventDefault();
        search();
    });
});
