$(function() {
  cancelAccountListener();
  cancelMemberListener();
});

function cancelAccountListener() {
  $('#accounts-container').on('click', '#cancel-account', function(e) {
    e.preventDefault();
    $('#new_account').remove();
  });
}

function cancelMemberListener() {
  $('#members-container').on('click', '#cancel-member', function(e) {
    e.preventDefault();
    $('#new_user').remove();
  });
}