# clipboard_listener
Flutter 粘贴板监听器，在粘贴板内容改变时通知您  
**注意：由于Android10改变了监听器策略，因此，当您的APP在后台运行时，将不会通知您**

## Getting Started
Android 基于： `ClipboardManager.OnPrimaryClipChangedListener`  
IOS 基于：`UIPasteboardChangedNotification`

### 使用方法
通过 `ClipboardListener.addListener` 和 `ClipboardListener.removeListener` 可进行事件监听  
````dart
@override
vodi initState(){
  super.initState();
  ClipboardListener.addListener(_messageListener);
}
@override
void dispose() {
  super.dispose();
  ClipboardListener.removeListener(_messageListener);
}

 _messageListener() {
  // you code
};
````
注意：addListener 后，请注意在必要时进行 removeListener
