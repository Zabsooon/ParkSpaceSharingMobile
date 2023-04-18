#ifndef REGISTER_CLASS_H
#define REGISTER_CLASS_H

#include <QObject>

class RegisterClass : public QObject
{
    Q_OBJECT
public:
    explicit RegisterClass(QObject *parent = nullptr);
    Q_INVOKABLE void registerUser(const QString& username, const QString& email, const QString& password);
};

#endif // REGISTER_CLASS_H
