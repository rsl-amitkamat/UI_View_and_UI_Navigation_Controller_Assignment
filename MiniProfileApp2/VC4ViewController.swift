//
//  VC4ViewController.swift
//  MiniProfileApp2
//
//  Created by Amit Kamat on 28/10/26.
//


import UIKit

class VC4ViewController: UIViewController {

    private let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "You are on VC4"
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Go to VC5", for: .normal)
        button.titleLabel?.font = .systemFont(
            ofSize: 18,
            weight: .semibold
        )
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "VC4"
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
            action: #selector(goToVC5),
            for: .touchUpInside
        )

        configureNavigationBar()
    }

    @objc private func goToVC5() {
        let vc5 = VC5ViewController()
        navigationController?.pushViewController(
            vc5,
            animated: true
        )
    }

    private func configureNavigationBar() {
        guard let navigationBar = navigationController?.navigationBar
        else { return }

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemOrange
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
    UINavigationController(rootViewController: VC4ViewController())
}
