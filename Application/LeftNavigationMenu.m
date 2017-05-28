#import "LeftNavigationMenu.h"
#import "MainMenuSubViewViewController.h"
#import "CustomLeftNavigationTableViewCell.h"

@interface LeftNavigationMenu ()

@end

@implementation LeftNavigationMenu


@synthesize menuList;
@synthesize sideMenuListImages;

@synthesize appetizersImages;
@synthesize chineseImages;
@synthesize dessertsImages;
@synthesize drinksImages;
@synthesize fastFoodImages;
@synthesize frenchImages;
@synthesize saladImages;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.clearsSelectionOnViewWillAppear = NO;
    self.tableView.backgroundView = [[UIImageView alloc]
                                     initWithImage:[UIImage imageNamed:@"iphone_body_bg@2x.png"]];
    
    [self.tableView
     registerNib:[UINib nibWithNibName:@"CustomLeftNavigationTableViewCell"
                                bundle:[NSBundle mainBundle]]
     forCellReuseIdentifier:[CustomLeftNavigationTableViewCell cellIdentifier]];
    
    menuList = @[@"Appetizers",
                 @"Chinese",
                 @"Desserts",
                 @"Drinks",
                 @"Fast Food",
                 @"French",
                 @"Salads"];
    
    sideMenuListImages = @[@"cheesy breadsticks.png",
                           @"chicken chowmein.png",
                           @"bakhlawa.png",
                           @"Black Mamba.png",
                           @"Shack-Burger-PNG-332x279.png",
                           @"french toasts.png",
                           @"Salad-With-Apple-And-Bleu-Cheese-PNG.png"];
    
    appetizersImages = @[@"cheesy breadsticks.png",
                         @"chicken nuggets.png",
                         @"Fortune_cookie.png",
                         @"fried onion rings.png",
                         @"fried shrimps.png",
                         @"fries and sausages.png"];
    
    chineseImages = @[@"chicken chowmein.png",
                      @"dumplings.png",
                      @"Hakka noodles.png",
                      @"Kungpaochicken",
                      @"prawn soup.png",
                      @"sushi rols.png"];
    
    dessertsImages = @[@"bakhlawa.png",
                       @"lemon tart.png",
                       @"mini_lava_cake.png",
                       @"strawberry cheesecke.png",
                       @"sundae-529x1024.png",
                       @"waffle with ice cream.png"];
    
    drinksImages = @[@"Black Mamba.png",
                     @"Cocacola.png",
                     @"Drink-PNG-180x180.png",
                     @"Drink-PNG-8-180x180.png",
                     @"Lemonade 180x180.png",
                     @"Margarita.png"];
    
    fastFoodImages = @[@"bologna sandwich.png",
                       @"burger_sandwich_PNG4150.png",
                       @"fried_chicken_PNG14107.png",
                       @"pizza_PNG7135.png",
                       @"Shack-Burger-PNG-332x279.png",
                       @"Single Patty Beef Burger PNG-420x249.png"];
    
    frenchImages = @[@"alfredo pasta.png",
                     @"cassoulet.png",
                     @"confit de canard.png",
                     @"french toasts.png",
                     @"penne pasta.png",
                     @"quiche.png"];
    
    saladImages = @[@"Grilled-Chicken-Caesar-Salad-PNG.png",
                    @"Habit-Burger-Salad-PNG-319x279.png",
                    @"Salad-PNG-401x279.png",
                    @"Salad-With-Apple-And-Bleu-Cheese-PNG.png",
                    @"Taco-Salad-Tortilla-Bowl-PNG-289x279.png",
                    @"Tuna-Salad-PNG-409x279.png"];
    
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
    cell.categoryImage.image = [UIImage imageNamed:[sideMenuListImages objectAtIndex:indexPath.row]];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
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
     NSString *menuSelection = menuList[indexPath.row];
     NSArray *menuImages;
     
     if ([menuSelection isEqualToString:@"Appetizers"]) {
         menuImages = appetizersImages;
     }
     
     else if ([menuSelection isEqualToString:@"Chinese"]) {
         menuImages = chineseImages;
     }
     
     else if ([menuSelection isEqualToString:@"Desserts"]) {
         menuImages = dessertsImages;
     }
     
     else if ([menuSelection isEqualToString:@"Drinks"]) {
         menuImages = drinksImages;
     }
     
     else if ([menuSelection isEqualToString:@"Fast Food"]) {
         menuImages = fastFoodImages;
     }
     
     else if ([menuSelection isEqualToString:@"French"]) {
         menuImages = frenchImages;
     }
     
     else if ([menuSelection isEqualToString:@"Salads"]) {
         menuImages = saladImages;
     }
     
     else {
         return;
     }
     
     [self.delegate cellClicked:menuSelection withImages:menuImages];
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
