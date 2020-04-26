#include "../includes/Screw.h"

#include <iostream>

int main(int argc, char** argv)
{
    Screw screw1(Eigen::Vector3d(0,0,0), Eigen::Vector3d(0,0,0));
    std::cout<< "example  builded" << std::endl;

    return 0;
}