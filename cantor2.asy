import graph;

// Set up the canvas size
size(400, 400);

// Define initial parameters
real x0 = 0, x1 = 100;  // Initial endpoints
int levels = 6;         // Number of iterations (reduced for clarity)

real ternaryToBinary(string ternary) {
    string binary = "";
    real v = 0;
    for (int i = 0; i < length(ternary); ++i) {
        v *= 2;
        if (substr(ternary, i, 1) == '0') ;
        else if (substr(ternary, i, 1) == '2') v += 1;
    }
    return v / 2^(length(ternary));
}

// Function to draw Cantor set recursively
void drawCantor(real x, real y, real len, int depth, string ternary) {
    if (depth == 0) {
        draw((x, 0) -- (x + len, 0));
        real r = (ternaryToBinary(ternary));//;/(2^(length(ternary)+1));
        // draw((x, 0) -- (x0 + r * (3/2)^length(ternary), -100), red);
        real angle = r * pi;
        pair p = (cos(angle), sin(angle)) * (x1-x0) / 2;
        draw((x, 0) -- (x, 0) - p, red);
        dot((x,0), blue);
    } else {
        real third = len / 3;
        drawCantor(x, y, third, depth - 1, ternary + "0");
        drawCantor(x + 2 * third, y, third, depth - 1, ternary + "2");
    }
}

// Draw the Cantor set
drawCantor(x0, x1, x1-x0, levels, "");

// Add labels and legend
// label("Cantor Set (Ternary: 0,2)", (50,20), N);
// label("Mapped Set (Binary: 0,1)", (50,-30), N);
// label("Level " + string(levels), (50,10), N);
// dot((80,15),red); label("Cantor points", (85,15), E);
// dot((80,5),blue); label("Mapped points", (85,5), E);

// // Set viewing bounds
// xaxis(Bottom, LeftTicks);
// yaxis(Left, invisible);
// shipout(bbox(5mm, invisible));