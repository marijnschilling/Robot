//
// Created by Marijn Schilling on 06/12/2020.
// Copyright (c) 2020 Marijn Schilling. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        return scrollView
    }()

    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var gridLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center

        return label
    }()

    lazy var widthInput: UITextField = {
        let input = UITextField()
        input.translatesAutoresizingMaskIntoConstraints = false
        input.placeholder = "Width"
        input.textAlignment = .center

        input.keyboardType = .numberPad

        return input
    }()

    lazy var heightInput: UITextField = {
        let input = UITextField()
        input.translatesAutoresizingMaskIntoConstraints = false
        input.placeholder = "Height"
        input.textAlignment = .center

        input.keyboardType = .numberPad

        return input
    }()

    lazy var positionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center

        return label
    }()

    lazy var positionXInput: UITextField = {
        let input = UITextField()
        input.translatesAutoresizingMaskIntoConstraints = false
        input.placeholder = "X position"
        input.textAlignment = .center

        input.keyboardType = .numberPad

        return input
    }()

    lazy var positionYInput: UITextField = {
        let input = UITextField()
        input.translatesAutoresizingMaskIntoConstraints = false
        input.placeholder = "Y position"
        input.textAlignment = .center

        input.keyboardType = .numberPad

        return input
    }()

    lazy var directionInput: UITextField = {
        let input = UITextField()
        input.translatesAutoresizingMaskIntoConstraints = false
        input.placeholder = "Direction"
        input.textAlignment = .center

        input.autocorrectionType = .no
        return input
    }()

    lazy var instructionsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center

        return label
    }()

    lazy var instructionsInput: UITextField = {
        let input = UITextField()
        input.translatesAutoresizingMaskIntoConstraints = false
        input.placeholder = "Instructions"
        input.textAlignment = .center

        input.autocorrectionType = .no
        return input
    }()

    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false

        button.setTitle("GO!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .selected)
        button.backgroundColor = .systemBlue

        button.isEnabled = true

        button.addTarget(self, action: #selector(didSelectButton), for: .touchUpInside)

        return button
    }()

    private var buttonBottomAnchor: NSLayoutConstraint?
    private var buttonKeyboardAnchor: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviewsAndConstraints()

        setLabelTitles()

        view.backgroundColor = .white

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    func addSubviewsAndConstraints() {
        view.addSubview(scrollView)

        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -44).isActive = true

        let gridSizeInputStackView = UIStackView(arrangedSubviews: [widthInput, heightInput])
        gridSizeInputStackView.axis = .horizontal
        gridSizeInputStackView.distribution = .fillEqually

        let robotPositionInputStackView = UIStackView(arrangedSubviews: [positionXInput, positionYInput])
        robotPositionInputStackView.axis = .horizontal
        robotPositionInputStackView.distribution = .fillEqually

        let stackView = UIStackView(arrangedSubviews: [gridLabel,
                                                       gridSizeInputStackView,
                                                       positionLabel,
                                                       robotPositionInputStackView,
                                                       directionInput,
                                                       instructionsLabel,
                                                       instructionsInput])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.spacing = 20

        scrollView.addSubview(stackView)

        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -44).isActive = true

        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true

        view.addSubview(button)

        button.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true

        buttonBottomAnchor = button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        buttonBottomAnchor?.isActive = true
    }
}

extension InputViewController {
    @objc func didSelectButton() {
        setLabelTitles()

        let viewModel = InputViewModel(gridWidth: widthInput.text,
                                    gridHeight: heightInput.text,
                                    xPosition: positionXInput.text,
                                    yPosition: positionYInput.text,
                                    direction: directionInput.text,
                                    instructions: instructionsInput.text)

        let result = viewModel.validate()

        switch result {
        case .success(let robotViewModel):
            showSuccessAlert(for: robotViewModel)
        case .failure(let error):
            showError(error)
        }
    }

    private func setLabelTitles() {
        gridLabel.text = "Input values between 1-9"
        gridLabel.textColor = .black
        positionLabel.text = "Input values between 1 and the grid size"
        positionLabel.textColor = .black
        instructionsLabel.text = "L to turn left, R to turn right and F to move forward"
        instructionsLabel.textColor = .black
    }

    private func showError(_ error: InputError) {
        switch error {
        case .invalidGridWidth, .invalidGridHeight:
            gridLabel.text = error.errorMessage
            gridLabel.textColor = .red
        case .invalidXPosition, .invalidYPosition:
            positionLabel.text = error.errorMessage
            positionLabel.textColor = .red
        case .invalidDirection:
            print("invalid direction")
            //TODO: Make custom control
        case .invalidInstructions:
            instructionsLabel.text = error.errorMessage
            instructionsLabel.textColor = .red
        }
    }

    private func showSuccessAlert(for: RobotViewModel) {

    }
}

extension InputViewController {
    @objc func keyboardWillShow(notification: NSNotification) {

        guard let userInfo = notification.userInfo,
              var keyboardFrame = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue else { return }

        keyboardFrame = view.convert(keyboardFrame, from: nil)

        var contentInset = scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 44
        scrollView.contentInset = contentInset

        buttonKeyboardAnchor = button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -keyboardFrame.size.height)
        buttonBottomAnchor?.isActive = false
        buttonKeyboardAnchor?.isActive = true
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset = UIEdgeInsets.zero

        buttonKeyboardAnchor?.isActive = false
        buttonBottomAnchor?.isActive = true
    }
}