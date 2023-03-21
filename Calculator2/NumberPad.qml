import QtQuick 2.15

Item{

    id: root
    property string query: ""
    property string operand1: ""
    property string operand2: ""
    property string operator: ""

    property int fontSize: 24

    property string fromColor: "white"
    property string toColor: "gray"

    property var numberPadValues:
        ["7","8","9","/","4","5","6","*","1","2","3","-","0",".","=","+"]

    Flow{
        anchors.centerIn: parent
        height: parent.height
        width: parent.width
        Repeater{
            model: numberPadValues
            Rectangle{
                id:button
                color: fromColor
                width: parent.width/4
                height: parent.height/4
                border.color: "black"
                Text{
                    anchors.centerIn: parent
                    text: numberPadValues[index]
                    font.pixelSize: fontSize
                }

                MouseArea{
                    id: buttonArea
                    anchors.fill: parent

                    onClicked: {
                        parent.color = toColor
                        handle(index)
                    }
                }

                Behavior on color{
                    SequentialAnimation{
                        ColorAnimation{
                            to: toColor
                            duration: 200
                        }
                        ColorAnimation{
                            to: fromColor
                            duration: 100
                        }

                    }
                }

            }

        }

    }

    function handle(index){
        let curr = numberPadValues[index]

            if (curr === "="){
                if (operand2!=""){
                    evaluate()
                }
            }

            else if (curr === "+" ||curr === "-" ||curr === "*" ||curr === "/"){
                if (operand1!==""){
                    if (operator!="" && operand2){
                        evaluate()
                    }
                    operator = curr
                    //query += curr
                }
            }
            else{
                if (operator===""){
                    operand1+=curr
                }
                else{
                    operand2+=curr
                }
                //query += curr
            }
        query = operand1+" "+operator+" "+operand2
    }

    function evaluate(){
        switch(operator){
            case "+":
                query = parseFloat(operand1) + parseFloat(operand2)
                operand1 = parseFloat(operand1) + parseFloat(operand2)
                operand2 = ""
                operator=""
                break;
            case "-":
                query = parseFloat(operand1) - parseFloat(operand2)
                operand1 = parseFloat(operand1) - parseFloat(operand2)
                operand2 = ""
                operator=""
                break;
            case "*":
                query = parseFloat(operand1) * parseFloat(operand2)
                operand1 = parseFloat(operand1) * parseFloat(operand2)
                operand2 = ""
                operator=""
                break;
            case "/":
                query = parseFloat(operand1) / parseFloat(operand2)
                operand1 = parseFloat(operand1) / parseFloat(operand2)
                operand2 = ""
                operator=""
                break;
        }
    }

}


