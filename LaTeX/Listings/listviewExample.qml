 ListView {
      id: inventoryList
      model: listModel
      anchors.fill: parent
      anchors.margins: 10
      clip: true
      spacing: 5
      Layout.fillWidth: true
      delegate:Rectangle{
          id: rect1
          width: ListView.view.width
          height: 50
          property bool selected: false
          color: selected ? "#4FC3F7": "white"

          RowLayout{
              id: row
              anchors.fill: parent
              Text {
                  id: id
                  text: model.id
                  font.pixelSize: 20
                  verticalAlignment: Text.AlignVCenter
                  Layout.fillHeight: true
                  Layout.fillWidth: true
                  Layout.preferredWidth: 50
              }
              Text {
                  id: name
                  text: model.name
                  font.pixelSize: 20
                  verticalAlignment: Text.AlignVCenter
                  Layout.fillHeight: true
                  Layout.fillWidth: true
                  Layout.preferredWidth: 400
              }
              Text {
                  id: quantity
                  text: model.quantity
                  font.pixelSize: 20
                  verticalAlignment: Text.AlignVCenter
                  Layout.fillHeight: true
                  Layout.fillWidth: true
                  Layout.preferredWidth: 100
              }
          }
          MouseArea {
              anchors.fill: parent
              onClicked: {
                  if(!rect1.selected) {
                      listCon.selectRow(model.id)
                      rect1.selected= true
                  }
              }
          }
          Connections {
              target: listCon
              function onRowClicked(message) {
                  if (model.id !== message) {
                      rect1.selected = false
                  }
                  if(parseInt(model.id) === parseInt(message)) {
                      rect1.selected = true
                  }
              }
          }
      }
 }