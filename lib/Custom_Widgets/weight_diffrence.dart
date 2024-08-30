String diffrence(double x, double y) {
  double z = 0.0;
  if (x == 0.0 || y == 0.0) {
    return " ";
  }
  if (x < y) {
    z = y - x;
    z = (z * 10).round() / 10;
    return "You have to Gain $z KG for Standard Body Weight ";
  } else if (x > y) {
    z = x - y;
    z = (z * 10).round() / 10;
    return "You have to loss $z KG for Standard Body Weight";
  } else {
    return "You have the Perfect Body Weight Standard";
  }
}
