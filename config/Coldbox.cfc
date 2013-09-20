component {

	function configure(){

		// coldbox directives
		coldbox = {
			//Application Setup
			appName 				= "toysforshots",

			//Development Settings
			debugMode				= true,
			debugPassword			= "",
			reinitPassword			= "",
			handlersIndexAutoReload = true,
			configAutoReload		= false,

			//Implicit Events
			defaultEvent			= "main.index",
			requestStartHandler		= "main.onRequestStart",
			requestEndHandler		= "main.onRequestEnd",
			applicationStartHandler = "Main.onApplicationStart",
			applicationEndHandler	= "Main.onApplicationEnd",
			sessionStartHandler 	= "Main.onSessionStart",
			sessionEndHandler		= "Main.onSessionEnd",
			missingTemplateHandler	= "Main.pageNotFound",

			//Error/Exception Handling
			exceptionHandler		= "main.onException",
			onInvalidEvent			= "main.onInvalidEvent",
			customErrorTemplate		= "",

			//Application Aspects
			handlerCaching 			= false,
			eventCaching			= false
		};

		// global settings - if you wanted to you could move these to environment specific settings
		settings = {
			validator="annotation",
			rbPath="/toysforshots/includes/i18n",
			twitter_username = "toysforshots",
			proxy = {},
			baseurl = ""
		};

		// environment settings, create a detectEnvironment() method to detect it yourself.
		// create a function with the name of the environment so it can be executed if that environment is detected
		// the value of the environment is a list of regex patterns to match the cgi.http_host.
		environments = {
			//development = "^cf8.,^railo."
			development = "toysforshots.dev",
			production = "^www."
		};

		//LogBox DSL
		logBox = {
			// Define Appenders
			appenders = {
				coldboxTracer = { class="coldbox.system.logging.appenders.ColdboxTracerAppender" },
				toysforshots = {
					class="coldbox.system.logging.appenders.AsyncRollingFileAppender",
					properties={
						filePath=expandPath("/logs"),autoExpand=false,fileMaxArchives=0,fileMaxSize=3000
					}
				}
			},

			// Root Logger
			root = { levelmax="WARN", appenders="*" }
		};

		// Module Directives
		modules = {
			//Turn to false in production
			autoReload = false,
			// An array of modules names to load, empty means all of them
			include = [],
			// An array of modules names to NOT load, empty means none
			exclude = []
		};

		//WireBox Integration
		wireBox = {
			enabled = true,
			//binder="config.WireBox",
			singletonReload=true
		};


		//Layout Settings
		layoutSettings = {
			defaultLayout = "Layout.Main.cfm"
		};

		//Register interceptors as an array, we need order
		interceptors = [
			 //Autowire
			 {class="coldbox.system.interceptors.Autowire"},
			 //SES
			 {class="coldbox.system.interceptors.SES"}
		];

	}

	public void function development() {
      settings.ga_account = "UA-11293197-1";
      settings.baseurl = "http://toysforshots.dev";
	}

	public void function production() {
      settings.ga_account = "UA-11293197-1";
      settings.baseurl = "http://www.toysforshots.com";
      coldbox.debugMode = false;
      coldbox.debugPassword = "tfsrocks";
      coldbox.handlersIndexAutoReload = false;
	}

}