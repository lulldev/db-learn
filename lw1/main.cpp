#include <iostream>
#include "database/CDatabaseConsoleProgram.h"

using namespace std;

int main()
{
    cout << "Welcome to database console program!\n"
         << "Available commands: search" << endl;

    string inputCommand("");
    CDatabaseConsoleProgram program("../data/files.csv", cin, cout);

    while (getline(cin, inputCommand))
    {
        program.HandleCommand(inputCommand);
    }

    return 0;
}