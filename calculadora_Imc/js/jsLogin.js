$(document).ready(function() {
    obtenerSesion();
});

function crearSesion(usu) {
    if (localStorage.getItem('usuarioIMC') != null) {
        localStorage.clear();
    }
    //var usu = md5(sha1(usuario));
    //var pas = sha1(md5(contrasenia));
    localStorage.setItem('usuarioIMC', usu.usu); //Guardamos el usuario en una kokie
    localStorage.setItem('contraseniaIMC', usu.pass); //Guardamos el usuario en una kokie
    localStorage.setItem('nombreIMC', usu.nombre);
    localStorage.setItem('apellidoIMC', usu.apellido);
    localStorage.setItem('correoIMC', usu.correo);
    obtenerSesion();
}

function obtenerSesion() {
    if (localStorage.getItem('usuarioIMC') != null) {
        //alert({ usuario: localStorage.getItem('usuarioIMC'), contrasenia: localStorage.getItem('contraseniaIMC') });
        location.href = "index.html";
    }
}

function clearSesion() {
    if (localStorage.getItem('usuarioIMC') != null) {
        localStorage.clear();
    }
}

function validarUsuario(event) {

    event.preventDefault(); //Prevenir submit

    let usuarios = [{
            usu: 'a66a422f878626412325ec9a229b6574',
            pass: 'fe703d258c7ef5f50b71e06565a65aa07194907f',
            nombre: 'Einer',
            apellido: 'Mendez',
            correo: 'einer_mende@hotmail.com'
        },
        {
            usu: '793c826c5529fc7b898bbe05fc4d8317',
            pass: 'fe703d258c7ef5f50b71e06565a65aa07194907f',
            nombre: 'Cesar',
            apellido: 'Perez',
            correo: 'cesar.perez@o365.unab.edu.co'
        },
        {
            usu: '98098423e69de4e04cda920fbd5c72c4',
            pass: 'fe703d258c7ef5f50b71e06565a65aa07194907f',
            nombre: 'William',
            apellido: 'Avendaño',
            correo: 'wilfer1508@gmail.com'
        },
        {
            usu: '7f92556ce306a19efdd713ee09748dba',
            pass: 'fe703d258c7ef5f50b71e06565a65aa07194907f',
            nombre: 'Deiver',
            apellido: 'Torres',
            correo: 'deivertm@hotmail.com'
        },
        {
            usu: '833693d43e103bda03c45024d6472dc1',
            pass: 'fe703d258c7ef5f50b71e06565a65aa07194907f',
            nombre: 'Usuario',
            apellido: 'Prueba',
            correo: 'usuario@usuario.com'
        }
    ];

    var usu = document.getElementById("usu").value;
    var pass = document.getElementById("pass").value;
    var verificacion = false;

    for (var i = 0; i < usuarios.length; i++) {
        if (usuarios[i].usu === md5(sha1(usu)) && usuarios[i].pass == sha1(md5(pass))) {
            verificacion = true;
            crearSesion(usuarios[i]);
        }
    }

    if (verificacion === false) {
        document.getElementById("error").innerHTML = "Usuario o clave incorrecta";
        document.getElementById("alerta").style.display = "flex";
    }
}