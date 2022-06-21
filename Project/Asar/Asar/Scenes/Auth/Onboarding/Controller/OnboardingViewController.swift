//
//  OnboardingViewController.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 15.04.2022.
//

import UIKit

protocol OnboardingNavigationDelegate: AnyObject {
    func showLoginPage()
}

class OnboardingViewController: UIViewController{
    private weak var delegate: OnboardingNavigationDelegate?
    @IBOutlet weak var PageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var skipButton: UIButton!
    
    let OnboardingCollectionViewCellId = "OnboardingCollectionViewCell"
    
    var slides: [OnboardingSlides] = []
    
    var currentPage = 0
    {
        didSet{
            PageControl.currentPage = currentPage
            if currentPage == slides.count - 1{
                nextButton.setTitle(L10n.onboardingStart, for: .normal)
            }
        }

    }
    
    init(delegate: OnboardingNavigationDelegate) {
        self.delegate = delegate
        super.init(nibName: String(describing: Self.self), bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        self.navigationController?.isNavigationBarHidden = true
        nextButton.setTitle(L10n.onboardingNext, for: .normal)
        skipButton.setTitle(L10n.onboardingSkip, for: .normal)
        let nibCell = UINib(nibName: OnboardingCollectionViewCellId, bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: OnboardingCollectionViewCellId)
        
        slides = [
            OnboardingSlides(title: L10n.onboardingAuthorization,
                             description: L10n.onboardingAutorizationTitle,
                             image: Asset.onboard.image),
            OnboardingSlides(title: L10n.onboardingLaunch,
                             description: L10n.onboardingLaunchTitle,
                             image: Asset.onboard2.image),
            OnboardingSlides(title: L10n.onboardingProfile,
                             description: L10n.onboardingProfileTitle,
                             image: Asset.onboard3.image)
        ]
    }
    
    @IBAction func nextButtonClick(_ sender: UIButton) {
        if currentPage == slides.count - 1{
            delegate?.showLoginPage()
        }else{
            currentPage += 1
            collectionView.isPagingEnabled  = false
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.reloadData()
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
          
        }
        collectionView.isPagingEnabled  = true
    }
    
    @IBAction func skipButtonClic(_ sender: UIButton) {
        delegate?.showLoginPage()
    }
}


extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCellId, for: indexPath) as! OnboardingCollectionViewCell
        cell.configure(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
