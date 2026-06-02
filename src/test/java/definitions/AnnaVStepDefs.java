package definitions;

import io.cucumber.java.PendingException;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.openqa.selenium.By;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;

public class AnnaVStepDefs {
    @Given("AnnaV launch {string}")
    public void annavLaunch(String sApplicationName) {
        // Write code here that turns the phrase above into concrete actions

        switch (sApplicationName) {
            case "Medicenter V2 URL":
                getDriver().get(xPathLibrary.sMedicenterV2URL);
                break;
            case "Medicenter V1 URL":
                getDriver().get(xPathLibrary.sMedicenterV1URL);
                break;
            case "Google URL":
                getDriver().get(xPathLibrary.sGoogleURL);
                break;
            case "Target URL":
                getDriver().get(xPathLibrary.sTargetURL);
                break;
            default:
                System.out.println("There is no such URL. Please double check!");

        }
    }

    @Then("AnnaV page title is {string}")
    public void annavPageTitleIs(String sPageTitle) {
        // Write code here that turns the phrase above into concrete actions
        assertThat(getDriver().getTitle().contains(sPageTitle));
    }

    @And("AnnaV wait for {string} text")
    public void annavWaitForText(String sXpath) {
        // Write code here that turns the phrase above into concrete actions
       new WebDriverWait(getDriver(), Duration.ofSeconds(20)).until(ExpectedConditions.presenceOfElementLocated(By.xpath(sXpath)));
    }

    @Then("AnnaV click on {string} button")
    public void annavClickOnButton(String sButtonName) {
        // Write code here that turns the phrase above into concrete actions
        switch(sButtonName){
            case "Login":
                getDriver().findElement(By.xpath(xPathLibrary.sLoginButton)).click();
                break;
            case "Sign In":
                getDriver().findElement(By.xpath(xPathLibrary.sSignInButton)).click();
                break;
            default:
                System.out.println("There is no such button on this page. Please double check");
        }
    }

    @And("AnnaV type {string} to {string} textfield")
    public void annavTypeToTextfield(String sText, String sTextFieldName) {
        // Write code here that turns the phrase above into concrete actions
       switch (sTextFieldName){
           case "Email":
               getDriver().findElement(By.xpath(xPathLibrary.sEmailTextField)).sendKeys(sText);
               break;
           case "Password":
               getDriver().findElement(By.xpath(xPathLibrary.sPasswordTextField)).sendKeys(sText);
               break;
           default:
               System.out.println("Cannot find the textfield with this name ");
       }
    }
}

