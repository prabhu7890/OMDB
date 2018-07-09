//
//  OMDBMovieListViewController.swift
//  OMDBProject
//
//  Created by Prabhu Beeman on 08/07/2018.
//  Copyright © 2018 The Movie Company. All rights reserved.
//

import UIKit

class OMDBMovieListViewController: UIViewController {

    var viewModel:OMDBMovieListViewModel!
    let kOMDBMovieListCollectionViewCell:String = "OMDBMovieListCollectionViewCell"
    let kMovieDetailSegue = "showMovieDetail"
    
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = OMDBMovieListViewModel()
        self.movieCollectionView.dataSource = self
        self.movieCollectionView.delegate = self
        
        self.viewModel.movieList.bind { [unowned self] movieList in
            print("loaded \(movieList)")
            DispatchQueue.main.async {
                self.movieCollectionView.reloadData()
            }
        }
        
        self.viewModel.selectedItem.bind { [unowned self] movie in
            print("Selected movie:\(String(describing: movie.name))")
            if(!movie.isEmpty) {
                print("Open it up")
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: self.kMovieDetailSegue, sender: nil)
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel.loadData(page: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? OMDBMovieDetailViewController {
            let movie = self.viewModel.selectedMovie
            vc.viewModel = OMDBMovieDetailViewModel(movie: movie)
            print("Movie:\(movie)")
                //vc.imageUrl = photo.image_url
        }
    }
    

}


extension OMDBMovieListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.numberOfMovies()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movieCell =  collectionView.dequeueReusableCell(withReuseIdentifier: kOMDBMovieListCollectionViewCell, for: indexPath) as! OMDBMovieListCollectionViewCell
        if let cellViewModel = self.viewModel.cellViewModel(row: indexPath.row) {
            movieCell.movienameLabel.text = cellViewModel.movieName!
        }
        return movieCell
    }
    
}

extension OMDBMovieListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.viewModel.didSelect(row: indexPath.row)
    }
}
