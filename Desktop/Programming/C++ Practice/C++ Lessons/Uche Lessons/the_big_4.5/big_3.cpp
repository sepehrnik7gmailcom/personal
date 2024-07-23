#include <iostream>

using namespace std;

class Dogs {
    public:
        Dogs();
        Dogs(const Dogs& other);             // BIG 3: Copies the data from other into *this.
        ~Dogs();                             // BIG 3: Destroys the object.
        Dogs& operator= (const Dogs& other); // BIG 3: Assignment operator
        void setName(string name);
        string getName() const; //This is constant because we don't want this to change the name in the process.
    private:
        string name;
        // Every dog has a unique ID.
        int id;
        static int dogCounter;
};


int Dogs::dogCounter = 0;

Dogs::Dogs() : id(++dogCounter) {
    cout << "Default constructor called for dog #" << id << ".\n";
}

Dogs::Dogs(const Dogs& other) : name(other.name), id(++dogCounter) {
    cout << "Created dog #" << id << " as a copy of dog #" << other.id << " (their names are both '" << name << "'.)\n";
};

Dogs::~Dogs() {
    cout << "Dogs destructor called for dog #" << id << " ('" << name << "').\n";
}

Dogs& Dogs::operator= (const Dogs& other) {
    // Avoid self-assignment.
    if (&other != this) {
        // (Destroy old data.)
        // Not needed if all data members are first-class objects.

        // Copy data.
        name = other.name;
    }
    cout << "Assigning dog #" << other.id << " into *this (id =" << id << ", name is now '" << name << "')\n";
    // Return reference to self to allow chain assignment.
    return *this;
}

void Dogs::setName(string name) {
    this->name = name;
}

string Dogs::getName() const {
    return this->name;
}

int main() {
    cout << "Hello\n";
    Dogs a;
    a.setName("Fido");
    Dogs b = a;
    Dogs c;
    c = b;
    cout << "Goodbye\n";
} // <-- C++'s most powerful feature.