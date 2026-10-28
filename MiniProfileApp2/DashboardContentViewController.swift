//
//  DashboardContentViewController.swift
//  MiniProfileApp2
//
//  Created by Amit Kamat on 28/10/26.
//


import UIKit

class DashboardContentViewController: UIViewController {

    private let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to Dashboard Lab"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tap Me", for: .normal)
        button.titleLabel?.font = .systemFont(
            ofSize: 17,
            weight: .semibold
        )
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let featureSwitch: UISwitch = {
        let toggle = UISwitch()
        toggle.isOn = true
        toggle.translatesAutoresizingMaskIntoConstraints = false
        return toggle
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        view.addSubview(messageLabel)
        view.addSubview(actionButton)
        view.addSubview(featureSwitch)

        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: 16
            ),
            messageLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 12
            ),
            messageLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -12
            ),
            messageLabel.centerYAnchor.constraint(
                equalTo: view.centerYAnchor,
                constant: -60
            ),

            actionButton.topAnchor.constraint(
                equalTo: messageLabel.bottomAnchor,
                constant: 20
            ),
            actionButton.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            actionButton.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),
            actionButton.widthAnchor.constraint(
                equalToConstant: 160
            ),
            actionButton.heightAnchor.constraint(
                equalToConstant: 48
            ),

            featureSwitch.topAnchor.constraint(
                equalTo: actionButton.bottomAnchor,
                constant: 20
            ),
            featureSwitch.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            featureSwitch.bottomAnchor.constraint(
                lessThanOrEqualTo: view.bottomAnchor,
                constant: -16
            )
        ])

        actionButton.addTarget(
            self,
            action: #selector(actionButtonTapped),
            for: .touchUpInside
        )

        featureSwitch.addTarget(
            self,
            action: #selector(switchChanged),
            for: .valueChanged
        )
    }

    @objc private func actionButtonTapped() {
        messageLabel.text = "Button tapped!"
    }

    @objc private func switchChanged() {
        messageLabel.text = featureSwitch.isOn
            ? "Feature is enabled"
            : "Feature is disabled"
    }
}

#Preview {
    DashboardContentViewController()
}
