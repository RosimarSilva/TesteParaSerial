#include "serial.h"

Serial::Serial(QObject *parent) : QObject(parent)
{
     port = new QSerialPort();
     tPressao = new QTimer();
     tHoras = new QTimer();
     out_ = new QByteArray();
    this->findSerial();
  //  this->openSerialIsuflador();
    this->initSerialInsufla();


     connect(tHoras,&QTimer::timeout,this,&Serial::atualizaHoras);
      connect(tPressao,&QTimer::timeout,this,&Serial::atualizaMed);
       connect(port,SIGNAL(readyRead()),this,SLOT(readBytesCam()));


}

Serial::~Serial()
{
    qDebug("fechamos");
    delete port;
    delete tPressao;
    delete tHoras;
    delete out_;
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
       // qDebug() << "Busy: " << (serialPortInfo.isBusy() ? QObject::tr("Yes") : QObject::tr("No")) << endl;
    }
}

bool Serial::openSerialIsuflador()
{
    port->close();
    port->setPortName("COM27");
    serialInsufla = port->open(QIODevice::ReadWrite);

   if(serialInsufla)  qDebug("serial do insuflador abriu");
   else qDebug("serial do insuflador nao abriu");

   return serialInsufla;
}

bool Serial::initSerialInsufla()
{
    if(!openSerialIsuflador()) return 0;

     port->setPortName("COM27");
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

void Serial::setDia(const int value)
{
    if(dia != value)
    {
        dia = value;
        emit diaChanged();
    }
}

void Serial::setMes(const int value)
{
   if(mes != value)
    {
        mes = value;
        emit mesChanged();
    }
}

void Serial::setAno(const int value)
{
    if(ano != value)
    {
        ano = value;
        emit anoChanged();
    }
}

void Serial::setHora(const int value)
{
    if(hora != value)
    {
        hora = value;
        emit horaChanged();
    }
}

void Serial::setMinuto( int value)
{
    if(minuto != value)
    {
        minuto = value;
        emit minutoChanged();
    }
}

void Serial::dataOk()
{
    writeBytes({0x25,0x54,0x09,0x06,dia,mes,ano,hora,minuto});
}

void Serial::setDia_(const int value)
{
    dia = value;
    emit diaChanged();
}

void Serial::setSens1(int value)
{
    sens1_ = value;
     emit sens1Changed();
}

void Serial::setSens2(int value)
{
     sens2_ = value;
      emit sens2Changed();
}

void Serial::setSens3(int value)
{
    sens3_ = value;
    emit sens3Changed();
}

void Serial::setSens4(int value)
{
    sens4_ = value;
    emit sens4Changed();
}



void Serial::setLed(int comand)
{
     writeBytes({0x25,0x54,0x04,comand});
     //Liga ou deliga o led
}

void Serial::initSerail()
{
    this->initSerialInsufla();
}

void Serial::setTemDorm(const char sinal)
{
    if(sinal == 1)
    {
        tempoDormindo ++;
    }
    else if(sinal == 2)
    {
        tempoDormindo --;
    }

    emit tempDormichanged();
}

void Serial::setTempAcor(const char sinal)
{
    if(sinal == 1)
    {
        tempoAcordado ++;
    }
    else if(sinal == 2)
    {
        tempoAcordado --;
    }

     emit tempAcordachanged();
}

void Serial::alarmeOk()
{
    writeBytes({0x25,0x54,0x06,0x07,tempoAcordado,tempoDormindo});
}

void Serial::setEspera(int c)
{
    emit esperaChanged();
}

void Serial::setFunciona(int c)
{
    emit funcChanged();
}

int Serial::writeBytes(const QList<int> &l)
{
    QSerialPort serial;
    QByteArray buf;

  // if (isopen()){
       if (!l.size()) return true;
       out_->resize(l.size());
       for (int i=0; i<l.size(); i++) out_->data()[i] = l[i];
 //  }


   port->write(*out_) > 0;

   port->clearError();

   return true;
}

int Serial::myDia()
{
    return dia;
}

int Serial::myMes()
{
    return mes;
}

int Serial::myAno()
{
   return ano;
}

int Serial::myHora()
{
   return hora;
}

int Serial::myMinuto()
{
    return minuto;
}

int Serial::sens1()
{
    return sens1_;
}

int Serial::sens3()
{
    return sens3_;
}

int Serial::sens4()
{
     return sens4_;
}

int Serial::sens2()
{
    return sens2_;
}

int Serial::tempDorm()
{
    return tempoDormindo;
}

int Serial::tempAcord()
{
    return tempoAcordado;
}


QList<int> Serial::readBytesCam()
{
    uint8_t luis,i;
    QList<int> *l = new QList<int>();

  //  qDebug("recebemos algo do insuflador");
   while(port->waitForReadyRead(100)) // aguarda um tempo para receber a resposta
        {
            if (port->bytesAvailable())
            {
             //  qDebug("recebemos dados do insuflador");
                buf.append(port->readAll());
                for (int i=0; i<buf.size(); i++){l->append(buf.at(i));

                    luis = buf[i];
                    qDebug()<< luis;
                }

              }
           //  qDebug()<< usb[4];
        }



  if(buf[0] == 84 && buf[1] == 37)
   {
      dia_ =  buf[4];
      mes_ =  buf[5];
      ano_ = buf[6];
      hora_ =  buf[7];
      minuto_ = buf[8];

    //  this->setAno(buf[6]);
    //   this->setMes(buf[5]);
    //   this->setDia_(buf[4]);
      // this->setHora(buf[7]);
      // this->setMinuto(buf[8]);
    //  qDebug("chamamos o pai de rei");

        tHoras->start(50);

   }

  if(buf[0] == 84 && buf[1] == 37 && buf[3] == 0x03)
   {
      if(buf[4] == 1) emit funcChanged();
      else emit esperaChanged();

    //  this->setAno(buf[6]);
    //   this->setMes(buf[5]);
    //   this->setDia_(buf[4]);
      // this->setHora(buf[7]);
      // this->setMinuto(buf[8]);
    //  qDebug("chamamos o pai de rei");

        tHoras->start(50);

   }

 if((buf[0] == 0x24)&&(buf[1] == 0x25))
   {
      sens1_ = (buf[2]*256) + buf[3];
        sens2_ = (buf[4]*256) + buf[5];
          sens3_ = (buf[6]*256) + buf[7];
            sens4_ = (buf[8]*256) + buf[9];
             tPressao->start(50);

   }

   buf.clear();
  //  usb.clear();

   return *l;
}

void Serial::atualizaHoras()
{
    tHoras->stop();


   this->setAno(ano_);
    this->setMes(mes_);
    this->setDia(dia_);
    this->setHora(hora_);
    this->setMinuto(minuto_);

   // qDebug()<<dia_;
}

void Serial::atualizaMed()
{
  //   tPressao->stop();

    emit esperaChanged();
    this->setSens1(sens1_);
     this->setSens2(sens2_);
     this->setSens3(sens3_);
     this->setSens4(sens4_);

}

