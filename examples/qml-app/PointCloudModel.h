#include <QAbstractItemModel>

class PointCloudModel : public QAbstractItemModel {
    Q_OBJECT
public:
    PointCloudModel(QObject* parent = nullptr);
    ~PointCloudModel();

    int columnCount(const QModelIndex &parent = QModelIndex()) const override;
    int rowCount(const QModelIndex& parent = QModelIndex()) const override;
    QVariant data(const QModelIndex& index,
                  int role = Qt::DisplayRole) const override;
    QModelIndex	index(int row, int column, const QModelIndex &parent = QModelIndex()) const override;
    QModelIndex	parent(const QModelIndex &index) const override;
    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void forceRefresh();

private:
    int mRandAngle{0};
    float mXValues[2048];
    float mYValues[2048];
};
