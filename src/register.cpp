#include "include/register.h"
#include <QDebug>

RegisterClass::RegisterClass(QObject *parent) : QObject(parent)
{ }

void RegisterClass::registerUser(const QString& username, const QString& email, const QString& password)
{
    qDebug() << "Signing up with username: " << username << ", email: " << email << ", password: " << password;
}
