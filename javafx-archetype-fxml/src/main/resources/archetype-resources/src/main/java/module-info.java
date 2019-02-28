module $package {
    
    requires javafx.controls;
    requires javafx.fxml;

    exports $package;
    opens $package to javafx.fxml;
}