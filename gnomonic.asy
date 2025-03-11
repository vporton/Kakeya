settings.outformat = "pdf";
settings.prc = false;
settings.render = 0;

import three;

size(5cm,5cm);

draw(O--2X, L=Label("$x$", position=EndPoint), arrow=Arrow3());
draw(O--2Y, L=Label("$y$", position=EndPoint), arrow=Arrow3());
draw(O--2Z, L=Label("$z$", position=EndPoint), arrow=Arrow3());

draw(unitplane);