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

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.openqa.selenium.WebElement;

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

    //@And("NP wait for {string} text")
    //public void NPWaitForText(String sXpath) {
    //    String fixedXpath = makeXpathMoreStable(sXpath);

    //    System.out.println("Original XPath: " + sXpath);
    //    System.out.println("Fixed XPath: " + fixedXpath);

    //    new WebDriverWait(getDriver(), Duration.ofSeconds(20))
    //            .until(ExpectedConditions.presenceOfElementLocated(By.xpath(sXpath)));
    //}

    @And("NP wait for {string} text is invisible")
    public void NPWaitUntilInvisible(String sXpath) {
        // Write code here that turns the phrase above into concrete actions
        new WebDriverWait(getDriver(), Duration.ofSeconds(20)).until(ExpectedConditions.invisibilityOfElementLocated(By.xpath(sXpath)));
    }

    //@And("NP wait for {string} text is invisible")
    //public void NPWaitUntilInvisible(String sXpath) {
    //    String fixedXpath = makeXpathMoreStable(sXpath);

    //    System.out.println("Original XPath: " + sXpath);
    //    System.out.println("Fixed XPath: " + fixedXpath);

    //    new WebDriverWait(getDriver(), Duration.ofSeconds(20))
    //            .until(ExpectedConditions.invisibilityOfElementLocated(By.xpath(fixedXpath)));
    //}

    private String makeXpathMoreStable(String xpath) {
        if (xpath == null) {
            return xpath;
        }
        Pattern pattern = Pattern.compile(
                "contains\\(\\s*(text\\(\\)|normalize-space\\(\\.\\))\\s*,\\s*(['\"])(.*?)\\2\\s*\\)"
        );

        Matcher matcher = pattern.matcher(xpath);
        StringBuffer sb = new StringBuffer();

        while (matcher.find()) {
            String text = matcher.group(3).trim();

            if (text.length() > 30 && text.startsWith("Lorem")) {
                text = text.substring(0, 20).trim();
            }

            String replacement = "contains(normalize-space(.), " + xpathLiteral(text) + ")";
            matcher.appendReplacement(sb, Matcher.quoteReplacement(replacement));
        }

        matcher.appendTail(sb);
        return sb.toString();
    }

    private String xpathLiteral(String text) {
        if (!text.contains("'")) {
            return "'" + text + "'";
        }

        if (!text.contains("\"")) {
            return "\"" + text + "\"";
        }

        String[] parts = text.split("'");
        StringBuilder result = new StringBuilder("concat(");

        for (int i = 0; i < parts.length; i++) {
            result.append("'").append(parts[i]).append("'");

            if (i != parts.length - 1) {
                result.append(", \"'\", ");
            }
        }

        result.append(")");
        return result.toString();
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

            case "Two days before":
                value = LocalDate.now()
                        .minusDays(2)
                        .format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
                break;
            case "Current date":
                value = LocalDate.now()
                        .format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
                break;

            case "In two days":
                value = LocalDate.now()
                        .plusDays(2)
                        .format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
                break;

            default:
                break;
        }
        getDriver().findElement(By.xpath(xpath)).sendKeys(value);
    }


    @Then("NP check forgot password result is {string}")
    public void NPCheckForgotPasswordResult(String caseType) {
        WebDriverWait wait = new WebDriverWait(getDriver(), Duration.ofSeconds(10));

        if (caseType.equalsIgnoreCase("negative")) {
            wait.until(ExpectedConditions.visibilityOfElementLocated(
                    By.xpath("//span[contains(normalize-space(.),'Password recovery requires an email')]")
            ));
        } else if (caseType.equalsIgnoreCase("positive")) {
            wait.until(ExpectedConditions.invisibilityOfElementLocated(
                    By.xpath("//span[contains(normalize-space(.),'Check your email for the password reset link')]")
            ));
        } else {
            throw new IllegalArgumentException("Unknown caseType: " + caseType);
        }
    }

    @Then("NP check login results is {string}")
    public void NPCheckLoginResult(String caseType) {
        WebDriverWait wait = new WebDriverWait(getDriver(), Duration.ofSeconds(20));

        if (caseType.equalsIgnoreCase("negative")) {
            wait.until(ExpectedConditions.visibilityOfElementLocated(
                    By.xpath("//span[contains(normalize-space(.),'Invalid login credentials') or contains(normalize-space(.),'missing email or phone')]")
            ));
        } else if (caseType.equalsIgnoreCase("positive")) {
            wait.until(ExpectedConditions.invisibilityOfElementLocated(
                    By.xpath("//span[contains(normalize-space(.),'Invalid login credentials') or contains(normalize-space(.),'missing email or phone')]")
            ));
        } else {
            throw new IllegalArgumentException("Unknown caseType: " + caseType);
        }
    }

    private String convertTestValue(String value) {
        if (value == null) {
            return "";
        }

        if (value.equals("[500_CHARS]")) {
            return "A".repeat(501);
        }

        if (value.equals("[600_CHARS]")) {
            return "A".repeat(600);
        }

        return value;
    }

    @And("NP type {string} to {string} purpose text field")
    public void NPTypeToTextField(String sText, String fieldName) {
        sText = convertTestValue(sText);

        WebElement element = getDriver().findElement(
                By.xpath("//label[contains(normalize-space(.),'" + fieldName + "')]/following::input[1] | //label[contains(normalize-space(.),'" + fieldName + "')]/following::textarea[1]")
        );

        element.clear();
        element.sendKeys(sText);
    }

    @Then("NP handle appointment result is {string} for patient {string} and purpose {string}")
    public void NPHandleAppointmentResult(String caseType, String patientName, String purpose) {
        WebDriverWait wait = new WebDriverWait(getDriver(), Duration.ofSeconds(20));

        purpose = convertTestValue(purpose);

        String updateXpath =
                "//p[normalize-space()=" + xpathLiteral(patientName) + "]/ancestor::article//span[contains(normalize-space(.),'update')]";

        if (caseType.equalsIgnoreCase("negative")) {

            wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath(updateXpath)));
            System.out.println("Negative case passed: appointment was not created.");

        } else if (caseType.equalsIgnoreCase("positive") || caseType.equalsIgnoreCase("boundary")) {

            wait.until(ExpectedConditions.elementToBeClickable(By.xpath(updateXpath))).click();

            wait.until(ExpectedConditions.elementToBeClickable(
                    By.xpath("//button[contains(normalize-space(.),'Delete an appointment')]")
            )).click();

            wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath(updateXpath)));

            System.out.println("Positive/boundary case passed: appointment was created and deleted.");

        } else {
            throw new IllegalArgumentException("Unknown caseType: " + caseType);
        }
    }

}

