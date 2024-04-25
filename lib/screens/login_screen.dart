import 'package:flutter/material.dart';
import 'package:productos_app/provider/login_form_provider.dart';
import 'package:productos_app/ui/input_decoration.dart';
import 'package:productos_app/widgets/widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: AuthBackground(
            child: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 250),
          CardContainer(
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
               ChangeNotifierProvider(
                create: (_) => LoginFormProvider(),
                child: const _LoginForm(),
              ),
                // _LoginForm(),
                const SizedBox(height: 10)
              ],
            ),
          ),
          const SizedBox(height: 50),
          const Text(
            "Crear una nueva cuenta",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 50),
        ],
      ),
    )));
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        key: loginForm.formKey,
        //Mantener la referencia aquí
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'jonatan@gmail.com',
                  labelText: 'Correo Electrónico',
                  prefixIcon: Icons.alternate_email),
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp =  RegExp(pattern);

                return regExp.hasMatch(value ?? '') ? null : 'El correo no es válido';
              },
              onChanged: (value) => loginForm.email = value,
            ),
            const SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '******',
                  labelText: 'Contraseña',
                  prefixIcon: Icons.lock),
              obscureText: true,
              validator: (value) {
                if(value != null && value.length > 5) return null;
                return 'La contraseña debe tener mínimo 6 dígitos';
              },
              onChanged: (value) => loginForm.password = value,
            ),
            const SizedBox(height: 30),
            MaterialButton(
              onPressed: loginForm.isLoading ? null : () async {
                FocusScope.of(context).unfocus();

                if (!loginForm.isValidForm())return;

                loginForm.isLoading = true;

                await Future.delayed(const Duration(seconds: 3));

                loginForm.isLoading = false;

                Navigator.pushReplacementNamed(context, 'home'); 
                
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurpleAccent,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text(
                  loginForm.isLoading ? '...' :
                  "Ingresar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
