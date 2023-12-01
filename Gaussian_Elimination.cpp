#include <bits/stdc++.h>
using namespace std;

int main() {
  // Define the given data
  double t[] = {5, 8, 12};
  double v[] = {106.8, 177.2, 279.2};
  // Create the augmented matrix
  double M[3][3] = {{25, 5, 1}, {64, 8, 1}, {144, 12, 1}};
  double N[3] = {106.8, 177.2, 279.2};
  // Perform Naive Gauss Elimination
  for (int i = 0; i < 3; i++) {
    for (int j = i + 1; j < 3; j++) {
      double factor = M[j][i] / M[i][i];
      for (int k = 0; k < 3; k++) {
        M[j][k] -= factor * M[i][k];
      }
      N[j] -= factor * N[i];
    }
  }
  // Solve for the coefficients
  double x[3];
  for (int i = 2; i >= 0; i--) {
    x[i] = N[i];
    for (int j = i + 1; j < 3; j++) {
      x[i] -= M[i][j] * x[j];
    }
    x[i] /= M[i][i];
  }
  // Print the coefficients
  cout << "The Coefficients of the polynomial are:" << endl;
  cout << "a1: " << x[0] << endl;
  cout << "a2: " << x[1] << endl;
  cout << "a3: " << x[2] << endl;
  // Calculate the velocity at t=6 seconds
  double t_new = 6;
  double v_new = x[0] * t_new * t_new + x[1] * t_new + x[2];
  // Print the velocity at t=6 seconds
  cout << "The Velocity at t=6 seconds: " << v_new << endl;
  return 0;
}
