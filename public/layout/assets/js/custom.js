$(document).ready(function () {
  // Basic wizard setup
  $('.steps-basic').steps({
    headerTag: 'h6',
    bodyTag: 'fieldset',
    transitionEffect: 'fade',
    titleTemplate: '<span class="number">#index#</span> #title#',
    labels: {
      previous: '<i class="ph-arrow-circle-left me-2"></i> Anterior',
      next: 'Próximo <i class="ph-arrow-circle-right ms-2"></i>',
      finish: 'Incluir <i class="ph-paper-plane-tilt ms-1""></i>'
    },
    onFinished: function (event, currentIndex) {
      var form = $(this).closest('form'); // Encontra o formulário pai do elemento atual
      form.submit(); // Isso aciona o envio do formulário
    }
  });

  setTimeout(function () {
    $('.steps-basic').removeClass('d-none');
    $('.load-steps-basic').addClass('d-none')
  }, 650);


  $('.keyup').keyup(function () {
    $(this).val($(this).val().toUpperCase());
  });

  $('.downcase').keyup(function () {
    $(this).val($(this).val().toLowerCase());
  });

  $('.letra_sistema').mask('Z', {
    translation: {
      'Z': {
        pattern: /[a-zA-Z]/, optional: false
      }
    }
  });

  $('.uf').mask('ZZ', {
    translation: {
      'Z': {
        pattern: /[a-zA-Z]/, optional: false
      }
    }
  });

  $('.cep').mask('00000-000');
  $('.data').mask('00/00/0000');
  $('.cpf').mask('000.000.000-00');
  $('.cpf-numeros').mask('00000000000');
  $('.cnpj').mask("00.000.000/0000-00");
  $('.telefone').mask("(00)00000-0000");
  $('.telefone_fixo').mask("(00)0000-0000");
  $('.numeros').mask('###000', { reverse: true });
  $('.vida-util-anos').mask("000", { reverse: true });  
  $('.percentual-residual').mask("00%", { reverse: true });  
  $('.latitude').mask('99.999999');
  $('.longitude').mask('-999.999999');
  $('.processo_sei').mask('0000.000000/0000-00');
  $('.ano').mask('0000');


  $('.real').maskMoney({
    thousands: '.',
    decimal: ','
  });
  $(".select2").select2({
    placeholder: "Selecione uma opção",
    allowClear: true,
    language: {
      noResults: function (params) {
        return "Sem resultados";
      }
    }
  });
  

  // adiciona as variaveis de estilos do bootstrap aos components do select2
  $(".select2").each(function () {
    if ($(this).hasClass("is-invalid")) {
      $(this).next('.select2-container').addClass('is-invalid');
      $(this).next('.select2-container').removeClass('is-valid');
    } else if ($(this).hasClass("is-valid")) {
      $(this).next('.select2-container').addClass('is-valid');
      $(this).next('.select2-container').removeClass('is-invalid');
    } else {
      $(this).next('.select2-container').removeClass('is-invalid');
      $(this).next('.select2-container').removeClass('is-valid');
    }
  });

  $(document).on("click", "[data-confirm-delete]", function (event) {
    event.preventDefault();
    var link = $(this).attr("data-confirm-delete");
    var csrfToken = $(this).attr("data-csrf-token");

    Swal.fire({
      title: 'Tem certeza?',
      text: "Você não poderá reverter!",
      icon: 'warning',
      showCancelButton: true,
      customClass: {
        confirmButton: "btn btn-danger",
        cancelButton: "btn btn-success"
      },
      confirmButtonText: 'Sim, tenho certeza!',
      cancelButtonText: 'Cancelar'
    }).then((result) => {
      if (result.isConfirmed) {
        var form = $('#' + $(this).closest('form').attr('id'));

        var methodInput = $('<input type="hidden" name="_method" value="delete">');
        var csrfInput = $('<input type="hidden" name="authenticity_token" value="' + csrfToken + '">');

        form.attr('action', link);
        form.append(methodInput);
        form.append(csrfInput);
        form.submit();
      }
    });
  });

});

