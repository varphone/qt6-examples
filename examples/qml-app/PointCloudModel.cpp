#include "PointCloudModel.h"
#include <QRandomGenerator>
#include <cmath>
#include <qabstractitemmodel.h>
#include <qnamespace.h>
#include <qvariant.h>


PointCloudModel::PointCloudModel(QObject* parent) : QAbstractItemModel(parent)
{
}

PointCloudModel::~PointCloudModel()
{
}

int PointCloudModel::columnCount(const QModelIndex& parent) const
{
    return 1919;
}

int PointCloudModel::rowCount(const QModelIndex& parent) const
{
    return 2;
}

QVariant PointCloudModel::data(const QModelIndex& index, int role) const
{
    if (!index.isValid())
        return QVariant();
    // qDebug() << "index" << index;
    // int v = QRandomGenerator::global()->bounded(-100, 100);
    // return ((double)v) / 10.0;
    if (index.row() == 0)
        return mXValues[index.column()];
    else if (index.row() == 1)
        return mYValues[index.column()];

    // switch (role) {
    // case Qt::UserRole + 1:
    //     return 1.0;
    // case Qt::UserRole + 2:
    //     return 2.0;
    // case Qt::UserRole + 3:
    //     return 3.0;
    // }
    return QVariant();
}

QModelIndex PointCloudModel::index(int row, int column,
                                   const QModelIndex& parent) const
{
    if (row >= 2 || column >= 1920)
        return QModelIndex();
    return createIndex(row, column, nullptr);
}

QModelIndex PointCloudModel::parent(const QModelIndex& index) const
{
    return QModelIndex();
}

QHash<int, QByteArray> PointCloudModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[Qt::UserRole + 1] = "x";
    roles[Qt::UserRole + 2] = "y";
    roles[Qt::UserRole + 3] = "z";
    return roles;
}

void PointCloudModel::forceRefresh()
{
    mRandAngle = QRandomGenerator::global()->bounded(-360, 360);
    // return ((double)v) / 10.0;
    auto xStep = 10.0 / 50.0;
    auto yStep = 10.0 / 100.0;
    auto ta = mRandAngle;

    for (auto x = 0; x < 1920; x++) {
        mXValues[x] = -10.0 + x * 0.5;
        // if (ta++ > 360)
        //     ta = -360;
    }

    for (auto y = 0; y < 1920; y++) {
        mYValues[y] = sin(ta) * 10.0;
        if (ta++ > 360)
            ta = -360;
    }
 
    QModelIndex topLeft = createIndex(0, 0, this);
    QModelIndex bottomRight = createIndex(1, 15, this);
    emit dataChanged(topLeft, bottomRight);
}
