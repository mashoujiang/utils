#include "../include/Singleton.h"
#include <iostream>

class SingletonInstance : public Singleton<SingletonInstance> {
public:
    ~SingletonInstance() noexcept override = default;

    void info()
    {
        std::cout << "SingletonInstance info.\n";
    }

private:
    SingletonInstance() = default;
    friend Singleton<SingletonInstance>;
};

int main()
{
    SingletonInstance::instance()->info();

    return 0;
}