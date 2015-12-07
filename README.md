# SVProgressHUD

Same notes as the Normal SVProgressHUD.

Changes
-------

* Allow for setting the defaultStartingSize of the progressHUD by use of the 
+setDefaultStartingSize: method. By default has a starting size of CGSize{w:100, h:100}

* Do proper Keyboard frame detection by calling on RKeyboardListener to get the frame of any keyboards currently shown
  on the screen. For proper integration with SVProgressHUD make sure to run [RKeyboardListener sharedManager] 
  startListener] method in your app delegates didFinishLaunching/willFinishLaunching.
  It's recommended you add RKeyboardListener.h to your project's pch file so that you may get the state of the keyboard
  from all your classes.
