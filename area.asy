//import three;
import graph3;
//import solids;

size(15cm, 15cm);

triple center = (0,0,0);
pair circleCenter = (0.1, 1.5);
triple circleCenter3 = (circleCenter.x, circleCenter.y, 1);
real radius = 0.5;

triple kPreimage(pair p) {
    real r = p.x; real t = p.y;
    real a = circleCenter.x; real b = circleCenter.y;
    real xp = a + r * cos(t);
    real yp = b + r * sin(t);
    real denom = sqrt(xp^2 + yp^2 + 1);
    real xs = xp / denom;
    real ys = yp / denom;
    real zs = 1 / denom;
    return (xs, ys, zs);
}

triple circlePreimage(real t) {
    return kPreimage((radius, t));
}

draw(unithemisphere, surfacepen=green+opacity(0.4));
draw(shift(-2.75, -2.75, 1)*scale(5.5, 5.5, 5.5)*unitplane, surfacepen=opacity(0.2));

pen coordinatePen = blue+dashed;
draw(-2X--2.5X, L=Label("$x$", position=EndPoint), arrow=Arrow3(), coordinatePen, align=N);
draw(-2Y--2.5Y, L=Label("$y$", position=EndPoint), arrow=Arrow3(), coordinatePen, align=N);
draw(-1Z--1.75Z, L=Label("$z$", position=EndPoint), arrow=Arrow3(), coordinatePen, align=E);

draw(shift(circleCenter3)*scale(radius, radius, 1)*unitdisk, surfacepen=opacity(0.3));
label("$K$", circleCenter3);

path3 preimage = graph(circlePreimage, 0, 2pi);
draw(preimage);
label("$K'$", kPreimage((0, 0)));

dot(center);
