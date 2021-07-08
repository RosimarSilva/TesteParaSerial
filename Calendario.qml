import QtQuick 2.0

Item {

    property int dia_: 19
    property int mes_: 06
    property int ano_: 21
    property int hora_: 16
    property int minuto_: 23
    property int dorme: 0
    property int acorda: 0
    Image {
        id: image
        x: 0
        y: 30
        source: "Telas/black.bmp"
    //Texto principal da tela do calendario
        Text {
            id: identiTela
            x: 201
            y: 54
            width: 306
            height: 32
            color: "#50b03d"
            text: qsTr("Ajuste de Data e Hora")
            font.pixelSize: 25
        }
    // textos dia mes ano ...
        Text {
            id: tiuloData
            x: 22
            y: 115
            width: 690
            height: 30
            color: "#65b160"
            text: qsTr("  Dia           Mes             Ano             Hora           minuto")
            font.pixelSize: 25
        }
    // Botão '-' do dia
        Text {
            id: minDia
            x: 13
            y: 164
            color: "#6aac57"
            text: qsTr("-")
            font.pixelSize: 25
            MouseArea {
                 anchors.fill: parent
                onPressed: {parent.scale = 0.95}
                onReleased:
                {
                    parent.scale = 1.0;
                   --dia_;
                    if(dia_ < 1) dia_ = 31
                    initial.setDia(dia_)
                }

            }
        }
// Botão '+' do dia
        Text {
            id: maiDia
            x: 69
            y: 164
            width: 24
            height: 30
            color: "#6aac57"
            text: qsTr("+")
            font.pixelSize: 25
            MouseArea {
                 anchors.fill: parent
                onPressed: {parent.scale = 0.95}
                onReleased:
                {
                    parent.scale = 1.0;
                    ++dia_;
                    if(dia_ > 31) dia_ = 1
                    initial.setDia(dia_)

                }

            }
        }
// Botão '+' do Mes
        Text {
            id: maiMes
            x: 201
            y: 164
            width: 24
            height: 30
            color: "#6aac57"
            text: qsTr("+")
            font.pixelSize: 25
            MouseArea {
                 anchors.fill: parent
                onPressed: {parent.scale = 0.95}
                onReleased:
                {
                    parent.scale = 1.0;
                    ++mes_
                    if(mes_ > 12) mes_ = 1
                   initial.setMes(mes_)

                }

            }
        }
// Botão '+' do Ano
        Text {
            id: maiAno
            x: 348
            y: 164
            width: 24
            height: 30
            color: "#6aac57"
            text: qsTr("+")
            font.pixelSize: 25
            MouseArea {
                 anchors.fill: parent
                onPressed: {parent.scale = 0.95}
                onReleased:
                {
                    parent.scale = 1.0;
                    ++ano_
                    if(ano_ > 60) minuto_ = 21
                    initial.setAno(ano_)

                }

            }
        }
        // Botão '+' do Hora
        Text {
            id: maiHora
            x: 499
            y: 164
            width: 24
            height: 30
            color: "#6aac57"
            text: qsTr("+")
            font.pixelSize: 25
            MouseArea {
                 anchors.fill: parent
                onPressed: {parent.scale = 0.95}
                onReleased:
                {
                    parent.scale = 1.0;
                    ++hora_
                    if(hora_ > 23) hora_ = 0
                    initial.setHora(hora_)

                }

            }
        }
        // Botão '+' do minuto
        Text {
            id: maiMin
            x: 649
            y: 164
            width: 24
            height: 30
            color: "#6aac57"
            text: qsTr("+")
            font.pixelSize: 25
            MouseArea {
                anchors.fill: parent
                onPressed: {parent.scale = 0.95}
                onReleased:
                {
                    parent.scale = 1.0;
                    ++minuto_
                    if(minuto_ > 59) minuto_ = 0
                    initial.setMinuto(minuto_)

                }

            }
        }
// Botão '-' do mes
     Text {
            id: minMes
            x: 151
            y: 164
            color: "#6aac57"
            text: qsTr("-")
            font.pixelSize: 25
            MouseArea {
                 anchors.fill: parent
                onPressed: {parent.scale = 0.95}
                onReleased:
                {
                    parent.scale = 1.0;
                    --mes_
                     if(mes_ < 1) mes_ = 12
                    initial.setMes(mes_)

                }

            }
        }
// Botão '-' do ano
        Text {
            id: minAno
            x: 289
            y: 164
            color: "#6aac57"
            text: qsTr("-")
            font.pixelSize: 25
            MouseArea {
                 anchors.fill: parent
                onPressed: {parent.scale = 0.95}
                onReleased:
                {
                    parent.scale = 1.0;
                    --ano_
                    if(ano_ < 0) ano_ = 21
                    initial.setAno(ano_)

                }

            }
        }
// Botão '-' da hora
        Text {
            id: minHora
            x: 440
            y: 164
            width: 9
            height: 30
            color: "#6aac57"
            text: qsTr("-")
            font.pixelSize: 25
            MouseArea {
                 anchors.fill: parent
                onPressed: {parent.scale = 0.95}
                onReleased:
                {
                    parent.scale = 1.0;
                    --hora_
                     if(hora_ < 0) hora_ = 23
                    initial.setHora(hora_)
                }

            }
        }
// Botão '-' do minuto
        Text {
            id: minMin
            x: 593
            y: 164
            width: 9
            height: 30
            color: "#6aac57"
            text: qsTr("-")
            font.pixelSize: 25
            MouseArea {
                 anchors.fill: parent
                onPressed: {parent.scale = 0.95}
                onReleased:
                {
                    parent.scale = 1.0;
                    --minuto_
                    if(minuto_ < 0) minuto_ = 59
                    initial.setMinuto(minuto_)

                }

            }
        }
    //Valor mostrado do mes
        Text {
            id: month
            x: 163
            y: 168
            width: 39
            height: 29
            color: "#9ebd79"
            text: +mes_
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter

        }
 //Valor mostrado do ano
        Text {
            id: year
            x: 304
            y: 168
            width: 39
            height: 29
            color: "#9ebd79"
            text: ano_
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter

        }
 //Valor mostrado da hora
        Text {
            id: hour
            x: 455
            y: 168
            width: 39
            height: 29
            color: "#9ebd79"
            text: hora_
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter

        }
 //Valor mostrado do minuto
        Text {
            id: minute
            x: 608
            y: 168
            width: 39
            height: 29
            color: "#9ebd79"
            text: minuto_
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter


        }
 //Texto ajuste do alrme
        Text {
            id: identiTela1
            x: 13
            y: 242
            width: 306
            height: 32
            color: "#50b03d"
            text: qsTr("Ajuste do Alarme")
            font.pixelSize: 25

        }
 //botão de confirm o alarme
        Text {
            id: alrmOk
            x: 255
            y: 376
            width: 160
            height: 35
            color: "#6b9260"
            text: qsTr("Alarme Ok")
            font.pixelSize: 25
            MouseArea {
                anchors.rightMargin: 8
                anchors.bottomMargin: 0
                anchors.leftMargin: -8
                anchors.topMargin: 0
                 anchors.fill: parent
                 onPressed: {parent.scale = 0.95}
                onReleased:
                {
                    parent.scale = 1.0;
                    initial.alarmeOk()
                }

            }
        }
//botão de confirma da Hora
        Text {
            id: alrmOk1
            x: 255
            y: 201
            width: 160
            height: 35
            color: "#6b9260"
            text: qsTr("Data Ok")
            font.pixelSize: 25
            MouseArea {
                anchors.rightMargin: 8
                anchors.bottomMargin: 0
                anchors.leftMargin: -8
                anchors.topMargin: 0
                 anchors.fill: parent
                onPressed: {parent.scale = 0.95}
                onReleased:
                {
                    parent.scale = 1.0;
                    initial.dataOk()

                }

            }
        }
// Seta Voltar
        Text {
            id: voltar
            x: 27
            y: 14
            color: "#4598a3"
            text: qsTr("<---")
            font.pixelSize: 37
            MouseArea {
                 anchors.fill: parent
                onPressed: {parent.scale = 0.95}
                onReleased:
                {
                    parent.scale = 1.0;
                    root.state = "Inicializa"

                }

            }
        }
// Textominutos dormindo
        Text {
            id: miindor
            x: 40
            y: 291
            color: "#438ab8"
            text: qsTr("Minutos Dormindo")
            font.pixelSize: 20
        }
// Texto minutos Acordado
        Text {
            id: miindor1
            x: 465
            y: 291
            color: "#438ab8"
            text: qsTr("Minutos Acordado")
            font.pixelSize: 20
        }


// Botão do mais + Dormindo
        Text {
            id: maiDorB
            x: 156
            y: 336
            width: 46
            height: 19
            color: "#358fbd"
            text: qsTr("+")
            font.pixelSize: 20
            MouseArea {
                anchors.rightMargin: 13
                anchors.bottomMargin: -8
                anchors.leftMargin: -13
                anchors.topMargin: 8
                 anchors.fill: parent
                 onPressed: {parent.scale = 0.95}
                onReleased:
                {
                    parent.scale = 1.0;
                    initial.setTemDorm(1)

                }

            }
        }
// Botão do Menos - Dormindo
        Text {
            id: minDorb
            x: 57
            y: 336
            width: 36
            height: 19
            color: "#358fbd"
            text: qsTr("-")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
            MouseArea {
                 anchors.fill: parent
                onPressed: {parent.scale = 0.95}
                onReleased:
                {
                    parent.scale = 1.0;
                    initial.setTemDorm(2)

                }

            }
        }

// Botão do mais Acordado
        Text {
            id: maiAcorB
            x: 575
            y: 336
            width: 46
            height: 19
            color: "#358fbd"
            text: qsTr("+")
            font.pixelSize: 20
            MouseArea {
                anchors.rightMargin: 0
                anchors.bottomMargin: -11
                anchors.leftMargin: -10
                anchors.topMargin: 8
                anchors.fill: parent
                onPressed: {parent.scale = 0.95}
                onReleased:
                {
                    parent.scale = 1.0;
                    initial.setTempAcor(1)

                }

            }
        }
// Botão do menos Acordado
        Text {
            id: minAcorB
            x: 473
            y: 336
            width: 46
            height: 26
            color: "#358fbd"
            text: qsTr("-")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
            MouseArea {
                anchors.rightMargin: 0
                anchors.bottomMargin: -8
                anchors.leftMargin: 0
                anchors.topMargin: 8
                anchors.fill: parent
                onPressed: {parent.scale = 0.95}
                onReleased:
                {
                    parent.scale = 1.0;
                    initial.setTempAcor(2)

                }

            }
        }

        //recebe do c++ os valores a ser mostradona tela

        Connections{
              target:initial
              onDiaChanged:{
                 dia_ = initial.myDia;  // Dia
              }
        }

        Connections{
              target:initial
              onMesChanged:{
                 mes_ = initial.myMes; //Mês
              }
        }

        Connections{
              target:initial
              onAnoChanged:{

                 ano_ = initial.myAno ;//Ano
              }
        }

        Connections{
              target:initial
              onHoraChanged:{
                 hora_ = initial.myHora; //Hora
              }
        }

        Connections{
            target:initial
            onMinutoChanged:{
                minuto_ = initial.myMinuto;//Minuto

            }
        }

        //Escreve nos campos as datas e horas

        Text {
            id: day1  //Dia
            x: 28
            y: 168
            width: 39
            height: 29
            color: "#9ebd79"
            text: +dia_
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 25
        }

            //minutos dormindo
        Text {
            id: minDor
            x: 89
            y: 333
            width: 61
            height: 29
            color: "#9ebd79"
            text: +dorme
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 29
        }
        //Minutos acordado
        Text {
            id: mainDor1
            x: 514
            y: 333
            width: 61
            height: 29
            color: "#9ebd79"
            text: +acorda
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 29
        }

        //Recebe do c++ os valores do tempos de funcionamento
        Connections{
              target:initial
              onTempAcordachanged:{
                 acorda = initial.tempAcord; //Acordado
              }
        }

        Connections{
            target:initial
            onTempDormichanged:{
               dorme = initial.tempDorm;//Dormindo

            }
        }
}
}
