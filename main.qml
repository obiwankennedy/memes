import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls 2.5

Window {
    id: win
    visible: true
    width: 1600
    height: 1600
    color: "green"
    title: qsTr("Wheel of the magic cock")
    property bool start: false
    signal currentItemChanged()

    Button {
        text: "start"
        onClicked: win.start = true
    }

    Timer{
        id: timer
        interval: 500
        running: win.start
        repeat: Math.abs(wheel.rotation) < 344.91 ? true : false
        onTriggered: {
            wheel.rotation -= 0.1
            console.log("rot: "+wheel.rotation)
            //timer.start()
        }
        //triggeredOnStart: true
    }

   //Component.onCompleted: timer.start()

    Item {
        id: wheel
        width: 1600
        height: 1600
        rotation: 15
        y:-80
        scale: 0.8
        onRotationChanged: {
            win.currentItemChanged();
        }

        /*Image {
            source:"qrc:/resources/background.png"
            id:background
            x:0 ; y:0
            width:1600
            height:1600
        }*/
        Rectangle {
            color: "black"
            radius: parent.width/2
            anchors.fill: parent
            scale:1.01
        }
        Image {
            source:"qrc:/resources/arya_stark.png"
            id:arya_stark
            x:408 ; y:9
            width:575
            height:673
        }
        Image {
            source:"qrc:/resources/lyannamormontg.png"
            id:lyannamormontg
            x:71 ; y:679
            width:864
            height:797
        }
        Image {
            source:"qrc:/resources/white_king.png"
            id:white_king
            x:465 ; y:774
            width:781
            height:813
        }
        Image {
            source:"qrc:/resources/samwell_tarly.png"
            id:samwell_tarly
            x:250 ; y:876
            width:758
            height:724
        }
        Image {
            source:"qrc:/resources/cersei_lannister.png"
            id:cersei_lannister
            x:788 ; y:782
            width:695
            height:696
        }
        Image {
            source:"qrc:/resources/brienne.png"
            id:brienne
            x:6 ; y:650
            width:700
            height:658
        }
        Image {
            source:"qrc:/resources/sansa.png"
            id:sansa
            x:0 ; y:0
            width:800
            height:1243
        }
        Image {
            source:"qrc:/resources/drogon.png"
            id:drogon
            x:0 ; y:117
            width:696
            height:571
        }
        Image {
            source:"qrc:/resources/daenerys.png"
            id:daenerys
            x:752 ; y:7
            width:439
            height:619
        }
        Image {
            source:"qrc:/resources/melisandre.png"
            id:melisandre
            x:761 ; y:115
            width:723
            height:576
        }
        Image {
            source:"qrc:/resources/missandei.png"
            id:missandei
            x:868 ; y:406
            width:727
            height:397
        }
        Image {
            source:"qrc:/resources/yara_grayjoy.png"
            id:yara_grayjoy
            x:945 ; y:761
            width:655
            height:496
        }

        Image {
            source:"qrc:/resources/layer.png"
            id:layer
            x:0 ; y:0
            width:1600
            height:1600
        }
    }
    Canvas {
        x: 750
        y: 510
        width: 100
        height: 100
        onPaint: {
            var arrow = 50
            var ctx = getContext("2d")
            ctx.lineWidth = 4;
            ctx.beginPath()
            ctx.moveTo(arrow,2)
            ctx.lineTo(1.5*arrow,arrow)
            ctx.lineTo(0.5*arrow,arrow)
            ctx.closePath()
            ctx.stroke();
            ctx.fillStyle = "black"
            ctx.fill();
        }
    }
    Image {
        source:"qrc:/resources/podrick.png"
        id:podrick
        x:580 ; y:520
        width:500
        scale: 0.8
        height:434
        onXChanged: {
            console.log("X change:"+x)
        }

        MouseArea {
            anchors.fill: parent

            onMouseXChanged: {
                podrick.x += mouseX;
            }
            onMouseYChanged: {
                podrick.y += mouseY;
            }
        }
    }
}
