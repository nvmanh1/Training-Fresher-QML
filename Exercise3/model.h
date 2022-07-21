#ifndef MODEL_H
#define MODEL_H
#include <QAbstractListModel>
#include <QVariant>
#include <QList>
#include <QHash>
#include <QByteArray>
#include <QtAlgorithms>
#include <QQmlEngine>
#include <QtCore>
#include <QtGui>
class Member
{
 public :
    Member();
    Member(const QString name, const int age, const QString color);
    QString name;
    int age;
    QString color;
};

class MemModel : public QAbstractListModel
{

  Q_OBJECT
//  Q_PROPERTY(int count READ count NOTIFY countChanged)
 public :
    enum RoleNames {
    NameRole = Qt::UserRole,
    AgeRole = Qt::UserRole+2,
    colorRole = Qt::UserRole+3,
    };

    explicit MemModel(QObject * parent = 0);


    virtual int rowCount(const QModelIndex& parent = QModelIndex()) const override;

    virtual QVariant data(const QModelIndex &index, int role) const override;


    Q_INVOKABLE    void AddMember(QString name, int age, QString color);
    //Q_INVOKABLE    void remove(int index);

 private:
   QList<Member> mMember;
};





#endif // MODEL_H
