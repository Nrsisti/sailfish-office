/*
 *
 */

#ifndef PDFDOCUMENT_H
#define PDFDOCUMENT_H

#include <QtCore/QObject>
#include <QtGui/QImage>
#include <QtQml/QQmlParserStatus>

namespace Poppler {
    class Document;
    class Page;
}

class PDFJob;
class PDFDocument : public QObject, public QQmlParserStatus

{
    Q_OBJECT
    Q_PROPERTY(QString source READ source WRITE setSource NOTIFY sourceChanged)
    Q_PROPERTY(int pageCount READ pageCount NOTIFY pageCountChanged)
    Q_PROPERTY(QObject* tocModel READ tocModel NOTIFY tocModelChanged)
    Q_PROPERTY(QVariantList linkTargets READ linkTargets NOTIFY linkTargetsChanged)
    Q_PROPERTY(bool loaded READ isLoaded NOTIFY documentLoaded)

    Q_INTERFACES(QQmlParserStatus)

public:
    PDFDocument(QObject* parent = 0);
    ~PDFDocument();

public:
    QString source() const;
    int pageCount() const;
    QObject* tocModel() const;
    QVariantList linkTargets() const;

    bool isLoaded() const;

    virtual void classBegin();
    virtual void componentComplete();

public Q_SLOTS:
    void setSource(const QString& source);
    void requestPage( int index, int size );
    void requestPageSizes();
    void setCanvasWidth( uint width );
    void setCanvasSpacing( uint spacing );
    void jobFinished(PDFJob* job);

Q_SIGNALS:
    void sourceChanged();
    void pageCountChanged();
    void tocModelChanged();
    void linkTargetsChanged();

    void documentLoaded();
    void pageFinished( int index, QImage image );
    void pageSizesFinished(const QList< QSizeF >& heights);

private:
    class Private;
    Private * const d;
};

#endif // PDFDOCUMENT_H
