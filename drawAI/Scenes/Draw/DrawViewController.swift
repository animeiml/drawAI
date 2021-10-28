//
//  DrawViewController.swift
//  drawAI
//
//  Created by João Guilherme on 20/10/21.
//

import UIKit
import Foundation

class DrawViewController: UIViewController {
    @IBOutlet weak var referenceImageImageView: UIImageView!
    @IBOutlet weak var canvasView: CanvasView!
    @IBOutlet weak var toolsView: DrawToolsView!
    @IBOutlet weak var timerBarView: DrawTimerBarView!
    
    private var viewModel: DrawViewModel
    private var referenceImageURL: URL? {
        didSet {
            var newImage: UIImage?
            if let url = referenceImageURL {
                newImage = UIImage(contentsOfFile: url.path)
            }
            referenceImageImageView.image = newImage
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveReferenceImage()
        toolsView.delegate = self
        timerBarView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        canvasView.setupDrawing()
        timerBarView.startTimer()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    init(viewModel: DrawViewModel = DrawViewModel()) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }
    
    func saveReferenceImage(){
        guard let referenceImage: UIImage = UIImage(named: "kakashi") else { return }
        referenceImageURL = saveImage(referenceImage)
    }
}

extension DrawViewController: DrawToolsDelegate {
    func onPencilChosen() {
        canvasView.chooseTool(.pencil)
    }
    
    func onEraserChosen() {
        canvasView.chooseTool(.eraser)
    }
}
extension DrawViewController: DrawTimerBarDelegate {
    func didFinishTime() {
        guard let drawing: UIImage = canvasView.captureDrawImage(),
              let drawingData: Data = drawing.pngData() else { return }
        
        viewModel.saveImageWithData(drawingData)
        
        guard let endViewModel: EndViewModel = viewModel.buildEndViewModel() else { return }
        
        let endViewController: EndViewController = EndViewController(viewModel: endViewModel)
        
        navigationController?.pushViewController(endViewController, animated: true)
    }
}

extension DrawViewController {
    private func saveImage(_ image: UIImage) -> URL? {
        guard let imageData = image.pngData() else {
            return nil
        }
        let baseURL = FileManager.default.temporaryDirectory
        let imageURL = baseURL.appendingPathComponent(UUID().uuidString).appendingPathExtension("png")
        do {
            try imageData.write(to: imageURL)
            return imageURL
        } catch {
            print("Error saving image to \(imageURL.path): \(error)")
            return nil
        }
    }
    
//    private func removeSavedImages() {
//        var urls = contestantImageURLs
//        if let originalURL = originalImageURL {
//            urls.append(originalURL)
//        }
//        let fileMgr = FileManager.default
//        for url in urls {
//            try? fileMgr.removeItem(at: url)
//        }
//    }
}
