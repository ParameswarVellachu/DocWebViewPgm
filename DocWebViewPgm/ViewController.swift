//
//  ViewController.swift
//  DocWebViewPgm
//
//  Created by Veera Reddy on 8/18/18.
//  Copyright © 2018 Parameswaran. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.viewMSDocument()
//        self.viewPDF().
    }
    func viewPDF()  {
        if let pdfURL = Bundle.main.url(forResource: "IT_Statement", withExtension: "pdf", subdirectory: nil, localization: nil)  {
            do {
                let data = try Data(contentsOf: pdfURL)
//                let webView = WKWebView(frame: CGRect(x:20,y:20,width:view.frame.size.width-40, height:view.frame.size.height-40))
                self.webView.load(data, mimeType: "application/pdf", characterEncodingName:"", baseURL: pdfURL.deletingLastPathComponent())
//                view.addSubview(webView)
            }
            catch {
                // catch errors here
            }
        }
    }
    
    func viewDocument(name:String, withextension:String)  {
        let path = Bundle.main.path(forResource: name, ofType: withextension)
        let targetURL = NSURL.fileURL(withPath: path!)
        let urlRequest = URLRequest(url: targetURL)
        self.webView.load(urlRequest)
    }
    
    @IBAction func documentViewerClicked(_ sender: UIButton) {
        if sender.tag == 0 {
            // PDF
            let url = URL(string: "http://ccidahra.com/wp-content/uploads/2016/03/sample.ppt")
//            let url = URL(string: "https://www.tutorialspoint.com/ios/ios_tutorial.pdf")
            let requestObj = URLRequest(url: url! as URL)
            self.webView.load(requestObj)

        } else if sender.tag == 1 {
            // PDF
            self.viewDocument(name: "Swift", withextension: "pdf")
        } else if sender.tag == 2 {
            // Doc
            self.viewDocument(name: "RESUME", withextension: "docx")
            
        } else if sender.tag == 3 {
            // Excel
            self.viewDocument(name: "Mobile", withextension: "xlsx")
        } else if sender.tag == 4 {
            // PPT
            self.viewDocument(name: "iOS", withextension: "pptx")
        }
        
    }
    
    func webDocument() {
        
        //            self.webView.load(data, mimeType: "application/pdf", characterEncodingName:"", baseURL: pdfURL.deletingLastPathComponent())
        
        
        //            do {
        //                let data = try Data(contentsOf: url!)
        //                //                let webView = WKWebView(frame: CGRect(x:20,y:20,width:view.frame.size.width-40, height:view.frame.size.height-40))
        //                self.webView.load(data, mimeType: "application/vnd.ms-powerpoint", characterEncodingName:"", baseURL: (url?.deletingLastPathComponent())!)
        //
        ////                [webView loadData:requestData MIMEType:@"application/msword" textEncodingName:@"UTF-8" baseURL:[NSURL URLWithString:@"http://localhost/"]];
        //
        //                //                view.addSubview(webView)
        //            }
        //            catch {
        //                // catch errors here
        //            }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

