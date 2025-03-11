//import three;
import graph3;
//import solids;

size(15cm, 15cm);

triple center = (0,0,0);
pair circleCenter = (1, 1.5);
triple circleCenter3 = (circleCenter.x, circleCenter.y, 1);
real radius = 0.5;

draw(unithemisphere, surfacepen=green+opacity(0.4));
draw(shift(-2.75, -2.75, 1)*scale(5.5, 5.5, 5.5)*unitplane, surfacepen=opacity(0.2));

pen coordinatePen = blue+dashed;
draw(-2X--2.5X, L=Label("$x$", position=EndPoint), arrow=Arrow3(), coordinatePen, align=N);
draw(-2Y--2.5Y, L=Label("$y$", position=EndPoint), arrow=Arrow3(), coordinatePen, align=N);
draw(-1Z--1.75Z, L=Label("$z$", position=EndPoint), arrow=Arrow3(), coordinatePen, align=E);

draw(shift(circleCenter3)*scale(radius, radius, 1)*unitdisk, surfacepen=opacity(0.3));
label("$K$", circleCenter3);

triple circlePreimage(real t) {
    real a = circleCenter.x; real b = circleCenter.y; real r = radius;
    real xp = a + r * cos(t);
    real yp = b + r * sin(t);
    real denom = sqrt(xp^2 + yp^2 + 1);
    real xs = xp / denom;
    real ys = yp / denom;
    real zs = 1 / denom;
    return (xs, ys, zs);
}

// https://grok.com/share/bGVnYWN5_f112fa38-7e6f-4ed6-9704-86c41f9d7ae5
surface cap = surface(
    new triple(pair p) {
        // u: radial parameter (0 to 1), v: angular parameter (0 to 2pi)
        real u = p.x; real v = p.y;
        triple boundary = circlePreimage(v);
        real t = u; // Interpolate from center to boundary
        real x = (1-t) * center.x + t * boundary.x;
        real y = (1-t) * center.y + t * boundary.y;
        real z = (1-t) * center.z + t * boundary.z;
        // Project back to sphere
        real mag = sqrt(x^2 + y^2 + z^2);
        return mag == 0 ? (0, 0, 0) :  (x/mag, y/mag, z/mag); // FIXME
    },
    (0, 0), (1, 2pi), 100, 100, graph3.Spline
);
//path3 preimage = graph(cap, 0, 2pi);
draw(cap, opacity(0.2));

//dot(center);
