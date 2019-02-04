<template>
    <section class="section section-shaped section-lg my-0">
        <div class="shape shape-style-1 bg-gradient-default">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </div>
        <div class="container pt-lg-md">
            <div class="row justify-content-center">
                <div class="col-lg-5">
                    <card type="secondary" shadow
                          header-classes="bg-white pb-5"
                          body-classes="px-lg-5 py-lg-5"
                          class="border-0">
                        <template>
                            <div class="text-center text-muted mb-3">
                                <small>Sign in</small>
                            </div>
                            <form id="loginForm" role="form">
                                <base-input alternative
                                            required
                                            class="mb-3"
                                            placeholder="Email"
                                            addon-left-icon="ni ni-email-83"
                                            ref="userEmail">
                                </base-input>
                                <base-input alternative
                                            type="password"
                                            placeholder="Password"
                                            addon-left-icon="ni ni-lock-circle-open"
                                            ref="userPassword">
                                </base-input>
                                <base-checkbox ref="rememberUser">
                                    Remember me
                                </base-checkbox>
                                <div class="text-center">
                                    <base-button type="primary" class="my-4" v-on:click="submitLogin()">Sign In
                                    </base-button>
                                </div>
                            </form>
                        </template>
                    </card>
                    <div class="row mt-3">
                        <div class="col-6">
                            <a href="#" class="text-light">
                                <small>Forgot password?</small>
                            </a>
                        </div>
                        <div class="col-6 text-right">
                            <a href="#" class="text-light">
                                <small>Create new account</small>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>
<script>

    export default {
        methods: {
            submitLogin: function () {
                console.log(this);
                let v_instance = this;
                this.axios.post('/users/sign_in', {
                    user: {
                        email: this.$refs.userEmail.value,
                        password: this.$refs.userPassword.value,
                        remember_me: this.$refs.rememberUser.model ? 1: 0,
                    }
                }).then(function (response) {
                    console.log(response);
                    v_instance.$store.dispatch('signedIn', [response.headers.authorization, response.data.id])
                });

            }
        }
    };
</script>
<style>
</style>
