import SwiftUI
import UIKit

struct StoryboardViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ViewController")
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {

    }
}
