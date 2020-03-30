#pragma once
#include "Singleton.h"
class SingletonInstance: public Singleton<SingletonInstance>{
public:
    void info();

private:
    SingletonInstance() = default;
    ~SingletonInstance() override = default;
    friend Singleton<SingletonInstance>;
};