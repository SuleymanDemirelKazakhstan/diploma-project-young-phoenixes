# Khassenov Abylbek 
According to the plan for week 9 create segues between screened and configure user flow , since we use coordinators for transitions between screens, I created baseCoordinator whose function to add and remove dependencies also has a variable router.

![alt text](../images/ios/week9xcode1.png)

Router contains all the necessary transitions between screens, it is the router that we will use in the future for this. All functions that router contains

present(_ viewController: UIViewController, animated: Bool = true)
 
present(_ viewController: UIViewController, animated: Bool, modalPresentationStyle: UIModalPresentationStyle)

dismissModule(animated: Bool = true, completion: (() -> Void)? = nil)

popToModule(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void = {})

push(_ viewController: UIViewController, animated: Bool = true, hideBottomBarWhenPushed: Bool = true)

popModule(animated: Bool = true)

setRootModule(_ viewController: UIViewController, isNavigationBarHidden: Bool = false)

popToRootModule(animated: Bool = true, completion: @escaping () -> Void = {})

The role of these functions should be clear from the names.

![alt text](../images/ios/week9xcode2.png)

ApplicationCoorinator is our first coordinator to open. This is an example of how all coordinators will work in the future, and each coordinator will inherit baseCoordinator to have a router , either to pass to another coordinator or to use the function as intended.

![alt text](../images/ios/week9xcode3.png)

An example of the above. We create an AuthCoordinator that can open the login, registration and password recovery screen. Here we already use the router not to transfer to another coordinator , but to open one of the screens depending on the button that the user will press.

![alt text](../images/ios/week9xcode4.png)
