//
//  DashboardContainerViewController.swift
//  MiniProfileApp2
//
//  Created by Amit Kamat on 28/10/26.
//


import UIKit

class DashboardContainerViewController: UIViewController {

    private let headerContainer = UIView()
    private let contentContainer = UIView()
    private let footerContainer = UIView()

    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Dashboard Lab"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let footerLabel: UILabel = {
        let label = UILabel()
        label.text = "Status: Ready"
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let contentViewController =
        DashboardContentViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Dashboard"
        view.backgroundColor = .systemBackground

        setupContainers()
        setupChildViewController()
    }

    private func setupContainers() {
        headerContainer.backgroundColor = .systemBlue.withAlphaComponent(0.15)
        contentContainer.backgroundColor = .systemGreen.withAlphaComponent(0.15)
        footerContainer.backgroundColor = .systemOrange.withAlphaComponent(0.15)

        headerContainer.layer.cornerRadius = 12
        contentContainer.layer.cornerRadius = 12
        footerContainer.layer.cornerRadius = 12

        headerContainer.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.translatesAutoresizingMaskIntoConstraints = false
        footerContainer.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(headerContainer)
        view.addSubview(contentContainer)
        view.addSubview(footerContainer)

        headerContainer.addSubview(headerLabel)
        footerContainer.addSubview(footerLabel)

        NSLayoutConstraint.activate([
            headerContainer.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 12
            ),
            headerContainer.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 16
            ),
            headerContainer.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -16
            ),
            headerContainer.heightAnchor.constraint(
                equalToConstant: 70
            ),

            contentContainer.topAnchor.constraint(
                equalTo: headerContainer.bottomAnchor,
                constant: 12
            ),
            contentContainer.leadingAnchor.constraint(
                equalTo: headerContainer.leadingAnchor
            ),
            contentContainer.trailingAnchor.constraint(
                equalTo: headerContainer.trailingAnchor
            ),

            footerContainer.topAnchor.constraint(
                equalTo: contentContainer.bottomAnchor,
                constant: 12
            ),
            footerContainer.leadingAnchor.constraint(
                equalTo: headerContainer.leadingAnchor
            ),
            footerContainer.trailingAnchor.constraint(
                equalTo: headerContainer.trailingAnchor
            ),
            footerContainer.heightAnchor.constraint(
                equalToConstant: 50
            ),
            footerContainer.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -12
            ),

            headerLabel.centerXAnchor.constraint(
                equalTo: headerContainer.centerXAnchor
            ),
            headerLabel.centerYAnchor.constraint(
                equalTo: headerContainer.centerYAnchor
            ),

            footerLabel.centerXAnchor.constraint(
                equalTo: footerContainer.centerXAnchor
            ),
            footerLabel.centerYAnchor.constraint(
                equalTo: footerContainer.centerYAnchor
            )
        ])
    }

    private func setupChildViewController() {
        addChild(contentViewController)

        let childView = contentViewController.view!
        childView.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.addSubview(childView)

        NSLayoutConstraint.activate([
            childView.topAnchor.constraint(
                equalTo: contentContainer.topAnchor,
                constant: 8
            ),
            childView.leadingAnchor.constraint(
                equalTo: contentContainer.leadingAnchor,
                constant: 8
            ),
            childView.trailingAnchor.constraint(
                equalTo: contentContainer.trailingAnchor,
                constant: -8
            ),
            childView.bottomAnchor.constraint(
                equalTo: contentContainer.bottomAnchor,
                constant: -8
            )
        ])

        contentViewController.didMove(toParent: self)
    }
}

#Preview {
    UINavigationController(
        rootViewController: DashboardContainerViewController()
    )
}
