//
//  CheckBoxView.swift
//  Asar
//
//  Created by Abylbek Khassenov on 28.04.2022.
//

import UIKit

protocol CheckBoxViewDelegate: AnyObject {
    func checkBoxButtonDidTap(_ view: CheckBoxView, isSelected: Bool)
    func linkDidTap(_ view: CheckBoxView, url: URL?)
}

class CheckBoxView: UIView, NibLoadable {
    private var textColor = Asset.white.color
    private var selectedTextColor = Asset.white.color
    private var attributedText: (text: String, part: String?)?
    weak var delegate: CheckBoxViewDelegate?

    @IBOutlet private var checkBoxButton: CheckboxButton!
    @IBOutlet private var titleTextView: UITextView!
    
    @IBAction
    private func checkBoxButtonDidTap() {
        delegate?.checkBoxButtonDidTap(self, isSelected: checkBoxButton.isSelected)
        updateColors()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateColors()
    }

    func setText(_ text: String,
                 part: String? = nil,
                 textColor: UIColor = .lightGray,
                 selectedTextColor: UIColor = .lightGray,
                 font: UIFont = Fonts.paragraphSmallRegular) {
        attributedText = (text, part)
        self.textColor = textColor
        self.selectedTextColor = selectedTextColor
        titleTextView.font = font
        configureAttributedText()
    }

    func setAttributedText(_ text: NSMutableAttributedString, textColor: UIColor = .lightGray, selectedTextColor: UIColor = .lightGray) {
        titleTextView.attributedText = text
        self.textColor = textColor
        self.selectedTextColor = selectedTextColor
        updateColors()
    }

    func setSelected(_ isSelected: Bool) {
        checkBoxButton.isSelected = isSelected
        updateColors()
    }

    @objc
    private func viewDidTap(_ gesture: UITapGestureRecognizer) {
        checkBoxButton.isSelected.toggle()
        delegate?.checkBoxButtonDidTap(self, isSelected: checkBoxButton.isSelected)
    }

    @objc
    private func textViewDidTap(_ gesture: UIGestureRecognizer) {
        checkBoxButton.isSelected.toggle()
        delegate?.checkBoxButtonDidTap(self, isSelected: checkBoxButton.isSelected)
    }

    private func configureAttributedText() {
        let mutableAttributedString = NSMutableAttributedString(string: attributedText?.text ?? "", attributes: [
            .foregroundColor: checkBoxButton.isSelected ? selectedTextColor : textColor,
            .font: Fonts.paragraphSmallRegular
        ])
        let range = mutableAttributedString.mutableString.range(of: attributedText?.part ?? "")
//        mutableAttributedString.addAttributes([
//                .foregroundColor: Asset.white,
//                .underlineStyle: NSUnderlineStyle.single.rawValue,
//                .underlineColor: Asset.white
//        ], range: range)
//        mutableAttributedString.addAttributes([.underlineColor: Asset.white, .underlineStyle: NSUnderlineStyle.single.rawValue], range: range)
        titleTextView.attributedText = mutableAttributedString
    }

    private func setup() {
        titleTextView.delegate = self
        titleTextView.textContainer.lineFragmentPadding = 0
        titleTextView.textContainerInset = .zero
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewDidTap(_:))))
        titleTextView.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(textViewDidTap(_:))))
        updateColors()
    }

    private func updateColors() {
        if attributedText?.text.isEmpty != false {
            titleTextView.textColor = checkBoxButton.isSelected ? selectedTextColor : textColor
            titleTextView.tintColor = selectedTextColor
        } else {
            configureAttributedText()
        }
    }
}

// MARK: - UITextViewDelegate

extension CheckBoxView: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        delegate?.linkDidTap(self, url: URL)
        return true
    }

    func textViewDidChangeSelection(_ textView: UITextView) {
        if textView.selectedTextRange != nil {
            textView.selectedTextRange = nil
        }
    }
}

