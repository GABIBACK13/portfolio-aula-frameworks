(function ($) {
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    function setFieldState($field, valid) {
        if (valid) {
            $field.removeClass("is-invalid");
        } else {
            $field.addClass("is-invalid");
        }
        return valid;
    }

    function validateField($field) {
        var value = $.trim($field.val());
        if (value === "") {
            return setFieldState($field, false);
        }
        if ($field.attr("id") === "email") {
            return setFieldState($field, emailRegex.test(value));
        }
        return setFieldState($field, true);
    }

    $("#form-cadastro input[required]").on("blur", function () {
        validateField($(this));
    });

    $("#form-cadastro").on("submit", function (event) {
        var ok = true;
        $("#form-cadastro input[required]").each(function () {
            if (!validateField($(this))) {
                ok = false;
            }
        });
        if (!ok) {
            event.preventDefault();
        }
    });
})(jQuery);
