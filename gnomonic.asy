import three;

size(15cm, 15cm);

pen coordinatePen = blue+dashed;
draw(-2X--2.5X, L=Label("$x$", position=EndPoint), arrow=Arrow3(), coordinatePen, align=N);
draw(-2Y--2.5Y, L=Label("$y$", position=EndPoint), arrow=Arrow3(), coordinatePen, align=N);
draw(-1.5Z--1.5Z, L=Label("$z$", position=EndPoint), arrow=Arrow3(), coordinatePen, align=E);

draw(shift(-2, -2, 0)*scale(4,4,4)*unitplane, surfacepen=white+opacity(0.5));

triple northPole = (0,0,1);
triple pointOnPlane = (0.85,1.5,0);
path3 projectionLine = northPole -- pointOnPlane;
real[] t = intersect(projectionLine, unithemisphere);
triple pointOnSphere = point(projectionLine, t[0]);

draw(projectionLine, red);
draw(unithemisphere, surfacepen=green+opacity(0.4));
dot(pointOnSphere, L=Label("$p$"));
dot(pointOnPlane, L=Label("$q$"));
dot(northPole);