module $package {
    requires javafx.controls;
    requires javafx.fxml;

    opens $package to javafx.fxml;
    exports $package;
}