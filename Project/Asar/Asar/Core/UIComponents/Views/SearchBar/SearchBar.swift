//
//  SearchBar.swift
//  Asar
//
//  Created by Abylbek Khassenov on 09.06.2022.
//

import UIKit

protocol SearchBarDelegate: AnyObject {
    func clearButtonDidTap(_ searchBar: SearchBar)
}

class SearchBar: UISearchBar {
    private lazy var clearButton: UIButton = {
        let button = UIButton(frame: .init(origin: .zero, size: .init(width: 24, height: 24)))
        button.setImage(Asset.generalClose.image, for: .normal)
        button.addTarget(self, action: #selector(clearButtonDidTap), for: .touchUpInside)
        return button
    }()

    weak var actionDelegate: SearchBarDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    @objc
    private func clearButtonDidTap() {
        textField?.text = nil
        textField?.rightViewMode = .never
        actionDelegate?.clearButtonDidTap(self)
    }

    @objc
    private func textFieldDidChange(_ textField: UITextField) {
        textField.rightViewMode = textField.text?.isEmpty == true ? .never : .always
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateColors()
    }

    func clear() {
        textField?.text = nil
        textField?.rightViewMode = .never
    }

    func setupClearButton() {
        textField?.clearButtonMode = .never
        textField?.rightView = clearButton
        textField?.rightViewMode = .never
    }

    func startLoader() {
        textField?.rightViewMode = .always
    }

    func stopLoader() {
        guard textField?.text?.isEmpty == false else { return }
        textField?.rightViewMode = .always
        textField?.rightView = clearButton
    }

    private func setup() {
        setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        setupTextField()
        updateColors()
    }

    private func setupTextField() {
        textField?.font = Fonts.paragraphRegular
        textField?.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        setupLeftImageView()
    }

    private func setupCancelButton() {
        cancelButton?.setTitle("Отмена", for: .normal)
        updateColors()
    }

    private func setupLeftImageView() {
        let imageView = UIImageView()
        imageView.image = Asset.generalSearch.image
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        textField?.leftView = imageView
    }

    @objc
    private func updateColors() {
        backgroundColor = .clear
        textField?.backgroundColor = .white
        textField?.leftView?.tintColor = .lightGray
        textField?.rightView?.tintColor = .lightGray
        textField?.textColor = .black
        textField?.tintColor = .lightGray
        tintColor = .green
        cancelButton?.tintColor = .lightGray
    }
}
