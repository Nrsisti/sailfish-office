/*
 * Copyright (C) 2013-2014 Jolla Ltd.
 * Contact: Robin Burchell <robin.burchell@jolla.com>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; version 2 only.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 2.0
import Sailfish.Silica 1.0
import Sailfish.TransferEngine 1.0

ShareMethodList {
    id: menuList
    objectName: "menuList"

    property Item visualParent
    property string title
    property string path
    property string mimeType

    model: SailfishTransferMethodsModel {
        id: transferMethodsModel
        filter: menuList.mimeType
    }
    source: menuList.path

    header: PageHeader {
        title: menuList.title
        //: Share documents
        //% "Share"
        description: qsTrId("sailfish-office-la-share")
    }
    content: {
        "name": name,
        "data": text,
        "type": type,
        "icon": icon,
        // also some non-standard fields for Twitter/Facebook status sharing:
        "status" : text,
        "linkTitle" : name
    }
    serviceFilter: ["sharing","e-mail"]
    endDestination: menuList.visualParent
}
