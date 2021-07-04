#include "nikui.h"

Nikui::Nikui()
{
    m_reader = new Reader();
    m_library = new Library();
    m_database = new Database();
}

Reader* Nikui::reader()
{
    return m_reader;
}

Library* Nikui::library()
{
    return m_library;
}

Settings* Nikui::settings()
{
    return m_settings;
}
