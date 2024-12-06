//
//  HomeViewController.swift
//  GameStore
//
//  Created by Rafael on 05/12/24.
//

import UIKit

class HomeViewController: UIViewController {

    private var bannerImages: [UIImage] = []
    private let screenSize = UIScreen.main.bounds
    
    lazy var bannerPageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.backgroundColor = .clear
        pc.currentPageIndicatorTintColor = .black
        pc.pageIndicatorTintColor = .white
        pc.numberOfPages = bannerImages.count
        pc.currentPage = 0
        pc.isUserInteractionEnabled = true
        pc.addTarget(self, action: #selector(tappedPageControl), for: .touchUpInside)
        return pc
    }()
    
    private let bannerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = .white
        self.view.setBackgroundOnTop()
        self.title = "GameStore"

        
        bannerImages.append(UIImage(named: "0")!)
        bannerImages.append(UIImage(named: "1")!)
        bannerImages.append(UIImage(named: "2")!)
        bannerImages.append(UIImage(named: "1")!)
        bannerImages.append(UIImage(named: "0")!)
        
        setupUI()
        
        bannerCollectionView.register(BannerCollectionCell.self, forCellWithReuseIdentifier: BannerCollectionCell.identifier)
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        
        bannerCollectionView.showsHorizontalScrollIndicator = false
    }
    
    private func setupUI() {
        self.view.addSubview(bannerCollectionView)
        self.view.addSubview(bannerPageControl)
        bannerPageControl.translatesAutoresizingMaskIntoConstraints = false
        bannerCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        bannerCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bannerCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bannerCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        bannerCollectionView.heightAnchor.constraint(equalToConstant: screenSize.height * 0.20).isActive = true
        
        bannerPageControl.topAnchor.constraint(equalTo: bannerCollectionView.bottomAnchor).isActive = true
         
        bannerPageControl.trailingAnchor.constraint(equalTo: bannerCollectionView.trailingAnchor).isActive = true
        bannerPageControl.leadingAnchor.constraint(equalTo: bannerCollectionView.leadingAnchor).isActive = true
                
    }
    
    @objc func tappedPageControl(_ sender: UIPageControl) {
        bannerCollectionView.scrollToItem(at: IndexPath(row: sender.currentPage, section: 0),
                                          at: .centeredHorizontally, animated: true)
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.bannerImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: screenSize.width, height: screenSize.height * 0.20)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionCell.identifier, for: indexPath) as? BannerCollectionCell else { return UICollectionViewCell() }
        
        let image = self.bannerImages[indexPath.row]
        cell.configureImage(with: image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.bannerPageControl.currentPage = indexPath.section
    }

    
}
