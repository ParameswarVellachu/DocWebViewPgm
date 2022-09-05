//
//  ViewController.swift
//  DocWebViewPgm
//
//  Created by Veera Reddy on 8/18/18.
//  Copyright © 2018 Parameswaran. All rights reserved.

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
        if let pdfURL = Bundle.main.url(forResource: "Swift", withExtension: "pdf", subdirectory: nil, localization: nil)  {
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
//            let url = URL(string: "http://192.168.1.218:9093/FileUploads/ContentFiles/2018-18-6--02-49-16_Environmental%20Science.doc") //DOC
//            let url = URL(string: "http://192.168.1.218:9093/FileUploads/ContentFiles/2018-18-6--02-51-07_3m-MAGNETIC-EFFECTS-OF-CURRENT-MAGNETISM.pdf") //PDF
//            let url = URL(string: "http://192.168.1.218:9093/FileUploads/ContentFiles/2018-18-6--02-51-08_5%20Must-Do%E2%80%99s%20for%20Employee%20Onboarding.mp3") //Audio

//            let url = URL(string: "http://192.168.1.218:9093/FileUploads/ContentFiles/2018-18-6--02-49-16_New%20Invention%20MATRIX%20-%20The%20Internet%20of%20Things%20for%20Everyone%E2%84%A2.mp4") //Video
            
            
//            let url = URL(string: "http://192.168.1.218:9093/FileUploads/ContentFiles/2018-19-6--06-02-30_Raghav%20testing.ods") //ODs

            
            let url = URL(string: "https://scholar.harvard.edu/files/torman_personal/files/samplepptx.pptx") //PPT
            
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

