import UIKit
import PubNub
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, PNObjectEventListener {

    var window: UIWindow?
    var client: PubNub = {
        let config = PNConfiguration(publishKey: "pub-c-23d4074e-1127-4549-9f87-7b204e7f174f", subscribeKey: "sub-c-cf130baa-8d5c-11ea-8dc6-429c98eb9bb1")
        let pn = PubNub.clientWithConfiguration(config)
        return pn
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool{
        FirebaseApp.configure()
        window = UIWindow()
        let nav_controller = UINavigationController(rootViewController: MainController())
        window?.rootViewController = nav_controller
        window?.makeKeyAndVisible()
        return true
    }
    

    
    
}


