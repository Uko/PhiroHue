initialization
initializeManagers
	"auto generated from HueResource class>>#reinstallResourceAccessors"
	managers := IdentityDictionary new.
	managers
		at: #sensors put: (HueResourceManager
			bridge: self resourceClass: HueSensor);
		at: #groups put: (HueResourceManager
			bridge: self resourceClass: HueGroup);
		at: #scenes put: (HueResourceManager
			bridge: self resourceClass: HueScene);
		at: #rules put: (HueResourceManager
			bridge: self resourceClass: HueRule);
		at: #lights put: (HueResourceManager
			bridge: self resourceClass: HueLight)