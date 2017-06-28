var itemComponent = null;
var draggedItem = null;
var startingMouse;
var posnInWindow;
var windowWidth = 400;

function startDrag(mouse)
{
    posnInWindow = buttonDelegate.mapToItem(mainWindow, 0, 0);
    startingMouse = { x: mouse.x, y: mouse.y }
    loadComponent();
}

//Creation is split into two functions due to an asynchronous wait while
//possible external files are loaded.

function loadComponent() {
    if (itemComponent != null) { // component has been previously loaded
        createItem();
        return;
    }

    itemComponent = Qt.createComponent("DraggedFood.qml");
    if (itemComponent.status === Component.Loading)  //Depending on the content, it can be ready or error immediately
        component.statusChanged.connect(createItem);
    else
        createItem();
}

function createItem() {
    if (itemComponent.status == Component.Ready && draggedItem == null) {
        draggedItem = itemComponent.createObject(mainWindow, {"image": buttonDelegate.foodImage, "x": posnInWindow.x, "y": posnInWindow.y, "z": 3});
    } else if (itemComponent.status == Component.Error) {
        draggedItem = null;
    }
}

function continueDrag(mouse)
{
    if (draggedItem == null)
        return;

    draggedItem.x = mouse.x + posnInWindow.x - startingMouse.x;
    draggedItem.y = mouse.y + posnInWindow.y - startingMouse.y;
}

function endDrag(mouse)
{
    if (draggedItem == null)
        return;




    if (draggedItem.x < windowWidth) {
        draggedItem.destroy();
        draggedItem = null;
        return 1
    }else{
        draggedItem.destroy();
        draggedItem = null;
        return 0
    }
//    }
//    } else {
//        draggedItem.created = true;
//        draggedItem = null;
//    }
}

