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

# Meirkhan Azamat
![alt text](../images/pm/meeting2.png)
I made meeting with team members and went through tasks. So, and made some question for customers in google form https://docs.google.com/forms/d/e/1FAIpQLSc1amNO97orCjl81LSO5E4r8sxPR_LvME-dxhYdwRJT6hVHVg/viewform?usp=sf_link. Next week i will share this link to the future users to take feedback.

# Nurpeiis Bexultan
I started to learn multithreading in open platform named Stepik. I learned, how to easily use GCD(Grand Central Dispatch). 
![alt text](../images/ios/bex_week9.jpeg)

# Konys Aituar
I started on looking for interest of specialist , as by last analytics I found that good specialist is a half of success. First of all I anaysed markets of finding jobs to see how many specialist are looking for a job. NUMBERs where:
hh = 1200 specialist with average of salary 293.000(by formula of mean)
market.kz = 453 specialist with average salary of 220.000
rabotanur = 240 specialist with average salary of 200.000
Also I started to search on internet about what kind of questions can be asked for specialist as a mini interview to make quality of specialist higher. For now by on working on questions to fill up the test interview.
<img width="1440" alt="Screen Shot 2022-03-28 at 16 08 26" src="https://user-images.githubusercontent.com/99612071/160376216-bd75459e-4b2f-4ff3-ace5-841fa74efcb0.png">

# Laila Mukhambetzhanova
Work on the UX design has been started. I drew the onboarding pages, login and registration pages, and also developed the main pages, like home page, my orders and profile. The onboarding page helps the user to assimilate the application faster, that is, it explains how the mobile app works. We will have 3 such pages. Then after the onboarding pages, registration and login pages come out. If the user has just started using the application, then first user register and see the main page. https://www.figma.com/file/5hCtwZFzAUUymb6wb4C98Q/Diploma-project?node-id=133%3A5047
![alt text](../images/design/screen5.png)
