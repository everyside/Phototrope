//
//  CVWrapper.m
//  CVOpenTemplate
//
//  Created by Washe on 02/01/2013.
//  Copyright (c) 2013 foundry. All rights reserved.
//

#include <AppKit/AppKit.h>
#import "CVWrapper.h"
#import "CV.hpp"
#include <vector>
#include "opencv2/stitching/stitcher.hpp"


@implementation CVWrapper

+ (NSImage*) processImageWithOpenCV: (NSImage*) inputImage
{
    std::vector<int> loc;
    cv::Mat img;
    detectBlob(img, loc);
    return inputImage;
}


@end