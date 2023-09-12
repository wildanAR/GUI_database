import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Extras.Private 1.0


import QtQuick 2.0
import QtCharts 2.1

Rectangle {
    id: root
    visible: true
    width: 1000
    height: 800
    color: "#1f4f16"
    function list_id_qml(text) {
        n7.model = text
    }
    
    
    Rectangle {
        id:listID
        visible: false
        width: 200
        height: 300
        color:'yellow'
        anchors {
            left: parent.left
            top: parent.top
            leftMargin: 50
            topMargin: 50
        }
        ListView {
            id:n7
            anchors.fill: parent
            model: 1
            spacing: 10
            anchors {
                left: parent.left
                leftMargin: 20
                top: parent.top 
                topMargin: 20
            }
            delegate: RoundButton {
                width: 100
                radius: 10
                height: 50
                anchors {
                    topMargin: 20
                }
                Text {
                    id:n8
                    text: model.display
                    focus: true
                    anchors.centerIn: parent
                }
                onClicked: {
                    console.log(("button clicked:",n8.text))
                }
            }
        }
    }
    Rectangle {
        id:buttonmini
        width: 100
        height: 50
        radius: 50
        color: '#3CB371'
        anchors {
            right: buttonexit.left
            rightMargin: 30
            top: buttonexit.top
        }
        MouseArea {
            anchors.fill: parent
            onClicked:{
                Aplikasi.minimize('minimize')
            }
        }
        Image {
            source: "minimize.png"
            anchors.centerIn: parent
            width: 30
            height: 30
        }
    }
    // BUTTON EXIT
    Rectangle {
        id: buttonexit
        width: 100
        height: 50
        radius: 50 // customize the radius here
        color: '#3CB371'
        anchors {
            right: parent.right
            rightMargin: 50
            top: parent.top
            topMargin: 50
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                Aplikasi.quit('quit now')
            }
        }
        Image {
            source: "logout.png"
            anchors.centerIn: parent
            width: 30
            height: 30
        }
    }

    Rectangle {
        id: btngudang
        width: 100
        height: 50
        radius: 50 // customize the radius here
        color: '#3CB371'
        anchors.centerIn: parent
        MouseArea {
            anchors.fill: parent
            onClicked: {
                btnpull.visible = false
                btnpush.visible = false
                btngudang.visible = false
                btndebit.visible = false
                buttonexit.visible = false
                txtkode.visible = true
                kodeprdk.visible = true
                buttonbckgdg.visible = true
                namaprdk.visible = true
                boxnama.visible = true
                stokproduk.visible = true 
                boxstok.visible = true
                hargabelidus.visible = true
                boxhrgdus.visible = true
                hargajualdus.visible = true
                boxjualdus.visible = true 
                hargajualpcs.visible = true
                boxjualpcs.visible = true
                etalaseproduk.visible = true 
                boxetalase.visible = true 
            }
        }
         Text {
                text: "Gudang"
                color: "black"
                font.pixelSize: 20
                anchors.centerIn: parent
                
            }
    }
    Rectangle {
        id: btndebit
        width: 100
        height: 50
        radius: 50 // customize the radius here
        color: '#3CB371'
        anchors {
            top: btngudang.bottom
            right: btngudang.right
            topMargin: 20
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                // console.log("blm ada")
                debit.visible = true
                buttonbckdebit.visible = true
                boxjmlh.visible = true
                boxnamadebit.visible = true
                boxhrgdebit.visible = true
                buttonexit.visible = false
                btngudang.visible = false
                btndebit.visible = false
                btnpull.visible = false
                btnpush.visible = false
                
            }
        }
         Text {
                text: "Penjualan"
                color: "black"
                font.pixelSize: 20
                anchors.centerIn: parent
            }
    }
    // Rectangle {
    //     id: btnjual
    //     width: 100
    //     height: 50
    //     radius: 50 // customize the radius here
    //     color: '#3CB371'
    //     anchors {
    //         top: btndebit.bottom
    //         right: btndebit.right
    //         topMargin: 20
    //     }
    //     MouseArea {
    //         anchors.fill: parent
    //         onClicked: {
    //             console.log("blm ada")
    //             buttonbckjual.visible = true
    //             listID.visible = true
    //             debit.visible = false
    //             buttonbckdebit.visible = false
    //             boxjmlh.visible = false
    //             boxnamadebit.visible = false
    //             boxhrgdebit.visible = true
    //             buttonexit.visible = false
    //             btngudang.visible = false
    //             btndebit.visible = false
    //             btnjual.visible = false
                
                
    //         }
    //     }
    //      Text {
    //             text: "Debit"
    //             color: "black"
    //             font.pixelSize: 20
    //             anchors.centerIn: parent
    //         }
    // }

    Rectangle {
        id:debit
        visible: false
        width: 1000
        height: 800
        color: "#1f4f16"

        Rectangle {
            id:buttonutang
            width: 100
            height: 50
            radius: 50
            color: '#3CB371'
            anchors {
                left:boxhrgdebit.left
                bottom: showutang.bottom
            }
            Text {
                text: "Selesai"
                color: "black"
                font.pixelSize: 20
                anchors.centerIn: parent
            }
            MouseArea {
                id:mouseareautang
                anchors.fill: parent
                onClicked: {
                    // Aplikasi.jmlhprdk(txtjmlh.text)
                    textfieldutang.text = ""

                }
            }
        }
        Rectangle {
            id: btnselesaiproduk
            width: 100
            height: 50
            radius: 50
            color: '#3CB371'
            anchors {
                top: boxnamadebit.bottom
                topMargin: 30
                left: boxnamadebit.left
                leftMargin: 150
            }
            Text {
                text: "Selesai"
                color: "black"
                font.pixelSize: 20
                anchors.centerIn: parent
            }
            MouseArea {
                id:mouseareadebit
                anchors.fill: parent
                onClicked: {
                    Aplikasi.jmlhprdk(txtjmlh.text)
                    Aplikasi.namaprdk(txtnamadebit.text)
                    Aplikasi.hrgproduk(txthrgdebit.text)
                    Aplikasi.kaskeluar(txtkaskeluar.text)
                    txtjmlh.text = ""
                    txthrgdebit.text = ""
                    txtnamadebit.text = ""
                    txtkaskeluar.text = ""
                }
            }

        }
        Rectangle {
            id:boxjmlh
            visible: false
            width:200
            height: 40
            color: "white"
            anchors {
                top: parent.top
                left: parent.left
                topMargin: 200
                leftMargin: 50
            }
            Text {
                font.pixelSize: 15;
                font.bold: true 
                focus: true 
                text: "Nama barang terjual:"
                anchors {
                    left: txtjmlh.left
                    bottom: txtjmlh.top
                    bottomMargin: 10
                }
            }
            TextField {
                id:txtjmlh
                font.pixelSize: 15; 
                font.bold: true
                focus: true 
                anchors.fill : parent
                placeholderText : "Nama produk"
                font.family : "Lato"
                cursorPosition : 10
                onAccepted: {
                    txtnamadebit.forceActiveFocus()
                    // Aplikasi.jmlhprdk(txtjmlh.text)
                }
        }
        }
        Rectangle {
            id:boxhargakeluar
            visible: true
            width:200
            height:40
            color: "white"
            anchors {
                top: boxkaskeluar.top
                left: boxhrgdebit.left
            }
            Text {
                font.pixelSize: 15
                font.bold: true 
                focus: true 
                text: "Harga Belanjaan: "
                anchors {
                    left: parent.left
                    bottom: parent.top
                    bottomMargin: 10
                }
            }
            TextField {
                id:txthargakeluar
                font.pixelSize: 15; 
                font.bold: true
                focus: true
                anchors.fill : parent
                placeholderText : "Harga Produk"
                font.family : "Lato"
                cursorPosition : 10
                onAccepted: {
                    txtjmlh.forceActiveFocus()
                    Aplikasi.jmlhprdk(txtjmlh.text)
                    Aplikasi.namaprdk(txtnamadebit.text)
                    Aplikasi.hrgproduk(txthrgdebit.text)
                    Aplikasi.kaskeluar(txtkaskeluar.text)
                    Aplikasi.jumlahkeluar(txtjumlahkeluar.text)
                    Aplikasi.hargakeluar(txthargakeluar.text)
                    txtjmlh.text = ""
                    txthrgdebit.text = ""
                    txtnamadebit.text = ""
                    txtkaskeluar.text = ""
                    txtjumlahkeluar.text = ""
                    txthargakeluar.text = ""
                    // txtkaskeluar.forceActiveFocus()
                    // txtkaskeluar.text = ""
                    
                    // txthrgdebit.forceActiveFocus()
                    // Aplikasi.namaprdk(txtnamadebit.text)

                }
            }
        }
        
        Rectangle {
            id: boxjumlahbelanja
            visible: true
            width: 200
            height: 40
            color: "white"
            anchors {
                top: boxkaskeluar.top
                left: boxnamadebit.left
            }
            Text {
                font.pixelSize: 15
                font.bold: true 
                focus: true 
                text: "Jumlah Belanjaan: "
                anchors {
                    left: parent.left
                    bottom: parent.top
                    bottomMargin: 10
                }
            }
            TextField {
                id:txtjumlahkeluar
                font.pixelSize: 15; 
                font.bold: true
                focus: true
                anchors.fill : parent
                placeholderText : "Jumlah Produk"
                font.family : "Lato"
                cursorPosition : 10
                onAccepted: {
                    txthargakeluar.forceActiveFocus()

                }
            }
        }
        Text {
            id:tulisanutang
            text: "Utang:"
            color: "white"
            font.pixelSize: 15
            font.bold: true
            focus:true
            anchors {
                left: showutang.left
                bottom: showutang.top
                bottomMargin: 10
            }
        }
        Rectangle {
        id:showutang
        color: "white"
        width: 200
        height: 40
        visible: boxjmlh.visible
        anchors {
            left: boxkaskeluar.left
            top: parent.top
            topMargin: 50
        }
        Text {
            id:texthutang
            color: "black"
            font.pixelSize: 15
            font.bold: true
            text: 'hutanngg'
            anchors.fill: parent
            anchors.centerIn: parent
        }
        }
        Text {
            id:textbayarutang
            color: "white"
            font.pixelSize: 15
            font.bold: true
            text:"Utang Dibayar:"
            anchors {
                left: bayarutang.left
                top: tulisanutang.top
            }
        }
        Rectangle {
            id:bayarutang
            color: "white"
            width: 200
            height: 40
            visible: showutang.visible
            anchors {
                left: boxnamadebit.left
                bottom: showutang.bottom
            }
            TextField {
                id:textfieldutang
                font.pixelSize: 15; 
                font.bold: true
                focus: true
                anchors.fill : parent
                placeholderText : "Utang Dibayar"
                font.family : "Lato"
                cursorPosition : 10
                onAccepted: {
                    Aplikasi.slothutang(textfieldutang.text)
                    buttonutang.forceActiveFocus()
                    textfieldutang.text = ""
                    textfieldutang.forceActiveFocus()
                    // Aplikasi.jmlhprdk(txtjmlh.text)
                    // Aplikasi.namaprdk(txtnamadebit.text)
                    // Aplikasi.hrgproduk(txthrgdebit.text)
                    // Aplikasi.kaskeluar(txtkaskeluar.text)
                    // txtjmlh.text = ""
                    // txthrgdebit.text = ""
                    // txtnamadebit.text = ""
                    // txtkaskeluar.text = ""
                }
            }
        }
        Rectangle {
            id:boxkaskeluar
            visible: true
            width:200
            height: 40 
            color: "white"
            anchors {
                top: btnselesaiproduk.bottom
                left:boxjmlh.left
                topMargin: 30
            }
            Text {
                font.pixelSize: 15
                font.bold: true 
                focus: true 
                text: "nama belanjaan: "
                anchors {
                    left: parent.left
                    bottom: parent.top
                    bottomMargin: 10
                }
            }
            TextField {
                id:txtkaskeluar
                font.pixelSize: 15; 
                font.bold: true
                focus: true
                anchors.fill : parent
                placeholderText : "Nama produk"
                font.family : "Lato"
                cursorPosition : 10
                onAccepted: {
                    txtjumlahkeluar.forceActiveFocus()
                    // Aplikasi.jmlhprdk(txtjmlh.text)
                    // Aplikasi.namaprdk(txtnamadebit.text)
                    // Aplikasi.hrgproduk(txthrgdebit.text)
                    // Aplikasi.kaskeluar(txtkaskeluar.text)
                    // txtjmlh.text = ""
                    // txthrgdebit.text = ""
                    // txtnamadebit.text = ""
                    // txtkaskeluar.text = ""
                }
            }
            
        }
        Rectangle {
            id:boxnamadebit
            visible: false
            width:200
            height: 40
            color: "white"
            anchors {
                top: boxjmlh.top
                left: boxjmlh.right
                leftMargin: 30
            }
            Text {
                font.pixelSize: 15;
                font.bold: true 
                focus: true 
                text: "Jumlah Barang Terjual:"
                anchors {
                    left: txtnamadebit.left
                    bottom: txtnamadebit.top
                    bottomMargin: 10
                }
            }
            TextField {
                id:txtnamadebit
                font.pixelSize: 15; 
                font.bold: true
                focus: true
                anchors.fill : parent
                placeholderText : "Jumlah produk"
                font.family : "Lato"
                cursorPosition : 10
                onAccepted: {
                    txthrgdebit.forceActiveFocus()
                    // Aplikasi.namaprdk(txtnamadebit.text)

                }
            }
        }
        Rectangle {
            id:boxhrgdebit
            visible: false
            width:200
            height: 40
            color: "white"
            anchors {
                top: boxjmlh.top
                left: boxnamadebit.right
                leftMargin: 30
            }
            Text {
                font.pixelSize: 15;
                font.bold: true 
                focus: true 
                text: "Harga Barang Terjual:"
                anchors {
                    left: txthrgdebit.left
                    bottom: txthrgdebit.top
                    bottomMargin: 10
                }
            }
            TextField {
                id:txthrgdebit
                font.pixelSize: 15; 
                font.bold: true
                focus: true
                anchors.fill : parent
                placeholderText : "Harga produk"
                font.family : "Lato"
                cursorPosition : 10
                onAccepted: {
                    txtkaskeluar.forceActiveFocus()
                    // Aplikasi.jmlhprdk(txtjmlh.text)
                    // Aplikasi.namaprdk(txtnamadebit.text)
                    // Aplikasi.hrgproduk(txthrgdebit.text)
                    // Aplikasi.kaskeluar(txtkaskeluar.text)
                    // txtjmlh.text = ""
                    // txthrgdebit.text = ""
                    // txtnamadebit.text = ""
                    // txtkaskeluar.text = ""
                }
        }
        }
        Rectangle {
            id: buttonbckdebit
            width: 100
            height: 50
            visible:false
            radius: 50 // customize the radius here
            color: '#3CB371'
            anchors {
                right: parent.right
                rightMargin: 50
                top: parent.top
                topMargin: 50
            }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                btnpull.visible = true
                btnpush.visible = true
                btngudang.visible = true 
                btndebit.visible = true
                buttonexit.visible = true
                debit.visible = false
                // console.log("adaaa")
            }
        }
        Image {
            source: "logout.png"
            anchors.centerIn: parent
            width: 30
            height: 30
        }
    }

    }
    
    function namaproduk(text) {
        n1.text = text;
        }
    function produk1(text) {
        n2.text = text;
    }
    function produk2(text) {
        n3.text = text;
    }
    function produk3(text) {
        n4.text = text;
    }
    function produk4(text) {
        n5.text = text;
    }
    function produk5(text) {
        n6.text = text;
    }
    function pushtext(text) {
        txtpush.text = text;
        if (txtpush.text === "tidak ada perubahan") {
            txtpushgit.color = 'red';
            }
        else (txtpushgit.color = "yellow")
    }
    function tampilanHutang(text) {
        texthutang.text = text;
    }


    Text {
        id:etalaseproduk
        text: "Jumlah produk di Etalase :"
        font.pixelSize: 15
        font.bold: true 
        visible: false
        color: "white"
        font.family: "Lato"
        anchors {
            left: boxhrgdus.left
            top: boxhrgdus.bottom
            topMargin: 30 
        }
    }

    Rectangle {
        id: boxetalase
        visible: false
        width:200
        height: 40
        color: "white"
        anchors {
            top: etalaseproduk.bottom
            left: etalaseproduk.left
            topMargin: 10
        }
        Text {
            id: n6
            font.pixelSize: 15
            font.bold: true
            focus: true 
            text: ""
            font.family: "Lato"
        }
    }

    Text {
        id:hargajualpcs
        text: "Harga Jual per Pcs :"
        font.pixelSize: 15
        font.bold: true 
        color: "white"
        visible: false
        font.family: "Lato"
        anchors {
            left: boxnama.left
            top: boxnama.bottom
            topMargin: 30 
        }
    }

    Rectangle {
        id: boxjualpcs
        visible: false
        width:200
        height: 40
        color: "white"
        anchors {
            top: hargajualpcs.bottom
            left: hargajualpcs.left
            topMargin: 10
        }
        Text {
            id: n5
            font.pixelSize: 15
            font.bold: true
            focus: true 
            text: ""
            font.family: "Lato"
        }
    }

    Text {
        id:hargajualdus
        text: "Harga Jual per Dus:"
        font.pixelSize: 15
        font.bold: true 
        visible: false
        color: "white"
        font.family: "Lato"
        anchors {
            left: boxstok.left
            top: boxstok.bottom
            topMargin: 30
        }
    }

    Rectangle {
        id: boxjualdus
        visible: false
        width:200
        height: 40
        color: "white"
        anchors {
            top: hargajualdus.bottom
            left: hargajualdus.left
            topMargin: 10
        }
        Text {
            id: n4
            font.pixelSize: 15
            font.bold: true
            focus: true 
            text: ""
            font.family: "Lato"
        }
    }

    Text {
        id:hargabelidus
        text: "Harga Beli per Dus:"
        font.pixelSize: 15
        font.bold: true 
        visible: false
        color: "white"
        font.family: "Lato"
        anchors {
            left: boxstok.right
            leftMargin: 30
            top: stokproduk.top
        }
    }

    Rectangle {
        id: boxhrgdus
        visible: false
        width:200
        height: 40
        color: "white"
        anchors {
            top: stokproduk.bottom
            left: hargabelidus.left
            topMargin: 10
        }
        Text {
            id: n3
            font.pixelSize: 15
            font.bold: true
            focus: true 
            text: ""
            font.family: "Lato"
        }
    }

    Text {
        id: stokproduk
        text: "jumlah stok gudang:"
        font.pixelSize: 15
        font.bold: true
        focus: true
        color: "white"
        visible: false
        font.family: "Lato"
        anchors {
            left: boxnama.right
            top: namaprdk.top
            leftMargin: 30
        }
    }

    Rectangle {
        id: boxstok
        visible: false
        width:200
        height: 40
        color: "white"
        anchors {
            top: stokproduk.bottom
            left: stokproduk.left 
            topMargin: 10
        }
        Text {
            id: n2
            font.pixelSize: 15
            font.bold: true
            focus: true 
            text: ""
            font.family: "Lato"
        }
    }
    Text {
        id: namaprdk
        font.pixelSize: 15
        font.bold: true
        focus: true
        color: "white"
        visible: false
        text: "Nama Produk:"
        font.family: "Lato"
        anchors {
            top: kodeprdk.bottom
            left: kodeprdk.left
            topMargin: 100
        }
    }
    Rectangle {
        id:boxnama
        visible: false
        width: 200 
        height: 40
        color: 'white'
        anchors {
            top: namaprdk.bottom
            left: namaprdk.left
            topMargin: 10
        }
        Text {
            id: n1
            font.pixelSize: 15
            font.bold: true
            focus: true
            text: ""
            font.family: "Lato"
        } 
    }
    
    Text {
        id: txtkode
        font.pixelSize: 15
        font.bold: true
        focus: true
        visible: false
        color: "white"
        text: "Masukkan ID produk:"
        font.family: "Lato"
        anchors {
            top: parent.top
            topMargin: 50
            left: parent.left
            leftMargin: 50
        }
    }

    Rectangle {
        id:kodeprdk
        visible:false
        width: 200
        height: 40
        color: '#3CB371'
        anchors {
            left: txtkode.left
            top: txtkode.bottom
            topMargin: 10
        }
        TextField {
            id:txtprdk
            font.pixelSize: 15; 
            font.bold: true
            focus: true
            anchors.fill : parent
            placeholderText : "ID Produk"
            font.family : "Lato"
            cursorPosition : 10
            onAccepted: {
                Aplikasi.receiveid(txtprdk.text)
                txtprdk.text = ""
            }
        }
    }
    Rectangle {
        id: buttonbckgdg
        width: 100
        height: 50
        visible:false
        radius: 50 // customize the radius here
        color: '#3CB371'
        anchors {
            right: parent.right
            rightMargin: 50
            top: parent.top
            topMargin: 50
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                btnpull.visible = true
                btnpush.visible = true
                btngudang.visible = true
                btndebit.visible = true
                buttonexit.visible = true
                txtkode.visible = false
                kodeprdk.visible = false
                buttonbckgdg.visible = false
                namaprdk.visible = false
                boxnama.visible = false 
                stokproduk.visible = false 
                boxstok.visible = false
                hargabelidus.visible = false
                boxhrgdus.visible = false
                hargajualdus.visible = false
                boxjualdus.visible = false 
                hargajualpcs.visible = false
                boxjualpcs.visible = false
                etalaseproduk.visible = false 
                boxetalase.visible = false
                
            }
        }
        Image {
            source: "logout.png"
            anchors.centerIn: parent
            width: 30
            height: 30
        }
    }
    Rectangle {
        id: buttonbckjual
        width: 100
        height: 50
        visible:false
        radius: 50 // customize the radius here
        color: '#3CB371'
        anchors {
            right: parent.right
            rightMargin: 50
            top: parent.top
            topMargin: 50
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                btnpull.visible = true
                btnpush.visible = true
                btnjual.visible = true
                btngudang.visible = true
                btndebit.visible = true
                buttonexit.visible = true
                txtkode.visible = false
                kodeprdk.visible = false
                buttonbckjual.visible = false
                buttonbckgdg.visible = false
                namaprdk.visible = false
                boxnama.visible = false 
                stokproduk.visible = false 
                boxstok.visible = false
                hargabelidus.visible = false
                boxhrgdus.visible = false
                hargajualdus.visible = false
                boxjualdus.visible = false 
                hargajualpcs.visible = false
                boxjualpcs.visible = false
                etalaseproduk.visible = false 
                boxetalase.visible = false
                listID.visible = false
            }
        }
        Image {
            source: "logout.png"
            anchors.centerIn: parent
            width: 30
            height: 30
        }
    }
    Rectangle {
        id:btnpull
        width: 100
        height: 50
        visible:true
        radius: 50 // customize the radius here
        color: '#3CB371'
        anchors {
            left: parent.left
            top: parent.top
            leftMargin: 20
            topMargin: 50
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                Aplikasi.pull('git pull')
            }
        }
        Text {
            text: "Git Pull"
            color: "black"
            font.pixelSize: 20
            anchors.centerIn: parent
                
            }
    }
    Rectangle {
        id:txtpushgit
        height: 50
        width: 200
        visible: btnpush.visible
        radius: 50
        color: "white"
        anchors {
            left:btnpush.right
            leftMargin: 20
            top: btnpush.top
        }
        Text {
            id:txtpush
            text: ""
            color: "black"
            font.pixelSize: 20
            anchors.centerIn: parent
        }
    }
    Rectangle {
        id:btnpush
        width: 100
        height: 50
        visible:true
        radius: 50 // customize the radius here
        color: '#3CB371'
        anchors {
            left: parent.left
            top: btnpull.bottom
            leftMargin: 20
            topMargin: 20
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                Aplikasi.push('git push')
            }
        }
        Text {
            text: "Git Push"
            color: "black"
            font.pixelSize: 20
            anchors.centerIn: parent
                
            }
    }
    
    
}