import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 5),
        width: double.infinity,
        height: 400,
        decoration: _cardBorders(),
        child: const Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackgroundImage(), 
            _ProductDetails(),
            Positioned(
              top: 0,
              right: 0,
              child: _PriceCard(),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: _NotAvailable(),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 7))
        ]);
  }
}

class _NotAvailable extends StatelessWidget {
  const _NotAvailable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 70,
      decoration:  BoxDecoration(  
        color: Colors.yellow[700],
        borderRadius: const BorderRadius.only(  
          topLeft: Radius.circular(25),
          bottomRight: Radius.circular(25)
        )
      ),
      child: const FittedBox(  
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('No Disponiblie', 
            style: TextStyle(  
              color: Colors.white,
              fontSize: 20
            ),
          ),
        ),
      ),
    );
  }
}

class _PriceCard extends StatelessWidget {
  const _PriceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 100,
      height: 70,
      decoration: const BoxDecoration(  
        color: Colors.indigo,
        borderRadius: BorderRadius.only(  
          topRight: Radius.circular(25),
          bottomLeft: Radius.circular(25)
        )
      ),
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('\$99.99',
            style: TextStyle( 
              color: Colors.white,
              fontSize: 20
            ),
          ),
        ),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: _buildBoxDecoration(),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Disco duro G',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Id del dico duro este es un mensaje para ver el texto de la imagen',
              style: TextStyle(fontSize: 15, color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}

BoxDecoration _buildBoxDecoration() => const BoxDecoration(
  color: Colors.indigo,
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(25),
    topRight: Radius.circular(25),
  ),
);

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: const FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
