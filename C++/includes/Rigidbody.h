#ifndef RIGIBODY_H
#define RIGIBODY_H

#include "Screw.h"

class Rigidbody : public Screw
{
private:
    Eigen::Matrix3d ineria_;
    Eigen::Matrix3d pose_; //rotation matrix of posture
    Eigen::Vector3d trans_; //translation vector
    Eigen::MatrixXd jacobianBody_;
    Eigen::MatrixXd jacobianSpace_;
public:
    Rigidbody();
    ~Rigidbody();

    void ForwardKinematics();
    virtual void InverseKinematics();
    void jacobianSpace();
    void jacobianBody();
    void ForwardDynamics();
    void InverseDynamics();
};

#endif