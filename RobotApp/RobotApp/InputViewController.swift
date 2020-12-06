//
// Created by Marijn Schilling on 06/12/2020.
// Copyright (c) 2020 Marijn Schilling. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

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

        return input
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviewsAndConstraints()
        
        view.backgroundColor = .white
    }

    func addSubviewsAndConstraints() {
        let gridSizeInputStackView = UIStackView(arrangedSubviews: [widthInput, heightInput])
        gridSizeInputStackView.axis = .horizontal
        gridSizeInputStackView.distribution = .fillEqually

        let robotPositionInputStackView = UIStackView(arrangedSubviews: [positionXInput, positionYInput])
        robotPositionInputStackView.axis = .horizontal
        robotPositionInputStackView.distribution = .fillEqually

        let stackView = UIStackView(arrangedSubviews: [gridSizeInputStackView, robotPositionInputStackView, directionInput])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually

        view.addSubview(stackView)

        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
}
