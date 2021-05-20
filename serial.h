#ifndef SERIAL_H
#define SERIAL_H

#include <QObject>
#include <QtSerialPort/QSerialPortInfo>
#include <QString>
#include <QSerialPort>
#include <QIODevice>
#include <QTimer>
#include <QFile>
#include <QProcess>
#include <QDebug>
#include <QFileSystemWatcher>
#include <QTextStream>


class Serial: public QObject
{
    Q_OBJECT
public:
    explicit Serial(QObject *parent = nullptr);
    ~Serial();

    void findSerial(void);

    bool openSerialIsuflador(void);
    bool initSerialInsufla(void);
    void enviaPressao();
    void escreveserialCam(int com);

public slots:
    QList<int> readBytesCam();
private:
      QSerialPort *port;
      bool serialInsufla;
       QTimer *tPressao;
        int setPressao;
};

#endif // SERIAL_H
