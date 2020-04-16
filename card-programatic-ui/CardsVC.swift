//
//  CardsVC.swift
//  card-programatic-ui
//
//  Created by MARC on 4/15/20.
//  Copyright © 2020 MARC. All rights reserved.
//

import UIKit

class CardsVC: UIViewController {
    
    //MARK:- Variables
    let cardImageView   = UIImageView()
    let stopButton      = CWButton(backGroundColor: .systemRed, title: "Stop!")
    let restartButton   = CWButton(backGroundColor: .systemGreen, title: "Restart")
    let rulesButton     = CWButton(backGroundColor: .systemBlue, title: "Rules")
    
    lazy var cards: [UIImage] = {
        return Cards.deck
    }()
    
    var timer: Timer!
    //MARK:- ENDS
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        setupTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    //MARK:- Setup UI function to setup all UI components
    func setupUI() {
        setupImageView()
        setupStopButton()
        setupRestartButton()
        setupRulesButton()
    }
    
    //MARK: - setting up all UI elemenyts and constraints
    func setupImageView() {
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
    
        ])
    }
    
    func setupStopButton() {
        view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(stopButtonForTimer), for: .touchUpInside)
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
        
        ])
    }
    
    @objc func stopButtonForTimer() {
        timer.invalidate()
    }
    
    
    func setupRestartButton() {
        view.addSubview(restartButton)
        restartButton.addTarget(self, action: #selector(restartButtonforTimer), for: .touchUpInside)
        NSLayoutConstraint.activate([
            restartButton.widthAnchor.constraint(equalToConstant: 115),
            restartButton.heightAnchor.constraint(equalToConstant: 50),
            restartButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20),
            restartButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor)
        
        ])
    }
    
    @objc func restartButtonforTimer() {
        timer.invalidate()
        setupTimer()
    }
    
    func setupRulesButton() {
        view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(showRulesController), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor)
        
        ])
    }
    
    @objc func showRulesController() {
        present(RulesVC(), animated: true, completion: nil)
    }
    
    //MARK:- Ends
    
    func setupTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(setupImageViewForCard), userInfo: nil, repeats: true)
    }
    
   @objc  func setupImageViewForCard() {
    cardImageView.image = cards.randomElement()
    }

}
