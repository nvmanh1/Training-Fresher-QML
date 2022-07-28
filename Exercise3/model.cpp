#include "model.h"
#include <QDebug>
#include <QColor>
MemModel::MemModel(QObject *parent)
{


    setInputFile("listdata.json");


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

        if (row < 0 || index.row() >= mMember.count())
            return QVariant();

        const Member& mem = mMember.at(row);
        switch (role)
        {
            case NameRole:
                    return mem.name;
            case colorRole:
                    return mem.mcolor;
            case AgeRole:
                return mem.age;
        }
        return QVariant();

}
void MemModel::addMember(QString name, int age, QString color)
{
    Member data("","", 0);
    data.name = name;
    data.age = age;
    data.mcolor = color;
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    mMember.insert(rowCount(), data);
    endInsertRows();
    qDebug()<<"count:"<< mMember.count();

}

void MemModel::remove(int index)
{
    if (index < 0 || index >= mMember.count())
        return;
    beginRemoveRows(QModelIndex(), index, index);
    mMember.removeAt(index);
    endRemoveRows();
}
void MemModel::saveListModelToFile(){
    QFile saveDoc(pInputFile);

    if( !saveDoc.open(QIODevice::WriteOnly | QIODevice::Truncate)){
        qWarning("Could not open file in saveListModelToFile fucntion");
        return;
    }

    QJsonObject rootObject;
    QJsonArray todolistArray;

    for(int index = 0; index < mMember.count(); index++){
        if(mMember[index].ageMem() < 0 || (mMember[index].roleMem() != "yellow" && mMember[index].roleMem() != "red" && mMember[index].roleMem() != "blue" && mMember[index].roleMem() != "green"))
        {
            continue;
        }
        QJsonObject todoItemJson;
        todoItemJson["name"] = mMember[index].nameMem();
        todoItemJson["age"] = mMember[index].ageMem();
        todoItemJson["color"] = mMember[index].roleMem();
        todolistArray.append(todoItemJson);
    }

    rootObject["todolist"] = todolistArray;

    auto writeContent = QJsonDocument(rootObject).toJson();
    saveDoc.write(writeContent);
    saveDoc.close();
    qDebug()<<"123count:"<< mMember.count();
    qDebug()<<"end saveListModelToFile";
}
void MemModel::loadListModelFromInputFile(){

    QFile loadDoc(pInputFile);

    if( !loadDoc.open(QIODevice::ReadOnly)){
        qWarning("Could not open file");
        return;
    }

    auto fileContent = loadDoc.readAll();
    QJsonDocument saveFileDoc = QJsonDocument::fromJson(fileContent);

    QJsonObject rootObject = saveFileDoc.object();

    if(rootObject.contains("todolist") && rootObject["todolist"].isArray()){

        auto todolistJsonArray = rootObject["todolist"].toArray();
        QList <Member> newMember;
        for(int index =0; index < todolistJsonArray.size(); index++){
            auto jsonTodoItem = todolistJsonArray[index].toObject();
            auto newTodoItem = Member( jsonTodoItem["name"].toString(),jsonTodoItem["color"].toString(), jsonTodoItem["age"].toDouble());
            newMember.append(newTodoItem);
        }
        beginResetModel();
        mMember = newMember;
        endResetModel();
        loadDoc.close();
    }else{
        qWarning("file not contain todolist key");
        return;
    }
}
void MemModel::upDateData(int idx, QString cName, QString cRole, int cAge)
{

    if (idx < 0 || idx >= mMember.count())
        return;

    mMember[idx].name = cName;

    mMember[idx].mcolor = cRole;
    mMember[idx].age = cAge;

    qDebug()<<"Name:"<< mMember[idx].nameMem();
     qDebug()<<"idx:"<< idx;
    qDebug()<<"Color:"<< mMember[idx].roleMem();
}
void MemModel::setInputFile(QString const &inputFile){
    if(pInputFile == inputFile){
        return;
    }

    pInputFile = inputFile;

    loadListModelFromInputFile();

    emit inputFileChanged();
}
