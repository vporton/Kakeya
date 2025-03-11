settings.outformat = "pdf";
settings.prc = false;
settings.render = 0;

import three;

size(5cm,5cm);

pen coordinatePen = dashed;
draw(-2X--2.5X, L=Label("$x$", position=EndPoint), arrow=Arrow3(), coordinatePen);
draw(-2Y--2.5Y, L=Label("$y$", position=EndPoint), arrow=Arrow3(), coordinatePen);
draw(-2Z--2Z, L=Label("$z$", position=EndPoint), arrow=Arrow3(), coordinatePen);

draw(shift(-2, -2, 0)*scale(4,4,4)*unitplane, surfacepen=white+opacity(0.5));

triple pointOnPlane = (0.85,1.5,0);
path3 projectionLine = (0,0,1) -- pointOnPlane;
real[] t = intersect(projectionLine, unithemisphere);
triple pointOnSphere = point(projectionLine, t[0]);

draw(projectionLine);
draw(unithemisphere, surfacepen=green+opacity(0.2));
dot(pointOnSphere);
dot(pointOnPlane);
