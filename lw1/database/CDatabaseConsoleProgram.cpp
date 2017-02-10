#include "CDatabaseConsoleProgram.h"

using namespace std;


CDatabaseConsoleProgram::CDatabaseConsoleProgram(std::string CSVDBFilePath, std::istream& input, std::ostream& output)
    : m_input(input),
      m_output(output),
      m_CSVDBFilePath(CSVDBFilePath),
      m_CSVDBFile(csv::Parser(m_CSVDBFilePath))
{
}

size_t CDatabaseConsoleProgram::GetRowsCount()const
{
    return m_CSVDBFile.rowCount();
}

bool CDatabaseConsoleProgram::SearchByField(DBFields targetField, std::string searchString)
{
    string currentField;

    for (size_t i = 0; i < GetRowsCount(); i++)
    {
        currentField = m_CSVDBFile[i][targetField];
        size_t pos = currentField.find(searchString);
        if (pos != std::string::npos)
        {
            m_foundRecordIds.push_back(stoi(m_CSVDBFile[i][0]));
        }
    }

    return m_foundRecordIds.size() > 0 ? true : false;
}

std::string CDatabaseConsoleProgram::GetSearchResult()const
{
    string searchResult("Found record ids: ");
    for (size_t i = 0; i < m_foundRecordIds.size(); i++)
    {
        searchResult += to_string(m_foundRecordIds[i]) + " ";
    }

    return searchResult;
}

void CDatabaseConsoleProgram::HandleCommand(std::string inputCommand)
{
    if (inputCommand == "search")
    {
        // default search by fullname author
        string searchString;
        m_output << "Input author name >>";
        m_input >> searchString;

        if (SearchByField(DBFields::author, searchString))
        {
            m_output << GetSearchResult();
        }
        else
        {
            m_output << "Not found" << endl;
        }
    }
    else
    {
        m_output << "Unknow command" << endl;
    }
}