#include "serial.h"
//construtor do programa em c++
Serial::Serial(QObject *parent) : QObject(parent)
{
    //Aloca na memória heap,
     port = new QSerialPort();
     tPressao = new QTimer();
     tHoras = new QTimer();
     out_ = new QByteArray();
     func = new QTimer;
     esp = new QTimer;

     //procura quaisseriaisestão disponiveis
    this->findSerial();
    this->initSerialInsufla();

    // estes conects conectam essas variaveis a essas rotinas
     connect(tHoras,&QTimer::timeout,this,&Serial::atualizaHoras);
     connect(tPressao,&QTimer::timeout,this,&Serial::atualizaMed);

     //Esta funciona como uma interrupção igual no microcontrolador
     connect(port,SIGNAL(readyRead()),this,SLOT(readBytesCam()));

     connect(func,&QTimer::timeout,this,&Serial::funcPai);
     connect(esp,&QTimer::timeout,this,&Serial::espMae);


}
//Destrutor do C++
Serial::~Serial()
{
    qDebug("fechamos");
    delete port;
    delete tPressao;
    delete tHoras;
    delete out_;
    delete func;
    delete esp;
    //tudo que tiver "NEW na frente da variável tem que dar delete quando o programafecha
}
//Procura a serial disponivel
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
        if(manufacturer == "FTDI")
        {
            porta = serialPortInfo.systemLocation();
        }

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
// Abre a serial selecionada
bool Serial::openSerialIsuflador()
{
    port->close();
    port->setPortName(porta);
    serialInsufla = port->open(QIODevice::ReadWrite);

   if(serialInsufla)  qDebug("serial do insuflador abriu");
   else qDebug("serial do insuflador nao abriu");

   return serialInsufla;
}
//inicualiza a serial selecionada
bool Serial::initSerialInsufla()
{
    if(!openSerialIsuflador()) return 0;

     port->setPortName(porta);
     port->setBaudRate(QSerialPort::Baud1200);
     port->setDataBits(QSerialPort::Data8);
     port->setParity(QSerialPort::NoParity);
     port->setStopBits(QSerialPort::OneStop);
     port->setFlowControl(QSerialPort::NoFlowControl);

     qDebug("serial insufla configurado com sucesso");
     return 1;

}
//seta odia e envia lá para o qml queé a interface do software
void Serial::setDia(const int value)
{
    if(dia != value)
    {
        dia = value;
        emit diaChanged();//avisa o Qml Interface
    }
}
//seta o mês e envia lá para o qml queé a interface do software
void Serial::setMes(const int value)
{
   if(mes != value)
    {
        mes = value;
        emit mesChanged();//avisa o Qml Interface
    }
}
//seta o ano e envia lá para o qml queé a interface do software
void Serial::setAno(const int value)
{
    if(ano != value)
    {
        ano = value;
        emit anoChanged();//avisa o Qml Interface
    }
}
//seta a hora e envia lá para o qml queé a interface do software
void Serial::setHora(const int value)
{
    if(hora != value)
    {
        hora = value;
        emit horaChanged();//avisa o Qml Interface
    }
}
//seta o minuto e envia lá para o qml queé a interface do software
void Serial::setMinuto( int value)
{
    if(minuto != value)
    {
        minuto = value;
        emit minutoChanged();//avisa o Qml Interface
    }
}
// botão ok da data pressionada dai envia a data e hora selecionada e manda para o micro
void Serial::dataOk()
{
    writeBytes({0x25,0x54,0x09,0x06,dia,mes,ano,hora,minuto});
}
//seta o dia e envia lá para o qml queé a interface do software
void Serial::setDia_(const int value)
{
    dia = value;
    emit diaChanged();//avisa o Qml Interface
}
//envia valor do sensor 1 que vem do micro e manda para a tela do software
void Serial::setSens1(int value)
{
    sens1_ = value;
     emit sens1Changed();//avisa o Qml Interface
}
//envia valor do sensor 2 que vem do micro e manda para a tela do software
void Serial::setSens2(int value)
{
     sens2_ = value;
      emit sens2Changed();//avisa o Qml Interface
}
//envia valor do sensor 3 que vem do micro e manda para a tela do software
void Serial::setSens3(int value)
{
    sens3_ = value;
    emit sens3Changed();//avisa o Qml Interface
}
//envia valor do sensor 4 que vem do micro e manda para a tela do software
void Serial::setSens4(int value)
{
    sens4_ = value;
    emit sens4Changed();//avisa o Qml Interface
}
//envia valor do sensor 5 que vem do micro e manda para a tela do software
void Serial::setSens5(int value)
{
    sens5_ = value;
    emit sens5Changed();//avisa o Qml Interface
}
//enviapara o micro qual led ligar
void Serial::setLed(int comand)
{
     writeBytes({0x25,0x54,0x04,comand});
}
//Comando datela para inicializar a serial manual
void Serial::initSerail()
{
    this->initSerialInsufla();
}
// Determina o tempo drmindo antes de enviar ao micro
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

    emit tempDormichanged();//avisa o Qml Interface
}
// Determina o tempo acordado antes de enviar ao micro
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

     emit tempAcordachanged();//avisa o Qml Interface
}
//confirma os tempos de operação e envia ao micro
void Serial::alarmeOk()
{
    writeBytes({0x25,0x54,0x06,0x07,tempoAcordado,tempoDormindo});
}
//altera a figura de espera la na tela
void Serial::setEspera(int c)
{
    emit esperaChanged();//avisa o Qml Interface
}
//altera a figura de em funcionamento la na tela
void Serial::setFunciona(int c)
{
    emit funcChanged();//avisa o Qml Interface
}
// rotina que envia o frame para o micro
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
//Rotinas que retorna o dia para enviar para a interface
int Serial::myDia()
{
    return dia;
}
//Rotinas que retorna o mes para enviar para a interface
int Serial::myMes()
{
    return mes;
}
//Rotinas que retorna o ano para enviar para a interface
int Serial::myAno()
{
   return ano;
}
//Rotinas que retorna o hora para enviar para a interface
int Serial::myHora()
{
   return hora;
}
//Rotinas que retorna o minuto para enviar para a interface
int Serial::myMinuto()
{
    return minuto;
}
//Rotinas que retorna o sens1 para enviar para a interface
int Serial::sens1()
{
    return sens1_;
}
//Rotinas que retorna o sens3 para enviar para a interface
int Serial::sens3()
{
    return sens3_;
}
//Rotinas que retorna o sens4 para enviar para a interface
int Serial::sens4()
{
     return sens4_;
}
//Rotinas que retorna o sens2 para enviar para a interface
int Serial::sens2()
{
    return sens2_;
}
//Rotinas que retorna o sens5 para enviar para a interface
int Serial::sens5()
{
    return sens5_;
}
//Rotinas que retorna o tempo de espera para enviar para a interface
int Serial::tempDorm()
{
    return tempoDormindo;
}
//Rotinas que retorna o tempo de funcionamento para enviar para a interface
int Serial::tempAcord()
{
    return tempoAcordado;
}

// esta rotina lê os frames quechegam pela serial
QList<int> Serial::readBytesCam()
{
    QList<int> *l = new QList<int>();
    QByteArray buf ;
    uint8_t luis;
   // qDebug("recebemos algo do insuflador");
 while(port->waitForReadyRead(10)) // aguarda um tempo para receber a resposta
        {
            if (port->bytesAvailable())
            {
                buf.append(port->readAll());
                for (int i=0; i<buf.size(); i++){l->append(buf.at(i));

                    luis = buf[i];
                     pontUsb ++;
                    bytesUsb[pontUsb] = luis;

                    //Quantidades de bytes doframe
                    if(pontUsb == 3)
                    {
                        final = bytesUsb[3];
                    }
                    // Verifica se ja chegou no final do frame
                    if(pontUsb == final)
                    {
                        pontUsb = 0;
                        //Pega os valores da data do micro
                        if((bytesUsb[1] == 84) && (bytesUsb[2] == 37)&& (bytesUsb[4] == 06))
                         {
                            dia_ =  bytesUsb[5];
                            mes_ =  bytesUsb[6];
                            ano_ = bytesUsb[7];
                            hora_ =  bytesUsb[8];
                            minuto_ = bytesUsb[9];

                            //Espera um tempo para sair da interrupção e atulaizar a tela
                            tHoras->start(50);
                        }

                        //recebe do micro qual o modoque ele se encontra
                        if(((bytesUsb[1] == 0x54) && (bytesUsb[2] == 0x25) && (bytesUsb[4] == 0x03)))
                         {
                            if(bytesUsb[5] == 0x01) func->start(50);
                            else  esp->start(50);
                         }

                        // Recebe osvalores de medidas dos sensores
                        if(((bytesUsb[1] == 0x54) && (bytesUsb[2] == 0x25) && (bytesUsb[4] == 0x04)))
                          {
                             sens1_ = (bytesUsb[5]*256) + bytesUsb[6];
                             sens2_ = (bytesUsb[7]*256) + bytesUsb[8];
                             sens3_ = (bytesUsb[9]*256) + bytesUsb[10];
                             sens4_ = (bytesUsb[11]*256) + bytesUsb[12];
                             sens5_ = (bytesUsb[13]*256) + bytesUsb[14];

                             tPressao->start(50);
                          }

                        //Limpa o vetor de recebimento
                        for(uint8_t j= 0; j<=15;++j)bytesUsb[j] = 0;

                    }
                }
            }

        }

   buf.clear();
   return *l;
}
//Manda para a interface as datas e minutos
void Serial::atualizaHoras()
{
    tHoras->stop();
    this->setAno(ano_);
    this->setMes(mes_);
    this->setDia(dia_);
    this->setHora(hora_);
    this->setMinuto(minuto_);
}
//Manada para a interface as medidas dos sensores
void Serial::atualizaMed()
{
    tPressao->stop();
    this->setSens1(sens1_);
    this->setSens2(sens2_);
    this->setSens3(sens3_);
    this->setSens4(sens4_);
    this->setSens5(sens5_);

}
//manda trocar a figura de espera para funcionamento
void Serial::funcPai()
{
    func->stop();
    emit funcChanged();//avisa o Qml Interface
}
//manda trocar a figura de funcionamento  para espera
void Serial::espMae()
{
    esp->stop();
    emit esperaChanged();//avisa o Qml Interface
}

