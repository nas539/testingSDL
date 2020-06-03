//
//  ViewController.swift
//  TestingSDL
//
//  Created by Nicholas Sharp on 6/28/19.
// 
//

import UIKit
import SmartDeviceLink

class ViewController: UIViewController {
   let lifecycleConfiguration = SDLLifecycleConfiguration(appName: "Testing SDL", fullAppId: "1234")

  override func viewDidLoad() {
    super.viewDidLoad()

    // MARK: SHortened Display Name On HEAD
    lifecycleConfiguration.shortAppName = "Test SDL"

    // Determines the minimum and maximum versions the app support of SDL
    lifecycleConfiguration.minimumProtocolVersion = (SDLVersion(string: "3.0.0") ?? nil)!
    lifecycleConfiguration.minimumRPCVersion = SDLVersion(string: "4.0.0")!

    // MARK: Colors
    let green = SDLRGBColor(red: 126, green: 188, blue: 121)
    let white = SDLRGBColor(red: 249, green: 251, blue: 254)
    let grey = SDLRGBColor(red: 186, green: 198, blue: 210)
    let darkGrey = SDLRGBColor(red: 57, green: 78, blue: 96)

    lifecycleConfiguration.dayColorScheme = SDLTemplateColorScheme(primaryRGBColor: green, secondaryRGBColor: grey, backgroundRGBColor: white)
    lifecycleConfiguration.nightColorScheme = SDLTemplateColorScheme(primaryRGBColor: green, secondaryRGBColor: grey, backgroundRGBColor: darkGrey)

    //User cannot utilize the screen while driving
    SDLLockScreenConfiguration.enabled()

    class ProxyManager: NSObject {
      // Manager
      fileprivate var sdlManager: SDLManager!
      // Singleton
      static let sharedManager = ProxyManager()
      private override init() {
        super.init()
      }
    }
  }
}
