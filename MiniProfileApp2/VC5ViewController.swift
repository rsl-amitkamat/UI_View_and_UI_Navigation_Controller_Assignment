//
//  VC5ViewController.swift
//  MiniProfileApp2
//
//  Created by Amit Kamat on 28/10/26.
//


import UIKit

class VC5ViewController: UIViewController {

    private let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "You are on VC5"
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let backToVC4Button = UIButton(type: .system)
    private let backToVC1Button = UIButton(type: .system)
    private let backToVC3Button = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "VC5 - Navigation"
        view.backgroundColor = .systemBackground

        configureButton(
            backToVC4Button,
            title: "Back to VC4"
        )
        configureButton(
            backToVC1Button,
            title: "Back to VC1"
        )
        configureButton(
            backToVC3Button,
            title: "Back to VC3"
        )

        view.addSubview(messageLabel)
        view.addSubview(backToVC4Button)
        view.addSubview(backToVC1Button)
        view.addSubview(backToVC3Button)

        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            messageLabel.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 50
            ),

            backToVC4Button.topAnchor.constraint(
                equalTo: messageLabel.bottomAnchor,
                constant: 40
            ),
            backToVC4Button.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 24
            ),
            backToVC4Button.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -24
            ),
            backToVC4Button.heightAnchor.constraint(
                equalToConstant: 48
            ),

            backToVC1Button.topAnchor.constraint(
                equalTo: backToVC4Button.bottomAnchor,
                constant: 16
            ),
            backToVC1Button.leadingAnchor.constraint(
                equalTo: backToVC4Button.leadingAnchor
            ),
            backToVC1Button.trailingAnchor.constraint(
                equalTo: backToVC4Button.trailingAnchor
            ),
            backToVC1Button.heightAnchor.constraint(
                equalToConstant: 48
            ),

            backToVC3Button.topAnchor.constraint(
                equalTo: backToVC1Button.bottomAnchor,
                constant: 16
            ),
            backToVC3Button.leadingAnchor.constraint(
                equalTo: backToVC4Button.leadingAnchor
            ),
            backToVC3Button.trailingAnchor.constraint(
                equalTo: backToVC4Button.trailingAnchor
            ),
            backToVC3Button.heightAnchor.constraint(
                equalToConstant: 48
            )
        ])

        backToVC4Button.addTarget(
            self,
            action: #selector(backToVC4),
            for: .touchUpInside
        )

        backToVC1Button.addTarget(
            self,
            action: #selector(backToVC1),
            for: .touchUpInside
        )

        backToVC3Button.addTarget(
            self,
            action: #selector(backToVC3),
            for: .touchUpInside
        )

        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "VC4",
            style: .plain,
            target: self,
            action: #selector(backToVC4)
        )

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Info",
            style: .plain,
            target: self,
            action: #selector(showInfo)
        )

        configureNavigationBar()
    }

    private func configureButton(
        _ button: UIButton,
        title: String
    ) {
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .systemFont(
            ofSize: 17,
            weight: .semibold
        )
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
    }

    @objc private func backToVC4() {
        navigationController?.popViewController(
            animated: true
        )
    }

    @objc private func backToVC1() {
        navigationController?.popToRootViewController(
            animated: true
        )
    }

    @objc private func backToVC3() {
        guard let navigationController = navigationController,
              let vc3 = navigationController.viewControllers.first(
                where: { $0 is VC3ViewController }
              ) else {
            return
        }

        navigationController.popToViewController(
            vc3,
            animated: true
        )
    }

    @objc private func showInfo() {
        let alert = UIAlertController(
            title: "VC5",
            message: "This screen demonstrates navigation stack operations.",
            preferredStyle: .alert
        )

        alert.addAction(
            UIAlertAction(title: "OK", style: .default)
        )

        present(alert, animated: true)
    }

    private func configureNavigationBar() {
        guard let navigationBar = navigationController?.navigationBar
        else { return }

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemRed
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
    UINavigationController(rootViewController: VC5ViewController())
}
