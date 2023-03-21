import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 500
    height: 600
    visible: true
    title: qsTr("Calculator")

    Rectangle{
        id: contents
        anchors{
            fill: parent
            margins: 10
        }


        CalculatorScreen{
            id: display
            text: numberPad.query
        }

        Rectangle{
            id: clearButton
            color: "white"
            height: 50
            anchors{
                left: parent.left
                right: parent.right
                top: display.bottom
                leftMargin: 20
                rightMargin: 20
                topMargin: 20
            }
            border.color: "black"
            Text{
                anchors.centerIn: parent
                text: "AC"
                font.pixelSize: 24
            }

            Behavior on color{
                SequentialAnimation{
                    ColorAnimation{
                        to: "gray"
                        duration: 200
                    }
                    ColorAnimation{
                        to: "white"
                        duration: 100
                    }

                }
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    parent.color= "gray"
                    numberPad.operand1= ""
                    numberPad.operand2= ""
                    numberPad.operator= ""
                    numberPad.query= ""
                }
            }
        }

        NumberPad{
            id: numberPad
            fromColor: fromColor
            toColor: toColor
            anchors{
                top: clearButton.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
                leftMargin: 20
                rightMargin: 20
                bottomMargin: 20
            }

            //onOperand1Changed: console.log("Operand1: "+operand1)
            //onOperand2Changed: console.log("Operand2: "+operand2)
        }
    }

}
