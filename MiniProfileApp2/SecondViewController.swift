
import UIKit

class SecondViewController: UIViewController {
    
    @objc private func goToVC3() {
        let vc3 = VC3ViewController()

        navigationController?.pushViewController(
            vc3,
            animated: true
        )
    }

    private let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello from the Second Screen!"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Go to VC3", for: .normal)
        button.titleLabel?.font = .systemFont(
            ofSize: 18,
            weight: .semibold
        )
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.addTarget(
            self,
            action: #selector(goToVC3),
            for: .touchUpInside
        )
        
        title = "VC2"
        view.backgroundColor = .systemBackground

        view.addSubview(messageLabel)
        
        view.addSubview(nextButton)

        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            messageLabel.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),
            messageLabel.leadingAnchor.constraint(
                greaterThanOrEqualTo: view.leadingAnchor,
                constant: 20
            ),
            messageLabel.trailingAnchor.constraint(
                lessThanOrEqualTo: view.trailingAnchor,
                constant: -20
            ),
            nextButton.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            nextButton.topAnchor.constraint(
                equalTo: messageLabel.bottomAnchor,
                constant: 30
            )
        ])
    }
}
