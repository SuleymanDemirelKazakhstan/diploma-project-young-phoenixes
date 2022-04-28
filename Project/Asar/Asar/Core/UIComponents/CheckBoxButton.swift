//
//  CheckBoxButton.swift
//  Asar
//
//  Created by Abylbek Khassenov on 28.04.2022.
//

import UIKit

final class CheckboxButton: UIButton {
    private lazy var clearImage: UIImage = {
        let view = UIView(frame: CGRect(origin: .zero, size: Asset.generalDone.image.size))
        let renderer = UIGraphicsImageRenderer(bounds: view.bounds)
        return renderer.image { view.layer.render(in: $0.cgContext) }
    }()

    override var isEnabled: Bool {
        didSet {
            guard isEnabled != oldValue else { return }
            updateEnabledState()
        }
    }

    override var isHighlighted: Bool {
        didSet {
            alpha = isHighlighted ? 0.3 : 1
        }
    }

    override var isSelected: Bool {
        didSet {
            guard isSelected != oldValue else { return }
            updateSelectedState()
        }
    }

    override var intrinsicContentSize: CGSize {
        CGSize(width: super.intrinsicContentSize.width, height: 40)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateColors()
    }

    private func setup() {
        addTarget(self, action: #selector(didTouchUpInside), for: .touchUpInside)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 6)
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -6, bottom: 0, right: 6)
        imageView?.layer.borderWidth = 1
        imageView?.layer.cornerRadius = 4
        setImage(clearImage, for: .normal)
        setImage(Asset.generalDone.image, for: [.selected])
        setImage(Asset.generalDone.image, for: [.selected, .disabled])
        setImage(Asset.generalDone.image, for: [.selected, .highlighted])
        setTitleColor(Asset.white.color, for: .normal)
        tintColor = .blue
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: -6)
        updateColors()
    }

    @objc
    private func didTouchUpInside() {
        isSelected.toggle()
        sendActions(for: .valueChanged)
    }

    private func updateEnabledState() {
        imageView?.backgroundColor = isSelected ? .white : (isEnabled ? .clear : .white)
        alpha = !isEnabled && isSelected ? 0.3 : 1
        setTitleColor(isEnabled ? .white : .lightGray, for: .normal)
    }

    private func updateSelectedState() {
        UIView.animate(withDuration: 0.2) {
            self.imageView?.backgroundColor = self.isSelected ? .white : .clear
            self.imageView?.layer.borderWidth = self.isSelected ? 0 : 1
        }
    }

    private func updateColors() {
//        imageView?.layer.borderColor = Colors.fill5.cgColor
        imageView?.backgroundColor = isEnabled ? (isSelected ? .blue : .clear) : .systemRed
    }
}

