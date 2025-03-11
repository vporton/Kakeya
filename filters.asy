import three;

size(15cm, 15cm);

pen coordinatePen = blue+dashed;
draw(-2X--2.5X, L=Label("$x$", position=EndPoint), arrow=Arrow3(), coordinatePen, align=N);
draw(-2Y--2.5Y, L=Label("$y$", position=EndPoint), arrow=Arrow3(), coordinatePen, align=N);
draw(-1Z--1.75Z, L=Label("$z$", position=EndPoint), arrow=Arrow3(), coordinatePen, align=E);

triple center = (0,0,0);
triple pointOnPlane = (0.5, 2.5, 1);

path3 projectionLine = center - pointOnPlane -- pointOnPlane;
real[] t = intersect(projectionLine, unithemisphere);
triple pointOnSphere = point(projectionLine, t[0]);

draw(unithemisphere, surfacepen=green+opacity(0.4));
dot(pointOnSphere, L=Label("$p$"));
dot(center);

path3 direction = (-1, -1.5, 0) -- (1, 1.5, 0);
draw(direction);