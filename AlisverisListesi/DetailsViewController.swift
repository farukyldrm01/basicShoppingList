import UIKit
import CoreData

class DetailsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var isimField: UITextField!
    @IBOutlet weak var fiyatField: UITextField!
    @IBOutlet weak var bedenField: UITextField!
    @IBOutlet weak var KaydetButonu: UIButton!
    
    var secilenUrunIsmi = ""
    var secilenUrunUUID : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if secilenUrunIsmi != "" {
            //Core data secilen urun bilgilerini goster
            
            KaydetButonu.isHidden = true
            
            if let uuidString = secilenUrunUUID?.uuidString {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Alisveris")
                fetchRequest.predicate = NSPredicate(format: "id = %@", uuidString)
                fetchRequest.returnsObjectsAsFaults = false
                
                do{
                    let result = try context.fetch(fetchRequest)
                    
                    if result.count > 0 {
                        for i in result as! [NSManagedObject] {
                            
                            if let isim = i.value(forKey: "isim") as? String {
                                isimField.text = isim
                            }
                            if let fiyat = i.value(forKey: "fiyat") as? Int {
                                fiyatField.text = "\(fiyat)"
                            }
                            if let beden = i.value(forKey: "beden") as? String  {
                                bedenField.text = beden
                            }
                            if let gorselData = i.value(forKey: "gorsel") as? Data {
                                imageView.image = UIImage(data: gorselData)
                            }
                            
                        }
                    }
                } catch {
                    print("hata var")
                }
            }
            
        } else {
            KaydetButonu.isHidden = false
            KaydetButonu.isEnabled = false
            isimField.text = ""
            fiyatField.text = ""
            bedenField.text = ""
        }
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(klavyeyiKapat))
        view.addGestureRecognizer(gestureRecognizer)
        
        imageView.isUserInteractionEnabled = true
        let imageGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gorselSec))
        imageView.addGestureRecognizer(imageGestureRecognizer)
    }
    @IBAction func kaydetTiklandi(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let alisveris = NSEntityDescription.insertNewObject(forEntityName: "Alisveris", into: context)
        
        alisveris.setValue(isimField.text, forKey: "isim")
        alisveris.setValue(bedenField.text, forKey: "beden")
        alisveris.setValue(UUID(), forKey: "id")
        
        if let fiyat = Int(fiyatField.text!) {
            alisveris.setValue(fiyat, forKey: "fiyat")
        }
        
        let data = imageView.image!.jpegData(compressionQuality: 0.25)
        
        alisveris.setValue(data, forKey: "gorsel")
        
        do {
            try context.save()
            print("Kayıt Edildi")
        } catch {
            print("hata VAr VaR vAR VARVARVAR")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Kaydedildi."), object: nil)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @objc func klavyeyiKapat(){
        view.endEditing(true)
    }
    @objc func gorselSec(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageView.image = info[.editedImage] as? UIImage
        KaydetButonu.isEnabled = true
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
 
