$(function() {
    window.addEventListener('message', function(event) {
        if (event.data.type == "open"){
            $('#image').css('display', 'block');
        }else if(event.data.type == "closeUI"){
            $('#image').css('display', 'none');  
        }
    });
});
