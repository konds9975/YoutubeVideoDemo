//
//  ViewController.swift
//  YoutubeVideoDemo
//
//  Created by Kondiram Sonawane on 3/5/18.
//  Copyright © 2018 Kondiram Sonawane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {



    @IBOutlet weak var ytview: YouTubePlayerView!
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        loadViewYT()
        loadVideoWebView()
       
    }
    func loadViewYT()  {
        
        ytview.playerVars = [
            "playsinline": "1" as AnyObject,
            "controls": "1" as AnyObject,
            "showinfo": "0" as AnyObject
        ]
        
        
        
        //load Single Video
        //ytview.loadVideoID("SfcpAV-8qtU")
        
        //Load Playlist 
        ytview.loadPlaylistID("RDMMzZ2i_sb4xOg")
        
    }
    
    @IBAction func playBtn(_ sender: Any) {
        
        if ytview.ready {
            if ytview.playerState != YouTubePlayerState.Playing {
                ytview.play()
                (sender as! UIButton).setTitle("Pause", for: .normal)
            } else {
                ytview.pause()
                (sender as! UIButton).setTitle("Play", for: .normal)
            }
        }
        
    }
    
    @IBAction func prev(sender: UIButton) {
        ytview.previousVideo()
    }
    
    @IBAction func next(sender: UIButton) {
        ytview.nextVideo()
    }

    
    func loadVideoWebView()  {
        
        webView.allowsInlineMediaPlayback = true
        webView.mediaPlaybackRequiresUserAction = false
        let videoID = "SfcpAV-8qtU"
        
        // Set up your HTML.  The key URL parameters here are playsinline=1 and autoplay=1
        // Replace the height and width of the player here to match your UIWebView's  frame rect
        
        
        
        let embededHTML = "<html><body style='margin:0px;padding:0px;'><script type='text/javascript' src='http://www.youtube.com/iframe_api'></script><script type='text/javascript'>function onYouTubeIframeAPIReady(){ytplayer=new YT.Player('playerId',{events:{onReady:onPlayerReady}})}function onPlayerReady(a){a.target.playVideo();}</script><iframe id='playerId' type='text/html' width='\(self.webView.frame.size.width+50)' height='\(self.webView.frame.size.height)' src='http://www.youtube.com/embed/\(videoID)?enablejsapi=1&rel=0&controls=1&showinfo=0&playsinline=1&autoplay=0' frameborder='0'></body></html>"
        
        
        webView.loadHTMLString(embededHTML, baseURL: Bundle.main.bundleURL)
    }
    
    
   

}

