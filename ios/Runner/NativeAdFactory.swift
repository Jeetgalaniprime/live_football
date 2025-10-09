import Foundation
import google_mobile_ads
import UIKit

class NativeAdFactory: NSObject, FLTNativeAdFactory {
    // Revert to the correct protocol method signature
    func createNativeAd(_ nativeAd: NativeAd, customOptions: [AnyHashable : Any]?) -> NativeAdView? {
        var adView: NativeAdView! // Declare as NativeAdView

        // Safely retrieve the 'nativeAdLayoutType' from customOptions
        // Ensure the key matches what you send from Flutter
        let nativeAdLayoutType = customOptions?["nativeAdLayoutType"] as? Int

        switch nativeAdLayoutType {
        case 1:
            guard let nibObjects = Bundle.main.loadNibNamed("NativeAdView1", owner: nil, options: nil),
                  let loadedAdView = nibObjects.first as? NativeAdView else {
                fatalError("Could not load nib file for NativeAdView1")
            }
            adView = loadedAdView
        case 2:
            guard let nibObjects = Bundle.main.loadNibNamed("NativeAdView2", owner: nil, options: nil),
                  let loadedAdView = nibObjects.first as? NativeAdView else {
                fatalError("Could not load nib file for NativeAdView2")
            }
            adView = loadedAdView
        case 3:
            guard let nibObjects = Bundle.main.loadNibNamed("NativeAdView3", owner: nil, options: nil),
                  let loadedAdView = nibObjects.first as? NativeAdView else {
                fatalError("Could not load nib file for NativeAdView3")
            }
            adView = loadedAdView
        default:
            // Handle a default case or error if the type isn't recognized
            // For example, you could load a default native ad view or throw an error.
            // For now, let's assume NativeAdView1 as a fallback if no type or an unknown type is provided.
            guard let nibObjects = Bundle.main.loadNibNamed("NativeAdView1", owner: nil, options: nil),
                  let loadedAdView = nibObjects.first as? NativeAdView else {
                fatalError("Could not load default nib file for NativeAdView1 (default fallback)")
            }
            adView = loadedAdView
            debugPrint("Warning: Unknown or no nativeAdLayoutType provided. Loading default NativeAdView1.")
        }

        (adView.headlineView as? UILabel)?.text = nativeAd.headline
        (adView.bodyView as? UILabel)?.text = nativeAd.body
        adView.bodyView?.isHidden = nativeAd.body == nil

        (adView.callToActionView as? UIButton)?.setTitle(nativeAd.callToAction, for: .normal)
        adView.callToActionView?.isHidden = nativeAd.callToAction == nil

        (adView.iconView as? UIImageView)?.image = nativeAd.icon?.image
        adView.iconView?.isHidden = nativeAd.icon == nil

        (adView.advertiserView as? UILabel)?.text = nativeAd.advertiser
        adView.advertiserView?.isHidden = nativeAd.advertiser == nil

        adView.nativeAd = nativeAd

        return adView
    }
}
