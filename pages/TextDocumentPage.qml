import QtQuick 1.1
import Sailfish.Silica 1.0
import com.jolla.components.views 1.0
import org.calligra.CalligraComponents 0.1 as Calligra

SplitViewPage {
    id: page
    
    property string title;
    property string path;

    PageHeader { title: page.title; }

    contentItem: Rectangle {
        color: "grey";
        clip: true;
        SilicaFlickable {
            id: flickable

            anchors.fill: parent;

            contentWidth: document.documentSize.width;
            contentHeight: document.documentSize.height;
            clip: true;

            Calligra.TextDocumentCanvas {
                id: document;
                width: documentSize.width;
                height: documentSize.height;
                zoomMode: Calligra.TextDocumentCanvas.ZOOM_PAGE`;
            }

            ScrollDecorator { flickable: parent; }
            MouseArea { anchors.fill: parent; onClicked: page.splitActive = !page.splitActive; }
        }
    }

    onStatusChanged: {
        //Delay loading the document until the page has been activated.
        if(status == PageStatus.Active) {
            document.source = page.path;
        }
    }
}
