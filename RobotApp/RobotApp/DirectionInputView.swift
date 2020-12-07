//
// Created by Marijn Schilling on 07/12/2020.
// Copyright (c) 2020 Marijn Schilling. All rights reserved.
//

import UIKit

protocol DirectionInputListener: class {
    func didSelect(value: Int)
}

class DirectionInputView: UIView {
    static let rowHeight: CGFloat = 30.0

    public var direction: Int = 0

    lazy var directionInput: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.translatesAutoresizingMaskIntoConstraints = false

        return pickerView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubviewsAndConstraints()
    }

    private func addSubviewsAndConstraints() {
        addSubview(directionInput)

        directionInput.heightAnchor.constraint(equalToConstant: Self.rowHeight * 4).isActive = true
        directionInput.topAnchor.constraint(equalTo: topAnchor).isActive = true
        directionInput.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        directionInput.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        bottomAnchor.constraint(equalTo: directionInput.bottomAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DirectionInputView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        4
    }
}

extension DirectionInputView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        Self.rowHeight
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        Direction(rawValue: row)?.name ?? ""
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        direction = row
    }
}