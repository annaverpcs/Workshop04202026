package definitions;

import io.cucumber.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.WebElement;

import static support.TestContext.getDriver;


public class YuliaKStepDefs {

    @When("I select {string} from the {string} dropdown")
    public void selectFromDropdown(String value, String dropdownName) {
        WebElement dropdown = getDriver().findElement(By.name(dropdownName));
        Select select = new Select(dropdown);
        select.selectByVisibleText(value);
    }
}
