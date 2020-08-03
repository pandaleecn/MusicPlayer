//
//  ViewController.swift
//  MusicPlayer
//
//  Created by lidapeng on 2020/7/28.
//  Copyright © 2020 lidapeng. All rights reserved.
//

import UIKit
import Alamofire
import RxAlamofire
import RxCocoa
import RxSwift
import HandyJSON

class ViewController: UIViewController {

    let disposeBag =  DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //创建URL对象
        let urlString = "http://192.168.3.34:8080/songs/1"
        let url = URL(string:urlString)!
        
        request(.get, url, parameters: nil, encoding: URLEncoding.default, headers: ["Authorization" : "Basic YWRtaW46cGFzc3dvcmQ="])
            .json()
        .subscribe(onNext: { (json) in
            
            print(json)
        }).disposed(by: disposeBag)

        /*
        requestData(.post, url)
            .subscribe(onNext: { (response, data) in
                print(response)
                print(data)
            }).disposed(by: disposeBag)

        requestJSON(.get, url)
            .subscribe(onNext: { (response, json) in
                print(json)
            }).disposed(by: disposeBag)

        requestString(.get, url)
            .subscribe(onNext: { (response, str) in
                print(response.allHeaderFields)
                print(str)
            }).disposed(by: disposeBag)
 */
        
    }


}

