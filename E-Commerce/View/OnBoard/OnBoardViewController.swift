//
//  OnBoardViewController.swift
//  E-Commerce
//
//  Created by HungND on 06/02/2023.
//

import UIKit

class OnBoardViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    
    var currentPage = 0
    
    func scrollToNextCell(){
        currentPage += 1
        let indexPath = IndexPath(row: currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        pageController.currentPage = currentPage
    }

    /**
     Invokes Timer to start Automatic Animation with repeat enabled
     */
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { [weak self] timer in
            if self?.currentPage ?? 0 < slideData.count - 1 {
                self?.scrollToNextCell()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "SlideCell", bundle: nil), forCellWithReuseIdentifier: "SlideCell")
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        startTimer()
    }
}

extension OnBoardViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slideData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SlideCell", for: indexPath) as! SlideCell
        
        cell.setupData(data: slideData[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = UIScreen.main.bounds.size
        
        return CGSize(width: size.width, height: collectionView.bounds.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        
        currentPage = Int(scrollView.contentOffset.x/width)
        pageController.currentPage = currentPage
    }
}

