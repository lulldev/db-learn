#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include <sstream>
#include <iostream>

#include "../database/CDatabaseConsoleProgram.h"

#include "tests.h"

using testing::Eq;
using namespace std;


class CCSVDatabaseFixture: public ::testing::Test
{
public:
    CDatabaseConsoleProgram *program;
    std::stringstream input;
    std::stringstream output;

    CCSVDatabaseFixture()
    {
        program = new CDatabaseConsoleProgram("../data/files.csv", input, output);
    }

    std::string GetOutput()
    {
        return output.str();
    }

};

TEST_F(CCSVDatabaseFixture, TestHandleCommand)
{
    program->HandleCommand("test");
    ASSERT_EQ(GetOutput(), "Unknow command\n");
}

TEST_F(CCSVDatabaseFixture, TestSearchAuthor)
{
    ASSERT_FALSE(program->SearchByField(DBFields::author, "Some string"));

    ASSERT_TRUE(program->SearchByField(DBFields::author, "Daniel Nystram"));
    ASSERT_TRUE(program->GetSearchResult() == "Found record ids: 11 ");
}


int main(int argc, char* argv[])
{
    testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}