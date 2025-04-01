import three;
import graph3;

size(15cm, 15cm);

triple center = (0,0,0);
triple pointOnPlane = (0.5, 2.5, 1);

draw(unithemisphere, surfacepen=green+opacity(0.4));
draw(shift(-2.5, -2.5, 1.25)*scale(5, 5, 5)*unitplane, surfacepen=opacity(0.2));

pen coordinatePen = blue+dashed;
draw(-2X--2.5X, L=Label("$x$", position=EndPoint), arrow=Arrow3(), coordinatePen, align=N);
draw(-2Y--2.5Y, L=Label("$y$", position=EndPoint), arrow=Arrow3(), coordinatePen, align=N);
draw(-1Z--1.5Z, L=Label("$z$", position=EndPoint), arrow=Arrow3(), coordinatePen, align=E);
dot(center);

pair directionStart = (-2, -2);
pair directionEnd = (0, 1.5);
triple directionStart3 = (directionStart.x, directionStart.y, 1);
triple directionEnd3 = (directionEnd.x, directionEnd.y, 1);
//path3 direction = directionStart -- directionEnd;
//draw(direction);

// From https://grok.com/share/bGVnYWN5_23547bd8-91e3-482d-be8f-655585a46063
real r1 = sqrt(dot(directionStart, directionStart) + 1);        
triple S1 = (directionStart.x, directionStart.y, 1)/r1;
triple S2 = (directionEnd.x, directionEnd.y, 1)/r1;
triple u2 = S2 - dot(S1, S2)*S1;
triple V2d = u2/sqrt(dot(u2, u2));

triple circleCurve(real t) {
    return cos(t)*S1 + sin(t)*V2d;
}

triple circleCurveBig(real t) {
    return circleCurve(t)*1.2;
}

real start = -0.25;
real end = 0.25;
triple curveStart = circleCurve(start);
path3 circleFragment = graph(circleCurveBig, start, end);
path3 sector_path = (0, 0, 0) -- circleFragment -- cycle;
draw(surface(sector_path), emissive(lightblue));
path3 circleFragment2 = graph(circleCurveBig, start+pi, end+pi);
path3 sector_path2 = (0, 0, 0) -- circleFragment2 -- cycle;
draw(surface(sector_path2), emissive(lightblue));

draw(graph(circleCurve, start, end), red);
label("$v$", circleCurve(0), N, red);
label("$h_v$", circleCurve(0)/2, black);

path3 circle = graph(circleCurve, 0, 2pi);
draw(circle);

dot((0, 0, 1));