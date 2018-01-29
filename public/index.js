/* global Vue, VueRouter, axios */

var NewShiftPage = {
  template: "#new-shift-page",
  data: function() {
    return {
      fullTimeEmployeeId: "",
      dayOfTheWeek: "",
      date: "",
      startTime: "",
      endTime: "",
      position: "",
      buildingId: "",
      approvedDenied: "",
      errors: []
    };
  },
  created: function() {
    console.log('in new shift');
  },
  methods: {
    addShift: function() {
      var params = {
        full_time_employee_id: this.fullTimeEmployeeId,
        day_of_the_week: this.dayOfTheWeek,
        date: this.date,
        start_time: this.startTime,
        end_time: this.endTime,
        position: this.position,
        building_id: this.buildingId,
        approved_denied: this.approvedDenied
      };
      console.log(params);
      axios.post("/v1/shifts/", params).then(function(response) {
        router.push("/");
      }).catch(function(error) {
        this.errors = error.response.data.errors;
      }.bind(this)
      );
    }
  }
};

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      shifts: [],
      errors: []
    };
  },
  created: function() { 
    axios.get('/v1/shifts').then(function(response) {
      this.shifts = response.data;
    }.bind(this)); 
  },
  methods: {
    pickUpShift: function(shift) {
      axios.patch("/v1/shifts/" + shift.id).then(function(response) {
        router.push("/");
      }).catch(function(error) {
        this.errors = error.response.data.errors;
      }.bind(this));
      console.log(shift);
    },
  },
  computed: {}
};

var ShowShiftPage = {
  template: "#show-shift-page",
  data: function() {
    return {
      shift: {}
    };
  },
  created: function() {
    console.log('in show shift');
    axios.get("/v1/shifts/" + this.$route.params.id).then(function(response) {
      this.recipe = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/v1/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var EditShiftPage = {
  template: "#edit-shift-page",
  data: function() {
    return {
      shift: {},
      errors: []
    };
  },
  methods: {
    editShift: function() {
      var params = {
        full_time_employee_id: this.shift.fullTimeEmployeeId,
        day_of_the_week: this.shift.dayOfTheWeek,
        date: this.shift.date,
        start_time: this.shift.startTime,
        end_time: this.shift.endTime,
        position: this.shift.position,
        building_id: this.shift.buildingId,
        approved_denied: this.shift.approvedDenied,
        approved_at: this.shift.approvedAt
      };
      console.log(params);
      axios.patch("/v1/shifts/" + this.$route.params.id, params).then(function(response) {
        router.push("/");
      }).catch(function(error) {
        this.errors = error.response.data.errors;
      }.bind(this));
    }
  },
  created: function() {
    console.log('running created');
    axios.get("/v1/shifts/" + this.$route.params.id).then(function(response) {
      this.shift = response.data;
    }.bind(this));
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};


var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },
    { path: "/shifts/new", component: NewShiftPage },
    { path: "/shifts/id", component: ShowShiftPage},
    { path: "/shifts/:id/edit", component: EditShiftPage }
        
    
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});