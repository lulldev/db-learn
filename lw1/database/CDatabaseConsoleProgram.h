#include <iostream>
#include <sstream>
#include <vector>

#include "../lib/CSVparser-master/CSVparser.hpp"

#define CSV_FILE_COLUMN_COUNT 7

enum DBFields {
    id,
    file,
    description,
    date,
    author,
    platform,
    type,
    port
};

class CDatabaseConsoleProgram
{
public:
    CDatabaseConsoleProgram(std::string CSVDBFilePath, std::istream& input, std::ostream& output);
    void HandleCommand(std::string inputCommand);
    bool SearchByField(DBFields targetField, std::string searchString);
    std::string GetSearchResult()const;

private:
    size_t GetRowsCount()const;

private:
    std::istream& m_input;
    std::ostream& m_output;
    std::string m_CSVDBFilePath;
    csv::Parser m_CSVDBFile;
    std::vector<size_t> m_foundRecordIds;
};