import Foundation
import UIKit
import MobileCoreServices

//MARK: - UIImagePickerController
public protocol FilePickerDelegate: AnyObject {

    func didSelect(image: UIImage?, imageURL:String?, id:Int?)
    func didDelete()
    func didSelectDocs(url:URL, id:Int?)
}

open class FilePicker: NSObject {

    private let pickerController: UIImagePickerController
    private weak var presentationController: UIViewController?
    private weak var delegate: FilePickerDelegate?

    public init(presentationController: UIViewController, delegate: FilePickerDelegate) {
        self.pickerController = UIImagePickerController()

        super.init()

        self.presentationController = presentationController
        self.delegate = delegate

        self.pickerController.delegate = self
        self.pickerController.allowsEditing = true
        self.pickerController.mediaTypes = ["public.image"]
    }

    private func action(for type: UIImagePickerController.SourceType, title: String) -> UIAlertAction? {
        guard UIImagePickerController.isSourceTypeAvailable(type) else {
            return nil
        }

        return UIAlertAction(title: title, style: .default) { [unowned self] _ in
            self.pickerController.sourceType = type
            self.presentationController?.present(self.pickerController, animated: true)
        }
    }
    private func deleteAction(for type: UIImagePickerController.SourceType, title: String) -> UIAlertAction? {
        let action = UIAlertAction(title: title, style: .destructive) {_ in
            self.delegate?.didDelete()
        }
        return action
    }
    private func docsAction() -> UIAlertAction? {
        return UIAlertAction(title: "Файл", style: .default) { [unowned self] _ in
            let documentPicker = UIDocumentPickerViewController(documentTypes: [String(kUTTypeText),String(kUTTypeContent),String(kUTTypeItem),String(kUTTypeData)], in: .import)
            documentPicker.delegate = self
            self.presentationController?.present(documentPicker, animated: true)
        }
    }

    public func present(delete: Bool? = nil) {

        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

//        if let action = self.action(for: .camera, title: "Сделать снимок") {
//            alertController.addAction(action)
//        }
        guard let delete = delete else {
            return
        }
        if let action = self.action(for: .photoLibrary, title: "Галерея") {
            alertController.addAction(action)
        }
        if delete {
            if let action = self.deleteAction(for: .photoLibrary, title: "Удалить") {
                alertController.addAction(action)
            }
        }
//        if let action = self.docsAction() {
//            alertController.addAction(action)
//        }

        alertController.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))

        if UIDevice.current.userInterfaceIdiom == .pad {
            alertController.popoverPresentationController?.permittedArrowDirections = [.down, .up]
        }

        self.presentationController?.present(alertController, animated: true)
    }

    private func pickerController(_ controller: UIImagePickerController, didSelect image: UIImage?) {
        controller.dismiss(animated: true, completion: nil)

        self.delegate?.didSelect(image: image, imageURL: nil, id: nil)
    }
    private func pickerDocsController(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        self.delegate?.didSelectDocs(url: urls[0], id: nil)
    }
    
}

extension FilePicker: UIImagePickerControllerDelegate {

    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.pickerController(picker, didSelect: nil)
    }

    public func imagePickerController(_ picker: UIImagePickerController,
                                      didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            return self.pickerController(picker, didSelect: nil)
        }
        self.pickerController(picker, didSelect: image)
    }
}

extension FilePicker: UINavigationControllerDelegate {

}
extension FilePicker: UIDocumentPickerDelegate {
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        self.pickerDocsController(controller, didPickDocumentsAt: urls)
    }
}
