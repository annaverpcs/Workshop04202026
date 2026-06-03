package definitions;

import io.cucumber.java.PendingException;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.openqa.selenium.By;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static support.TestContext.getDriver;

public class AbdullahNStepDefs {
    @Given("AbdullahN launch {string}")
    public void abdullahnLaunch(String sApplicationName) {
        // Write code here that turns the phrase above into concrete actions


        switch (sApplicationName) {
            case "Medicenter V2 URL":
                getDriver().get(xPathLibrary_Abdullah.medicenterV2URL);
                break;
            case "Medicenter V1 URL":
                getDriver().get(xPathLibrary_Abdullah.medicenterV1URL);
                break;
            case "Google":
                getDriver().get(xPathLibrary_Abdullah.sGoogleURL);
                break;
            case "Target URL":
                getDriver().get(xPathLibrary_Abdullah.sTargetURL);
                break;
            default:
                System.out.println("There is no such URL. Please double check");


        }
    }

    @Then("AbdullahN page title is {string}")
    public void abdullahnPageTitleIs(String sPageTitle) {
        // Write code here that turns the phrase above into concrete actions
        assertThat(getDriver().getTitle().contains(sPageTitle));
    }

    @And("AbdullahN wait for {string} text")
    public void abdullahnWaitForText(String sXpath) {
        // Write code here that turns the phrase above into concrete actions
        new WebDriverWait(getDriver(), Duration.ofSeconds(20)).until(ExpectedConditions.presenceOfElementLocated(By.xpath(sXpath)));
    }

    @Then("AbdullahN click on {string} button")
    public void abdullahnClickOnButton(String sButtonName) {
        // Write code here that turns the phrase above into concrete actions
        switch(sButtonName){
            case "Login":
                getDriver().findElement(By.xpath(xPathLibrary_Abdullah.sLoginButton)).click();
                break;
            case "Sign In":
                getDriver().findElement(By.xpath(xPathLibrary_Abdullah.sSignInButton)).click();
                break;
            default:
                System.out.println("There is no such button on this page. Please double check");
        }
    }

    @And("AbdullahN type {string} to {string} textField")
    public void abdullahnTypeToTextField(String sText, String sTextFieldName) {
        // Write code here that turns the phrase above into concrete actions
        switch (sTextFieldName){
            case "Email":
                getDriver().findElement(By.xpath(xPathLibrary_Abdullah.sEmailTextField)).sendKeys(sText);
                break;
            case "Password":
                getDriver().findElement(By.xpath(xPathLibrary_Abdullah.sPasswordTextField)).sendKeys(sText);
                break;
            default:
                System.out.println("cannot find textfield with this name");

        }
    }
}
