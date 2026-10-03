(function () {
    const cepInput = document.getElementById("cep");
    const msg = document.getElementById("cep-msg");

    function onlyDigits(value) {
        return value.replace(/\D/g, "");
    }

    function showMessage(text) {
        if (!text) {
            msg.hidden = true;
            msg.textContent = "";
            return;
        }
        msg.hidden = false;
        msg.textContent = text;
    }

    function fillAddress(data) {
        document.getElementById("rua").value = data.logradouro || "";
        document.getElementById("bairro").value = data.bairro || "";
        document.getElementById("cidade").value = data.localidade || "";
        document.getElementById("estado").value = data.uf || "";
    }

    function buscarCep() {
        const cep = onlyDigits(cepInput.value);
        if (cep.length !== 8) {
            showMessage("");
            return;
        }

        fetch("https://viacep.com.br/ws/" + cep + "/json/")
            .then(function (response) {
                return response.json();
            })
            .then(function (data) {
                if (data.erro) {
                    fillAddress({});
                    showMessage("CEP não encontrado.");
                    return;
                }
                showMessage("");
                fillAddress(data);
            })
            .catch(function () {
                showMessage("Não foi possível consultar o CEP. Tente novamente.");
            });
    }

    cepInput.addEventListener("input", function () {
        const digits = onlyDigits(cepInput.value);
        if (digits.length <= 5) {
            cepInput.value = digits;
        } else {
            cepInput.value = digits.slice(0, 5) + "-" + digits.slice(5, 8);
        }
        if (digits.length === 8) {
            buscarCep();
        } else {
            showMessage("");
        }
    });
})();
