#include <iostream>

struct Vec  {
  double x,y,z;
  Vec(double a=0.0, double b=0.0, double c=0.0){x=a; y=b; z=c;}

  Vec operator + (Vec const & obj)  {
    Vec res;
    res.x = obj.x + x; res.y = obj.y + y; res.z = obj.z + z;
    return(res);
  }

  double operator * (Vec const & obj)  {
    return(x*obj.x+y*obj.y+z*obj.z);
  }

  void print() {std::cout << "( "<< x << "\t" << y << "\t" << z << " )"<< std::endl;}

  ~Vec(){};
};

int main(int argc, char const *argv[]) {
  std::cout << "Originales: \n";
  Vec v1(1.0,2.0,3.0), v2(4.0,5.0,6.0);
  v1.print();
  v2.print();

  std::cout << "\nSuma:\n";
  Vec v3 = v1+v2;
  v3.print();

  std::cout << "\nProducto punto:\n";
  std::cout << v1*v2 << "\n";
  return 0;
}
;
