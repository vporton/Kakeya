settings.outformat = "pdf";
settings.prc = false;
settings.render = 0;

import three;

size(5cm,5cm);

draw(-2X--2X, L=Label("$x$", position=EndPoint), arrow=Arrow3());
draw(-2Y--2Y, L=Label("$y$", position=EndPoint), arrow=Arrow3());
draw(-2Z--2Z, L=Label("$z$", position=EndPoint), arrow=Arrow3());

draw(shift(-1.5, -1.5, 0)*scale(3,3,3)*unitplane, surfacepen=white);

path3 projectionLine = (0,0,1) -- (1.5,1.5,0);
real[] pointOnSphere = intersect(projectionLine, unithemisphere);

draw(projectionLine);
draw(unithemisphere, surfacepen=green+opacity(0.2));
dot((pointOnSphere[0], pointOnSphere[1], pointOnSphere[2]));
