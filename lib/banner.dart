import 'package:adsmob/ad_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Banner1 extends StatefulWidget {
  const Banner1({super.key});

  @override
  State<Banner1> createState() => _Banner1State();
}

class _Banner1State extends State<Banner1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initBannerAd();
  }

  BannerAd? bannerAd;
  bool isAdLoaded = false;
  

  initBannerAd() {
    bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(onAdLoaded: (ad) {
        print('Ad loaded.');
        setState(() {
          isAdLoaded = true;
        });
      }, onAdFailedToLoad: (ad, loadAdError) {
        // Gets the domain from which the error came.
        String domain = loadAdError.domain;

        int code = loadAdError.code;

        String message = loadAdError.message;
        print(message);

        ResponseInfo? responseInfo = loadAdError.responseInfo;

        // onAdFailedToLoad: (ad, error) {
        //   ad.dispose();
        //   print('Ad failed to load: $error');
        // },
      }),
    );
    bannerAd!.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banner Ad'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: null),
      body: Center(
        child: Text("hello"),
      ),
      bottomNavigationBar: isAdLoaded
          ? Container(
              color: Colors.pinkAccent,
              height: 50,
              child: AdWidget(ad: bannerAd!),
            )
          : Container(
              color: Colors.red,
              height: 50,
            ),
    );
  }
}
