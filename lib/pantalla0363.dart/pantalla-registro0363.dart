import 'package:flutter/material.dart';

class PantallaRegistro extends StatefulWidget {
  const PantallaRegistro({Key? key}) : super(key: key);

  @override
  State<PantallaRegistro> createState() => _PantallaRegistroState();
}

class _PantallaRegistroState extends State<PantallaRegistro> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
  final TextEditingController _confirmarcontrasenaController =
      TextEditingController();

  bool isVisibleObsecure = false;

  void _submittedForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Cuenta creada"),
        ),
      );
    }
  }

  String? validateNombre(String? value) {
    if (value!.isEmpty) {
      return "Ingresa Nombre";
    } else if (RegExp(r"^[a-zA-Z]+$").hasMatch(value)) {
      return "Por favor ingresa un nombre valido con numeros y caracteres especiales";
    }
    return null;
  }

  String? validateCorreo(String? value) {
    if (value!.isEmpty) {
      return "Por favor ingresa tu correo";
    } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(value)) {
      return "Por favor ingresa un correo valido";
    }
    return null;
  }

  String? validateContrasena(String? value, String? text) {
    if (value!.isEmpty) {
      return "Por favor ingresa tu contraseña";
    } else if (value.length < 6) {
      return "la contraseña debe tener mas de 6 caracteres";
    } else if (!RegExp(r"^[a-zA-Z0-9]+$").hasMatch(value)) {
      return "La contraseña debe contener solo letras y numeros";
    }
    return null;
  }

  String? validateConfirmarContrasena(String? value, String? text) {
    if (value!.isEmpty) {
      return "Por favor confirma tu contraseña";
    } else if (value != text) {
      return "la contraseña no coincide";
    }
    return validateContrasena(value, text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(image: AssetImage("assets/logoG.jpg")),
              SizedBox(
                height: 20,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Crear Nueva Cuenta",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff7491cf),
                            height: 1),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) => validateNombre(value),
                        controller: _nombreController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person), hintText: "Nombre"),
                      ),
                      TextFormField(
                        validator: (value) => validateCorreo(value),
                        controller: _correoController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email), hintText: "Correo"),
                      ),
                      TextFormField(
                        validator: (value) => validateContrasena(
                            value, _contrasenaController.text),
                        controller: _contrasenaController,
                        autocorrect: false,
                        enableSuggestions: false,
                        obscureText: isVisibleObsecure,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isVisibleObsecure = !isVisibleObsecure;
                                });
                              },
                              icon: isVisibleObsecure
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                            ),
                            prefixIcon: Icon(Icons.password),
                            hintText: "Contraseña"),
                      ),
                      TextFormField(
                        autocorrect: false,
                        enableSuggestions: false,
                        obscureText: isVisibleObsecure,
                        validator: (value) => validateConfirmarContrasena(
                            value, _contrasenaController.text),
                        controller: _confirmarcontrasenaController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password),
                            hintText: "Confirmar Contraseña"),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff7491cf),
                              minimumSize: Size(300, 50)),
                          onPressed: () {
                            _submittedForm();
                          },
                          child: Text(
                            "Crear Cuenta",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ))
                    ],
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}
