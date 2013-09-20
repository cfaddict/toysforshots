<!--- All methods in this helper will be available in all handlers,plugins,views & layouts --->

<!--- from blogcfc so I could include recent comments & entries on home page --->
<cffunction name="replaceLinks" access="public" output="yes" returntype="string">
    <cfargument name="input" required="Yes" type="string">
	<cfargument name="linkmax" type="numeric" required="false" default="50">
    <cfscript>
        var inputReturn = arguments.input;
        var pattern = "";
        var urlMatches = structNew();
        var inputCopy = arguments.input;
        var result = "";
        var rightStart = "";
        var rightInputCopyLen = "";
        var targetNameMax = "";
        var targetLinkName = "";
        var i = "";
        var match = "";
		
		pattern = "(((https?:|ftp:|gopher:)\/\/)|(www\.|ftp\.))[-[:alnum:]\?%,\.\/&##!;@:=\+~_]+[A-Za-z0-9\/]";
        
        while (len(inputCopy)) {
            result = refind(pattern,inputCopy,1,'true');
            if (result.pos[1]){
                match = mid(inputCopy,result.pos[1],result.len[1]);
                urlMatches[match] = "";
                rightStart = result.len[1] + result.pos[1];
                rightInputCopyLen = len(inputCopy)-rightStart;
                if (rightInputCopyLen GT 0){
                    inputCopy = right(inputCopy,rightInputCopyLen);
                } else break;
            } else break;
        }
        
        //convert back to array
        urlMatches = structKeyArray(urlMatches);

        targetNameMax = arguments.linkmax;
        for (i=1; i LTE arraylen(urlMatches);i=i+1) {
            targetLinkName = urlMatches[i];
            if (len(targetLinkName) GTE targetNameMax) {
                targetLinkName = left(targetLinkName,targetNameMax) & "...";
            }
            inputReturn = replace(inputReturn,urlMatches[i],'<a href="#urlMatches[i]#" target="_blank">#targetLinkName#</a>',"all");
        }
    </cfscript>
    <cfreturn inputReturn>
</cffunction>