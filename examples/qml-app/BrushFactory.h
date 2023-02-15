#include <QBrush>
#include <QObject>
#include <qcolor.h>
#include <qsize.h>
#include <qtmetamacros.h>

class QJSEngine;
class QQmlEngine;

class BrushFactory : public QObject {
    Q_OBJECT
public:
    BrushFactory(QObject* parent = nullptr);
    ~BrushFactory();

    enum PatternKind
    {
        Ball,
        Circle,
        Cross,
        Diamond,
        Plus,
        Triangle,
    };

    Q_ENUM(PatternKind)

    Q_INVOKABLE QBrush defaultBrush();
    Q_INVOKABLE QBrush patternBrush(PatternKind kind, QSizeF size,
                                    QColor fillColor, QColor strokeColor,
                                    qreal lineWidth = 2.0);

    static QObject* qmlInstance(QQmlEngine* engine, QJSEngine* scriptEngine);

private:
    QBrush ballBrush(qreal r, QColor fillColor);
    QBrush crossBrush(QSizeF size, QColor fillColor, QColor strokeColor,
                      qreal lineWidth = 2.0);
};
