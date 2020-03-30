#include "SingletonInstance.h"
#include <iostream>

void SingletonInstance::info() {
    std::cout << __FILE__ << ":" << __FUNCTION__ << ":" << __LINE__ << std::endl;
}