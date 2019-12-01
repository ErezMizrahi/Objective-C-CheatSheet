//
//  TableViewController.m
//  ObjCheatSheet
//
//  Created by Erez Mizrahi on 01/12/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

#import "TableViewController.h"
#import "Movie.h"

@interface TableViewController ()

@property (strong,nonatomic) NSMutableArray<Movie*> *movies;

@end

@implementation TableViewController

NSString *cellId = @"reuseIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"TableView";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    [self fetchMovies];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:cellId];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}

-(void)fetchMovies {
    NSString *urlString = @"https://api.themoviedb.org/3/movie/popular?api_key=?????&language=en-US&page=1";
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *err;
       NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&err];
        if (err) {
            NSLog(@"faild to make json %@" , err);
            return;
        }
        NSMutableArray<Movie*> *movieArr = NSMutableArray.new;
        for (NSDictionary *dict in json[@"results"]) {
            
//            for (NSDictionary *dictResults in results) {
//                NSLog(dictResults);
//
                NSString *title = dict[@"title"];
            NSString *baseImageURL = [@"https://image.tmdb.org/t/p/w500/" stringByAppendingFormat:@"%@", dict[@"poster_path"]];
            NSURL *imageURL = [NSURL URLWithString:baseImageURL];
            
            
        
            NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
            
            UIImage *poster = [UIImage imageWithData:imageData];
            
            
                Movie *movie = Movie.new;
                movie.title = title;
            movie.image = poster;
                [movieArr addObject:movie];
//            }

        };
        
        self.movies = movieArr;
        
        dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
        });
    }]resume] ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    Movie *movie = self.movies[indexPath.row];
    cell.textLabel.text = movie.title;
    cell.imageView.image = movie.image;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
