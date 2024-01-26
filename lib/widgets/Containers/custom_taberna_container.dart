import 'package:flutter/material.dart';
import 'dart:math';
import 'package:tabernarium/theme/theme.dart';
import 'package:provider/provider.dart';
class CustomTaberna extends StatelessWidget {
  const CustomTaberna({super.key});

   @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: ShapeDecoration(
        color: actualTheme.colorScheme.background,
        shape: CustomShapeBorder(),
        shadows: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/pfp.jpeg'),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Título',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 8.0),
                    Text(
                      'Subtítulo',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 16.0),
          ElevatedButton(
            onPressed: () {
              // Acción al presionar el botón "Unirse"
            },
            child: Text('Unirse'),
          ),
        ],
      ),
    );
  }
}


class CustomShapeBorder extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final double radius = 10.0; // Radio del círculo
    final double centerX = rect.left + radius; // Centro del círculo en el eje X
    final double centerY = rect.center.dy; // Centro del círculo en el eje Y

    return Path()
      ..moveTo(rect.left + 10.0, rect.top) // Punto de inicio en la parte superior izquierda del rectángulo
      ..lineTo(rect.right, rect.top) // Línea superior
      ..lineTo(rect.right, rect.bottom) // Línea derecha
      ..lineTo(rect.left + 10.0, rect.bottom) // Línea inferior (a la derecha del círculo)
      ..arcToPoint(
        Offset(rect.left + 10.0, rect.top), // Punto de inicio del arco
        radius: Radius.circular(radius), // Radio del arco
        clockwise: false, // Sentido del arco (en sentido contrario a las agujas del reloj para curvar hacia dentro)
      );
      
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return this;
  }
}
