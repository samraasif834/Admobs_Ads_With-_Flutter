import 'package:adsmob/banner.dart';
import 'package:adsmob/interastial.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  var devices = ["E647A0DE042D8E96804305D9FB3D0189"];
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();

  RequestConfiguration requestConfiguration = RequestConfiguration(
    testDeviceIds: devices,
  
  );
  MobileAds.instance.updateRequestConfiguration(requestConfiguration); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: InterstitialAdScreen(),
    );
  }
}
