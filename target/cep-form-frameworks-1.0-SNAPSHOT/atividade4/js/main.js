(function ($) {
    function onlyDigits(value) {
        return value.replace(/\D/g, "");
    }

    function fillAddress(data) {
        $("#rua").val(data.logradouro || "");
        $("#bairro").val(data.bairro || "");
        $("#cidade").val(data.localidade || "");
        $("#estado").val(data.uf || "");
    }

    function buscarCep(cep) {
        $.getJSON("https://viacep.com.br/ws/" + cep + "/json/")
            .done(function (data) {
                if (data.erro) {
                    fillAddress({});
                    $("#cep").addClass("is-invalid");
                    return;
                }
                $("#cep").removeClass("is-invalid");
                fillAddress(data);
            })
            .fail(function () {
                $("#cep").addClass("is-invalid");
            });
    }

    $("#cep").on("input", function () {
        var digits = onlyDigits($(this).val());
        if (digits.length <= 5) {
            $(this).val(digits);
        } else {
            $(this).val(digits.slice(0, 5) + "-" + digits.slice(5, 8));
        }
        if (digits.length === 8) {
            buscarCep(digits);
        }
    });
})(jQuery);
