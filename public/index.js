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
      claimed_by: "",
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
          console.log(response);
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          if (response.data.admin === 3) {
            router.push("/shifts/shift"); 
          }
          else {
            router.push("/"); 
          }
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

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      shifts: [],
      users: [],
      user: {},
      errors: []
    };
  },
  created: function() { 
    axios.get("/v1/shifts").then(function(response) {
      this.shifts = response.data;
      console.log(response.data);
    }.bind(this)); 
    axios.get("/v1/users").then(function(response) {
      this.users = response.data;
      console.log(response.data);
    }.bind(this));
    axios.get("/v1/users/user").then(function(response) {
      this.user = response.data;
      console.log(response.data);
    }.bind(this));
  },

  methods: {
    pickUpShift: function(shift) {
      axios.patch("/v1/shifts/" + shift.id).then(function(response) {
      }).catch(function(error) {
        this.errors = error.response.data.errors;
      }.bind(this));
      console.log(shift);
    },
    removeShift: function(index) {
      this.shifts.splice(index, 1);
    },
    approveShift: function(shift) {
      axios.patch("/v1/shifts/" + shift.id).then(function(response) {  
        router.push("/shifts/shift");
      }).catch(function(error) {
        this.errors = error.response.data.errors;
      }.bind(this));
      console.log(shift);
    },
    hideShift: function(index) {
      this.shifts.splice(index, 1);
    },
  },
  computed: {}
};


var UserPage = {
  template: "#user-page",
  data: function() {
    return {
      users: [],
      // user: {},
      errors: []
    };
  },
  created: function() { 
    axios.get("/v1/users").then(function(response) {
      this.users = response.data;
      console.log(response.data);
    }.bind(this)); 
  },
  methods: {},
  computed: {}
};

var UserInfoPage = {
  template: "#user-info-page",
  data: function() {
    return {
      user: {},
      errors: []
    };
  },
  created: function() { 
    axios.get("/v1/users/user").then(function(response) {
      this.user = response.data;
      console.log(response.data);
    }.bind(this)); 
  },
  methods: {},
  computed: {}
};

var BuildingInfoPage = {
  template: "#building-info-page",
  data: function() {
    return {
      buildings: [],
      errors: []
    };
  },
  created: function() { 
    axios.get("/v1/buildings/info").then(function(response) {
      this.buildings = response.data;
      console.log(response.data);
    }.bind(this)); 
  },
  methods: {},
  computed: {}
};

var ShowShiftPage = {
  template: "#show-shift-page",
  data: function() {
    return {
      shifts: []
    };
  },
  created: function() {
    console.log('in show shift');
    axios.get("/v1/shifts/shift").then(function(response) {
      this.shifts = response.data;
    }.bind(this));
  },
  methods: {
    approveShift: function(shift) {
      axios.patch("/v1/shifts/" + shift.id).then(function(response) {  
        router.push("/shifts/shift");
      }).catch(function(error) {
        this.errors = error.response.data.errors;
      }.bind(this));
      console.log(shift);
    },
    removeShift: function(index) {
      this.shifts.splice(index, 1);
    },

    editShift: function(shift) {
      router.push("/shifts/shift/edit");
    },
  },
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
      axios.patch("/v1/shifts/shift/edit", params).then(function(response) {
        router.push("/");
      }).catch(function(error) {
        this.errors = error.response.data.errors;
      }.bind(this));
    }
  },
  created: function() {
    console.log('running created');
    axios.get("/v1/shifts/shift/edit").then(function(response) {
      this.shifts = response.data;
    }.bind(this));
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
    { path: "/", component:HomePage},
    { path: "/users", component: UserPage},
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },
    { path: "/shifts/new", component: NewShiftPage },
    { path: "/shifts/shift", component: ShowShiftPage},
    { path: "/shifts/shift/edit", component: EditShiftPage },
    { path: "/buildings/info" , component: BuildingInfoPage},
    { path: "/users/user", component:HomePage},
    { path: "/users/user", component:UserInfoPage} 
        
    
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
  },
  
});