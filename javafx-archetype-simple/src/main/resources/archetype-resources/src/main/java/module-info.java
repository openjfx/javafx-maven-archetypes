#if ("8" == ${javafx-version} || "1.8" == ${javafx-version})
/* doesn't work with source level ${javafx-version}:
#end
module $package {
    requires javafx.controls;
    exports $package;
}
#if ("8" == ${javafx-version} || "1.8" == ${javafx-version})
*/
#end
