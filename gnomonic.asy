import three;

size(15cm, 15cm);

pen coordinatePen = blue+dashed;
draw(-2X--2.5X, L=Label("$x$", position=EndPoint), arrow=Arrow3(), coordinatePen, align=N);
draw(-2Y--2.5Y, L=Label("$y$", position=EndPoint), arrow=Arrow3(), coordinatePen, align=N);
draw(-1.5Z--1.5Z, L=Label("$z$", position=EndPoint), arrow=Arrow3(), coordinatePen, align=E);

triple center = (0,0,0);
triple pointOnPlane = (0.85, 1.5, -1);

//triple line(real t) {
//    return center + t * (pointOnPlane - A);
//}

path3 projectionLine = center - pointOnPlane -- pointOnPlane;
real[] t = intersect(projectionLine, unithemisphere);
triple pointOnSphere = point(projectionLine, t[0]);

draw(shift(-2, -2, -1)*scale(4,4,4)*unitplane, surfacepen=white+opacity(0.5));
draw(pointOnSphere -- pointOnPlane, red);
draw(unithemisphere, surfacepen=green+opacity(0.4));
dot(pointOnSphere, L=Label("$p$"));
dot(pointOnPlane, L=Label("$q$"));
dot(center);