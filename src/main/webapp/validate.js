const form = document.getElementById("registration-form");
const username = document.getElementById("username");
const email = document.getElementById("email");
const password = document.getElementById("password");
const confirmPassword = document.getElementById("confirmPassword");

form.addEventListener("submit", function(e){
    e.preventDefault();

    const isRequiredValid = checkRequired([username,email,password,confirmPassword]);

    let isFormatValid = isRequiredValid;

    if(isRequiredValid){
        const isUsernameValid = checkLength(username,3,15);
        const isEmailValid = checkEmail(email);
        const isPasswordValid = checkLength(password,6,25);
        const isPasswordMatch = checkPasswordMatch(password,confirmPassword);

        isFormatValid = isUsernameValid && isEmailValid && isPasswordValid && isPasswordMatch;
    }

    if(isFormatValid){
        form.submit(); // gửi qua servlet
    }
});

function checkRequired(inputArray){
    let isValid = true;

    inputArray.forEach(input => {
        if(input.value.trim() === ""){
            showError(input, `${formatFieldName(input)} is required`);
            isValid = false;
        } else {
            showSuccess(input);
        }
    });

    return isValid;
}

function formatFieldName(input){
    return input.id.charAt(0).toUpperCase() + input.id.slice(1);
}

function showError(input,message){
    const formGroup = input.parentElement;
    formGroup.className = "form-group error";
    const small = formGroup.querySelector("small");
    small.innerText = message;
}

function showSuccess(input){
    const formGroup = input.parentElement;
    formGroup.className = "form-group success";
}

function checkLength(input,min,max){
    if(input.value.length < min){
        showError(input, `${formatFieldName(input)} must be at least ${min} characters`);
        return false;
    }
    if(input.value.length > max){
        showError(input, `${formatFieldName(input)} must be less than ${max} characters`);
        return false;
    }
    showSuccess(input);
    return true;
}

function checkEmail(input){
    const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if(regex.test(input.value.trim())){
        showSuccess(input);
        return true;
    } else {
        showError(input, "Email is not valid");
        return false;
    }
}

function checkPasswordMatch(p1,p2){
    if(p1.value !== p2.value){
        showError(p2, "Passwords do not match");
        return false;
    }
    showSuccess(p2);
    return true;
}