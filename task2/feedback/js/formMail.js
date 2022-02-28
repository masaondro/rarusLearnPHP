$("#sendMail").on("click", function(){
    var email = $("#email").val().trim();
    var fio = $("#fio").val().trim();
    var phone = $("#phone").val().trim();
    var message = $("#message").val().trim();
    var adress = $("#adress").val().trim();
    var file = $("#file").val().trim();


    if (fio == ""){
        $("#errorMess").text("Пожалуйста, укажите свое имя");
        return false;
    } else if (phone == ""){
        $("#errorMess").text("Пожалуйста, укажите ваш номер телефона");
        return false;
    }
    $("#errorMess").text("");

    $.ajax({
        url: 'ajax/mail.php',
        type: 'POST',
        cache: false,
        data: { 'fio': fio, 'email': email, 'phone': phone, 'message':message, 'adress':adress, 'file':file},
        dataType:'html',
        beforSend: function(){
            $("#sendMail").prop("disabled", true);

        },
        success: function(data){
            if(data == 1)
                $("#errorMess").text("Извините, регистрация пользователя с доменом @gmail.com невозможна");
            else if (data == 2){
                $("#mailForm").trigger("reset");
                $("#errorMess").text("");
            }
            else if (data == 3)
                $("#errorMess").text("Поле ФИО не может быть пустым");
            else if (data == 4)
                $("#errorMess").text("Поле телефон не может быть пустым");

            $("#sendMail").prop("disabled", false);
        }
    });
});