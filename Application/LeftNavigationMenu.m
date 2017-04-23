#import "LeftNavigationMenu.h"
#import "MainMenuSubViewViewController.h"
#import "CustomLeftNavigationTableViewCell.h"

@interface LeftNavigationMenu ()

@end

@implementation LeftNavigationMenu


@synthesize menuList;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.clearsSelectionOnViewWillAppear = NO;
    self.tableView.backgroundView = [[UIImageView alloc]
                                     initWithImage:[UIImage imageNamed:@"iphone_body_bg@2x.png"]];
    
//    [self.tableView registerClass:[CustomLeftNavigationTableViewCell class]
//           forCellReuseIdentifier:[CustomLeftNavigationTableViewCell cellIdentifier]];
    
    [self.tableView
     registerNib:[UINib nibWithNibName:@"CustomLeftNavigationTableViewCell"
                                bundle:[NSBundle mainBundle]]
     forCellReuseIdentifier:[CustomLeftNavigationTableViewCell cellIdentifier]];
    
    menuList = @[@"Drinks", @"Desserts", @"Starter", @"Chinese", @"French", @"Fast Food", @"Salad"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return menuList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomLeftNavigationTableViewCell *cell = (CustomLeftNavigationTableViewCell*)
    [tableView dequeueReusableCellWithIdentifier:[CustomLeftNavigationTableViewCell cellIdentifier] forIndexPath:indexPath];
     
    if(cell == nil){
        
        NSArray *nib = [[NSBundle mainBundle]
                        loadNibNamed:@"CustomLeftNavigationTableViewCell"
                        owner:self
                        options:nil];
        cell = [nib lastObject];
        
//        cell = [[UITableViewCell alloc]
//                initWithStyle:UITableViewCellStyleDefault
//                reuseIdentifier:@"MenuItem"];
        
    }

    cell.categoryName.text = [menuList objectAtIndex:indexPath.row];
    cell.categoryImage.image = [UIImage imageNamed:@"btn_done_normal@2x.png"];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
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


 #pragma mark - Table view delegate
 
 // In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     [self.delegate cellClicked:menuList[indexPath.row]];
 }
 

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
