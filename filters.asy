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

path3 circle = graph(circleCurve, 0, 2pi);
draw(circle);

real start = 0;
real end = 1;
triple curveStart = circleCurve(start);

triple straight(real t) {
    return circleCurve(start) - t*sin(start)*S1 + t*cos(start)*V2d;
}

draw(graph(circleCurve, start, end), red, arrow=Arrow3(), L=Label("$v$", position=EndPoint));
draw(graph(straight, start, end), blue, arrow=Arrow3(), L=Label("$h_v$", position=EndPoint));

dot(curveStart, L=Label("$v_a$", position=W), red);
dot((0, 0, 1));