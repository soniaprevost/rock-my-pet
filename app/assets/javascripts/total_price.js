$(document).ready(function (){
  $("#booking_checkin_1i, #booking_checkin_2i, #booking_checkin_3i, #booking_checkout_1i, #booking_checkout_2i, #booking_checkout_3i").change(function(){
    var ciYear = $("#booking_checkin_1i").val();
    var ciMonth = $("#booking_checkin_2i").val();
    var ciDay = $("#booking_checkin_3i").val();
    var checkin = new Date(ciYear, ciMonth - 1, ciDay);
    var coYear = $("#booking_checkout_1i").val();
    var coMonth = $("#booking_checkout_2i").val();
    var coDay = $("#booking_checkout_3i").val();
    var checkout = new Date(coYear, coMonth - 1, coDay);
    var totalDays = (checkout - checkin)/(60000 * 60 * 24);
    var totalPrice = totalDays * PET_DONATE_PRICE;
    $('#totalprice').text(totalPrice);
  });
});