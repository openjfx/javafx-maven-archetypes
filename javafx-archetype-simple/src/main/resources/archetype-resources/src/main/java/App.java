package $package;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;

#if ("8" == ${javafx-version})
#set ( $String = 'String')
#set ( $Label = 'Label')
#set ( $Scene = 'Scene')
#else
#set ( $String = 'var')
#set ( $Label = 'var')
#set ( $Scene = 'var')
#end

/**
 * JavaFX App
 */
public class App extends Application {

    @Override
    public void start(Stage stage) {
        ${String} javaVersion = SystemInfo.javaVersion();
        ${String} javafxVersion = SystemInfo.javafxVersion();

        ${Label} label = new Label("Hello, JavaFX " + javafxVersion + ", running on Java " + javaVersion + ".");
        ${Scene} scene = new Scene(new StackPane(label), 640, 480);
        stage.setScene(scene);
        stage.show();
    }

    public static void main(String[] args) {
        launch();
    }

}