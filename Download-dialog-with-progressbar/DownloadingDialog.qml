/*
 * Copyright (C) 2013 Canonical Ltd
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Authored by: Arto Jalkanen <ajalkane@gmail.com>
 * Modified by: Joan CiberSheep <cibersheep@gmail.com>
 */
 
import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3

import DownloadInterceptor 1.0

Dialog {
    id: downloadDialog
    property Page page
    property string dialogTitle i18n.tr("") 			// Title of the dialog
    property string descriptionPrepend: i18n.tr("") 	// Explanation (under title)
    
    title: dialogTitle
    text: descriptionPrepend

    ProgressBar {
		id: downloadBar
		height: units.dp(3)
		anchors {
			left: parent.left
			right: parent.right
		}

		showProgressPercentage: false
		minimumValue: 0
		maximumValue: 100
	}
    
    //TO DO: Implement a cancel to the download
    
    Button {
		id: cancelButton
		visible: false
        text: i18n.tr("Close")
        onClicked: {
            console.log("Closing popup")
            PopupUtils.close(downloadDialog)
        }
    }
        
    Connections {
		target: DownloadInterceptor
		
		onDownloading: {
			downloadBar.value = (received * 100) / total
		}
		
		onFail: {
			//Something went wrong and the `message` argument will tell you what it was.
			console.log("Error: " + message)
			cancelButton.visible = true
			downloadDialog.text = message
		}
	}

}
