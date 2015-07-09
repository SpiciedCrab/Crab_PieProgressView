# Crab_PieProgressView
PieProgress View
Preparation for your pie:
call public api:
    [self.pieProgress setAnimationDuration:1.0];
    [self.pieProgress setPieColor:[UIColor brownColor]];

then to set grade to animate the pie:
     [self.pieProgress setProgress:0.8 animated:YES];

and the method without animation for grade is also accepted.

More to learn for beginner:
CADisplayLink is used in the solution to draw the pie:

http://www.tuicool.com/articles/meMVR3

It will follow the refreshing of the screen with 60hz/s.
So it means to call the selector 60 times in 1 second.

Then the following article tells you how to draw the circle using BeizierPath in CALayer:
http://blog.csdn.net/lgm252008/article/details/34819743
