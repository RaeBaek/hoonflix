//
//  FirstViewController.swift
//  hoonflix
//
//  Created by 백래훈 on 2023/07/18.
//

import UIKit

enum TextFieldType: Int {
    case email = 100
    case password = 200
    case nickname = 300
    case location = 400
    case recommandCode = 500
}

class SignUpViewController: UIViewController {
    
    @IBOutlet var emailOrPhoneNumber: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var nickname: UITextField!
    @IBOutlet var location: UITextField!
    @IBOutlet var recommandCode: UITextField!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var hoonflixSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailOrPhoneNumber.tag = TextFieldType.email.rawValue
        password.tag = TextFieldType.password.rawValue
        nickname.tag = TextFieldType.nickname.rawValue
        location.tag = TextFieldType.location.rawValue
        recommandCode.tag = TextFieldType.recommandCode.rawValue
        
        designTextField(name: emailOrPhoneNumber, text: "이메일", keyboardType: .emailAddress, isSecureTextEntry: false)
        designTextField(name: password, text: "비밀번호", keyboardType: .default, isSecureTextEntry: true)
        designTextField(name: nickname, text: "닉네임", keyboardType: .default, isSecureTextEntry: false)
        designTextField(name: location, text: "위치", keyboardType: .default, isSecureTextEntry: false)
        designTextField(name: recommandCode, text: "추천 코드 입력", keyboardType: .default, isSecureTextEntry: false)
        
        designSignUpButton()
        designHoonflixSwitch()
        
    }
    
    @IBAction func textFieldKeyboardTapped(_ sender: UITextField) {
        
        guard let text = sender.text, let value = TextFieldType(rawValue: sender.tag) else {
            print("오류가 발생했습니다. 확인해주세요.")
            return
        }
        
        // rawValue의 값으로 접근하여
        // 역으로 열거형의 변수값을 가져오게 된다.
//        guard let value = TextFieldType(rawValue: sender.tag) else {
//            print("해당하는 값이 없습니다. 확인해주세요.")
//            return
//        }
        
        switch value {
        case .email: print("이메일은 \(text)입니다.")
        case .password: print("비밀번호는 \(text)입니다.")
        case .nickname: print("닉네임은 \(text)입니다.")
        case .location: print("지역은 \(text)입니다.")
        case .recommandCode: print("추천코드는 \(text)입니다.")
        }
        
//        switch sender.tag {
//        case TextFieldType.email.rawValue:
//            print("이메일은 \(text)입니다.")
//        case TextFieldType.password.rawValue:
//            print("비밀번호는 \(text)입니다.")
//        case TextFieldType.nickname.rawValue:
//            print("닉네임은 \(text)입니다.")
//        case TextFieldType.location.rawValue:
//            print("위치는 \(text)입니다.")
//        case TextFieldType.recommandCode.rawValue:
//            print("추천코드는 \(text)입니다.")
//        default:
//            print("오류가 발생했습니다. 확인해주세요.")
//        }
        
//        if sender.tag == TextFieldType.email.rawValue {
//            print("이메일은 \(text)입니다.")
//        } else if sender.tag == TextFieldType.password.rawValue {
//            print("비밀번호는 \(text)입니다.")
//        } else if sender.tag == TextFieldType.nickname.rawValue {
//            print("닉네임는 \(text)입니다.")
//        } else if sender.tag == TextFieldType.location.rawValue {
//            print("위치는 \(text)입니다.")
//        } else if sender.tag == TextFieldType.recommandCode.rawValue {
//            print("추천코드는 \(text)입니다.")
//        }
        
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        view.endEditing(true)
    }
    
    @IBAction func tapGestureTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    // 5개의 텍스트 필드를 하나의 함수를 이용하여 디자인
    func designTextField(name: UITextField, text: String, keyboardType: UIKeyboardType, isSecureTextEntry: Bool) {
        name.placeholder = text
        name.keyboardType = keyboardType
        name.isSecureTextEntry = isSecureTextEntry
        
        name.clipsToBounds = true
        name.layer.cornerRadius = 7
        name.textColor = .black
        name.textAlignment = .center
        name.borderStyle = .line
        name.backgroundColor = .white
        
    }
    
    // 회원가입 버튼은 1개이므로 매개변수 없이 직접 구현
    func designSignUpButton() {
        signUpButton.titleLabel?.font = .systemFont(ofSize: 10, weight: .bold)
        signUpButton.setTitle("회원가입", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.backgroundColor = .black
        signUpButton.layer.borderColor = UIColor.white.cgColor
        signUpButton.layer.borderWidth = 1
    }
    
    // 스위치 버튼 또한 매개변수 없이 구현
    func designHoonflixSwitch() {
        hoonflixSwitch.setOn(false, animated: true)
        hoonflixSwitch.onTintColor = .red
        hoonflixSwitch.thumbTintColor = .white
    }
}
