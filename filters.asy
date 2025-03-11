import three;
import graph3;

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
dot(pointOnSphere, L=Label("$a$"));
dot(center);

pair directionStart = (-1, -1.5);
pair directionEnd = (1, 1.5);
triple directionStart3 = (directionStart.x, directionStart.y, 1);
triple directionEnd3 = (directionEnd.x, directionEnd.y, 1);
//path3 direction = directionStart -- directionEnd;
//draw(direction);

// From https://grok.com/share/bGVnYWN5_93e3734b-551b-4934-98a2-f15bd39938cc
real r1 = sqrt(dot(directionStart, directionStart) + 1);        
triple S1 = (directionStart.x, directionStart.y, 1)/r1;
triple S2 = (directionEnd.x, directionEnd.y, 1)/r1;
triple u2 = S2 - dot(S1, S2)*S1;
triple V2d = u2/sqrt(dot(u2, u2));

triple lineCurve(real t) {
    return directionStart3 + (directionEnd3 - directionStart3) * t;
}

triple circleCurve(real t) {
    return cos(t)*S1 + sin(t)*V2d;
}

path3 circle = graph(circleCurve, 0, 2pi);
draw(circle);
path3 line = graph(lineCurve, -1, 1.25);
draw(line);
