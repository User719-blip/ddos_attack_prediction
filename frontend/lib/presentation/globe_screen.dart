import 'package:flutter/material.dart';
import 'package:flutter_earth_globe/flutter_earth_globe.dart';
import 'package:flutter_earth_globe/flutter_earth_globe_controller.dart';
import 'package:flutter_earth_globe/globe_coordinates.dart';
import 'package:flutter_earth_globe/point.dart';
import 'package:flutter_earth_globe/sphere_style.dart';
import '../data/attack_event_api.dart';


class GlobeScreen extends StatefulWidget {
  const GlobeScreen({super.key});

  @override
  State<GlobeScreen> createState() => _GlobeScreenState();
}

class _GlobeScreenState extends State<GlobeScreen> {
  final FlutterEarthGlobeController _controller = FlutterEarthGlobeController();
  final AttackEventApi api = AttackEventApi('http://<backend-ip>:8000');

  @override
void initState() {
  super.initState();
  _controller.onLoaded = () {
    _controller.loadBackground(
      Image.asset('images/2k_stars.jpg').image,
    );
    _controller.loadSurface(
      Image.asset('images/2k_earth-day.jpg').image,
    );
    _controller.setSphereStyle(
      SphereStyle(
        // ignore: deprecated_member_use
        shadowColor: Colors.orange.withOpacity(0.8),
        shadowBlurSigma: 20,
      ),
    );
  };
  _fetchAndShowAttack();
}

  Future<void> _fetchAndShowAttack() async {
    final event = await api.fetchNextEvent();
    if (event != null && event.attack == 1 && event.lat != null && event.lon != null) {
      _controller.addPoint(Point(
        id: UniqueKey().toString(),
        coordinates: GlobeCoordinates(event.lat!, event.lon!),
        label: event.city ?? 'Unknown',
        isLabelVisible: true,
        style: const PointStyle(color: Colors.red, size: 8),
      ));
    }
    // Poll every few seconds
    Future.delayed(const Duration(seconds: 2), _fetchAndShowAttack);
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