//
//  ViewController.swift
//  BGMsample
//
//  Created by 星みちる on 2019/08/19.
//  Copyright © 2019 星みちる. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate{
    
    @IBOutlet weak var button: UIButton!
    
    
    //1.カセットデッキ的なやつ
    var player:AVAudioPlayer!
    
 
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        //2.再生する音楽ファイルのパス作成
        let audioPath = Bundle.main.path(forResource: "bgm", ofType: "mp3")!
        
        //URLも作っとく
        let audioUrl = URL(fileURLWithPath: audioPath)
        
        //3.音楽ファイルを元に、プレイヤー作成
        
        do {
        player = try AVAudioPlayer(contentsOf: audioUrl)
        }catch let error {
            print(error.localizedDescription)
            
        }
        
        //4.再生
        player.delegate = self //おまじない
        player.prepareToPlay() //再生の準備
        player.play()          //再生
        
        
        //ラストまで流れ終わったら終わり。
        //ループにしたかったら自分でコード書く
    }
    
  
    @IBAction func button(_ sender: UIButton) {
       
        if player.isPlaying {
            
            player.pause()
            button.setTitle("Off", for: .normal)
            
        }else {
            player.play()
            button.setTitle("On", for: .normal)
        }
    }


}

// 停止　　player.stop()
// 一時停止　player.pause()

//無限ループ
//player.numberOfLoops = -1
