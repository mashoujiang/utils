#pragma once

#include "NonCopyable.h"

template <typename T>
class Singleton : public NonCopyable {
public:
    static T* instance()
    {
        static T obj;
        return &obj;
    }

protected:
    Singleton() = default;
    virtual ~Singleton() = default;
};