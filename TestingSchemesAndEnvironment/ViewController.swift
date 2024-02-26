//
//  ViewController.swift
//  TestingSchemesAndEnvironment
//
//  Created by Shashwat Kashyap on 25/02/24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let value = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String {
            print(value)
        }
        
        printer()
    }
    
    func printer() {
#if DEV
        print("Running Dev")
#elseif PROD
        print("Running Prod")
#elseif QA
        print("Running QA")
#endif
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let vc = UIHostingController(rootView: ExampleView())
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}

struct ExampleView: View {
    var body: some View {
        VStack {
            Text("Hello world!")
                .font(.largeTitle)
                .foregroundColor(.green)
            
            Circle()
                .foregroundColor(.orange)
                .frame(minHeight: 300)
                .border(.blue)
                .overlay {
                    GeometryReader { proxy in
                        Text("I will always stay inside the circle I will always stay inside the circle I will always stay inside the circle I will always stay inside the circle I will always stay inside the circle")
                            .font(.largeTitle)
                            .frame(maxWidth: proxy.size.width, maxHeight: proxy.size.height)
                    }
                }
        }
    }
}
