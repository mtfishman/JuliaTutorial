#include <iostream>

double estimate_pi(int n) {
  double s = 1.0;
  double si;
  for(int i = 1; i < n; i++) {
    if(i % 2 == 1) {
      si = -1.0 / (2.0 * i + 1.0);
    }
    else {
      si = 1.0 / (2.0 * i + 1.0);
    }
    s += si;
  }
  return 4 * s;
}

int main()
{
  auto s = estimate_pi(100000000);
  //std::cout << s << std::endl;
  return 0;
}