//
//  SBDCollectionViewController.m
//  StoryBoardDemo
//
//  Created by wwwins on 2014/1/20.
//  Copyright (c) 2014年 wwwins. All rights reserved.
//

#import "SBDCollectionViewController.h"

@interface SBDCollectionViewController ()

@property NSArray *arrSectionData;
@property NSMutableArray *arrDataSource;
@property NSMutableArray *arrDataSource1;
@property NSMutableArray *arrDataSource2;

@end

@implementation SBDCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
  [self createCollectionView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CollectionView
- (void)createCollectionView
{
  [self initDataSource];
}

- (void)initDataSource
{
  _arrDataSource1 = [[NSMutableArray alloc] init];
  for (int i=0; i<30; i++) {
    [_arrDataSource1 addObject:[NSString stringWithFormat:@"[1].%d", i]];
  }

  _arrDataSource2 = [[NSMutableArray alloc] init];
  for (int i=0; i<50; i++) {
    [_arrDataSource2 addObject:[NSString stringWithFormat:@"[2].%d", i]];
  }

  _arrDataSource = [[NSMutableArray alloc] initWithObjects:_arrDataSource1,_arrDataSource2, nil];
  _arrSectionData = [[NSMutableArray alloc] initWithObjects:@"section-1",@"section-2", nil];

}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
  return [_arrSectionData count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  return [[_arrDataSource objectAtIndex:section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];

  cell.backgroundColor = [[UIColor alloc] initWithHue:arc4random()%256/256.0 saturation:(arc4random()%128/256.0)+0.5 brightness:(arc4random()%128/256.0)+0.5 alpha:1.0];
  // load image
  //UIImageView *uiimageview = (UIImageView *)[cell viewWithTag:100];
  //[uiimageview setImage:[UIImage imageNamed:@"std-color.png"]];

  //UILabel *uilabel = (UILabel *)[cell viewWithTag:101];
  //uilabel.text = [[_arrDataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
  //uilabel.text = [NSString stringWithFormat:@"%@(%d)",node.title,node.qty];

  return cell;
}

// set cell size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
  return CGSizeMake(CELL_WIDTH,CELL_HEIGHT);
}

// set header size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
  return CGSizeMake(HEADER_SIZE, HEADER_SIZE);
}

// did select
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
  NSString *output = [[_arrDataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
  NSLog(@"output=%@",output);
}

// deselect
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{

}


@end
