import QtQuick 2.9
import QtQuick.Window 2.2
import UsbReceiver 1.0

Window {
    visible: true
  //  visibility: Window.FullScreen
    width: 800
    height: 480
    color: "black"

    Rectangle{
        id:root

        UsbReceiver{id:initial}

         Init{}
        //TelaPreta{}
       // TelaCamera{}
       // USersConfig{}

        states: [
            State {
                name: "Inicializa"
             },
            State {
                name: "Calendario"
             }


        ]

        Init {
            id: init
            anchors.fill: parent
            visible: root.state == "Inicializa"
        }

        Calendario {
            id: calendaro
            anchors.fill: parent
            visible: root.state == "Calendario"
        }
    }
}

