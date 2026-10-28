
import UIKit

class ViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome!"
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Go to Second Screen 1", for: .normal)
        button.titleLabel?.font = .systemFont(
            ofSize: 18,
            weight: .semibold
        )
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()


    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to your first UIKit app."
        label.font = .systemFont(ofSize: 17)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dashboardButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Open Dashboard Lab", for: .normal)
        button.titleLabel?.font = .systemFont(
            ofSize: 17,
            weight: .semibold
        )
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let contentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    @objc private func openSecondScreen() {
        let secondVC = SecondViewController()

        navigationController?.pushViewController(
            secondVC,
            animated: true
        )
    }
    
    @objc private func openDashboard() {
        let dashboard = DashboardContainerViewController()
        navigationController?.pushViewController(
            dashboard,
            animated: true
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Home: viewWillAppear")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Home: viewDidAppear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Home: viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Home: viewDidDisappear")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Home"
        view.backgroundColor = .systemBackground


        contentStack.addArrangedSubview(titleLabel)
        contentStack.addArrangedSubview(subtitleLabel)
        contentStack.addArrangedSubview(nextButton)
        contentStack.addArrangedSubview(dashboardButton)


        view.addSubview(contentStack)

        nextButton.heightAnchor.constraint(
            equalToConstant: 52
        ).isActive = true

        dashboardButton.heightAnchor.constraint(
            equalToConstant: 48
        ).isActive = true

        
        NSLayoutConstraint.activate([
            contentStack.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),

            contentStack.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),

            contentStack.leadingAnchor.constraint(
                greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 20
            ),

            contentStack.trailingAnchor.constraint(
                lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -20
            ),

            contentStack.widthAnchor.constraint(
                equalTo: view.widthAnchor,
                multiplier: 0.85
            ),

            contentStack.widthAnchor.constraint(
                lessThanOrEqualToConstant: 420
            ),

            contentStack.topAnchor.constraint(
                greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 12
            ),

            contentStack.bottomAnchor.constraint(
                lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -12
            )
        ])

        nextButton.addTarget(
            self,
            action: #selector(openSecondScreen),
            for: .touchUpInside
        )

        dashboardButton.addTarget(
            self,
            action: #selector(openDashboard),
            for: .touchUpInside
        )
    }


    @objc private func continueButtonTapped() {
        print("Continue button tapped!")
    }
}

#Preview {
    ViewController()
}
