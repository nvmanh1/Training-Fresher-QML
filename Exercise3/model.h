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
#include <QColor>
#include<QString>
class Member
{
 public :
   explicit Member(const QString &Name, const QString &Color, const int Age){
            name = Name;
            mcolor = Color;
            age = Age;
        };

    QString nameMem()
    {
        return name;
    }
    int ageMem()
    {
        return age;
    }
    QString roleMem()
    {
        return mcolor;
    }

    QString name;
    int age;
    QString mcolor;

};

class MemModel : public QAbstractListModel
{

  Q_OBJECT
  Q_PROPERTY(QString inputFile READ inputFile WRITE setInputFile NOTIFY inputFileChanged)
signals:

 public :


    enum RoleNames {
    NameRole = Qt::UserRole,
    AgeRole,
    colorRole
    };

    explicit MemModel(QObject * parent = nullptr );


    virtual int rowCount(const QModelIndex& parent = QModelIndex()) const override;

    virtual QVariant data(const QModelIndex &index, int role) const override;
    QString inputFile()const {
        return pInputFile;
    }
     void setInputFile(QString const &inputFile);

    Q_INVOKABLE    void addMember(QString name, int age, QString color);
    Q_INVOKABLE    void remove(int index);
    Q_INVOKABLE    void saveListModelToFile();
    Q_INVOKABLE    void upDateData(int idx, QString name, QString role, int age);

protected:
    virtual QHash<int, QByteArray> roleNames() const override
     {
          QHash<int, QByteArray> m_roleNames;
          m_roleNames[NameRole] = "name";
          m_roleNames[AgeRole] = "age";
          m_roleNames[colorRole] = "mcolor";

          return m_roleNames;
    }

 private:
   QList<Member> mMember;
   QString pInputFile;

   void loadListModelFromInputFile();


signals:
    void inputFileChanged();



};




#endif // MODEL_H
