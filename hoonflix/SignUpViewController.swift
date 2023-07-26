//
//  FirstViewController.swift
//  hoonflix
//
//  Created by 백래훈 on 2023/07/18.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var recommandCodeTextField: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    
    @IBOutlet var hoonflixSwitch: UISwitch!
    @IBOutlet var clearButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // textField 디자인
        designTextField(name: emailTextField, text: "이메일", keyboardType: .emailAddress, isSecureTextEntry: false)
        designTextField(name: passwordTextField, text: "비밀번호", keyboardType: .default, isSecureTextEntry: true)
        designTextField(name: nicknameTextField, text: "닉네임", keyboardType: .default, isSecureTextEntry: false)
        designTextField(name: locationTextField, text: "위치", keyboardType: .default, isSecureTextEntry: false)
        designTextField(name: recommandCodeTextField, text: "추천 코드 입력", keyboardType: .default, isSecureTextEntry: false)
        
        setTextFieldTag()
        setTextFieldText()
        designLoginButton()
        designSignUpButton()
        designClearButton()
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
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        if (emailTextField.text?.isEmpty == false && passwordTextField.text?.isEmpty == false && nicknameTextField.text?.isEmpty == false && locationTextField.text?.isEmpty == false) {
            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "MovieViewController") as? MovieViewController else { return }
                    self.navigationController?.pushViewController(nextVC, animated: true)
        } else {
            signUpWarningAlert()
        }
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        if (emailTextField.text?.isEmpty == false && passwordTextField.text?.isEmpty == false && nicknameTextField.text?.isEmpty == false && locationTextField.text?.isEmpty == false) {
            UserDefaults.standard.set(emailTextField.text, forKey: "email")
            UserDefaults.standard.set(passwordTextField.text, forKey: "password")
            UserDefaults.standard.set(nicknameTextField.text, forKey: "nickname")
            UserDefaults.standard.set(locationTextField.text, forKey: "location")
            UserDefaults.standard.set(recommandCodeTextField.text, forKey: "recommandCode")
            
            view.endEditing(true)
        } else {
            signUpWarningAlert()
        }
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        clearWarningAlert()
    }
    
//    @IBAction func saveButtonClicked(_ sender: UIButton) {
//        // 저장 버튼 클릭 횟수 저장 기능
//        // 1. 저장된 횟수 가지고 오기
//        let value = UserDefaults.standard.integer(forKey: "count")
//        // 2. 저장된 홧수에 1을 더하기
//        let result = value + 1
//        // 3. 2번에서 나온 결과를 다시 저장해주기
//        UserDefaults.standard.set(result, forKey: "count")
//        // 4. 확인
//        print(UserDefaults.standard.integer(forKey: "count"))
//    }
    
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
    
    func designLoginButton() {
        loginButton.setTitle("로그인", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.backgroundColor = .white
        loginButton.clipsToBounds = true
        loginButton.layer.cornerRadius = 5
        loginButton.layer.borderColor = UIColor.black.cgColor
        loginButton.layer.borderWidth = 1
    }
    
    func designSignUpButton() {
        signUpButton.setTitle("회원가입", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.backgroundColor = .black
        signUpButton.clipsToBounds = true
        signUpButton.layer.cornerRadius = 5
        signUpButton.layer.borderColor = UIColor.white.cgColor
        signUpButton.layer.borderWidth = 1
    }
    
    // 스위치 버튼 또한 매개변수 없이 구현
    func designHoonflixSwitch() {
        hoonflixSwitch.setOn(false, animated: true)
        hoonflixSwitch.onTintColor = .red
        hoonflixSwitch.thumbTintColor = .white
    }
    
    func designClearButton() {
        clearButton.setTitle("초기화", for: .normal)
        clearButton.setTitleColor(.black, for: .normal)
        clearButton.backgroundColor = .white
        clearButton.clipsToBounds = true
        clearButton.layer.cornerRadius = 5
    }
    
    func setTextFieldTag() {
        // 각 textField에 tag 값 부여
        emailTextField.tag = TextFieldType.email.rawValue
        passwordTextField.tag = TextFieldType.password.rawValue
        nicknameTextField.tag = TextFieldType.nickname.rawValue
        locationTextField.tag = TextFieldType.location.rawValue
        recommandCodeTextField.tag = TextFieldType.recommandCode.rawValue
    }
    
    func setTextFieldText() {
        // UserDefaults를 이용해 저장된 값 가져오기
        let email = UserDefaults.standard.string(forKey: "email")
        let password = UserDefaults.standard.string(forKey: "password")
        let nickname = UserDefaults.standard.string(forKey: "nickname")
        let location = UserDefaults.standard.string(forKey: "location")
        let recommandCode = UserDefaults.standard.string(forKey: "recommandCode")
        
        // 가져온 값을 텍스트필드에 표현
        if let email {
            emailTextField.text = email
        }
        if let password {
            passwordTextField.text = password
        }
        if let nickname {
            nicknameTextField.text = nickname
        }
        if let location {
            locationTextField.text = location
        }
        if let recommandCode {
            recommandCodeTextField.text = recommandCode
        }
    }
    
    func signUpWarningAlert() {
        let alert = UIAlertController(title: "확인하세요!", message: "추천코드를 제외한 나머지 항목들은 필수로 기입해주세요.", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(cancel)
        alert.addAction(ok)
        
        present(alert, animated: true)
        
    }
    
    func clearWarningAlert() {
        let alert = UIAlertController(title: "주의하세요!", message: "한 번 초기화를 하시면 돌이킬 수 없습니다. 확인하셨습니까?", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .destructive)
        let ok = UIAlertAction(title: "확인", style: .default, handler: { [self] _ in resetUserDefaultsValue() })
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        present(alert, animated: true)
    }
    
    func resetUserDefaultsValue() {
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            UserDefaults.standard.removeObject(forKey: key)
        }
        setTextFieldText()
    }
}
