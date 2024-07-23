#include <iostream>
#include <iomanip>
#include <algorithm>

using namespace std;

class DbConnection {
    public:
        DbConnection() { }
        DbConnection(const DbConnection& other) { }
    /* ... complicated implementation details ... */
};

class Foo {
    public:
        Foo();
        Foo(const Foo& fool);      // BIG 4.5: Copy ctor
        Foo& operator=(Foo other); // BIG 4.5: Assignment operator, but arg is copied by VALUE
        Foo(Foo&& other) noexcept; // BIG 4.5: Move ctor
        ~Foo();                    // BIG 4.5: dtor
        friend void swap(Foo& a, Foo& b) { using std::swap; swap(a.connection, b.connection); } // BIG 4.5: Swap() is the .5
    private:
        DbConnection* connection;
};

Foo::Foo() : connection(new DbConnection()) {
    cout << "Default constructor called for Foo; connection is at " << connection << "\n";
}

Foo::Foo(const Foo& fool) : connection(new DbConnection(*fool.connection)) {
    cout << "Copy constructor called for Foo; connection is at " << connection << "\n";
}

Foo::~Foo() {
    cout << "Destructor called for Foo, destroying connection at " << connection << "\n";
    delete connection;
    connection = nullptr;
}

// The assignment operator is copying by value. We do that because we are
// stealing from a temporary that will not be used again.
Foo& Foo::operator=(Foo other) {
    // Exchange connections with other, which is a temporary copy
    swap(other, *this);
    cout << "Assignment operator called for Foo, stealing connection at " << connection << "\n";
    //return *this;
}

// Called when we receive a temporary object that we *****KNOW***** will no
// longer be used after this call.
//
// It turns out it can be more efficient to just steal a temporary's stuff than
// to make a full-blown copy!
Foo::Foo(Foo&& other) noexcept : Foo() {
    swap(other, *this);
    cout << "Move constructor called for Foo, stealing connection at " << connection << "\n";
}

Foo bar() {
    return Foo();
}


int main() {
    cout <<"Hi\n";
    Foo g;
    Foo h;
    g = (h = bar());
    cout <<"Bye\n";
}


// static in function
    // I am only going to initalize this object once.
        // Make a variable inside a function kinda like a global variable. It
        // retains its variable from call to call, making to global.

// static in classes
    // No matter how many instances of the class you have, you only have one copy of the variable.
        // All the instances of the variable see the same value of the variable.

// Friends are kinda like external private member functions. They have the same
// access as private member functions do except to this->.