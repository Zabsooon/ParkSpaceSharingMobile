#include "include/login.h"
#include <QDebug>

LoginClass::LoginClass(QObject *parent) : QObject(parent)
{ }

void LoginClass::login(const QString& email, const QString& password)
{
    qDebug() << "Logging in with email" << email << "and password" << password;
}
