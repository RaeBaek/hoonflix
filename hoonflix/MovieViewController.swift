//
//  MovieViewController.swift
//  hoonflix
//
//  Created by 백래훈 on 2023/07/19.
//

import UIKit

class MovieViewController: UIViewController {
    
    @IBOutlet var mainPosterImage: UIImageView!
    @IBOutlet var firstImageView: UIImageView!
    @IBOutlet var secondImageView: UIImageView!
    @IBOutlet var thirdImageView: UIImageView!
    
    @IBOutlet var randomPlayButton: UIButton!
    @IBOutlet var previewLabel: UILabel!
    
    // 사용자에게 화면이 보이기 직전에 실행되는 부분
    // 모서리 둥글기, 그림자 등 스토리보드에서 설정할 수 없는 UI를 설정할 때 주로 사용
    // 뷰컨트롤러 생명주기
    
    // 전역상수로 선언
    let posterNumberArray = [1, 2, 3, 4, 5]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designPreviewPosterImage(name: firstImageView, corderRadius: 10, borderColor: UIColor.red.cgColor, borderWidth: 1)
        designPreviewPosterImage(name: secondImageView, corderRadius: 30, borderColor: UIColor.green.cgColor, borderWidth: 3)
        designPreviewPosterImage(name: thirdImageView, corderRadius: 50, borderColor: UIColor.blue.cgColor, borderWidth: 5)
        designPlayButton()
        
    }
    
    @IBAction func likeButtonClicked(_ sender: UIButton) {
        
        // Swift5 Raw Strings
        // +
        // 1.
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        
        // 2.
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let warnning = UIAlertAction(title: "경고", style: .destructive)
        let ok = UIAlertAction(title: "확인", style: .default)
        let share = UIAlertAction(title: "공유", style: .default)
        let airplay = UIAlertAction(title: "에어플레이", style: .default)
        
        // 3.
        alert.addAction(cancel)
        alert.addAction(warnning)
        alert.addAction(airplay)
        alert.addAction(share)
        alert.addAction(ok)
        
        // 4.
        present(alert, animated: true)
    }
    
    // 재생 버튼 클릭 시
    @IBAction func playButtonClicked(_ sender: UIButton) {
        showRandomMainPoster()
        showRandomPreviewPoster()
        
    }
    
    // 재생 버튼 UI 구성 함수 (매개변수 X)
    func designPlayButton() {
        let normal = UIImage(named: "play_normal")
        let highlighted = UIImage(named: "play_highlighted")
        randomPlayButton.setImage(normal, for: .normal)
        randomPlayButton.setImage(highlighted, for: .highlighted)
    }
    
    // 메인 포스터 이미지 랜덤 변경
    func showRandomMainPoster() {
        let result = posterNumberArray.randomElement()!
        mainPosterImage.image = UIImage(named: "\(result)")
    }
    
    // 미리보기 포스터 이미지 랜덤 변경
    func showRandomPreviewPoster() {
        // 지역변수로 선언
        var posterStringArray = ["극한직업", "도둑들", "명량", "베테랑", "부산행", "신과함께인과연", "신과함께죄와벌", "아바타", "알라딘", "암살", "어벤져스엔드게임", "왕의남자",  "태극기휘날리며", "택시운전사", "해운대"]
        
        // 일부러 포스터의 중복을 피하기 위해 삭제 후 다시 랜덤을 돌리는 코드로 짰으나
        // 반복되는 코드가 3번 생기게 된다.
        // 이 부분을 더 보기 좋게 구현해보자.
        let index1 = Int.random(in: 0..<posterStringArray.count)
        let result1 = posterStringArray[index1]
        
        firstImageView.image = UIImage(named: result1)
        posterStringArray.remove(at: index1)
        
        let index2 = Int.random(in: 0..<posterStringArray.count)
        let result2 = posterStringArray[index2]
        
        secondImageView.image = UIImage(named: result2)
        posterStringArray.remove(at: index2)
        
        let index3 = Int.random(in: 0..<posterStringArray.count)
        let result3 = posterStringArray[index3]
        
        thirdImageView.image = UIImage(named: result3)
    }
    
    // outletName: 외부 매개변수(Argument Label), 내부 매개변수(Parameter Name)
    // 매개변수: Parameter - 전달인자를 받을 변수
    // 전달인자: Argument - 함수를 호출할 때 전달하는 값 (시시각각 변동)
    // 미리보기 포스터 이미지 UI 구성 함수 (매개변수 O)
    func designPreviewPosterImage(name: UIImageView, corderRadius: CGFloat, borderColor: CGColor, borderWidth: CGFloat) {
        name.layer.cornerRadius = corderRadius
        name.layer.borderColor = borderColor
        name.layer.borderWidth = borderWidth
        
        name.contentMode = .scaleAspectFill
        
    }
    
}
