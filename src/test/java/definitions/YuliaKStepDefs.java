package definitions;

import io.cucumber.java.en.And;
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

    @And("element with text {string} should be present")
    public void findText(String text) {
        getDriver().findElement(By.xpath("//*[text()='" + text + "']"));
    }
}
