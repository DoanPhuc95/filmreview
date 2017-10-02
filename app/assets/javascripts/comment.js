function edit_event(id) {
    var input_card = "#comment-input-" + id;
    var form = "#form-edit-" + id;
    switch (event.keyCode) {
        case 27: {
            $(input_card).fadeOut();
            return;
        }
        case 13: {
            $(form).submit();
        }
    }
}

function commentFocus() {
    $("#comment_content").focus();
}