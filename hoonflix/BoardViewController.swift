//
//  BoardViewController.swift
//  hoonflix
//
//  Created by 백래훈 on 2023/07/19.
//

import UIKit

class BoardViewController: UIViewController {
    
    @IBOutlet var testLabel: [UILabel]!
    
    @IBOutlet var boardTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boardTextField.delegate = self
        
        for item in testLabel {
            item.textColor = .red
            item.font = .boldSystemFont(ofSize: 15)
        }
        
        designResultLabel()
        designBoardTextField()
        
    }
    
    // 별도의 추가적인 delegate 관련 코드없이 textField의 return key 타입을
    // done 으로 설정해주면 done 터치 시 자동으로 키보드가 내려감
    @IBAction func didEndOnExit(_ sender: UITextField) {
        resultLabel.text = boardTextField.text
        boardTextField.text = nil
        
        print("키보드 내려가!")
        
    }
    
    // 버튼 클릭 시
    @IBAction func checkButtonClicked(_ sender: UIButton) {
        resultLabel.text = boardTextField.text
        boardTextField.text = nil
        view.endEditing(true)
    }
    
    // 제스쳐 기능
    @IBAction func tapGestureTapped(_ sender: UITapGestureRecognizer) {

        view.endEditing(true)
        
        // 결과 레이블을 숨기고 보여주는 기능을 담당하는 부분
        if resultLabel.isHidden {
            resultLabel.isHidden = false
        } else {
            resultLabel.isHidden = true
        }
    }
    
    // 결과 레이블 UI 구성 함수
    func designResultLabel() {
        resultLabel.textAlignment = .center
        resultLabel.text = "안녕하세요."
        resultLabel.font = .boldSystemFont(ofSize: 20)
        resultLabel.textColor = .blue
        resultLabel.numberOfLines = 0
        
    }
    
    // 텍스트 필드 UI 구성 함수
    func designBoardTextField() {
        boardTextField.placeholder = "내용을 입력해주세요."
        boardTextField.textColor = .brown
        boardTextField.keyboardType = .emailAddress
        boardTextField.borderStyle = .line
    }
    
}

// extension 확장 및 UITextFieldDelegate 사용
extension BoardViewController: UITextFieldDelegate {
    // delegate를 활용한 키보드 내림 기능 구현 방법
    // 단, 위의 Action 기능과 delegate 기능을 모두 활성화 시
    // 두 기능 모두 작동하지 않게 됨
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
}
