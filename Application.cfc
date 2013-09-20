component extends="coldbox.system.Coldbox" {

	// Application properties
	this.name = "toysforshots";
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0,0,90,0);
	this.setClientCookies = true;

	// ColdBox Specifics
	COLDBOX_APP_ROOT_PATH = getDirectoryFromPath(getCurrentTemplatePath());
	COLDBOX_APP_MAPPING = "";
	COLDBOX_CONFIG_FILE = "";
	COLDBOX_APP_KEY = "";

	// MAC 
	this.mappings["/toysforshots"] = "/Users/vega/www/toysforshots";
	this.mappings["/cfformprotect"] = "/Users/vega/www/toysforshots/cfc/com/cfformprotect";
	this.mappings["/hyrule"] = "/Users/vega/www/hyrule";
	this.mappings["/hoth"] = "/Users/vega/www/toysforshots/cfc/com/hoth";

	// WINDOWS 
	/*
	this.mappings["/toysforshots"] = "c:\www\toysforshots";
	this.mappings["/cfformprotect"] = "c:\www\toysforshots\cfc\com\cfformprotect";
	this.mappings["/hyrule"] = "c:\www\hyrule";
	this.mappings["/hoth"] = "c:\www\toysforshots\cfc\com/hoth";
	*/

	// ORM SETTINGS
	this.ormEnabled = true;
	this.datasource = "toysforshots";
	this.ormSettings = {
		dbcreate = "none",
		eventhandling = true,
		flushAtRequestEnd = false,
		cfclocation = ['/toysforshots'],
		logsql = true,
		useDBForMapping = false,
		secondaryCacheEnabled = false,
		sqlscript="config/install.sql"
	};

	public boolean function onApplicationStart() {
		loadColdBox();
		return true;
	}

	public boolean function onRequestStart(String targetPage){

		// Reload Checks
		reloadChecks();

		//ORM Reload
		if( structKeyExists(URL,"ORMReload") ){
			ORMReload();
		}

		//Process a ColdBox request only
		if( findNoCase('index.cfm',listLast(arguments.targetPage,"/")) ){
			processColdBoxRequest();
		}

		return true;
	}

}