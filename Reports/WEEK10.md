# Nurpeiis Bexultan

Keep making the view controllers by given UX design. Wrote it by given code
    * class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UINavigationController(rootViewController: MainViewController())
        let vc2 = UINavigationController(rootViewController: OrderViewController())
        let vc3 = UINavigationController(rootViewController: MyOrdersViewController())
        let vc4 = UINavigationController(rootViewController: ProfileViewController())
        
        
        
        vc1.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(systemName: "star"), tag:1)
        vc2.tabBarItem = UITabBarItem(title: "Заказать", image: UIImage(systemName: "star"), tag:1)
        vc3.tabBarItem = UITabBarItem(title: "Мои Заказы", image: UIImage(systemName: "star"), tag:1)
        vc4.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "star"), tag:1)
        
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: false)

    }
    
}
    * class MainViewController:
    let search: UISearchController = {}()
    let scrollView = UIScrollView()
    let pageControl: UIPageControl = {}()
    let collectionView: UICollectionView = UICollectionView()

![alt text](../images/ios/bex_week10.jpeg)
