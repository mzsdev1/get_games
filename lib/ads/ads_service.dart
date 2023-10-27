import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/ads/ads_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

final googleAdServiceProvider =
    Provider<GoogleAdsService>((ref) => GoogleAdsService(ref.read));

class GoogleAdsService {
  final T Function<T>(ProviderListenable<T>) _read;
  GoogleAdsService(this._read);

  // maxFailedLoadAttempts
  final int _maxFailedLoadAttempts = 3;
  int _numInterstitialLoadAttempts = 0;

  int adsCounter = 0;

  InterstitialAd? interstitialAd;

  final AdRequest request = const AdRequest(
    keywords: <String>['game', 'games'],
    //nonPersonalizedAds: true,
  );

  void createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdsHelper.interstitialAdUnitId,
      request: request,
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          print('$ad loaded');
          interstitialAd = ad;
          _numInterstitialLoadAttempts = 0;
          interstitialAd!.setImmersiveMode(true);
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('InterstitialAd failed to load: $error.');
          _numInterstitialLoadAttempts += 1;
          interstitialAd = null;
          if (_numInterstitialLoadAttempts < _maxFailedLoadAttempts) {
            createInterstitialAd();
          }
        },
      ),
    );
  }

  void showInterstitialAd() {
    if (interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) {
        print('ad onAdShowedFullScreenContent.');
        ad.dispose();
        createInterstitialAd();
      },
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        createInterstitialAd();
      },
    );

    if (adsCounter % 15 == 0) {
      interstitialAd!.show();
      interstitialAd = null;
    }
    adsCounter++;
    print(adsCounter);
  }
}
