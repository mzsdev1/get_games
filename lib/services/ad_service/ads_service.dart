import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/services/ad_service/ads_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

final googleAdServiceProvider =
    Provider<GoogleAdsService>((ref) => GoogleAdsService(ref.read));

class GoogleAdsService {
  // ignore: unused_field
  final T Function<T>(ProviderListenable<T>) _read;
  GoogleAdsService(this._read);

  // maxFailedLoadAttempts
  final int _maxFailedLoadAttempts = 3;
  int _numInterstitialLoadAttempts = 0;

  int adsCounter = 0;

  InterstitialAd? interstitialAd;

  final AdRequest request = const AdRequest();

  void createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdsHelper.interstitialAdUnitId,
      request: request,
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          interstitialAd = ad;
          _numInterstitialLoadAttempts = 0;
          interstitialAd!.setImmersiveMode(true);
        },
        onAdFailedToLoad: (LoadAdError error) {
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
      return;
    }
    interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        createInterstitialAd();
      },
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        ad.dispose();
        createInterstitialAd();
      },
    );

    if (adsCounter % 20 == 0) {
      interstitialAd!.show();
      interstitialAd = null;
    }
    adsCounter++;
  }
}
