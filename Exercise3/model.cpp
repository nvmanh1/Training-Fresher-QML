#include "model.h"
#include <QDebug>

MemModel::MemModel(QObject * parent )
{

}
int MemModel::rowCount(const QModelIndex& parent) const
{
    return mMember.count();
}

QVariant MemModel::data(const QModelIndex &index, int role = Qt::DisplayRole) const
{
    int row = index.row();
    if (!index.isValid())
            return QVariant();

        if (index.row() < 0 || index.row() >= mMember.count())
            return QVariant();
        const Member& mem = mMember.at(row);
        switch (role)
        {
            case NameRole:
                    return mem.name;
            case colorRole:
                    return mem.color;
            case AgeRole:
                return mem.age;
        }

}
void MemModel::AddMember(QString name, int age, QString color)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());


}
