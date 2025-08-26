import 'package:flutter/material.dart';
import 'package:flutter_earth_globe/flutter_earth_globe.dart';
import 'package:flutter_earth_globe/flutter_earth_globe_controller.dart';
import 'package:flutter_earth_globe/globe_coordinates.dart';
import 'package:flutter_earth_globe/point.dart';
import 'package:flutter_earth_globe/sphere_style.dart';

class GlobeScreen extends StatefulWidget {
  const GlobeScreen({super.key});
  @override
  State<GlobeScreen> createState() => _GlobeScreenState();
}

class _GlobeScreenState extends State<GlobeScreen> {
  final FlutterEarthGlobeController _controller = FlutterEarthGlobeController();

  @override
  void initState() {
    super.initState();

    // Load background and surface images
    _controller.onLoaded = () {
      _controller.loadBackground(
        Image.asset('images/2k_stars.jpg').image,
        // followsRotation: true,
      );
      _controller.loadSurface(
        Image.asset('images/2k_earth-day.jpg').image,
        // followsRotation: true,
      );

      // Add points
      List<Point> points = [
        Point(
          id: '1',
          coordinates: const GlobeCoordinates(51.5072, 0.1276),
          label: 'London',
          isLabelVisible: true,
          style: const PointStyle(color: Colors.red, size: 6),
        ),
        Point(
          id: '2',
          coordinates: const GlobeCoordinates(40.7128, -74.0060),
          label: 'New York',
          isLabelVisible: true,
          style: const PointStyle(color: Colors.green),
        ),
        Point(
          id: '3',
          coordinates: const GlobeCoordinates(35.6895, 139.6917),
          label: 'Tokyo',
          isLabelVisible: true,
          style: const PointStyle(color: Colors.blue),
        ),
        // Heat map effect on Tokyo
        Point(
          id: 'heat_tokyo',
          coordinates: const GlobeCoordinates(35.6895, 139.6917),
          style: const PointStyle(
            color: Colors.redAccent,
            size: 20,
            // opacity: 0.5,
          ),
          isLabelVisible: false,
        ),
      ];
      for (var point in points) {
        _controller.addPoint(point);
      }

      // Change sphere style
      _controller.setSphereStyle(
        SphereStyle(
          // ignore: deprecated_member_use
          shadowColor: Colors.orange.withOpacity(0.8),
          shadowBlurSigma: 20,
        ),
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Modern 3D Globe')),
      body: Center(
        child: FlutterEarthGlobe(controller: _controller, radius: 150),
      ),
    );
  }
}
