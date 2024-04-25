import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Container(
          width: double.infinity,
          height: 450,
          decoration: _buildBoxDecoration(),
          child: const ClipRRect(  
            borderRadius: BorderRadius.only(  
              topRight: Radius.circular(45),
              topLeft: Radius.circular(45)
            ),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.png'),  
              image: NetworkImage('https://via.placeholder.com/400x300/green'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

}
BoxDecoration _buildBoxDecoration() =>  BoxDecoration(
  borderRadius: const BorderRadius.only(  
    topRight: Radius.circular(45),
    topLeft: Radius.circular(45)
  ),
  boxShadow: [  
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 10,
      offset: const Offset(0,5)
    )
  ]
);