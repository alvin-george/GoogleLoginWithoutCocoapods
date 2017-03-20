//
//  ViewController.swift
//  GooglePlusLogin
//
//  Created by Pushpam Group on 18/03/17.
//  Copyright © 2017 Pushpam Group. All rights reserved.
//

import UIKit
import GoogleSignIn


class ViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    
    @IBOutlet var signOutButton: UIButton!
    @IBOutlet var disconnectButton: UIButton!
    @IBOutlet var signInOnButton: GIDSignInButton!
    @IBOutlet var statusLabel: UILabel!
    
    var gid_signinSharedInstance = GIDSignIn.sharedInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gid_signinSharedInstance?.clientID = "599280904951-9usr5as4773rkimklle3o6a08q3tui4i.apps.googleusercontent.com"
        gid_signinSharedInstance?.delegate = self
        gid_signinSharedInstance?.uiDelegate = self
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    //GIDSignInUIDelegate Methods
    
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!){
        
        //UIActivityIndicatorView.stopAnimating()
        
    }
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!){
        
        self.present(viewController, animated: true, completion: nil)
        
    }
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    //GIDSignInDelegate Methods
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!){
        
        gid_signinSharedInstance?.scopes = ["https://www.googleapis.com/auth/plus.login","https://www.googleapis.com/auth/plus.me"]
        
        if ((gid_signinSharedInstance?.hasAuthInKeychain) != nil) {
            // Signed in
            signInOnButton.isHidden = true
            signOutButton.isHidden = false
            disconnectButton.isHidden = false
            statusLabel.text =  "logged In"
        } else {
            print("Not signed in")
            signInOnButton.isHidden = false
            signOutButton.isHidden = true
            disconnectButton.isHidden = true
            statusLabel.text = "Google Sign in\niOS Demo"
        }
        
        //        if user.profile.hasImage
        //        {
        //            let pic = user.profile.imageURL(withDimension: 100)
        //            print(pic)
        //        }
        
        
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!){
        print("logged out")
        
    }
    
    //UIButton Actions
    @IBAction func signOutButtonClicked(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
        statusLabel.text = "Signed out."
        
    }
    @IBAction func disconnectButtonClicked(_ sender: Any) {
        GIDSignIn.sharedInstance().disconnect()
        statusLabel.text = "Disconnecting."
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

