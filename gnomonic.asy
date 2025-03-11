settings.outformat = "pdf";
settings.prc = false;
settings.render = 0;

import three;

size(5cm,5cm);

draw(-2X--2X, L=Label("$x$", position=EndPoint), arrow=Arrow3());
draw(-2Y--2Y, L=Label("$y$", position=EndPoint), arrow=Arrow3());
draw(-2Z--2Z, L=Label("$z$", position=EndPoint), arrow=Arrow3());

draw(shift(-1.5, -1.5, 0)*scale(3,3,3)*unitplane, surfacepen=white);

draw(unithemisphere, surfacepen=white);