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

        Text {
            id: miindor
            x: 40
            y: 291
            color: "#438ab8"
            text: qsTr("Minutos Dormindo")
            font.pixelSize: 20
        }

        Text {
            id: miindor1
            x: 465
            y: 291
            color: "#438ab8"
            text: qsTr("Minutos Acordado")
            font.pixelSize: 20
        }



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

        //recebe do c++ onumeros de horas da lampada
        Connections{  //enquanto não há white balance feito fica piscando
              target:initial
              onDiaChanged:{
                 dia_ = initial.myDia;
              }
        }

        Connections{  //enquanto não há white balance feito fica piscando
              target:initial
              onMesChanged:{
                 mes_ = initial.myMes;
              }
        }

        Connections{  //enquanto não há white balance feito fica piscando
              target:initial
              onAnoChanged:{

                 ano_ = initial.myAno ;
              }
        }

        Connections{  //enquanto não há white balance feito fica piscando
              target:initial
              onHoraChanged:{
                 hora_ = initial.myHora;
              }
        }

        Connections{  //enquanto não há white balance feito fica piscando
            target:initial
            onMinutoChanged:{
                minuto_ = initial.myMinuto;

            }
        }

        Text {
            id: day1
            x: 34
            y: 159
            width: 39
            height: 29
            color: "#9ebd79"
            text: +dia_
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 25
        }

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

        Connections{  //enquanto não há white balance feito fica piscando
              target:initial
              onTempAcordachanged:{
                 acorda = initial.tempAcord;
              }
        }

        Connections{  //enquanto não há white balance feito fica piscando
            target:initial
            onTempDormichanged:{
                //  console.log("chama")
               dorme = initial.tempDorm;

            }
        }
}
}
