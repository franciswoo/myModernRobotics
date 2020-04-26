#ifndef SCREWAXIS_H
#define SCREWAXIS_H

#include <eigen3/Eigen/Eigen>
#include <vector>

class Screw
{
private:
    /* data */
    Eigen::Vector3d w_;
    Eigen::Vector3d v_;
public:
    Screw();
    Screw(Eigen::Vector3d w, Eigen::Vector3d v);
    ~Screw();
    Eigen::Matrix3d vector2SkewMatrix(Eigen::Vector3d v);
    Eigen::Matrix3d RotAxis(Eigen::Vector3d axis, double theta);
    Eigen::MatrixXd AdjointT(Eigen::MatrixX3d rot, Eigen::Vector3d p);
    Eigen::Matrix4d poE(Eigen::VectorXd spinor, double theta);
};

#endif