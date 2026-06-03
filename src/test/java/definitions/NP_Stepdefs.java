package definitions;

import io.cucumber.java.PendingException;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.openqa.selenium.By;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.InstanceOfAssertFactories.LOCAL_DATE;
import static support.TestContext.getDriver;

public class NP_Stepdefs {

    //open url
    @Given("NP opens Medical Center url {string}")
    public void NPopenUrl(String url) {
        switch (url) {
            case "MediCenter v1 url":
                getDriver().get(xPathLibrary_NP.sMedicenterV1URL);
                break;
            case "MediCenter v2 url":
                getDriver().get(xPathLibrary_NP.sMedicenterV2URL);
                break;
            default:
                System.out.println("There is no such URL. Please double check!");
        }
    }

    @Then("NP wait for {int} sec")
    public void iWaitForSec(int sec) throws Exception {
        Thread.sleep(sec * 1000);
    }

    @Then("The NP page title is {string}")
    public void NPPageTitleIs(String sPageTitle) {
        // Write code here that turns the phrase above into concrete actions
        assertThat(getDriver().getTitle().contains(sPageTitle));
    }

    @And("NP wait for {string} text")
    public void NPWaitForText(String sXpath) {
        // Write code here that turns the phrase above into concrete actions
        new WebDriverWait(getDriver(), Duration.ofSeconds(20)).until(ExpectedConditions.presenceOfElementLocated(By.xpath(sXpath)));
    }

    @And("NP wait for {string} text is invisible")
    public void NPWaitUntilInvisible(String sXpath) {
        // Write code here that turns the phrase above into concrete actions
        new WebDriverWait(getDriver(), Duration.ofSeconds(20)).until(ExpectedConditions.invisibilityOfElementLocated(By.xpath(sXpath)));
    }

    @Then("NP click on {string} button")
    public void NPClickOnButton(String sButtonName) {
        // Write code here that turns the phrase above into concrete actions
        switch(sButtonName){
            case "Login":
                getDriver().findElement(By.xpath(xPathLibrary_NP.sLogin_Button)).click();
                break;
            case "Sign In":
                getDriver().findElement(By.xpath(xPathLibrary_NP.sSignIn_Button)).click();
                break;
            case "Make an appointment":
                getDriver().findElement(By.xpath(xPathLibrary_NP.sMakeAppointment)).click();
                break;
            case "Delete an appointment":
                getDriver().findElement(By.xpath(xPathLibrary_NP.sDeleteAppointment)).click();
                break;
            case "Send reset password":
                getDriver().findElement(By.xpath(xPathLibrary_NP.sSignIn_Button)).click();
                break;
            default:
                System.out.println("There is no such button on this page. Please double check");
        }
    }

    @And("NP type {string} to {string} text field")
    public void NPTypeToTextfield(String sText, String sTextFieldName) {
        // Write code here that turns the phrase above into concrete actions
        switch (sTextFieldName){
            case "Email":
                getDriver().findElement(By.xpath(xPathLibrary_NP.sEmail)).sendKeys(sText);
                break;
            case "Password":
                getDriver().findElement(By.xpath(xPathLibrary_NP.sPassword)).sendKeys(sText);
                break;
            case "Purpose":
                getDriver().findElement(By.xpath(xPathLibrary_NP.sNoteTextField)).sendKeys(sText);
                break;
            default:
                System.out.println("Cannot find the text field with this name ");
        }
    }

    @Then("NP click on element with xpath {string}")
    public void NPClickOnElementWithXpath(String xpath) {
        getDriver().findElement(By.xpath(xpath)).click();
    }

    @And("NP type {string} into element with xpath {string}")
    public void NPTypeIntoElementWithXpath(String value, String xpath) {

        switch (value) {

            case "Current date":
                value = LocalDate.now()
                        .format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
                break;

            case "Tomorrow":
                value = LocalDate.now()
                        .plusDays(1)
                        .format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
                break;

            default:
                break;
        }
        getDriver().findElement(By.xpath(xpath)).sendKeys(value);
    }


}

