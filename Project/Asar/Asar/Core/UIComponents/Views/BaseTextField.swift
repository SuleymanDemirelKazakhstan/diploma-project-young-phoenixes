//
//  BaseTextField.swift
//  Asar
//
//  Created by Abylbek Khassenov on 09.06.2022.
//

import SkyFloatingLabelTextField
import UIKit

protocol BaseTextFieldActionDelegate: AnyObject {
    func rightViewButtonDidTap(_ textField: BaseTextField)
}

class BaseTextField: SkyFloatingLabelTextField {
    weak var actionDelegate: BaseTextFieldActionDelegate?
    private var noteMessage: String?
    
    private lazy var noteLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.75
        return label
    }()

    private lazy var rightViewButton: UIButton = {
        let button = UIButton()
        button.frame.size = .init(width: 24, height: 24)
        button.addTarget(self, action: #selector(rightViewButtonDidTap), for: .touchUpInside)
        return button
    }()

    override var intrinsicContentSize: CGSize {
        let superSize = super.intrinsicContentSize
        return CGSize(width: superSize.width, height: superSize.height + noteHeight())
    }

    override var isEnabled: Bool {
        didSet {
            configureColors()
        }
    }

    override var hasErrorMessage: Bool {
        false
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        configureColors()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        noteLabel.frame = noteRect(forBounds: bounds)
    }

    override func editingChanged() {
        super.editingChanged()
    }

    @objc
    private func rightViewButtonDidTap() {
        actionDelegate?.rightViewButtonDidTap(self)
    }
    
    func setRightViewButtonImage(_ image: UIImage) {
        rightViewButton.setImage(image, for: .normal)
        rightView = rightViewButton
        rightViewMode = .always
    }

    override func textHeight() -> CGFloat { 40 }
    override func titleHeight() -> CGFloat { 16 }
    func noteHeight() -> CGFloat { errorMessage != nil ? 20 : 0 }

    func noteRect(forBounds bounds: CGRect) -> CGRect {
        let offset: CGFloat = errorMessage != nil ? 4 : 0
        let lineViewRect = lineViewRectForBounds(bounds, editing: true)
        return CGRect(x: lineViewRect.minX,
                      y: lineViewRect.maxY + offset,
                      width: bounds.width,
                      height: noteHeight() - offset)
    }

    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        CGRect(x: bounds.width - 24, y: titleHeight(), width: 24, height: textHeight() - selectedLineHeight)
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let superRect = super.textRect(forBounds: bounds)
        return CGRect(origin: superRect.origin,
                      size: CGSize(width: superRect.width,
                                   height: superRect.height - noteHeight()))
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let superRect = super.editingRect(forBounds: bounds)
        return CGRect(origin: superRect.origin,
                      size: CGSize(width: superRect.width,
                                   height: superRect.height - noteHeight()))
    }

    override func lineViewRectForBounds(_ bounds: CGRect, editing: Bool) -> CGRect {
        let superRect = super.lineViewRectForBounds(bounds, editing: editing)
        return CGRect(origin: CGPoint(x: superRect.minX,
                                      y: superRect.minY - noteHeight()),
                      size: superRect.size)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let superRect = super.placeholderRect(forBounds: bounds)
        return CGRect(origin: superRect.origin,
                      size: CGSize(width: superRect.width,
                                   height: superRect.height - noteHeight()))
    }

    private func setup() {
        addSubview(noteLabel)
        configureColors()
        setupFonts()
        lineHeight = 0.5
        selectedLineHeight = 2
        titleFormatter = { $0 }
    }

    private func setupFonts() {
        titleFont = Fonts.captionRegular
        font = Fonts.paragraphLargeRegular
        noteLabel.font = Fonts.captionRegular
        placeholderFont = Fonts.paragraphLargeRegular
    }

    private func configureColors() {
//        disabledColor = Colors.text3
//        lineColor = Colors.text3
//        noteLabel.textColor = errorMessageColor ?? noteLabelColor
//        placeholderColor = Colors.text3
//        selectedLineColor = Colors.fill0
//        selectedTitleColor = Colors.text1
//        textColor = isEnabled ? Colors.text1 : Colors.text3
//        titleColor = Colors.text3
//        titleErrorColor = Colors.text1
//        tintColor = Colors.fill5
//        rightViewButton.tintColor = rightViewButtonTintColor
    }
}

