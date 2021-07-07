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
    Q_PROPERTY(int myDia READ myDia WRITE setDia NOTIFY diaChanged);
    Q_PROPERTY(int myMes READ myMes WRITE setMes NOTIFY mesChanged);
    Q_PROPERTY(int myAno READ myAno WRITE setAno NOTIFY anoChanged);
    Q_PROPERTY(int myHora READ myHora WRITE setHora NOTIFY horaChanged);
    Q_PROPERTY(int myMinuto READ myMinuto WRITE setMinuto NOTIFY minutoChanged());

    Q_PROPERTY(int sens1 READ sens1 WRITE setSens1 NOTIFY sens1Changed);
     Q_PROPERTY(int sens2 READ sens2 WRITE setSens2 NOTIFY sens2Changed);
     Q_PROPERTY(int sens3 READ sens3 WRITE setSens3 NOTIFY sens3Changed);
     Q_PROPERTY(int sens4 READ sens4 WRITE setSens4 NOTIFY sens4Changed);
    Q_PROPERTY(int tempDorm READ tempDorm WRITE setTemDorm NOTIFY tempDormichanged);
    Q_PROPERTY(int tempAcord READ tempAcord WRITE setTempAcor NOTIFY tempAcordachanged);

   // Q_PROPERTY(int espera READ espera WRITE setEspera NOTIFY esperaChanged);
  //  Q_PROPERTY(int funciona READ funciona WRITE setFunciona NOTIFY funcChanged);


public:
    explicit Serial(QObject *parent = nullptr);
    ~Serial();

    void findSerial(void);

    bool openSerialIsuflador(void);
    bool initSerialInsufla(void);
    void enviaPressao();
    void escreveserialCam(int com);

    Q_INVOKABLE void setDia(const int value);
    Q_INVOKABLE void setMes(const int value);
    Q_INVOKABLE void setAno(const int value);
    Q_INVOKABLE void setHora(const int value);
    Q_INVOKABLE void setMinuto( int value);
    Q_INVOKABLE void dataOk(void);

    void setDia_(const int value);

    Q_INVOKABLE void setSens1( int value);
    Q_INVOKABLE void setSens2( int value);
    Q_INVOKABLE void setSens3( int value);
    Q_INVOKABLE void setSens4( int value);


     Q_INVOKABLE void setLed(int comand);
     Q_INVOKABLE void initSerail(void);

      Q_INVOKABLE void setTemDorm(const char sinal);
      Q_INVOKABLE void setTempAcor(const char sinal);
       Q_INVOKABLE void alarmeOk(void);

     Q_INVOKABLE void setEspera(int c);
     Q_INVOKABLE void setFunciona(int c);


    int writeBytes(const QList<int> &l);

    int myDia(void);
    int myMes(void);
    int myAno(void);
    int myHora(void);
    int myMinuto(void);
    int sens1(void);
    int sens3(void);
    int sens4(void);
    int sens2(void);

    int tempDorm(void);
    int tempAcord(void);

    int espera(void);
    int funciona(void);

signals:
    void diaChanged(void);
    void mesChanged(void);
    void anoChanged(void);
    void horaChanged(void);
    void minutoChanged(void);
    void sens1Changed(void);
     void sens2Changed(void);
      void sens3Changed(void);
       void sens4Changed(void);
       void sens5Changed(void);
       void tempDormichanged(void);
       void tempAcordachanged(void);

       void esperaChanged(void);
       void funcChanged(void);

public slots:
    QList<int> readBytesCam();
    void atualizaHoras(void);
    void atualizaMed(void);
    void funcPai(void);
    void espMae(void);
private:
      QSerialPort *port;
      bool serialInsufla;
       QTimer *tPressao;
       QTimer *tHoras;
       QTimer *func;
       QTimer *esp;
        int setPressao;
        QString porta;

    uint8_t bytesUsb[15];
    uint8_t pontUsb,final;

 int usb[20] ;
 QByteArray  *out_;
        int dia,mes,ano,hora,minuto,dia_,mes_,ano_,hora_,minuto_;
         int sens1_= 0,sens2_= 0,sens3_= 0,sens4_= 0,tempoDormindo=0,tempoAcordado=0,i;
};

#endif // SERIAL_H
