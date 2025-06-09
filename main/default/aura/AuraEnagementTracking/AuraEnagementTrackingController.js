({
	 doInit : function(component, event, helper) {
        var recordId = component.get("v.recordId");
        var vfPageUrl = "/apex/EngamentTracking?id=" + recordId;
        component.set("v.vfHost", vfPageUrl);
    }
})