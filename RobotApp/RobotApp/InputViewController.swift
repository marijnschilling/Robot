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

        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.adjustsFontForContentSizeCategory = true

        return label
    }()

    lazy var widthInput: UITextField = {
        let input = UITextField()
        input.translatesAutoresizingMaskIntoConstraints = false
        input.placeholder = "Width"
        input.textAlignment = .center

        input.keyboardType = .numberPad
        input.font = UIFont.preferredFont(forTextStyle: .body)
        input.adjustsFontForContentSizeCategory = true

        return input
    }()

    lazy var heightInput: UITextField = {
        let input = UITextField()
        input.translatesAutoresizingMaskIntoConstraints = false
        input.placeholder = "Height"
        input.textAlignment = .center

        input.keyboardType = .numberPad
        input.font = UIFont.preferredFont(forTextStyle: .body)
        input.adjustsFontForContentSizeCategory = true

        return input
    }()

    lazy var positionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.adjustsFontForContentSizeCategory = true

        return label
    }()

    lazy var positionXInput: UITextField = {
        let input = UITextField()
        input.translatesAutoresizingMaskIntoConstraints = false
        input.placeholder = "X"
        input.textAlignment = .center

        input.keyboardType = .numberPad

        input.font = UIFont.preferredFont(forTextStyle: .body)
        input.adjustsFontForContentSizeCategory = true

        return input
    }()

    lazy var positionYInput: UITextField = {
        let input = UITextField()
        input.translatesAutoresizingMaskIntoConstraints = false
        input.placeholder = "Y"
        input.textAlignment = .center

        input.keyboardType = .numberPad

        input.font = UIFont.preferredFont(forTextStyle: .body)
        input.adjustsFontForContentSizeCategory = true
        
        return input
    }()

    lazy var directionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center

        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.adjustsFontForContentSizeCategory = true

        return label
    }()

    lazy var directionInput: DirectionInputView = {
       let input = DirectionInputView()
        input.translatesAutoresizingMaskIntoConstraints = false

        return input
    }()

    lazy var instructionsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center

        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.adjustsFontForContentSizeCategory = true

        return label
    }()

    lazy var instructionsInput: UITextField = {
        let input = UITextField()
        input.translatesAutoresizingMaskIntoConstraints = false
        input.placeholder = "Instructions"
        input.textAlignment = .center

        input.autocapitalizationType = .allCharacters
        input.autocorrectionType = .no

        input.font = UIFont.preferredFont(forTextStyle: .body)
        input.adjustsFontForContentSizeCategory = true

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

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Go!", style: .plain, target: self, action: #selector(didSelectButton))

        setLabelTitles()

        view.backgroundColor = .white

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    func addSubviewsAndConstraints() {
        let smallMargin: CGFloat = 10.0
        let largeMargin: CGFloat = 20.0
        
        view.addSubview(scrollView)

        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

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
                                                       directionLabel,
                                                       directionInput,
                                                       instructionsLabel,
                                                       instructionsInput])

        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false

        scrollView.addSubview(stackView)

        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: smallMargin).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: largeMargin).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -smallMargin).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -largeMargin).isActive = true

        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -largeMargin).isActive = true

        stackView.setCustomSpacing(smallMargin, after: gridLabel)
        stackView.setCustomSpacing(largeMargin, after: gridSizeInputStackView)
        stackView.setCustomSpacing(smallMargin, after: positionLabel)
        stackView.setCustomSpacing(largeMargin, after: robotPositionInputStackView)
        stackView.setCustomSpacing(largeMargin, after: directionInput)
        stackView.setCustomSpacing(smallMargin, after: instructionsLabel)
    }
}

extension InputViewController {
    @objc func didSelectButton() {
        setLabelTitles()

        let viewModel = InputViewModel(gridWidth: widthInput.text,
                                       gridHeight: heightInput.text,
                                       xPosition: positionXInput.text,
                                       yPosition: positionYInput.text,
                                       direction: directionInput.direction,
                                       instructions: instructionsInput.text)

        let result = viewModel.validate()

        switch result {
        case .success(let robotViewModel):
            showResultAlert(for: robotViewModel)
        case .failure(let error):
            UIView.animate(withDuration: 0.2) {
                self.showError(error)
            }
        }
    }

    private func setLabelTitles() {
        gridLabel.text = "Create grid"
        gridLabel.textColor = .black
        positionLabel.text = "Enter robot start position"
        positionLabel.textColor = .black
        directionLabel.text = "Select robot start direction"
        directionLabel.textColor = .black
        instructionsLabel.text = "Enter robot instructions"
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
            fatalError("DirectionInputView should return only valid values")
        case .invalidInstructions:
            instructionsLabel.text = error.errorMessage
            instructionsLabel.textColor = .red
        }
    }

    private func showResultAlert(for robotViewModel: RobotViewModel) {
        let output = robotViewModel.moveRobot()

        let okAction = UIAlertAction(title: "OK", style: .default)

        let alert = UIAlertController(title: "Robot moved", message: output, preferredStyle: .alert)
        alert.addAction(okAction)

        present(alert, animated: true)
    }
}

extension InputViewController {
    @objc func keyboardWillShow(notification: NSNotification) {

        guard let userInfo = notification.userInfo,
              var keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }

        keyboardFrame = view.convert(keyboardFrame, from: nil)

        var contentInset = scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        scrollView.contentInset = contentInset
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset = UIEdgeInsets.zero
    }
}