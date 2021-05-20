#include "serial.h"

Serial::Serial(QObject *parent) : QObject(parent)
{
     port = new QSerialPort();
     tPressao = new QTimer();
    this->findSerial();
  //  this->openSerialIsuflador();
    this->initSerialInsufla();


      connect(tPressao,&QTimer::timeout,this,&Serial::enviaPressao);
       connect(port,SIGNAL(readyRead()),this,SLOT(readBytesCam()));
tPressao->start(3000);
}

Serial::~Serial()
{
    qDebug("fechamos");
    delete port;
}

void Serial::findSerial()
{
    const auto serialPortInfos = QSerialPortInfo::availablePorts();

    qDebug() << "Total de portas seriais disponivies: " << serialPortInfos.count();

    const QString blankString = "N/A";
    QString description;
    QString manufacturer;
    QString serialNumber;

    for (const QSerialPortInfo &serialPortInfo : serialPortInfos) {
        description = serialPortInfo.description();
        manufacturer = serialPortInfo.manufacturer();
        serialNumber = serialPortInfo.serialNumber();

        qDebug() << "Port: " << serialPortInfo.portName();
        qDebug() << "Location: " << serialPortInfo.systemLocation();
        qDebug() << "Description: " << (!description.isEmpty() ? description : blankString);
        qDebug() << "Manufacturer: " << (!manufacturer.isEmpty() ? manufacturer : blankString);
        qDebug() << "Serial number: " << (!serialNumber.isEmpty() ? serialNumber : blankString);
        qDebug() << "Vendor Identifier: " << (serialPortInfo.hasVendorIdentifier() ? QByteArray::number(serialPortInfo.vendorIdentifier(), 16) : blankString);
        qDebug() << "Product Identifier: " << (serialPortInfo.hasProductIdentifier() ? QByteArray::number(serialPortInfo.productIdentifier(), 16) : blankString);
        qDebug() << "Busy: " << (serialPortInfo.isBusy() ? QObject::tr("Yes") : QObject::tr("No")) << endl;
    }
}

bool Serial::openSerialIsuflador()
{
    port->close();
    port->setPortName("COM4");
    serialInsufla = port->open(QIODevice::ReadWrite);

   if(serialInsufla)  qDebug("serial do insuflador abriu");
   else qDebug("serial do insuflador nao abriu");

   return serialInsufla;
}

bool Serial::initSerialInsufla()
{
    if(!openSerialIsuflador()) return 0;

     port->setPortName("COM4");
     port->setBaudRate(QSerialPort::Baud9600);
     port->setDataBits(QSerialPort::Data8);
     port->setParity(QSerialPort::NoParity);
     port->setStopBits(QSerialPort::OneStop);
     port->setFlowControl(QSerialPort::NoFlowControl);

     qDebug("serial insufla configurado com sucesso");
     return 1;

}
void Serial::enviaPressao()
{
    this->escreveserialCam(5);
}
void Serial::escreveserialCam(int com)
{
    QByteArray m_batTx;
    int i;

    if(com == 5)//envia setPressao para a câmera
     {
  //  tPressao->stop();
        m_batTx[0] = 24; m_batTx[1] = 25;  m_batTx[2] = 26; m_batTx[3] = 27; m_batTx[4] = 28; m_batTx[5] = 29;

    }

    m_batTx.append(m_batTx);
    port->write(m_batTx);
    port->flush();

}

QList<int> Serial::readBytesCam()
{
    int luis,i;
    QList<int> *l = new QList<int>();

    QByteArray buf =0;
   //  qDebug("recebemos algo do insuflador");
   while(port->waitForReadyRead(50)) // aguarda um tempo para receber a resposta
        {
            if (port->bytesAvailable())
            {
              // qDebug("recebemos dados do insuflador");
                buf.append(port->readAll());
                for (int i=0; i<buf.size(); i++){l->append(buf.at(i));
                   luis = buf[i];

                  qDebug()<< luis ;
                   // tPressao->start(5000);
                }

              }
        }
    return *l;
}
