//
//  WelcomeViewController.swift
//  OnBoardingFlow
//
//  Created by Sergey on 12/15/20.
//

import UIKit

class WelcomeViewController: UIViewController {

    //MARK: - Views that will be displayed on this controller
    @IBOutlet weak var holderView: UIView!
    let scrollView = UIScrollView()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configure()
    }
    
    private func setInitialUI() {
        //Background color of the mainView
        view.backgroundColor = .systemBlue
    }
    
    private func configure() {
        //Set up scrollview

        holderView.addSubview(scrollView)
        let titles = ["See this fancy puppy? It can be yours", "Do you wanna help them? Do it in only one click!", "And never forget about them!"]
        scrollView.frame = holderView.bounds
        for x in 0..<3 {
            let pageView = UIView(frame: CGRect(x: holderView.frame.size.width * CGFloat(x), y: 0, width: holderView.frame.size.width, height: holderView.frame.size.height))
            scrollView.addSubview(pageView)
            //Title, image, button
            let titleLabel = UILabel(frame: CGRect(x: 20, y: 50, width: pageView.frame.size.width - 40, height: 50))
            let imageView = UIImageView(frame: CGRect(x: 20, y: titleLabel.frame.origin.y + 70, width: pageView.frame.size.width - 40, height: pageView.frame.size.width - 40))
            let button = UIButton(frame: CGRect(x: 20, y: pageView.frame.size.height - 100, width: pageView.frame.size.width - 40, height: 52))
            
            titleLabel.textAlignment = .center
            titleLabel.font = UIFont(name: "Helvetica-Bold", size: 32)
            titleLabel.text = titles[x]
            titleLabel.numberOfLines = 0
            pageView.addSubview(titleLabel)
            imageView.image = UIImage(named: "welcome_\(x + 1)")
            imageView.contentMode = .scaleAspectFit
            pageView.addSubview(imageView)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .black
            button.tag = x + 1
            button.setTitle("Continue", for: .normal)
            if x == 2 {
                button.setTitle("Get Started!", for: .normal)
            }
            button.addTarget(self, action: #selector(buttonIsTapped(_:)), for: .touchUpInside)
            pageView.addSubview(button)
        }
        
        scrollView.contentSize = CGSize(width: holderView.frame.size.width * 3.0, height: holderView.frame.size.height)
        scrollView.isPagingEnabled = true
    }
    
    @objc private func buttonIsTapped(_ button: UIButton) {
        guard button.tag < 3 else {
            //dismiss
            Core.shared.setIsNotNewUser()
            dismiss(animated: true, completion: nil)
            return
        }
        //Scroll to next page
        scrollView.setContentOffset(CGPoint(x: holderView.frame.size.width * CGFloat(button.tag), y: 0), animated: true)
    }
    
}
