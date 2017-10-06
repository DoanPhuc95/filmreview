function chooseImage() {
    event.preventDefault();
    $('#user_avatar').trigger('click');
}

function changeImage(id) {
    var form = "#edit_user_" + id;
    $(form).submit();
}