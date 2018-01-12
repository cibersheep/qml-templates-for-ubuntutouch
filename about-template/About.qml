/*
 * About template
 * By Joan CiberSheep using base file from uNav
 *
 * uNav is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * uNav is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItems



Page {
    id: aboutPage
    title: "About"
	
	//Colors
	property string frontColor: 	UbuntuColors.porcelain	// or "#000000" format
	property string backColor:  	UbuntuColors.orange		// or "#000000"	format
	property string detailsColor:  	UbuntuColors.slate		// or "#000000"	format
	property string accentColor:  	UbuntuColors.orange		// or "#000000"	format
	
	//Properties
	property string iconAppRute: "icon.svg"
	property string version: "1.0" 	//version as a string (between inverted commas)
	property string license: "<a href=' License Link '>License Name</a>"
							 //"<a href='http://www.gnu.org/licenses/gpl-3.0.en.html'>GPL3</a>"
							 //"<a href='https://opensource.org/licenses/MIT'>MIT</a>"
							 //"<a href='https://creativecommons.org/licenses/by-sa/4.0/'>CC By-SA</a>"
							 //etc
							 
    header: PageHeader {
        id: pageHeader
        title: i18n.tr("About")
        StyleHints {
            foregroundColor: frontColor
            backgroundColor: backColor
            dividerColor: detailsColor
        }
    }

    Flickable {
        id: flickable
        anchors.fill: parent
        anchors.top: pageHeader.bottom
        contentHeight: mainColumn.height + units.gu(17)

		Column {
			id: mainColumn
			width: parent.width
			spacing: units.gu(3)
			anchors {
				top: parent.top; topMargin: units.gu(10)
			}
			Column {
				spacing: units.gu(3)
				width: parent.width
				UbuntuShape {
					width: units.gu(20)
					height: width
					anchors.horizontalCenter: parent.horizontalCenter
					radius: "medium"
					aspect: UbuntuShape.Flat
					image: Image {
						source: Qt.resolvedUrl(iconAppRute)
						fillMode: Image.PreserveAspectCrop
					}
				}
				Label {
					width: parent.width
					wrapMode: Text.WordWrap
					horizontalAlignment: Text.AlignHCenter
					text: i18n.tr("App Name")
					font.bold: true
				}
				Label {
					width: parent.width
					wrapMode: Text.WordWrap
					horizontalAlignment: Text.AlignHCenter
					text: i18n.tr("Version %1. Under License %2").arg(version).arg(license)
					onLinkActivated: Qt.openUrlExternally(link)
					linkColor: accentColor
				}
			}

			Column {
				width: parent.width
				spacing: units.gu(1.5)
				ListItemHeader{
					id: devHeader
					headerText: i18n.tr("Header")
				}
				
				Repeater {
					id: devListView

					model: devModel
					delegate: ListItems.Standard {
						progression: true
						showDivider: false
						text: model.name
						onClicked: Qt.openUrlExternally(model.link)
					}
				}

				ListModel {
					id: devModel
					Component.onCompleted: initialize()
					function initialize() {
						devModel.append({ name: "Name", link: "https://link/" })
						devModel.append({ name: "Name", link: "https://link/" })
						devModel.append({ name: "Name", link: "https://link/" })
						devModel.append({ name: "Name", link: "https://link/" })
					}
				}
			}

			Column {
				width: parent.width
				
				ListItemHeader{
					id: ogHeader
					headerText: i18n.tr("Header")
				}

				Repeater {
					id: origListView

					model: origModel
					delegate: ListItems.Standard {
						progression: true
						showDivider: false
						text: model.name
						onClicked: Qt.openUrlExternally(model.link)
					}
				}

				ListModel {
					id: origModel
					Component.onCompleted: initialize()
					function initialize() {
						origModel.append({ name: "Name", link: "http://link/" })
					}
				}
			}
			Column {
				width: parent.width
				
				ListItemHeader{
					headerText: i18n.tr("Header")
				}
				
				Repeater {
					id: basedListView

					model: basedModel
					delegate: ListItems.Standard {
						progression: true
						showDivider: false
						text: model.name
						onClicked: Qt.openUrlExternally(model.link)
					}
				}

				ListModel {
					id: basedModel
					Component.onCompleted: initialize()
					function initialize() {
						basedModel.append({ name: "Name", link: "https://link/" })
					}
				}
			}
			Column {
				width: parent.width
				
				ListItemHeader{
					headerText: i18n.tr("Header")
				}
				
				Repeater {
					id: lpListView

					model: lpModel
					delegate: ListItems.Standard {
						progression: true
						showDivider: false
						text: model.name
						onClicked: Qt.openUrlExternally(model.link)
					}
				}

				ListModel {
					id: lpModel
					Component.onCompleted: initialize()
					function initialize() {
						lpModel.append({ name: "Name", link: "https://link/" })
						lpModel.append({ name: "Name", link: "https://link/" })
					}
				}
			}
			Column {
				width: parent.width

				ListItemHeader{
					headerText: i18n.tr("Header")
				}

				Repeater {
					id: poweredbyListView

					model: poweredbyModel
					delegate: ListItems.Standard {
						progression: true
						showDivider: false
						text: model.name
						onClicked: Qt.openUrlExternally(model.link)
					}
				}

				ListModel {
					id: poweredbyModel
					Component.onCompleted: initialize()
					function initialize() {
						poweredbyModel.append({ name: "Name", link: "https://link/" })
					}
				}
			}
		}
    }
}
