package $package;

import java.io.IOException;
import javafx.fxml.FXML;

public class PrimaryController {

    @FXML
    private void switchToSecondary() throws IOException {
        com.gluonhq.App.setRoot("secondary");
    }
}
