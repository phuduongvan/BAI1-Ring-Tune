//
//  ViewController.swift
//  ConcurrencyDemo
//
//  Created by Hossam Ghareeb on 11/15/15.
//  Copyright © 2015 Hossam Ghareeb. All rights reserved.
//

import UIKit

let imageURLs = ["http://kenhtuyensinh24h.vn/wp-content/uploads/2017/01/dai-hoc-su-pham-ky-thuat-tp-hcm.png", "https://i.ytimg.com/vi/FsTlDtWW7Mw/maxresdefault.jpg", "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Dai_hoc_Su_pham_Ky_thuat_tu_tren_cao.jpg/310px-Dai_hoc_Su_pham_Ky_thuat_tu_tren_cao.jpg", "http://kenhdautubds.com/wp-content/uploads/2017/03/hoi-an-quang-nam.jpg"]

class Downloader {
    
    class func downloadImageWithURL(_ url:String) -> UIImage! {
        
        let data = try? Data(contentsOf: URL(string: url)!)
        return UIImage(data: data!)
    }
}

class ViewController: UIViewController {
    
    var queue = OperationQueue()

    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBOutlet weak var imageView4: UIImageView!
    
    @IBOutlet weak var sliderValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //
    //queue = OperationQueue()
    
    //let operation1 = BlockOperation(block: {
      //  let img1 = Downloader.downloadImageWithURL(imageURLs[0])
      //  OperationQueue.main.addOperation({
        //    self.imageView1.image = img1
      //  })
   // }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //CACH 1 NOMARL
    /*@IBAction func didClickOnStart(_ sender: AnyObject) {
        
        let img1 = Downloader.downloadImageWithURL(imageURLs[0])
        self.imageView1.image = img1
        
        let img2 = Downloader.downloadImageWithURL(imageURLs[1])
        self.imageView2.image = img2
        
        let img3 = Downloader.downloadImageWithURL(imageURLs[2])
        self.imageView3.image = img3
        
        let img4 = Downloader.downloadImageWithURL(imageURLs[3])
        self.imageView4.image = img4
        
    }*/
    //2. Using Concurrent Dispatch Queues
    
   /*@IBAction func didClickOnStart(_ sender: AnyObject) {
        
      //  let queue = DispatchQueue.global(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        let queue = DispatchQueue.global()
        queue.async() { () -> Void in
            
            let img1 = Downloader.downloadImageWithURL(imageURLs[0])
            DispatchQueue.main.async(execute: {
                
                self.imageView1.image = img1
            })
            
        }
        queue.async() { () -> Void in
            
            let img2 = Downloader.downloadImageWithURL(imageURLs[1])
            
            DispatchQueue.main.async(execute: {
                
                self.imageView2.image = img2
            })
            
        }
        queue.async() { () -> Void in
            
            let img3 = Downloader.downloadImageWithURL(imageURLs[2])
            
            DispatchQueue.main.async(execute: {
                
                self.imageView3.image = img3
            })
            
        }
        queue.async() { () -> Void in
            
            let img4 = Downloader.downloadImageWithURL(imageURLs[3])
            
            DispatchQueue.main.async(execute: {
                
                self.imageView4.image = img4
            })
        }
        
    }*/
    
    //3.    Using Serial Dispatch Queues
    
   /* @IBAction func didClickOnStart(_ sender: AnyObject) {
        
        let serialQueue = DispatchQueue(label: "com.appcoda.imagesQueue", attributes: [])
        
        
        serialQueue.async { () -> Void in
            
            let img1 = Downloader .downloadImageWithURL(imageURLs[0])
            DispatchQueue.main.async(execute: {
                
                self.imageView1.image = img1
            })
            
        }
        serialQueue.async { () -> Void in
            
            let img2 = Downloader.downloadImageWithURL(imageURLs[1])
            
            DispatchQueue.main.async(execute: {
                
                self.imageView2.image = img2
            })
            
        }
        serialQueue.async { () -> Void in
            
            let img3 = Downloader.downloadImageWithURL(imageURLs[2])
            
            DispatchQueue.main.async(execute: {
                
                self.imageView3.image = img3
            })
            
        }
        serialQueue.async { () -> Void in
            
            let img4 = Downloader.downloadImageWithURL(imageURLs[3])
            
            DispatchQueue.main.async(execute: {
                
                self.imageView4.image = img4
            })
        }
    }*/
    
    //PART 2
    
   /* @IBAction func didClickOnStart(_ sender: AnyObject) {
        queue = OperationQueue()
       // queue =
        
        
        queue.addOperation { () -> Void in
            
            //let img1 = Downloader.downloadImageWithURL(imageURLs[0])
            
           // OperationQueue.main.addOperation({
            //    self.imageView1.image = img1
           // })
            
            operation1.completionBlock = {
                print("Operation 1 completed, cancelled:\(operation1.cancelled) ")
            }
        }
        
        queue.addOperation { () -> Void in
            let img2 = Downloader.downloadImageWithURL(imageURLs[1])
            
            OperationQueue.main.addOperation({
                self.imageView2.image = img2
            })
            
        }
        
        queue.addOperation { () -> Void in
            let img3 = Downloader.downloadImageWithURL(imageURLs[2])
            
            OperationQueue.main.addOperation({
                self.imageView3.image = img3
            })
            
        }
        
        queue.addOperation { () -> Void in
            let img4 = Downloader.downloadImageWithURL(imageURLs[3])
            
            OperationQueue.main.addOperation({
                self.imageView4.image = img4
            })
            
        }
    }*/
    
    //
    @IBAction func didClickOnStart(_ sender: AnyObject) {
        queue = OperationQueue()
        
        let operation1 = BlockOperation(block: {
            let img1 = Downloader.downloadImageWithURL(imageURLs[0])
            OperationQueue.main.addOperation({
                self.imageView1.image = img1
            })
        })
        
        operation1.completionBlock = {
            print("Operation 1 completed, cancelled:\(operation1.isCancelled)")
        }
        queue.addOperation(operation1)
        
        let operation2 = BlockOperation(block: {
            let img2 = Downloader.downloadImageWithURL(imageURLs[1])
            OperationQueue.main.addOperation({
                self.imageView2.image = img2
            })
        })
        operation2.addDependency(operation1)
        operation2.completionBlock = {
            print("Operation 2 completed, cancelled:\(operation2.isCancelled)")
        }
        queue.addOperation(operation2)
        
        
        let operation3 = BlockOperation(block: {
            let img3 = Downloader.downloadImageWithURL(imageURLs[2])
            OperationQueue.main.addOperation({
                self.imageView3.image = img3
            })
        })
        operation3.addDependency(operation2)
        
        operation3.completionBlock = {
            print("Operation 3 completed, cancelled:\(operation3.isCancelled)")
        }
        queue.addOperation(operation3)
        
        let operation4 = BlockOperation(block: {
            let img4 = Downloader.downloadImageWithURL(imageURLs[3])
            OperationQueue.main.addOperation({
                self.imageView4.image = img4
            })
        })
        
        operation4.completionBlock = {
            print("Operation 4 completed, cancelled:\(operation4.isCancelled)")
        }
        queue.addOperation(operation4)
        
    }




    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
        self.sliderValueLabel.text = "\(sender.value * 100.0)"
    }
    
    public enum NSOperationQueuePriority : Int {
        case VeryLow
        case Low
        case Normal
        case High
        case VeryHigh
    }
    
    @IBAction func didClickOnCancel(sender: AnyObject) {
        
        self.queue.cancelAllOperations()
    }
}

