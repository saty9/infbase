<template>
  <div>
    <div class="position-relative">
      <section class="section-shaped my-0">
          <div class="shape shape-style-3 shape-default shape-skew">
              <span></span>
              <span></span>
              <span></span>
              <span></span>
              <span></span>
              <span></span>
              <span></span>
              <span></span>
              <span></span>
          </div>
          <div class="container shape-container d-flex">
              <div class="col px-0">
                  <div class="row">
                      <div class="col-lg-6">
                          <h1 class="display-3  text-white">InfBase
                              <span>A drop-in helpdesk for pre-honours Informatics students to get additional tutoring and support with their courses.</span>
                          </h1>
                          <p class="lead  text-white">In addition to supporting drop-in assistance, InfBase can be used as a place to work together with other students, with support from an InfBase tutor.</p>
                      </div>
                  </div>
              </div>
          </div>
      </section>
    </div>
    <section class="section section-lg pt-lg-0 mt--200">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="row row-grid">
                        <div class="col-lg-4">
                            <card class="border-0" hover shadow body-classes="py-5">
                                <div class="text-center">
                                  <icon name="ni ni-check-bold" type="primary" rounded class="mb-4">
                                  </icon>
                                  <h6 class="text-primary text-uppercase">Schedule</h6> 
                                </div>
                                <p class="description mt-3">Just drop in into one of the sessions, you don’t have to sign up in advance but committing regularly can help you pacing your course work.</p>
                                <base-button tag="a" href="#" type="primary" class="mt-4">
                                    Learn more
                                </base-button>
                            </card>
                        </div>
                        <div class="col-lg-4">
                            <card class="border-0" hover shadow body-classes="py-5">
                                <div class="text-center">
                                  <icon name="ni ni-istanbul" type="success" rounded class="mb-4">
                                  </icon>
                                  <h6 class="text-success text-uppercase">FAQ</h6> 
                                </div>
                                <p class="description mt-3">To help InfBase tutors answering your questions, please let them know in advance by posting a question.</p><br>
                                <base-button tag="a" href="#" type="success" class="mt-4">
                                    Learn more
                                </base-button>
                            </card>
                        </div>
                        <div class="col-lg-4">
                            <card class="border-0" hover shadow body-classes="py-5">
                                <div class="text-center">
                                  <icon name="ni ni-planet" type="warning" rounded class="mb-4">
                                  </icon>
                                  <h6 class="text-warning text-uppercase">Tutors</h6>
                                </div>
                                <p class="description mt-3">InfBase tutors are selected on the basis of expertise and coverage, offering support and advice on core pre-honours courses in Informatics.</p>
                                <base-button tag="a" href="#" type="warning" class="mt-4">
                                    Learn more
                                </base-button>
                            </card>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section section-lg">
      <div class="container">
          <div class="row justify-content-center text-center mb-lg">
            <div class="col-lg-8">
              <h2 class="display-3">Schedule</h2>
              <p class="lead text-muted">InfBase is in room 7.03 of Appleton tower</p>
            </div>
          </div>
        <schedule></schedule>
      </div>
    </section>


    <section class="section section-lg">
        <div class="container">
            <div class="row justify-content-center text-center mb-lg">
                <div class="col-lg-8">
                    <h2 class="display-3">The amazing Team</h2>
                    <p class="lead text-muted">According to the National Oceanic and Atmospheric Administration,
                        Ted, Scambos, NSIDClead scentist, puts the potentially record maximum.</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-lg-3 mb-5 mb-lg-0">
                    <div class="px-4">
                        <img v-lazy="'img/theme/team-1-800x800.jpg'"
                             class="rounded-circle img-center img-fluid shadow shadow-lg--hover"
                             style="width: 200px;">
                        <div class="pt-4 text-center">
                            <h5 class="title">
                                <span class="d-block mb-1">Ryan Tompson</span>
                                <small class="h6 text-muted">Web Developer</small>
                            </h5>
                            <div class="mt-3">
                                <base-button tag="a" href="#" type="warning" icon="fa fa-twitter" rounded
                                             icon-only></base-button>
                                <base-button tag="a" href="#" type="warning" icon="fa fa-facebook" rounded
                                             icon-only></base-button>
                                <base-button tag="a" href="#" type="warning" icon="fa fa-dribbble" rounded
                                             icon-only></base-button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 mb-5 mb-lg-0">
                    <div class="px-4">
                        <img v-lazy="'img/theme/team-2-800x800.jpg'"
                             class="rounded-circle img-center img-fluid shadow shadow-lg--hover"
                             style="width: 200px;">
                        <div class="pt-4 text-center">
                            <h5 class="title">
                                <span class="d-block mb-1">Romina Hadid</span>
                                <small class="h6 text-muted">Marketing Strategist</small>
                            </h5>
                            <div class="mt-3">
                                <base-button tag="a" href="#" type="primary" icon="fa fa-twitter" rounded
                                             icon-only></base-button>
                                <base-button tag="a" href="#" type="primary" icon="fa fa-facebook" rounded
                                             icon-only></base-button>
                                <base-button tag="a" href="#" type="primary" icon="fa fa-dribbble" rounded
                                             icon-only></base-button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 mb-5 mb-lg-0">
                    <div class="px-4">
                        <img v-lazy="'img/theme/team-3-800x800.jpg'"
                             class="rounded-circle img-center img-fluid shadow shadow-lg--hover"
                             style="width: 200px;">
                        <div class="pt-4 text-center">
                            <h5 class="title">
                                <span class="d-block mb-1">Alexander Smith</span>
                                <small class="h6 text-muted">UI/UX Designer</small>
                            </h5>
                            <div class="mt-3">
                                <base-button tag="a" href="#" type="info" icon="fa fa-twitter" rounded
                                             icon-only></base-button>
                                <base-button tag="a" href="#" type="info" icon="fa fa-facebook" rounded
                                             icon-only></base-button>
                                <base-button tag="a" href="#" type="info" icon="fa fa-dribbble" rounded
                                             icon-only></base-button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 mb-5 mb-lg-0">
                    <div class="px-4">
                        <img v-lazy="'img/theme/team-4-800x800.jpg'"
                             class="rounded-circle img-center img-fluid shadow shadow-lg--hover"
                             style="width: 200px;">
                        <div class="pt-4 text-center">
                            <h5 class="title">
                                <span class="d-block mb-1">John Doe</span>
                                <small class="h6 text-muted">Founder and CEO</small>
                            </h5>
                            <div class="mt-3">
                                <base-button tag="a" href="#" type="success" icon="fa fa-twitter" rounded
                                             icon-only></base-button>
                                <base-button tag="a" href="#" type="success" icon="fa fa-facebook" rounded
                                             icon-only></base-button>
                                <base-button tag="a" href="#" type="success" icon="fa fa-dribbble" rounded
                                             icon-only></base-button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
  </div>
</template>

<script>
  import Schedule from './components/Schedule';
  export default {
    name: "home",
    components: {Schedule}
  };
</script>
