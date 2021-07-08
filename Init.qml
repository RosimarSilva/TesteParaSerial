import QtQuick 2.0

Item {
    id: chama
    property int temp: 45
     property int lvdt: 45
    property int press: 12
    property int flux: 24
    property int dif1: 67
    property int dif2: 26
    property int dia_: 19
    property int mes_: 06
    property int ano_: 2021
    property int hora_: 16
    property int minuto_: 23
    property string chama: "chama"
    Image {
        id: image
        x: 0
        y: 30
        source: "Telas/black.bmp"

        //Titulos dos sensores
        Text {
            id: sens_1
            x: 62
            y: 39
            width: 270
            height: 22
            color: "#a4e43c"
            text: "Sensor Diferencial"
            font.family: "Courier"
            elide: Text.ElideMiddle
            styleColor: "#97e465"
            font.pixelSize: 30
        }

        Text {
            id: sens_2
            x: 62
            y: 94
            width: 209
            height: 22
            color: "#a4e43c"
            text: "Sensor Desloc"
            font.pixelSize: 30
            styleColor: "#97e465"
            elide: Text.ElideMiddle
            font.family: "Courier"
        }

        Text {
            id: sens_p
            x: 62
            y: 158
            width: 218
            height: 22
            color: "#a4e43c"
            text: "Sensor Pressão"
            styleColor: "#97e465"
            font.pixelSize: 30
            elide: Text.ElideMiddle
            font.family: "Courier"
        }

        Text {
            id: sens_t
            x: 62
            y: 262
            width: 270
            height: 22
            color: "#a4e43c"
            text: "Sensor Temperatura"
            font.pixelSize: 30
            styleColor: "#97e465"
            elide: Text.ElideMiddle
            font.family: "Courier"
        }

        //Resultados dos sensores

        Text {
            id: resultS1
            x: 347
            y: 39
            width: 103
            height: 22
            color: "#a4e43c"
            text: +dif1
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            styleColor: "#97e465"
            elide: Text.ElideMiddle
            font.family: "Courier"
        }

        Text {
            id: resultS2
            x: 293
            y: 94
            width: 77
            height: 22
            color: "#a4e43c"
            text:+dif2
            styleColor: "#97e465"
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            elide: Text.ElideMiddle
            font.family: "Courier"
        }

        Text {
            id: resultSPressao
            x: 293
            y: 158
            width: 90
            height: 22
            color: "#a4e43c"
            text:+press
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            styleColor: "#97e465"
            elide: Text.ElideMiddle
            font.family: "Courier"
        }

        Text {
            id: resultSTemp
            x: 338
            y: 262
            width: 80
            height: 22
            color: "#a4e43c"
            text: +temp
            styleColor: "#97e465"
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            elide: Text.ElideMiddle
            font.family: "Courier"
        }

        Text {
            id: campoData
            x: 357
            y: 11
            width: 351
            height: 22
            color: "#a4e43c"
            text: "    /   /      |   :"
            styleColor: "#97e465"
            font.pixelSize: 30
            elide: Text.ElideMiddle
            font.family: "Courier"
        }

        // Data e Hora exibidos na tela principal

        Text {
            id: dia
            x: 387
            y: 11
            width: 35
            height: 22
            color: "#a4e43c"
            text: +dia_
            styleColor: "#97e465"
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            elide: Text.ElideMiddle
            font.family: "Courier"
        }

        Text {
            id: mes
            x: 440
            y: 11
            width: 29
            height: 22
            color: "#a4e43c"
            text: +mes_
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            styleColor: "#97e465"
            elide: Text.ElideMiddle
            font.family: "Courier"
        }

        Text {
            id: ano
            x: 488
            y: 11
            width: 63
            height: 22
            color: "#a4e43c"
            text: +ano_
            styleColor: "#97e465"
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            elide: Text.ElideMiddle
            font.family: "Courier"
        }

        Text {
            id: hora
            x: 615
            y: 11
            width: 30
            height: 22
            color: "#a4e43c"
            text: +hora_
            styleColor: "#97e465"
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            elide: Text.ElideMiddle
            font.family: "Courier"
        }

        Text {
            id: minuto
            x: 653
            y: 11
            width: 33
            height: 22
            color: "#a4e43c"
            text: +minuto_
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            styleColor: "#97e465"
            elide: Text.ElideMiddle
            font.family: "Courier"
        }

            // recebe do c++ os valores da data e hora
         Connections{
              target:initial
              onDiaChanged:{
                  dia_ = initial.myDia;
              }
        }

        Connections{
              target:initial
              onMesChanged:{
                 mes_ = initial.myMes;
              }
        }

        Connections{
              target:initial
              onAnoChanged:{

                 ano_ = initial.myAno ;
                  ano_ = ano_ + 2000
              }
        }

        Connections{
              target:initial
              onHoraChanged:{
                 hora_ = initial.myHora;
              }
        }

        Connections{
              target:initial
              onMinutoChanged:{
                 minuto_ = initial.myMinuto;

              }
        }

        Connections{
              target:initial
              onSens1Changed:{
                 dif1 = initial.sens1;

              }
        }
        Connections{
              target:initial
              onSens2Changed:{
                 dif2 = initial.sens2;

              }
        }
        Connections{
              target:initial
              onSens3Changed:{
                //  console.log("chama")
                 press = initial.sens3;

              }
        }
        Connections{
            target:initial
            onSens4Changed:{
                temp = initial.sens4;

            }
        }
        Connections{
            target:initial
            onSens5Changed:{
                lvdt = initial.sens5;

            }
        }

        // Titulos e botões  dos acionamentos dos Leds
        Text {
            id: led1
            x: 440
            y: 74
            width: 55
            height: 21
            color: "#71d83e"
            text: qsTr("Led1")
            font.pixelSize: 20
            MouseArea {
               anchors.fill: parent
                onPressed: {parent.scale = 0.95}
                onReleased:
                {
                    parent.scale = 1.0;
                    initial.setLed(0);

                }
            }
        }

        Text {
            id: led3
            x: 440
            y: 186
            width: 55
            height: 21
            color: "#71d83e"
            text: qsTr("Led3")
            font.pixelSize: 20
            MouseArea {
               anchors.fill: parent
                onPressed: {parent.scale = 0.95}
                onReleased:
                {
                    parent.scale = 1.0;
                     initial.setLed(2);

                }
            }
        }

        Text {
            id: led2
            x: 440
            y: 129
            width: 55
            height: 21
            color: "#71d83e"
            text: qsTr("Led2")
            font.pixelSize: 20
            MouseArea {
              anchors.fill: parent
                onPressed: {parent.scale = 0.95}
                onReleased:
                {
                    parent.scale = 1.0;
                     initial.setLed(1);

                }
            }
        }

        Text {
            id: led4
            x: 586
            y: 72
            width: 55
            height: 26
            color: "#71d83e"
            text: qsTr("Led4")
            font.pixelSize: 20
            MouseArea {
                anchors.fill: parent
                onPressed: {parent.scale = 0.95}
                onReleased:
                {
                    parent.scale = 1.0;
                     initial.setLed(3);

                }
            }
        }

        Text {
            id: led5
            x: 586
            y: 127
            width: 55
            height: 26
            color: "#71d83e"
            text: qsTr("Led5")
            font.pixelSize: 20
            MouseArea {
               anchors.fill: parent
                onPressed: {parent.scale = 0.95}
                onReleased:
                {
                    parent.scale = 1.0;
                     initial.setLed(4);

                }
            }
        }

        Text {
            id: led6
            x: 586
            y: 181
            width: 55
            height: 26
            color: "#71d83e"
            text: qsTr("Led6")
            font.pixelSize: 20
            MouseArea {
               anchors.fill: parent
                onPressed: {parent.scale = 0.95}
                onReleased:
                {
                    parent.scale = 1.0;
                     initial.setLed(5);

                }
            }
        }

            //Titulo e botão  de solicitação de cominucação manual
        Text {
            id: text1
            x: 151
            y: 349
            width: 430
            height: 48
            color: "#87d85e"
            text: qsTr("Solicitar Comunicação com o Pc")
            font.pixelSize: 30
            MouseArea {
                 anchors.fill: parent
                onPressed: {parent.scale = 0.95}
                onReleased:
                {
                    parent.scale = 1.0;
                    initial.initSerail();// envia parao c++

                }

            }
        }

        //Muda de tela seta
        Text {
            id: go
            x: 603
            y: 272
            color: "#4b7d9d"
            text: qsTr("--->")
            font.pixelSize: 32
            MouseArea {
                anchors.fill: parent
                onPressed: {parent.scale = 0.95}
                onReleased:
                {
                    parent.scale = 1.0;
                    root.state = "Calendario"

                }

            }
        }

        //Estrutura de mudanças de tela
        Image {
            id: func
            x: 211
            y: 303
            source: "Telas/func.bmp"
            states: [
                  State {
                      name: "Funcionamento"
                  },
                  State {
                      name: "Espera"
                  }
             ]

                 Image {
                     id: func1
                     source: "Telas/func.bmp"
                     visible: func.state ==  "Funcionamento"
                  }
                 Image {
                     id: func2
                     source: "Telas/espera.bmp"
                     visible: func.state ==  "Espera"
                  }
        }

        //Recebe do c++ para mudança de estado de funcionamento
        Connections{
            target:initial
            onEsperaChanged:{
               func.state = "Espera";

            }
        }

            Connections{  //enquanto não há white balance feito fica piscando
                target:initial
                onFuncChanged:{
                    func.state =  "Funcionamento";
                }
            }
//Titulo do sensor lvdt
            Text {
                id: sens_lvdt
                x: 62
                y: 213
                width: 218
                height: 22
                color: "#a4e43c"
                text: "Sensor LVDT"
                elide: Text.ElideMiddle
                font.pixelSize: 30
                font.family: "Courier"
                styleColor: "#97e465"
            }
//Resultado do sensor lvdt
            Text {
                id: resultLvdt
                x: 293
                y: 213
                width: 90
                height: 22
                color: "#a4e43c"
                text: +lvdt
                elide: Text.ElideMiddle
                font.pixelSize: 30
                horizontalAlignment: Text.AlignHCenter
                font.family: "Courier"
                styleColor: "#97e465"
            }


    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
