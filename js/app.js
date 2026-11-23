// app.js - EduMatch: inicialización de Materialize, validación de formularios y filtros.
document.addEventListener('DOMContentLoaded', function () {

  // ---- Componentes de Materialize ----
  M.Sidenav.init(document.querySelectorAll('.sidenav'));
  M.Collapsible.init(document.querySelectorAll('.collapsible'));
  M.FormSelect.init(document.querySelectorAll('select'));

  var hoy = new Date();
  M.Datepicker.init(document.querySelectorAll('.datepicker'), {
    format: 'dd/mm/yyyy',
    maxDate: hoy,
    yearRange: [hoy.getFullYear() - 80, hoy.getFullYear()],
    defaultDate: new Date(hoy.getFullYear() - 18, 0, 1),
    autoClose: true,
    i18n: {
      cancel: 'Cancelar',
      clear: 'Borrar',
      done: 'Aceptar',
      months: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
      monthsShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
      weekdays: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
      weekdaysShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb'],
      weekdaysAbbrev: ['D', 'L', 'M', 'M', 'J', 'V', 'S']
    }
  });

  // ---- Validación ----
  function marcar(campo, esValido) {
    campo.classList.remove('valid', 'invalid');
    campo.classList.add(esValido ? 'valid' : 'invalid');
  }

  function validarCampos(form, extra) {
    var todoOk = true;
    form.querySelectorAll('input.validate, input.datepicker').forEach(function (campo) {
      var ok = campo.checkValidity() && campo.value.trim() !== '';
      if (extra && extra[campo.id]) ok = ok && extra[campo.id](campo);
      marcar(campo, ok);
      if (!ok) todoOk = false;
    });
    return todoOk;
  }

  // ---- Login ----
  var login = document.getElementById('form-login');
  if (login) {
    login.addEventListener('submit', function (e) {
      e.preventDefault();
      if (!validarCampos(login)) {
        M.toast({ html: 'Revisa los campos marcados antes de continuar.', classes: 'toast-error' });
        return;
      }
      M.toast({ html: 'Datos válidos. Iniciando sesión…', classes: 'toast-ok' });
      // Aquí iría la petición real de autenticación al servicio del backend.
    });
  }

  // ---- Registro ----
  var registro = document.getElementById('form-registro');
  if (registro) {
    registro.addEventListener('submit', function (e) {
      e.preventDefault();
      var ok = validarCampos(registro, {
        contrasena2: function (c) { return c.value === document.getElementById('contrasena').value; }
      });
      var interes = document.getElementById('interes');
      var terminos = document.getElementById('terminos');
      if (!ok) { M.toast({ html: 'Revisa los campos marcados antes de continuar.', classes: 'toast-error' }); return; }
      if (!interes.value) { M.toast({ html: 'Elige qué te interesa más.', classes: 'toast-error' }); return; }
      if (!terminos.checked) { M.toast({ html: 'Debes aceptar el tratamiento de datos.', classes: 'toast-error' }); return; }
      M.toast({ html: '¡Registro exitoso! Ya puedes iniciar sesión.', classes: 'toast-ok' });
      registro.reset();
      registro.querySelectorAll('input').forEach(function (c) { c.classList.remove('valid', 'invalid'); });
      M.FormSelect.init(document.querySelectorAll('select'));
      M.updateTextFields();
    });
  }

  // ---- Filtros de oportunidades ----
  var botones = document.querySelectorAll('.filtro');
  var tarjetas = document.querySelectorAll('.op');
  function aplicar(tipo) {
    botones.forEach(function (b) { b.classList.toggle('activo', b.dataset.filtro === tipo); });
    tarjetas.forEach(function (t) {
      t.classList.toggle('oculto', tipo !== 'todas' && t.dataset.tipo !== tipo);
    });
  }
  botones.forEach(function (b) {
    b.addEventListener('click', function () { aplicar(b.dataset.filtro); });
  });
  var hash = window.location.hash.replace('#', '');
  var mapa = { becas: 'beca', cursos: 'curso', intercambios: 'intercambio' };
  if (botones.length && mapa[hash]) aplicar(mapa[hash]);
});
