// with this line our type becomes a Singleton
pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

// your singletons should always have Singleton as the type
Singleton {
  id: root
  readonly property string textColor: "#fefefe"
  readonly property string panelBackground: ColorHelpers.withTransparency("#0A0B0B", 0.8)
}
