//
//  ViewController.swift
//  Video_Player_Assignment
//
//  Created by anurag.sah on 04/07/24.
//

import UIKit
import AVKit
import Combine

final class ViewController: UIViewController {
    
    var viewModel: ViewModel
    
    private var player: AVPlayer?
    
    private let playerVC: AVPlayerViewController
    
    private var isPlayingObservation: NSKeyValueObservation?
    
    private var curTime: Double = 0.0
    
    private var cancellableSubscriptions =  Set<AnyCancellable>()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .blue
        return label
    }()
    
    private var captionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = 320
        label.backgroundColor = .black
        return label
    }()
    
    private let bttn: UIButton = {
        let bttn = UIButton()
        bttn.backgroundColor = .blue
        bttn.setTitle(Constants.hideCaptainTitle.val, for: .normal)
        bttn.setTitleColor(.white, for: .normal)
        bttn.layer.cornerRadius = 10
        bttn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        return bttn
    }()
    
    required init?(coder: NSCoder) {
        self.viewModel = ViewModel(model: .init(title:  Constants.screenTitle.val, subtitle: ""))
        self.playerVC = AVPlayerViewController()
        super.init(coder: coder)
        applyModel()
    }

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        self.playerVC = AVPlayerViewController()
        self.player = nil
        super.init(nibName: nil, bundle: nil)
        applyModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        observeVideoPlay()
    }
    
    private func applyModel() {
        viewModel.$model.sink{ [weak self] model in
            guard let self else { return }
            
            self.titleLabel.text = model.title
            self.captionLabel.text = model.subtitle
            
            let url = URL(fileURLWithPath: model.path ?? "")
            self.player = AVPlayer(url: url)
        }.store(in: &cancellableSubscriptions)
    }
    
    private func setupViews(){
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: self.view.topAnchor, constant: 140),
            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 120)
        ])
        
        playerVC.player = player
        playerVC.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(playerVC.view)
        self.addChild(playerVC)
        NSLayoutConstraint.activate([
            playerVC.view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
            playerVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -400),
            playerVC.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            playerVC.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        playerVC.didMove(toParent: self)
        
        bttn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bttn)
        NSLayoutConstraint.activate([
            bttn.topAnchor.constraint(equalTo: playerVC.view.bottomAnchor, constant: 40),
            bttn.bottomAnchor.constraint(equalTo: playerVC.view.bottomAnchor, constant: 70),
            bttn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 130),
            bttn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -130)
        ])
        bttn.addTarget(self, action: #selector(captianBttnPressed), for: .touchUpInside)
        bttn.isUserInteractionEnabled = true
        
        captionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(captionLabel)
        NSLayoutConstraint.activate([
            captionLabel.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -180),
            captionLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
        ])
    }
    
    @objc func captianBttnPressed(_ sender: UIButton) {
        if captionLabel.isHidden {
            captionLabel.isHidden = false
            bttn.setTitle(Constants.hideCaptainTitle.val, for: .normal)
        }
        else {
            captionLabel.isHidden = true
            bttn.setTitle(Constants.showCaptainTitle.val, for: .normal)
        }
    }
}
extension ViewController {
    
    private func getCurrentTime() -> Double {
        guard let player = player else { return 0.0 }
        let currentTime = player.currentTime()
        return CMTimeGetSeconds(currentTime) / 10.0
    }
 
    private func observeVideoPlay() {
        isPlayingObservation = player?.observe(\.rate, options: [.new, .old], changeHandler: { [weak self] player, change in
            guard let self = self else { return }
            if player.rate == 0.0 {
                self.curTime = getCurrentTime()
            } else {
                self.curTime = getCurrentTime()
                if(self.curTime == 0.0){
                    viewModel.model.subtitle = ""
                    if jsonParagraph.sentences.isEmpty && jsonWords.isEmpty {
                        jsonParagraph.sentences = viewModel.paraCache
                        jsonWords = viewModel.wordCache
                        viewModel.paraCache = []
                        viewModel.wordCache = []
                    }
                }
                player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 0.03, preferredTimescale: CMTimeScale(NSEC_PER_SEC)), queue: DispatchQueue.main) { [weak self] time in
                    guard let self = self else { return }
                    self.viewModel.updateCaptain(currentTime: self.curTime + time.seconds)
                }
            }
        })
    }
}

//#Preview{
//    
//    let viewModel: ViewModel = ViewModel(model: .init(title: Constants.screenTitle.val, subtitle: ""))
//    let vc = ViewController(viewModel: viewModel)
//    return vc
//}

