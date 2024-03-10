import UIKit
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @Binding var selectedImage: UIImage
    @Environment(\.dismiss) private var dismiss
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            
            parent.dismiss()
        }
    }
}
