import 'package:flutter/material.dart';
import 'package:muevelo/constantes.dart' as con;
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: con.fondo, // Fondo del home

      appBar: AppBar(
        backgroundColor: con.parteSuperior, // Color del AppBar
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.location_on, color: con.negro), // Ícono de ubicación
          onPressed: () {}, // Placeholder para funcionalidad futura
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: con.negro), // Ícono del carrito
            onPressed: () {}, // Placeholder para funcionalidad futura
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Barra de búsqueda
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: con.busqueda,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.search, color: Colors.grey),
                      onPressed: null, //AQUI FUNCIONALIDAD
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Buscar',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Secciones desplazables
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
              child: Text(
                'Categorías',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 100, // Altura del área desplazable
              child: ListView(
                scrollDirection: Axis.horizontal, // Desplazamiento horizontal
                children: [
                  sectionItem('imagenes/pizza.png', 'Pizza', context),
                  sectionItem('imagenes/burger.png', 'Hamburguesa', context),
                  sectionItem('imagenes/tacos.png', 'Tacos', context),
                  sectionItem('imagenes/sushi.png', 'Sushi', context),
                  sectionItem('imagenes/alitas.png', 'Alitas', context),
                ],
              ),
            ),


            // Separación entre bloques
            SizedBox(height: 20),

            // Título "MuéveloDeals"
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Text(
                'MuéveloDeals',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            // Contenedores desplazables de MuéveloDeals
            SizedBox(
              height: 100, // Altura del área desplazable
              child: ListView(
                scrollDirection: Axis.horizontal, // Desplazamiento horizontal
                children: [
                  dealItem('imagenes/pizza5.png', '30%', context),
                  dealItem('imagenes/hamburguesa5.png', '20%', context),
                  dealItem('imagenes/tacos5.png', '15%', context),
                  dealItem('imagenes/sushi5.png', '10%', context),
                  dealItem('imagenes/alitas5.png', '25%', context),
                ],
              ),
            ),
            // Nueva separación
            SizedBox(height: 20),
            // Título "¡Muévete y Pide!"
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Text(
                '¡Muévete y Pide!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

                ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(), // Evita conflictos de desplazamiento con SingleChildScrollView
                  children: [
                  restaurantItem('imagenes/pizza1.png', 'Pizzería Don Juan', '4.4 (100+)', '10-15 min \$20', context),
                  restaurantItem('imagenes/hamburguesa1.png', 'Burger House', '4.5 (200+)', '12-18 min \$25', context),
                  restaurantItem('imagenes/tacos2.png', 'Taquería El Gusto', '4.7 (150+)', '8-12 min \$15', context),
                  restaurantItem('imagenes/sushi2.png', 'Sushi Express', '4.2 (300+)', '15-20 min \$30', context),
                  restaurantItem('imagenes/alitas3.png', 'Wing Zone', '4.6 (80+)', '10-15 min \$20', context),
                ],
              ),
          ],
        ),

      )
    );
  }

  // Widget para crear un ítem de sección
  Widget sectionItem(String imagePath, String title, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SectionScreen(title: title)),
        );
      },
      child: Container(
        width: 120,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para crear un ítem de MuéveloDeals
  Widget dealItem(String imagePath, String discount, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DealScreen(imagePath: imagePath)),
        );
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    discount,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para crear un ítem de restaurante
  Widget restaurantItem(String imagePath, String name, String rating, String deliveryInfo, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          // Imagen del restaurante
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          // Información del restaurante
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 16),
                    SizedBox(width: 4),
                    Text(
                      rating,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.motorcycle, color: Colors.grey, size: 16),
                    SizedBox(width: 4),
                    Text(
                      deliveryInfo,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Pantallas auxiliares
class SectionScreen extends StatelessWidget {
  final String title;

  const SectionScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color(0xFF5B000B),
      ),
      body: Center(
        child: Text(
          'Bienvenido a $title!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
// Pantalla al hacer clic en un MuéveloDeal
class DealScreen extends StatelessWidget {
  final String imagePath;

  const DealScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Oferta'),
        backgroundColor: Color(0xFF5B000B),
      ),
      body: Center(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

