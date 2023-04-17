#ifndef LOGIN_CLASS_H
#define LOGIN_CLASS_H

#include <QObject>

class LoginClass : public QObject
{
    Q_OBJECT
public:
    explicit LoginClass(QObject *parent = nullptr);
    Q_INVOKABLE void login(const QString& email, const QString& password);

signals:

};

#endif // LOGIN_CLASS_H
