#include <math.h>
#include "Screw.h"

Screw::Screw()
{
    
}

Screw::Screw(Eigen::Vector3d w, Eigen::Vector3d v)
{
    w_ = w;
    v_ = v;
}

Screw::~Screw()
{

}

Eigen::Matrix3d Screw::vector2SkewMatrix(Eigen::Vector3d v)
{
    Eigen::Matrix3d m;
    m(0,0) = 0;     m(0,1) = -v(3); m(0,2)=v(2);
    m(1,0) = v(3);  m(1,1) = 0;     m(1,2) = -v(1);
    m(2,0) = -v(2); m(2,1) = v(1);  m(2,2) = 0;

    return m;
}

Eigen::Matrix3d Screw::RotAxis(Eigen::Vector3d axis, double theta)
{
    Eigen::Matrix3d skew = vector2SkewMatrix(axis);
    Eigen::Matrix3d rot = Eigen::Matrix3d::Identity(3,3) + sin(theta)*skew + (1-cos(theta))*skew*skew;
    return rot;
}

Eigen::MatrixXd Screw::AdjointT(Eigen::MatrixX3d rot, Eigen::Vector3d p)
{
    Eigen::MatrixXd ad(6,6);
    ad.topLeftCorner(3,3) = rot; 
    ad.topRightCorner(3,3) = Eigen::Matrix3d::Zero();
    ad.bottomLeftCorner(3,3) = vector2SkewMatrix(p) * rot;
    ad.bottomRightCorner(3,3) = rot;
    
    return ad;
}