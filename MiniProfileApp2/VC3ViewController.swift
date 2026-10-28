//
//  VC3ViewController.swift
//  MiniProfileApp2
//
//  Created by Amit Kamat on 28/10/26.
//


import UIKit

class VC3ViewController: UIViewController {

    private let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "You are on VC3"
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Go to VC4", for: .normal)
        button.titleLabel?.font = .systemFont(
            ofSize: 18,
            weight: .semibold
        )
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "VC3"
        view.backgroundColor = .systemBackground

        view.addSubview(messageLabel)
        view.addSubview(nextButton)

        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            messageLabel.centerYAnchor.constraint(
                equalTo: view.centerYAnchor,
                constant: -35
            ),

            nextButton.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            nextButton.topAnchor.constraint(
                equalTo: messageLabel.bottomAnchor,
                constant: 24
            )
        ])

        nextButton.addTarget(
            self,
            action: #selector(goToVC4),
            for: .touchUpInside
        )

        configureNavigationBar()
    }

    @objc private func goToVC4() {
        let vc4 = VC4ViewController()
        navigationController?.pushViewController(
            vc4,
            animated: true
        )
    }

    private func configureNavigationBar() {
        guard let navigationBar = navigationController?.navigationBar
        else { return }

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemTeal
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]

        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.tintColor = .white
    }
}

#Preview {
    UINavigationController(rootViewController: VC3ViewController())
}
