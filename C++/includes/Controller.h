#ifndef CONTROLLER_H
#define CONTROLLER_H

#include "Rigidbody.h"

class Controller : public Rigidbody
{
private:
    double p_;
    double i_;
    double d_;

public:
    void pid_Tune(double p, double i, double d);
};

#endif