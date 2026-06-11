package definitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebElement;

import static support.TestContext.getDriver;

public class OlgaStepDefs {
    @When("I reload the page")
    public void reloadPage() {
        getDriver().navigate().refresh();
    }

    @Then("I set {string} on element using JavaScript with xpath {string}")
    public void iSetAttributeOnElementUsingJavaScriptWithXpath(String newValue, String xpath) {
        WebElement element = getDriver().findElement(By.xpath(xpath));
        JavascriptExecutor executor = (JavascriptExecutor) getDriver();
        executor.executeScript("arguments[0].value = '" + newValue + "';", element);
    }
}
