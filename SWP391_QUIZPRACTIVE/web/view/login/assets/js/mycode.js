var captcha;
                                function generate() {

                                    // Clear old input
                                    document.getElementById("submitLogin").value = "";

                                    // Access the element to store
                                    // the generated captcha
                                    captcha = document.getElementById("image");
                                    var uniquechar = "";

                                    const randomchar =
                                            "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

                                    // Generate captcha for length of
                                    // 5 with random character
                                    for (let i = 1; i < 6; i++) {
                                        uniquechar += randomchar.charAt(Math.random() * (randomchar.length));
                                    }
                                    // Store generated input
                                    captcha.innerHTML = uniquechar;
                                }

                                function printmsg() {
                                    const usr_input = document
                                            .getElementById("submitLogin").value;

                                    // Check whether the input is equal
                                    // to generated captcha or not
                                    if (usr_input === captcha.innerHTML) {
                                        document.getElementById("btnRegister")
                                                .disabled = false;
                                        var s = document.getElementById("key")
                                                .innerHTML = "CapCha Matched";
                                        generate();
                                    } else {
                                        var s = document.getElementById("key")
                                                .innerHTML = "CapCha Not Matched";
                                        generate();
                                    }
                                }