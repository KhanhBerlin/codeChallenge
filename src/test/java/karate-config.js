function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log("karate.env system property was:", env);
  if (!env) {
    env = "dev";
  }

  var chromeOptions = [
          '--incognito',
          '--remote-allow-origins=*',
          //'-kiosk',
          //'--windows-size=1024,768',
          '--headless=new',
    ]

  var config = {
    chromeConfig: {
        type: 'chrome',
        addOptions: chromeOptions,
        showProcessLog: true,
        showDriverLog: true,
        showBrowserLog: true,
      },
    env: env,
    myVarName: "someValue",
  };
  if (env == "dev") {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == "e2e") {
    // customize
  }
  return config;
}
