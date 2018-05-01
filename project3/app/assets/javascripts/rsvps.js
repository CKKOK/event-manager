$(document).ready(function(){
    var invitation_index = 1;

    function addInvitation(e) {
        var btn = $(this);
        btn.before(btn.data('fields').replace(/__INDEX__/g, invitation_index++));
    };
    
    $('#add-invitation').click(addInvitation);
})