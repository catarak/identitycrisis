$(function() {
  cancelAccountListener();
});

function cancelAccountListener() {
  $('#accounts-container').on('click', '#cancel-account', function(e) {
    e.preventDefault();
    $('#new_account').remove();
  });
}