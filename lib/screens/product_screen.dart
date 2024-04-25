import 'package:flutter/material.dart';
import 'package:productos_app/ui/input_decoration.dart';
import 'package:productos_app/widgets/widget.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const ProductImage(),
                Positioned(
                  top: 60,
                  left: 15,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  right: 25,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const _ProductForm(),
            const SizedBox(height: 100)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton( 
        child: Icon(Icons.save_outlined, color: Colors.white,),
        onPressed: (){},
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(  
          child: Column( 
            children: [
              const SizedBox( 
                height: 10,
              ),

              TextField( 
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Nombre del producto', 
                  labelText: 'Nombre:'
                ),
              ),
              const SizedBox( 
                height: 30,
              ),
              TextField( 
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(
                  hintText: '\$150', 
                  labelText: 'Precio:'
                ),
              ),

              const SizedBox( 
                height: 30,
              ),

              SwitchListTile.adaptive(
                value: true, 
                title: const Text("Disponible"),
                activeColor: Colors.indigo,              
                onChanged: (value){}
              ),

              const SizedBox(  
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }

}
BoxDecoration _buildBoxDecoration() =>  BoxDecoration(
  color: Colors.white,
  borderRadius: const BorderRadius.only( 
    bottomRight: Radius.circular(45),
    bottomLeft: Radius.circular(45)
  ),
  boxShadow: [ 
    BoxShadow( 
      color: Colors.black.withOpacity(0.05),
      offset: const  Offset(0,5),
      blurRadius: 5
    )
  ]

);
