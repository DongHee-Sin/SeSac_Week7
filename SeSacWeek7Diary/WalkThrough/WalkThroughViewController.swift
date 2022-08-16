//
//  WalkThroughViewController.swift
//  SeSacWeek7Diary
//
//  Created by 신동희 on 2022/08/16.
//

import UIKit

class WalkThroughViewController: UIPageViewController {

    // 뷰컨트롤러 배열
    var pageViewControllerList: [UIViewController] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        createPageViewController()
        configurePageViewController()
    }
    

    // 배열에 뷰컨트롤러 추가
    func createPageViewController() {
        let vc1 = storyboard?.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        let vc3 = storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        
        pageViewControllerList = [vc1, vc2, vc3]
    }
    
    func configurePageViewController() {
        delegate = self
        dataSource = self
        
        // display
        guard let first = pageViewControllerList.first else { return }
        setViewControllers([first], direction: .forward, animated: true)  // 보여줄려는 뷰컨을 설정
    }
}




extension WalkThroughViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        // 현재 페이지 뷰컨트롤러에 보이는 뷰컨의 인덱스 가져오기
        guard let viewControllerIndex = pageViewControllerList.firstIndex(of: viewController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        
        return previousIndex < 0 ? nil : pageViewControllerList[previousIndex]
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        // 현재 페이지 뷰컨트롤러에 보이는 뷰컨의 인덱스 가져오기
        guard let viewControllerIndex = pageViewControllerList.firstIndex(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        
        return nextIndex >= pageViewControllerList.count ? nil : pageViewControllerList[nextIndex]
    }
    
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pageViewControllerList.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let first = viewControllers?.first, let index = pageViewControllerList.firstIndex(of: first) else { return 0 }
        print("===", index) // ????
        return index
    }
}
