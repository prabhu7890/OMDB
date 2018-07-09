//
//  OMDBMovieDetailViewController.swift
//  OMDBProject
//
//  Created by Prabhu Beeman on 09/07/2018.
//  Copyright © 2018 The Movie Company. All rights reserved.
//

import UIKit

class OMDBMovieDetailViewController: UIViewController {
    
    var viewModel: OMDBMovieDetailViewModel!
    @IBOutlet weak var movieNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.movie.bind { [unowned self] movie in
            self.movieNameLabel.text = movie.name!
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
