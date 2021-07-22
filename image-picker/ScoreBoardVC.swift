//
//  ScoreBoardVC.swift
//  image-picker
//
//  Created by Sandhya Baghel on 06/07/21.
//  Copyright © 2021 Sandhya. All rights reserved.
//

import Foundation

import UIKit

class ScoreBoardVC: UIViewController {
    let token = UserDefaults.standard.string(forKey: "UserToken")
    let name = UserDefaults.standard.string(forKey: "Name")
    let score = UserDefaults.standard.string(forKey: "Score")
    
    private let MyImageView: UIImageView = {
        
        let myImageView = UIImageView()
        myImageView.contentMode = .scaleAspectFill
        myImageView.clipsToBounds = true
        myImageView.image = UIImage(named: "leaderboard")
        
        return myImageView
        
    }()
    
    private let LeaderBoard : UILabel = {
       let label = UILabel()
        label.text = "LeaderBoard"
        label.textColor = .brown
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
  
    
    
    private let Name : UILabel = {
       let label = UILabel()
        label.text = "Name"
        label.textColor = .brown
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    private let Score : UILabel = {
       let label = UILabel()
        label.text = "Score"
        label.textColor = .brown
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private let Nametxt : UILabel = {
       let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    private let Scoretxt : UILabel = {
       let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        Nametxt.text = name
        Scoretxt.text = score
        view.addSubview(MyImageView)
        view.addSubview(LeaderBoard)
        view.addSubview(Name)
        view.addSubview(Score)
        view.addSubview(Nametxt)
        view.addSubview(Scoretxt)

        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        MyImageView.frame = CGRect(x: 100, y: view.safeAreaInsets.top + 10, width: view.width/2, height: 150)
        LeaderBoard.frame = CGRect(x: 120, y: MyImageView.bottom + 5, width: view.width, height: 50)
        Name.frame = CGRect(x: 20, y: LeaderBoard.bottom + 20, width: 150, height: 50)
        Score.frame = CGRect(x: 260, y: LeaderBoard.bottom + 20, width: 90, height: 50)
        Nametxt.frame = CGRect(x: 20, y: Name.bottom + 20, width: 150, height: 50)
        Scoretxt.frame = CGRect(x: 260, y: Score.bottom + 20, width: 90, height: 50)
        
    }
    

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
