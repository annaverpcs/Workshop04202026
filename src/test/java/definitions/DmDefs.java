package definitions;

import io.cucumber.java.PendingException;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;

public class DmDefs {
    @Given("Please open {string}")
    public void anyoneLaunch(String sAppName) {
        switch (sAppName) {
            case "MedCenter URL V1":
                getDriver().get(xPathLibrary_Dm.sMediCentedV1URL_Dm);
                break;
            case "MedCenter URL V2":
                getDriver().get(xPathLibrary_Dm.sMediCentedV2URL_Dm);
                break;
            default:
                System.out.println("There is no such URL. Please check!");
        }
    }

    @Then("page title is {string}")
    public void pageTitleIs(String sPageMainTitle) {
        assertThat(getDriver().getTitle()).contains(sPageMainTitle);
    }

    @And("wait for {string} text")
    public void waitForText(String sXpath) {
        new WebDriverWait(getDriver(), Duration.ofSeconds(5)).until(ExpectedConditions.presenceOfElementLocated(By.xpath(sXpath)));
    }

    @And("click on {string} button")
    public void clickOnButton(String sNameButton) {
        switch (sNameButton) {
            case "Login":
                getDriver().findElement(By.xpath(xPathLibrary_Dm.sLoginButton)).click();
                break;
            case "Sign In":
                getDriver().findElement(By.xpath(xPathLibrary_Dm.sSignInButton)).click();
                break;
            default:
                System.out.println("There is no such button on this page. Please double check");
        }
        // Write code here that turns the phrase above into concrete actions

    }

    @And("type {string} to {string} textfield")
    public void typeToTextfield(String sText, String sTextFieldName) {
        switch (sTextFieldName) {
            case "Email":
                getDriver().findElement(By.xpath(xPathLibrary_Dm.sEmailTextField)).sendKeys(sText);
                break;
            case "Password":
                getDriver().findElement(By.xpath(xPathLibrary_Dm.sPasswordTextField)).sendKeys(sText);
                break;
            default:
                System.out.println("Cannot find the textfield with this name ");
        }
    }

    @Then("I expected message {string}")
    public void iExpectedMessage(String sExpectedMessage) {
        new WebDriverWait(getDriver(), Duration.ofSeconds(5))
                .until(ExpectedConditions.presenceOfElementLocated(
                        By.xpath("//*[contains(text(),'" + sExpectedMessage + "')]")
                ));
    }

    @Then("I expected {string} textfield validation message {string}")
    public void iExpectedTextfieldValidationMessage(String fieldName, String expectedValidationType) {
        WebElement field;

        switch (fieldName) {
            case "Email":
                field = getDriver().findElement(By.xpath("//input[@id='email']"));
                break;
            case "Password":
                field = getDriver().findElement(By.xpath("//input[@id='password']"));
                break;
            default:
                throw new IllegalArgumentException("Unknown textfield: " + fieldName);
        }

        JavascriptExecutor js = (JavascriptExecutor) getDriver();

        boolean isValidationCorrect;

        switch (expectedValidationType) {
            case "email format":
                isValidationCorrect = (Boolean) js.executeScript("return arguments[0].validity.typeMismatch;", field);
                break;

            case "required":
                isValidationCorrect = (Boolean) js.executeScript("return arguments[0].validity.valueMissing;", field);
                break;

            default:
                throw new IllegalArgumentException("Unknown validation type: " + expectedValidationType);
        }

        assertThat(isValidationCorrect).isTrue();
    }

    @Then("{string} textfield should have type {string}")
    public void textfieldShouldHaveType(String fieldName, String expectedType) {
        WebElement field;

        switch (fieldName) {
            case "Email":
                field = getDriver().findElement(By.xpath(xPathLibrary_Dm.sEmailTextField));
                break;

            case "Password":
                field = getDriver().findElement(By.xpath(xPathLibrary_Dm.sPasswordTextField));
                break;

            default:
                throw new IllegalArgumentException("Unknown textfield: " + fieldName);
        }

        String actualType = field.getAttribute("type");

        assertThat(actualType).isEqualTo(expectedType);
    }

    @Then("{string} textfield value should be {string}")
    public void textfieldValueShouldBe(String fieldName, String expectedValue) {
        WebElement field;

        switch (fieldName) {
            case "First Name":
                field = getDriver().findElement(By.xpath("//input[@id='first_name']"));
                break;

            case "Last Name":
                field = getDriver().findElement(By.xpath("//input[@id='last_name']"));
                break;

            case "Email":
                field = getDriver().findElement(By.xpath("//input[@id='email']"));
                break;

            default:
                throw new IllegalArgumentException("Unknown textfield: " + fieldName);
        }

        String actualValue = field.getAttribute("value");

        assertThat(actualValue).isEqualTo(expectedValue);
    }
}
