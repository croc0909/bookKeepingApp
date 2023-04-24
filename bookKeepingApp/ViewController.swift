//
//  ViewController.swift
//  bookKeepingApp
//
//  Created by AndyLin林棋瀚 on 2023/4/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var starTextField: UITextField!
    @IBOutlet weak var firstImageView: UIImageView!
    
    
    // FileManager 路徑
    let documentsDirectory =
    FileManager.default.urls(for: .documentDirectory,
                             in: .userDomainMask).first!
    
    //var lover = Lover(name: "", star: "", innerBeauty: true, weight: 1.0)
    var lover: Lover?
    
    var imageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    //MARK: - Action
    
    @IBAction func saveAction(_ sender: Any) {
        //
        let name = nameTextField.text ?? ""
        let star = starTextField.text ?? ""
        //var imageName: String?
        
        
        if let lover = lover {
            imageName = lover.imageName
        }
        if imageName == nil {
            imageName = UUID().uuidString
        }
        
        let imageData = firstImageView.image?.jpegData(compressionQuality: 1)
        let imageUrl = Lover.documentsDirectory.appendingPathComponent(imageName!).appendingPathExtension("jpg")
        try? imageData?.write(to: imageUrl)
        
        lover = Lover(name: name, star: star,imageName: imageName)
        Lover.saveLovers(lover!)
        print("imageName \(String(describing: imageName))")
    }
    
    @IBAction func loadAction(_ sender: Any) {
        print("loadAction")
        
        lover = Lover.loadLovers()!
        nameTextField.text = lover?.name
        starTextField.text = lover?.star
        /*
        guard let path = getPathForImage(name: imageName)?.path,
              FileManager.default.fileExists(atPath: path) else {
            print("Error getting path")
            return
        }*/
        
        firstImageView.image = UIImage(named: lover?.imageName ?? "0")
    }
    
    @IBAction func cleanAction(_ sender: Any) {
        nameTextField.text = nil
        starTextField.text = nil
        firstImageView.image = nil
    }
    
}

